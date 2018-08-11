/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : bick

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-08-08 09:21:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bk_admin
-- ----------------------------
DROP TABLE IF EXISTS `bk_admin`;
CREATE TABLE `bk_admin` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(30) NOT NULL COMMENT '管理员名称',
  `password` char(32) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_admin
-- ----------------------------
INSERT INTO `bk_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for bk_arrt
-- ----------------------------
DROP TABLE IF EXISTS `bk_arrt`;
CREATE TABLE `bk_arrt` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `attr_name` varchar(30) DEFAULT NULL COMMENT '属性名称',
  `attr_type` tinyint(255) DEFAULT '1' COMMENT '属性类型1：单选属性2唯一属性',
  `attr_values` varchar(255) DEFAULT NULL COMMENT '属性值',
  `type_id` smallint(6) NOT NULL COMMENT '所属类型',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_arrt
-- ----------------------------

-- ----------------------------
-- Table structure for bk_article
-- ----------------------------
DROP TABLE IF EXISTS `bk_article`;
CREATE TABLE `bk_article` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(60) NOT NULL COMMENT '文章标题',
  `keywords` varchar(100) NOT NULL COMMENT '关键词',
  `desc` varchar(255) NOT NULL COMMENT '描述',
  `author` varchar(30) NOT NULL COMMENT '作者',
  `thumb` varchar(160) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `click` mediumint(9) NOT NULL DEFAULT '0' COMMENT '点击数',
  `zan` mediumint(9) NOT NULL DEFAULT '0' COMMENT '点赞数',
  `rec` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不推荐 1：推荐',
  `time` int(10) NOT NULL COMMENT '发布时间',
  `cateid` mediumint(9) NOT NULL COMMENT '所属栏目',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_article
-- ----------------------------
INSERT INTO `bk_article` VALUES ('6', '', '', '', '', '', '', '0', '0', '0', '0', '23');
INSERT INTO `bk_article` VALUES ('7', '1', '', '', '', '', '<p>1<br/></p>', '0', '0', '0', '0', '23');

-- ----------------------------
-- Table structure for bk_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `bk_auth_group`;
CREATE TABLE `bk_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_auth_group
-- ----------------------------
INSERT INTO `bk_auth_group` VALUES ('1', '超级管理员', '1', '15,16,19,18,17,1,9,11,14,13,12,2,3,20,10,4');
INSERT INTO `bk_auth_group` VALUES ('3', '链接专员', '1', '2,3,20,10,4');
INSERT INTO `bk_auth_group` VALUES ('4', '配置管理员', '1', '1,9,11,14,13,12');

