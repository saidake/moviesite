/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : movie

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 24/07/2019 08:26:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES (1, 'adm', '123', 'normal');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int(11) NOT NULL,
  `cname` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sign` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '电影', NULL);
INSERT INTO `category` VALUES (2, '美剧', NULL);
INSERT INTO `category` VALUES (3, '韩剧', NULL);
INSERT INTO `category` VALUES (4, '日剧', NULL);
INSERT INTO `category` VALUES (5, '综艺', NULL);
INSERT INTO `category` VALUES (6, '动漫', NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `imgpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '地狱男爵', '美国', '2019', '/static/images/2.jpg', '电影');
INSERT INTO `product` VALUES (2, '雷霆沙赞', '日本', '2018', '/static/images/3.jpg', '美剧');
INSERT INTO `product` VALUES (5, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (6, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (8, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (9, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (10, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (11, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (12, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (13, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (14, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (15, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (16, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (17, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (18, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (19, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (20, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (21, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (22, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (23, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (24, '阿丽塔战斗天使', '美国', '2019', '/static/images/1.jpg', '电影');
INSERT INTO `product` VALUES (25, '狂赌之渊', '日本', '2017', '/static/images/4.jpg', '动漫');
INSERT INTO `product` VALUES (26, '狂赌之渊', '日本', '2017', '/static/images/4.jpg', '动漫');
INSERT INTO `product` VALUES (27, '狂赌之渊', '日本', '2017', '/static/images/4.jpg', '动漫');
INSERT INTO `product` VALUES (28, '无限挑战', '韩国', '2016', '/static/images/5.jpg', '综艺');
INSERT INTO `product` VALUES (29, '无限挑战', '韩国', '2016', '/static/images/5.jpg', '综艺');
INSERT INTO `product` VALUES (30, '无限挑战', '韩国', '2016', '/static/images/5.jpg', '综艺');
INSERT INTO `product` VALUES (31, '无限挑战', '韩国', '2016', '/static/images/5.jpg', '综艺');
INSERT INTO `product` VALUES (32, '无限挑战', '韩国', '2016', '/static/images/5.jpg', '综艺');
INSERT INTO `product` VALUES (33, '无限挑战', '韩国', '2016', '/static/images/5.jpg', '综艺');
INSERT INTO `product` VALUES (34, '无限挑战', '韩国', '2016', '/static/images/5.jpg', '综艺');
INSERT INTO `product` VALUES (35, '胜券在握', '日本', '2016', '/static/images/6.jpg', '日剧');
INSERT INTO `product` VALUES (36, '胜券在握', '日本', '2016', '/static/images/6.jpg', '日剧');
INSERT INTO `product` VALUES (37, '胜券在握', '日本', '2016', '/static/images/6.jpg', '日剧');
INSERT INTO `product` VALUES (38, '胜券在握', '日本', '2016', '/static/images/6.jpg', '日剧');
INSERT INTO `product` VALUES (39, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (40, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (41, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (42, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (43, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (44, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (45, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (46, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (47, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (48, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (49, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');
INSERT INTO `product` VALUES (50, '她的私生活', '韩国', '2015', '/static/images/7.jpg', '韩剧');

-- ----------------------------
-- Table structure for url
-- ----------------------------
DROP TABLE IF EXISTS `url`;
CREATE TABLE `url`  (
  `pid` int(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `playurl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  INDEX `pid`(`pid`) USING BTREE,
  CONSTRAINT `pid` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of url
-- ----------------------------
INSERT INTO `url` VALUES (1, '第一集', '#');
INSERT INTO `url` VALUES (2, '第一集', '#');
INSERT INTO `url` VALUES (2, '第二集', '#');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'koko', '123', 'normal');

SET FOREIGN_KEY_CHECKS = 1;
