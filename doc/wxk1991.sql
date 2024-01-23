/*
 Navicat Premium Data Transfer

 Source Server         : Mysqldata
 Source Server Type    : MySQL
 Source Server Version : 50743
 Source Host           : localhost:3306
 Source Schema         : wxk1991

 Target Server Type    : MySQL
 Target Server Version : 50743
 File Encoding         : 65001

 Date: 20/01/2024 18:54:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ad
-- ----------------------------
DROP TABLE IF EXISTS `ad`;
CREATE TABLE `ad`  (
  `ad_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告id',
  `ad_type_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型id',
  `ad_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告标题',
  `ad_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告的url地址',
  `ad_sort` int(11) NULL DEFAULT NULL COMMENT '广告排序，越小越排在前面',
  `ad_begin_time` datetime NULL DEFAULT NULL COMMENT '广告开始时间',
  `ad_end_time` datetime NULL DEFAULT NULL COMMENT '广告结束时间',
  `ad_add_time` datetime NULL DEFAULT NULL COMMENT '添加广告的时间',
  PRIMARY KEY (`ad_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ad
-- ----------------------------

-- ----------------------------
-- Table structure for ad_type
-- ----------------------------
DROP TABLE IF EXISTS `ad_type`;
CREATE TABLE `ad_type`  (
  `ad_type_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告类型id',
  `ad_type_title` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告类型名称',
  `ad_type_tag` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告标识（首页顶部广告，轮播图广告，文章详情广告）',
  `ad_type_sort` int(11) NULL DEFAULT NULL COMMENT '广告类型排序，越小越靠前',
  `ad_type_add_time` datetime NULL DEFAULT NULL COMMENT '广告类型添加时间',
  PRIMARY KEY (`ad_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ad_type
-- ----------------------------

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `article_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id',
  `article_title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标题',
  `article_aad_time` datetime NULL DEFAULT NULL COMMENT '文章添加时间',
  `article_context` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '文章内容',
  `article_good_number` int(11) NULL DEFAULT NULL COMMENT '点赞次数',
  `article_look_number` int(11) NULL DEFAULT NULL COMMENT '观看次数',
  `article_colletion_number` int(11) NULL DEFAULT NULL COMMENT '收藏次数',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for article_tag
-- ----------------------------
DROP TABLE IF EXISTS `article_tag`;
CREATE TABLE `article_tag`  (
  `article_tag_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章标签id',
  `article_tag_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标签名称',
  `article_tag_add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`article_tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for article_tag_list
-- ----------------------------
DROP TABLE IF EXISTS `article_tag_list`;
CREATE TABLE `article_tag_list`  (
  `article_tag_list_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章对应标签id',
  `article_id` int(50) NULL DEFAULT NULL COMMENT '文章id',
  `article_tag_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章标签id',
  PRIMARY KEY (`article_tag_list_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_tag_list
-- ----------------------------

-- ----------------------------
-- Table structure for article_type
-- ----------------------------
DROP TABLE IF EXISTS `article_type`;
CREATE TABLE `article_type`  (
  `article_type_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章分类id',
  `article_type_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章分类名称',
  `article_type_sort` int(11) NULL DEFAULT NULL COMMENT '文章分类拍戏。越小越靠前',
  `article_type_add_time` datetime NULL DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`article_type_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '文章分类1' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of article_type
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `comment_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '文章评论id',
  `article_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '文章id',
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户id(评论人)',
  `comment_time` datetime NULL DEFAULT NULL COMMENT '评论时间',
  `comment_good_number` int(11) NULL DEFAULT NULL COMMENT '点赞次数',
  PRIMARY KEY (`comment_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `comment_reply`;
CREATE TABLE `comment_reply`  (
  `comment_reply_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '评论回复id',
  `comment_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论id',
  `reply_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '回复评论人的id',
  `secondly_user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '继续回复人的id',
  `comment_reply_id_time` datetime NULL DEFAULT NULL COMMENT '评论回复时间',
  PRIMARY KEY (`comment_reply_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_reply
-- ----------------------------

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `link_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '友情链接id',
  `link_title` varchar(150) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接标题',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友情链接地址',
  `link_logo_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '友情链接logo',
  `link_add_time` datetime NULL DEFAULT NULL COMMENT '添加友情链接的时间',
  PRIMARY KEY (`link_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of link
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `user_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户id',
  `user_name` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `user_password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户密码',
  `user_frozen` int(11) UNSIGNED NULL DEFAULT 0 COMMENT '是否冻结，0正常，1冻结(冻结后无法登录)',
  `user_register_time` datetime NULL DEFAULT NULL COMMENT '注册时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('01722e6ff75ff127d743a49953924206', '46uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('01c0815712bf46b815c286927407694c', '38uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('0b0d2c30fc37f5f10ff762559a0aa640', '36uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('0bb8c74d5b16a2f23242263a85ddffbe', '28uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('0def492c63acb070f862bf43e1202532', '26uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('0f09e1209d241e680c4f53369cb7094a', '21uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('1029354c23d977c04ff624e21712b81c', '49uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('183d7441403c796584c55244fe223c66', '48uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('18bf96fb2d6e96399c7669fa9c0c9397', '1uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('19bae7bf0decbb269fec0b508a484b16', '0uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('1d0772cea53f5c8dd99662fe75864825', '40uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('1deada9b9e4951e64849bb090c3c58cb', '11uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('1f3a8ca275ca5984c4573c7ce10238b3', '4uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('1f614b63675ae4c506b3a5278875ce48', '35uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('22eb72f4853d71053f994d0aa8c6c1ea', '25uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('2402faf1c80d8c7012b5442e8943575e', '16uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('2919e69a81a48351d02ab3306ab7b97e', '34uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('2c89a6636d383404fecd7084e2cc2af5', '49uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('2ca1ccf56bbcf9d6b079c07ee51d3624', '39uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('2e0a915053409cbf82ff371111c541aa', '34uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('3069ac7444b6f4fc283c5f3a30e96ff0', '42uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('31073e72101625d1a4a91668e4e8727a', '11uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('37f1673984ac09650af03b22028023a7', '13uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('3ed40a24b4bb94fc5055c1203fce428c', '33uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('3f489ce369fad140603a2a1f483308dd', '44uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('429b3500a3108b4e33b8ef9dda0cbd25', '45uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('4580dadc5e5168d194afdaa1166c1061', '20uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('48d2a5cb40f4d69602ff9e9ae1d13fcc', '2uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('48ff0506f4b08896baa5a56760058863', '14uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('4ac4b7b4d4d529f190372abbbe16a10c', '36uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('4af15e6687d43ccc7d3f65a1a3b37f94', '10uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('4ba0c521bc0f5ecbf4f413ce95cf3f88', '31uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('4ba6eb4ece4bc5e8e4f13350e599ff0b', '8uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('4c9bc692c90bdb367284e33603d03006', '2uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('54398078756c535bc3b624ddbf33565b', '30uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('5ba184c39c2b2efd2f1d27801d367602', '12uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('5c3164c7eecf1bd9c79e5634a6c90046', '8uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('5d6c07229e668ef2675a521410306e5c', '31uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('6129c019ca6ca112073161a9f84192b7', '43uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('633bdf3c5bf2c175e90e47ff8e747dd3', '3uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('63e9ae6ec66988f4df6be87f06ffc668', '47uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('68f5d2a25abc9140a3bda50ae65667e1', '6uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('697e21d8f3306c9c32080e052ab54c24', '15uName', 'e10adc3949ba59abbe56e057f20f883e', 1, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('761e15807619857ef97c3bab3e6306a8', '5uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('7b8b0606834882d258383a0b1b7b69be', '1uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('7ba46c56a83da109e5943bd90dab80c9', '46uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('7c3df992cc50752b89053994d910b6dc', '27uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('7fdf8f73da2481adf9b55898ef31ce69', '37uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('818f92c4e26e486a134947c5159c339d', '48uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('853d0c3b76943549b574cb61d7b0b3cc', '19uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('8878542b97fb6607af5a6124df09f448', '19uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('8a54db10274d340e2be38bda9cbf5892', '38uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('8fef105993cc0c629d78622def1c1bba', '9uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('9228d58f08cbd72a1caf2f588a3bd82c', '25uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('980498e4d398a7aac39aa189576d03d1', '23uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('9b059be1a94a0861b58a07d3d036a68c', '3uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('9f7792af5af70a347d41d241904c7202', '33uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('a0d149ab7b6eae82b5fe9854373804c6', '35uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('a112a1d532860a99897432cb6c42b79f', '20uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('a27eed88c71703c298266f2e4b8d02ba', '27uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('a413077d1e2052ff5aa26a77dd1ac3be', '22uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('a4c42ef036a33dd891f3f48c6c2be9c3', '17uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('a5ab76f16555f2328156638fc1b11be0', '43uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('a5e0667fda65544c77e9b9cf0ea26626', '24uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('ab14d346c3710987700dc0b4957c0827', '18uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('abc23c9c9926c794797c0cf207173865', '41uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('abe3e1170db477d3f81842890dab1250', '32uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('ac1ab809897f8e04e88d4317fdfcd616', '22uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('ac772651c212a1059ecf52913efd0654', '18uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('b298d0b6d3798bd513c09bc3a3206397', '41uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('b357b088306737dc0f9f7052e4f07d56', '4uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('b6aba2b2f421a19c17193833b5e1c34f', '0uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('bae9b06b48327e00cf022283fc580409', '7uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('be62ba4b30392d3f73a6c851cbb31161', '30uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('bea0ed9a207748720181c172aabfcd13', '29uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('c331cbb79e0b74053f121115c5523104', '29uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('c6ce5ec53b7c6e8acd98d3f2f7b35e00', '9uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('c8a65494c8399c326350649cd0230d8a', '37uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('ca4220c5b7d0ed147cb9d2154f92013b', '16uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('cce4cc6fcbb42b77a07392986be9dcd7', '42uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('cf4e6b564b448c9c145c789f75dd0a6c', '12uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('cf775ca234b4ea0c6d776ca3efcb869f', '39uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('cfe258b3130696090183bc0e73353f0d', '32uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('d7ac8699fb9719d25922850f7f13ba40', '24uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('d8e3728e608af82c7186a00a93f9eade', '28uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('df139fa947a20a231325714fd50b6f31', '40uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('e10944bf06f40501685879256f9e2df5', '21uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('e40075b74db3abb7402d41dcb4cc03f5', '47uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('f175e1a93393eb2b4b9645140330dfa4', '7uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('f761a16908cc999cb53b016c9d6c628a', '6uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('f8dec396a6b15ab2747261755cee81fb', '5uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('fad50e019b9acef817072a0a270636c1', '26uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('fb8ba79c8f5959de94bdb650f1f9e005', '44uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 21:06:34');
INSERT INTO `user` VALUES ('fe6c4459430145d1dd5fd34c4fe4d674', '17uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');
INSERT INTO `user` VALUES ('fee1b5f173a5f55747e8d8e0bdc9b43d', '23uName', 'e10adc3949ba59abbe56e057f20f883e', 0, '2024-01-19 18:18:56');

SET FOREIGN_KEY_CHECKS = 1;
