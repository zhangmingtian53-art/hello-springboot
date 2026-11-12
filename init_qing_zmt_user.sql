/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 50520
 Source Host           : localhost:3306
 Source Schema         : qing

 Target Server Type    : MySQL
 Target Server Version : 50520
 File Encoding         : 65001

 Date: 04/05/2025 16:28:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '内容',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '类型'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('user', 'el-icon-user', 'icon');
INSERT INTO `sys_dict` VALUES ('house', 'el-icon-house', 'icon');
INSERT INTO `sys_dict` VALUES ('menu', 'el-icon-menu', 'icon');
INSERT INTO `sys_dict` VALUES ('s-custom', 'el-icon-s-custom', 'icon');
INSERT INTO `sys_dict` VALUES ('s-grid', 'el-icon-s-grid', 'icon');
INSERT INTO `sys_dict` VALUES ('s-record', 'el-icon-edit', 'icon');
INSERT INTO `sys_dict` VALUES ('r-c', 'el-icon-shopping-cart-1', 'icon');
INSERT INTO `sys_dict` VALUES ('r-test', 'el-icon-notebook-2', 'icon');
INSERT INTO `sys_dict` VALUES ('r-test2', '\r\nel-icon-document-copy', 'icon');
INSERT INTO `sys_dict` VALUES ('news', 'el-icon-news', 'icon');
INSERT INTO `sys_dict` VALUES ('release', 'el-icon-s-release', 'icon');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件名称',
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '文件后缀',
  `size` bigint(20) NULL DEFAULT NULL COMMENT '文件大小',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '下载链接地址',
  `is-delete` tinyint(1) NULL DEFAULT 0 COMMENT '是否删除',
  `enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否禁用链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_file
-- ----------------------------
INSERT INTO `sys_file` VALUES (1, '0261王得燕.jpg', 'jpg', 40875, 'http://localhost:8084/file/e8a51459411d4a32b0417dd59b4b5106.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (2, 'cs.jpg', 'jpg', 17805, 'http://localhost:8084/file/a2d19a185cfd4b7da6fcdf6cefaec7d6.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (3, 'cs.jpg', 'jpg', 17805, 'http://localhost:8084/file/0862a74500af44f7a80d7e217a21ba11.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (4, '111.jpg', 'jpg', 40875, 'http://10.50.78.186:8084/file/ba33008e63a74098ab9571a01e5376dc.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (5, '111.jpg', 'jpg', 40875, 'http://10.50.78.186:8084/file/11c35000e9364c22a3680cb03c146e49.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (6, '444.jpg', 'jpg', 40875, 'http://10.50.78.186:8084/file/2aaeb27715304138a428a6512e22500f.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (7, '555.jpg', 'jpg', 40875, 'http://10.50.78.186:8084/file/f4c6e0a15b9342ee99796e5dbbfaaad7.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (8, '444.jpg', 'jpg', 40875, 'http://10.50.78.186:8084/file/65cede146752454491b0dc71103ca949.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (9, '444.jpg', 'jpg', 40875, 'http://192.168.0.203:8084/file/933d026ab2474e16b94ca28aa8d70e9e.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (10, '教学能力获奖.jpg', 'jpg', 51052, 'http://192.168.0.203:8084/file/afbd9eac06d541dc91b2b2d0d4ef205e.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (11, '教学能力获奖.jpg', 'jpg', 51052, 'http://192.168.0.203:8084/file/574c4218d959488187bf7a72f356480e.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (12, '555.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/18d2515760774deab60b08fdccccdabc.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (13, '444.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/f640866ab66948d7b668bcf6eaaa4c4f.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (14, '444.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/2aff011cffc642d68f77a459df10e7d7.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (15, '444.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/2d177a85f0ff408496a5e50c3ce78845.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (16, '555.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/f11db7ce558642bf8e4bbdb0f2dddf9e.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (17, '444.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/265108e3881d49d8972f170878ff815d.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (18, '555.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/69bd1a2747fb4720a9133dd2424c832a.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (19, '444.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/a1cf696c6dad40b099fc84b88ae4384b.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (20, '555.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/1fd2eadb3d2141f88710891a7b73421b.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (21, '444.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/3d1d7c6e791046138cbbb0730a1d5d39.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (22, '574c4218d959488187bf7a72f356480e.jpg', 'jpg', 51052, 'http://10.50.181.51:8084/file/9181eda2f3f24046aa9f1194146e77af.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (23, '2aff011cffc642d68f77a459df10e7d7.jpg', 'jpg', 40875, 'http://10.50.181.51:8084/file/42973e2ed7d64ba1b38d43558e7a9bc7.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (24, '2018国家精品在线开放课程证书.jpg', 'jpg', 1011231, 'http://10.50.181.51:8084/file/56719597f3df4ac6b92f8d9dd21d46d9.jpg', 0, 1);
INSERT INTO `sys_file` VALUES (25, '2018国家精品在线开放课程证书.jpg', 'jpg', 1011231, 'http://10.50.181.51:8084/file/10c07715138d4dcc925897d2359aafd9.jpg', 0, 1);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '视图路径',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '图标',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '描述',
  `pid` int(11) NULL DEFAULT NULL COMMENT '父级菜单',
  `page_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '页面路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '主页', '/home', 'el-icon-house', '主页', NULL, 'Home');
