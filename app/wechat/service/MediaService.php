<?php

namespace app\wechat\service;

use think\admin\Service;
use think\admin\Storage;
use WeChat\Contracts\MyCurlFile;

/**
 * 微信素材管理
 * Class MediaService
 * @package app\wechat\service
 */
class MediaService extends Service
{
    /**
     * 通过图文ID读取图文信息
     * @param integer $id 本地图文ID
     * @param array $where 额外的查询条件
     * @return array
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function news($id, $where = [])
    {
        // 文章主体数据
        $data = $this->app->db->name('WechatNews')->where(['id' => $id])->where($where)->find();
        if (empty($data)) return [];
        [$data['articles'], $articleIds] = [[], explode(',', $data['article_id'])];
        if (empty($data['article_id']) || empty($articleIds)) return $data;
        // 文章列表组合
        $query = $this->app->db->name('WechatNewsArticle')->whereIn('id', $articleIds)->orderField('id', $articleIds);
        $data['articles'] = $query->withoutField('create_by,create_at')->select()->toArray();
        return $data;
    }

    /**
     * 上传图片永久素材
     * @param string $url 文件地址
     * @param string $type 文件类型
     * @param array $video 视频信息
     * @return string media_id
     * @throws \WeChat\Exceptions\InvalidResponseException
     * @throws \WeChat\Exceptions\LocalCacheException
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\DbException
     * @throws \think\db\exception\ModelNotFoundException
     */
    public function upload($url, $type = 'image', $video = [])
    {
        $map = ['md5' => md5($url), 'appid' => WechatService::instance()->getAppid()];
        if (($mediaId = $this->app->db->name('WechatMedia')->where($map)->value('media_id'))) return $mediaId;
        $result = WechatService::WeChatMedia()->addMaterial(self::_buildCurlFile($url), $type, $video);
        data_save('WechatMedia', [
            'local_url' => $url, 'md5' => $map['md5'], 'type' => $type, 'appid' => $map['appid'],
            'media_url' => $result['url'] ?? '', 'media_id' => $result['media_id'],
        ], 'type', $map);
        return $result['media_id'];
    }

    /**
     * 创建 CURL 文件对象
     * @param string $local 文件路径或网络地址
     * @return string
     * @throws \WeChat\Exceptions\LocalCacheException
     */
    private function _buildCurlFile($local)
    {
        if (file_exists($local)) {
            return new MyCurlFile($local);
        } else {
            return new MyCurlFile(Storage::down($local)['file']);
        }
    }
}
