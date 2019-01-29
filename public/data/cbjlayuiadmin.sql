/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50723
Source Host           : localhost:3306
Source Database       : cbjlayuiadmin

Target Server Type    : MYSQL
Target Server Version : 50723
File Encoding         : 65001

Date: 2019-01-29 19:50:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `cla_admin`
-- ----------------------------
DROP TABLE IF EXISTS `cla_admin`;
CREATE TABLE `cla_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录时间',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `token` varchar(59) NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` enum('0','1') NOT NULL DEFAULT '0' COMMENT '状态:0=隐藏,1=正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='管理员表';

-- ----------------------------
-- Records of cla_admin
-- ----------------------------
INSERT INTO `cla_admin` VALUES ('1', 'admin', 'Admin', 'ba1ee752874dca128bc2fe89a67632a1', 'e2551d', '/assets/img/avatar.png', '1396506799@qq.com', '0', '1540052325', '1492186163', '1540052325', '3af5e2e3-18e0-4f59-9138-f7f84870c3f5', '1');
INSERT INTO `cla_admin` VALUES ('2', 'admin2', 'admin2', '9a28ce07ce875fbd14172a9ca5357d3c', '2dHDmj', '/assets/img/avatar.png', 'admin2@fastadmin.net', '0', '1505450906', '1492186163', '1505450906', 'df45fdd5-26f4-45ca-83b3-47e4491a315a', '1');
INSERT INTO `cla_admin` VALUES ('3', 'admin3', 'admin3', '1c11f945dfcd808a130a8c2a8753fe62', 'WOKJEn', '/assets/img/avatar.png', 'admin3@fastadmin.net', '0', '1501980868', '1492186201', '1501982377', '', '1');
INSERT INTO `cla_admin` VALUES ('4', 'admin22', 'admin22', '1c1a0aa0c3c56a8c1a908aab94519648', 'Aybcn5', '/assets/img/avatar.png', 'admin22@fastadmin.net', '0', '0', '1492186240', '1492186240', '', '1');

-- ----------------------------
-- Table structure for `cla_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `cla_auth_rule`;
CREATE TABLE `cla_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT COMMENT='节点表';

