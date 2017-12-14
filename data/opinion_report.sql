/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50709
 Source Host           : localhost:3306
 Source Schema         : opinion_report

 Target Server Type    : MySQL
 Target Server Version : 50709
 File Encoding         : 65001

 Date: 14/12/2017 17:37:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_city_organization
-- ----------------------------
DROP TABLE IF EXISTS `t_city_organization`;
CREATE TABLE `t_city_organization`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '行政代码\r\n',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `p_id` bigint(20) NOT NULL COMMENT '父id',
  `level` int(11) NOT NULL COMMENT '城市等级 0 全部， 1 省级 2 市级 3 县级',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省市区组织信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_city_organization
-- ----------------------------
INSERT INTO `t_city_organization` VALUES (1, 'root', '全国组织结构', 0, 0);

-- ----------------------------
-- Table structure for t_city_organization_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_city_organization_sys_user`;
CREATE TABLE `t_city_organization_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_organization_id` bigint(20) NOT NULL COMMENT '省市区组织id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_city_organization_sys_user
-- ----------------------------
INSERT INTO `t_city_organization_sys_user` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for t_image_info
-- ----------------------------
DROP TABLE IF EXISTS `t_image_info`;
CREATE TABLE `t_image_info`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件路径',
  `file_size` double NOT NULL COMMENT '文件大小',
  `file_md5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件md5',
  `full_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存在服务器的名称',
  `original_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原名称 带后缀',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原名称',
  `suffix_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后缀名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_issued_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_issued_notice`;
CREATE TABLE `t_issued_notice`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notice_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知编号',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知标题',
  `publish_datetime` datetime(0) NOT NULL COMMENT '发布时间',
  `notice_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知类型 重要通知 ：importantNotice 工作安排 :workArrangement 工作建议 :workSuggestion 其他：other',
  `notice_range` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '下发范围 municipal：市级  county 县级  all 全部',
  `notice_content` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知内容\r\n',
  `receipt_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回执状态 unreceipt:未回执,receipt:以回执 receipting:中回执中',
  `receipt_datetime` datetime(0) DEFAULT NULL COMMENT '回执时间',
  `created_date` date DEFAULT NULL COMMENT '创建日期',
  `created_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `created_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `modified_date` date NOT NULL COMMENT '修改日期',
  `modified_datetime` datetime(0) NOT NULL COMMENT '修改时间',
  `modified_user_id` bigint(20) NOT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_issued_notice_log
-- ----------------------------
DROP TABLE IF EXISTS `t_issued_notice_log`;
CREATE TABLE `t_issued_notice_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notice_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通知编号',
  `receipt_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'unread:未读，read:已读 ,receipt:回执',
  `receipt_datetime` datetime(0) DEFAULT NULL COMMENT '回执时间',
  `receipt_user_id` bigint(20) NOT NULL COMMENT '回执人id',
  `created_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `created_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `created_date` date NOT NULL,
  `receipt_date` date DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_report_article
-- ----------------------------
DROP TABLE IF EXISTS `t_report_article`;
CREATE TABLE `t_report_article`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报编号\r\n',
  `report_source` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报来源 artificial:人工上报，machine:机器上报\r\n\r\n',
  `report_level` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报等级 red：红色，orange：橙色，yellow：黄色\r\n',
  `source_url` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '来源地址',
  `source_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '来源类型 网络：network 媒体 ： media 现场 scene 其他 other',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `publish_datetime` datetime(0) NOT NULL COMMENT '发布时间',
  `reply_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '回复类型 点击 click，评论comment  预估值 estimate',
  `reply_number` int(11) NOT NULL COMMENT '回复数',
  `report_cause` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报原因',
  `adopt_datetime` datetime(0) DEFAULT NULL COMMENT '采纳时间',
  `adopt_user_id` bigint(20) DEFAULT NULL COMMENT '采纳人id',
  `adopt_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'adopt:已采纳 notAdopted未采纳，report:已上报\r\n',
  `adopt_opinion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '采纳意见',
  `expire_date` date NOT NULL COMMENT '到期日期',
  `created_date` date NOT NULL COMMENT '创建日期',
  `created_datetime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `modified_date` date NOT NULL COMMENT '修改日期',
  `modified_datetime` datetime(0) NOT NULL COMMENT '修改时间',
  `modified_user_id` bigint(20) NOT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上报文章表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_report_article_log
-- ----------------------------
DROP TABLE IF EXISTS `t_report_article_log`;
CREATE TABLE `t_report_article_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报编号\r\n',
  `adopt_datetime` datetime(0) DEFAULT NULL COMMENT '采纳时间',
  `adopt_user_id` bigint(20) DEFAULT NULL COMMENT '采纳人id',
  `adopt_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'adopt:采纳，report:已上报',
  `adopt_opinion` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '采纳意见',
  `created_datetime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `created_date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上报文章表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_message
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_message`;
CREATE TABLE `t_sys_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation_user_id` bigint(20) NOT NULL COMMENT '关联人id',
  `title` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `adopt_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '舆情状态',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'url',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 unread:未读，read:已读',
  `publish_date` date NOT NULL COMMENT '创建时间',
  `publish_datetime` datetime(0) NOT NULL COMMENT '创建人id',
  `publish_user_id` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_permission`;
