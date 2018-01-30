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

 Date: 30/01/2018 15:31:25
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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '省市区组织信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_city_organization
-- ----------------------------
INSERT INTO `t_city_organization` VALUES (1, 'root', '全国组织结构', 0, 0);
INSERT INTO `t_city_organization` VALUES (2, NULL, '北京', 1, 1);
INSERT INTO `t_city_organization` VALUES (3, NULL, '昌平区', 2, 2);
INSERT INTO `t_city_organization` VALUES (4, NULL, '生命科技园', 3, 3);

-- ----------------------------
-- Table structure for t_city_organization_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_city_organization_sys_user`;
CREATE TABLE `t_city_organization_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_organization_id` bigint(20) NOT NULL COMMENT '省市区组织id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_city_organization_sys_user
-- ----------------------------
INSERT INTO `t_city_organization_sys_user` VALUES (1, 1, 1);
INSERT INTO `t_city_organization_sys_user` VALUES (2, 2, 2);
INSERT INTO `t_city_organization_sys_user` VALUES (3, 3, 3);
INSERT INTO `t_city_organization_sys_user` VALUES (4, 4, 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_image_info
-- ----------------------------
INSERT INTO `t_image_info` VALUES (1, 'D:\\IdeaProjects\\Opinion-Report\\image\\c99380ae-316f-44b9-9b33-cbee796a1054.jpg', 0.26, 'df9d688abf4b843b9738c0d876a5f227', 'c99380ae-316f-44b9-9b33-cbee796a1054.jpg', '275412-106.jpg', '275412-106', 'jpg');
INSERT INTO `t_image_info` VALUES (2, 'D:\\IdeaProjects\\Opinion-Report\\image\\22f24781-b658-4a88-9f25-2c578155edbd.jpg', 0.16, 'c1d42ed348d240524a1aa8679e589fb2', '22f24781-b658-4a88-9f25-2c578155edbd.jpg', '275440-106.jpg', '275440-106', 'jpg');
INSERT INTO `t_image_info` VALUES (3, 'D:\\IdeaProjects\\Opinion-Report\\image\\8125aa57-79ab-4906-ad73-824b398a482c.jpg', 0.26, 'df9d688abf4b843b9738c0d876a5f227', '8125aa57-79ab-4906-ad73-824b398a482c.jpg', '275412-106.jpg', '275412-106', 'jpg');
INSERT INTO `t_image_info` VALUES (4, 'D:\\IdeaProjects\\Opinion-Report\\image\\bbb1a7bf-9a6a-4bc3-a727-00c6a8703ec4.jpg', 0.16, 'c1d42ed348d240524a1aa8679e589fb2', 'bbb1a7bf-9a6a-4bc3-a727-00c6a8703ec4.jpg', '275440-106.jpg', '275440-106', 'jpg');
INSERT INTO `t_image_info` VALUES (5, 'D:\\IdeaProjects\\Opinion-Report\\image\\7d60a0f5-d18d-4b7d-b396-59431bc10fe5.jpg', 0.25, '0cb5e9e2d34792b6e04ebe6147119cf4', '7d60a0f5-d18d-4b7d-b396-59431bc10fe5.jpg', '275571-106.jpg', '275571-106', 'jpg');
INSERT INTO `t_image_info` VALUES (6, 'D:\\IdeaProjects\\Opinion-Report\\image\\8b4dd059-0bfb-45c6-90bd-b4eee094159c.jpg', 0.26, 'df9d688abf4b843b9738c0d876a5f227', '8b4dd059-0bfb-45c6-90bd-b4eee094159c.jpg', '275412-106.jpg', '275412-106', 'jpg');
INSERT INTO `t_image_info` VALUES (7, 'D:\\IdeaProjects\\Opinion-Report\\image\\35010b0e-1777-4f78-af1c-8599ce471503.jpg', 0.16, 'c1d42ed348d240524a1aa8679e589fb2', '35010b0e-1777-4f78-af1c-8599ce471503.jpg', '275440-106.jpg', '275440-106', 'jpg');
INSERT INTO `t_image_info` VALUES (8, 'D:\\IdeaProjects\\Opinion-Report\\image\\d6e756a5-1f0b-4d28-9ae5-b9c36f98b60d.png', 0.24, '9136512d9a1308e1b0ae5364a85b9293', 'd6e756a5-1f0b-4d28-9ae5-b9c36f98b60d.png', 'QQ截图20171016145501.png', 'QQ截图20171016145501', 'png');
INSERT INTO `t_image_info` VALUES (9, 'D:\\IdeaProjects\\Opinion-Report\\image\\0d6643cf-9293-49b0-8f24-ddc249d0a477.jpg', 0.26, 'df9d688abf4b843b9738c0d876a5f227', '0d6643cf-9293-49b0-8f24-ddc249d0a477.jpg', '275412-106.jpg', '275412-106', 'jpg');
INSERT INTO `t_image_info` VALUES (10, 'D:\\IdeaProjects\\Opinion-Report\\image\\725b7123-ad01-40f1-add5-2b4a21b20d57.jpg', 0.16, 'c1d42ed348d240524a1aa8679e589fb2', '725b7123-ad01-40f1-add5-2b4a21b20d57.jpg', '275440-106.jpg', '275440-106', 'jpg');
INSERT INTO `t_image_info` VALUES (11, 'D:\\IdeaProjects\\Opinion-Report\\image\\670a4166-e87d-43be-bc3b-ef1f3b6874f5.jpg', 0.26, 'df9d688abf4b843b9738c0d876a5f227', '670a4166-e87d-43be-bc3b-ef1f3b6874f5.jpg', '275412-106.jpg', '275412-106', 'jpg');
INSERT INTO `t_image_info` VALUES (12, 'D:\\IdeaProjects\\Opinion-Report\\image\\261e3cd3-7eb7-4492-9ae0-c340c6b65b1c.jpg', 0.16, 'c1d42ed348d240524a1aa8679e589fb2', '261e3cd3-7eb7-4492-9ae0-c340c6b65b1c.jpg', '275440-106.jpg', '275440-106', 'jpg');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_issued_notice
-- ----------------------------
INSERT INTO `t_issued_notice` VALUES (1, '1609b0135d00007', '我下发的全部信息', '2017-12-28 10:43:56', 'workArrangement', 'all', '<p>我下发的通知类型为工作安排的演示</p>', 'unreceipt', NULL, '2017-12-28', '2017-12-28 10:43:56', 2, '2017-12-28', '2017-12-28 10:43:56', 2);
INSERT INTO `t_issued_notice` VALUES (2, '1609b01a0c70008', '我下发市级信息', '2017-12-28 10:44:23', 'importantNotice', 'municipal', '<p>我下发市级重要通知</p>', 'receipt', '2017-12-28 10:46:24', '2017-12-28', '2017-12-28 10:44:23', 2, '2017-12-28', '2017-12-28 10:44:23', 2);
INSERT INTO `t_issued_notice` VALUES (3, '1609b0226550009', '区市级信息下发', '2017-12-28 10:44:58', 'workArrangement', 'county', '<p>区市级通知工作安排</p>', 'unreceipt', NULL, '2017-12-28', '2017-12-28 10:44:58', 2, '2017-12-28', '2017-12-28 10:44:58', 2);
INSERT INTO `t_issued_notice` VALUES (4, '1609b04242a000a', '我下发区县级通知 我是市级用户', '2017-12-28 10:47:08', 'importantNotice', 'county', '<p>我的下发区县级通知</p>', 'receipt', '2017-12-28 10:48:30', '2017-12-28', '2017-12-28 10:47:08', 3, '2017-12-28', '2017-12-28 10:47:08', 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_issued_notice_log
-- ----------------------------
INSERT INTO `t_issued_notice_log` VALUES (1, '1609b0135d00007', 'unread', NULL, 3, '2017-12-28 10:43:56', 2, '2017-12-28', NULL);
INSERT INTO `t_issued_notice_log` VALUES (2, '1609b0135d00007', 'unread', NULL, 4, '2017-12-28 10:43:56', 2, '2017-12-28', NULL);
INSERT INTO `t_issued_notice_log` VALUES (3, '1609b01a0c70008', 'receipt', '2017-12-28 10:46:24', 3, '2017-12-28 10:44:23', 2, '2017-12-28', '2017-12-28');
INSERT INTO `t_issued_notice_log` VALUES (4, '1609b0226550009', 'unread', NULL, 4, '2017-12-28 10:44:58', 2, '2017-12-28', NULL);
INSERT INTO `t_issued_notice_log` VALUES (5, '1609b04242a000a', 'receipt', '2017-12-28 10:48:30', 4, '2017-12-28 10:47:08', 3, '2017-12-28', '2017-12-28');

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
  `adopt_opinion` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '采纳意见',
  `expire_date` date NOT NULL COMMENT '到期日期',
  `created_date` date NOT NULL COMMENT '创建日期',
  `created_datetime` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `created_user_id` bigint(20) NOT NULL COMMENT '创建人id',
  `modified_date` date NOT NULL COMMENT '修改日期',
  `modified_datetime` datetime(0) NOT NULL COMMENT '修改时间',
  `modified_user_id` bigint(20) NOT NULL COMMENT '修改人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上报文章表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_report_article
-- ----------------------------
INSERT INTO `t_report_article` VALUES (1, '1609af1d27e0001', 'artificial', '1orange', '', 'network', '这是我的舆情标题', '2017-12-28 10:27:08', 'click', 123, '<p>这是我的县级上报舆情内容<img src=\"/wangEditor/show/6\" style=\"color:rgb(134, 142, 154); max-width:30%;\"><img src=\"/wangEditor/show/7\" style=\"color:rgb(134, 142, 154); max-width:30%;\"></p>', '2017-12-28 10:29:27', 3, 'notAdopted', '我不同意这个舆情上报', '2018-01-03', '2017-12-28', '2017-12-28 10:27:08', 4, '2017-12-28', '2017-12-28 10:27:08', 4);
INSERT INTO `t_report_article` VALUES (2, '1609af420140002', 'artificial', '1orange', '', 'network', '这是我的舆情标题', '2017-12-28 10:29:38', 'click', 123, '<p>这是我的县级上报舆情内容<img src=\"/wangEditor/show/6\" style=\"color:rgb(134, 142, 154); max-width:30%;\"><img src=\"/wangEditor/show/7\" style=\"color:rgb(134, 142, 154); max-width:30%;\"></p>', '2018-01-03 23:00:01', 3, 'notAdopted', '系统自动关闭', '2018-01-03', '2017-12-28', '2017-12-28 10:29:38', 3, '2017-12-28', '2017-12-28 10:29:38', 3);
INSERT INTO `t_report_article` VALUES (3, '1609af543e00003', 'artificial', '1orange', 'http://www.baidu.com', 'media', '这是我市级上报的', '2017-12-28 10:30:53', 'click', 123, '<p>这是我的舆情内容<img src=\"/wangEditor/show/8\" style=\"color:rgb(134, 142, 154); max-width:30%;\"></p>', '2018-01-03 23:00:00', 3, 'notAdopted', '系统自动关闭', '2018-01-03', '2017-12-28', '2017-12-28 10:30:53', 3, '2017-12-28', '2017-12-28 10:30:53', 3);
INSERT INTO `t_report_article` VALUES (4, '1609afa3cbf0004', 'artificial', '1orange', 'http://www.baidu.com', 'media', '我的舆情标题演示', '2017-12-28 10:36:19', 'click', 123, '<p>这是我的舆情内容<img src=\"/wangEditor/show/9\" style=\"color:rgb(134, 142, 154); max-width:30%;\"><img src=\"/wangEditor/show/10\" style=\"color:rgb(134, 142, 154); max-width:30%;\"></p>', '2017-12-28 10:40:35', 3, 'adopt', '我采纳了你的信息', '2018-01-03', '2017-12-28', '2017-12-28 10:36:19', 4, '2017-12-28', '2017-12-28 10:36:19', 4);
INSERT INTO `t_report_article` VALUES (5, '1609afd85af0005', 'artificial', '0yellow', '', 'media', '我再次上报舆情标题', '2017-12-28 10:39:54', 'click', 123, '<p>我的舆情内容</p>', '2018-01-03 23:00:01', 3, 'notAdopted', '系统自动关闭', '2018-01-03', '2017-12-28', '2017-12-28 10:39:54', 3, '2017-12-28', '2017-12-28 10:39:54', 3);
INSERT INTO `t_report_article` VALUES (6, '1609afe36ff0006', 'artificial', '1orange', 'http://www.baidu.com', 'media', '我的舆情标题演示', '2017-12-28 10:40:40', 'click', 123, '<p>这是我的舆情内容<img src=\"/wangEditor/show/9\" style=\"color:rgb(134, 142, 154); max-width:30%;\"><img src=\"/wangEditor/show/10\" style=\"color:rgb(134, 142, 154); max-width:30%;\"></p>', '2017-12-28 10:42:21', 2, 'notAdopted', '不采纳', '2018-01-03', '2017-12-28', '2017-12-28 10:40:40', 3, '2017-12-28', '2017-12-28 10:40:40', 3);
INSERT INTO `t_report_article` VALUES (7, '160b4685b300001', 'artificial', '2red', '', 'media', '23424', '2018-01-02 09:07:06', 'click', 234, '<p>23424</p>', '2018-01-02 11:50:26', 3, 'adopt', '采纳了\n', '2018-01-08', '2018-01-02', '2018-01-02 09:07:06', 4, '2018-01-02', '2018-01-02 09:07:06', 4);
INSERT INTO `t_report_article` VALUES (8, '160b4fdec160001', 'artificial', '2red', '', 'media', '23424', '2018-01-02 11:50:28', 'click', 234, '<p>23424</p>', NULL, NULL, 'report', NULL, '2018-01-08', '2018-01-02', '2018-01-02 11:50:28', 3, '2018-01-02', '2018-01-02 11:50:28', 3);
INSERT INTO `t_report_article` VALUES (9, '160b4fe061c0002', 'artificial', '2red', '', 'media', '23424', '2018-01-02 11:50:35', 'click', 234, '<p>23424</p>', NULL, NULL, 'report', NULL, '2018-01-08', '2018-01-02', '2018-01-02 11:50:35', 3, '2018-01-02', '2018-01-02 11:50:35', 3);
INSERT INTO `t_report_article` VALUES (10, '161030810410001', 'artificial', '2red', '', 'network', 'fdsaf', '2018-01-17 15:31:56', 'click', 1111, '<p>范德萨发撒</p>', NULL, NULL, 'report', NULL, '2018-01-23', '2018-01-17', '2018-01-17 15:31:56', 3, '2018-01-17', '2018-01-17 15:31:56', 3);

-- ----------------------------
-- Table structure for t_report_article_file
-- ----------------------------
DROP TABLE IF EXISTS `t_report_article_file`;
CREATE TABLE `t_report_article_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `report_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报编号',
  `file_path` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件路径',
  `file_size` double NOT NULL COMMENT '文件大小',
  `file_md5` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件md5',
  `full_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存在服务器的名称',
  `original_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原名称 带后缀',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原名称',
  `suffix_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后缀名',
  `created_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `created_user_id` bigint(20) DEFAULT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_report_article_file
-- ----------------------------
INSERT INTO `t_report_article_file` VALUES (1, '1609af1d27e0001', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609af1d27e0001\\6300cdac-0639-4ba7-8584-41c1b2ef97be.docx', 0.01, 'd05d3518a6de973dce8647d858922f23', '6300cdac-0639-4ba7-8584-41c1b2ef97be.docx', '黄花青年.docx', '黄花青年', 'docx', '2017-12-28 10:27:08', 4);
INSERT INTO `t_report_article_file` VALUES (2, '1609af1d27e0001', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609af1d27e0001\\5eee47b6-71c4-4465-a8d3-8b30d6d5801e.mp3', 3.89, 'a02fed0fcabe8e07d306a7f6ba943f45', '5eee47b6-71c4-4465-a8d3-8b30d6d5801e.mp3', '叶炫清 - 风一样的我.mp3', '叶炫清 - 风一样的我', 'mp3', '2017-12-28 10:27:08', 4);
INSERT INTO `t_report_article_file` VALUES (3, '1609af420140002', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609af420140002\\6300cdac-0639-4ba7-8584-41c1b2ef97be.docx', 0.01, 'd05d3518a6de973dce8647d858922f23', '6300cdac-0639-4ba7-8584-41c1b2ef97be.docx', '黄花青年.docx', '黄花青年', 'docx', '2017-12-28 10:29:38', 3);
INSERT INTO `t_report_article_file` VALUES (4, '1609af420140002', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609af420140002\\5eee47b6-71c4-4465-a8d3-8b30d6d5801e.mp3', 3.89, 'a02fed0fcabe8e07d306a7f6ba943f45', '5eee47b6-71c4-4465-a8d3-8b30d6d5801e.mp3', '叶炫清 - 风一样的我.mp3', '叶炫清 - 风一样的我', 'mp3', '2017-12-28 10:29:38', 3);
INSERT INTO `t_report_article_file` VALUES (5, '1609af543e00003', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609af543e00003\\043ec1b5-a6fa-4f7a-8886-42cf8ca5d638.docx', 0.67, '424432b314ab81f8337fc9f012a6373c', '043ec1b5-a6fa-4f7a-8886-42cf8ca5d638.docx', '截图.docx', '截图', 'docx', '2017-12-28 10:30:53', 3);
INSERT INTO `t_report_article_file` VALUES (6, '1609afa3cbf0004', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609afa3cbf0004\\d0ddba5d-f5a8-4278-9384-7db7463943c4.docx', 0.01, 'd05d3518a6de973dce8647d858922f23', 'd0ddba5d-f5a8-4278-9384-7db7463943c4.docx', '黄花青年.docx', '黄花青年', 'docx', '2017-12-28 10:36:19', 4);
INSERT INTO `t_report_article_file` VALUES (7, '1609afa3cbf0004', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609afa3cbf0004\\644f3866-0b03-44f3-8cc7-9c4a79538deb.docx', 0.67, '424432b314ab81f8337fc9f012a6373c', '644f3866-0b03-44f3-8cc7-9c4a79538deb.docx', '截图.docx', '截图', 'docx', '2017-12-28 10:36:19', 4);
INSERT INTO `t_report_article_file` VALUES (8, '1609afd85af0005', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609afd85af0005\\6a19a245-3952-4dfd-a7bb-cabf75b43a0c.docx', 0.01, 'd05d3518a6de973dce8647d858922f23', '6a19a245-3952-4dfd-a7bb-cabf75b43a0c.docx', '黄花青年.docx', '黄花青年', 'docx', '2017-12-28 10:39:54', 3);
INSERT INTO `t_report_article_file` VALUES (9, '1609afe36ff0006', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609afe36ff0006\\d0ddba5d-f5a8-4278-9384-7db7463943c4.docx', 0.01, 'd05d3518a6de973dce8647d858922f23', 'd0ddba5d-f5a8-4278-9384-7db7463943c4.docx', '黄花青年.docx', '黄花青年', 'docx', '2017-12-28 10:40:40', 3);
INSERT INTO `t_report_article_file` VALUES (10, '1609afe36ff0006', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\1609afe36ff0006\\644f3866-0b03-44f3-8cc7-9c4a79538deb.docx', 0.67, '424432b314ab81f8337fc9f012a6373c', '644f3866-0b03-44f3-8cc7-9c4a79538deb.docx', '截图.docx', '截图', 'docx', '2017-12-28 10:40:40', 3);
INSERT INTO `t_report_article_file` VALUES (11, '161030810410001', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\161030810410001\\5b4dbb7e-dfd4-47f6-ab3f-a8e11052efaa.sig', 0, 'ce8f1423d52cdf8cc843cfb41928df9e', '5b4dbb7e-dfd4-47f6-ab3f-a8e11052efaa.sig', 'chrome_child.dll.sig', 'chrome_child.dll', 'sig', '2018-01-17 15:31:56', 3);
INSERT INTO `t_report_article_file` VALUES (12, '161030810410001', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\161030810410001\\ffad4096-d6f0-48fb-a49f-1daeefb0c9c7.dll', 0.53, 'f6c9482156fb449bc07ff4975d0384b8', 'ffad4096-d6f0-48fb-a49f-1daeefb0c9c7.dll', 'chrome_elf.dll', 'chrome_elf', 'dll', '2018-01-17 15:31:56', 3);
INSERT INTO `t_report_article_file` VALUES (13, '161030810410001', 'D:\\IdeaProjects\\Opinion-Report\\reportFile\\161030810410001\\803e904a-1546-4d31-966d-03c3284310ac.dll', 0.63, 'cf5bcd931e94e543ac5baae8b5c94587', '803e904a-1546-4d31-966d-03c3284310ac.dll', 'chrome_watcher.dll', 'chrome_watcher', 'dll', '2018-01-17 15:31:56', 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '上报文章表\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_report_article_log
-- ----------------------------
INSERT INTO `t_report_article_log` VALUES (1, '1609af1d27e0001', '2017-12-28 10:27:08', 4, 'report', NULL, '2017-12-28 10:27:08', 4, '2017-12-28');
INSERT INTO `t_report_article_log` VALUES (2, '1609af1d27e0001', '2017-12-28 10:29:27', 3, 'notAdopted', '我不同意这个舆情上报', '2017-12-28 10:29:27', 3, '2017-12-28');
INSERT INTO `t_report_article_log` VALUES (3, '1609af420140002', '2017-12-28 10:29:38', 3, 'report', NULL, '2017-12-28 10:29:38', 3, '2017-12-28');
INSERT INTO `t_report_article_log` VALUES (4, '1609af543e00003', '2017-12-28 10:30:53', 3, 'report', NULL, '2017-12-28 10:30:53', 3, '2017-12-28');
INSERT INTO `t_report_article_log` VALUES (5, '1609afa3cbf0004', '2017-12-28 10:36:19', 4, 'report', NULL, '2017-12-28 10:36:19', 4, '2017-12-28');
INSERT INTO `t_report_article_log` VALUES (6, '1609afd85af0005', '2017-12-28 10:39:54', 3, 'report', NULL, '2017-12-28 10:39:54', 3, '2017-12-28');
INSERT INTO `t_report_article_log` VALUES (7, '1609afa3cbf0004', '2017-12-28 10:40:35', 3, 'adopt', '我采纳了你的信息', '2017-12-28 10:40:35', 3, '2017-12-28');
INSERT INTO `t_report_article_log` VALUES (8, '1609afe36ff0006', '2017-12-28 10:40:40', 3, 'report', NULL, '2017-12-28 10:40:40', 3, '2017-12-28');
INSERT INTO `t_report_article_log` VALUES (9, '1609afe36ff0006', '2017-12-28 10:42:21', 2, 'notAdopted', '不采纳', '2017-12-28 10:42:21', 2, '2017-12-28');
INSERT INTO `t_report_article_log` VALUES (10, '160b4685b300001', '2018-01-02 09:07:06', 4, 'report', NULL, '2018-01-02 09:07:06', 4, '2018-01-02');
INSERT INTO `t_report_article_log` VALUES (11, '160b4685b300001', '2018-01-02 11:50:26', 3, 'adopt', '采纳了\n', '2018-01-02 11:50:26', 3, '2018-01-02');
INSERT INTO `t_report_article_log` VALUES (12, '160b4fdec160001', '2018-01-02 11:50:28', 3, 'report', NULL, '2018-01-02 11:50:28', 3, '2018-01-02');
INSERT INTO `t_report_article_log` VALUES (13, '160b4fe061c0002', '2018-01-02 11:50:35', 3, 'report', NULL, '2018-01-02 11:50:35', 3, '2018-01-02');
INSERT INTO `t_report_article_log` VALUES (14, '1609afd85af0005', '2018-01-03 23:00:01', 3, 'notAdopted', '系统自动关闭', '2018-01-03 23:00:01', 3, '2018-01-03');
INSERT INTO `t_report_article_log` VALUES (15, '1609af420140002', '2018-01-03 23:00:01', 3, 'notAdopted', '系统自动关闭', '2018-01-03 23:00:01', 3, '2018-01-03');
INSERT INTO `t_report_article_log` VALUES (16, '1609af543e00003', '2018-01-03 23:00:01', 3, 'notAdopted', '系统自动关闭', '2018-01-03 23:00:01', 3, '2018-01-03');
INSERT INTO `t_report_article_log` VALUES (17, '161030810410001', '2018-01-17 15:31:56', 3, 'report', NULL, '2018-01-17 15:31:56', 3, '2018-01-17');

-- ----------------------------
-- Table structure for t_sys_message
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_message`;
CREATE TABLE `t_sys_message`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `relation_user_id` bigint(20) NOT NULL COMMENT '关联人id',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `subtitle` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '副标题',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '内容',
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  `adopt_state` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '舆情状态',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'url',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态 unread:未读，read:已读',
  `publish_date` date NOT NULL COMMENT '创建时间',
  `publish_datetime` datetime(0) NOT NULL COMMENT '创建人id',
  `publish_user_id` bigint(20) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_message