INSERT INTO `sys_menu` VALUES (2, '系统管理', NULL, 'el-icon-s-grid', '系统管理', NULL, 'User');
INSERT INTO `sys_menu` VALUES (3, '用户管理', '/user', 'el-icon-user', '用户管理', 2, 'User');
INSERT INTO `sys_menu` VALUES (4, '角色管理', '/role', 'el-icon-s-custom', '角色管理', 2, 'Role');
INSERT INTO `sys_menu` VALUES (5, '菜单管理', '/menu', 'el-icon-menu', '菜单管理', 2, 'Menu');
INSERT INTO `sys_menu` VALUES (6, '新闻动态', '/news', 'el-icon-news', '新闻动态', NULL, 'News');
INSERT INTO `sys_menu` VALUES (7, '最新公告', '', 'el-icon-s-release', '最新公告', NULL, NULL);
INSERT INTO `sys_menu` VALUES (8, '采购中心', '', 'el-icon-shopping-cart-1', NULL, NULL, 'MenuTwo');
INSERT INTO `sys_menu` VALUES (9, '采购订单', '/po', 'el-icon-edit', '采购订单', 8, 'MenuThree');
INSERT INTO `sys_menu` VALUES (10, '材料库存', '/stock', 'el-icon-s-grid', '材料库存', 8, 'MenuFour');
INSERT INTO `sys_menu` VALUES (11, '材料领用', '/inout', 'el-icon-edit', '业务材料领用', 8, 'BusiNess');
INSERT INTO `sys_menu` VALUES (12, '测试一级菜单1', NULL, 'el-icon-notebook-2', '测试一级菜单', NULL, NULL);
INSERT INTO `sys_menu` VALUES (13, '测试二级菜单11', '/test11', '\r\nel-icon-document-copy', '测试二级菜单11', 12, 'Test1');
INSERT INTO `sys_menu` VALUES (14, '测试二级菜单12', '/test12', '\r\nel-icon-document-copy', '测试二级菜单22', 12, 'Test2');
INSERT INTO `sys_menu` VALUES (15, '测试一级菜单2', NULL, 'el-icon-s-grid', '测试一级菜单', NULL, '/ceshi0309');
INSERT INTO `sys_menu` VALUES (16, '测试二级菜单21', '/test21', '\r\nel-icon-document-copy', '测试二级菜单', 15, NULL);
INSERT INTO `sys_menu` VALUES (17, '测试二级菜单22', '/test22', '\r\nel-icon-document-copy', '测试二级菜单', 15, 'test0409');
INSERT INTO `sys_menu` VALUES (18, '测试一级菜单3', NULL, 'el-icon-notebook-2', '测试一级菜单3', NULL, NULL);
INSERT INTO `sys_menu` VALUES (19, '测试二级菜单31', '/test31', '\r\nel-icon-document-copy', '测试二级菜单31', 18, 'Test31');
INSERT INTO `sys_menu` VALUES (20, '测试二级菜单32', '/test32', '\r\nel-icon-document-copy', '测试二级菜单32', 18, 'Test32');
INSERT INTO `sys_menu` VALUES (21, '测试一级菜单4', NULL, 'el-icon-notebook-2', '测试一级菜单4', NULL, NULL);
INSERT INTO `sys_menu` VALUES (22, '测试二级菜单41', '/test41', 'el-icon-edit', '测试二级菜单41', 21, 'Test41');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '概述',
  `flag` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '唯一标识',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (2, '普通用户', '普通用户', 'ROLE_USER');
INSERT INTO `sys_role` VALUES (3, '超级管理员', '管理员', 'ROLE_ADMIN');
INSERT INTO `sys_role` VALUES (4, '一般管理员', '一般管理员', 'ROLE_LEADER');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色菜单关系表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 16);
INSERT INTO `sys_role_menu` VALUES (2, 15);
INSERT INTO `sys_role_menu` VALUES (3, 1);
INSERT INTO `sys_role_menu` VALUES (3, 2);
INSERT INTO `sys_role_menu` VALUES (3, 3);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 5);
INSERT INTO `sys_role_menu` VALUES (3, 6);
INSERT INTO `sys_role_menu` VALUES (3, 7);
INSERT INTO `sys_role_menu` VALUES (3, 8);
INSERT INTO `sys_role_menu` VALUES (3, 9);
INSERT INTO `sys_role_menu` VALUES (3, 10);
INSERT INTO `sys_role_menu` VALUES (3, 11);
INSERT INTO `sys_role_menu` VALUES (3, 12);
INSERT INTO `sys_role_menu` VALUES (3, 13);
INSERT INTO `sys_role_menu` VALUES (3, 14);
INSERT INTO `sys_role_menu` VALUES (3, 15);
INSERT INTO `sys_role_menu` VALUES (3, 16);
INSERT INTO `sys_role_menu` VALUES (3, 17);
INSERT INTO `sys_role_menu` VALUES (3, 18);
INSERT INTO `sys_role_menu` VALUES (3, 19);
INSERT INTO `sys_role_menu` VALUES (3, 20);
INSERT INTO `sys_role_menu` VALUES (3, 21);
INSERT INTO `sys_role_menu` VALUES (3, 22);