CREATE TABLE `t_sys_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT 'url地址\r\n',
  `url_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'url名称',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'display：显示权限   operation 操作权限',
  `describe` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '描述描述',
  `sn` int(11) NOT NULL DEFAULT 1 COMMENT '标示',
  `parent_id` bigint(20) NOT NULL DEFAULT 1 COMMENT '父id',
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_permission
-- ----------------------------
INSERT INTO `t_sys_permission` VALUES (1, '', '基层舆情上报系统', 'display', '基层舆情上报系统', 1, 0, '001', '');
INSERT INTO `t_sys_permission` VALUES (2, '/index', '舆情工作台', 'display', '舆情工作台', 1, 1, '002', 'icon');
INSERT INTO `t_sys_permission` VALUES (3, '', '舆情上报', 'display', '舆情上报', 2, 1, '003', 'icon icon2');
INSERT INTO `t_sys_permission` VALUES (4, '', '信息下发', 'display', '信息下发', 3, 1, '004', 'icon icon3');
INSERT INTO `t_sys_permission` VALUES (5, '', '数据统计', 'display', '数据统计', 4, 1, '005', 'icon icon4');
INSERT INTO `t_sys_permission` VALUES (6, '', '系统管理', 'display', '系统管理', 5, 1, '006', 'icon icon5');
INSERT INTO `t_sys_permission` VALUES (7, '/reportArticle/opinionReportListPage', '舆情上报', 'display', '上报文章页面', 1, 3, '007', NULL);
INSERT INTO `t_sys_permission` VALUES (8, '/reportArticle/opinionReportExamineListPage', '舆情审核', 'display', '上报文章页面(审核)', 1, 3, '008', NULL);
INSERT INTO `t_sys_permission` VALUES (9, '/issuedNotice/issuedNoticeSendPage', '信息下发', 'display', '通知下传（发出）页面', 1, 4, '009', NULL);
INSERT INTO `t_sys_permission` VALUES (10, '/issuedNotice/issuedNoticeReceivePage', '信息接收', 'display', '通知下传（接收）页面', 2, 4, '010', NULL);
INSERT INTO `t_sys_permission` VALUES (11, '/dataStatistics/dataStatisticsPage', '数据统计', 'display', '数据统计页面', 1, 5, '011', NULL);
INSERT INTO `t_sys_permission` VALUES (12, '/system/organizationStructurePage', '组织机构', 'display', '组织机构页面', 1, 6, '012', NULL);
INSERT INTO `t_sys_permission` VALUES (13, '/system/roleManagementPage', '角色管理', 'display', '角色管理页面', 2, 6, '013', NULL);
INSERT INTO `t_sys_permission` VALUES (14, NULL, '上报舆情', 'operation', '上报舆情操作', 1, 7, '007001', NULL);
INSERT INTO `t_sys_permission` VALUES (15, NULL, '下发信息', 'operation', '下发信息操作', 1, 9, '009001', NULL);