-- ----------------------------
-- Records of cla_auth_rule
-- ----------------------------
INSERT INTO `cla_auth_rule` VALUES ('1', 'file', '0', 'dashboard', '控制台', 'layui-icon layui-icon-console', '', 'Dashboard tips', '1', '1497429920', '1548757669', '143', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('2', 'file', '0', 'general', 'General', 'layui-icon layui-icon-set', '', '', '1', '1497429920', '1497430169', '137', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('3', 'file', '0', 'category', '分类管理', 'layui-icon layui-icon-template-1', '', 'Category tips', '1', '1497429920', '1548762136', '119', '1');
INSERT INTO `cla_auth_rule` VALUES ('4', 'file', '0', 'addon', '插件管理', 'layui-icon layui-icon-component', '', 'Addon tips', '1', '1502035509', '1548762602', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('5', 'file', '0', 'auth', '权限管理', 'layui-icon layui-icon-group', '', '', '1', '1497429920', '1548762303', '99', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('6', 'file', '2', 'general/config', 'Config', 'layui-icon layui-icon-set', '', 'Config tips', '1', '1497429920', '1497430683', '60', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('7', 'file', '2', 'general/attachment', 'Attachment', 'layui-icon layui-icon-set', '', 'Attachment tips', '1', '1497429920', '1497430699', '53', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('8', 'file', '2', 'general/profile', 'Profile', 'layui-icon layui-icon-set', '', '', '1', '1497429920', '1497429920', '34', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('9', 'file', '5', 'auth/admin', 'Admin', 'layui-icon layui-icon-set', '', 'Admin tips', '1', '1497429920', '1497430320', '118', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('10', 'file', '5', 'auth/adminlog', 'Admin log', 'layui-icon layui-icon-set', '', 'Admin log tips', '1', '1497429920', '1497430307', '113', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('11', 'file', '5', 'auth/group', 'Group', 'layui-icon layui-icon-set', '', 'Group tips', '1', '1497429920', '1497429920', '109', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('12', 'file', '5', 'auth/rule', 'Rule', 'layui-icon layui-icon-set', '', 'Rule tips', '1', '1497429920', '1497430581', '104', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('13', 'file', '1', 'dashboard/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '136', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('14', 'file', '1', 'dashboard/add', 'Add', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '135', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('15', 'file', '1', 'dashboard/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '133', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('16', 'file', '1', 'dashboard/edit', 'Edit', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '134', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('17', 'file', '1', 'dashboard/multi', 'Multi', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '132', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('18', 'file', '6', 'general/config/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '52', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('19', 'file', '6', 'general/config/add', 'Add', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '51', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('20', 'file', '6', 'general/config/edit', 'Edit', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '50', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('21', 'file', '6', 'general/config/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '49', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('22', 'file', '6', 'general/config/multi', 'Multi', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '48', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('23', 'file', '7', 'general/attachment/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '59', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('24', 'file', '7', 'general/attachment/select', 'Select attachment', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '58', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('25', 'file', '7', 'general/attachment/add', 'Add', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '57', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('26', 'file', '7', 'general/attachment/edit', 'Edit', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '56', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('27', 'file', '7', 'general/attachment/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '55', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('28', 'file', '7', 'general/attachment/multi', 'Multi', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '54', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('29', 'file', '8', 'general/profile/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '33', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('30', 'file', '8', 'general/profile/update', 'Update profile', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '32', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('31', 'file', '8', 'general/profile/add', 'Add', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '31', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('32', 'file', '8', 'general/profile/edit', 'Edit', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '30', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('33', 'file', '8', 'general/profile/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '29', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('34', 'file', '8', 'general/profile/multi', 'Multi', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '28', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('35', 'file', '3', 'category/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '142', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('36', 'file', '3', 'category/add', 'Add', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '141', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('37', 'file', '3', 'category/edit', 'Edit', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '140', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('38', 'file', '3', 'category/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '139', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('39', 'file', '3', 'category/multi', 'Multi', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '138', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('40', 'file', '9', 'auth/admin/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '117', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('41', 'file', '9', 'auth/admin/add', 'Add', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '116', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('42', 'file', '9', 'auth/admin/edit', 'Edit', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '115', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('43', 'file', '9', 'auth/admin/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '114', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('44', 'file', '10', 'auth/adminlog/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '112', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('45', 'file', '10', 'auth/adminlog/detail', 'Detail', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '111', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('46', 'file', '10', 'auth/adminlog/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '110', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('47', 'file', '11', 'auth/group/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '108', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('48', 'file', '11', 'auth/group/add', 'Add', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '107', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('49', 'file', '11', 'auth/group/edit', 'Edit', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '106', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('50', 'file', '11', 'auth/group/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '105', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('51', 'file', '12', 'auth/rule/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '103', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('52', 'file', '12', 'auth/rule/add', 'Add', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '102', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('53', 'file', '12', 'auth/rule/edit', 'Edit', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '101', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('54', 'file', '12', 'auth/rule/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1497429920', '1497429920', '100', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('55', 'file', '4', 'addon/index', 'View', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('56', 'file', '4', 'addon/add', 'Add', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('57', 'file', '4', 'addon/edit', 'Edit', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('58', 'file', '4', 'addon/del', 'Delete', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('59', 'file', '4', 'addon/local', 'Local install', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('60', 'file', '4', 'addon/state', 'Update state', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('61', 'file', '4', 'addon/install', 'Install', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('62', 'file', '4', 'addon/uninstall', 'Uninstall', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('63', 'file', '4', 'addon/config', 'Setting', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('64', 'file', '4', 'addon/refresh', 'Refresh', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('65', 'file', '4', 'addon/multi', 'Multi', 'layui-icon layui-icon-set', '', '', '0', '1502035509', '1502035509', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('66', 'file', '0', 'example', '开发示例管理', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('67', 'file', '66', 'example/bootstraptable', '表格完整示例', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('68', 'file', '67', 'example/bootstraptable/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('69', 'file', '67', 'example/bootstraptable/detail', '详情', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('70', 'file', '67', 'example/bootstraptable/change', '变更', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('71', 'file', '67', 'example/bootstraptable/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('72', 'file', '67', 'example/bootstraptable/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('73', 'file', '66', 'example/customsearch', '自定义搜索', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('74', 'file', '73', 'example/customsearch/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('75', 'file', '73', 'example/customsearch/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('76', 'file', '73', 'example/customsearch/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('77', 'file', '66', 'example/colorbadge', '彩色角标', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('78', 'file', '77', 'example/colorbadge/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('79', 'file', '77', 'example/colorbadge/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('80', 'file', '77', 'example/colorbadge/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('81', 'file', '66', 'example/controllerjump', '控制器间跳转', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('82', 'file', '81', 'example/controllerjump/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('83', 'file', '81', 'example/controllerjump/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('84', 'file', '81', 'example/controllerjump/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('85', 'file', '66', 'example/cxselect', '多级联动', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('86', 'file', '85', 'example/cxselect/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('87', 'file', '85', 'example/cxselect/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('88', 'file', '85', 'example/cxselect/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('89', 'file', '66', 'example/multitable', '多表格示例', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('90', 'file', '89', 'example/multitable/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('91', 'file', '89', 'example/multitable/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('92', 'file', '89', 'example/multitable/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('93', 'file', '66', 'example/relationmodel', '关联模型示例', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('94', 'file', '93', 'example/relationmodel/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('95', 'file', '93', 'example/relationmodel/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('96', 'file', '93', 'example/relationmodel/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('97', 'file', '66', 'example/tabletemplate', '表格模板示例', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('98', 'file', '97', 'example/tabletemplate/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('99', 'file', '97', 'example/tabletemplate/detail', '详情', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('100', 'file', '97', 'example/tabletemplate/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('101', 'file', '97', 'example/tabletemplate/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('102', 'file', '66', 'example/baidumap', '百度地图示例', 'layui-icon layui-icon-set', '', '', '1', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('103', 'file', '102', 'example/baidumap/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('104', 'file', '102', 'example/baidumap/map', '详情', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('105', 'file', '102', 'example/baidumap/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1531476315', '1531476315', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('106', 'file', '0', 'wechat', '微信管理', 'layui-icon layui-icon-set', '', '', '1', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('107', 'file', '106', 'wechat/autoreply', '自动回复管理', 'layui-icon layui-icon-set', '', '', '1', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('108', 'file', '107', 'wechat/autoreply/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('109', 'file', '107', 'wechat/autoreply/add', '添加', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('110', 'file', '107', 'wechat/autoreply/edit', '修改', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('111', 'file', '107', 'wechat/autoreply/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('112', 'file', '107', 'wechat/autoreply/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('113', 'file', '106', 'wechat/config', '配置管理', 'layui-icon layui-icon-set', '', '', '1', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('114', 'file', '113', 'wechat/config/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('115', 'file', '113', 'wechat/config/add', '添加', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('116', 'file', '113', 'wechat/config/edit', '修改', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('117', 'file', '113', 'wechat/config/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('118', 'file', '113', 'wechat/config/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('119', 'file', '106', 'wechat/menu', '菜单管理', 'layui-icon layui-icon-set', '', '', '1', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('120', 'file', '119', 'wechat/menu/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('121', 'file', '119', 'wechat/menu/add', '添加', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('122', 'file', '119', 'wechat/menu/edit', '修改', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('123', 'file', '119', 'wechat/menu/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('124', 'file', '119', 'wechat/menu/sync', '同步', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('125', 'file', '119', 'wechat/menu/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('126', 'file', '106', 'wechat/response', '资源管理', 'layui-icon layui-icon-set', '', '', '1', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('127', 'file', '126', 'wechat/response/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('128', 'file', '126', 'wechat/response/add', '添加', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('129', 'file', '126', 'wechat/response/edit', '修改', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('130', 'file', '126', 'wechat/response/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('131', 'file', '126', 'wechat/response/select', '选择', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('132', 'file', '126', 'wechat/response/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1534350566', '1534350566', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('133', 'file', '0', 'command', '在线命令管理', 'layui-icon layui-icon-set', '', '', '1', '1540052397', '1540052397', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('134', 'file', '133', 'command/index', '查看', 'layui-icon layui-icon-set', '', '', '0', '1540052397', '1540052397', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('135', 'file', '133', 'command/add', '添加', 'layui-icon layui-icon-set', '', '', '0', '1540052397', '1540052397', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('136', 'file', '133', 'command/detail', '详情', 'layui-icon layui-icon-set', '', '', '0', '1540052397', '1540052397', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('137', 'file', '133', 'command/execute', '运行', 'layui-icon layui-icon-set', '', '', '0', '1540052397', '1540052397', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('138', 'file', '133', 'command/del', '删除', 'layui-icon layui-icon-set', '', '', '0', '1540052397', '1540052397', '0', 'normal');
INSERT INTO `cla_auth_rule` VALUES ('139', 'file', '133', 'command/multi', '批量更新', 'layui-icon layui-icon-set', '', '', '0', '1540052397', '1540052397', '0', 'normal');

-- ----------------------------
-- Table structure for `cla_icons`
-- ----------------------------
DROP TABLE IF EXISTS `cla_icons`;
CREATE TABLE `cla_icons` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `unicode` varchar(50) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8 COMMENT='icon图标表';

-- ----------------------------
-- Records of cla_icons
-- ----------------------------
INSERT INTO `cla_icons` VALUES ('1', '半星', '&#xe6c9;', 'layui-icon-rate-half');
INSERT INTO `cla_icons` VALUES ('2', '星星-空心', '&#xe67b;', 'layui-icon-rate');
INSERT INTO `cla_icons` VALUES ('3', '星星-实心', '&#xe67a;', 'layui-icon-rate-solid');
INSERT INTO `cla_icons` VALUES ('4', '手机', '&#xe678;', 'layui-icon-cellphone');
INSERT INTO `cla_icons` VALUES ('5', '验证码', '&#xe679;', 'layui-icon-vercode');
INSERT INTO `cla_icons` VALUES ('6', '微信', '&#xe677;', 'layui-icon-login-wechat');
INSERT INTO `cla_icons` VALUES ('7', 'QQ', '&#xe676;', 'layui-icon-login-qq');
INSERT INTO `cla_icons` VALUES ('8', '微博', '&#xe675;', 'layui-icon-login-weibo');
INSERT INTO `cla_icons` VALUES ('9', '密码', '&#xe673;', 'layui-icon-password');
INSERT INTO `cla_icons` VALUES ('10', '用户名', '&#xe66f;', 'layui-icon-username');
INSERT INTO `cla_icons` VALUES ('11', '刷新-粗', '&#xe9aa;', 'layui-icon-refresh-3');
INSERT INTO `cla_icons` VALUES ('12', '授权', '&#xe672;', 'layui-icon-auz');
INSERT INTO `cla_icons` VALUES ('13', '左向右伸缩菜单', '&#xe66b;', 'layui-icon-spread-left');
INSERT INTO `cla_icons` VALUES ('14', '右向左伸缩菜单', '&#xe668;', 'layui-icon-shrink-right');
INSERT INTO `cla_icons` VALUES ('15', '雪花', '&#xe6b1;', 'layui-icon-snowflake');
INSERT INTO `cla_icons` VALUES ('16', '提示说明', '&#xe702;', 'layui-icon-tips');
INSERT INTO `cla_icons` VALUES ('17', '便签', '&#xe66e;', 'layui-icon-note');
INSERT INTO `cla_icons` VALUES ('18', '主页', '&#xe68e;', 'layui-icon-home');
INSERT INTO `cla_icons` VALUES ('19', '高级', '&#xe674;', 'layui-icon-senior');
INSERT INTO `cla_icons` VALUES ('20', '刷新', '&#xe669;', 'layui-icon-refresh');
INSERT INTO `cla_icons` VALUES ('21', '刷新', '&#xe666;', 'layui-icon-refresh-1');
INSERT INTO `cla_icons` VALUES ('22', '旗帜', '&#xe66c;', 'layui-icon-flag');
INSERT INTO `cla_icons` VALUES ('23', '主题', '&#xe66a;', 'layui-icon-theme');
INSERT INTO `cla_icons` VALUES ('24', '消息-通知', '&#xe667;', 'layui-icon-notice');
INSERT INTO `cla_icons` VALUES ('25', '网站', '&#xe7ae;', 'layui-icon-website');
INSERT INTO `cla_icons` VALUES ('26', '控制台', '&#xe665;', 'layui-icon-console');
INSERT INTO `cla_icons` VALUES ('27', '表情-惊讶', '&#xe664;', 'layui-icon-face-surprised');
INSERT INTO `cla_icons` VALUES ('28', '设置-空心', '&#xe716;', 'layui-icon-set');
INSERT INTO `cla_icons` VALUES ('29', '模板', '&#xe656;', 'layui-icon-template-1');
INSERT INTO `cla_icons` VALUES ('30', '应用', '&#xe653;', 'layui-icon-app');
INSERT INTO `cla_icons` VALUES ('31', '模板', '&#xe663;', 'layui-icon-template');
INSERT INTO `cla_icons` VALUES ('32', '赞', '&#xe6c6;', 'layui-icon-praise');
INSERT INTO `cla_icons` VALUES ('33', '踩', '&#xe6c5;', 'layui-icon-tread');
INSERT INTO `cla_icons` VALUES ('34', '男', '&#xe662;', 'layui-icon-male');
INSERT INTO `cla_icons` VALUES ('35', '女', '&#xe661;', 'layui-icon-female');
INSERT INTO `cla_icons` VALUES ('36', '相机-空心', '&#xe660;', 'layui-icon-camera');
INSERT INTO `cla_icons` VALUES ('37', '相机-实心', '&#xe65d;', 'layui-icon-camera-fill');
INSERT INTO `cla_icons` VALUES ('38', '菜单-水平', '&#xe65f;', 'layui-icon-more');
INSERT INTO `cla_icons` VALUES ('39', '菜单-垂直', '&#xe671;', 'layui-icon-more-vertical');
INSERT INTO `cla_icons` VALUES ('40', '金额-人民币', '&#xe65e;', 'layui-icon-rmb');
INSERT INTO `cla_icons` VALUES ('41', '金额-美元', '&#xe659;', 'layui-icon-dollar');
INSERT INTO `cla_icons` VALUES ('42', '钻石-等级', '&#xe735;', 'layui-icon-diamond');
INSERT INTO `cla_icons` VALUES ('43', '火', '&#xe756;', 'layui-icon-fire');
INSERT INTO `cla_icons` VALUES ('44', '返回', '&#xe65c;', 'layui-icon-return');
INSERT INTO `cla_icons` VALUES ('45', '位置-地图', '&#xe715;', 'layui-icon-location');
INSERT INTO `cla_icons` VALUES ('46', '办公-阅读', '&#xe705;', 'layui-icon-read');
INSERT INTO `cla_icons` VALUES ('47', '调查', '&#xe6b2;', 'layui-icon-survey');
INSERT INTO `cla_icons` VALUES ('48', '表情-微笑', '&#xe6af;', 'layui-icon-face-smile');
INSERT INTO `cla_icons` VALUES ('49', '表情-哭泣', '&#xe69c;', 'layui-icon-face-cry');
INSERT INTO `cla_icons` VALUES ('50', '购物车', '&#xe698;', 'layui-icon-cart-simple');
INSERT INTO `cla_icons` VALUES ('51', '购物车', '&#xe657;', 'layui-icon-cart');
INSERT INTO `cla_icons` VALUES ('52', '下一页', '&#xe65b;', 'layui-icon-next');
INSERT INTO `cla_icons` VALUES ('53', '上一页', '&#xe65a;', 'layui-icon-prev');
INSERT INTO `cla_icons` VALUES ('54', '上传-空心-拖拽', '&#xe681;', 'layui-icon-upload-drag');
INSERT INTO `cla_icons` VALUES ('55', '上传-实心', '&#xe67c;', 'layui-icon-upload');
INSERT INTO `cla_icons` VALUES ('56', '下载-圆圈', '&#xe601;', 'layui-icon-download-circle');
INSERT INTO `cla_icons` VALUES ('57', '组件', '&#xe857;', 'layui-icon-component');
INSERT INTO `cla_icons` VALUES ('58', '文件-粗', '&#xe655;', 'layui-icon-file-b');
INSERT INTO `cla_icons` VALUES ('59', '用户', '&#xe770;', 'layui-icon-user');
INSERT INTO `cla_icons` VALUES ('60', '发现-实心', '&#xe670;', 'layui-icon-find-fill');
INSERT INTO `cla_icons` VALUES ('61', 'loading', '&#xe63d;', 'layui-icon-loading');
INSERT INTO `cla_icons` VALUES ('62', 'loading', '&#xe63e;', 'layui-icon-loading-1');
INSERT INTO `cla_icons` VALUES ('63', '添加', '&#xe654;', 'layui-icon-add-1');
INSERT INTO `cla_icons` VALUES ('64', '播放', '&#xe652;', 'layui-icon-play');
INSERT INTO `cla_icons` VALUES ('65', '暂停', '&#xe651;', 'layui-icon-pause');
INSERT INTO `cla_icons` VALUES ('66', '音频-耳机', '&#xe6fc;', 'layui-icon-headset');
INSERT INTO `cla_icons` VALUES ('67', '视频', '&#xe6ed;', 'layui-icon-video');
INSERT INTO `cla_icons` VALUES ('68', '语音-声音', '&#xe688;', 'layui-icon-voice');
INSERT INTO `cla_icons` VALUES ('69', '消息-通知-喇叭', '&#xe645;', 'layui-icon-speaker');
INSERT INTO `cla_icons` VALUES ('70', '删除线', '&#xe64f;', 'layui-icon-fonts-del');
INSERT INTO `cla_icons` VALUES ('71', '代码', '&#xe64e;', 'layui-icon-fonts-code');
INSERT INTO `cla_icons` VALUES ('72', 'HTML', '&#xe64b;', 'layui-icon-fonts-html');
INSERT INTO `cla_icons` VALUES ('73', '字体加粗', '&#xe62b;', 'layui-icon-fonts-strong');
INSERT INTO `cla_icons` VALUES ('74', '删除链接', '&#xe64d;', 'layui-icon-unlink');
INSERT INTO `cla_icons` VALUES ('75', '图片', '&#xe64a;', 'layui-icon-picture');
INSERT INTO `cla_icons` VALUES ('76', '链接', '&#xe64c;', 'layui-icon-link');
INSERT INTO `cla_icons` VALUES ('77', '表情-笑-粗', '&#xe650;', 'layui-icon-face-smile-b');
INSERT INTO `cla_icons` VALUES ('78', '左对齐', '&#xe649;', 'layui-icon-align-left');
INSERT INTO `cla_icons` VALUES ('79', '右对齐', '&#xe648;', 'layui-icon-align-right');
INSERT INTO `cla_icons` VALUES ('80', '居中对齐', '&#xe647;', 'layui-icon-align-center');
INSERT INTO `cla_icons` VALUES ('81', '字体-下划线', '&#xe646;', 'layui-icon-fonts-u');
INSERT INTO `cla_icons` VALUES ('82', '字体-斜体', '&#xe644;', 'layui-icon-fonts-i');
INSERT INTO `cla_icons` VALUES ('83', 'Tabs-选项卡', '&#xe62a;', 'layui-icon-tabs');
INSERT INTO `cla_icons` VALUES ('84', '单选框-选中', '&#xe643;', 'layui-icon-radio');
INSERT INTO `cla_icons` VALUES ('85', '单选框-候选', '&#xe63f;', 'layui-icon-circle');
INSERT INTO `cla_icons` VALUES ('86', '编辑', '&#xe642;', 'layui-icon-edit');
INSERT INTO `cla_icons` VALUES ('87', '分享', '&#xe641;', 'layui-icon-share');
INSERT INTO `cla_icons` VALUES ('88', '删除', '&#xe640;', 'layui-icon-delete');
INSERT INTO `cla_icons` VALUES ('89', '表单', '&#xe63c;', 'layui-icon-form');
INSERT INTO `cla_icons` VALUES ('90', '手机-细体', '&#xe63b;', 'layui-icon-cellphone-fine');
INSERT INTO `cla_icons` VALUES ('91', '聊天-对话-沟通', '&#xe63a;', 'layui-icon-dialogue');
INSERT INTO `cla_icons` VALUES ('92', '文字格式化', '&#xe639;', 'layui-icon-fonts-clear');
INSERT INTO `cla_icons` VALUES ('93', '窗口', '&#xe638;', 'layui-icon-layer');
INSERT INTO `cla_icons` VALUES ('94', '日期', '&#xe637;', 'layui-icon-date');
INSERT INTO `cla_icons` VALUES ('95', '水-下雨', '&#xe636;', 'layui-icon-water');
INSERT INTO `cla_icons` VALUES ('96', '代码-圆圈', '&#xe635;', 'layui-icon-code-circle');
INSERT INTO `cla_icons` VALUES ('97', '轮播组图', '&#xe634;', 'layui-icon-carousel');
INSERT INTO `cla_icons` VALUES ('98', '翻页', '&#xe633;', 'layui-icon-prev-circle');
INSERT INTO `cla_icons` VALUES ('99', '布局', '&#xe632;', 'layui-icon-layouts');
INSERT INTO `cla_icons` VALUES ('100', '工具', '&#xe631;', 'layui-icon-util');
INSERT INTO `cla_icons` VALUES ('101', '选择模板', '&#xe630;', 'layui-icon-templeate-1');
INSERT INTO `cla_icons` VALUES ('102', '上传-圆圈', '&#xe62f;', 'layui-icon-upload-circle');
INSERT INTO `cla_icons` VALUES ('103', '树', '&#xe62e;', 'layui-icon-tree');
INSERT INTO `cla_icons` VALUES ('104', '表格', '&#xe62d;', 'layui-icon-table');
INSERT INTO `cla_icons` VALUES ('105', '图表', '&#xe62c;', 'layui-icon-chart');
INSERT INTO `cla_icons` VALUES ('106', '图标-报表-屏幕', '&#xe629;', 'layui-icon-chart-screen');
INSERT INTO `cla_icons` VALUES ('107', '引擎', '&#xe628;', 'layui-icon-engine');
INSERT INTO `cla_icons` VALUES ('108', '下三角', '&#xe625;', 'layui-icon-triangle-d');
INSERT INTO `cla_icons` VALUES ('109', '右三角', '&#xe623;', 'layui-icon-triangle-r');
INSERT INTO `cla_icons` VALUES ('110', '文件', '&#xe621;', 'layui-icon-file');
INSERT INTO `cla_icons` VALUES ('111', '设置-小型', '&#xe620;', 'layui-icon-set-sm');
INSERT INTO `cla_icons` VALUES ('112', '添加-圆圈', '&#xe61f;', 'layui-icon-add-circle');
INSERT INTO `cla_icons` VALUES ('113', '404', '&#xe61c;', 'layui-icon-404');
INSERT INTO `cla_icons` VALUES ('114', '关于', '&#xe60b;', 'layui-icon-about');
INSERT INTO `cla_icons` VALUES ('115', '箭头-向上', '&#xe619;', 'layui-icon-up');
INSERT INTO `cla_icons` VALUES ('116', '箭头-向下', '&#xe61a;', 'layui-icon-down');
INSERT INTO `cla_icons` VALUES ('117', '箭头-向左', '&#xe603;', 'layui-icon-left');
INSERT INTO `cla_icons` VALUES ('118', '箭头-向右', '&#xe602;', 'layui-icon-right');
INSERT INTO `cla_icons` VALUES ('119', '圆点', '&#xe617;', 'layui-icon-circle-dot');
INSERT INTO `cla_icons` VALUES ('120', '搜索', '&#xe615;', 'layui-icon-search');
INSERT INTO `cla_icons` VALUES ('121', '设置-实心', '&#xe614;', 'layui-icon-set-fill');
INSERT INTO `cla_icons` VALUES ('122', '群组', '&#xe613;', 'layui-icon-group');
INSERT INTO `cla_icons` VALUES ('123', '好友', '&#xe612;', 'layui-icon-friends');
INSERT INTO `cla_icons` VALUES ('124', '回复-评论-实心', '&#xe611;', 'layui-icon-reply-fill');
INSERT INTO `cla_icons` VALUES ('125', '菜单-隐身-实心', '&#xe60f;', 'layui-icon-menu-fill');
INSERT INTO `cla_icons` VALUES ('126', '记录', '&#xe60e;', 'layui-icon-log');
INSERT INTO `cla_icons` VALUES ('127', '图片-细体', '&#xe60d;', 'layui-icon-picture-fine');
INSERT INTO `cla_icons` VALUES ('128', '表情-笑-细体', '&#xe60c;', 'layui-icon-face-smile-fine');
INSERT INTO `cla_icons` VALUES ('129', '列表', '&#xe60a;', 'layui-icon-list');
INSERT INTO `cla_icons` VALUES ('130', '发布-纸飞机', '&#xe609;', 'layui-icon-release');
INSERT INTO `cla_icons` VALUES ('131', '对-OK', '&#xe605;', 'layui-icon-ok');
INSERT INTO `cla_icons` VALUES ('132', '帮助', '&#xe607;', 'layui-icon-help');
INSERT INTO `cla_icons` VALUES ('133', '客服', '&#xe606;', 'layui-icon-chat');
INSERT INTO `cla_icons` VALUES ('134', 'top-置顶', '&#xe604;', 'layui-icon-top');
INSERT INTO `cla_icons` VALUES ('135', '收藏-空心', '&#xe600;', 'layui-icon-star');
INSERT INTO `cla_icons` VALUES ('136', '收藏-实心', '&#xe658;', 'layui-icon-star-fill');
INSERT INTO `cla_icons` VALUES ('137', '关闭-实心', '&#x1007;', 'layui-icon-close-fill');
INSERT INTO `cla_icons` VALUES ('138', '关闭-空心', '&#x1006;', 'layui-icon-close');
INSERT INTO `cla_icons` VALUES ('139', '正确', '&#x1005;', 'layui-icon-ok-circle');
INSERT INTO `cla_icons` VALUES ('140', '添加-圆圈-细体', '&#xe608;', 'layui-icon-add-circle-fine');
