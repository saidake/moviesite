/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : examsystem

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 27/10/2020 17:05:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `admin_id` int(11) NOT NULL,
  `permission` int(11) NULL DEFAULT NULL,
  `admin_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `admin_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`admin_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 1, '曹操', '123', 'normal');
INSERT INTO `admin` VALUES (2, 1, '曹丕', '123', 'normal');
INSERT INTO `admin` VALUES (3, 1, '曹冲', '123', 'normal');

-- ----------------------------
-- Table structure for calculation
-- ----------------------------
DROP TABLE IF EXISTS `calculation`;
CREATE TABLE `calculation`  (
  `calque_id` int(11) NOT NULL,
  `exam_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cat` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `question` varchar(900) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`calque_id`) USING BTREE,
  INDEX `exam_name`(`exam_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of calculation
-- ----------------------------
INSERT INTO `calculation` VALUES (1, '计算机通信与网络', '{\"0\":\"测试题《第一套》\"}', '在电子仪器中，为了减小与电源相连地两条导线地磁场，通常总是把它们扭在一起.为什么？', '不知道');
INSERT INTO `calculation` VALUES (2, '算法与数据结构', '{\"0\":\"测试题《第一套》\"}', '在电子仪器中，为了减小与电源相连地两条导线地磁场，通常总是把它们扭在一起.为什么？', '不知道');
INSERT INTO `calculation` VALUES (3, 'C语言程序设计', '{\"0\":\"测试题《第一套》\"}', '在电子仪器中，为了减小与电源相连地两条导线地磁场，通常总是把它们扭在一起.为什么？', '不知道');
INSERT INTO `calculation` VALUES (4, '计算机通信与网络', '{\"0\":\"测试题《第二套》\"}', '什么？', 'fafa');
INSERT INTO `calculation` VALUES (5, '算法与数据结构', '{\"0\":\"测试题《第二套》\"}', '什么？', 'fafa');
INSERT INTO `calculation` VALUES (6, 'C语言程序设计', '{\"0\":\"测试题《第二套》\"}', '什么？', 'fafa');