-- ----------------------------
INSERT INTO `t_sys_message` VALUES (1, 4, '用户：昌平未采纳舆情上报', '《这是我的舆情标题》', NULL, 'import', 'notAdopted', '/reportArticle/opinionReportExaminePage/examine/1609af1d27e0001', 'read', '2017-12-28', '2017-12-28 10:29:27', 3);
INSERT INTO `t_sys_message` VALUES (2, 4, '用户：昌平已采纳舆情上报', '《我的舆情标题演示》', NULL, 'import', 'adopt', '/reportArticle/opinionReportExaminePage/examine/1609afa3cbf0004', 'read', '2017-12-28', '2017-12-28 10:40:35', 3);
INSERT INTO `t_sys_message` VALUES (3, 3, '用户：北京未采纳舆情上报', '《我的舆情标题演示》', NULL, 'import', 'notAdopted', '/reportArticle/opinionReportExaminePage/examine/1609afe36ff0006', 'read', '2017-12-28', '2017-12-28 10:42:21', 2);
INSERT INTO `t_sys_message` VALUES (4, 3, '用户：北京下发了新的通知', '《我下发的全部信息》', NULL, 'export', NULL, '/issuedNotice/issuedNoticeInfoPage/exec/1609b0135d00007', 'read', '2017-12-28', '2017-12-28 10:43:56', 2);
INSERT INTO `t_sys_message` VALUES (5, 4, '用户：北京下发了新的通知', '《我下发的全部信息》', NULL, 'export', NULL, '/issuedNotice/issuedNoticeInfoPage/exec/1609b0135d00007', 'read', '2017-12-28', '2017-12-28 10:43:56', 2);
INSERT INTO `t_sys_message` VALUES (6, 3, '用户：北京下发了新的通知', '《我下发市级信息》', NULL, 'export', NULL, '/issuedNotice/issuedNoticeInfoPage/exec/1609b01a0c70008', 'read', '2017-12-28', '2017-12-28 10:44:23', 2);
INSERT INTO `t_sys_message` VALUES (7, 4, '用户：北京下发了新的通知', '《区市级信息下发》', NULL, 'export', NULL, '/issuedNotice/issuedNoticeInfoPage/exec/1609b0226550009', 'read', '2017-12-28', '2017-12-28 10:44:58', 2);
INSERT INTO `t_sys_message` VALUES (8, 4, '用户：昌平下发了新的通知', '《我下发区县级通知 我是市级用户》', NULL, 'export', NULL, '/issuedNotice/issuedNoticeInfoPage/exec/1609b04242a000a', 'read', '2017-12-28', '2017-12-28 10:47:08', 3);
INSERT INTO `t_sys_message` VALUES (9, 4, '用户：昌平已采纳舆情上报', '《23424》', NULL, 'import', 'adopt', '/reportArticle/opinionReportExaminePage/examine/160b4685b300001', 'unread', '2018-01-02', '2018-01-02 11:50:26', 3);
INSERT INTO `t_sys_message` VALUES (10, 3, '系统关闭：舆情上报', '《这是我的舆情标题》', NULL, 'import', 'notAdopted', '/reportArticle/opinionReportExaminePage/examine/1609af420140002', 'unread', '2018-01-03', '2018-01-03 23:00:01', 3);
INSERT INTO `t_sys_message` VALUES (11, 3, '系统关闭：舆情上报', '《这是我市级上报的》', NULL, 'import', 'notAdopted', '/reportArticle/opinionReportExaminePage/examine/1609af543e00003', 'unread', '2018-01-03', '2018-01-03 23:00:01', 3);
INSERT INTO `t_sys_message` VALUES (12, 3, '系统关闭：舆情上报', '《我再次上报舆情标题》', NULL, 'import', 'notAdopted', '/reportArticle/opinionReportExaminePage/examine/1609afd85af0005', 'unread', '2018-01-03', '2018-01-03 23:00:01', 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `t_sys_permission_init` VALUES (19, '/fingerprint/**', 'anon', 2);
INSERT INTO `t_sys_permission_init` VALUES (20, '/ajaxFingerprintLogin', 'anon', 2);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role
-- ----------------------------
INSERT INTO `t_sys_role` VALUES (1, '超级管理员', 'admin', '2017-11-16', '2017-11-16 01:00:00', 1, '2017-11-16', '2017-11-16 01:00:00', 1);
INSERT INTO `t_sys_role` VALUES (2, '省级角色', 'operation', '2017-12-19', '2017-12-19 01:00:00', 1, '2017-12-19', '2017-12-19 01:00:00', 1);
INSERT INTO `t_sys_role` VALUES (3, '市级角色', 'operation', '2017-12-19', '2017-12-19 01:00:00', 1, '2017-12-19', '2017-12-19 01:00:00', 1);
INSERT INTO `t_sys_role` VALUES (4, '县级角色', 'operation', '2017-12-19', '2017-12-19 01:00:00', 1, '2017-12-19', '2017-12-19 01:00:00', 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 55 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `t_sys_role_permission` VALUES (16, 1, 2, '001');
INSERT INTO `t_sys_role_permission` VALUES (17, 2, 2, '002');
INSERT INTO `t_sys_role_permission` VALUES (18, 3, 2, '003');
INSERT INTO `t_sys_role_permission` VALUES (19, 4, 2, '004');
INSERT INTO `t_sys_role_permission` VALUES (20, 5, 2, '005');
INSERT INTO `t_sys_role_permission` VALUES (21, 6, 2, '006');
INSERT INTO `t_sys_role_permission` VALUES (22, 8, 2, '008');
INSERT INTO `t_sys_role_permission` VALUES (23, 9, 2, '009');
INSERT INTO `t_sys_role_permission` VALUES (24, 11, 2, '011');
INSERT INTO `t_sys_role_permission` VALUES (25, 12, 2, '012');
INSERT INTO `t_sys_role_permission` VALUES (26, 13, 2, '013');
INSERT INTO `t_sys_role_permission` VALUES (27, 15, 2, '009001');
INSERT INTO `t_sys_role_permission` VALUES (28, 1, 3, '001');
INSERT INTO `t_sys_role_permission` VALUES (29, 2, 3, '002');
INSERT INTO `t_sys_role_permission` VALUES (30, 3, 3, '003');
INSERT INTO `t_sys_role_permission` VALUES (31, 4, 3, '004');
INSERT INTO `t_sys_role_permission` VALUES (32, 5, 3, '005');
INSERT INTO `t_sys_role_permission` VALUES (33, 6, 3, '006');
INSERT INTO `t_sys_role_permission` VALUES (34, 7, 3, '007');
INSERT INTO `t_sys_role_permission` VALUES (35, 8, 3, '008');
INSERT INTO `t_sys_role_permission` VALUES (36, 9, 3, '009');
INSERT INTO `t_sys_role_permission` VALUES (37, 10, 3, '010');
INSERT INTO `t_sys_role_permission` VALUES (38, 11, 3, '011');
INSERT INTO `t_sys_role_permission` VALUES (39, 12, 3, '012');
INSERT INTO `t_sys_role_permission` VALUES (40, 13, 3, '013');
INSERT INTO `t_sys_role_permission` VALUES (41, 14, 3, '007001');
INSERT INTO `t_sys_role_permission` VALUES (42, 15, 3, '009001');
INSERT INTO `t_sys_role_permission` VALUES (43, 1, 4, '001');
INSERT INTO `t_sys_role_permission` VALUES (44, 2, 4, '002');
INSERT INTO `t_sys_role_permission` VALUES (45, 3, 4, '003');
INSERT INTO `t_sys_role_permission` VALUES (46, 4, 4, '004');
INSERT INTO `t_sys_role_permission` VALUES (47, 5, 4, '005');
INSERT INTO `t_sys_role_permission` VALUES (48, 6, 4, '006');
INSERT INTO `t_sys_role_permission` VALUES (49, 7, 4, '007');
INSERT INTO `t_sys_role_permission` VALUES (50, 10, 4, '010');
INSERT INTO `t_sys_role_permission` VALUES (51, 11, 4, '011');
INSERT INTO `t_sys_role_permission` VALUES (52, 12, 4, '012');
INSERT INTO `t_sys_role_permission` VALUES (53, 13, 4, '013');
INSERT INTO `t_sys_role_permission` VALUES (54, 14, 4, '007001');

-- ----------------------------
-- Table structure for t_sys_role_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_role_user`;
CREATE TABLE `t_sys_role_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NOT NULL COMMENT '角色id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_role_user
-- ----------------------------
INSERT INTO `t_sys_role_user` VALUES (1, 1, 1);
INSERT INTO `t_sys_role_user` VALUES (2, 2, 2);
INSERT INTO `t_sys_role_user` VALUES (3, 3, 3);
INSERT INTO `t_sys_role_user` VALUES (4, 4, 4);

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (1, 'admin', '超级管理员', '0', 'cmjMu3jLmu/VRSh4jUUJSQ==', '2017-12-28 11:18:13', 'effective', '2017-11-16 01:00:00', 1, '2017-11-16 01:00:00', 1, '2017-11-17', '2017-11-17');
INSERT INTO `t_sys_user` VALUES (2, 'beijing1', '北京', NULL, 'xtGoxyXEvpxjIcT14JeAUA==', '2018-01-02 11:18:23', 'effective', '2017-12-28 10:16:39', 1, '2017-12-28 10:16:39', 1, '2017-12-28', '2017-12-28');
INSERT INTO `t_sys_user` VALUES (3, 'changping', '昌平', NULL, 'fzKGJEUFUg3RV8ehMTa2bQ==', '2018-01-30 15:30:52', 'effective', '2017-12-28 10:16:59', 1, '2017-12-28 10:16:59', 1, '2017-12-28', '2017-12-28');
INSERT INTO `t_sys_user` VALUES (4, 'shengkey', '社工科', NULL, 'JODBD5YF2w7gdxWSqfrdHA==', '2018-01-05 12:05:28', 'effective', '2017-12-28 10:17:23', 1, '2018-01-02 09:13:56', 4, '2017-12-28', '2018-01-02');

SET FOREIGN_KEY_CHECKS = 1;
