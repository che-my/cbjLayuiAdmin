/*
 Navicat Premium Data Transfer

 Source Server         : windows
 Source Server Type    : MySQL
 Source Server Version : 50714
 Source Host           : localhost:3306
 Source Schema         : cbjlayuiadmin

 Target Server Type    : MySQL
 Target Server Version : 50714
 File Encoding         : 65001

 Date: 29/01/2019 00:57:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cla_admin
-- ----------------------------
DROP TABLE IF EXISTS `cla_admin`;
CREATE TABLE `cla_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '登录时间',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'Session标识',
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '状态:0=隐藏,1=正常',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '管理员表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cla_admin
-- ----------------------------
INSERT INTO `cla_admin` VALUES (1, 'admin', 'Admin', 'ba1ee752874dca128bc2fe89a67632a1', 'e2551d', '/assets/img/avatar.png', '1396506799@qq.com', 0, 1540052325, 1492186163, 1540052325, '3af5e2e3-18e0-4f59-9138-f7f84870c3f5', '1');
INSERT INTO `cla_admin` VALUES (2, 'admin2', 'admin2', '9a28ce07ce875fbd14172a9ca5357d3c', '2dHDmj', '/assets/img/avatar.png', 'admin2@fastadmin.net', 0, 1505450906, 1492186163, 1505450906, 'df45fdd5-26f4-45ca-83b3-47e4491a315a', '1');
INSERT INTO `cla_admin` VALUES (3, 'admin3', 'admin3', '1c11f945dfcd808a130a8c2a8753fe62', 'WOKJEn', '/assets/img/avatar.png', 'admin3@fastadmin.net', 0, 1501980868, 1492186201, 1501982377, '', '1');
INSERT INTO `cla_admin` VALUES (4, 'admin22', 'admin22', '1c1a0aa0c3c56a8c1a908aab94519648', 'Aybcn5', '/assets/img/avatar.png', 'admin22@fastadmin.net', 0, 0, 1492186240, 1492186240, '', '1');

-- ----------------------------
-- Table structure for cla_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `cla_auth_rule`;
CREATE TABLE `cla_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '图标',
  `condition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `createtime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 140 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '节点表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cla_auth_rule
-- ----------------------------
INSERT INTO `cla_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'layui-icon layui-icon-set', '', 'Dashboard tips', 1, 1497429920, 1497429920, 143, 'normal');
INSERT INTO `cla_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'layui-icon layui-icon-set', '', '', 1, 1497429920, 1497430169, 137, 'normal');
INSERT INTO `cla_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'layui-icon layui-icon-set', '', 'Category tips', 1, 1497429920, 1497429920, 119, 'normal');
INSERT INTO `cla_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'layui-icon layui-icon-set', '', 'Addon tips', 1, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'layui-icon layui-icon-set', '', '', 1, 1497429920, 1497430092, 99, 'normal');
INSERT INTO `cla_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'layui-icon layui-icon-set', '', 'Config tips', 1, 1497429920, 1497430683, 60, 'normal');
INSERT INTO `cla_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'layui-icon layui-icon-set', '', 'Attachment tips', 1, 1497429920, 1497430699, 53, 'normal');
INSERT INTO `cla_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'layui-icon layui-icon-set', '', '', 1, 1497429920, 1497429920, 34, 'normal');
INSERT INTO `cla_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'layui-icon layui-icon-set', '', 'Admin tips', 1, 1497429920, 1497430320, 118, 'normal');
INSERT INTO `cla_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'layui-icon layui-icon-set', '', 'Admin log tips', 1, 1497429920, 1497430307, 113, 'normal');
INSERT INTO `cla_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'layui-icon layui-icon-set', '', 'Group tips', 1, 1497429920, 1497429920, 109, 'normal');
INSERT INTO `cla_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'layui-icon layui-icon-set', '', 'Rule tips', 1, 1497429920, 1497430581, 104, 'normal');
INSERT INTO `cla_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 136, 'normal');
INSERT INTO `cla_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 135, 'normal');
INSERT INTO `cla_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 133, 'normal');
INSERT INTO `cla_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 134, 'normal');
INSERT INTO `cla_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 132, 'normal');
INSERT INTO `cla_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 52, 'normal');
INSERT INTO `cla_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 51, 'normal');
INSERT INTO `cla_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 50, 'normal');
INSERT INTO `cla_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 49, 'normal');
INSERT INTO `cla_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 48, 'normal');
INSERT INTO `cla_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 59, 'normal');
INSERT INTO `cla_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 58, 'normal');
INSERT INTO `cla_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 57, 'normal');
INSERT INTO `cla_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 56, 'normal');
INSERT INTO `cla_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 55, 'normal');
INSERT INTO `cla_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 54, 'normal');
INSERT INTO `cla_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 33, 'normal');
INSERT INTO `cla_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 32, 'normal');
INSERT INTO `cla_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 31, 'normal');
INSERT INTO `cla_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 30, 'normal');
INSERT INTO `cla_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 29, 'normal');
INSERT INTO `cla_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 28, 'normal');
INSERT INTO `cla_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 142, 'normal');
INSERT INTO `cla_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 141, 'normal');
INSERT INTO `cla_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 140, 'normal');
INSERT INTO `cla_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 139, 'normal');
INSERT INTO `cla_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 138, 'normal');
INSERT INTO `cla_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 117, 'normal');
INSERT INTO `cla_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 116, 'normal');
INSERT INTO `cla_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 115, 'normal');
INSERT INTO `cla_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 114, 'normal');
INSERT INTO `cla_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 112, 'normal');
INSERT INTO `cla_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 111, 'normal');
INSERT INTO `cla_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 110, 'normal');
INSERT INTO `cla_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 108, 'normal');
INSERT INTO `cla_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 107, 'normal');
INSERT INTO `cla_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 106, 'normal');
INSERT INTO `cla_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 105, 'normal');
INSERT INTO `cla_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 103, 'normal');
INSERT INTO `cla_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 102, 'normal');
INSERT INTO `cla_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 101, 'normal');
INSERT INTO `cla_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1497429920, 1497429920, 100, 'normal');
INSERT INTO `cla_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (59, 'file', 4, 'addon/local', 'Local install', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (61, 'file', 4, 'addon/install', 'Install', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (62, 'file', 4, 'addon/uninstall', 'Uninstall', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'layui-icon layui-icon-set', '', '', 0, 1502035509, 1502035509, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (66, 'file', 0, 'example', '开发示例管理', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (67, 'file', 66, 'example/bootstraptable', '表格完整示例', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (68, 'file', 67, 'example/bootstraptable/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (69, 'file', 67, 'example/bootstraptable/detail', '详情', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (70, 'file', 67, 'example/bootstraptable/change', '变更', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (71, 'file', 67, 'example/bootstraptable/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (72, 'file', 67, 'example/bootstraptable/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (73, 'file', 66, 'example/customsearch', '自定义搜索', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (74, 'file', 73, 'example/customsearch/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (75, 'file', 73, 'example/customsearch/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (76, 'file', 73, 'example/customsearch/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (77, 'file', 66, 'example/colorbadge', '彩色角标', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (78, 'file', 77, 'example/colorbadge/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (79, 'file', 77, 'example/colorbadge/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (80, 'file', 77, 'example/colorbadge/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (81, 'file', 66, 'example/controllerjump', '控制器间跳转', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (82, 'file', 81, 'example/controllerjump/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (83, 'file', 81, 'example/controllerjump/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (84, 'file', 81, 'example/controllerjump/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (85, 'file', 66, 'example/cxselect', '多级联动', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (86, 'file', 85, 'example/cxselect/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (87, 'file', 85, 'example/cxselect/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (88, 'file', 85, 'example/cxselect/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (89, 'file', 66, 'example/multitable', '多表格示例', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (90, 'file', 89, 'example/multitable/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (91, 'file', 89, 'example/multitable/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (92, 'file', 89, 'example/multitable/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (93, 'file', 66, 'example/relationmodel', '关联模型示例', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (94, 'file', 93, 'example/relationmodel/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (95, 'file', 93, 'example/relationmodel/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (96, 'file', 93, 'example/relationmodel/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (97, 'file', 66, 'example/tabletemplate', '表格模板示例', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (98, 'file', 97, 'example/tabletemplate/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (99, 'file', 97, 'example/tabletemplate/detail', '详情', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (100, 'file', 97, 'example/tabletemplate/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (101, 'file', 97, 'example/tabletemplate/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (102, 'file', 66, 'example/baidumap', '百度地图示例', 'layui-icon layui-icon-set', '', '', 1, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (103, 'file', 102, 'example/baidumap/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (104, 'file', 102, 'example/baidumap/map', '详情', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (105, 'file', 102, 'example/baidumap/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1531476315, 1531476315, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (106, 'file', 0, 'wechat', '微信管理', 'layui-icon layui-icon-set', '', '', 1, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (107, 'file', 106, 'wechat/autoreply', '自动回复管理', 'layui-icon layui-icon-set', '', '', 1, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (108, 'file', 107, 'wechat/autoreply/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (109, 'file', 107, 'wechat/autoreply/add', '添加', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (110, 'file', 107, 'wechat/autoreply/edit', '修改', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (111, 'file', 107, 'wechat/autoreply/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (112, 'file', 107, 'wechat/autoreply/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (113, 'file', 106, 'wechat/config', '配置管理', 'layui-icon layui-icon-set', '', '', 1, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (114, 'file', 113, 'wechat/config/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (115, 'file', 113, 'wechat/config/add', '添加', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (116, 'file', 113, 'wechat/config/edit', '修改', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (117, 'file', 113, 'wechat/config/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (118, 'file', 113, 'wechat/config/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (119, 'file', 106, 'wechat/menu', '菜单管理', 'layui-icon layui-icon-set', '', '', 1, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (120, 'file', 119, 'wechat/menu/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (121, 'file', 119, 'wechat/menu/add', '添加', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (122, 'file', 119, 'wechat/menu/edit', '修改', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (123, 'file', 119, 'wechat/menu/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (124, 'file', 119, 'wechat/menu/sync', '同步', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (125, 'file', 119, 'wechat/menu/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (126, 'file', 106, 'wechat/response', '资源管理', 'layui-icon layui-icon-set', '', '', 1, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (127, 'file', 126, 'wechat/response/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (128, 'file', 126, 'wechat/response/add', '添加', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (129, 'file', 126, 'wechat/response/edit', '修改', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (130, 'file', 126, 'wechat/response/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (131, 'file', 126, 'wechat/response/select', '选择', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (132, 'file', 126, 'wechat/response/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1534350566, 1534350566, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (133, 'file', 0, 'command', '在线命令管理', 'layui-icon layui-icon-set', '', '', 1, 1540052397, 1540052397, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (134, 'file', 133, 'command/index', '查看', 'layui-icon layui-icon-set', '', '', 0, 1540052397, 1540052397, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (135, 'file', 133, 'command/add', '添加', 'layui-icon layui-icon-set', '', '', 0, 1540052397, 1540052397, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (136, 'file', 133, 'command/detail', '详情', 'layui-icon layui-icon-set', '', '', 0, 1540052397, 1540052397, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (137, 'file', 133, 'command/execute', '运行', 'layui-icon layui-icon-set', '', '', 0, 1540052397, 1540052397, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (138, 'file', 133, 'command/del', '删除', 'layui-icon layui-icon-set', '', '', 0, 1540052397, 1540052397, 0, 'normal');
INSERT INTO `cla_auth_rule` VALUES (139, 'file', 133, 'command/multi', '批量更新', 'layui-icon layui-icon-set', '', '', 0, 1540052397, 1540052397, 0, 'normal');

SET FOREIGN_KEY_CHECKS = 1;