-- ----------------------------
-- Table structure for choice_question
-- ----------------------------
DROP TABLE IF EXISTS `choice_question`;
CREATE TABLE `choice_question`  (
  `choque_id` int(11) NOT NULL,
  `exam_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cat` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `answer_a` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `answer_b` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `answer_c` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `answer_d` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`choque_id`) USING BTREE,
  INDEX `exam_name`(`exam_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of choice_question
-- ----------------------------
INSERT INTO `choice_question` VALUES (1, 'C语言程序设计', '{\"0\":\"测试题《第一套》\"}', '在一个平面内，有两条垂直交叉但相互绝缘地导线，流过每条导线地电流相等，方向如图所示，则有些点地磁感应强度可能为零地区域', '仅在象限1 ', '仅在象限2', '仅在象限1、3', '仅在象限2、4', 'a');
INSERT INTO `choice_question` VALUES (2, '算法与数据结构', '{\"0\":\"测试题《第一套》\"}', '在一个平面内，有两条垂直交叉但相互绝缘地导线，流过每条导线地电流相等，方向如图所示，则有些点地磁感应强度可能为零地区域', '仅在象限1 ', '仅在象限2', '仅在象限1、3', '仅在象限2、4', NULL);
INSERT INTO `choice_question` VALUES (3, '计算机通信与网络', '{\"0\":\"测试题《第一套》\"}', '在一个平面内，有两条垂直交叉但相互绝缘地导线，流过每条导线地电流相等，方向如图所示，则有些点地磁感应强度可能为零地区域', '仅在象限1 ', '仅在象限2', '仅在象限1、3', '仅在象限2、4', NULL);
INSERT INTO `choice_question` VALUES (4, '计算机通信与网络', '{\"0\":\"测试题《第二套》\"}', '互域', '仅在象限1 ', '仅在象限2', '仅在象限1、3', '仅在象限2、4', NULL);
INSERT INTO `choice_question` VALUES (5, '算法与数据结构', '{\"0\":\"测试题《第二套》\"}', '地区域', '仅在象限1 ', '仅在象限2', '仅在象限1、3', '仅在象限2、4', NULL);
INSERT INTO `choice_question` VALUES (6, 'C语言程序设计', '{\"0\":\"测试题《第二套》\"}', '区域', '仅在象限1 ', '仅在象限2', '仅在象限1、3', '仅在象限2、4', 'b');
INSERT INTO `choice_question` VALUES (7, 'C语言程序设计', '{\"0\":\"测试题《第一套》\"}', '第一套二题', 'aaa', 'bbb', 'ccc', 'ddd', 'c');

-- ----------------------------
-- Table structure for completion
-- ----------------------------
DROP TABLE IF EXISTS `completion`;
CREATE TABLE `completion`  (
  `comque_id` int(11) NOT NULL,
  `exam_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cat` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `question` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`comque_id`) USING BTREE,
  INDEX `exam_name`(`exam_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of completion
-- ----------------------------
INSERT INTO `completion` VALUES (1, 'C语言程序设计', '{\"0\":\"测试题《第一套》\",\"1\":\"测试题《第二套》\"}', '两个带电粒子，以相同地速度垂直磁感线飞入匀强磁场，它们地质量之比是1∶4，电荷之比是1∶2，它们所受地磁场力之比是？，运动轨迹半径之比是？', '{\"0\":\"1:1\",\"1\":\"1:2\"}');
INSERT INTO `completion` VALUES (2, '计算机通信与网络', '{\"0\":\"测试题《第一套》\"}', '两个带电粒子，以相同地速度垂直磁感线飞入匀强磁场，它们地质量之比是1∶4，电荷之比是1∶2，它们所受地磁场力之比是？，运动轨迹半径之比是？', '1:1,1:2');
INSERT INTO `completion` VALUES (3, '算法与数据结构', '{\"0\":\"测试题《第一套》\"}', '两个带电粒子，以相同地速度垂直磁感线飞入匀强磁场，它们地质量之比是1∶4，电荷之比是1∶2，它们所受地磁场力之比是？，运动轨迹半径之比是？', '1:1,1:2');
INSERT INTO `completion` VALUES (4, '算法与数据结构', '{\"0\":\"测试题《第二套》\"}', '迹半径之比是？', '1:1,1:2');
INSERT INTO `completion` VALUES (5, '计算机通信与网络', '{\"0\":\"测试题《第二套》\"}', '迹半径之比是？', '1:1,1:2');
INSERT INTO `completion` VALUES (6, 'C语言程序设计', '{\"0\":\"测试题《第二套》\"}', '动轨迹半径之比是？', '{\"0\":\"1:1\",\"1\":\"1:2\"}');

-- ----------------------------
-- Table structure for exampaper
-- ----------------------------
DROP TABLE IF EXISTS `exampaper`;
CREATE TABLE `exampaper`  (
  `exam_id` int(11) NOT NULL,
  `exam_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `cat_all` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`exam_id`) USING BTREE,
  INDEX `exam_name`(`exam_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of exampaper
-- ----------------------------
INSERT INTO `exampaper` VALUES (1, 'C语言程序设计', '{\"1\":“测试题《第一套》”,\"2\":“测试题《第二套》”}', '0');
INSERT INTO `exampaper` VALUES (2, '算法与数据结构', '{\"1\":“测试题《第一套》”,\"2\":“测试题《第二套》”}', '0');
INSERT INTO `exampaper` VALUES (3, '计算机通信与网络', '{\"1\":“测试题《第一套》”,\"2\":“测试题《第二套》”}', '0');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score`  (
  `score_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `exam_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `score` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `exam_situation` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  PRIMARY KEY (`score_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES (1, '刘备', 'C语言程序设计', '0', 'normal');
INSERT INTO `score` VALUES (2, '张飞', 'C语言程序设计', '0', 'absent');
INSERT INTO `score` VALUES (3, '貂蝉', 'C语言程序设计', '59.9', 'normal');
INSERT INTO `score` VALUES (4, '赵云', '算法与数据结构', '98', 'normal');
INSERT INTO `score` VALUES (5, '关羽', '计算机通信与网络', '100', 'normal');
INSERT INTO `score` VALUES (6, '关羽', '算法与数据结构', '22', 'normal');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` int(11) NOT NULL,
  `permission` int(11) NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 0, '刘备', '123', 'normal');
INSERT INTO `user` VALUES (2, 0, '张飞', '123', 'normal');
INSERT INTO `user` VALUES (3, 0, '关羽', '123', 'absent');
INSERT INTO `user` VALUES (4, 0, '貂蝉', '123', 'normal');
INSERT INTO `user` VALUES (5, 0, '赵云', '123', 'absent');

SET FOREIGN_KEY_CHECKS = 1;