-- ----------------------------
-- Table structure for zmt_user
-- ----------------------------
DROP TABLE IF EXISTS `zmt_user`;
CREATE TABLE `zmt_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码\r\n',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `nickname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地址',
  `created_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `avatar` varchar(155) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1353682946 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of zmt_user
-- ----------------------------
INSERT INTO `zmt_user` VALUES (6, 'admin', '123456', '测试6@qq.com', '12345678901', '管理员', '红山花园', '2022-01-13 00:00:00', 'http://10.50.181.51:8084/file/10c07715138d4dcc925897d2359aafd9.jpg', 'ROLE_ADMIN');
INSERT INTO `zmt_user` VALUES (12, '测试2025', '123456', '测试12@qq.com', '12345678901', 'ceshi', '红山花园', '2022-06-14 00:00:00', NULL, 'ROLE_ADMIN');
INSERT INTO `zmt_user` VALUES (18, '测试18', '123456', '测试5@qq.com', '12345678901', 'ceshi', '红山花园', '2022-08-19 00:00:00', NULL, 'ROLE_USER');
INSERT INTO `zmt_user` VALUES (19, '测试19', '123456', '测试6@qq.com', '12345678901', 'ceshi', '红山花园', '2022-09-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (20, '测试20', '123456', '测试7@qq.com', '12345678901', 'ceshi', '红山花园', '2022-09-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (21, '测试21', '123456', '测试8@qq.com', '12345678901', 'ceshi', '红山花园', '2022-09-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (22, '测试22', '123456', '测试9@qq.com', '12345678901', 'ceshi', '红山花园', '2022-09-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (23, '测试23', '123456', '测试10@qq.com', '12345678901', 'ceshi', '红山花园', '2022-10-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (24, '测试24', '123456', '测试11@qq.com', '12345678901', 'ceshi', '红山花园', '2022-10-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (25, '测试25', '123456', '测试12@qq.com', '12345678901', 'ceshi', '红山花园', '2022-10-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (26, '测试26', '123456', '测试13@qq.com', '12345678901', 'ceshi', '红山花园', '2022-11-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (27, '测试27', '123456', '测试14@qq.com', '12345678901', 'ceshi', '红山花园', '2022-11-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (28, '测试28', '123456', '测试15@qq.com', '12345678901', 'ceshi', '红山花园', '2022-12-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (29, '测试29', '123456', '测试16@qq.com', '12345678901', 'ceshi', '红山花园', '2022-12-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (30, '测试30', '', '测试17@qq.com', '123456789012', 'ceshi', '红山花园', '2022-12-19 16:28:41', NULL, NULL);
INSERT INTO `zmt_user` VALUES (31, '测试31', '123456', '测试31@qq.com', '12345678901', 'ceshi', '红山花园', '2022-12-22 11:05:20', NULL, NULL);
INSERT INTO `zmt_user` VALUES (32, '测试32', '123456', '测试32@qq.com', '12345678901', 'ceshi', '红山花园', '2022-12-22 11:05:20', NULL, NULL);
INSERT INTO `zmt_user` VALUES (53, 'test20250403', NULL, 'test@qq.com', '13405762608', 'test20250403', '红山花园', '2025-04-03 14:04:28', NULL, NULL);
INSERT INTO `zmt_user` VALUES (54, '测试33', '123456', '0303405@qq.com', '12345678901', '测试33', 'Room 1902，Jiangsu, China', '2025-04-30 10:11:12', NULL, 'ROLE_USER');
INSERT INTO `zmt_user` VALUES (55, 'test0504', '$2a$10$deqZQAjWyRZxc349T0uMp.zFAqV6vfHHobsy0YX6o.GstKYQv9c.W', 'wangdy@wxit.edu.cn', '13405762608', '测试0504', '江苏省', '2025-05-04 12:05:46', NULL, 'ROLE_ADMIN');

SET FOREIGN_KEY_CHECKS = 1;


-- ============================================================
-- 以下为校验语句（WorkBuddy 追加）
-- ============================================================
SELECT COUNT(*) AS '记录总数' FROM `zmt_user`;
SELECT `id`, `username`, `password`, `email`, `phone`, `nickname`, `address` FROM `zmt_user` LIMIT 5;
SHOW TABLES;
