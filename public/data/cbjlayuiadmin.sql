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

 Date: 28/01/2019 00:21:04
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

SET FOREIGN_KEY_CHECKS = 1;
