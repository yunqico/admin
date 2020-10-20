-- phpMyAdmin SQL Dump
-- version 4.9.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 20, 2020 at 11:13 AM
-- Server version: 5.7.26
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `yunenv`
--

-- --------------------------------------------------------

--
-- Table structure for table `system_auth`
--

CREATE TABLE `system_auth` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(100) DEFAULT '' COMMENT '权限名称',
  `desc` varchar(500) DEFAULT '' COMMENT '备注说明',
  `sort` bigint(20) UNSIGNED DEFAULT '0' COMMENT '排序权重',
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '权限状态(1使用,0禁用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-权限';

-- --------------------------------------------------------

--
-- Table structure for table `system_auth_node`
--

CREATE TABLE `system_auth_node` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `auth` bigint(20) UNSIGNED DEFAULT '0' COMMENT '角色',
  `node` varchar(200) DEFAULT '' COMMENT '节点'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-授权';

-- --------------------------------------------------------

--
-- Table structure for table `system_config`
--

CREATE TABLE `system_config` (
  `type` varchar(20) DEFAULT '' COMMENT '分类',
  `name` varchar(100) DEFAULT '' COMMENT '配置名',
  `value` varchar(2048) DEFAULT '' COMMENT '配置值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-配置';

--
-- Dumping data for table `system_config`
--

INSERT INTO `system_config` (`type`, `name`, `value`) VALUES
('base', 'app_name', 'YunAdmin'),
('base', 'app_version', 'v6.0'),
('base', 'miitbeian', '粤ICP备16006642号-2'),
('base', 'site_copy', '©版权所有 2019-2020 云企网络'),
('base', 'site_icon', '/upload/69/62c5949fe80d3e3eebcd209b396442.png'),
('base', 'site_name', 'YunAdmin'),
('storage', 'alioss_access_key', ''),
('storage', 'alioss_bucket', ''),
('storage', 'alioss_http_domain', ''),
('storage', 'alioss_http_protocol', 'http'),
('storage', 'alioss_point', 'oss-cn-hangzhou.aliyuncs.com'),
('storage', 'alioss_secret_key', ''),
('storage', 'allow_exts', 'doc,gif,icon,jpg,mp3,mp4,p12,pem,png,rar,xls,xlsx'),
('storage', 'link_type', 'none'),
('storage', 'qiniu_access_key', ''),
('storage', 'qiniu_bucket', ''),
('storage', 'qiniu_http_domain', ''),
('storage', 'qiniu_http_protocol', 'http'),
('storage', 'qiniu_region', '华东'),
('storage', 'qiniu_secret_key', ''),
('storage', 'txcos_http_protocol', 'http'),
('storage', 'type', 'local'),
('wechat', 'appid', ''),
('wechat', 'appsecret', ''),
('wechat', 'encodingaeskey', ''),
('wechat', 'mch_id', ''),
('wechat', 'mch_key', ''),
('wechat', 'mch_ssl_cer', ''),
('wechat', 'mch_ssl_key', ''),
('wechat', 'mch_ssl_p12', ''),
('wechat', 'mch_ssl_type', 'pem'),
('wechat', 'thr_appid', ''),
('wechat', 'thr_appkey', ''),
('wechat', 'token', ''),
('wechat', 'type', 'api'),
('base', 'xpath', 'admin'),
('base', 'beian', ''),
('storage', 'local_http_protocol', 'path'),
('storage', 'local_http_domain', '');

-- --------------------------------------------------------

--
-- Table structure for table `system_data`
--

CREATE TABLE `system_data` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `name` varchar(100) DEFAULT '' COMMENT '配置名',
  `value` longtext COMMENT '配置值'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-数据';

-- --------------------------------------------------------

--
-- Table structure for table `system_menu`
--

CREATE TABLE `system_menu` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pid` bigint(20) UNSIGNED DEFAULT '0' COMMENT '上级ID',
  `title` varchar(100) DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `node` varchar(100) DEFAULT '' COMMENT '节点代码',
  `url` varchar(400) DEFAULT '' COMMENT '链接节点',
  `params` varchar(500) DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) DEFAULT '_self' COMMENT '打开方式',
  `sort` int(11) UNSIGNED DEFAULT '0' COMMENT '排序权重',
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-菜单';

--
-- Dumping data for table `system_menu`
--

INSERT INTO `system_menu` (`id`, `pid`, `title`, `icon`, `node`, `url`, `params`, `target`, `sort`, `status`, `create_at`) VALUES
(2, 0, '系统管理', 'layui-icon layui-icon-set', '', '#', '', '_self', 100, 1, '2018-09-05 10:04:52'),
(3, 4, '系统菜单管理', 'layui-icon layui-icon-layouts', '', 'admin/menu/index', '', '_self', 1, 1, '2018-09-05 10:05:26'),
(4, 2, '系统配置', '', '', '#', '', '_self', 20, 1, '2018-09-05 10:07:17'),
(5, 12, '系统用户管理', 'layui-icon layui-icon-username', '', 'admin/user/index', '', '_self', 1, 1, '2018-09-06 03:10:42'),
(7, 12, '访问权限管理', 'layui-icon layui-icon-vercode', '', 'admin/auth/index', '', '_self', 2, 1, '2018-09-06 07:17:14'),
(11, 4, '系统参数配置', 'layui-icon layui-icon-set', '', 'admin/config/index', '', '_self', 4, 1, '2018-09-06 08:43:47'),
(12, 2, '权限管理', '', '', '#', '', '_self', 10, 1, '2018-09-06 10:01:31'),
(27, 4, '系统任务管理', 'layui-icon layui-icon-log', '', 'admin/queue/index', '', '_self', 3, 1, '2018-11-29 03:13:34'),
(49, 4, '系统日志管理', 'layui-icon layui-icon-form', '', 'admin/oplog/index', '', '_self', 2, 1, '2019-02-18 04:56:56'),
(56, 0, '微信管理', 'layui-icon layui-icon-cellphone', '', '#', '', '_self', 200, 1, '2019-12-09 03:00:37'),
(57, 56, '微信管理', '', '', '#', '', '_self', 0, 1, '2019-12-09 05:56:58'),
(58, 57, '微信接口配置', 'layui-icon layui-icon-set', '', 'wechat/config/options', '', '_self', 0, 1, '2019-12-09 05:57:28'),
(59, 57, '微信支付配置', 'layui-icon layui-icon-rmb', '', 'wechat/config/payment', '', '_self', 0, 1, '2019-12-09 05:58:42'),
(60, 56, '微信定制', '', '', '#', '', '_self', 0, 1, '2019-12-09 10:35:16'),
(61, 60, '微信粉丝管理', 'layui-icon layui-icon-username', '', 'wechat/fans/index', '', '_self', 0, 1, '2019-12-09 10:35:37'),
(62, 60, '微信图文管理', 'layui-icon layui-icon-template-1', '', 'wechat/news/index', '', '_self', 0, 1, '2019-12-09 10:43:51'),
(63, 60, '微信菜单配置', 'layui-icon layui-icon-cellphone', '', 'wechat/menu/index', '', '_self', 0, 1, '2019-12-09 14:49:28'),
(64, 60, '回复规则管理', 'layui-icon layui-icon-engine', '', 'wechat/keys/index', '', '_self', 0, 1, '2019-12-14 06:09:04'),
(65, 60, '关注回复配置', 'layui-icon layui-icon-senior', '', 'wechat/keys/subscribe', '', '_self', 0, 1, '2019-12-14 06:10:31'),
(66, 60, '默认回复配置', 'layui-icon layui-icon-util', '', 'wechat/keys/defaults', '', '_self', 0, 1, '2019-12-14 06:11:18'),
(67, 0, '首页', 'layui-icon layui-icon-home', 'admin/index/welcome', 'admin/index/welcome', '', '_self', 300, 1, '2020-10-20 09:31:08');

-- --------------------------------------------------------

--
-- Table structure for table `system_oplog`
--

CREATE TABLE `system_oplog` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `node` varchar(200) NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-日志';

--
-- Dumping data for table `system_oplog`
--

INSERT INTO `system_oplog` (`id`, `node`, `geoip`, `action`, `content`, `username`, `create_at`) VALUES
(1, 'admin/login/index', '127.0.0.1', '用户登录', '登录系统后台成功', 'admin', '2020-10-20 08:12:52'),
(2, 'admin/login/index', '127.0.0.1', '用户登录', '登录系统后台成功', 'admin', '2020-10-20 08:21:03'),
(3, 'admin/login/index', '127.0.0.1', '用户登录', '登录系统后台成功', 'admin', '2020-10-20 10:34:01'),
(4, 'admin/login/index', '127.0.0.1', '用户登录', '登录系统后台成功', 'admin', '2020-10-20 10:36:09');

-- --------------------------------------------------------

--
-- Table structure for table `system_queue`
--

CREATE TABLE `system_queue` (
  `id` bigint(20) NOT NULL,
  `code` varchar(20) NOT NULL DEFAULT '' COMMENT '任务编号',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '任务名称',
  `command` varchar(500) DEFAULT '' COMMENT '执行指令',
  `exec_pid` bigint(20) DEFAULT '0' COMMENT '执行进程',
  `exec_data` longtext COMMENT '执行参数',
  `exec_time` bigint(20) DEFAULT '0' COMMENT '执行时间',
  `exec_desc` varchar(500) DEFAULT '' COMMENT '执行描述',
  `enter_time` decimal(20,4) DEFAULT '0.0000' COMMENT '开始时间',
  `outer_time` decimal(20,4) DEFAULT '0.0000' COMMENT '结束时间',
  `loops_time` bigint(20) DEFAULT '0' COMMENT '循环时间',
  `attempts` bigint(20) DEFAULT '0' COMMENT '执行次数',
  `rscript` tinyint(1) DEFAULT '1' COMMENT '任务类型(0单例,1多例)',
  `status` tinyint(1) DEFAULT '1' COMMENT '任务状态(1新任务,2处理中,3成功,4失败)',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-任务';

--
-- Dumping data for table `system_queue`
--

INSERT INTO `system_queue` (`id`, `code`, `title`, `command`, `exec_pid`, `exec_data`, `exec_time`, `exec_desc`, `enter_time`, `outer_time`, `loops_time`, `attempts`, `rscript`, `status`, `create_at`) VALUES
(1, 'Q202010203308918', '优化数据库所有数据表', 'xadmin:database optimize', 0, '[]', 1603181828, '', '0.0000', '0.0000', 0, 0, 0, 1, '2020-10-20 08:17:08');

-- --------------------------------------------------------

--
-- Table structure for table `system_user`
--

CREATE TABLE `system_user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(50) DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) DEFAULT '' COMMENT '用户密码',
  `nickname` varchar(50) DEFAULT '' COMMENT '用户昵称',
  `headimg` varchar(255) DEFAULT '' COMMENT '头像地址',
  `authorize` varchar(255) DEFAULT '' COMMENT '权限授权',
  `contact_qq` varchar(20) DEFAULT '' COMMENT '联系QQ',
  `contact_mail` varchar(20) DEFAULT '' COMMENT '联系邮箱',
  `contact_phone` varchar(20) DEFAULT '' COMMENT '联系手机',
  `login_ip` varchar(255) DEFAULT '' COMMENT '登录地址',
  `login_at` varchar(20) DEFAULT '' COMMENT '登录时间',
  `login_num` bigint(20) DEFAULT '0' COMMENT '登录次数',
  `describe` varchar(255) DEFAULT '' COMMENT '备注说明',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `sort` bigint(20) DEFAULT '0' COMMENT '排序权重',
  `is_deleted` tinyint(1) DEFAULT '0' COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='系统-用户';

