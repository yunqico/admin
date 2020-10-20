<?php

namespace app\wechat\command;

use app\wechat\service\FansService;
use app\wechat\service\WechatService;
use think\admin\Command;
use think\console\Input;
use think\console\Output;

/**
 * 微信粉丝管理指令
 * Class Fans
 * @package app\wechat\command
 */
class Fans extends Command
{
    /**
     * 需要处理的模块
     * @var array
     */
    protected $module = ['list', 'black', 'tags'];

    /**
     * 配置指令
     */
    protected function configure()
    {
        $this->setName('xadmin:fansall')->setDescription('Wechat Users Data Synchronize for ThinkAdmin');
    }

    /**
     * 执行指令
     * @param Input $input
     * @param Output $output
     * @throws \think\admin\Exception
     */
    protected function execute(Input $input, Output $output)
    {
        $message = '';
        foreach ($this->module as $m) {
            if (method_exists($this, $method = "_{$m}")) {
                $message .= $this->$method();
            }
        }
        $this->queue->success($message);
    }

    /**
     * 同步微信粉丝列表
     * @param string $next
     * @param integer $done
     * @return string
     * @throws \WeChat\Exceptions\InvalidResponseException
     * @throws \WeChat\Exceptions\LocalCacheException
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    protected function _list($next = '', $done = 0)
    {
        $appid = WechatService::instance()->getAppid();
        $this->output->comment('开始获取微信用户数据');
        while (is_string($next)) {
            $result = WechatService::WeChatUser()->getUserList($next);
            if (is_array($result) && !empty($result['data']['openid'])) {
                $total = intval($result['total']);
                foreach (array_chunk($result['data']['openid'], 100) as $openids) {
                    $list = WechatService::WeChatUser()->getBatchUserInfo($openids);
                    if (is_array($list) && !empty($list['user_info_list'])) {
                        foreach ($list['user_info_list'] as $user) {
                            $this->queue->message($total, ++$done, "-> {$user['openid']} {$user['nickname']}");
                            FansService::instance()->set($user, $appid);
                        }
                    }
                }
                $next = $total > $done ? $result['next_openid'] : null;
            } else {
                $next = null;
            }
        }
        if ($done > 0) {
            $this->output->comment('微信用户数据获取完成');
        } else {
            $this->output->comment('未获取到微信用户数据');
        }
        $this->output->newLine();
        return "共获取{$done}个用户数据";
    }

    /**
     * 同步粉丝黑名单列表
     * @param string $next
     * @param integer $done
     * @return string
     * @throws \WeChat\Exceptions\InvalidResponseException
     * @throws \WeChat\Exceptions\LocalCacheException
     * @throws \think\db\exception\DbException
     */
    public function _black($next = '', $done = 0)
    {
        $wechat = WechatService::WeChatUser();
        $this->output->comment('开始更新黑名单的微信用户');
        while (!is_null($next) && is_array($result = $wechat->getBlackList($next)) && !empty($result['data']['openid'])) {
            $done += $result['count'];
            foreach (array_chunk($result['data']['openid'], 100) as $chunk) {
                $this->app->db->name('WechatFans')->where(['is_black' => '0'])->whereIn('openid', $chunk)->update(['is_black' => '1']);
            }
            $this->setQueueProgress("--> 共计同步微信黑名单{$result['total']}人");
            $next = $result['total'] > $done ? $result['next_openid'] : null;
        }
        if ($done > 0) {
            $this->output->comment('黑名单的微信用户更新成功');
        } else {
            $this->output->comment('未获取到黑名单微信用户哦');
        }
        $this->output->newLine();
        if (empty($result['total'])) {
            return '，其中黑名单0人';
        } else {
            return "，其中黑名单{$result['total']}人";
        }
    }

    /**
     * 同步粉丝标签列表
     * @param integer $done
     * @return string
     * @throws \WeChat\Exceptions\InvalidResponseException
     * @throws \WeChat\Exceptions\LocalCacheException
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function _tags($done = 0)
    {
        $appid = WechatService::instance()->getAppid();
        $this->output->comment('开始获取微信用户标签数据');
        if (is_array($list = WechatService::WeChatTags()->getTags()) && !empty($list['tags'])) {
            $count = count($list['tags']);
            foreach ($list['tags'] as &$tag) {
                $tag['appid'] = $appid;
                $this->queue->message($count, ++$done, "-> {$tag['name']}");
            }
            $this->app->db->name('WechatFansTags')->where(['appid' => $appid])->delete();
            $this->app->db->name('WechatFansTags')->insertAll($list['tags']);
        }
        if ($done > 0) {
            $this->output->comment('微信用户标签数据获取完成');
        } else {
            $this->output->comment('未获取到微信用户标签数据');
        }
        $this->output->newLine();
        return "，获取到{$done}个标签。";
    }

}