-- ----------------------------
-- Table structure for bk_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `bk_auth_group_access`;
CREATE TABLE `bk_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_auth_group_access
-- ----------------------------
INSERT INTO `bk_auth_group_access` VALUES ('1', '1');
INSERT INTO `bk_auth_group_access` VALUES ('28', '3');
INSERT INTO `bk_auth_group_access` VALUES ('29', '4');
INSERT INTO `bk_auth_group_access` VALUES ('30', '3');
INSERT INTO `bk_auth_group_access` VALUES ('31', '1');
INSERT INTO `bk_auth_group_access` VALUES ('32', '1');
INSERT INTO `bk_auth_group_access` VALUES ('33', '1');
INSERT INTO `bk_auth_group_access` VALUES ('34', '1');
INSERT INTO `bk_auth_group_access` VALUES ('35', '1');
INSERT INTO `bk_auth_group_access` VALUES ('36', '1');
INSERT INTO `bk_auth_group_access` VALUES ('37', '1');

-- ----------------------------
-- Table structure for bk_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `bk_auth_rule`;
CREATE TABLE `bk_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `pid` mediumint(9) NOT NULL DEFAULT '0',
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `sort` int(5) NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_auth_rule
-- ----------------------------
INSERT INTO `bk_auth_rule` VALUES ('1', 'sys', '系统设置', '1', '1', '', '0', '0', '7');
INSERT INTO `bk_auth_rule` VALUES ('2', 'link', '友情链接', '1', '1', '', '0', '0', '4');
INSERT INTO `bk_auth_rule` VALUES ('3', 'link/lst', '链接列表', '1', '1', '', '2', '1', '5');
INSERT INTO `bk_auth_rule` VALUES ('4', 'link/del', '删除链接', '1', '1', '', '3', '2', '6');
INSERT INTO `bk_auth_rule` VALUES ('11', 'conf/lst', '配置列表', '1', '1', '', '1', '1', '50');
INSERT INTO `bk_auth_rule` VALUES ('10', 'link/add', '添加链接', '1', '1', '', '3', '2', '50');
INSERT INTO `bk_auth_rule` VALUES ('9', 'conf/conf', '配置项', '1', '1', '', '1', '1', '50');
INSERT INTO `bk_auth_rule` VALUES ('12', 'conf/add', '添加配置', '1', '1', '', '11', '2', '50');
INSERT INTO `bk_auth_rule` VALUES ('13', 'conf/del', '配置删除', '1', '1', '', '11', '2', '50');
INSERT INTO `bk_auth_rule` VALUES ('14', 'conf/edit', '配置编辑', '1', '1', '', '11', '2', '50');
INSERT INTO `bk_auth_rule` VALUES ('15', 'admin', '管理员', '1', '1', '', '0', '0', '50');
INSERT INTO `bk_auth_rule` VALUES ('16', 'admin/lst', '管理员列表', '1', '1', '', '15', '1', '50');
INSERT INTO `bk_auth_rule` VALUES ('17', 'admin/add', '管理员添加', '1', '1', '', '16', '2', '50');
INSERT INTO `bk_auth_rule` VALUES ('18', 'admin/del', '管理员删除', '1', '1', '', '16', '2', '50');
INSERT INTO `bk_auth_rule` VALUES ('19', 'admin/edit', '管理员修改', '1', '1', '', '16', '2', '50');
INSERT INTO `bk_auth_rule` VALUES ('20', 'link/edit', '修改链接', '1', '1', '', '3', '2', '50');

-- ----------------------------
-- Table structure for bk_cate
-- ----------------------------
DROP TABLE IF EXISTS `bk_cate`;
CREATE TABLE `bk_cate` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `catename` varchar(30) NOT NULL COMMENT '栏目名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '栏目类型：1:文章列表栏目 2:单页栏目3：图片列表',
  `keywords` varchar(255) NOT NULL COMMENT '栏目关键词',
  `desc` varchar(255) NOT NULL COMMENT '栏目描述',
  `content` text NOT NULL COMMENT '栏目内容',
  `rec_index` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不推荐 1：推荐',
  `rec_bottom` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0:不推荐 1：推荐',
  `pid` mediumint(9) NOT NULL DEFAULT '0' COMMENT '上级栏目id',
  `sort` mediumint(9) NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_cate
-- ----------------------------
INSERT INTO `bk_cate` VALUES ('38', '济南', '1', '111', '1121', '<p>21312</p>', '0', '0', '37', '50');
INSERT INTO `bk_cate` VALUES ('37', '山东总代', '1', '789797', '1234564', '<p>123</p>', '0', '0', '0', '50');

-- ----------------------------
-- Table structure for bk_category
-- ----------------------------
DROP TABLE IF EXISTS `bk_category`;
CREATE TABLE `bk_category` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT COMMENT '栏目id',
  `cate_name` varchar(30) NOT NULL COMMENT '商品分类名称',
  `pid` smallint(9) NOT NULL DEFAULT '0' COMMENT '上级栏目id',
  `sort` int(9) NOT NULL DEFAULT '50' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_category
-- ----------------------------
INSERT INTO `bk_category` VALUES ('43', '衣服', '0', '10');

-- ----------------------------
-- Table structure for bk_conf
-- ----------------------------
DROP TABLE IF EXISTS `bk_conf`;
CREATE TABLE `bk_conf` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '配置项id',
  `cnname` varchar(50) NOT NULL COMMENT '配置中文名称',
  `enname` varchar(50) NOT NULL COMMENT '英文名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配置类型 1：单行文本框 2：多行文本 3：单选按钮 4：复选按钮 5：下拉菜单',
  `value` varchar(255) NOT NULL COMMENT '配置值',
  `values` varchar(255) NOT NULL COMMENT '配置可选值',
  `sort` smallint(6) NOT NULL DEFAULT '50' COMMENT '配置项排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_conf