--
-- Dumping data for table `system_user`
--

INSERT INTO `system_user` (`id`, `username`, `password`, `nickname`, `headimg`, `authorize`, `contact_qq`, `contact_mail`, `contact_phone`, `login_ip`, `login_at`, `login_num`, `describe`, `status`, `sort`, `is_deleted`, `create_at`) VALUES
(10000, 'admin', '21232f297a57a5a743894a0e4a801fc3', '系统管理员', '', '', '', '', '', '127.0.0.1', '2020-10-20 18:36:09', 1061, '', 1, 0, 0, '2015-11-13 07:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `wechat_fans`
--

CREATE TABLE `wechat_fans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appid` varchar(50) DEFAULT '' COMMENT '公众号APPID',
  `unionid` varchar(100) DEFAULT '' COMMENT '粉丝unionid',
  `openid` varchar(100) DEFAULT '' COMMENT '粉丝openid',
  `tagid_list` varchar(100) DEFAULT '' COMMENT '粉丝标签id',
  `is_black` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '是否为黑名单状态',
  `subscribe` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '关注状态(0未关注,1已关注)',
  `nickname` varchar(200) DEFAULT '' COMMENT '用户昵称',
  `sex` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '用户性别(1男性,2女性,0未知)',
  `country` varchar(50) DEFAULT '' COMMENT '用户所在国家',
  `province` varchar(50) DEFAULT '' COMMENT '用户所在省份',
  `city` varchar(50) DEFAULT '' COMMENT '用户所在城市',
  `language` varchar(50) DEFAULT '' COMMENT '用户的语言(zh_CN)',
  `headimgurl` varchar(500) DEFAULT '' COMMENT '用户头像',
  `subscribe_time` bigint(20) UNSIGNED DEFAULT '0' COMMENT '关注时间',
  `subscribe_at` datetime DEFAULT NULL COMMENT '关注时间',
  `remark` varchar(50) DEFAULT '' COMMENT '备注',
  `subscribe_scene` varchar(200) DEFAULT '' COMMENT '扫码关注场景',
  `qr_scene` varchar(100) DEFAULT '' COMMENT '二维码场景值',
  `qr_scene_str` varchar(200) DEFAULT '' COMMENT '二维码场景内容',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-粉丝';

-- --------------------------------------------------------

--
-- Table structure for table `wechat_fans_tags`
--

CREATE TABLE `wechat_fans_tags` (
  `id` bigint(20) UNSIGNED NOT NULL COMMENT '标签ID',
  `appid` varchar(50) DEFAULT '' COMMENT '公众号APPID',
  `name` varchar(35) DEFAULT NULL COMMENT '标签名称',
  `count` bigint(20) UNSIGNED DEFAULT '0' COMMENT '总数',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建日期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-标签';

-- --------------------------------------------------------

--
-- Table structure for table `wechat_keys`
--

CREATE TABLE `wechat_keys` (
  `id` bigint(20) NOT NULL,
  `appid` char(100) DEFAULT '' COMMENT '公众号APPID',
  `type` varchar(20) DEFAULT '' COMMENT '类型(text,image,news)',
  `keys` varchar(100) DEFAULT NULL COMMENT '关键字',
  `content` text COMMENT '文本内容',
  `image_url` varchar(255) DEFAULT '' COMMENT '图片链接',
  `voice_url` varchar(255) DEFAULT '' COMMENT '语音链接',
  `music_title` varchar(100) DEFAULT '' COMMENT '音乐标题',
  `music_url` varchar(255) DEFAULT '' COMMENT '音乐链接',
  `music_image` varchar(255) DEFAULT '' COMMENT '缩略图片',
  `music_desc` varchar(255) DEFAULT '' COMMENT '音乐描述',
  `video_title` varchar(100) DEFAULT '' COMMENT '视频标题',
  `video_url` varchar(255) DEFAULT '' COMMENT '视频URL',
  `video_desc` varchar(255) DEFAULT '' COMMENT '视频描述',
  `news_id` bigint(20) UNSIGNED DEFAULT NULL COMMENT '图文ID',
  `sort` bigint(20) UNSIGNED DEFAULT '0' COMMENT '排序字段',
  `status` tinyint(1) UNSIGNED DEFAULT '1' COMMENT '状态(0禁用,1启用)',
  `create_by` bigint(20) UNSIGNED DEFAULT '0' COMMENT '创建人',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-关键字';

-- --------------------------------------------------------

--
-- Table structure for table `wechat_media`
--

CREATE TABLE `wechat_media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `appid` varchar(100) DEFAULT '' COMMENT '公众号ID',
  `md5` varchar(32) DEFAULT '' COMMENT '文件md5',
  `type` varchar(20) DEFAULT '' COMMENT '媒体类型',
  `media_id` varchar(100) DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT '' COMMENT '本地文件链接',
  `media_url` varchar(300) DEFAULT '' COMMENT '远程图片链接',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-素材';

-- --------------------------------------------------------

--
-- Table structure for table `wechat_news`
--

CREATE TABLE `wechat_news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `media_id` varchar(100) DEFAULT '' COMMENT '永久素材MediaID',
  `local_url` varchar(300) DEFAULT '' COMMENT '永久素材外网URL',
  `article_id` varchar(60) DEFAULT '' COMMENT '关联图文ID(用英文逗号做分割)',
  `is_deleted` tinyint(1) UNSIGNED DEFAULT '0' COMMENT '删除状态(0未删除,1已删除)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `create_by` bigint(20) DEFAULT NULL COMMENT '创建人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-图文';

-- --------------------------------------------------------

--
-- Table structure for table `wechat_news_article`
--

CREATE TABLE `wechat_news_article` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(50) DEFAULT '' COMMENT '素材标题',
  `local_url` varchar(300) DEFAULT '' COMMENT '永久素材显示URL',
  `show_cover_pic` tinyint(4) UNSIGNED DEFAULT '0' COMMENT '显示封面(0不显示,1显示)',
  `author` varchar(20) DEFAULT '' COMMENT '文章作者',
  `digest` varchar(300) DEFAULT '' COMMENT '摘要内容',
  `content` longtext COMMENT '图文内容',
  `content_source_url` varchar(200) DEFAULT '' COMMENT '原文地址',
  `read_num` bigint(20) UNSIGNED DEFAULT '0' COMMENT '阅读数量',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='微信-文章';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `system_auth`
--
ALTER TABLE `system_auth`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_auth_title` (`title`) USING BTREE,
  ADD KEY `idx_system_auth_status` (`status`) USING BTREE;

--
-- Indexes for table `system_auth_node`
--
ALTER TABLE `system_auth_node`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_auth_auth` (`auth`) USING BTREE,
  ADD KEY `idx_system_auth_node` (`node`(191)) USING BTREE;

--
-- Indexes for table `system_config`
--
ALTER TABLE `system_config`
  ADD KEY `idx_system_config_type` (`type`) USING BTREE,
  ADD KEY `idx_system_config_name` (`name`) USING BTREE;

--
-- Indexes for table `system_data`
--
ALTER TABLE `system_data`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_data_name` (`name`) USING BTREE;

--
-- Indexes for table `system_menu`
--
ALTER TABLE `system_menu`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_menu_node` (`node`) USING BTREE,
  ADD KEY `idx_system_menu_status` (`status`) USING BTREE;

--
-- Indexes for table `system_oplog`
--
ALTER TABLE `system_oplog`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `system_queue`
--
ALTER TABLE `system_queue`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_queue_code` (`code`) USING BTREE,
  ADD KEY `idx_system_queue_title` (`title`) USING BTREE,
  ADD KEY `idx_system_queue_status` (`status`) USING BTREE,
  ADD KEY `idx_system_queue_rscript` (`rscript`) USING BTREE,
  ADD KEY `idx_system_queue_create_at` (`create_at`) USING BTREE,
  ADD KEY `idx_system_queue_exec_time` (`exec_time`) USING BTREE;

--
-- Indexes for table `system_user`
--
ALTER TABLE `system_user`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idx_system_user_username` (`username`) USING BTREE,
  ADD KEY `idx_system_user_deleted` (`is_deleted`) USING BTREE,
  ADD KEY `idx_system_user_status` (`status`) USING BTREE;

--
-- Indexes for table `wechat_fans`
--
ALTER TABLE `wechat_fans`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_wechat_fans_openid` (`openid`) USING BTREE,
  ADD KEY `index_wechat_fans_unionid` (`unionid`) USING BTREE,
  ADD KEY `index_wechat_fans_is_back` (`is_black`) USING BTREE,
  ADD KEY `index_wechat_fans_subscribe` (`subscribe`) USING BTREE;

--
-- Indexes for table `wechat_fans_tags`
--
ALTER TABLE `wechat_fans_tags`
  ADD KEY `index_wechat_fans_tags_id` (`id`) USING BTREE,
  ADD KEY `index_wechat_fans_tags_appid` (`appid`) USING BTREE;

--
-- Indexes for table `wechat_keys`
--
ALTER TABLE `wechat_keys`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_wechat_keys_appid` (`appid`) USING BTREE,
  ADD KEY `index_wechat_keys_type` (`type`) USING BTREE,
  ADD KEY `index_wechat_keys_keys` (`keys`) USING BTREE;

--
-- Indexes for table `wechat_media`
--
ALTER TABLE `wechat_media`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_wechat_media_appid` (`appid`) USING BTREE,
  ADD KEY `index_wechat_media_md5` (`md5`) USING BTREE,
  ADD KEY `index_wechat_media_type` (`type`) USING BTREE,
  ADD KEY `index_wechat_media_media_id` (`media_id`) USING BTREE;

--
-- Indexes for table `wechat_news`
--
ALTER TABLE `wechat_news`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `index_wechat_news_artcle_id` (`article_id`) USING BTREE,
  ADD KEY `index_wechat_news_media_id` (`media_id`) USING BTREE;

--
-- Indexes for table `wechat_news_article`
--
ALTER TABLE `wechat_news_article`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `system_auth`
--
ALTER TABLE `system_auth`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_auth_node`
--
ALTER TABLE `system_auth_node`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_data`
--
ALTER TABLE `system_data`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `system_menu`
--
ALTER TABLE `system_menu`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `system_oplog`
--
ALTER TABLE `system_oplog`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_queue`
--
ALTER TABLE `system_queue`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_user`
--
ALTER TABLE `system_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10001;

--
-- AUTO_INCREMENT for table `wechat_fans`
--
ALTER TABLE `wechat_fans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wechat_fans_tags`
--
ALTER TABLE `wechat_fans_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '标签ID';

--
-- AUTO_INCREMENT for table `wechat_keys`
--
ALTER TABLE `wechat_keys`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wechat_media`
--
ALTER TABLE `wechat_media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wechat_news`
--
ALTER TABLE `wechat_news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `wechat_news_article`
--
ALTER TABLE `wechat_news_article`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