-- ----------------------------
-- Table structure for t_sys_permission_init
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_permission_init`;
CREATE TABLE `t_sys_permission_init`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sys_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `permission_init` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_permission_init
-- ----------------------------
INSERT INTO `t_sys_permission_init` VALUES (1, '/', 'user', 1);
INSERT INTO `t_sys_permission_init` VALUES (2, '/css/**', 'anon', 1);
INSERT INTO `t_sys_permission_init` VALUES (3, '/js/**', 'anon', 1);
INSERT INTO `t_sys_permission_init` VALUES (4, '/common/**', 'anon', 1);
INSERT INTO `t_sys_permission_init` VALUES (5, '/lib/**', 'anon', 1);
INSERT INTO `t_sys_permission_init` VALUES (6, '/assets/**', 'anon', 1);
INSERT INTO `t_sys_permission_init` VALUES (7, '/fonts/**', 'anon', 1);
INSERT INTO `t_sys_permission_init` VALUES (8, '/ajaxLogin', 'anon', 2);
INSERT INTO `t_sys_permission_init` VALUES (9, '/getGifCode', 'anon', 2);
INSERT INTO `t_sys_permission_init` VALUES (10, '/kickout', 'anon', 2);
INSERT INTO `t_sys_permission_init` VALUES (11, '/logout', 'logout', 3);
INSERT INTO `t_sys_permission_init` VALUES (12, '/reportArticle/**', 'authc', 4);
INSERT INTO `t_sys_permission_init` VALUES (13, '/issuedNotice/**', 'authc', 4);
INSERT INTO `t_sys_permission_init` VALUES (14, '/dataStatistics/**', 'authc', 4);
INSERT INTO `t_sys_permission_init` VALUES (15, '/system/**', 'authc', 4);
INSERT INTO `t_sys_permission_init` VALUES (16, '/**', 'authc', 5);
INSERT INTO `t_sys_permission_init` VALUES (17, '/wangEditor/**', 'authc', 4);
INSERT INTO `t_sys_permission_init` VALUES (18, '/index/**', 'authc', 4);

-- ----------------------------
-- Table structure for t_sys_role
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role`;
CREATE TABLE `t_sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ' admin 超级系统管理员 operation操作员',
  `created_date` date NOT NULL COMMENT '创建日期',
  `created_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `created_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `modified_date` date NOT NULL,
  `modified_datetime` datetime(0) NOT NULL COMMENT '修改时间',
  `modified_user_id` bigint(20) NOT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES (1, '超级管理员', 'admin', '2017-11-16', '2017-11-16 09:09:48', 1, '2017-11-16', '2017-11-16 09:09:51', 1);

-- ----------------------------
-- Table structure for t_sys_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_permission`;
CREATE TABLE `t_sys_role_permission`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  `permission_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role_permission
-- ----------------------------
INSERT INTO `t_sys_role_permission` VALUES (1, 1, 1, '001');
INSERT INTO `t_sys_role_permission` VALUES (2, 2, 1, '002');
INSERT INTO `t_sys_role_permission` VALUES (3, 3, 1, '003');
INSERT INTO `t_sys_role_permission` VALUES (4, 4, 1, '004');
INSERT INTO `t_sys_role_permission` VALUES (5, 5, 1, '005');
INSERT INTO `t_sys_role_permission` VALUES (6, 6, 1, '006');
INSERT INTO `t_sys_role_permission` VALUES (7, 7, 1, '007');
INSERT INTO `t_sys_role_permission` VALUES (8, 8, 1, '008');
INSERT INTO `t_sys_role_permission` VALUES (9, 9, 1, '009');
INSERT INTO `t_sys_role_permission` VALUES (10, 10, 1, '010');
INSERT INTO `t_sys_role_permission` VALUES (11, 11, 1, '011');
INSERT INTO `t_sys_role_permission` VALUES (12, 12, 1, '012');
INSERT INTO `t_sys_role_permission` VALUES (13, 13, 1, '013');
INSERT INTO `t_sys_role_permission` VALUES (14, 14, 1, '007001');
INSERT INTO `t_sys_role_permission` VALUES (15, 15, 1, '009001');

-- ----------------------------
-- Table structure for t_sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_user`;
CREATE TABLE `t_sys_role_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role_user
-- ----------------------------
INSERT INTO `t_sys_role_user` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_account` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账户',
  `user_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `user_password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `last_login_time` datetime(0) NOT NULL COMMENT '最后登录时间',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'effective:有效，invalid:无效',
  `created_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `created_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `modified_datetime` datetime(0) NOT NULL COMMENT '修改时间',
  `modified_user_id` bigint(20) NOT NULL COMMENT '修改人id',
  `created_date` date NOT NULL,
  `modified_date` date NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (1, 'admin', '超级管理员', '0', 'cmjMu3jLmu/VRSh4jUUJSQ==', '2017-11-27 14:18:35', 'effective', '2017-11-17 09:04:59', 1, '2017-11-17 09:04:59', 1, '2017-11-17', '2017-11-17');

SET FOREIGN_KEY_CHECKS = 1;