-- ----------------------------
INSERT INTO `bk_conf` VALUES ('1', '站点名称', 'sitename', '1', '自行车站点', '', '53');
INSERT INTO `bk_conf` VALUES ('2', '站点关键词', 'keywords', '1', '自行车', '', '52');
INSERT INTO `bk_conf` VALUES ('3', '站点描述', 'desc', '2', '                                                                                                                                                                                                                                                               ', '', '51');
INSERT INTO `bk_conf` VALUES ('6', '是否关闭网站', 'close', '3', '是', '是,否', '50');
INSERT INTO `bk_conf` VALUES ('7', '启动验证码', 'code', '4', '', '是', '50');
INSERT INTO `bk_conf` VALUES ('8', '自动清空缓存', 'cache', '5', '3个小时', '1个小时,2个小时,3个小时', '50');
INSERT INTO `bk_conf` VALUES ('9', '允许评论', 'comment', '4', '允许', '允许', '50');

-- ----------------------------
-- Table structure for bk_link
-- ----------------------------
DROP TABLE IF EXISTS `bk_link`;
CREATE TABLE `bk_link` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '链接id',
  `title` varchar(60) NOT NULL COMMENT '链接标题',
  `desc` varchar(255) NOT NULL COMMENT '链接描述',
  `url` varchar(160) NOT NULL COMMENT '链接地址',
  `sort` mediumint(9) NOT NULL DEFAULT '50' COMMENT '链接排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_link
-- ----------------------------
INSERT INTO `bk_link` VALUES ('10', '百度', '百度', 'http://www.baidu.com', '50');
INSERT INTO `bk_link` VALUES ('2', '36011', '', 'http://www.360.com', '2');
INSERT INTO `bk_link` VALUES ('3', '新浪', '新浪新浪新浪', 'http://www.sina.com.cn', '1');
INSERT INTO `bk_link` VALUES ('11', '淘宝', '淘宝', 'www.taobao.com', '50');

-- ----------------------------
-- Table structure for bk_type
-- ----------------------------
DROP TABLE IF EXISTS `bk_type`;
CREATE TABLE `bk_type` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(30) DEFAULT NULL COMMENT '属性名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_type
-- ----------------------------

-- ----------------------------
-- Table structure for bk_user
-- ----------------------------
DROP TABLE IF EXISTS `bk_user`;
CREATE TABLE `bk_user` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `name` varchar(30) NOT NULL COMMENT '管理员名称',
  `password` char(32) NOT NULL COMMENT '管理员密码',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未处理1通过2拒绝',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_user
-- ----------------------------
INSERT INTO `bk_user` VALUES ('1', 'lzx', 'e10adc3949ba59abbe56e057f20f883e', '1');
INSERT INTO `bk_user` VALUES ('30', '刘振兴', 'e10adc3949ba59abbe56e057f20f883e', '1');

-- ----------------------------
-- Table structure for bk_user_group
-- ----------------------------
DROP TABLE IF EXISTS `bk_user_group`;
CREATE TABLE `bk_user_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `discount` tinyint(1) NOT NULL DEFAULT '1',
  `rules` char(80) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_user_group
-- ----------------------------
INSERT INTO `bk_user_group` VALUES ('1', '省级代理', '20', '15,16,19,18,17,1,9,11,14,13,12,2,3,20,10,4', '1');
INSERT INTO `bk_user_group` VALUES ('3', '市级代理', '40', '2,3,20,10,4', '1');
INSERT INTO `bk_user_group` VALUES ('4', '县级代理', '60', '1,9,11,14,13,12', '1');

-- ----------------------------
-- Table structure for bk_user_group_access
-- ----------------------------
DROP TABLE IF EXISTS `bk_user_group_access`;
CREATE TABLE `bk_user_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bk_user_group_access
-- ----------------------------
INSERT INTO `bk_user_group_access` VALUES ('1', '1');
INSERT INTO `bk_user_group_access` VALUES ('28', '3');
INSERT INTO `bk_user_group_access` VALUES ('29', '4');
INSERT INTO `bk_user_group_access` VALUES ('30', '4');
INSERT INTO `bk_user_group_access` VALUES ('31', '1');
