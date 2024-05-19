/*
 Navicat Premium Data Transfer

 Source Server         : test
 Source Server Type    : MySQL
 Source Server Version : 80035 (8.0.35)
 Source Host           : localhost:3306
 Source Schema         : tzb

 Target Server Type    : MySQL
 Target Server Version : 80035 (8.0.35)
 File Encoding         : 65001

 Date: 19/05/2024 16:24:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for artwork
-- ----------------------------
DROP TABLE IF EXISTS `artwork`;
CREATE TABLE `artwork`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '暂无',
  `publisher` int NOT NULL,
  `type` int NOT NULL,
  `stock` int NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `material` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `is_sold_out` tinyint(1) NULL DEFAULT 0,
  `state` tinyint(1) NULL DEFAULT 3,
  `page_view` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of artwork
-- ----------------------------
INSERT INTO `artwork` VALUES (1, 'xxx', 'xxxx', 'https://img2.baidu.com/it/u=3904576940,647717226&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', 4, 1, 100, 100.00, '瓷器', '2024-05-17 11:13:21', '2024-05-17 11:13:29', 0, 1, 2);
INSERT INTO `artwork` VALUES (2, 'Test Artwork', 'This is a test description', 'http://localhost:8080/img/22c0f4c6-b6d8-463b-b055-3de5e7a22aca.png', 1, 0, 10, 100.00, 'Oil on canvas', '2024-05-17 22:23:23', '2024-05-19 00:42:44', 0, 3, 0);
INSERT INTO `artwork` VALUES (3, 'Test Artwork', 'This is a test description', 'test_image.jpg', 1, 1, 10, 100.00, 'Oil on canvas', '2024-05-17 22:29:13', '2024-05-17 22:29:13', 0, 3, 0);
INSERT INTO `artwork` VALUES (5, 'Test Artwork', 'This is a test description', 'test_image.jpg', 1, 1, 10, 100.00, 'Oil on canvas', '2024-05-17 22:52:58', '2024-05-17 22:52:58', 0, 1, 0);
INSERT INTO `artwork` VALUES (6, 'Test Artwork', 'This is a test description', 'test_image.jpg', 1, 1, 10, 100.00, 'Oil on canvas', '2024-05-18 09:19:58', '2024-05-18 09:19:58', 0, 1, 0);
INSERT INTO `artwork` VALUES (7, '哈哈哈哈', '哈哈哈哈', 'http://localhost:8080/img/33e75822-15a1-4af1-8572-ecae50ecce1e.png', 1, 1, 100, 100.00, '布料', '2024-05-18 22:30:23', '2024-05-18 22:30:23', 0, 3, 0);
INSERT INTO `artwork` VALUES (8, '哈哈哈哈哈', '很好', 'http://localhost:8080/img/59839374-fc4a-4f30-819c-672df1b0cb18.png', 1, 0, 100, 100.00, '瓷器', '2024-05-18 22:37:59', '2024-05-18 22:37:59', 0, 3, 0);
INSERT INTO `artwork` VALUES (9, 'hyhy', 'hy', 'http://localhost:8080/img/c973252a-9226-4570-9ce6-82c803bcef29.png', 1, 1, 10, 10.00, '丝绸', '2024-05-19 00:28:22', '2024-05-19 00:28:22', 0, 3, 0);

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `post_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `post_id`(`post_id` ASC) USING BTREE,
  INDEX `comments_ibfk_2`(`user_id` ASC) USING BTREE,
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `frontend_user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for front_user_profile
-- ----------------------------
DROP TABLE IF EXISTS `front_user_profile`;
CREATE TABLE `front_user_profile`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `signature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nickname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `gender` tinyint(1) NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `location` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  CONSTRAINT `front_user_profile_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `frontend_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of front_user_profile
-- ----------------------------
INSERT INTO `front_user_profile` VALUES (1, 1, NULL, 'Hello word', '老王', 1, '2024-05-15', NULL, '2024-01-01 00:00:00', '2024-05-14 23:26:15');
INSERT INTO `front_user_profile` VALUES (3, 4, NULL, NULL, NULL, 2, '2024-05-03', NULL, '2024-05-15 00:20:25', '2024-05-15 21:21:38');
INSERT INTO `front_user_profile` VALUES (4, 5, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 21:24:29', '2024-05-15 21:24:29');
INSERT INTO `front_user_profile` VALUES (5, 6, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 21:24:35', '2024-05-15 21:24:35');
INSERT INTO `front_user_profile` VALUES (6, 7, NULL, NULL, NULL, NULL, NULL, NULL, '2024-05-15 21:24:41', '2024-05-15 21:24:41');
INSERT INTO `front_user_profile` VALUES (7, 8, NULL, NULL, '用户3708', NULL, NULL, NULL, '2024-05-15 21:30:07', '2024-05-15 21:30:07');
INSERT INTO `front_user_profile` VALUES (8, 14, NULL, NULL, '用户408', NULL, NULL, NULL, '2024-05-15 21:38:40', '2024-05-15 21:38:40');
INSERT INTO `front_user_profile` VALUES (9, 15, NULL, NULL, '用户7782', NULL, NULL, NULL, '2024-05-15 21:38:50', '2024-05-15 21:38:50');
INSERT INTO `front_user_profile` VALUES (10, 16, NULL, NULL, '用户615', NULL, NULL, NULL, '2024-05-15 21:38:55', '2024-05-15 21:38:55');
INSERT INTO `front_user_profile` VALUES (11, 17, NULL, NULL, '用户9784', NULL, NULL, NULL, '2024-05-15 21:39:00', '2024-05-15 21:39:00');
INSERT INTO `front_user_profile` VALUES (12, 18, NULL, NULL, '用户641', NULL, NULL, NULL, '2024-05-15 21:39:05', '2024-05-15 21:39:05');
INSERT INTO `front_user_profile` VALUES (13, 19, NULL, NULL, '用户9603', NULL, NULL, NULL, '2024-05-15 21:39:44', '2024-05-15 21:39:44');

-- ----------------------------
-- Table structure for frontend_user
-- ----------------------------
DROP TABLE IF EXISTS `frontend_user`;
CREATE TABLE `frontend_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enable` tinyint(1) NULL DEFAULT 1,
  `type` int NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `score` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username` ASC) USING BTREE,
  UNIQUE INDEX `email`(`email` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of frontend_user
-- ----------------------------
INSERT INTO `frontend_user` VALUES (1, 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'admin@example.com', 0, 1, '2024-05-14 18:26:22', '2024-05-15 21:25:32', 0);
INSERT INTO `frontend_user` VALUES (4, 'John', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'john.doe@example.com', 0, 0, '2024-05-15 00:20:25', '2024-05-15 20:43:36', 0);
INSERT INTO `frontend_user` VALUES (5, 'John1', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'john.doe1@example.com', 1, 1, '2024-05-15 21:24:29', '2024-05-15 21:25:32', 0);
INSERT INTO `frontend_user` VALUES (6, 'John2', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'john.doe2@example.com', 1, 0, '2024-05-15 21:24:35', '2024-05-15 21:24:35', 0);
INSERT INTO `frontend_user` VALUES (7, 'John3', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'john.doe3@example.com', 1, 1, '2024-05-15 21:24:41', '2024-05-15 21:25:32', 0);
INSERT INTO `frontend_user` VALUES (8, 'TestUser1', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'test@example.com', 0, 0, '2024-05-15 21:30:06', '2024-05-15 21:59:45', 0);
INSERT INTO `frontend_user` VALUES (14, 'TestUser2', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'test1@example.com', 0, 0, '2024-05-15 21:38:40', '2024-05-15 21:59:46', 0);
INSERT INTO `frontend_user` VALUES (15, 'TestUser3', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'test2@example.com', 1, 0, '2024-05-15 21:38:50', '2024-05-15 21:38:50', 0);
INSERT INTO `frontend_user` VALUES (16, 'TestUser4', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'test4@example.com', 1, 0, '2024-05-15 21:38:55', '2024-05-15 21:38:55', 0);
INSERT INTO `frontend_user` VALUES (17, 'TestUser5', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'test5@example.com', 1, 0, '2024-05-15 21:39:00', '2024-05-15 21:39:00', 0);
INSERT INTO `frontend_user` VALUES (18, 'TestUser6', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'test6@example.com', 1, 0, '2024-05-15 21:39:05', '2024-05-15 21:39:05', 0);
INSERT INTO `frontend_user` VALUES (19, 'TestUser7', '008c70392e3abfbd0fa47bbc2ed96aa99bd49e159727fcba0f2e6abeb3a9d601', 'test7@example.com', 1, 0, '2024-05-15 21:39:44', '2024-05-15 21:39:44', 0);

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `parentId` int NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `redirect` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `keepAlive` tinyint NULL DEFAULT NULL,
  `method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `show` tinyint NOT NULL DEFAULT 1 COMMENT '是否展示在页面菜单',
  `enable` tinyint NOT NULL DEFAULT 1,
  `order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_30e166e8c6359970755c5727a2`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES (1, '资源管理', 'Resource_Mgt', 'MENU', 2, '/pms/resource', NULL, 'i-fe:list', '/src/views/pms/resource/index.vue', NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (2, '系统管理', 'SysMgt', 'MENU', NULL, NULL, NULL, 'i-fe:grid', NULL, NULL, NULL, NULL, NULL, 1, 1, 2);
INSERT INTO `permission` VALUES (3, '角色管理', 'RoleMgt', 'MENU', 2, '/pms/role', NULL, 'i-fe:user-check', '/src/views/pms/role/index.vue', NULL, NULL, NULL, NULL, 1, 1, 2);
INSERT INTO `permission` VALUES (4, '用户管理', 'UserMgt', 'MENU', 2, '/pms/user', NULL, 'i-fe:user', '/src/views/pms/user/index.vue', NULL, 1, NULL, NULL, 1, 1, 3);
INSERT INTO `permission` VALUES (5, '分配用户', 'RoleUser', 'MENU', 3, '/pms/role/user/:roleId', NULL, 'i-fe:user-plus', '/src/views/pms/role/role-user.vue', 'full', NULL, NULL, NULL, 0, 1, 1);
INSERT INTO `permission` VALUES (6, '业务示例', 'Demo', 'MENU', NULL, NULL, NULL, 'i-fe:grid', NULL, NULL, NULL, NULL, NULL, 1, 0, 2);
INSERT INTO `permission` VALUES (7, '图片上传', 'ImgUpload', 'MENU', 6, '/demo/upload', NULL, 'i-fe:image', '/src/views/demo/upload/index.vue', '', 1, NULL, NULL, 1, 1, 2);
INSERT INTO `permission` VALUES (8, '个人资料', 'UserProfile', 'MENU', NULL, '/profile', NULL, 'i-fe:user', '/src/views/profile/index.vue', NULL, NULL, NULL, NULL, 0, 1, 99);
INSERT INTO `permission` VALUES (9, '基础功能', 'Base', 'MENU', NULL, '', NULL, 'i-fe:grid', NULL, '', NULL, NULL, NULL, 1, 1, 2);
INSERT INTO `permission` VALUES (10, '基础组件', 'BaseComponents', 'MENU', 9, '/base/components', NULL, 'i-me:awesome', '/src/views/base/index.vue', NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (11, 'Unocss', 'Unocss', 'MENU', 9, '/base/unocss', NULL, 'i-me:awesome', '/src/views/base/unocss.vue', NULL, NULL, NULL, NULL, 1, 1, 2);
INSERT INTO `permission` VALUES (12, 'KeepAlive', 'KeepAlive', 'MENU', 9, '/base/keep-alive', NULL, 'i-me:awesome', '/src/views/base/keep-alive.vue', NULL, 1, NULL, NULL, 1, 1, 3);
INSERT INTO `permission` VALUES (13, '图标 Icon', 'Icon', 'MENU', 9, '/base/icon', NULL, 'i-fe:feather', '/src/views/base/unocss-icon.vue', '', NULL, NULL, NULL, 1, 1, 0);
INSERT INTO `permission` VALUES (14, 'MeModal', 'TestModal', 'MENU', 9, '/testModal', NULL, 'i-me:dialog', '/src/views/base/test-modal.vue', NULL, NULL, NULL, NULL, 1, 1, 5);
INSERT INTO `permission` VALUES (15, '前台用户管理', 'User', 'MENU', NULL, '', NULL, 'i-fe:user', '/src/views/user/list/index.vue', '', 1, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (16, '用户列表', 'List', 'MENU', 15, '/user/list', NULL, 'i-fe:users', '/src/views/user/list/index.vue', '', NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (17, '预约列表', 'UserBooking', 'MENU', 15, '/user/booking', NULL, 'i-fe:feather', '/src/views/user/booking/index.vue', '', NULL, NULL, NULL, 1, 1, 2);
INSERT INTO `permission` VALUES (18, '创建新用户', 'AddUser', 'BUTTON', 16, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (19, '文物管理', 'Relic', 'MENU', NULL, '', NULL, 'i-fe:slack', '/src/views/relic/index.vue', '', NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (20, '文物列表', 'RelicList', 'MENU', 19, '/relic/list', NULL, 'i-fe:list', '/src/views/relic/index.vue', '', NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (21, 'DIY手工艺术品管理', 'Artwork', 'MENU', NULL, NULL, NULL, 'i-fe:trello', '/src/views/artwork/list/index.vue', '', NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (22, 'DIY手工艺术品列表', 'ArtworkList', 'MENU', 21, '/artwork/list', NULL, 'i-fe:list', '/src/views/artwork/list/index.vue', '', NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (23, '订单管理', 'ArtworkOrder', 'MENU', 21, '/artwork/order', NULL, 'i-fe:shopping-cart', '/src/views/artwork/order/index.vue', '', NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (24, '线下预约DIY体验馆', 'ArtworkBooking', 'MENU', 21, '/artwork/booking', NULL, 'i-fe:map', '/src/views/artwork/booking/index.vue', '', NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (25, 'DIY分享交流管理', 'DiyShare', 'MENU', NULL, NULL, NULL, 'i-fe:twitch', NULL, '', NULL, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (26, '帖子列表', 'Post', 'MENU', 25, '/diy-share/post', NULL, 'i-fe:book-open', '/src/views/diy-share/post/index.vue', '', 1, NULL, NULL, 1, 1, 0);
INSERT INTO `permission` VALUES (27, '评论列表', 'Comment', 'MENU', 25, '/diy-share/comment', NULL, 'i-fe:message-circle', '/src/views/diy-share/comment/index.vue', '', 1, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (28, '首页', 'Home', 'MENU', NULL, '/', NULL, 'i-fe:airplay', '/src/views/home/index.vue', '', NULL, NULL, NULL, 1, 1, -100);
INSERT INTO `permission` VALUES (29, '动态管理', 'News', 'MENU', NULL, '/news', NULL, 'i-fe:command', '/src/views/news/index.vue', '', 1, NULL, NULL, 1, 1, 1);
INSERT INTO `permission` VALUES (30, '增加新闻', 'AddNews', 'BUTTON', 29, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, 1, 1, NULL);

-- ----------------------------
-- Table structure for posts
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `author_id` int NOT NULL,
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` enum('pending','approved','rejected') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'pending',
  `views` int NULL DEFAULT 0,
  `likes` int NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `author_id`(`author_id` ASC) USING BTREE,
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `frontend_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES (1, 'Getting started with VueJS', 'This is a post about VueJS...', 1, 'VueJS,JavaScript', 'pending', 0, 0, '2024-05-14 18:26:22', '2024-05-14 18:26:22');
INSERT INTO `posts` VALUES (2, 'Building a REST API with SpringBoot', 'This is a post about SpringBoot...', 1, 'SpringBoot', 'pending', 0, 0, '2024-05-14 18:26:22', '2024-05-14 18:26:22');

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `gender` int NULL DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'https://wpimg.wallstcn.com/f778738c-e4f8-4870-b634-56703b4acafe.gif?imageView2/1/w/80/h/80',
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `userId` int NOT NULL,
  `nickName` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_a24972ebd73b106250713dcddd`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, 1, 'https://img2.baidu.com/it/u=3904576940,647717226&fm=253&fmt=auto&app=120&f=JPEG?w=500&h=500', '四川省德阳市广汉市', '2900221581@qq.com', 1, 'Admin');

-- ----------------------------
-- Table structure for relic
-- ----------------------------
DROP TABLE IF EXISTS `relic`;
CREATE TABLE `relic`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `era` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `material` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `width` decimal(10, 2) NULL DEFAULT NULL,
  `height` decimal(10, 2) NULL DEFAULT NULL,
  `depth` decimal(10, 2) NULL DEFAULT NULL,
  `weight` decimal(10, 2) NULL DEFAULT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `story` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `protection_status` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `exhibition_history` json NULL,
  `related_artifacts` json NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of relic
-- ----------------------------
INSERT INTO `relic` VALUES (1, '青铜人像', '青铜人像是三星堆出土的文物之一，被认为是古代巴蜀文明的重要代表之一。', 'https://img.zcool.cn/community/012c0a5f9e38a511013fdcc7a5b141.png?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100', '古蜀时期', '青铜', 50.00, 100.00, 20.00, 200.00, '珍贵', '这些青铜人像代表了古代巴蜀人民的劳动和生活情景。', '完好', '[\"曾在多次国内外展览中展出，备受关注。\"]', '[\"与其他出土文物有密切关联，展示出三星堆古文明的独特魅力。\"]');
INSERT INTO `relic` VALUES (2, '神树纹玉璧', '神树纹玉璧是三星堆遗址中出土的一种玉器，具有很高的历史和文化价值。', 'https://img1.baidu.com/it/u=940092778,1476839712&fm=253&fmt=auto&app=120&f=JPEG?w=800&h=500', '古蜀时期', '玉石', 30.00, 30.00, 3.00, 50.00, '稀世珍品', '这件神树纹玉璧是三星堆文明中玉石工艺的杰作之一，刻有神树纹图案，寓意祈福。', '完好', '[\"曾在国内外博物馆举办的特展中展出，引起了广泛关注和讨论。\"]', '[\"与其他出土文物一起展示了三星堆文明的宗教信仰和艺术表现\"]');
INSERT INTO `relic` VALUES (3, '青铜面具', '青铜面具是三星堆遗址中发现的一种珍贵文物，展现了古代巴蜀文明的艺术水平和审美观念。', 'https://i.ibb.co/NsKk0QW/u-3084165683-3475638012-fm-253-fmt-auto-app-138-f-JPEG.webp', '古蜀时期', '青铜', 25.00, 20.00, 5.00, 80.00, '珍贵文物', '这些青铜面具具有独特的工艺和设计，反映了古代巴蜀人民的生活和信仰。', '完好', '[\"多次在国内外博物馆举办的特展中展出，备受瞩目和赞誉。\"]', '[\"与其他文物一同展示了古代巴蜀人的文化传承和创造力。\"]');
INSERT INTO `relic` VALUES (4, '青铜神树', '青铜神树是三星堆遗址中出土的一种装饰品，被认为是古代巴蜀文明中的神圣象征。', 'https://img0.baidu.com/it/u=450736165,4167186160&fm=253&fmt=auto&app=138&f=JPEG?w=600&h=400', '古蜀时期', '青铜', 40.00, 80.00, 10.00, 150.00, '文化遗产', '青铜神树象征着古代巴蜀人民的信仰和文化传统，是一种珍贵的宗教艺术品。', '完好', '[\"曾在多次国内外博物馆举办的特展中展出，备受观众喜爱。\"]', '[\"与其他出土文物共同展示了古代巴蜀文明的宗教信仰和文化底蕴\"]');

-- ----------------------------
-- Table structure for relic_artworks_artwork
-- ----------------------------
DROP TABLE IF EXISTS `relic_artworks_artwork`;
CREATE TABLE `relic_artworks_artwork`  (
  `relicId` int NOT NULL,
  `artworkId` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of relic_artworks_artwork
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enable` tinyint NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_ee999bb389d7ac0fd967172c41`(`code` ASC) USING BTREE,
  UNIQUE INDEX `IDX_ae4578dcaed5adff96595e6166`(`name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'SUPER_ADMIN', '超级管理员', 1);
INSERT INTO `role` VALUES (2, 'ROLE_QA', '质检员', 1);
INSERT INTO `role` VALUES (3, 'RELIC_ADMIN', '文物管理员', 1);

-- ----------------------------
-- Table structure for role_permissions_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permissions_permission`;
CREATE TABLE `role_permissions_permission`  (
  `roleId` int NOT NULL,
  `permissionId` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_b36cb2e04bc353ca4ede00d87b`(`roleId` ASC) USING BTREE,
  INDEX `IDX_bfbc9e263d4cea6d7a8c9eb3ad`(`permissionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of role_permissions_permission
-- ----------------------------
INSERT INTO `role_permissions_permission` VALUES (2, 7, 57);
INSERT INTO `role_permissions_permission` VALUES (2, 12, 58);
INSERT INTO `role_permissions_permission` VALUES (2, 9, 59);
INSERT INTO `role_permissions_permission` VALUES (2, 14, 60);
INSERT INTO `role_permissions_permission` VALUES (2, 10, 61);
INSERT INTO `role_permissions_permission` VALUES (2, 11, 62);
INSERT INTO `role_permissions_permission` VALUES (2, 15, 63);
INSERT INTO `role_permissions_permission` VALUES (2, 21, 64);
INSERT INTO `role_permissions_permission` VALUES (2, 25, 65);
INSERT INTO `role_permissions_permission` VALUES (2, 26, 66);
INSERT INTO `role_permissions_permission` VALUES (2, 8, 67);
INSERT INTO `role_permissions_permission` VALUES (2, 27, 68);
INSERT INTO `role_permissions_permission` VALUES (3, 27, 69);
INSERT INTO `role_permissions_permission` VALUES (3, 30, 70);

-- ----------------------------
-- Table structure for tb_news
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `image_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `tb_news_user_id_fk`(`author` ASC) USING BTREE,
  INDEX `tb_news_created_at_index`(`created_at` ASC) USING BTREE,
  INDEX `tb_news_status_index`(`status` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES (1, '三星堆遗址的发现与意义', '三星堆是中国古代文明的重要遗址之一，其发现对于研究古代文明、人类起源和文化交流具有重要意义。', '张三', '2023-04-12 09:00:00', 'http://localhost:8080/img/7e2c3182-78da-4a29-927c-443b121d771f.jpg', 0);
INSERT INTO `tb_news` VALUES (2, '三星堆文明的特点与成就', '三星堆文明以青铜器制作工艺和玉器雕刻工艺闻名于世，展现了古代巴蜀人民的智慧和技术水平。', '李四', '2023-04-13 10:30:00', '', 1);
INSERT INTO `tb_news` VALUES (3, '三星堆青铜神树的神秘之处', '三星堆青铜神树是古代巴蜀文明的重要象征之一，其神秘的图案和含义引人深思。', '王五', '2023-04-14 11:45:00', '', 2);
INSERT INTO `tb_news` VALUES (4, '三星堆遗址的考古发现', '近年来，对三星堆遗址的考古发掘工作取得了重要进展，发现了大量珍贵文物和遗迹，为研究古代文明提供了重要资料。', '赵六', '2023-04-15 13:00:00', '', 0);
INSERT INTO `tb_news` VALUES (5, '三星堆文化的传承与发展', '三星堆文化是中国古代文明的重要组成部分，其在艺术、宗教、政治等方面的影响持续至今，对于当代文化传承与发展具有重要意义。', '钱七', '2023-04-16 14:20:00', '', 1);
INSERT INTO `tb_news` VALUES (6, '三星堆遗址保护与管理', '为了保护三星堆遗址和相关文物，加强遗址保护工作和管理至关重要，需要政府、学界和社会各界的共同努力。', '孙八', '2023-04-17 15:40:00', '', 0);
INSERT INTO `tb_news` VALUES (7, '三星堆文物的特色与魅', '三星堆文物以其独特的艺术风格、精美的工艺和丰富的历史内涵，吸引着大量游客和学者前来参观和研究。', '周九', '2023-04-18 16:55:00', '', 2);
INSERT INTO `tb_news` VALUES (8, '三星堆遗址的保护与利用', '三星堆遗址的保护和利用是一个重要课题，需要综合考虑文物保护、旅游开发、科研教育等多方面因素，实现保护和利用的双赢。', '吴十', '2023-04-19 17:30:00', '', 1);
INSERT INTO `tb_news` VALUES (9, '三星堆文明与世界文化', '三星堆文明作为中国古代文明的重要组成部分，对世界文化产生了重要影响，是世界文化遗产的重要组成部分。', '李白', '2023-04-20 18:15:00', 'http://localhost:8080/img/1e8a723d-bcff-4a89-a879-b6d0a1318a0d.png', 2);
INSERT INTO `tb_news` VALUES (10, '三星堆文化遗产的保护与传承', '为了保护和传承三星堆文化遗产，需要加强对遗址和文物的保护工作，开展相关研究和教育，推动文化传承和创新发展。', '杜甫', '2023-04-21 19:00:00', 'http://localhost:8080/img/844220be-0d42-4e03-bc64-957afaa59b34.png', 1);
INSERT INTO `tb_news` VALUES (15, '哈哈哈', '哈哈', '哈哈哈', '2024-05-18 09:39:32', 'http://localhost:8080/img/659b14a3-2e77-4d66-991f-65ffdbc40d0b.png', 0);
INSERT INTO `tb_news` VALUES (16, 'hhh', '哈哈哈', '谁', '2024-05-18 13:59:05', 'http://localhost:8080/img/4c595727-bb09-41fa-9b4e-74c053bccac9.png', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `enable` tinyint NOT NULL DEFAULT 1,
  `createTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `updateTime` datetime(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `IDX_78a916df40e02a9deb1c4b75ed`(`username` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2a$10$mStlKYfFw.U54E5IXKLfv.Fe0DVaKSV.FwaybfJJrKRMu0kXmPK8O', 1, '2024-05-18 09:45:18.424445', '2024-05-18 09:45:18.424445');

-- ----------------------------
-- Table structure for user_roles_role
-- ----------------------------
DROP TABLE IF EXISTS `user_roles_role`;
CREATE TABLE `user_roles_role`  (
  `userId` int NOT NULL,
  `roleId` int NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `IDX_5f9286e6c25594c6b88c108db7`(`userId` ASC) USING BTREE,
  INDEX `IDX_4be2f7adf862634f5f803d246b`(`roleId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_roles_role
-- ----------------------------
INSERT INTO `user_roles_role` VALUES (3, 2, 11);
INSERT INTO `user_roles_role` VALUES (1, 1, 12);
INSERT INTO `user_roles_role` VALUES (1, 2, 13);
INSERT INTO `user_roles_role` VALUES (1, 3, 14);

SET FOREIGN_KEY_CHECKS = 1;
