/*
 Navicat Premium Dump SQL

 Source Server         : middleware.mgface.com
 Source Server Type    : MySQL
 Source Server Version : 80037 (8.0.37)
 Source Host           : middleware.mgface.com:3306
 Source Schema         : exchange_auto

 Target Server Type    : MySQL
 Target Server Version : 80037 (8.0.37)
 File Encoding         : 65001

 Date: 27/03/2025 22:23:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for containers
-- ----------------------------
DROP TABLE IF EXISTS `containers`;
CREATE TABLE `containers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `service_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `md5` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `version` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `service_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_containers_server_id` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of containers
-- ----------------------------
BEGIN;
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (3, '2025-03-12 13:12:03.000', '2025-03-12 13:12:03.000', '现货-行情容器', '192.168.1.100:8003', '现货-行情服务', 'c3d4e5f6g7h8i9j0k1l2', 'v1.0.0', NULL);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (4, '2025-03-12 13:12:03.000', '2025-03-12 13:12:03.000', '合约-仓位容器', '192.168.1.101:8001', '合约-仓位服务', 'd4e5f6g7h8i9j0k1l2m3', 'v1.0.0', NULL);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (5, '2025-03-12 13:12:03.000', '2025-03-12 13:12:03.000', '合约-撮合容器', '192.168.1.101:8002', '合约-撮合服务', 'e5f6g7h8i9j0k1l2m3n4', 'v1.0.0', NULL);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (17, '2025-03-15 16:39:06.358', '2025-03-15 16:39:06.358', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:2851061797a7e2e6c018c8e693b3ce4654b83f60', '部署平台', '2851061797a7e2e6c018c8e693b3ce4654b83f60', '2851061797a7e2e6c018c8e693b3ce4654b83f60', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (21, '2025-03-15 17:00:43.011', '2025-03-15 17:00:43.011', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:64e34c592090ef3d52f3321d388d96336d3ca3f5', '部署平台', '64e34c592090ef3d52f3321d388d96336d3ca3f5', '20250315165936', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (22, '2025-03-15 17:53:24.125', '2025-03-15 17:53:24.125', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:cb577d36731a02f7114182a27208163df11434f9', '部署平台', 'cb577d36731a02f7114182a27208163df11434f9', '20250315175217', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (23, '2025-03-16 00:40:27.343', '2025-03-16 00:40:27.343', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:bcbb99b29ae71c867ddb5a8c3e3385b5176aee61', '部署平台', 'bcbb99b29ae71c867ddb5a8c3e3385b5176aee61', '20250316003919', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (24, '2025-03-16 14:28:11.639', '2025-03-16 14:28:11.639', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:4de9930cc9eba553acdd244a7f981c12fc985a7f', '部署平台', '4de9930cc9eba553acdd244a7f981c12fc985a7f', '20250316142700', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (25, '2025-03-16 14:31:17.884', '2025-03-16 14:31:17.884', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:f4921f9f42d81b16ca8f6fb62c2dad150c31d83a', '部署平台', 'f4921f9f42d81b16ca8f6fb62c2dad150c31d83a', '20250316143002', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (26, '2025-03-16 14:55:06.111', '2025-03-16 14:55:06.111', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:592b6b83af9eba5c55722773c188821cae97cc77', '部署平台', '592b6b83af9eba5c55722773c188821cae97cc77', '20250316145353', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (29, '2025-03-16 17:48:39.208', '2025-03-16 17:48:39.208', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:9ef5ba8d23236cbce4fd01f617e51ab9dc20f498', 'mgface通用网关', '9ef5ba8d23236cbce4fd01f617e51ab9dc20f498', '20250316174822', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (30, '2025-03-16 17:48:40.858', '2025-03-16 17:48:40.858', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:9ef5ba8d23236cbce4fd01f617e51ab9dc20f498', 'mgfacehub通用网关', '9ef5ba8d23236cbce4fd01f617e51ab9dc20f498', '20250316174823', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (31, '2025-03-16 18:07:41.186', '2025-03-16 18:07:41.186', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:1c7c5c382b6900958ebf37cbabad3599e64906cb', 'mgfacehub通用网关', '1c7c5c382b6900958ebf37cbabad3599e64906cb', '20250316180725', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (32, '2025-03-16 18:07:59.148', '2025-03-16 18:07:59.148', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:1c7c5c382b6900958ebf37cbabad3599e64906cb', 'mgface通用网关', '1c7c5c382b6900958ebf37cbabad3599e64906cb', '20250316180742', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (33, '2025-03-16 18:34:05.428', '2025-03-16 18:34:05.428', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:01d52de5ab6e5bdde344f856f2068aa3e8ae2d12', 'mgface通用网关', '01d52de5ab6e5bdde344f856f2068aa3e8ae2d12', '20250316183347', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (34, '2025-03-16 18:34:31.705', '2025-03-16 18:34:31.705', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:01d52de5ab6e5bdde344f856f2068aa3e8ae2d12', 'mgfacehub通用网关', '01d52de5ab6e5bdde344f856f2068aa3e8ae2d12', '20250316183349', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (35, '2025-03-16 18:38:19.539', '2025-03-16 18:38:19.539', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:1f11b121053c9fe0ba8d8db43fe65b55177bca2d', 'mgfacehub通用网关', '1f11b121053c9fe0ba8d8db43fe65b55177bca2d', '20250316183802', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (36, '2025-03-16 18:38:23.424', '2025-03-16 18:38:23.424', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:1f11b121053c9fe0ba8d8db43fe65b55177bca2d', 'mgface通用网关', '1f11b121053c9fe0ba8d8db43fe65b55177bca2d', '20250316183808', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (37, '2025-03-16 19:20:31.374', '2025-03-16 19:20:31.374', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:3b34d1641d19c049262022bf9ea36fb240f1acd2', 'mgfacehub通用网关', '3b34d1641d19c049262022bf9ea36fb240f1acd2', '20250316192014', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (38, '2025-03-16 19:20:37.331', '2025-03-16 19:20:37.331', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:3b34d1641d19c049262022bf9ea36fb240f1acd2', 'mgface通用网关', '3b34d1641d19c049262022bf9ea36fb240f1acd2', '20250316192022', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (39, '2025-03-16 19:52:48.016', '2025-03-16 19:52:48.016', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:c068a16599eb3553c0b26067b0275e46ffd90eb5', 'mgface通用网关', 'c068a16599eb3553c0b26067b0275e46ffd90eb5', '20250316195231', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (40, '2025-03-16 19:52:51.182', '2025-03-16 19:52:51.182', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:c068a16599eb3553c0b26067b0275e46ffd90eb5', 'mgfacehub通用网关', 'c068a16599eb3553c0b26067b0275e46ffd90eb5', '20250316195234', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (41, '2025-03-16 19:55:31.288', '2025-03-16 19:55:31.288', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:1feeed068cd7735cdb75e36f2eec7e42121fb1fa', '部署平台', '1feeed068cd7735cdb75e36f2eec7e42121fb1fa', '20250316195422', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (42, '2025-03-16 20:03:24.242', '2025-03-16 20:03:24.242', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:5ae8bc17996ae1ff137eb5a6e62d2a744deff6b2', 'mgfacehub通用网关', '5ae8bc17996ae1ff137eb5a6e62d2a744deff6b2', '20250316200308', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (43, '2025-03-16 20:03:34.345', '2025-03-16 20:03:34.345', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:5ae8bc17996ae1ff137eb5a6e62d2a744deff6b2', 'mgface通用网关', '5ae8bc17996ae1ff137eb5a6e62d2a744deff6b2', '20250316200316', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (44, '2025-03-16 20:49:28.916', '2025-03-16 20:49:28.916', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:971d8e057438d9a48a2f207675197e8a61aef341', '部署平台', '971d8e057438d9a48a2f207675197e8a61aef341', '20250316204818', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (45, '2025-03-16 21:22:09.481', '2025-03-16 21:22:09.481', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:8c286968377b4a4f311e4a84f84d25905456439f', 'mgface通用网关', '8c286968377b4a4f311e4a84f84d25905456439f', '20250316212151', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (46, '2025-03-16 21:22:10.632', '2025-03-16 21:22:10.632', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:8c286968377b4a4f311e4a84f84d25905456439f', 'mgfacehub通用网关', '8c286968377b4a4f311e4a84f84d25905456439f', '20250316212155', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (47, '2025-03-16 21:23:26.519', '2025-03-16 21:23:26.519', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:244bd89d21b16574e43c8caf104fc5528be0aa71', 'mgface通用网关', '244bd89d21b16574e43c8caf104fc5528be0aa71', '20250316212310', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (48, '2025-03-16 21:23:26.989', '2025-03-16 21:23:26.989', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:244bd89d21b16574e43c8caf104fc5528be0aa71', 'mgfacehub通用网关', '244bd89d21b16574e43c8caf104fc5528be0aa71', '20250316212310', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (49, '2025-03-16 21:27:51.869', '2025-03-16 21:27:51.869', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:14c8eac134ea839b31d078ac53f210ade8ff405d', 'mgfacehub通用网关', '14c8eac134ea839b31d078ac53f210ade8ff405d', '20250316212737', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (50, '2025-03-16 21:27:52.412', '2025-03-16 21:27:52.412', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:14c8eac134ea839b31d078ac53f210ade8ff405d', 'mgface通用网关', '14c8eac134ea839b31d078ac53f210ade8ff405d', '20250316212735', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (51, '2025-03-16 21:44:48.826', '2025-03-16 21:44:48.826', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:60e52caa2f6e77d7bd79bd21bc316acd6c18be33', '部署平台', '60e52caa2f6e77d7bd79bd21bc316acd6c18be33', '20250316214011', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (52, '2025-03-17 22:32:15.005', '2025-03-17 22:32:15.005', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:37769cbb96e749a736047307aa6561073cf4ba1f', '部署平台', '37769cbb96e749a736047307aa6561073cf4ba1f', '20250317222912', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (53, '2025-03-17 23:07:17.547', '2025-03-17 23:07:17.547', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:945d23ed07c939f5d6578929ac2a8fbc07ab5fe7', '部署平台', '945d23ed07c939f5d6578929ac2a8fbc07ab5fe7', '20250317230453', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (54, '2025-03-18 12:21:27.774', '2025-03-18 12:21:27.774', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:cdc821ca080f4774ea3ced78ba921c1f2a7277e0', '部署平台', 'cdc821ca080f4774ea3ced78ba921c1f2a7277e0', '20250318122016', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (55, '2025-03-18 12:23:36.606', '2025-03-18 12:23:36.606', 'alert-core', 'registry.cn-shenzhen.aliyuncs.com/mgface/alert-core:57ec793dcd9d78aa19b60da0a91215f30e15648c', 'alert-core', '57ec793dcd9d78aa19b60da0a91215f30e15648c', '20250318122144', 7);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (56, '2025-03-18 12:45:05.450', '2025-03-18 12:45:05.450', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:dfbd94a8ef6f056e27fb7c85caa2924274b30332', 'mgface通用网关', 'dfbd94a8ef6f056e27fb7c85caa2924274b30332', '20250318124449', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (57, '2025-03-18 12:45:06.009', '2025-03-18 12:45:06.009', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:dfbd94a8ef6f056e27fb7c85caa2924274b30332', 'mgfacehub通用网关', 'dfbd94a8ef6f056e27fb7c85caa2924274b30332', '20250318124449', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (58, '2025-03-18 15:27:03.441', '2025-03-18 15:27:03.441', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:dbb63d7a28c70431b1b052ac03d9ccc0db97b20b', '部署平台', 'dbb63d7a28c70431b1b052ac03d9ccc0db97b20b', '20250318152546', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (59, '2025-03-18 15:42:43.019', '2025-03-18 15:42:43.019', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:844b87e2f05184ce6fbd0fb92bf72814c89901e1', '部署平台', '844b87e2f05184ce6fbd0fb92bf72814c89901e1', '20250318154134', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (60, '2025-03-18 16:17:05.367', '2025-03-18 16:17:05.367', 'mgfacehub-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:c8c10b7466c2964cb6f72a2d53eef7a1f1c113b6', 'mgfacehub通用网关', 'c8c10b7466c2964cb6f72a2d53eef7a1f1c113b6', '20250318161647', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (61, '2025-03-18 16:17:08.686', '2025-03-18 16:17:08.686', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:c8c10b7466c2964cb6f72a2d53eef7a1f1c113b6', 'mgface通用网关', 'c8c10b7466c2964cb6f72a2d53eef7a1f1c113b6', '20250318161650', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (62, '2025-03-18 16:17:27.113', '2025-03-18 16:17:27.113', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:0e7e8639e19ea8bdf4b2d65e3ab0d9b12456ae0b', '部署平台', '0e7e8639e19ea8bdf4b2d65e3ab0d9b12456ae0b', '20250318161617', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (63, '2025-03-18 17:01:01.603', '2025-03-18 17:01:01.603', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:dd66b2be3f558c1905f28ad8058e81a2611839c3', 'mgface通用网关', 'dd66b2be3f558c1905f28ad8058e81a2611839c3', '20250318170045', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (64, '2025-03-19 16:31:03.359', '2025-03-19 16:31:03.359', 'user-center', 'registry.cn-shenzhen.aliyuncs.com/mgface/user-center:024524bffdbc083aea81f0f92e4fb64047aa6d40', '用户中心', '024524bffdbc083aea81f0f92e4fb64047aa6d40', '20250319163021', 8);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (65, '2025-03-19 21:39:02.890', '2025-03-19 21:39:02.890', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:8403b0844a21ac69113184724422f8cd89ab00e1', '部署平台', '8403b0844a21ac69113184724422f8cd89ab00e1', '20250319213737', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (66, '2025-03-20 10:28:31.737', '2025-03-20 10:28:31.737', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:f9eb14dd64f39bbd9e8621c6c314fa4178bd8c6e', '部署平台', 'f9eb14dd64f39bbd9e8621c6c314fa4178bd8c6e', '20250320102715', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (67, '2025-03-20 17:01:54.975', '2025-03-20 17:01:54.975', 'user-center', 'registry.cn-shenzhen.aliyuncs.com/mgface/user-center:fa61a62b4ed743321ceaf7f026176dedb87cf610', '用户中心', 'fa61a62b4ed743321ceaf7f026176dedb87cf610', '20250320170119', 8);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (68, '2025-03-20 21:38:15.452', '2025-03-20 21:38:15.452', 'exchange-eureka', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-eureka:7cd329717309f69151071a49c681944c03c5260b', 'exchange-eureka', '7cd329717309f69151071a49c681944c03c5260b', '20250320213317', 11);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (69, '2025-03-20 22:06:32.747', '2025-03-20 22:06:32.747', 'exchange-eureka', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-eureka:1b1c748644417306fe69df15abbaeaaaf82c90e5', 'exchange-eureka', '1b1c748644417306fe69df15abbaeaaaf82c90e5', '20250320220603', 11);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (70, '2025-03-20 22:59:47.271', '2025-03-20 22:59:47.271', 'config-server', 'registry.cn-shenzhen.aliyuncs.com/mgface/config-server:0a15ae9e8eede32cfe4f490f9ee34735a0299aac', 'config-server', '0a15ae9e8eede32cfe4f490f9ee34735a0299aac', '20250320225904', 10);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (71, '2025-03-20 23:11:37.633', '2025-03-20 23:11:37.633', 'config-server', 'registry.cn-shenzhen.aliyuncs.com/mgface/config-server:d14e98e3d715c722d2d9c878fde031b9651e2e04', 'config-server', 'd14e98e3d715c722d2d9c878fde031b9651e2e04', '20250320230919', 10);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (72, '2025-03-20 23:34:11.664', '2025-03-20 23:34:11.664', 'config-server', 'registry.cn-shenzhen.aliyuncs.com/mgface/config-server:e20009ff686a1541c539b277517b6061e43cba25', 'config-server', 'e20009ff686a1541c539b277517b6061e43cba25', '20250320233009', 10);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (73, '2025-03-21 00:22:10.358', '2025-03-21 00:22:10.358', 'config-server', 'registry.cn-shenzhen.aliyuncs.com/mgface/config-server:467a279b74462e97511698aa9106e66cee9b10fd', 'config-server', '467a279b74462e97511698aa9106e66cee9b10fd', '20250321002139', 10);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (74, '2025-03-21 00:42:24.702', '2025-03-21 00:42:24.702', 'user-center', 'registry.cn-shenzhen.aliyuncs.com/mgface/user-center:4d180a685d5a9b90cb2b7da2bdd3aec538439727', '用户中心', '4d180a685d5a9b90cb2b7da2bdd3aec538439727', '20250321004145', 8);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (75, '2025-03-22 13:40:25.098', '2025-03-22 13:40:25.098', 'exchange-eureka', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-eureka:2d55c797953880e525c096f4374775c4000181f6', 'exchange-eureka', '2d55c797953880e525c096f4374775c4000181f6', '20250322133947', 11);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (76, '2025-03-22 14:27:27.671', '2025-03-22 14:27:27.671', 'exchange-eureka', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-eureka:a2c48b387d595069209aa2a939eed7bc88337bf0', 'exchange-eureka', 'a2c48b387d595069209aa2a939eed7bc88337bf0', '20250322142700', 11);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (77, '2025-03-22 14:49:47.450', '2025-03-22 14:49:47.450', 'user-center', 'registry.cn-shenzhen.aliyuncs.com/mgface/user-center:ac27cb02f86a055a9aab799ba48342b4454591dc', '用户中心', 'ac27cb02f86a055a9aab799ba48342b4454591dc', '20250322144910', 8);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (78, '2025-03-22 17:23:53.977', '2025-03-22 17:23:53.977', 'user-center-server', 'registry.cn-shenzhen.aliyuncs.com/mgface/user-center-server:68292675e0a0752fafb9e3a7b2cca319874cf862', 'user-center-server', '68292675e0a0752fafb9e3a7b2cca319874cf862', '20250322172305', 12);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (79, '2025-03-23 01:13:24.066', '2025-03-23 01:13:24.066', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:0280c967f0c55ca2bda64ad8e870ed5b3bfb900b', 'mgface通用网关', '0280c967f0c55ca2bda64ad8e870ed5b3bfb900b', '20250323011307', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (80, '2025-03-23 01:15:09.537', '2025-03-23 01:15:09.537', 'spot-admin-monitor', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-monitor:f91e0af7d2cf5c1c6b19cd2f28e765e40d3dcc70', 'spot-admin-monitor', 'f91e0af7d2cf5c1c6b19cd2f28e765e40d3dcc70', '20250323011420', 14);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (81, '2025-03-23 01:19:56.805', '2025-03-23 01:19:56.805', 'spot-admin-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-impl:f91e0af7d2cf5c1c6b19cd2f28e765e40d3dcc70', 'spot-admin-impl', 'f91e0af7d2cf5c1c6b19cd2f28e765e40d3dcc70', '20250323011857', 13);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (82, '2025-03-23 01:39:50.590', '2025-03-23 01:39:50.590', 'spot-admin-monitor', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-monitor:983115b8efb13bdb4555f1701a56b554d3f881c8', 'spot-admin-monitor', '983115b8efb13bdb4555f1701a56b554d3f881c8', '20250323013908', 14);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (83, '2025-03-23 01:46:21.960', '2025-03-23 01:46:21.960', 'spot-admin-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-impl:983115b8efb13bdb4555f1701a56b554d3f881c8', 'spot-admin-impl', '983115b8efb13bdb4555f1701a56b554d3f881c8', '20250323014532', 13);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (84, '2025-03-23 23:54:28.914', '2025-03-23 23:54:28.914', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:a33d1a541e0a1939759ac21fa786299e3d011061', 'mgface通用网关', 'a33d1a541e0a1939759ac21fa786299e3d011061', '20250323235411', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (85, '2025-03-23 23:59:30.252', '2025-03-23 23:59:30.252', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:e0a521085c3c880d8d98b6b0b979778a446c73fb', 'mgface通用网关', 'e0a521085c3c880d8d98b6b0b979778a446c73fb', '20250323235913', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (86, '2025-03-24 00:08:52.855', '2025-03-24 00:08:52.855', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:afbddbab29ac0cf551a040a601e08efdcfe03751', 'mgface通用网关', 'afbddbab29ac0cf551a040a601e08efdcfe03751', '20250324000835', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (87, '2025-03-24 00:28:42.242', '2025-03-24 00:28:42.242', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:a03a53e231f7658e2f0949bcede3c650ad865d09', 'mgface通用网关', 'a03a53e231f7658e2f0949bcede3c650ad865d09', '20250324002825', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (88, '2025-03-24 00:31:20.899', '2025-03-24 00:31:20.899', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:324db21d83b74e610a94444fbba90cb44b21d4cd', 'mgface通用网关', '324db21d83b74e610a94444fbba90cb44b21d4cd', '20250324003104', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (89, '2025-03-24 01:15:37.852', '2025-03-24 01:15:37.852', 'user-center-server', 'registry.cn-shenzhen.aliyuncs.com/mgface/user-center-server:68e46bb02c89bbc8a7d6687ceb7a523b39ef36d8', 'user-center-server', '68e46bb02c89bbc8a7d6687ceb7a523b39ef36d8', '20250324011503', 12);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (90, '2025-03-24 01:24:24.862', '2025-03-24 01:24:24.862', 'spot-admin-monitor', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-monitor:0601a41e149f2bbc80bf7992c7597994e5d5b3a4', 'spot-admin-monitor', '0601a41e149f2bbc80bf7992c7597994e5d5b3a4', '20250324012341', 14);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (91, '2025-03-24 01:25:40.182', '2025-03-24 01:25:40.182', 'user-center-server', 'registry.cn-shenzhen.aliyuncs.com/mgface/user-center-server:69b1742ba9344a751b2e12477092542cff434a0b', 'user-center-server', '69b1742ba9344a751b2e12477092542cff434a0b', '20250324012507', 12);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (92, '2025-03-24 01:30:35.116', '2025-03-24 01:30:35.116', 'spot-admin-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-impl:0601a41e149f2bbc80bf7992c7597994e5d5b3a4', 'spot-admin-impl', '0601a41e149f2bbc80bf7992c7597994e5d5b3a4', '20250324012947', 13);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (93, '2025-03-25 11:16:13.849', '2025-03-25 11:16:13.849', 'spot-admin-monitor', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-monitor:0d06cba7431f88a0cb4a58684ba875b5e8d55a32', 'spot-admin-monitor', '0d06cba7431f88a0cb4a58684ba875b5e8d55a32', '20250325111529', 14);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (94, '2025-03-25 11:16:41.147', '2025-03-25 11:16:41.147', 'spot-biz-internal', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-internal:7e3b524ee96cad18e99166a5656031c245c8b526', 'spot-biz-internal', '7e3b524ee96cad18e99166a5656031c245c8b526', '20250325111556', 17);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (95, '2025-03-25 11:16:57.353', '2025-03-25 11:16:57.353', 'spot-biz-websocket', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-websocket:7e3b524ee96cad18e99166a5656031c245c8b526', 'spot-biz-websocket', '7e3b524ee96cad18e99166a5656031c245c8b526', '20250325111611', 18);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (96, '2025-03-25 11:17:01.845', '2025-03-25 11:17:01.845', 'spot-scheduled', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-scheduled:7e3b524ee96cad18e99166a5656031c245c8b526', 'spot-scheduled', '7e3b524ee96cad18e99166a5656031c245c8b526', '20250325111616', 19);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (97, '2025-03-25 11:17:03.872', '2025-03-25 11:17:03.872', 'spot-biz-openapi', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-openapi:7e3b524ee96cad18e99166a5656031c245c8b526', 'spot-biz-openapi', '7e3b524ee96cad18e99166a5656031c245c8b526', '20250325111602', 16);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (98, '2025-03-25 11:18:28.059', '2025-03-25 11:18:28.059', 'spot-biz-user', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-user:7e3b524ee96cad18e99166a5656031c245c8b526', 'spot-biz-user', '7e3b524ee96cad18e99166a5656031c245c8b526', '20250325111742', 15);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (99, '2025-03-25 11:22:28.550', '2025-03-25 11:22:28.550', 'spot-admin-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-impl:0d06cba7431f88a0cb4a58684ba875b5e8d55a32', 'spot-admin-impl', '0d06cba7431f88a0cb4a58684ba875b5e8d55a32', '20250325112138', 13);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (100, '2025-03-25 12:24:17.042', '2025-03-25 12:24:17.042', 'exchange-auto-godeep', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:ed24d07265d4c685efcc98127821c09deea7e1e5', '部署平台', 'ed24d07265d4c685efcc98127821c09deea7e1e5', '20250325122311', 4);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (101, '2025-03-25 14:33:53.810', '2025-03-25 14:33:53.810', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:6e8f2ef1ec0a1f39a6a38a38e39aa0284d4d878e', 'mgface通用网关', '6e8f2ef1ec0a1f39a6a38a38e39aa0284d4d878e', '20250325143337', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (102, '2025-03-25 15:13:48.206', '2025-03-25 15:13:48.206', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:81d1bdb3229922435a615884a9caab0e9669f995', 'mgface通用网关', '81d1bdb3229922435a615884a9caab0e9669f995', '20250325151333', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (103, '2025-03-25 15:19:15.206', '2025-03-25 15:19:15.206', 'exchange-eureka', 'registry.cn-shenzhen.aliyuncs.com/mgface/exchange-eureka:bc6b0beeb93da903ad04fb2830bb9816b0eab162', 'exchange-eureka', 'bc6b0beeb93da903ad04fb2830bb9816b0eab162', '20250325151844', 11);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (104, '2025-03-25 16:04:35.881', '2025-03-25 16:04:35.881', 'spot-biz-websocket', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-websocket:a7b78f0c54200dd2bfe5ea413ff5d5df44c8d02b', 'spot-biz-websocket', 'a7b78f0c54200dd2bfe5ea413ff5d5df44c8d02b', '20250325160354', 18);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (105, '2025-03-25 22:05:58.712', '2025-03-25 22:05:58.712', 'spot-entrust-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-entrust-impl:560717bdb22dfe0cbca8c5062ee2d3185667f90b', 'spot-entrust-impl', '560717bdb22dfe0cbca8c5062ee2d3185667f90b', '20250325215303', 20);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (106, '2025-03-25 22:37:48.141', '2025-03-25 22:37:48.141', 'spot-market-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-cache:8b4fddd99849a9d482a61f43966721e7eb527065', 'spot-market-cache', '8b4fddd99849a9d482a61f43966721e7eb527065', '20250325223657', 21);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (107, '2025-03-25 22:44:07.831', '2025-03-25 22:44:07.831', 'spot-market-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-impl:8b4fddd99849a9d482a61f43966721e7eb527065', 'spot-market-impl', '8b4fddd99849a9d482a61f43966721e7eb527065', '20250325223614', 22);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (108, '2025-03-25 22:52:31.792', '2025-03-25 22:52:31.792', 'spot-market-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-sync:8b4fddd99849a9d482a61f43966721e7eb527065', 'spot-market-sync', '8b4fddd99849a9d482a61f43966721e7eb527065', '20250325223833', 23);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (109, '2025-03-26 14:58:41.129', '2025-03-26 14:58:41.129', 'spot-entrust-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-entrust-impl:e9408039e1b302d42aeeb5b9cce38498de183e7a', 'spot-entrust-impl', 'e9408039e1b302d42aeeb5b9cce38498de183e7a', '20250326145801', 20);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (110, '2025-03-26 15:14:00.260', '2025-03-26 15:14:00.260', 'spot-matcher-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-sync:ac731a6f859cec605ea18fc94dd897ad8574a08e', 'spot-matcher-sync', 'ac731a6f859cec605ea18fc94dd897ad8574a08e', '20250326151321', 26);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (111, '2025-03-26 15:15:20.590', '2025-03-26 15:15:20.590', 'spot-matcher-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-cache:ac731a6f859cec605ea18fc94dd897ad8574a08e', 'spot-matcher-cache', 'ac731a6f859cec605ea18fc94dd897ad8574a08e', '20250326151439', 24);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (112, '2025-03-26 15:15:33.998', '2025-03-26 15:15:33.998', 'spot-matcher-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-impl:ac731a6f859cec605ea18fc94dd897ad8574a08e', 'spot-matcher-impl', 'ac731a6f859cec605ea18fc94dd897ad8574a08e', '20250326151443', 25);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (113, '2025-03-26 15:23:09.603', '2025-03-26 15:23:09.603', 'spot-matcher-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-sync:059e5ddc1088b4038c296007dcede5f313a360fa', 'spot-matcher-sync', '059e5ddc1088b4038c296007dcede5f313a360fa', '20250326152229', 26);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (114, '2025-03-26 15:23:09.826', '2025-03-26 15:23:09.826', 'spot-matcher-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-cache:059e5ddc1088b4038c296007dcede5f313a360fa', 'spot-matcher-cache', '059e5ddc1088b4038c296007dcede5f313a360fa', '20250326152230', 24);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (115, '2025-03-26 15:23:10.249', '2025-03-26 15:23:10.249', 'spot-matcher-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-impl:059e5ddc1088b4038c296007dcede5f313a360fa', 'spot-matcher-impl', '059e5ddc1088b4038c296007dcede5f313a360fa', '20250326152229', 25);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (116, '2025-03-26 15:23:20.866', '2025-03-26 15:23:20.866', 'spot-matcher-execution-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-execution-router:059e5ddc1088b4038c296007dcede5f313a360fa', 'spot-matcher-execution-router', '059e5ddc1088b4038c296007dcede5f313a360fa', '20250326152230', 29);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (117, '2025-03-26 15:23:22.306', '2025-03-26 15:23:22.306', 'spot-matcher-order-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-order-router:059e5ddc1088b4038c296007dcede5f313a360fa', 'spot-matcher-order-router', '059e5ddc1088b4038c296007dcede5f313a360fa', '20250326152228', 27);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (118, '2025-03-26 15:23:26.048', '2025-03-26 15:23:26.048', 'spot-matcher-market-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-market-router:059e5ddc1088b4038c296007dcede5f313a360fa', 'spot-matcher-market-router', '059e5ddc1088b4038c296007dcede5f313a360fa', '20250326152228', 28);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (119, '2025-03-26 15:33:19.745', '2025-03-26 15:33:19.745', 'spot-position-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-impl:acac009752837c646b5fa59e02732b0f5498ad04', 'spot-position-impl', 'acac009752837c646b5fa59e02732b0f5498ad04', '20250326153235', 31);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (120, '2025-03-26 15:33:29.380', '2025-03-26 15:33:29.380', 'spot-position-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-cache:acac009752837c646b5fa59e02732b0f5498ad04', 'spot-position-cache', 'acac009752837c646b5fa59e02732b0f5498ad04', '20250326153237', 30);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (121, '2025-03-26 15:33:30.210', '2025-03-26 15:33:30.210', 'spot-position-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-sync:acac009752837c646b5fa59e02732b0f5498ad04', 'spot-position-sync', 'acac009752837c646b5fa59e02732b0f5498ad04', '20250326153242', 32);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (122, '2025-03-26 16:06:38.254', '2025-03-26 16:06:38.254', 'spot-matcher-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-cache:e70755cd3241b2db84ce0641c262ebbbe638e296', 'spot-matcher-cache', 'e70755cd3241b2db84ce0641c262ebbbe638e296', '20250326160549', 24);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (123, '2025-03-26 16:08:41.876', '2025-03-26 16:08:41.876', 'spot-position-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-sync:281f97112057eba82970c912648a5d12ff629625', 'spot-position-sync', '281f97112057eba82970c912648a5d12ff629625', '20250326160800', 32);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (124, '2025-03-26 16:08:43.379', '2025-03-26 16:08:43.379', 'spot-position-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-impl:281f97112057eba82970c912648a5d12ff629625', 'spot-position-impl', '281f97112057eba82970c912648a5d12ff629625', '20250326160800', 31);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (125, '2025-03-26 16:08:45.879', '2025-03-26 16:08:45.879', 'spot-position-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-cache:281f97112057eba82970c912648a5d12ff629625', 'spot-position-cache', '281f97112057eba82970c912648a5d12ff629625', '20250326160804', 30);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (126, '2025-03-26 16:21:03.790', '2025-03-26 16:21:03.790', 'user-center', 'registry.cn-shenzhen.aliyuncs.com/mgface/user-center:4eb322a76fe896ab584c9c8d7ab2794c7ea90c38', 'user-center', '4eb322a76fe896ab584c9c8d7ab2794c7ea90c38', '20250326162028', 8);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (127, '2025-03-26 16:22:46.149', '2025-03-26 16:22:46.149', 'user-center', 'registry.cn-shenzhen.aliyuncs.com/mgface/user-center:66b2b62a5ddccdec0af996c0e7dac80e78306bd8', 'user-center', '66b2b62a5ddccdec0af996c0e7dac80e78306bd8', '20250326162212', 8);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (128, '2025-03-26 16:25:54.571', '2025-03-26 16:25:54.571', 'spot-matcher-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-impl:e927615a422e72e100be9816fe8d805ed3d94523', 'spot-matcher-impl', 'e927615a422e72e100be9816fe8d805ed3d94523', '20250326162517', 25);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (129, '2025-03-26 16:25:55.340', '2025-03-26 16:25:55.340', 'spot-matcher-market-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-market-router:e927615a422e72e100be9816fe8d805ed3d94523', 'spot-matcher-market-router', 'e927615a422e72e100be9816fe8d805ed3d94523', '20250326162518', 28);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (130, '2025-03-26 16:25:56.597', '2025-03-26 16:25:56.597', 'spot-matcher-order-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-order-router:e927615a422e72e100be9816fe8d805ed3d94523', 'spot-matcher-order-router', 'e927615a422e72e100be9816fe8d805ed3d94523', '20250326162513', 27);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (131, '2025-03-26 16:25:58.891', '2025-03-26 16:25:58.891', 'spot-matcher-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-cache:e927615a422e72e100be9816fe8d805ed3d94523', 'spot-matcher-cache', 'e927615a422e72e100be9816fe8d805ed3d94523', '20250326162519', 24);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (132, '2025-03-26 16:25:59.195', '2025-03-26 16:25:59.195', 'spot-matcher-execution-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-execution-router:e927615a422e72e100be9816fe8d805ed3d94523', 'spot-matcher-execution-router', 'e927615a422e72e100be9816fe8d805ed3d94523', '20250326162511', 29);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (133, '2025-03-26 16:26:02.506', '2025-03-26 16:26:02.506', 'spot-matcher-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-sync:e927615a422e72e100be9816fe8d805ed3d94523', 'spot-matcher-sync', 'e927615a422e72e100be9816fe8d805ed3d94523', '20250326162524', 26);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (134, '2025-03-26 16:28:05.659', '2025-03-26 16:28:05.659', 'spot-biz-internal', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-internal:59c0858c53f19e21553b66777bab093122d5cb42', 'spot-biz-internal', '59c0858c53f19e21553b66777bab093122d5cb42', '20250326162722', 17);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (135, '2025-03-26 16:28:07.179', '2025-03-26 16:28:07.179', 'spot-biz-openapi', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-openapi:59c0858c53f19e21553b66777bab093122d5cb42', 'spot-biz-openapi', '59c0858c53f19e21553b66777bab093122d5cb42', '20250326162726', 16);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (136, '2025-03-26 16:28:13.400', '2025-03-26 16:28:13.400', 'spot-biz-websocket', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-websocket:59c0858c53f19e21553b66777bab093122d5cb42', 'spot-biz-websocket', '59c0858c53f19e21553b66777bab093122d5cb42', '20250326162734', 18);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (137, '2025-03-26 16:28:36.771', '2025-03-26 16:28:36.771', 'spot-scheduled', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-scheduled:59c0858c53f19e21553b66777bab093122d5cb42', 'spot-scheduled', '59c0858c53f19e21553b66777bab093122d5cb42', '20250326162757', 19);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (138, '2025-03-26 16:29:51.188', '2025-03-26 16:29:51.188', 'spot-biz-user', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-user:59c0858c53f19e21553b66777bab093122d5cb42', 'spot-biz-user', '59c0858c53f19e21553b66777bab093122d5cb42', '20250326162904', 15);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (139, '2025-03-26 16:29:56.487', '2025-03-26 16:29:56.487', 'spot-admin-monitor', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-monitor:06cf8ebfc3c49dd365f5340fea76cf56e0daf6a9', 'spot-admin-monitor', '06cf8ebfc3c49dd365f5340fea76cf56e0daf6a9', '20250326162918', 14);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (140, '2025-03-26 16:30:09.039', '2025-03-26 16:30:09.039', 'spot-market-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-impl:c445f48750c9c983acf5f9b10f81146964b63581', 'spot-market-impl', 'c445f48750c9c983acf5f9b10f81146964b63581', '20250326162932', 22);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (141, '2025-03-26 16:30:11.229', '2025-03-26 16:30:11.229', 'spot-market-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-sync:c445f48750c9c983acf5f9b10f81146964b63581', 'spot-market-sync', 'c445f48750c9c983acf5f9b10f81146964b63581', '20250326162934', 23);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (142, '2025-03-26 16:30:19.547', '2025-03-26 16:30:19.547', 'spot-market-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-cache:c445f48750c9c983acf5f9b10f81146964b63581', 'spot-market-cache', 'c445f48750c9c983acf5f9b10f81146964b63581', '20250326162934', 21);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (143, '2025-03-26 16:30:21.833', '2025-03-26 16:30:21.833', 'spot-admin-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-impl:06cf8ebfc3c49dd365f5340fea76cf56e0daf6a9', 'spot-admin-impl', '06cf8ebfc3c49dd365f5340fea76cf56e0daf6a9', '20250326162936', 13);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (144, '2025-03-26 16:31:09.411', '2025-03-26 16:31:09.411', 'spot-entrust-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-entrust-impl:21b1e109f360d8e55857aa71f0803007da0f13ca', 'spot-entrust-impl', '21b1e109f360d8e55857aa71f0803007da0f13ca', '20250326163031', 20);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (145, '2025-03-26 16:39:51.199', '2025-03-26 16:39:51.199', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:44acf638b1067ca601434fbcf0e98e305c46b788', 'mgface通用网关', '44acf638b1067ca601434fbcf0e98e305c46b788', '20250326163933', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (146, '2025-03-26 16:39:53.636', '2025-03-26 16:39:53.636', 'mgface-hub', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:44acf638b1067ca601434fbcf0e98e305c46b788', 'mgfacehub通用网关', '44acf638b1067ca601434fbcf0e98e305c46b788', '20250326163932', 6);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (153, '2025-03-27 10:19:51.771', '2025-03-27 10:19:51.771', 'spot-matcher-order-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-order-router:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-order-router', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327101904', 27);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (154, '2025-03-27 10:19:54.357', '2025-03-27 10:19:54.357', 'spot-matcher-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-impl:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-impl', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327101905', 25);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (155, '2025-03-27 10:19:54.794', '2025-03-27 10:19:54.794', 'spot-matcher-execution-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-execution-router:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-execution-router', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327101906', 29);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (156, '2025-03-27 10:19:58.181', '2025-03-27 10:19:58.181', 'spot-matcher-market-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-market-router:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-market-router', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327101907', 28);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (157, '2025-03-27 10:19:58.933', '2025-03-27 10:19:58.933', 'spot-matcher-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-cache:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-cache', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327101910', 24);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (158, '2025-03-27 10:19:59.818', '2025-03-27 10:19:59.818', 'spot-matcher-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-sync:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-sync', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327101902', 26);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (159, '2025-03-27 11:49:57.247', '2025-03-27 11:49:57.247', 'spot-market-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-sync:75806ef341e61d372ebafb831dd4f4b005604ae2', 'spot-market-sync', '75806ef341e61d372ebafb831dd4f4b005604ae2', '20250327114919', 23);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (160, '2025-03-27 12:01:39.807', '2025-03-27 12:01:39.807', 'spot-matcher-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-sync:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-sync', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327120059', 26);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (161, '2025-03-27 12:01:40.615', '2025-03-27 12:01:40.615', 'spot-matcher-execution-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-execution-router:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-execution-router', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327120058', 29);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (162, '2025-03-27 12:01:40.715', '2025-03-27 12:01:40.715', 'spot-matcher-market-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-market-router:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-market-router', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327120057', 28);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (163, '2025-03-27 12:01:40.997', '2025-03-27 12:01:40.997', 'spot-matcher-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-cache:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-cache', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327120059', 24);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (164, '2025-03-27 12:01:42.165', '2025-03-27 12:01:42.165', 'spot-matcher-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-impl:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-impl', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327120101', 25);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (165, '2025-03-27 12:01:42.242', '2025-03-27 12:01:42.242', 'spot-matcher-order-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-order-router:5312728b96743e02eae58f6aa47bf7b3332acc3a', 'spot-matcher-order-router', '5312728b96743e02eae58f6aa47bf7b3332acc3a', '20250327120059', 27);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (166, '2025-03-27 12:15:12.865', '2025-03-27 12:15:12.865', 'spot-matcher-market-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-market-router:b1924ed7d66d02da4b055e2a7e9459cf785baf19', 'spot-matcher-market-router', 'b1924ed7d66d02da4b055e2a7e9459cf785baf19', '20250327121433', 28);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (167, '2025-03-27 12:15:14.702', '2025-03-27 12:15:14.702', 'spot-matcher-order-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-order-router:b1924ed7d66d02da4b055e2a7e9459cf785baf19', 'spot-matcher-order-router', 'b1924ed7d66d02da4b055e2a7e9459cf785baf19', '20250327121431', 27);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (168, '2025-03-27 12:15:17.759', '2025-03-27 12:15:17.759', 'spot-matcher-execution-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-execution-router:b1924ed7d66d02da4b055e2a7e9459cf785baf19', 'spot-matcher-execution-router', 'b1924ed7d66d02da4b055e2a7e9459cf785baf19', '20250327121440', 29);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (169, '2025-03-27 20:40:28.975', '2025-03-27 20:40:28.975', 'spot-market-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-cache:931126ef297a92d97507a14a655089cc74b3927f', 'spot-market-cache', '931126ef297a92d97507a14a655089cc74b3927f', '20250327203949', 21);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (170, '2025-03-27 20:40:34.615', '2025-03-27 20:40:34.615', 'spot-market-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-sync:931126ef297a92d97507a14a655089cc74b3927f', 'spot-market-sync', '931126ef297a92d97507a14a655089cc74b3927f', '20250327203953', 23);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (171, '2025-03-27 20:45:15.085', '2025-03-27 20:45:15.085', 'spot-matcher-market-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-market-router:83aae3b9689ee6a52d00582df59272937fec4932', 'spot-matcher-market-router', '83aae3b9689ee6a52d00582df59272937fec4932', '20250327204431', 28);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (172, '2025-03-27 20:47:25.619', '2025-03-27 20:47:25.619', 'spot-matcher-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-cache:83aae3b9689ee6a52d00582df59272937fec4932', 'spot-matcher-cache', '83aae3b9689ee6a52d00582df59272937fec4932', '20250327204645', 24);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (173, '2025-03-27 20:47:40.889', '2025-03-27 20:47:40.889', 'spot-matcher-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-impl:83aae3b9689ee6a52d00582df59272937fec4932', 'spot-matcher-impl', '83aae3b9689ee6a52d00582df59272937fec4932', '20250327204659', 25);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (174, '2025-03-27 20:48:18.428', '2025-03-27 20:48:18.428', 'spot-matcher-order-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-order-router:a696813d53dbd071342af24b26e4619a5a59d71d', 'spot-matcher-order-router', 'a696813d53dbd071342af24b26e4619a5a59d71d', '20250327204736', 27);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (175, '2025-03-27 20:48:21.760', '2025-03-27 20:48:21.760', 'spot-matcher-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-sync:a696813d53dbd071342af24b26e4619a5a59d71d', 'spot-matcher-sync', 'a696813d53dbd071342af24b26e4619a5a59d71d', '20250327204739', 26);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (176, '2025-03-27 20:48:23.370', '2025-03-27 20:48:23.370', 'spot-matcher-order-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-order-router:83aae3b9689ee6a52d00582df59272937fec4932', 'spot-matcher-order-router', '83aae3b9689ee6a52d00582df59272937fec4932', '20250327204742', 27);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (177, '2025-03-27 20:48:49.843', '2025-03-27 20:48:49.843', 'spot-market-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-impl:a1c0eb2adee50e543beac141b2742d7556d0b367', 'spot-market-impl', 'a1c0eb2adee50e543beac141b2742d7556d0b367', '20250327204808', 22);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (178, '2025-03-27 20:48:50.017', '2025-03-27 20:48:50.017', 'spot-market-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-sync:a1c0eb2adee50e543beac141b2742d7556d0b367', 'spot-market-sync', 'a1c0eb2adee50e543beac141b2742d7556d0b367', '20250327204808', 23);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (179, '2025-03-27 20:48:59.045', '2025-03-27 20:48:59.045', 'spot-market-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-cache:a1c0eb2adee50e543beac141b2742d7556d0b367', 'spot-market-cache', 'a1c0eb2adee50e543beac141b2742d7556d0b367', '20250327204809', 21);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (180, '2025-03-27 20:49:18.221', '2025-03-27 20:49:18.221', 'spot-entrust-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-entrust-impl:444f337082d87d7925b329c70ffe8dc8b55d03e2', 'spot-entrust-impl', '444f337082d87d7925b329c70ffe8dc8b55d03e2', '20250327204838', 20);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (181, '2025-03-27 21:01:38.669', '2025-03-27 21:01:38.669', 'spot-position-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-impl:8f709b4f34705144686e0ec42041737aa6b21dac', 'spot-position-impl', '8f709b4f34705144686e0ec42041737aa6b21dac', '20250327210059', 31);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (182, '2025-03-27 21:01:49.514', '2025-03-27 21:01:49.514', 'spot-position-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-cache:8f709b4f34705144686e0ec42041737aa6b21dac', 'spot-position-cache', '8f709b4f34705144686e0ec42041737aa6b21dac', '20250327210111', 30);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (183, '2025-03-27 21:03:08.593', '2025-03-27 21:03:08.593', 'spot-position-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-sync:8f709b4f34705144686e0ec42041737aa6b21dac', 'spot-position-sync', '8f709b4f34705144686e0ec42041737aa6b21dac', '20250327210134', 32);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (184, '2025-03-27 21:08:04.890', '2025-03-27 21:08:04.890', 'spot-position-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-sync:77266c6c905663a8809482e19e2757efb54e9124', 'spot-position-sync', '77266c6c905663a8809482e19e2757efb54e9124', '20250327210722', 32);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (185, '2025-03-27 21:08:06.581', '2025-03-27 21:08:06.581', 'spot-position-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-impl:77266c6c905663a8809482e19e2757efb54e9124', 'spot-position-impl', '77266c6c905663a8809482e19e2757efb54e9124', '20250327210722', 31);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (186, '2025-03-27 21:08:21.934', '2025-03-27 21:08:21.934', 'spot-position-cache', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-cache:77266c6c905663a8809482e19e2757efb54e9124', 'spot-position-cache', '77266c6c905663a8809482e19e2757efb54e9124', '20250327210735', 30);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (187, '2025-03-27 21:11:42.885', '2025-03-27 21:11:42.885', 'spot-matcher-sync', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-sync:83aae3b9689ee6a52d00582df59272937fec4932', 'spot-matcher-sync', '83aae3b9689ee6a52d00582df59272937fec4932', '20250327204641', 26);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (188, '2025-03-27 21:16:12.418', '2025-03-27 21:16:12.418', 'spot-biz-openapi', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-openapi:8c2483d76740203294c14fbc3786b99cfb0036cf', 'spot-biz-openapi', '8c2483d76740203294c14fbc3786b99cfb0036cf', '20250327211531', 16);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (189, '2025-03-27 21:16:51.063', '2025-03-27 21:16:51.063', 'spot-biz-internal', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-internal:8c2483d76740203294c14fbc3786b99cfb0036cf', 'spot-biz-internal', '8c2483d76740203294c14fbc3786b99cfb0036cf', '20250327211609', 17);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (190, '2025-03-27 21:18:17.757', '2025-03-27 21:18:17.757', 'spot-biz-websocket', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-websocket:8c2483d76740203294c14fbc3786b99cfb0036cf', 'spot-biz-websocket', '8c2483d76740203294c14fbc3786b99cfb0036cf', '20250327211735', 18);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (191, '2025-03-27 21:19:11.794', '2025-03-27 21:19:11.794', 'spot-matcher-execution-router', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-execution-router:83aae3b9689ee6a52d00582df59272937fec4932', 'spot-matcher-execution-router', '83aae3b9689ee6a52d00582df59272937fec4932', '20250327204858', 29);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (192, '2025-03-27 21:20:36.154', '2025-03-27 21:20:36.154', 'spot-scheduled', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-scheduled:8c2483d76740203294c14fbc3786b99cfb0036cf', 'spot-scheduled', '8c2483d76740203294c14fbc3786b99cfb0036cf', '20250327211755', 19);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (193, '2025-03-27 21:54:30.480', '2025-03-27 21:54:30.480', 'mgface-gateway', 'registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:bc8b9cc0cb773ee021076e2858f5034778215a6d', 'mgface通用网关', 'bc8b9cc0cb773ee021076e2858f5034778215a6d', '20250327215413', 5);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (194, '2025-03-27 21:59:32.555', '2025-03-27 21:59:32.555', 'spot-biz-user', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-user:8c2483d76740203294c14fbc3786b99cfb0036cf', 'spot-biz-user', '8c2483d76740203294c14fbc3786b99cfb0036cf', '20250327211837', 15);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (195, '2025-03-27 22:06:51.389', '2025-03-27 22:06:51.389', 'spot-admin-monitor', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-monitor:7d87883958138b256024899d06f93577c9536b08', 'spot-admin-monitor', '7d87883958138b256024899d06f93577c9536b08', '20250327212334', 14);
INSERT INTO `containers` (`id`, `created_at`, `updated_at`, `name`, `address`, `service_name`, `md5`, `version`, `service_id`) VALUES (196, '2025-03-27 22:14:45.595', '2025-03-27 22:14:45.595', 'spot-admin-impl', 'registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-impl:7d87883958138b256024899d06f93577c9536b08', 'spot-admin-impl', '7d87883958138b256024899d06f93577c9536b08', '20250327212454', 13);
COMMIT;

-- ----------------------------
-- Table structure for deploy_logs
-- ----------------------------
DROP TABLE IF EXISTS `deploy_logs`;
CREATE TABLE `deploy_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '日志ID',
  `deploy_id` int unsigned NOT NULL COMMENT '部署ID',
  `content` text NOT NULL COMMENT '日志内容',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_deploy_id` (`deploy_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部署日志表';

-- ----------------------------
-- Records of deploy_logs
-- ----------------------------
BEGIN;
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1, 1, '开始执行部署...', '2025-03-15 09:29:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (2, 1, '拉取镜像成功', '2025-03-15 09:31:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (3, 1, '启动容器成功', '2025-03-15 09:34:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (4, 1, '部署完成', '2025-03-15 09:36:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (5, 2, '开始执行部署...', '2025-03-15 09:39:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (6, 2, '部署已取消', '2025-03-15 17:46:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (7, 1, '开始测试部署...', '2025-03-15 17:46:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (8, 1, '测试部署完成', '2025-03-15 17:46:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (9, 3, '部署已取消', '2025-03-15 17:49:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (10, 4, '部署已取消', '2025-03-15 17:58:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (11, 5, '开始执行部署...', '2025-03-15 23:06:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (12, 5, '准备发送文件 docker-compose-godeep.yml 到服务器 腾讯 的 /root/deploys 目录', '2025-03-15 23:06:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (13, 5, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-15 23:06:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (14, 5, '开始拉取镜像...', '2025-03-15 23:06:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (15, 5, '镜像拉取成功', '2025-03-15 23:06:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (16, 5, '开始启动容器...', '2025-03-15 23:06:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (17, 5, '启动容器失败: Process exited with status 1', '2025-03-15 23:06:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (18, 5, '开始执行部署...', '2025-03-15 23:07:22');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (19, 5, '准备发送文件 docker-compose-godeep.yml 到服务器 腾讯 的 /root/deploys 目录', '2025-03-15 23:07:22');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (20, 5, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-15 23:07:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (21, 5, '开始拉取镜像...', '2025-03-15 23:07:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (22, 5, '镜像拉取成功', '2025-03-15 23:07:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (23, 5, '开始启动容器...', '2025-03-15 23:07:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (24, 5, '启动容器失败: Process exited with status 1', '2025-03-15 23:07:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (25, 5, '开始执行部署...', '2025-03-15 23:14:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (26, 5, '准备发送文件 docker-compose-godeep.yml 到服务器 腾讯 的 /root/deploys 目录', '2025-03-15 23:14:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (27, 5, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-15 23:14:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (28, 5, '开始拉取镜像...', '2025-03-15 23:14:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (29, 5, '镜像拉取成功', '2025-03-15 23:14:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (30, 5, '开始启动容器...', '2025-03-15 23:14:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (31, 5, '容器启动成功', '2025-03-15 23:14:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (32, 5, '部署完成', '2025-03-15 23:14:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (33, 5, '开始测试部署...', '2025-03-15 23:33:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (34, 5, '开始测试部署...', '2025-03-15 23:34:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (35, 5, '开始测试部署...', '2025-03-15 23:34:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (36, 5, '开始测试部署...', '2025-03-15 23:35:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (37, 5, '开始测试部署...', '2025-03-15 23:36:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (38, 5, '开始测试部署...', '2025-03-15 23:38:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (39, 5, '开始测试部署...', '2025-03-15 23:39:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (40, 5, '开始测试部署...', '2025-03-15 23:49:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (41, 5, '开始测试部署...', '2025-03-15 23:50:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (42, 5, '开始测试部署...', '2025-03-15 23:50:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (43, 5, '开始测试部署...', '2025-03-15 23:50:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (44, 5, '开始测试部署...', '2025-03-15 23:52:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (45, 5, '开始测试部署...', '2025-03-15 23:54:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (46, 5, '开始测试部署...', '2025-03-15 23:54:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (47, 5, '开始测试部署...', '2025-03-15 23:55:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (48, 5, '开始测试部署...', '2025-03-15 23:58:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (49, 5, '开始测试部署...', '2025-03-16 00:00:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (50, 5, '开始测试部署...', '2025-03-16 00:04:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (51, 5, '测试部署完成', '2025-03-16 00:04:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (52, 5, '开始测试部署...', '2025-03-16 00:07:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (53, 5, '测试链接:http://175.178.2.21:18080/health 成功', '2025-03-16 00:08:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (54, 5, '测试部署完成', '2025-03-16 00:08:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (55, 5, '开始测试部署...', '2025-03-16 00:08:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (56, 5, '测试链接:http://175.178.2.21:18080/health 成功', '2025-03-16 00:08:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (57, 5, '测试部署完成', '2025-03-16 00:08:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (58, 5, '开始测试部署...', '2025-03-16 00:08:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (59, 5, '测试链接:http://175.178.2.21:18080/health 成功', '2025-03-16 00:08:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (60, 5, '测试部署完成', '2025-03-16 00:08:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (61, 5, '开始测试部署...', '2025-03-16 00:15:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (62, 5, '测试链接:http://175.178.2.21:18080/health 成功', '2025-03-16 00:15:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (63, 5, '测试部署完成', '2025-03-16 00:15:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (64, 1, '开始测试部署...', '2025-03-16 00:15:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (65, 5, '开始测试部署...', '2025-03-16 00:15:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (66, 5, '测试链接:http://175.178.2.21:18080/health 成功', '2025-03-16 00:15:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (67, 5, '测试部署完成', '2025-03-16 00:15:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (68, 6, '开始执行部署...', '2025-03-16 00:29:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (69, 6, '准备发送文件 docker-compose-godeep.yml 到服务器 腾讯(175.178.2.21) 的 /root/deploys 目录', '2025-03-16 00:29:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (70, 6, '开始执行部署...', '2025-03-16 00:33:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (71, 6, '准备发送文件 docker-compose-godeep.yml 到服务器 腾讯(175.178.2.21) 的 /root/deploys 目录', '2025-03-16 00:33:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (72, 6, '开始执行部署...', '2025-03-16 00:36:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (73, 6, '准备发送文件 docker-compose-godeep.yml 到服务器 腾讯(175.178.2.21) 的 /root/deploys 目录', '2025-03-16 00:36:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (74, 6, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-16 00:36:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (75, 6, '开始拉取镜像...', '2025-03-16 00:36:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (76, 6, '拉取镜像失败: Process exited with status 1', '2025-03-16 00:36:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (77, 7, '开始执行部署...', '2025-03-16 00:41:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (78, 7, '准备发送文件 docker-compose-godeep.yml 到服务器 腾讯(175.178.2.21) 的 /root/deploys 目录', '2025-03-16 00:41:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (79, 7, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-16 00:41:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (80, 7, '开始拉取镜像...', '2025-03-16 00:41:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (81, 7, '镜像拉取成功', '2025-03-16 00:41:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (82, 7, '开始启动容器...', '2025-03-16 00:41:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (83, 7, '容器启动成功', '2025-03-16 00:41:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (84, 7, '部署完成', '2025-03-16 00:41:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (85, 8, '开始执行部署...', '2025-03-16 14:32:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (86, 8, '准备发送文件 docker-compose-godeep.yml 到服务器 腾讯(175.178.2.21) 的 /root/deploys 目录', '2025-03-16 14:32:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (87, 8, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-16 14:32:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (88, 8, '开始拉取镜像...', '2025-03-16 14:32:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (89, 8, '镜像拉取成功', '2025-03-16 14:32:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (90, 8, '开始启动容器...', '2025-03-16 14:32:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (91, 8, '容器启动成功', '2025-03-16 14:32:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (92, 8, '部署完成', '2025-03-16 14:32:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (93, 8, '开始测试部署...', '2025-03-16 14:32:22');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (94, 8, '测试链接:http://175.178.2.21:18080/health 成功', '2025-03-16 14:32:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (95, 8, '测试部署完成', '2025-03-16 14:32:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (96, 9, '开始执行部署...', '2025-03-16 14:59:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (97, 9, '准备发送文件 docker-compose-godeep.yml 到服务器 腾讯(175.178.2.21) 的 /root/deploys 目录', '2025-03-16 14:59:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (98, 9, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-16 14:59:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (99, 9, '开始拉取镜像...', '2025-03-16 14:59:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (100, 9, '镜像拉取成功', '2025-03-16 14:59:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (101, 9, '开始启动容器...', '2025-03-16 14:59:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (102, 9, '容器启动成功', '2025-03-16 14:59:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (103, 9, '部署完成', '2025-03-16 14:59:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (104, 9, '开始测试部署...', '2025-03-16 14:59:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (105, 9, '测试链接:http://175.178.2.21:18080/health 成功', '2025-03-16 14:59:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (106, 9, '测试部署完成', '2025-03-16 14:59:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (107, 9, '开始测试部署...', '2025-03-16 15:20:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (108, 9, '测试链接:http://175.178.2.21:18080/health 成功', '2025-03-16 15:20:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (109, 9, '测试部署完成', '2025-03-16 15:20:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (110, 8, '开始测试部署...', '2025-03-16 15:20:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (111, 8, '测试链接:http://175.178.2.21:18080/health 成功', '2025-03-16 15:20:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (112, 8, '测试部署完成', '2025-03-16 15:20:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (113, 10, '开始执行部署...', '2025-03-16 17:51:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (114, 10, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 17:51:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (115, 10, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 17:51:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (116, 10, '开始拉取镜像...', '2025-03-16 17:51:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (117, 10, '镜像拉取成功', '2025-03-16 17:51:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (118, 10, '开始启动容器...', '2025-03-16 17:51:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (119, 10, '启动容器失败: Process exited with status 1', '2025-03-16 17:51:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (120, 10, '开始执行部署...', '2025-03-16 17:54:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (121, 10, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 17:54:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (122, 10, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 17:54:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (123, 10, '开始拉取镜像...', '2025-03-16 17:54:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (124, 10, '镜像拉取成功', '2025-03-16 17:54:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (125, 10, '开始启动容器...', '2025-03-16 17:54:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (126, 10, '容器启动成功', '2025-03-16 17:54:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (127, 10, '部署完成', '2025-03-16 17:54:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (128, 10, '开始测试部署...', '2025-03-16 17:56:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (129, 10, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-16 17:56:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (130, 10, '开始测试部署...', '2025-03-16 17:56:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (131, 10, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-16 17:56:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (132, 10, '开始测试部署...', '2025-03-16 17:57:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (133, 10, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-16 17:57:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (134, 10, '开始测试部署...', '2025-03-16 17:57:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (135, 10, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-16 17:57:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (136, 10, '开始测试部署...', '2025-03-16 17:59:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (137, 10, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-16 17:59:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (138, 11, '开始执行部署...', '2025-03-16 18:09:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (139, 11, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 18:09:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (140, 11, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 18:09:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (141, 11, '开始拉取镜像...', '2025-03-16 18:09:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (142, 11, '镜像拉取成功', '2025-03-16 18:09:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (143, 11, '开始启动容器...', '2025-03-16 18:09:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (144, 11, '容器启动成功', '2025-03-16 18:10:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (145, 11, '部署完成', '2025-03-16 18:10:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (146, 11, '开始测试部署...', '2025-03-16 18:10:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (147, 11, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-16 18:10:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (148, 12, '开始执行部署...', '2025-03-16 18:35:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (149, 12, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 18:35:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (150, 12, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 18:35:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (151, 12, '开始拉取镜像...', '2025-03-16 18:35:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (152, 12, '镜像拉取成功', '2025-03-16 18:36:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (153, 12, '开始启动容器...', '2025-03-16 18:36:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (154, 12, '容器启动成功', '2025-03-16 18:36:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (155, 12, '部署完成', '2025-03-16 18:36:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (156, 12, '开始测试部署...', '2025-03-16 18:36:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (157, 12, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-16 18:36:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (158, 13, '开始执行部署...', '2025-03-16 18:38:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (159, 13, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 18:38:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (160, 13, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 18:38:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (161, 13, '开始拉取镜像...', '2025-03-16 18:38:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (162, 13, '镜像拉取成功', '2025-03-16 18:38:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (163, 13, '开始启动容器...', '2025-03-16 18:38:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (164, 13, '容器启动成功', '2025-03-16 18:38:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (165, 13, '部署完成', '2025-03-16 18:38:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (166, 14, '开始执行部署...', '2025-03-16 19:07:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (167, 14, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 19:07:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (168, 14, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-16 19:07:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (169, 14, '开始拉取镜像...', '2025-03-16 19:07:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (170, 14, '镜像拉取成功', '2025-03-16 19:07:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (171, 14, '开始启动容器...', '2025-03-16 19:07:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (172, 14, '容器启动成功', '2025-03-16 19:07:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (173, 14, '部署完成', '2025-03-16 19:07:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (174, 14, '开始测试部署...', '2025-03-16 19:07:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (175, 14, '测试链接:http://120.77.78.126:18080/health 成功', '2025-03-16 19:07:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (176, 14, '测试部署完成', '2025-03-16 19:07:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (177, 15, '开始执行部署...', '2025-03-16 19:21:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (178, 15, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 19:21:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (179, 15, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 19:21:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (180, 15, '开始拉取镜像...', '2025-03-16 19:21:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (181, 15, '镜像拉取成功', '2025-03-16 19:21:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (182, 15, '开始启动容器...', '2025-03-16 19:21:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (183, 15, '容器启动成功', '2025-03-16 19:21:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (184, 15, '部署完成', '2025-03-16 19:21:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (185, 16, '开始执行部署...', '2025-03-16 19:58:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (186, 16, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 19:58:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (187, 16, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 19:58:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (188, 16, '开始拉取镜像...', '2025-03-16 19:58:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (189, 16, '镜像拉取成功', '2025-03-16 19:58:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (190, 16, '开始启动容器...', '2025-03-16 19:58:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (191, 16, '容器启动成功', '2025-03-16 19:58:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (192, 16, '部署完成', '2025-03-16 19:58:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (193, 17, '开始执行部署...', '2025-03-16 19:59:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (194, 17, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 19:59:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (195, 17, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-16 19:59:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (196, 17, '开始拉取镜像...', '2025-03-16 19:59:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (197, 17, '镜像拉取成功', '2025-03-16 19:59:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (198, 17, '开始启动容器...', '2025-03-16 19:59:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (199, 18, '开始执行部署...', '2025-03-16 20:00:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (200, 18, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 20:00:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (201, 18, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-16 20:00:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (202, 18, '开始拉取镜像...', '2025-03-16 20:00:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (203, 18, '镜像拉取成功', '2025-03-16 20:00:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (204, 18, '开始启动容器...', '2025-03-16 20:00:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (205, 18, '容器启动成功', '2025-03-16 20:00:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (206, 18, '部署完成', '2025-03-16 20:00:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (207, 19, '开始执行部署...', '2025-03-16 20:08:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (208, 19, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 20:08:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (209, 19, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 20:08:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (210, 19, '开始拉取镜像...', '2025-03-16 20:08:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (211, 19, '镜像拉取成功', '2025-03-16 20:08:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (212, 19, '开始启动容器...', '2025-03-16 20:08:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (213, 19, '容器启动成功', '2025-03-16 20:08:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (214, 19, '部署完成', '2025-03-16 20:08:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (215, 20, '开始执行部署...', '2025-03-16 20:51:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (216, 20, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 20:51:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (217, 20, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-16 20:51:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (218, 20, '开始拉取镜像...', '2025-03-16 20:51:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (219, 20, '镜像拉取成功', '2025-03-16 20:51:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (220, 20, '开始启动容器...', '2025-03-16 20:51:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (221, 20, '容器启动成功', '2025-03-16 20:51:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (222, 20, '部署完成', '2025-03-16 20:51:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (223, 20, '开始测试部署...', '2025-03-16 20:51:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (224, 20, '测试链接:http://120.77.78.126:18080/health 成功', '2025-03-16 20:51:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (225, 20, '测试部署完成', '2025-03-16 20:51:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (226, 21, '开始执行部署...', '2025-03-16 21:23:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (227, 21, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 21:23:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (228, 21, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 21:23:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (229, 21, '开始拉取镜像...', '2025-03-16 21:23:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (230, 21, '镜像拉取成功', '2025-03-16 21:23:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (231, 21, '开始启动容器...', '2025-03-16 21:23:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (232, 21, '容器启动成功', '2025-03-16 21:23:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (233, 21, '部署完成', '2025-03-16 21:23:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (234, 22, '开始执行部署...', '2025-03-16 21:28:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (235, 22, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-16 21:28:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (236, 22, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-16 21:28:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (237, 22, '开始拉取镜像...', '2025-03-16 21:28:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (238, 22, '镜像拉取成功', '2025-03-16 21:28:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (239, 22, '开始启动容器...', '2025-03-16 21:28:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (240, 22, '容器启动成功', '2025-03-16 21:28:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (241, 22, '部署完成', '2025-03-16 21:28:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (242, 22, '开始测试部署...', '2025-03-16 21:28:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (243, 22, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-16 21:28:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (244, 23, '开始执行部署...', '2025-03-17 22:33:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (245, 23, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-17 22:33:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (246, 23, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-17 22:33:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (247, 23, '开始拉取镜像...', '2025-03-17 22:33:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (248, 23, '镜像拉取成功', '2025-03-17 22:33:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (249, 23, '开始启动容器...', '2025-03-17 22:33:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (250, 23, '开始执行部署...', '2025-03-17 22:56:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (251, 23, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-17 22:56:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (252, 23, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-17 22:56:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (253, 23, '开始拉取镜像...', '2025-03-17 22:56:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (254, 23, '镜像拉取成功', '2025-03-17 22:56:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (255, 23, '开始启动容器...', '2025-03-17 22:56:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (256, 23, '容器启动成功', '2025-03-17 22:56:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (257, 23, '部署完成', '2025-03-17 22:56:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (258, 23, '开始测试部署...', '2025-03-17 22:56:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (259, 23, '测试链接:http://120.77.78.126:18080/health 成功', '2025-03-17 22:56:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (260, 23, '测试部署完成', '2025-03-17 22:56:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (261, 24, '开始执行部署...', '2025-03-17 22:57:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (262, 24, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-17 22:57:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (263, 24, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-17 22:57:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (264, 24, '开始拉取镜像...', '2025-03-17 22:57:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (265, 24, '镜像拉取成功', '2025-03-17 22:57:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (266, 24, '开始启动容器...', '2025-03-17 22:57:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (267, 24, '容器启动成功', '2025-03-17 22:57:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (268, 24, '部署完成', '2025-03-17 22:57:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (269, 25, '开始执行部署...', '2025-03-17 23:00:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (270, 25, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-17 23:00:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (271, 25, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-17 23:00:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (272, 25, '开始拉取镜像...', '2025-03-17 23:00:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (273, 25, '镜像拉取成功', '2025-03-17 23:00:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (274, 25, '开始启动容器...', '2025-03-17 23:00:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (275, 25, '容器启动成功', '2025-03-17 23:00:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (276, 25, '部署完成', '2025-03-17 23:00:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (277, 26, '开始执行部署...', '2025-03-17 23:08:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (278, 26, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-17 23:08:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (279, 26, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-17 23:08:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (280, 26, '开始拉取镜像...', '2025-03-17 23:08:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (281, 26, '镜像拉取成功', '2025-03-17 23:08:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (282, 26, '开始启动容器...', '2025-03-17 23:08:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (283, 26, '开始执行部署...', '2025-03-17 23:09:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (284, 26, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-17 23:09:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (285, 26, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-17 23:09:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (286, 26, '开始拉取镜像...', '2025-03-17 23:09:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (287, 26, '镜像拉取成功', '2025-03-17 23:09:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (288, 26, '开始启动容器...', '2025-03-17 23:09:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (289, 26, '容器启动成功', '2025-03-17 23:09:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (290, 26, '部署完成', '2025-03-17 23:09:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (291, 26, '开始测试部署...', '2025-03-17 23:09:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (292, 26, '测试链接:http://120.77.78.126:18080/health 成功', '2025-03-17 23:09:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (293, 26, '测试部署完成', '2025-03-17 23:09:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (294, 27, '开始执行部署...', '2025-03-18 12:25:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (295, 27, '准备发送文件 alert-core.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-18 12:25:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (296, 27, '文件发送成功: /root/deploys/alert-core.yml', '2025-03-18 12:25:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (297, 27, '开始拉取镜像...', '2025-03-18 12:25:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (298, 27, '镜像拉取成功', '2025-03-18 12:25:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (299, 27, '开始启动容器...', '2025-03-18 12:25:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (300, 27, '容器启动成功', '2025-03-18 12:25:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (301, 27, '部署完成', '2025-03-18 12:25:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (302, 27, '开始测试部署...', '2025-03-18 12:25:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (303, 27, '开始测试部署...', '2025-03-18 12:25:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (304, 27, '开始测试部署...', '2025-03-18 12:25:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (305, 27, '开始测试部署...', '2025-03-18 12:27:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (306, 27, '开始测试部署...', '2025-03-18 12:27:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (307, 28, '开始执行部署...', '2025-03-18 12:28:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (308, 28, '准备发送文件 alert-core.yml 到服务器 HK(206.237.12.148) 的 /root/deploys 目录', '2025-03-18 12:28:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (309, 28, '文件发送成功: /root/deploys/alert-core.yml', '2025-03-18 12:28:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (310, 28, '开始拉取镜像...', '2025-03-18 12:28:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (311, 28, '镜像拉取成功', '2025-03-18 12:28:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (312, 28, '开始启动容器...', '2025-03-18 12:28:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (313, 28, '启动容器失败: Process exited with status 1', '2025-03-18 12:28:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (314, 29, '开始执行部署...', '2025-03-18 12:31:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (315, 29, '准备发送文件 alert-core.yml 到服务器 HK(206.237.12.148) 的 /root/deploys 目录', '2025-03-18 12:31:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (316, 29, '文件发送成功: /root/deploys/alert-core.yml', '2025-03-18 12:31:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (317, 29, '开始拉取镜像...', '2025-03-18 12:31:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (318, 29, '镜像拉取成功', '2025-03-18 12:31:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (319, 29, '开始启动容器...', '2025-03-18 12:31:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (320, 29, '容器启动成功', '2025-03-18 12:31:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (321, 29, '部署完成', '2025-03-18 12:31:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (322, 29, '开始测试部署...', '2025-03-18 12:31:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (323, 29, '开始测试部署...', '2025-03-18 12:33:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (324, 29, '开始测试部署...', '2025-03-18 12:36:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (325, 29, '开始测试部署...', '2025-03-18 12:37:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (326, 29, '开始测试部署...', '2025-03-18 12:38:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (327, 30, '开始执行部署...', '2025-03-18 12:45:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (328, 30, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-18 12:45:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (329, 30, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-18 12:45:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (330, 30, '开始拉取镜像...', '2025-03-18 12:45:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (331, 30, '镜像拉取成功', '2025-03-18 12:45:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (332, 30, '开始启动容器...', '2025-03-18 12:45:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (333, 30, '容器启动成功', '2025-03-18 12:45:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (334, 30, '部署完成', '2025-03-18 12:45:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (335, 30, '开始测试部署...', '2025-03-18 12:45:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (336, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 12:45:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (337, 30, '开始测试部署...', '2025-03-18 12:45:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (338, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 12:45:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (339, 30, '开始测试部署...', '2025-03-18 12:46:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (340, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 12:46:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (341, 30, '开始测试部署...', '2025-03-18 12:46:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (342, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 12:46:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (343, 30, '开始测试部署...', '2025-03-18 12:46:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (344, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 12:46:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (345, 29, '开始测试部署...', '2025-03-18 12:46:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (346, 30, '开始测试部署...', '2025-03-18 12:49:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (347, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 12:49:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (348, 26, '开始测试部署...', '2025-03-18 12:49:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (349, 26, '测试链接:http://120.77.78.126:18080/health 成功', '2025-03-18 12:49:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (350, 26, '测试部署完成', '2025-03-18 12:49:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (351, 27, '开始测试部署...', '2025-03-18 12:50:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (352, 26, '开始测试部署...', '2025-03-18 12:50:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (353, 26, '测试链接:http://120.77.78.126:18080/health 成功', '2025-03-18 12:50:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (354, 26, '测试部署完成', '2025-03-18 12:50:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (355, 25, '开始测试部署...', '2025-03-18 14:11:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (356, 25, '测试链接:http://120.77.78.126:18080/health 成功', '2025-03-18 14:11:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (357, 25, '测试部署完成', '2025-03-18 14:11:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (358, 30, '开始测试部署...', '2025-03-18 14:11:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (359, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 14:11:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (360, 27, '开始测试部署...', '2025-03-18 14:11:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (361, 27, '开始测试部署...', '2025-03-18 14:12:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (362, 26, '开始测试部署...', '2025-03-18 14:12:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (363, 26, '测试链接:http://120.77.78.126:18080/health 成功', '2025-03-18 14:12:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (364, 26, '测试部署完成', '2025-03-18 14:12:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (365, 30, '开始测试部署...', '2025-03-18 14:13:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (366, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 14:13:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (367, 30, '开始测试部署...', '2025-03-18 14:14:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (368, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 14:14:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (369, 30, '开始测试部署...', '2025-03-18 14:14:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (370, 30, '测试链接:http://120.77.78.126:80/health 成功', '2025-03-18 14:14:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (371, 30, '开始测试部署...', '2025-03-18 15:14:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (372, 30, '测试端口连接:120.77.78.126:80 成功', '2025-03-18 15:14:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (373, 30, '测试端口连接:120.77.78.126:443 成功', '2025-03-18 15:14:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (374, 30, '测试部署完成', '2025-03-18 15:14:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (375, 29, '开始测试部署...', '2025-03-18 15:14:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (376, 29, '测试端口连接:206.237.12.148:6060 失败', '2025-03-18 15:14:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (377, 29, '开始测试部署...', '2025-03-18 15:15:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (378, 29, '测试端口连接:206.237.12.148:6060 失败', '2025-03-18 15:15:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (379, 23, '开始测试部署...', '2025-03-18 15:16:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (380, 23, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 15:16:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (381, 23, '测试部署完成', '2025-03-18 15:16:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (382, 26, '开始测试部署...', '2025-03-18 15:16:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (383, 26, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 15:16:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (384, 26, '测试部署完成', '2025-03-18 15:16:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (385, 31, '开始执行部署...', '2025-03-18 15:45:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (386, 31, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-18 15:45:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (387, 31, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-18 15:45:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (388, 31, '开始拉取镜像...', '2025-03-18 15:45:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (389, 31, '镜像拉取成功', '2025-03-18 15:45:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (390, 31, '开始启动容器...', '2025-03-18 15:45:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (391, 31, '开始测试部署...', '2025-03-18 15:46:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (392, 31, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 15:46:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (393, 31, '测试部署完成', '2025-03-18 15:46:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (394, 31, '开始测试部署...', '2025-03-18 16:03:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (395, 31, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 16:03:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (396, 31, '测试部署完成', '2025-03-18 16:03:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (397, 29, '开始测试部署...', '2025-03-18 16:04:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (398, 29, '测试端口连接:206.237.12.148:6060 失败', '2025-03-18 16:04:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (399, 30, '开始测试部署...', '2025-03-18 16:04:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (400, 30, '测试端口连接:120.77.78.126:80 成功', '2025-03-18 16:04:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (401, 30, '测试端口连接:120.77.78.126:443 成功', '2025-03-18 16:04:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (402, 30, '测试部署完成', '2025-03-18 16:04:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (403, 28, '开始测试部署...', '2025-03-18 16:05:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (404, 28, '测试端口连接:206.237.12.148:6060 失败', '2025-03-18 16:05:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (405, 31, '开始测试部署...', '2025-03-18 16:11:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (406, 31, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 16:11:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (407, 31, '测试部署完成', '2025-03-18 16:11:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (408, 31, '开始测试部署...', '2025-03-18 16:12:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (409, 31, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 16:12:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (410, 31, '测试部署完成', '2025-03-18 16:12:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (411, 31, '开始测试部署...', '2025-03-18 16:13:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (412, 31, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 16:13:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (413, 31, '测试部署完成', '2025-03-18 16:13:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (414, 31, '开始测试部署...', '2025-03-18 16:14:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (415, 31, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 16:14:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (416, 31, '测试部署完成', '2025-03-18 16:14:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (417, 31, '开始测试部署...', '2025-03-18 16:14:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (418, 31, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 16:14:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (419, 31, '测试部署完成', '2025-03-18 16:14:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (420, 31, '开始测试部署...', '2025-03-18 16:15:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (421, 31, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 16:15:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (422, 31, '测试部署完成', '2025-03-18 16:15:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (423, 28, '开始测试部署...', '2025-03-18 16:15:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (424, 28, '测试端口连接:206.237.12.148:6060 失败', '2025-03-18 16:15:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (425, 32, '开始执行部署...', '2025-03-18 16:17:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (426, 32, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-18 16:17:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (427, 32, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-18 16:17:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (428, 32, '开始拉取镜像...', '2025-03-18 16:17:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (429, 32, '镜像拉取成功', '2025-03-18 16:17:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (430, 32, '开始启动容器...', '2025-03-18 16:17:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (431, 32, '容器启动成功', '2025-03-18 16:17:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (432, 32, '部署完成', '2025-03-18 16:17:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (433, 32, '开始测试部署...', '2025-03-18 16:17:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (434, 32, '测试端口连接:120.77.78.126:18080 成功', '2025-03-18 16:17:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (435, 32, '测试部署完成', '2025-03-18 16:17:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (436, 33, '开始执行部署...', '2025-03-19 17:07:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (437, 33, '准备发送文件 user-center.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-19 17:07:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (438, 33, '文件发送成功: /root/deploys/user-center.yml', '2025-03-19 17:07:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (439, 33, '开始拉取镜像...', '2025-03-19 17:07:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (440, 33, '拉取镜像失败: Process exited with status 15', '2025-03-19 17:07:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (441, 34, '开始执行部署...', '2025-03-19 17:11:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (442, 34, '准备发送文件 user-center.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-19 17:11:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (443, 34, '文件发送成功: /root/deploys/user-center.yml', '2025-03-19 17:11:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (444, 34, '开始拉取镜像...', '2025-03-19 17:11:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (445, 34, '拉取镜像失败: Process exited with status 15', '2025-03-19 17:11:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (446, 34, '开始测试部署...', '2025-03-19 17:11:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (447, 34, '测试端口连接:172.93.45.93:888 失败', '2025-03-19 17:11:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (448, 35, '开始执行部署...', '2025-03-19 17:14:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (449, 35, '准备发送文件 user-center.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-19 17:14:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (450, 35, '文件发送成功: /root/deploys/user-center.yml', '2025-03-19 17:14:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (451, 35, '开始拉取镜像...', '2025-03-19 17:14:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (452, 35, '拉取镜像失败: Process exited with status 15', '2025-03-19 17:14:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (453, 35, '开始测试部署...', '2025-03-19 17:16:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (454, 35, '测试端口连接:172.93.45.93:888 失败', '2025-03-19 17:16:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (455, 34, '开始执行部署...', '2025-03-19 17:17:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (456, 34, '准备发送文件 user-center.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-19 17:17:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (457, 34, '文件发送成功: /root/deploys/user-center.yml', '2025-03-19 17:17:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (458, 34, '开始拉取镜像...', '2025-03-19 17:17:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (459, 34, '拉取镜像失败: Process exited with status 15', '2025-03-19 17:17:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (460, 35, '开始执行部署...', '2025-03-19 17:21:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (461, 35, '准备发送文件 user-center.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-19 17:21:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (462, 35, '文件发送成功: /root/deploys/user-center.yml', '2025-03-19 17:21:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (463, 35, '开始拉取镜像...', '2025-03-19 17:21:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (464, 35, '镜像拉取成功', '2025-03-19 17:22:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (465, 35, '开始启动容器...', '2025-03-19 17:22:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (466, 35, '容器启动成功', '2025-03-19 17:22:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (467, 35, '部署完成', '2025-03-19 17:22:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (468, 35, '开始测试部署...', '2025-03-19 17:36:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (469, 35, '测试端口连接:172.93.45.93:888 成功', '2025-03-19 17:36:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (470, 35, '测试部署完成', '2025-03-19 17:36:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (471, 36, '开始执行部署...', '2025-03-19 21:39:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (472, 36, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-19 21:39:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (473, 36, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-19 21:39:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (474, 36, '开始拉取镜像...', '2025-03-19 21:39:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (475, 36, '镜像拉取成功', '2025-03-19 21:39:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (476, 36, '开始启动容器...', '2025-03-19 21:39:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (477, 36, '开始测试部署...', '2025-03-19 21:40:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (478, 36, '测试端口连接:120.77.78.126:18080 成功', '2025-03-19 21:40:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (479, 36, '测试部署完成', '2025-03-19 21:40:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (480, 37, '开始执行部署...', '2025-03-20 22:00:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (481, 37, '准备发送文件 exchange-eureka.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-20 22:00:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (482, 37, '文件发送成功: /root/deploys/exchange-eureka.yml', '2025-03-20 22:00:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (483, 37, '开始拉取镜像...', '2025-03-20 22:00:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (484, 37, '开始测试部署...', '2025-03-20 22:00:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (485, 37, '测试端口连接:172.93.45.93:18761 失败', '2025-03-20 22:00:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (486, 37, '镜像拉取成功', '2025-03-20 22:00:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (487, 37, '开始启动容器...', '2025-03-20 22:00:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (488, 37, '容器启动成功', '2025-03-20 22:00:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (489, 37, '部署完成', '2025-03-20 22:00:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (490, 38, '开始执行部署...', '2025-03-20 22:09:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (491, 38, '准备发送文件 exchange-eureka.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-20 22:09:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (492, 38, '文件发送成功: /root/deploys/exchange-eureka.yml', '2025-03-20 22:09:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (493, 38, '开始拉取镜像...', '2025-03-20 22:09:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (494, 38, '镜像拉取成功', '2025-03-20 22:09:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (495, 38, '开始启动容器...', '2025-03-20 22:09:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (496, 38, '容器启动成功', '2025-03-20 22:09:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (497, 38, '部署完成', '2025-03-20 22:09:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (498, 38, '开始测试部署...', '2025-03-20 22:09:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (499, 38, '测试端口连接:172.93.45.93:18761 失败', '2025-03-20 22:10:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (500, 38, '开始测试部署...', '2025-03-20 22:11:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (501, 38, '测试端口连接:172.93.45.93:18761 成功', '2025-03-20 22:11:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (502, 38, '测试部署完成', '2025-03-20 22:11:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (503, 38, '开始测试部署...', '2025-03-20 22:32:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (504, 38, '测试端口连接:172.93.45.93:18761 成功', '2025-03-20 22:32:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (505, 38, '测试部署完成', '2025-03-20 22:32:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (506, 39, '开始执行部署...', '2025-03-20 23:00:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (507, 39, '准备发送文件 exchange-configserver.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-20 23:00:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (508, 39, '文件发送成功: /root/deploys/exchange-configserver.yml', '2025-03-20 23:00:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (509, 39, '开始拉取镜像...', '2025-03-20 23:00:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (510, 39, '拉取镜像失败: Process exited with status 18', '2025-03-20 23:00:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (511, 40, '开始执行部署...', '2025-03-20 23:03:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (512, 40, '准备发送文件 exchange-configserver.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-20 23:03:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (513, 40, '文件发送成功: /root/deploys/exchange-configserver.yml', '2025-03-20 23:03:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (514, 40, '开始拉取镜像...', '2025-03-20 23:03:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (515, 40, '镜像拉取成功', '2025-03-20 23:04:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (516, 40, '开始启动容器...', '2025-03-20 23:04:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (517, 40, '容器启动成功', '2025-03-20 23:04:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (518, 40, '部署完成', '2025-03-20 23:04:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (519, 40, '开始测试部署...', '2025-03-20 23:04:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (520, 40, '测试端口连接:172.93.45.93:12888 失败', '2025-03-20 23:04:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (521, 41, '开始执行部署...', '2025-03-20 23:19:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (522, 41, '准备发送文件 exchange-configserver.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-20 23:19:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (523, 41, '文件发送成功: /root/deploys/exchange-configserver.yml', '2025-03-20 23:19:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (524, 41, '开始拉取镜像...', '2025-03-20 23:19:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (525, 41, '镜像拉取成功', '2025-03-20 23:19:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (526, 41, '开始启动容器...', '2025-03-20 23:19:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (527, 41, '容器启动成功', '2025-03-20 23:19:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (528, 41, '部署完成', '2025-03-20 23:19:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (529, 42, '开始执行部署...', '2025-03-20 23:35:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (530, 42, '准备发送文件 exchange-configserver.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-20 23:35:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (531, 42, '文件发送成功: /root/deploys/exchange-configserver.yml', '2025-03-20 23:35:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (532, 42, '开始拉取镜像...', '2025-03-20 23:35:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (533, 42, '开始执行部署...', '2025-03-20 23:35:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (534, 42, '准备发送文件 exchange-configserver.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-20 23:35:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (535, 42, '文件发送成功: /root/deploys/exchange-configserver.yml', '2025-03-20 23:35:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (536, 42, '开始拉取镜像...', '2025-03-20 23:35:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (537, 42, '开始测试部署...', '2025-03-20 23:41:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (538, 42, '测试端口连接:172.93.45.93:12888 成功', '2025-03-20 23:41:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (539, 42, '测试部署完成', '2025-03-20 23:41:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (540, 43, '开始执行部署...', '2025-03-20 23:42:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (541, 43, '准备发送文件 exchange-configserver.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-20 23:42:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (542, 43, '文件发送成功: /root/deploys/exchange-configserver.yml', '2025-03-20 23:42:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (543, 43, '开始拉取镜像...', '2025-03-20 23:42:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (544, 42, '拉取镜像失败: wait: remote command exited without exit status or exit signal', '2025-03-20 23:48:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (545, 43, '拉取镜像失败: wait: remote command exited without exit status or exit signal', '2025-03-20 23:48:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (546, 42, '拉取镜像失败: wait: remote command exited without exit status or exit signal', '2025-03-20 23:48:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (547, 44, '开始执行部署...', '2025-03-21 00:11:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (548, 44, '准备发送文件 exchange-configserver.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-21 00:11:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (549, 44, '文件发送成功: /root/deploys/exchange-configserver.yml', '2025-03-21 00:11:22');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (550, 44, '开始拉取镜像...', '2025-03-21 00:11:22');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (551, 44, '镜像拉取成功', '2025-03-21 00:11:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (552, 44, '开始启动容器...', '2025-03-21 00:11:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (553, 44, '容器启动成功', '2025-03-21 00:11:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (554, 44, '部署完成', '2025-03-21 00:11:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (555, 44, '开始测试部署...', '2025-03-21 00:11:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (556, 44, '测试端口连接:172.93.45.93:12888 失败', '2025-03-21 00:11:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (557, 44, '开始测试部署...', '2025-03-21 00:12:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (558, 44, '测试端口连接:172.93.45.93:12888 成功', '2025-03-21 00:12:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (559, 44, '测试部署完成', '2025-03-21 00:12:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (560, 45, '开始执行部署...', '2025-03-21 00:46:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (561, 45, '准备发送文件 user-center.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-21 00:46:33');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (562, 45, '文件发送成功: /root/deploys/user-center.yml', '2025-03-21 00:46:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (563, 45, '开始拉取镜像...', '2025-03-21 00:46:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (564, 45, '镜像拉取成功', '2025-03-21 00:47:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (565, 45, '开始启动容器...', '2025-03-21 00:47:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (566, 45, '容器启动成功', '2025-03-21 00:47:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (567, 45, '部署完成', '2025-03-21 00:47:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (568, 46, '开始执行部署...', '2025-03-21 00:49:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (569, 46, '准备发送文件 user-center.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-21 00:49:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (570, 46, '文件发送成功: /root/deploys/user-center.yml', '2025-03-21 00:49:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (571, 46, '开始拉取镜像...', '2025-03-21 00:49:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (572, 46, '镜像拉取成功', '2025-03-21 00:49:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (573, 46, '开始启动容器...', '2025-03-21 00:49:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (574, 46, '容器启动成功', '2025-03-21 00:49:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (575, 46, '部署完成', '2025-03-21 00:49:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (576, 47, '开始执行部署...', '2025-03-22 12:59:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (577, 47, '准备发送文件 exchange-eureka.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-22 12:59:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (578, 47, '文件发送成功: /root/deploys/exchange-eureka.yml', '2025-03-22 12:59:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (579, 47, '开始拉取镜像...', '2025-03-22 12:59:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (580, 47, '镜像拉取成功', '2025-03-22 13:00:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (581, 47, '开始启动容器...', '2025-03-22 13:00:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (582, 47, '容器启动成功', '2025-03-22 13:00:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (583, 47, '部署完成', '2025-03-22 13:00:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (584, 48, '开始执行部署...', '2025-03-22 13:08:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (585, 48, '准备发送文件 exchange-eureka.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-22 13:08:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (586, 48, '文件发送成功: /root/deploys/exchange-eureka.yml', '2025-03-22 13:08:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (587, 48, '开始拉取镜像...', '2025-03-22 13:08:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (588, 48, '镜像拉取成功', '2025-03-22 13:08:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (589, 48, '开始启动容器...', '2025-03-22 13:08:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (590, 48, '容器启动成功', '2025-03-22 13:08:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (591, 48, '部署完成', '2025-03-22 13:08:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (592, 49, '开始执行部署...', '2025-03-22 13:15:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (593, 49, '准备发送文件 exchange-eureka.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-22 13:15:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (594, 49, '文件发送成功: /root/deploys/exchange-eureka.yml', '2025-03-22 13:15:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (595, 49, '开始拉取镜像...', '2025-03-22 13:15:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (596, 49, '镜像拉取成功', '2025-03-22 13:15:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (597, 49, '开始启动容器...', '2025-03-22 13:15:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (598, 49, '容器启动成功', '2025-03-22 13:15:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (599, 49, '部署完成', '2025-03-22 13:15:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (600, 49, '开始测试部署...', '2025-03-22 13:15:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (601, 49, '测试端口连接:120.77.78.126:18761 失败', '2025-03-22 13:15:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (602, 49, '开始测试部署...', '2025-03-22 13:19:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (603, 49, '测试端口连接:120.77.78.126:18761 失败', '2025-03-22 13:19:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (604, 50, '开始执行部署...', '2025-03-22 13:34:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (605, 50, '准备发送文件 exchange-eureka.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-22 13:34:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (606, 50, '文件发送成功: /root/deploys/exchange-eureka.yml', '2025-03-22 13:34:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (607, 50, '开始拉取镜像...', '2025-03-22 13:34:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (608, 50, '镜像拉取成功', '2025-03-22 13:34:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (609, 50, '开始启动容器...', '2025-03-22 13:34:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (610, 50, '容器启动成功', '2025-03-22 13:34:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (611, 50, '部署完成', '2025-03-22 13:34:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (612, 51, '开始执行部署...', '2025-03-22 16:33:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (613, 51, '准备发送文件 exchange-eureka.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-22 16:33:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (614, 51, '文件发送成功: /root/deploys/exchange-eureka.yml', '2025-03-22 16:33:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (615, 51, '开始拉取镜像...', '2025-03-22 16:33:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (616, 51, '镜像拉取成功', '2025-03-22 16:33:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (617, 51, '开始启动容器...', '2025-03-22 16:33:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (618, 51, '开始测试部署...', '2025-03-22 16:33:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (619, 51, '测试端口连接:120.77.78.126:18761 成功', '2025-03-22 16:33:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (620, 51, '测试部署完成', '2025-03-22 16:33:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (621, 51, '容器启动成功', '2025-03-22 16:33:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (622, 51, '部署完成', '2025-03-22 16:33:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (623, 52, '开始执行部署...', '2025-03-22 20:22:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (624, 52, '准备发送文件 user-center-server.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-22 20:22:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (625, 52, '文件发送成功: /root/deploys/user-center-server.yml', '2025-03-22 20:22:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (626, 52, '开始拉取镜像...', '2025-03-22 20:22:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (627, 52, '镜像拉取成功', '2025-03-22 20:22:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (628, 52, '开始启动容器...', '2025-03-22 20:22:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (629, 52, '容器启动成功', '2025-03-22 20:22:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (630, 52, '部署完成', '2025-03-22 20:22:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (631, 53, '开始执行部署...', '2025-03-23 01:18:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (632, 53, '准备发送文件 spot-admin-monitor.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-23 01:18:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (633, 53, '文件发送成功: /root/deploys/spot-admin-monitor.yml', '2025-03-23 01:18:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (634, 53, '开始拉取镜像...', '2025-03-23 01:18:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (635, 53, '开始测试部署...', '2025-03-23 01:18:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (636, 53, '测试端口连接:120.77.78.126:5052 失败', '2025-03-23 01:18:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (637, 53, '镜像拉取成功', '2025-03-23 01:18:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (638, 53, '开始启动容器...', '2025-03-23 01:18:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (639, 53, '容器启动成功', '2025-03-23 01:18:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (640, 53, '部署完成', '2025-03-23 01:18:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (641, 55, '开始执行部署...', '2025-03-23 01:20:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (642, 55, '准备发送文件 spot-admin-monitor.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-23 01:20:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (643, 55, '文件发送成功: /root/deploys/spot-admin-monitor.yml', '2025-03-23 01:20:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (644, 55, '开始拉取镜像...', '2025-03-23 01:21:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (645, 55, '镜像拉取成功', '2025-03-23 01:21:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (646, 55, '开始启动容器...', '2025-03-23 01:21:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (647, 55, '容器启动成功', '2025-03-23 01:21:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (648, 55, '部署完成', '2025-03-23 01:21:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (649, 56, '开始执行部署...', '2025-03-23 01:24:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (650, 56, '准备发送文件 spot-admin-impl.yml 到服务器 HK(206.237.12.148) 的 /root/deploys 目录', '2025-03-23 01:24:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (651, 56, '文件发送成功: /root/deploys/spot-admin-impl.yml', '2025-03-23 01:24:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (652, 56, '开始拉取镜像...', '2025-03-23 01:24:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (653, 56, '镜像拉取成功', '2025-03-23 01:25:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (654, 56, '开始启动容器...', '2025-03-23 01:25:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (655, 56, '容器启动成功', '2025-03-23 01:25:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (656, 56, '部署完成', '2025-03-23 01:25:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (657, 57, '开始执行部署...', '2025-03-23 01:27:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (658, 57, '准备发送文件 spot-admin-impl.yml 到服务器 HK(206.237.12.148) 的 /root/deploys 目录', '2025-03-23 01:27:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (659, 57, '文件发送成功: /root/deploys/spot-admin-impl.yml', '2025-03-23 01:27:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (660, 57, '开始拉取镜像...', '2025-03-23 01:27:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (661, 57, '镜像拉取成功', '2025-03-23 01:27:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (662, 57, '开始启动容器...', '2025-03-23 01:27:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (663, 57, '容器启动成功', '2025-03-23 01:27:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (664, 57, '部署完成', '2025-03-23 01:27:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (665, 58, '开始执行部署...', '2025-03-23 01:41:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (666, 58, '准备发送文件 spot-admin-monitor.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-23 01:41:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (667, 58, '文件发送成功: /root/deploys/spot-admin-monitor.yml', '2025-03-23 01:41:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (668, 58, '开始拉取镜像...', '2025-03-23 01:41:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (669, 58, '镜像拉取成功', '2025-03-23 01:42:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (670, 58, '开始启动容器...', '2025-03-23 01:42:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (671, 58, '容器启动成功', '2025-03-23 01:42:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (672, 58, '部署完成', '2025-03-23 01:42:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (673, 59, '开始执行部署...', '2025-03-23 01:47:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (674, 59, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-23 01:47:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (675, 59, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-23 01:47:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (676, 59, '开始拉取镜像...', '2025-03-23 01:47:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (677, 59, '镜像拉取成功', '2025-03-23 01:47:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (678, 59, '开始启动容器...', '2025-03-23 01:47:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (679, 59, '容器启动成功', '2025-03-23 01:48:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (680, 59, '部署完成', '2025-03-23 01:48:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (681, 59, '开始测试部署...', '2025-03-23 01:48:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (682, 59, '测试端口连接:120.77.78.126:80 成功', '2025-03-23 01:48:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (683, 59, '测试端口连接:120.77.78.126:443 成功', '2025-03-23 01:48:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (684, 59, '测试部署完成', '2025-03-23 01:48:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (685, 60, '开始执行部署...', '2025-03-23 23:55:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (686, 60, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-23 23:55:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (687, 60, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-23 23:55:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (688, 60, '开始拉取镜像...', '2025-03-23 23:55:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (689, 60, '镜像拉取成功', '2025-03-23 23:55:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (690, 60, '开始启动容器...', '2025-03-23 23:55:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (691, 60, '容器启动成功', '2025-03-23 23:55:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (692, 60, '部署完成', '2025-03-23 23:55:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (693, 61, '开始执行部署...', '2025-03-23 23:59:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (694, 61, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-23 23:59:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (695, 61, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-23 23:59:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (696, 61, '开始拉取镜像...', '2025-03-23 23:59:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (697, 61, '镜像拉取成功', '2025-03-23 23:59:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (698, 61, '开始启动容器...', '2025-03-23 23:59:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (699, 61, '容器启动成功', '2025-03-23 23:59:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (700, 61, '部署完成', '2025-03-23 23:59:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (701, 62, '开始执行部署...', '2025-03-24 00:09:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (702, 62, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-24 00:09:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (703, 62, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-24 00:09:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (704, 62, '开始拉取镜像...', '2025-03-24 00:09:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (705, 62, '镜像拉取成功', '2025-03-24 00:09:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (706, 62, '开始启动容器...', '2025-03-24 00:09:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (707, 62, '容器启动成功', '2025-03-24 00:09:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (708, 62, '部署完成', '2025-03-24 00:09:27');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (709, 63, '开始执行部署...', '2025-03-24 00:29:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (710, 63, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-24 00:29:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (711, 63, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-24 00:29:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (712, 63, '开始拉取镜像...', '2025-03-24 00:29:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (713, 63, '镜像拉取成功', '2025-03-24 00:29:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (714, 63, '开始启动容器...', '2025-03-24 00:29:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (715, 63, '容器启动成功', '2025-03-24 00:29:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (716, 63, '部署完成', '2025-03-24 00:29:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (717, 64, '开始执行部署...', '2025-03-24 00:31:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (718, 64, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-24 00:31:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (719, 64, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-24 00:31:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (720, 64, '开始拉取镜像...', '2025-03-24 00:31:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (721, 64, '镜像拉取成功', '2025-03-24 00:31:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (722, 64, '开始启动容器...', '2025-03-24 00:31:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (723, 64, '容器启动成功', '2025-03-24 00:31:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (724, 64, '部署完成', '2025-03-24 00:31:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (725, 65, '开始执行部署...', '2025-03-24 01:29:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (726, 65, '准备发送文件 user-center-server.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-24 01:29:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (727, 65, '文件发送成功: /root/deploys/user-center-server.yml', '2025-03-24 01:29:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (728, 65, '开始拉取镜像...', '2025-03-24 01:29:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (729, 65, '镜像拉取成功', '2025-03-24 01:29:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (730, 65, '开始启动容器...', '2025-03-24 01:29:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (731, 65, '容器启动成功', '2025-03-24 01:29:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (732, 65, '部署完成', '2025-03-24 01:29:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (733, 66, '开始执行部署...', '2025-03-24 01:29:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (734, 66, '准备发送文件 spot-admin-monitor.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-24 01:29:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (735, 66, '文件发送成功: /root/deploys/spot-admin-monitor.yml', '2025-03-24 01:29:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (736, 66, '开始拉取镜像...', '2025-03-24 01:29:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (737, 66, '镜像拉取成功', '2025-03-24 01:30:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (738, 66, '开始启动容器...', '2025-03-24 01:30:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (739, 66, '容器启动成功', '2025-03-24 01:30:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (740, 66, '部署完成', '2025-03-24 01:30:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (741, 67, '开始执行部署...', '2025-03-24 01:31:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (742, 67, '准备发送文件 spot-admin-impl.yml 到服务器 HK(206.237.12.148) 的 /root/deploys 目录', '2025-03-24 01:31:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (743, 67, '文件发送成功: /root/deploys/spot-admin-impl.yml', '2025-03-24 01:31:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (744, 67, '开始拉取镜像...', '2025-03-24 01:31:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (745, 67, '镜像拉取成功', '2025-03-24 01:32:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (746, 67, '开始启动容器...', '2025-03-24 01:32:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (747, 67, '开始测试部署...', '2025-03-24 01:32:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (748, 67, '测试端口连接:206.237.12.148:8092 成功', '2025-03-24 01:32:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (749, 67, '测试部署完成', '2025-03-24 01:32:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (750, 67, '容器启动成功', '2025-03-24 01:32:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (751, 67, '部署完成', '2025-03-24 01:32:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (752, 68, '开始执行部署...', '2025-03-24 11:42:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (753, 68, '准备发送文件 user-center.yml 到服务器 American(172.93.45.93) 的 /root/deploys 目录', '2025-03-24 11:42:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (754, 68, '文件发送成功: /root/deploys/user-center.yml', '2025-03-24 11:42:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (755, 68, '开始拉取镜像...', '2025-03-24 11:42:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (756, 68, '镜像拉取成功', '2025-03-24 11:42:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (757, 68, '开始启动容器...', '2025-03-24 11:42:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (758, 68, '容器启动成功', '2025-03-24 11:43:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (759, 68, '部署完成', '2025-03-24 11:43:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (760, 69, '开始执行部署...', '2025-03-25 14:08:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (761, 69, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-25 14:08:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (762, 69, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-25 14:08:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (763, 69, '开始拉取镜像...', '2025-03-25 14:08:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (764, 69, '镜像拉取成功', '2025-03-25 14:08:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (765, 69, '开始启动容器...', '2025-03-25 14:08:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (766, 69, '开始测试部署...', '2025-03-25 14:10:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (767, 69, '测试端口连接:120.77.78.126:18080 成功', '2025-03-25 14:10:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (768, 69, '测试部署完成', '2025-03-25 14:10:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (769, 70, '开始执行部署...', '2025-03-25 14:34:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (770, 70, '准备发送文件 docker-compose-godeep.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-25 14:34:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (771, 70, '文件发送成功: /root/deploys/docker-compose-godeep.yml', '2025-03-25 14:34:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (772, 70, '开始拉取镜像...', '2025-03-25 14:34:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (773, 70, '镜像拉取成功', '2025-03-25 14:34:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (774, 70, '开始启动容器...', '2025-03-25 14:34:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (775, 70, '容器启动成功', '2025-03-25 14:34:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (776, 70, '部署完成', '2025-03-25 14:34:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (777, 70, '开始测试部署...', '2025-03-25 14:34:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (778, 70, '测试端口连接:120.77.78.126:18080 成功', '2025-03-25 14:34:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (779, 70, '测试部署完成', '2025-03-25 14:34:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (780, 71, '开始执行部署...', '2025-03-25 14:40:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (781, 71, '准备发送文件 docker-compose-nginx.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-25 14:40:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (782, 71, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-25 14:40:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (783, 71, '开始拉取镜像...', '2025-03-25 14:40:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (784, 71, '镜像拉取成功', '2025-03-25 14:40:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (785, 71, '开始启动容器...', '2025-03-25 14:40:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (786, 71, '容器启动成功', '2025-03-25 14:40:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (787, 71, '部署完成', '2025-03-25 14:40:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (788, 72, '开始执行部署...', '2025-03-25 15:14:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (789, 72, '准备发送文件 exchange-eureka.yml 到服务器 aliyun(120.77.78.126) 的 /root/deploys 目录', '2025-03-25 15:14:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (790, 72, '文件发送成功: /root/deploys/exchange-eureka.yml', '2025-03-25 15:14:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (791, 72, '开始拉取镜像...', '2025-03-25 15:14:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (792, 72, '镜像拉取成功', '2025-03-25 15:14:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (793, 72, '开始启动容器...', '2025-03-25 15:14:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (794, 72, '容器启动成功', '2025-03-25 15:14:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (795, 72, '部署完成', '2025-03-25 15:14:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (796, 73, '开始执行部署...', '2025-03-26 20:40:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (797, 73, '准备发送文件 spot-entrust-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 20:40:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (798, 73, '文件发送成功: /root/deploys/spot-entrust-impl.yml', '2025-03-26 20:40:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (799, 73, '开始拉取镜像...', '2025-03-26 20:40:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (800, 73, '镜像拉取成功', '2025-03-26 20:40:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (801, 73, '开始启动容器...', '2025-03-26 20:40:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (802, 73, '容器启动成功', '2025-03-26 20:40:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (803, 73, '部署完成', '2025-03-26 20:40:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (804, 74, '开始执行部署...', '2025-03-26 21:12:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (805, 74, '准备发送文件 spot-market-cache.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 21:12:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (806, 74, '文件发送成功: /root/deploys/spot-market-cache.yml', '2025-03-26 21:12:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (807, 74, '开始拉取镜像...', '2025-03-26 21:12:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (808, 74, '镜像拉取成功', '2025-03-26 21:12:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (809, 74, '开始启动容器...', '2025-03-26 21:12:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (810, 74, '容器启动成功', '2025-03-26 21:12:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (811, 74, '部署完成', '2025-03-26 21:12:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (812, 75, '开始执行部署...', '2025-03-26 21:47:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (813, 75, '准备发送文件 spot-market-cache.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 21:47:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (814, 75, '文件发送成功: /root/deploys/spot-market-cache.yml', '2025-03-26 21:47:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (815, 75, '开始拉取镜像...', '2025-03-26 21:47:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (816, 75, '镜像拉取成功', '2025-03-26 21:47:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (817, 75, '开始启动容器...', '2025-03-26 21:47:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (818, 75, '容器启动成功', '2025-03-26 21:47:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (819, 75, '部署完成', '2025-03-26 21:47:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (820, 76, '开始执行部署...', '2025-03-26 22:15:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (821, 76, '准备发送文件 spot-market-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:15:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (822, 76, '文件发送成功: /root/deploys/spot-market-impl.yml', '2025-03-26 22:15:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (823, 76, '开始拉取镜像...', '2025-03-26 22:15:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (824, 77, '开始执行部署...', '2025-03-26 22:15:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (825, 77, '准备发送文件 spot-market-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:15:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (826, 77, '文件发送成功: /root/deploys/spot-market-sync.yml', '2025-03-26 22:15:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (827, 77, '开始拉取镜像...', '2025-03-26 22:15:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (828, 76, '镜像拉取成功', '2025-03-26 22:15:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (829, 76, '开始启动容器...', '2025-03-26 22:15:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (830, 76, '容器启动成功', '2025-03-26 22:15:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (831, 76, '部署完成', '2025-03-26 22:15:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (832, 77, '镜像拉取成功', '2025-03-26 22:15:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (833, 77, '开始启动容器...', '2025-03-26 22:15:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (834, 77, '容器启动成功', '2025-03-26 22:15:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (835, 77, '部署完成', '2025-03-26 22:15:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (836, 78, '开始执行部署...', '2025-03-26 22:17:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (837, 78, '准备发送文件 spot-position-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:17:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (838, 78, '文件发送成功: /root/deploys/spot-position-sync.yml', '2025-03-26 22:17:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (839, 78, '开始拉取镜像...', '2025-03-26 22:17:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (840, 79, '开始执行部署...', '2025-03-26 22:17:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (841, 79, '准备发送文件 spot-position-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:17:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (842, 79, '文件发送成功: /root/deploys/spot-position-impl.yml', '2025-03-26 22:17:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (843, 79, '开始拉取镜像...', '2025-03-26 22:17:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (844, 78, '镜像拉取成功', '2025-03-26 22:17:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (845, 78, '开始启动容器...', '2025-03-26 22:17:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (846, 80, '开始执行部署...', '2025-03-26 22:17:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (847, 80, '准备发送文件 spot-position-cache.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:17:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (848, 78, '容器启动成功', '2025-03-26 22:17:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (849, 78, '部署完成', '2025-03-26 22:17:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (850, 80, '文件发送成功: /root/deploys/spot-position-cache.yml', '2025-03-26 22:17:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (851, 80, '开始拉取镜像...', '2025-03-26 22:17:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (852, 79, '镜像拉取成功', '2025-03-26 22:17:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (853, 79, '开始启动容器...', '2025-03-26 22:17:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (854, 79, '容器启动成功', '2025-03-26 22:17:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (855, 79, '部署完成', '2025-03-26 22:17:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (856, 80, '镜像拉取成功', '2025-03-26 22:18:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (857, 80, '开始启动容器...', '2025-03-26 22:18:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (858, 80, '容器启动成功', '2025-03-26 22:18:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (859, 80, '部署完成', '2025-03-26 22:18:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (860, 81, '开始执行部署...', '2025-03-26 22:20:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (861, 81, '准备发送文件 spot-position-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:20:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (862, 81, '文件发送成功: /root/deploys/spot-position-sync.yml', '2025-03-26 22:20:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (863, 81, '开始拉取镜像...', '2025-03-26 22:20:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (864, 81, '镜像拉取成功', '2025-03-26 22:20:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (865, 81, '开始启动容器...', '2025-03-26 22:20:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (866, 81, '容器启动成功', '2025-03-26 22:20:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (867, 81, '部署完成', '2025-03-26 22:20:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (868, 82, '开始执行部署...', '2025-03-26 22:20:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (869, 82, '准备发送文件 spot-position-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:20:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (870, 82, '文件发送成功: /root/deploys/spot-position-impl.yml', '2025-03-26 22:20:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (871, 82, '开始拉取镜像...', '2025-03-26 22:20:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (872, 82, '镜像拉取成功', '2025-03-26 22:20:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (873, 82, '开始启动容器...', '2025-03-26 22:20:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (874, 82, '容器启动成功', '2025-03-26 22:20:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (875, 82, '部署完成', '2025-03-26 22:20:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (876, 83, '开始执行部署...', '2025-03-26 22:20:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (877, 83, '准备发送文件 spot-position-cache.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:20:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (878, 83, '文件发送成功: /root/deploys/spot-position-cache.yml', '2025-03-26 22:20:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (879, 83, '开始拉取镜像...', '2025-03-26 22:20:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (880, 83, '镜像拉取成功', '2025-03-26 22:20:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (881, 83, '开始启动容器...', '2025-03-26 22:20:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (882, 83, '容器启动成功', '2025-03-26 22:21:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (883, 83, '部署完成', '2025-03-26 22:21:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (884, 84, '开始执行部署...', '2025-03-26 22:25:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (885, 84, '准备发送文件 spot-matcher-execution-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:25:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (886, 84, '文件发送成功: /root/deploys/spot-matcher-execution-router.yml', '2025-03-26 22:25:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (887, 84, '开始拉取镜像...', '2025-03-26 22:25:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (888, 84, '拉取镜像失败: Process exited with status 18', '2025-03-26 22:25:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (889, 85, '开始执行部署...', '2025-03-26 22:25:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (890, 85, '准备发送文件 spot-matcher-market-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:25:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (891, 85, '文件发送成功: /root/deploys/spot-matcher-market-router.yml', '2025-03-26 22:25:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (892, 85, '开始拉取镜像...', '2025-03-26 22:25:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (893, 85, '拉取镜像失败: Process exited with status 18', '2025-03-26 22:25:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (894, 86, '开始执行部署...', '2025-03-26 22:26:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (895, 86, '准备发送文件 spot-matcher-execution-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:26:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (896, 86, '文件发送成功: /root/deploys/spot-matcher-execution-router.yml', '2025-03-26 22:26:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (897, 86, '开始拉取镜像...', '2025-03-26 22:26:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (898, 86, '拉取镜像失败: Process exited with status 18', '2025-03-26 22:26:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (899, 86, '开始执行部署...', '2025-03-26 22:27:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (900, 86, '准备发送文件 spot-matcher-execution-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-26 22:27:34');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (901, 86, '文件发送成功: /root/deploys/spot-matcher-execution-router.yml', '2025-03-26 22:27:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (902, 86, '开始拉取镜像...', '2025-03-26 22:27:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (903, 86, '拉取镜像失败: Process exited with status 18', '2025-03-26 22:27:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (904, 87, '开始执行部署...', '2025-03-27 10:43:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (905, 87, '准备发送文件 spot-matcher-execution-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 10:43:57');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (906, 87, '文件发送成功: /root/deploys/spot-matcher-execution-router.yml', '2025-03-27 10:43:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (907, 87, '开始拉取镜像...', '2025-03-27 10:43:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (908, 87, '镜像拉取成功', '2025-03-27 10:44:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (909, 87, '开始启动容器...', '2025-03-27 10:44:28');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (910, 87, '容器启动成功', '2025-03-27 10:44:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (911, 87, '部署完成', '2025-03-27 10:44:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (912, 87, '开始测试部署...', '2025-03-27 10:44:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (913, 87, '测试端口连接:43.255.158.51:7002 失败', '2025-03-27 10:44:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (914, 88, '开始执行部署...', '2025-03-27 10:56:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (915, 88, '准备发送文件 spot-admin-monitor.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 10:56:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (916, 88, '文件发送成功: /root/deploys/spot-admin-monitor.yml', '2025-03-27 10:56:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (917, 88, '开始拉取镜像...', '2025-03-27 10:56:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (918, 88, '镜像拉取成功', '2025-03-27 10:56:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (919, 88, '开始启动容器...', '2025-03-27 10:56:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (920, 88, '容器启动成功', '2025-03-27 10:56:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (921, 88, '部署完成', '2025-03-27 10:56:46');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (922, 89, '开始执行部署...', '2025-03-27 10:57:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (923, 89, '准备发送文件 spot-admin-monitor.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 10:57:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (924, 89, '文件发送成功: /root/deploys/spot-admin-monitor.yml', '2025-03-27 10:58:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (925, 89, '开始拉取镜像...', '2025-03-27 10:58:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (926, 89, '镜像拉取成功', '2025-03-27 10:58:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (927, 89, '开始启动容器...', '2025-03-27 10:58:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (928, 89, '容器启动成功', '2025-03-27 10:58:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (929, 89, '部署完成', '2025-03-27 10:58:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (930, 90, '开始执行部署...', '2025-03-27 11:03:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (931, 90, '准备发送文件 spot-biz-user.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:03:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (932, 90, '文件发送成功: /root/deploys/spot-biz-user.yml', '2025-03-27 11:03:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (933, 90, '开始拉取镜像...', '2025-03-27 11:03:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (934, 90, '镜像拉取成功', '2025-03-27 11:03:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (935, 90, '开始启动容器...', '2025-03-27 11:03:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (936, 90, '容器启动成功', '2025-03-27 11:03:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (937, 90, '部署完成', '2025-03-27 11:03:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (938, 91, '开始执行部署...', '2025-03-27 11:04:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (939, 91, '准备发送文件 spot-biz-openapi.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:04:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (940, 91, '文件发送成功: /root/deploys/spot-biz-openapi.yml', '2025-03-27 11:04:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (941, 91, '开始拉取镜像...', '2025-03-27 11:04:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (942, 92, '开始执行部署...', '2025-03-27 11:04:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (943, 92, '准备发送文件 spot-biz-internal.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:04:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (944, 92, '文件发送成功: /root/deploys/spot-biz-internal.yml', '2025-03-27 11:04:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (945, 92, '开始拉取镜像...', '2025-03-27 11:04:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (946, 91, '镜像拉取成功', '2025-03-27 11:04:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (947, 91, '开始启动容器...', '2025-03-27 11:04:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (948, 91, '容器启动成功', '2025-03-27 11:04:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (949, 91, '部署完成', '2025-03-27 11:04:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (950, 93, '开始执行部署...', '2025-03-27 11:05:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (951, 93, '准备发送文件 spot-biz-websocket.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:05:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (952, 93, '文件发送成功: /root/deploys/spot-biz-websocket.yml', '2025-03-27 11:05:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (953, 93, '开始拉取镜像...', '2025-03-27 11:05:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (954, 92, '镜像拉取成功', '2025-03-27 11:05:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (955, 92, '开始启动容器...', '2025-03-27 11:05:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (956, 92, '容器启动成功', '2025-03-27 11:05:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (957, 92, '部署完成', '2025-03-27 11:05:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (958, 93, '镜像拉取成功', '2025-03-27 11:05:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (959, 93, '开始启动容器...', '2025-03-27 11:05:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (960, 93, '容器启动成功', '2025-03-27 11:05:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (961, 93, '部署完成', '2025-03-27 11:05:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (962, 94, '开始执行部署...', '2025-03-27 11:06:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (963, 94, '准备发送文件 spot-scheduled.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:06:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (964, 94, '文件发送成功: /root/deploys/spot-scheduled.yml', '2025-03-27 11:06:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (965, 94, '开始拉取镜像...', '2025-03-27 11:06:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (966, 94, '镜像拉取成功', '2025-03-27 11:06:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (967, 94, '开始启动容器...', '2025-03-27 11:06:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (968, 94, '容器启动成功', '2025-03-27 11:06:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (969, 94, '部署完成', '2025-03-27 11:06:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (970, 95, '开始执行部署...', '2025-03-27 11:25:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (971, 95, '准备发送文件 spot-matcher-cache.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:25:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (972, 95, '文件发送成功: /root/deploys/spot-matcher-cache.yml', '2025-03-27 11:25:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (973, 95, '开始拉取镜像...', '2025-03-27 11:25:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (974, 95, '镜像拉取成功', '2025-03-27 11:25:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (975, 95, '开始启动容器...', '2025-03-27 11:25:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (976, 95, '容器启动成功', '2025-03-27 11:25:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (977, 95, '部署完成', '2025-03-27 11:25:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (978, 96, '开始执行部署...', '2025-03-27 11:25:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (979, 96, '准备发送文件 spot-matcher-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:25:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (980, 96, '文件发送成功: /root/deploys/spot-matcher-impl.yml', '2025-03-27 11:25:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (981, 96, '开始拉取镜像...', '2025-03-27 11:25:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (982, 97, '开始执行部署...', '2025-03-27 11:26:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (983, 97, '准备发送文件 spot-matcher-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:26:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (984, 97, '文件发送成功: /root/deploys/spot-matcher-sync.yml', '2025-03-27 11:26:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (985, 97, '开始拉取镜像...', '2025-03-27 11:26:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (986, 96, '镜像拉取成功', '2025-03-27 11:26:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (987, 96, '开始启动容器...', '2025-03-27 11:26:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (988, 96, '容器启动成功', '2025-03-27 11:26:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (989, 96, '部署完成', '2025-03-27 11:26:26');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (990, 97, '镜像拉取成功', '2025-03-27 11:26:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (991, 97, '开始启动容器...', '2025-03-27 11:26:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (992, 97, '容器启动成功', '2025-03-27 11:26:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (993, 97, '部署完成', '2025-03-27 11:26:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (994, 98, '开始执行部署...', '2025-03-27 11:26:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (995, 98, '准备发送文件 spot-scheduled.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:26:59');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (996, 98, '文件发送成功: /root/deploys/spot-scheduled.yml', '2025-03-27 11:27:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (997, 98, '开始拉取镜像...', '2025-03-27 11:27:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (998, 98, '镜像拉取成功', '2025-03-27 11:27:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (999, 98, '开始启动容器...', '2025-03-27 11:27:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1000, 98, '容器启动成功', '2025-03-27 11:27:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1001, 98, '部署完成', '2025-03-27 11:27:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1002, 99, '开始执行部署...', '2025-03-27 11:31:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1003, 99, '准备发送文件 spot-matcher-order-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 11:31:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1004, 99, '文件发送成功: /root/deploys/spot-matcher-order-router.yml', '2025-03-27 11:32:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1005, 99, '开始拉取镜像...', '2025-03-27 11:32:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1006, 99, '镜像拉取成功', '2025-03-27 11:32:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1007, 99, '开始启动容器...', '2025-03-27 11:32:29');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1008, 99, '容器启动成功', '2025-03-27 11:32:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1009, 99, '部署完成', '2025-03-27 11:32:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1010, 100, '开始执行部署...', '2025-03-27 12:17:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1011, 100, '准备发送文件 spot-matcher-order-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 12:17:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1012, 100, '文件发送成功: /root/deploys/spot-matcher-order-router.yml', '2025-03-27 12:17:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1013, 100, '开始拉取镜像...', '2025-03-27 12:17:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1014, 100, '镜像拉取成功', '2025-03-27 12:17:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1015, 100, '开始启动容器...', '2025-03-27 12:17:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1016, 100, '容器启动成功', '2025-03-27 12:17:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1017, 100, '部署完成', '2025-03-27 12:17:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1018, 101, '开始执行部署...', '2025-03-27 12:18:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1019, 101, '准备发送文件 spot-matcher-market-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 12:18:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1020, 101, '文件发送成功: /root/deploys/spot-matcher-market-router.yml', '2025-03-27 12:18:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1021, 101, '开始拉取镜像...', '2025-03-27 12:18:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1022, 101, '镜像拉取成功', '2025-03-27 12:19:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1023, 101, '开始启动容器...', '2025-03-27 12:19:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1024, 101, '容器启动成功', '2025-03-27 12:19:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1025, 101, '部署完成', '2025-03-27 12:19:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1026, 102, '开始执行部署...', '2025-03-27 12:22:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1027, 102, '准备发送文件 spot-matcher-cache.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 12:22:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1028, 102, '文件发送成功: /root/deploys/spot-matcher-cache.yml', '2025-03-27 12:22:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1029, 102, '开始拉取镜像...', '2025-03-27 12:22:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1030, 103, '开始执行部署...', '2025-03-27 12:22:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1031, 103, '准备发送文件 spot-matcher-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 12:22:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1032, 103, '文件发送成功: /root/deploys/spot-matcher-impl.yml', '2025-03-27 12:22:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1033, 103, '开始拉取镜像...', '2025-03-27 12:22:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1034, 104, '开始执行部署...', '2025-03-27 12:23:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1035, 104, '准备发送文件 spot-matcher-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 12:23:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1036, 104, '连接服务器失败: ssh: handshake failed: read tcp 192.168.208.2:49426->43.255.158.51:22: read: connection reset by peer', '2025-03-27 12:23:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1037, 102, '镜像拉取成功', '2025-03-27 12:23:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1038, 102, '开始启动容器...', '2025-03-27 12:23:08');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1039, 102, '容器启动成功', '2025-03-27 12:23:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1040, 102, '部署完成', '2025-03-27 12:23:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1041, 103, '镜像拉取成功', '2025-03-27 12:23:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1042, 103, '开始启动容器...', '2025-03-27 12:23:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1043, 103, '容器启动成功', '2025-03-27 12:23:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1044, 103, '部署完成', '2025-03-27 12:23:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1045, 105, '开始执行部署...', '2025-03-27 12:24:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1046, 105, '准备发送文件 spot-matcher-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 12:24:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1047, 105, '连接服务器失败: ssh: handshake failed: read tcp 192.168.208.2:39836->43.255.158.51:22: read: connection reset by peer', '2025-03-27 12:24:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1048, 106, '开始执行部署...', '2025-03-27 12:25:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1049, 106, '准备发送文件 spot-position-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 12:25:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1050, 106, '文件发送成功: /root/deploys/spot-position-sync.yml', '2025-03-27 12:25:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1051, 106, '开始拉取镜像...', '2025-03-27 12:25:54');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1052, 106, '镜像拉取成功', '2025-03-27 12:25:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1053, 106, '开始启动容器...', '2025-03-27 12:25:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1054, 106, '容器启动成功', '2025-03-27 12:25:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1055, 106, '部署完成', '2025-03-27 12:25:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1056, 107, '开始执行部署...', '2025-03-27 12:26:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1057, 107, '准备发送文件 spot-matcher-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 12:26:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1058, 107, '文件发送成功: /root/deploys/spot-matcher-sync.yml', '2025-03-27 12:26:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1059, 107, '开始拉取镜像...', '2025-03-27 12:26:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1060, 107, '镜像拉取成功', '2025-03-27 12:27:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1061, 107, '开始启动容器...', '2025-03-27 12:27:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1062, 107, '容器启动成功', '2025-03-27 12:27:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1063, 107, '部署完成', '2025-03-27 12:27:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1064, 108, '开始执行部署...', '2025-03-27 14:07:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1065, 108, '准备发送文件 spot-matcher-execution-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 14:07:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1066, 108, '文件发送成功: /root/deploys/spot-matcher-execution-router.yml', '2025-03-27 14:07:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1067, 108, '开始拉取镜像...', '2025-03-27 14:07:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1068, 109, '开始执行部署...', '2025-03-27 14:08:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1069, 109, '准备发送文件 spot-matcher-market-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 14:08:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1070, 108, '镜像拉取成功', '2025-03-27 14:08:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1071, 108, '开始启动容器...', '2025-03-27 14:08:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1072, 109, '文件发送成功: /root/deploys/spot-matcher-market-router.yml', '2025-03-27 14:08:01');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1073, 109, '开始拉取镜像...', '2025-03-27 14:08:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1074, 109, '镜像拉取成功', '2025-03-27 14:08:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1075, 109, '开始启动容器...', '2025-03-27 14:08:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1076, 108, '容器启动成功', '2025-03-27 14:08:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1077, 108, '部署完成', '2025-03-27 14:08:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1078, 109, '容器启动成功', '2025-03-27 14:08:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1079, 109, '部署完成', '2025-03-27 14:08:14');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1080, 110, '开始执行部署...', '2025-03-27 14:08:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1081, 110, '准备发送文件 spot-matcher-order-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 14:08:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1082, 110, '文件发送成功: /root/deploys/spot-matcher-order-router.yml', '2025-03-27 14:08:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1083, 110, '开始拉取镜像...', '2025-03-27 14:08:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1084, 110, '镜像拉取成功', '2025-03-27 14:08:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1085, 110, '开始启动容器...', '2025-03-27 14:08:21');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1086, 110, '容器启动成功', '2025-03-27 14:08:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1087, 110, '部署完成', '2025-03-27 14:08:32');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1088, 111, '开始执行部署...', '2025-03-27 18:13:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1089, 111, '准备发送文件 spot-admin-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 18:13:13');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1090, 111, '文件发送成功: /root/deploys/spot-admin-impl.yml', '2025-03-27 18:13:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1091, 111, '开始拉取镜像...', '2025-03-27 18:13:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1092, 111, '镜像拉取成功', '2025-03-27 18:13:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1093, 111, '开始启动容器...', '2025-03-27 18:13:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1094, 111, '容器启动成功', '2025-03-27 18:13:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1095, 111, '部署完成', '2025-03-27 18:13:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1096, 113, '开始执行部署...', '2025-03-27 21:56:00');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1097, 114, '开始执行部署...', '2025-03-27 21:55:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1098, 112, '开始执行部署...', '2025-03-27 21:56:10');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1099, 113, '准备发送文件 spot-position-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 21:56:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1100, 114, '准备发送文件 spot-position-cache.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 21:56:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1101, 112, '准备发送文件 spot-position-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 21:56:45');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1102, 113, '文件发送成功: /root/deploys/spot-position-impl.yml', '2025-03-27 21:56:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1103, 114, '文件发送成功: /root/deploys/spot-position-cache.yml', '2025-03-27 21:56:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1104, 112, '文件发送成功: /root/deploys/spot-position-sync.yml', '2025-03-27 21:56:58');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1105, 113, '开始拉取镜像...', '2025-03-27 21:57:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1106, 114, '开始拉取镜像...', '2025-03-27 21:57:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1107, 112, '开始拉取镜像...', '2025-03-27 21:57:41');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1108, 113, '容器启动成功', '2025-03-27 21:59:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1109, 113, '部署完成', '2025-03-27 21:59:03');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1110, 112, '镜像拉取成功', '2025-03-27 21:59:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1111, 112, '开始启动容器...', '2025-03-27 21:59:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1112, 112, '容器启动成功', '2025-03-27 21:59:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1113, 112, '部署完成', '2025-03-27 21:59:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1114, 114, '开始测试部署...', '2025-03-27 21:59:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1115, 114, '测试端口连接:43.255.158.51:5021 成功', '2025-03-27 21:59:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1116, 114, '测试部署完成', '2025-03-27 21:59:43');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1117, 115, '开始执行部署...', '2025-03-27 22:04:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1118, 115, '准备发送文件 docker-compose-nginx.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:04:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1119, 115, '文件发送成功: /root/deploys/docker-compose-nginx.yml', '2025-03-27 22:04:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1120, 115, '开始拉取镜像...', '2025-03-27 22:04:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1121, 115, '镜像拉取成功', '2025-03-27 22:04:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1122, 115, '开始启动容器...', '2025-03-27 22:04:15');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1123, 115, '容器启动成功', '2025-03-27 22:04:16');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1124, 115, '部署完成', '2025-03-27 22:04:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1125, 116, '开始执行部署...', '2025-03-27 22:11:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1126, 116, '准备发送文件 spot-matcher-execution-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:11:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1127, 116, '文件发送成功: /root/deploys/spot-matcher-execution-router.yml', '2025-03-27 22:11:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1128, 116, '开始拉取镜像...', '2025-03-27 22:11:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1129, 117, '开始执行部署...', '2025-03-27 22:11:23');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1130, 117, '准备发送文件 spot-matcher-market-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:11:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1131, 117, '文件发送成功: /root/deploys/spot-matcher-market-router.yml', '2025-03-27 22:11:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1132, 117, '开始拉取镜像...', '2025-03-27 22:11:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1133, 118, '开始执行部署...', '2025-03-27 22:11:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1134, 118, '准备发送文件 spot-matcher-order-router.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:11:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1135, 118, '文件发送成功: /root/deploys/spot-matcher-order-router.yml', '2025-03-27 22:11:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1136, 118, '开始拉取镜像...', '2025-03-27 22:11:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1137, 116, '镜像拉取成功', '2025-03-27 22:11:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1138, 116, '开始启动容器...', '2025-03-27 22:11:44');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1139, 119, '开始执行部署...', '2025-03-27 22:11:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1140, 119, '准备发送文件 spot-matcher-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:11:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1141, 119, '文件发送成功: /root/deploys/spot-matcher-sync.yml', '2025-03-27 22:11:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1142, 119, '开始拉取镜像...', '2025-03-27 22:11:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1143, 117, '镜像拉取成功', '2025-03-27 22:11:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1144, 117, '开始启动容器...', '2025-03-27 22:11:55');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1145, 116, '容器启动成功', '2025-03-27 22:11:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1146, 116, '部署完成', '2025-03-27 22:11:56');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1147, 117, '容器启动成功', '2025-03-27 22:12:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1148, 117, '部署完成', '2025-03-27 22:12:06');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1149, 118, '镜像拉取成功', '2025-03-27 22:12:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1150, 118, '开始启动容器...', '2025-03-27 22:12:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1151, 119, '镜像拉取成功', '2025-03-27 22:12:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1152, 119, '开始启动容器...', '2025-03-27 22:12:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1153, 118, '容器启动成功', '2025-03-27 22:12:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1154, 118, '部署完成', '2025-03-27 22:12:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1155, 119, '容器启动成功', '2025-03-27 22:12:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1156, 119, '部署完成', '2025-03-27 22:12:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1157, 120, '开始执行部署...', '2025-03-27 22:12:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1158, 120, '准备发送文件 spot-matcher-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:12:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1159, 120, '文件发送成功: /root/deploys/spot-matcher-impl.yml', '2025-03-27 22:12:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1160, 120, '开始拉取镜像...', '2025-03-27 22:12:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1161, 121, '开始执行部署...', '2025-03-27 22:12:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1162, 121, '准备发送文件 spot-matcher-cache.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:12:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1163, 122, '开始执行部署...', '2025-03-27 22:12:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1164, 122, '准备发送文件 spot-market-sync.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:12:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1165, 121, '文件发送成功: /root/deploys/spot-matcher-cache.yml', '2025-03-27 22:12:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1166, 121, '开始拉取镜像...', '2025-03-27 22:12:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1167, 122, '文件发送成功: /root/deploys/spot-market-sync.yml', '2025-03-27 22:12:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1168, 122, '开始拉取镜像...', '2025-03-27 22:12:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1169, 120, '镜像拉取成功', '2025-03-27 22:13:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1170, 120, '开始启动容器...', '2025-03-27 22:13:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1171, 122, '镜像拉取成功', '2025-03-27 22:13:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1172, 122, '开始启动容器...', '2025-03-27 22:13:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1173, 121, '镜像拉取成功', '2025-03-27 22:13:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1174, 121, '开始启动容器...', '2025-03-27 22:13:11');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1175, 120, '容器启动成功', '2025-03-27 22:13:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1176, 120, '部署完成', '2025-03-27 22:13:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1177, 122, '容器启动成功', '2025-03-27 22:13:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1178, 122, '部署完成', '2025-03-27 22:13:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1179, 121, '容器启动成功', '2025-03-27 22:13:22');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1180, 121, '部署完成', '2025-03-27 22:13:22');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1181, 125, '开始执行部署...', '2025-03-27 22:13:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1182, 125, '准备发送文件 spot-entrust-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:13:35');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1183, 124, '开始执行部署...', '2025-03-27 22:13:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1184, 124, '准备发送文件 spot-market-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:13:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1185, 125, '文件发送成功: /root/deploys/spot-entrust-impl.yml', '2025-03-27 22:13:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1186, 125, '开始拉取镜像...', '2025-03-27 22:13:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1187, 123, '开始执行部署...', '2025-03-27 22:13:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1188, 123, '准备发送文件 spot-market-cache.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:13:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1189, 124, '文件发送成功: /root/deploys/spot-market-impl.yml', '2025-03-27 22:13:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1190, 124, '开始拉取镜像...', '2025-03-27 22:13:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1191, 123, '文件发送成功: /root/deploys/spot-market-cache.yml', '2025-03-27 22:13:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1192, 123, '开始拉取镜像...', '2025-03-27 22:13:38');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1193, 126, '开始执行部署...', '2025-03-27 22:13:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1194, 126, '准备发送文件 spot-scheduled.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:13:51');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1195, 126, '文件发送成功: /root/deploys/spot-scheduled.yml', '2025-03-27 22:13:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1196, 126, '开始拉取镜像...', '2025-03-27 22:13:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1197, 124, '镜像拉取成功', '2025-03-27 22:14:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1198, 124, '开始启动容器...', '2025-03-27 22:14:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1199, 125, '镜像拉取成功', '2025-03-27 22:14:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1200, 125, '开始启动容器...', '2025-03-27 22:14:07');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1201, 123, '镜像拉取成功', '2025-03-27 22:14:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1202, 123, '开始启动容器...', '2025-03-27 22:14:09');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1203, 125, '容器启动成功', '2025-03-27 22:14:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1204, 124, '容器启动成功', '2025-03-27 22:14:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1205, 125, '部署完成', '2025-03-27 22:14:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1206, 124, '部署完成', '2025-03-27 22:14:19');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1207, 123, '容器启动成功', '2025-03-27 22:14:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1208, 123, '部署完成', '2025-03-27 22:14:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1209, 126, '镜像拉取成功', '2025-03-27 22:14:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1210, 126, '开始启动容器...', '2025-03-27 22:14:37');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1211, 126, '容器启动成功', '2025-03-27 22:14:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1212, 126, '部署完成', '2025-03-27 22:14:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1213, 127, '开始执行部署...', '2025-03-27 22:20:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1214, 127, '准备发送文件 spot-biz-websocket.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:20:39');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1215, 127, '文件发送成功: /root/deploys/spot-biz-websocket.yml', '2025-03-27 22:20:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1216, 127, '开始拉取镜像...', '2025-03-27 22:20:40');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1217, 128, '开始执行部署...', '2025-03-27 22:20:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1218, 128, '准备发送文件 spot-biz-internal.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:20:50');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1219, 128, '文件发送成功: /root/deploys/spot-biz-internal.yml', '2025-03-27 22:20:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1220, 128, '开始拉取镜像...', '2025-03-27 22:20:52');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1221, 129, '开始执行部署...', '2025-03-27 22:21:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1222, 129, '准备发送文件 spot-biz-openapi.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:21:02');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1223, 129, '文件发送成功: /root/deploys/spot-biz-openapi.yml', '2025-03-27 22:21:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1224, 129, '开始拉取镜像...', '2025-03-27 22:21:04');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1225, 127, '镜像拉取成功', '2025-03-27 22:21:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1226, 127, '开始启动容器...', '2025-03-27 22:21:12');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1227, 130, '开始执行部署...', '2025-03-27 22:21:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1228, 130, '准备发送文件 spot-biz-user.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:21:17');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1229, 130, '文件发送成功: /root/deploys/spot-biz-user.yml', '2025-03-27 22:21:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1230, 130, '开始拉取镜像...', '2025-03-27 22:21:18');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1231, 127, '容器启动成功', '2025-03-27 22:21:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1232, 127, '部署完成', '2025-03-27 22:21:24');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1233, 128, '镜像拉取成功', '2025-03-27 22:21:30');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1234, 128, '开始启动容器...', '2025-03-27 22:21:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1235, 129, '镜像拉取成功', '2025-03-27 22:21:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1236, 129, '开始启动容器...', '2025-03-27 22:21:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1237, 128, '容器启动成功', '2025-03-27 22:21:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1238, 128, '部署完成', '2025-03-27 22:21:42');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1239, 131, '开始执行部署...', '2025-03-27 22:21:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1240, 131, '准备发送文件 spot-admin-monitor.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:21:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1241, 129, '容器启动成功', '2025-03-27 22:21:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1242, 129, '部署完成', '2025-03-27 22:21:47');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1243, 132, '开始执行部署...', '2025-03-27 22:21:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1244, 132, '准备发送文件 spot-admin-impl.yml 到服务器 HK弹性云(43.255.158.51) 的 /root/deploys 目录', '2025-03-27 22:21:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1245, 131, '文件发送成功: /root/deploys/spot-admin-monitor.yml', '2025-03-27 22:21:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1246, 131, '开始拉取镜像...', '2025-03-27 22:21:48');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1247, 132, '文件发送成功: /root/deploys/spot-admin-impl.yml', '2025-03-27 22:21:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1248, 132, '开始拉取镜像...', '2025-03-27 22:21:49');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1249, 130, '镜像拉取成功', '2025-03-27 22:21:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1250, 130, '开始启动容器...', '2025-03-27 22:21:53');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1251, 130, '容器启动成功', '2025-03-27 22:22:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1252, 130, '部署完成', '2025-03-27 22:22:05');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1253, 131, '镜像拉取成功', '2025-03-27 22:22:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1254, 131, '开始启动容器...', '2025-03-27 22:22:20');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1255, 132, '镜像拉取成功', '2025-03-27 22:22:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1256, 132, '开始启动容器...', '2025-03-27 22:22:25');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1257, 131, '容器启动成功', '2025-03-27 22:22:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1258, 131, '部署完成', '2025-03-27 22:22:31');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1259, 132, '容器启动成功', '2025-03-27 22:22:36');
INSERT INTO `deploy_logs` (`id`, `deploy_id`, `content`, `create_time`) VALUES (1260, 132, '部署完成', '2025-03-27 22:22:36');
COMMIT;

-- ----------------------------
-- Table structure for deploys
-- ----------------------------
DROP TABLE IF EXISTS `deploys`;
CREATE TABLE `deploys` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '部署ID',
  `service_id` int unsigned NOT NULL COMMENT '服务ID',
  `service_name` varchar(100) NOT NULL COMMENT '服务名称',
  `container_id` int unsigned NOT NULL COMMENT '容器ID',
  `container_name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '容器名称',
  `version` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '版本号',
  `file_id` int unsigned DEFAULT NULL COMMENT '文件ID',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `server_id` int unsigned DEFAULT NULL COMMENT '服务器ID',
  `server_name` varchar(100) DEFAULT NULL COMMENT '服务器名称',
  `status` varchar(20) NOT NULL DEFAULT 'pending' COMMENT '状态：pending-待部署，deploying-部署中，success-部署成功，failed-部署失败，canceled-已取消',
  `remark` text COMMENT '备注',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `deploy_time` datetime DEFAULT NULL COMMENT '部署时间',
  PRIMARY KEY (`id`),
  KEY `idx_service_id` (`service_id`),
  KEY `idx_container_id` (`container_id`),
  KEY `idx_file_id` (`file_id`),
  KEY `idx_server_id` (`server_id`),
  KEY `idx_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='部署表';

-- ----------------------------
-- Records of deploys
-- ----------------------------
BEGIN;
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (1, 1, '用户服务', 1, 'user-service', 'v1.0.0', 1, 'user-service.yaml', 15, '测试服务器', 'success', '初始部署', '2025-03-15 09:39:24', '2025-03-15 09:39:24');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (2, 2, '订单服务', 2, 'order-service', 'v1.0.0', 2, 'order-service.yaml', 15, '测试服务器', 'canceled', '待部署', '2025-03-15 09:39:24', NULL);
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (3, 4, '部署平台', 21, 'exchange-auto-godeep', '2851061797a7e2e6c018c8e693b3ce4654b83f60', 5, 'docker-compose-godeep.yml', 4, '腾讯', 'canceled', '123', '2025-03-15 17:40:42', NULL);
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (4, 4, '部署平台', 21, 'exchange-auto-godeep', '20250315165936', 5, 'docker-compose-godeep.yml', 4, '腾讯', 'canceled', '托尔斯泰', '2025-03-15 17:49:30', NULL);
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (5, 4, '部署平台', 22, 'exchange-auto-godeep', '20250315175217', 5, 'docker-compose-godeep.yml', 4, '腾讯', 'success', 'test', '2025-03-15 22:47:48', '2025-03-15 23:14:55');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (6, 4, '部署平台', 22, 'exchange-auto-godeep', '20250315175217', 5, 'docker-compose-godeep.yml', 4, '腾讯', 'failed', 'test', '2025-03-16 00:29:44', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (7, 4, '部署平台', 23, 'exchange-auto-godeep', '20250316003919', 5, 'docker-compose-godeep.yml', 4, '腾讯', 'success', 'yest', '2025-03-16 00:41:17', '2025-03-16 00:41:30');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (8, 4, '部署平台', 25, 'exchange-auto-godeep', '20250316143002', 5, 'docker-compose-godeep.yml', 4, '腾讯', 'success', 'test', '2025-03-16 14:32:10', '2025-03-16 14:32:19');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (9, 4, '部署平台', 26, 'exchange-auto-godeep', '20250316145353', 5, 'docker-compose-godeep.yml', 4, '腾讯', 'success', '123', '2025-03-16 14:59:35', '2025-03-16 14:59:43');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (10, 5, 'mgface通用网关', 29, 'mgface-gateway', '20250316174822', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '部署mgface.com网关', '2025-03-16 17:51:25', '2025-03-16 17:54:25');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (11, 5, 'mgface通用网关', 32, 'mgface-gateway', '20250316180742', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '部署通用网关服务器', '2025-03-16 18:09:47', '2025-03-16 18:10:03');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (12, 5, 'mgface通用网关', 33, 'mgface-gateway', '20250316183347', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', 'test', '2025-03-16 18:35:55', '2025-03-16 18:36:03');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (13, 5, 'mgface通用网关', 36, 'mgface-gateway', '20250316183808', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', 'test', '2025-03-16 18:38:46', '2025-03-16 18:38:51');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (14, 4, '部署平台', 26, 'exchange-auto-godeep', '20250316145353', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', '服务器部署到aliyun上面去。', '2025-03-16 19:07:26', '2025-03-16 19:07:35');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (15, 5, 'mgface通用网关', 38, 'mgface-gateway', '20250316192022', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '升级', '2025-03-16 19:21:08', '2025-03-16 19:21:15');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (16, 5, 'mgface通用网关', 39, 'mgface-gateway', '20250316195231', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '66', '2025-03-16 19:58:42', '2025-03-16 19:58:57');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (17, 4, '部署平台', 41, 'exchange-auto-godeep', '20250316195422', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', '', '2025-03-16 19:59:23', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (18, 4, '部署平台', 41, 'exchange-auto-godeep', '20250316195422', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', '1', '2025-03-16 20:00:55', '2025-03-16 20:00:59');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (19, 5, 'mgface通用网关', 43, 'mgface-gateway', '20250316200316', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '1', '2025-03-16 20:08:12', '2025-03-16 20:08:18');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (20, 4, '部署平台', 44, 'exchange-auto-godeep', '20250316204818', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', '', '2025-03-16 20:51:11', '2025-03-16 20:51:20');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (21, 5, 'mgface通用网关', 47, 'mgface-gateway', '20250316212310', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '', '2025-03-16 21:23:41', '2025-03-16 21:23:48');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (22, 5, 'mgface通用网关', 50, 'mgface-gateway', '20250316212735', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '1', '2025-03-16 21:28:22', '2025-03-16 21:28:28');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (23, 4, '部署平台', 52, 'exchange-auto-godeep', '20250317222912', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', '', '2025-03-17 22:33:47', '2025-03-17 22:56:40');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (24, 4, '部署平台', 52, 'exchange-auto-godeep', '20250317222912', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', 'test', '2025-03-17 22:57:25', '2025-03-17 22:57:30');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (25, 4, '部署平台', 52, 'exchange-auto-godeep', '20250317222912', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', 'deploy', '2025-03-17 23:00:10', '2025-03-17 23:00:15');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (26, 4, '部署平台', 53, 'exchange-auto-godeep', '20250317230453', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', 'deploy', '2025-03-17 23:08:49', '2025-03-17 23:09:56');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (27, 7, 'alert-core', 55, 'alert-core', '20250318122144', 8, 'alert-core.yml', 6, 'aliyun', 'success', '告警核心服务', '2025-03-18 12:25:31', '2025-03-18 12:25:39');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (28, 7, 'alert-core', 55, 'alert-core', '20250318122144', 8, 'alert-core.yml', 5, 'HK', 'failed', '部署到HK，需要外网权限访问BIAN', '2025-03-18 12:28:31', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (29, 7, 'alert-core', 55, 'alert-core', '20250318122144', 8, 'alert-core.yml', 5, 'HK', 'success', 'deploy', '2025-03-18 12:31:11', '2025-03-18 12:31:20');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (30, 5, 'mgface通用网关', 56, 'mgface-gateway', '20250318124449', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '网关部署', '2025-03-18 12:45:40', '2025-03-18 12:45:54');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (31, 4, '部署平台', 59, 'exchange-auto-godeep', '20250318154134', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', 'deploy', '2025-03-18 15:45:09', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (32, 4, '部署平台', 59, 'exchange-auto-godeep', '20250318154134', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', 'deploy', '2025-03-18 16:17:04', '2025-03-18 16:17:10');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (33, 8, '用户中心', 64, 'user-center', '20250319163021', 9, 'user-center.yml', 15, 'American', 'failed', 'deploy', '2025-03-19 17:07:31', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (34, 8, '用户中心', 64, 'user-center', '20250319163021', 9, 'user-center.yml', 15, 'American', 'failed', 'deploy', '2025-03-19 17:11:28', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (35, 8, '用户中心', 64, 'user-center', '20250319163021', 9, 'user-center.yml', 15, 'American', 'success', '1', '2025-03-19 17:13:00', '2025-03-19 17:22:43');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (36, 4, '部署平台', 65, 'exchange-auto-godeep', '20250319213737', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', '', '2025-03-19 21:39:46', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (37, 11, 'exchange-eureka', 68, 'exchange-eureka', '20250320213317', 12, 'exchange-eureka.yml', 15, 'American', 'success', 'deploy', '2025-03-20 22:00:08', '2025-03-20 22:00:30');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (38, 11, 'exchange-eureka', 69, 'exchange-eureka', '20250320220603', 12, 'exchange-eureka.yml', 15, 'American', 'success', '', '2025-03-20 22:09:03', '2025-03-20 22:09:57');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (39, 10, 'config-server', 70, 'config-server', '20250320225904', 11, 'exchange-configserver.yml', 15, 'American', 'failed', 'deploy', '2025-03-20 23:00:33', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (40, 10, 'config-server', 70, 'config-server', '20250320225904', 11, 'exchange-configserver.yml', 15, 'American', 'success', 'deploy', '2025-03-20 23:03:52', '2025-03-20 23:04:15');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (41, 10, 'config-server', 71, 'config-server', '20250320230919', 11, 'exchange-configserver.yml', 15, 'American', 'success', 'deploy', '2025-03-20 23:19:28', '2025-03-20 23:19:54');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (42, 10, 'config-server', 72, 'config-server', '20250320233009', 11, 'exchange-configserver.yml', 15, 'American', 'failed', 'deploy', '2025-03-20 23:34:59', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (43, 10, 'config-server', 72, 'config-server', '20250320233009', 11, 'exchange-configserver.yml', 15, 'American', 'failed', 'deploys', '2025-03-20 23:42:28', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (44, 10, 'config-server', 72, 'config-server', '20250320233009', 11, 'exchange-configserver.yml', 15, 'American', 'success', 'deploy', '2025-03-21 00:11:17', '2025-03-21 00:11:28');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (45, 8, '用户中心', 74, 'user-center', '20250321004145', 9, 'user-center.yml', 15, 'American', 'success', '', '2025-03-21 00:46:31', '2025-03-21 00:47:15');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (46, 8, '用户中心', 74, 'user-center', '20250321004145', 9, 'user-center.yml', 15, 'American', 'success', '', '2025-03-21 00:48:58', '2025-03-21 00:49:17');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (47, 11, 'exchange-eureka', 69, 'exchange-eureka', '20250320220603', 12, 'exchange-eureka.yml', 6, 'aliyun', 'success', '', '2025-03-22 12:59:17', '2025-03-22 13:00:09');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (48, 11, 'exchange-eureka', 69, 'exchange-eureka', '20250320220603', 12, 'exchange-eureka.yml', 6, 'aliyun', 'success', '', '2025-03-22 13:08:05', '2025-03-22 13:08:18');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (49, 11, 'exchange-eureka', 69, 'exchange-eureka', '20250320220603', 12, 'exchange-eureka.yml', 6, 'aliyun', 'success', 'deploy', '2025-03-22 13:15:32', '2025-03-22 13:15:35');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (50, 11, 'exchange-eureka', 69, 'exchange-eureka', '20250320220603', 12, 'exchange-eureka.yml', 6, 'aliyun', 'success', '', '2025-03-22 13:34:08', '2025-03-22 13:34:21');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (51, 11, 'exchange-eureka', 76, 'exchange-eureka', '20250322142700', 12, 'exchange-eureka.yml', 6, 'aliyun', 'success', '', '2025-03-22 16:33:01', '2025-03-22 16:33:25');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (52, 12, 'user-center-server', 78, 'user-center-server', '20250322172305', 13, 'user-center-server.yml', 15, 'American', 'success', '', '2025-03-22 20:22:13', '2025-03-22 20:22:40');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (53, 14, 'spot-admin-monitor', 80, 'spot-admin-monitor', '20250323011420', 15, 'spot-admin-monitor.yml', 6, 'aliyun', 'success', '', '2025-03-23 01:18:10', '2025-03-23 01:18:43');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (54, 14, 'spot-admin-monitor', 80, 'spot-admin-monitor', '20250323011420', 15, 'spot-admin-monitor.yml', 6, 'aliyun', 'pending', '', '2025-03-23 01:20:11', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (55, 14, 'spot-admin-monitor', 80, 'spot-admin-monitor', '20250323011420', 15, 'spot-admin-monitor.yml', 15, 'American', 'success', '', '2025-03-23 01:20:56', '2025-03-23 01:21:47');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (56, 13, 'spot-admin-impl', 81, 'spot-admin-impl', '20250323011857', 14, 'spot-admin-impl.yml', 5, 'HK', 'success', '现货管理后端服务需要调用BN接口，要WW服务器', '2025-03-23 01:24:27', '2025-03-23 01:25:34');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (57, 13, 'spot-admin-impl', 81, 'spot-admin-impl', '20250323011857', 14, 'spot-admin-impl.yml', 5, 'HK', 'success', '', '2025-03-23 01:27:08', '2025-03-23 01:27:25');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (58, 14, 'spot-admin-monitor', 82, 'spot-admin-monitor', '20250323013908', 15, 'spot-admin-monitor.yml', 15, 'American', 'success', '', '2025-03-23 01:41:18', '2025-03-23 01:42:01');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (59, 5, 'mgface通用网关', 79, 'mgface-gateway', '20250323011307', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', 'refresh', '2025-03-23 01:47:53', '2025-03-23 01:48:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (60, 5, 'mgface通用网关', 84, 'mgface-gateway', '20250323235411', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '', '2025-03-23 23:55:15', '2025-03-23 23:55:25');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (61, 5, 'mgface通用网关', 85, 'mgface-gateway', '20250323235913', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '', '2025-03-23 23:59:43', '2025-03-23 23:59:51');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (62, 5, 'mgface通用网关', 86, 'mgface-gateway', '20250324000835', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '', '2025-03-24 00:09:15', '2025-03-24 00:09:27');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (63, 5, 'mgface通用网关', 87, 'mgface-gateway', '20250324002825', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '', '2025-03-24 00:29:22', '2025-03-24 00:29:34');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (64, 5, 'mgface通用网关', 88, 'mgface-gateway', '20250324003104', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '', '2025-03-24 00:31:35', '2025-03-24 00:31:47');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (65, 12, 'user-center-server', 91, 'user-center-server', '20250324012507', 13, 'user-center-server.yml', 15, 'American', 'success', '', '2025-03-24 01:29:06', '2025-03-24 01:29:43');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (66, 14, 'spot-admin-monitor', 90, 'spot-admin-monitor', '20250324012341', 15, 'spot-admin-monitor.yml', 15, 'American', 'success', '', '2025-03-24 01:29:44', '2025-03-24 01:30:36');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (67, 13, 'spot-admin-impl', 92, 'spot-admin-impl', '20250324012947', 14, 'spot-admin-impl.yml', 5, 'HK', 'success', '', '2025-03-24 01:31:40', '2025-03-24 01:32:42');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (68, 8, 'user-center', 77, 'user-center', '20250322144910', 9, 'user-center.yml', 15, 'American', 'success', '', '2025-03-24 11:42:28', '2025-03-24 11:43:11');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (69, 4, '部署平台', 100, 'exchange-auto-godeep', '20250325122311', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', '', '2025-03-25 14:08:39', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (70, 4, '部署平台', 100, 'exchange-auto-godeep', '20250325122311', 5, 'docker-compose-godeep.yml', 6, 'aliyun', 'success', '', '2025-03-25 14:34:15', '2025-03-25 14:34:18');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (71, 5, 'mgface通用网关', 101, 'mgface-gateway', '20250325143337', 6, 'docker-compose-nginx.yml', 6, 'aliyun', 'success', '', '2025-03-25 14:40:14', '2025-03-25 14:40:23');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (72, 11, 'exchange-eureka', 76, 'exchange-eureka', '20250322142700', 12, 'exchange-eureka.yml', 6, 'aliyun', 'success', '', '2025-03-25 15:14:37', '2025-03-25 15:14:50');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (73, 20, 'spot-entrust-impl', 144, 'spot-entrust-impl', '20250326163031', 21, 'spot-entrust-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 20:40:02', '2025-03-26 20:40:56');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (74, 21, 'spot-market-cache', 142, 'spot-market-cache', '20250326162934', 31, 'spot-market-cache.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 21:12:10', '2025-03-26 21:12:44');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (75, 21, 'spot-market-cache', 142, 'spot-market-cache', '20250326162934', 31, 'spot-market-cache.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 21:47:08', '2025-03-26 21:47:14');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (76, 22, 'spot-market-impl', 140, 'spot-market-impl', '20250326162932', 32, 'spot-market-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 22:14:52', '2025-03-26 22:15:39');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (77, 23, 'spot-market-sync', 141, 'spot-market-sync', '20250326162934', 33, 'spot-market-sync.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 22:15:05', '2025-03-26 22:15:41');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (78, 32, 'spot-position-sync', 123, 'spot-position-sync', '20250326160800', 30, 'spot-position-sync.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 22:17:03', '2025-03-26 22:17:36');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (79, 31, 'spot-position-impl', 124, 'spot-position-impl', '20250326160800', 29, 'spot-position-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 22:17:14', '2025-03-26 22:17:49');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (80, 30, 'spot-position-cache', 125, 'spot-position-cache', '20250326160804', 28, 'spot-position-cache.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 22:17:34', '2025-03-26 22:18:09');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (81, 32, 'spot-position-sync', 123, 'spot-position-sync', '20250326160800', 30, 'spot-position-sync.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 22:20:00', '2025-03-26 22:20:07');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (82, 31, 'spot-position-impl', 124, 'spot-position-impl', '20250326160800', 29, 'spot-position-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 22:20:34', '2025-03-26 22:20:44');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (83, 30, 'spot-position-cache', 125, 'spot-position-cache', '20250326160804', 28, 'spot-position-cache.yml', 17, 'HK弹性云', 'success', '', '2025-03-26 22:20:46', '2025-03-26 22:21:06');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (84, 29, 'spot-matcher-execution-router', 132, 'spot-matcher-execution-router', '20250326162511', 23, 'spot-matcher-execution-router.yml', 17, 'HK弹性云', 'failed', '', '2025-03-26 22:24:58', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (85, 28, 'spot-matcher-market-router', 129, 'spot-matcher-market-router', '20250326162518', 25, 'spot-matcher-market-router.yml', 17, 'HK弹性云', 'failed', '', '2025-03-26 22:25:11', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (86, 29, 'spot-matcher-execution-router', 132, 'spot-matcher-execution-router', '20250326162511', 23, 'spot-matcher-execution-router.yml', 17, 'HK弹性云', 'failed', '', '2025-03-26 22:26:21', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (87, 29, 'spot-matcher-execution-router', 155, 'spot-matcher-execution-router', '20250327101906', 23, 'spot-matcher-execution-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 10:43:56', '2025-03-27 10:44:29');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (88, 14, 'spot-admin-monitor', 139, 'spot-admin-monitor', '20250326162918', 15, 'spot-admin-monitor.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 10:56:11', '2025-03-27 10:56:46');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (89, 14, 'spot-admin-monitor', 139, 'spot-admin-monitor', '20250326162918', 15, 'spot-admin-monitor.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 10:57:57', '2025-03-27 10:58:08');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (90, 15, 'spot-biz-user', 138, 'spot-biz-user', '20250326162904', 18, 'spot-biz-user.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:03:02', '2025-03-27 11:03:41');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (91, 16, 'spot-biz-openapi', 135, 'spot-biz-openapi', '20250326162726', 17, 'spot-biz-openapi.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:04:22', '2025-03-27 11:04:59');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (92, 17, 'spot-biz-internal', 134, 'spot-biz-internal', '20250326162722', 16, 'spot-biz-internal.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:04:45', '2025-03-27 11:05:24');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (93, 18, 'spot-biz-websocket', 136, 'spot-biz-websocket', '20250326162734', 19, 'spot-biz-websocket.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:05:04', '2025-03-27 11:05:44');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (94, 19, 'spot-scheduled', 137, 'spot-scheduled', '20250326162757', 20, 'spot-scheduled.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:06:15', '2025-03-27 11:06:51');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (95, 24, 'spot-matcher-cache', 157, 'spot-matcher-cache', '20250327101910', 22, 'spot-matcher-cache.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:25:18', '2025-03-27 11:25:51');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (96, 25, 'spot-matcher-impl', 154, 'spot-matcher-impl', '20250327101905', 24, 'spot-matcher-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:25:53', '2025-03-27 11:26:26');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (97, 26, 'spot-matcher-sync', 158, 'spot-matcher-sync', '20250327101902', 27, 'spot-matcher-sync.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:26:07', '2025-03-27 11:26:40');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (98, 19, 'spot-scheduled', 137, 'spot-scheduled', '20250326162757', 20, 'spot-scheduled.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:26:57', '2025-03-27 11:27:02');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (99, 27, 'spot-matcher-order-router', 153, 'spot-matcher-order-router', '20250327101904', 26, 'spot-matcher-order-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 11:31:56', '2025-03-27 11:32:30');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (100, 27, 'spot-matcher-order-router', 167, 'spot-matcher-order-router', '20250327121431', 26, 'spot-matcher-order-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 12:17:15', '2025-03-27 12:17:48');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (101, 28, 'spot-matcher-market-router', 166, 'spot-matcher-market-router', '20250327121433', 25, 'spot-matcher-market-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 12:18:34', '2025-03-27 12:19:08');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (102, 24, 'spot-matcher-cache', 163, 'spot-matcher-cache', '20250327120059', 22, 'spot-matcher-cache.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 12:22:36', '2025-03-27 12:23:19');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (103, 25, 'spot-matcher-impl', 164, 'spot-matcher-impl', '20250327120101', 24, 'spot-matcher-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 12:22:49', '2025-03-27 12:23:32');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (104, 26, 'spot-matcher-sync', 160, 'spot-matcher-sync', '20250327120059', 27, 'spot-matcher-sync.yml', 17, 'HK弹性云', 'failed', '', '2025-03-27 12:23:04', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (105, 26, 'spot-matcher-sync', 160, 'spot-matcher-sync', '20250327120059', 27, 'spot-matcher-sync.yml', 17, 'HK弹性云', 'failed', '', '2025-03-27 12:24:06', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (106, 32, 'spot-position-sync', 123, 'spot-position-sync', '20250326160800', 30, 'spot-position-sync.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 12:25:48', '2025-03-27 12:25:55');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (107, 26, 'spot-matcher-sync', 160, 'spot-matcher-sync', '20250327120059', 27, 'spot-matcher-sync.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 12:26:53', '2025-03-27 12:27:36');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (108, 29, 'spot-matcher-execution-router', 168, 'spot-matcher-execution-router', '20250327121440', 23, 'spot-matcher-execution-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 14:07:28', '2025-03-27 14:08:12');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (109, 28, 'spot-matcher-market-router', 166, 'spot-matcher-market-router', '20250327121433', 25, 'spot-matcher-market-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 14:07:58', '2025-03-27 14:08:14');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (110, 27, 'spot-matcher-order-router', 167, 'spot-matcher-order-router', '20250327121431', 26, 'spot-matcher-order-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 14:08:17', '2025-03-27 14:08:32');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (111, 13, 'spot-admin-impl', 143, 'spot-admin-impl', '20250326162936', 14, 'spot-admin-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 18:13:12', '2025-03-27 18:13:53');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (112, 32, 'spot-position-sync', 184, 'spot-position-sync', '20250327210722', 30, 'spot-position-sync.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 21:54:42', '2025-03-27 21:59:16');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (113, 31, 'spot-position-impl', 185, 'spot-position-impl', '20250327210722', 29, 'spot-position-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 21:54:53', '2025-03-27 21:59:02');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (114, 30, 'spot-position-cache', 186, 'spot-position-cache', '20250327210735', 28, 'spot-position-cache.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 21:55:06', '2006-01-02 15:04:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (115, 5, 'mgface通用网关', 193, 'mgface-gateway', '20250327215413', 6, 'docker-compose-nginx.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:04:04', '2025-03-27 22:04:16');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (116, 29, 'spot-matcher-execution-router', 191, 'spot-matcher-execution-router', '20250327204858', 23, 'spot-matcher-execution-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:11:08', '2025-03-27 22:11:56');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (117, 28, 'spot-matcher-market-router', 171, 'spot-matcher-market-router', '20250327204431', 25, 'spot-matcher-market-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:11:21', '2025-03-27 22:12:06');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (118, 27, 'spot-matcher-order-router', 176, 'spot-matcher-order-router', '20250327204742', 26, 'spot-matcher-order-router.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:11:35', '2025-03-27 22:12:20');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (119, 26, 'spot-matcher-sync', 187, 'spot-matcher-sync', '20250327204641', 27, 'spot-matcher-sync.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:11:47', '2025-03-27 22:12:31');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (120, 25, 'spot-matcher-impl', 173, 'spot-matcher-impl', '20250327204659', 24, 'spot-matcher-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:11:58', '2025-03-27 22:13:18');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (121, 24, 'spot-matcher-cache', 172, 'spot-matcher-cache', '20250327204645', 22, 'spot-matcher-cache.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:12:12', '2025-03-27 22:13:22');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (122, 23, 'spot-market-sync', 178, 'spot-market-sync', '20250327204808', 33, 'spot-market-sync.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:12:32', '2025-03-27 22:13:20');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (123, 21, 'spot-market-cache', 179, 'spot-market-cache', '20250327204809', 31, 'spot-market-cache.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:12:50', '2025-03-27 22:14:20');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (124, 22, 'spot-market-impl', 177, 'spot-market-impl', '20250327204808', 32, 'spot-market-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:13:06', '2025-03-27 22:14:19');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (125, 20, 'spot-entrust-impl', 180, 'spot-entrust-impl', '20250327204838', 21, 'spot-entrust-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:13:33', '2025-03-27 22:14:19');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (126, 19, 'spot-scheduled', 192, 'spot-scheduled', '20250327211755', 20, 'spot-scheduled.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:13:49', '2025-03-27 22:14:49');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (127, 18, 'spot-biz-websocket', 190, 'spot-biz-websocket', '20250327211735', 19, 'spot-biz-websocket.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:20:37', '2025-03-27 22:21:24');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (128, 17, 'spot-biz-internal', 189, 'spot-biz-internal', '20250327211609', 16, 'spot-biz-internal.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:20:48', '2025-03-27 22:21:42');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (129, 16, 'spot-biz-openapi', 188, 'spot-biz-openapi', '20250327211531', 17, 'spot-biz-openapi.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:21:00', '2025-03-27 22:21:47');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (130, 15, 'spot-biz-user', 194, 'spot-biz-user', '20250327211837', 18, 'spot-biz-user.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:21:14', '2025-03-27 22:22:05');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (131, 14, 'spot-admin-monitor', 195, 'spot-admin-monitor', '20250327212334', 15, 'spot-admin-monitor.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:21:31', '2025-03-27 22:22:31');
INSERT INTO `deploys` (`id`, `service_id`, `service_name`, `container_id`, `container_name`, `version`, `file_id`, `file_name`, `server_id`, `server_name`, `status`, `remark`, `create_time`, `deploy_time`) VALUES (132, 13, 'spot-admin-impl', 196, 'spot-admin-impl', '20250327212454', 14, 'spot-admin-impl.yml', 17, 'HK弹性云', 'success', '', '2025-03-27 22:21:45', '2025-03-27 22:22:36');
COMMIT;

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '文件名称',
  `content` text NOT NULL COMMENT '文件内容',
  `service_id` int DEFAULT NULL COMMENT '服务ID',
  `service_name` varchar(100) DEFAULT NULL COMMENT '服务名称',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_service_id` (`service_id`) USING BTREE,
  KEY `idx_name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='文件表';

-- ----------------------------
-- Records of files
-- ----------------------------
BEGIN;
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (2, 'future-config.yaml', 'server:\n  port: 8081\ndatabase:\n  host: localhost\n  port: 3306\n  username: root\n  password: password\n  database: exchange_future', 3, '合约-行情服务', '2025-03-14 02:41:31', '2025-03-14 12:29:09');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (4, 'docker-compose-middleware.yml', 'version: \'3\'\nservices:\n  # mysql配置\n  mysql:\n    # 使用mysql8版本镜像\n    image: mysql:8.0\n    deploy:\n      resources:\n        limits:\n          memory: 512m\n    # 设置自启\n    restart: always\n    # 容器名\n    container_name: mysql\n    # mysql root用户密码配置\n    environment:\n      MYSQL_ROOT_PASSWORD: milliondao123456\n    # mysql基础配置\n    command:\n      --max_allowed_packet=32M\n      --max_connections=1000\n   # 端口绑定\n    ports:\n      - \"3306:3306\"\n    # 数据卷(需要在宿主机新建对应空文件)\n    volumes:\n      - \"/root/mysql/conf/my.cnf:/etc/mysql/conf.d/my.cnf\"\n      - \"/root/mysql/data:/var/lib/mysql\"\n      - \"/root/mysql/error.log:/var/log/mysql/error.log\"\n    ulimits:    # 增加系统资源限制\n        nofile:\n          soft: 65535\n          hard: 65535\n  # mysql配置\n  redis:\n    image: redis\n    deploy:\n      resources:\n        limits:\n          memory: 256m\n    restart: always\n    container_name: redis\n    privileged: true\n    ports:\n      - \"6379:6379\"\n    environment:\n      TZ: Asia/Shanghai\n    volumes:\n      - \"/root/redis/conf/data:/data\"\n      - \"/root/redis/conf/redis.conf:/etc/redis/redis.conf\"\n      - \"/root/redis/conf/logs:/logs\"\n    command: [ \"redis-server\",\"/etc/redis/redis.conf\" ]\n  mongodb:\n    image: mongo:latest\n    deploy:\n      resources:\n        limits:\n          memory: 256m\n    restart: always\n    container_name: mongodb\n    privileged: true\n    ports:\n      - \"27017:27017\"\n    volumes:\n      - \"/root/mongo/db:/data/db\"\n    environment:\n      MONGO_INITDB_ROOT_USERNAME: root\n      MONGO_INITDB_ROOT_PASSWORD: milliondao123456\n    command: [--bind_ip_all]\n  kafka:\n    image: apache/kafka:latest  # 使用支持 Kraft 模式的 Kafka 版本\n    deploy:\n      resources:\n        limits:\n          memory: 512m\n    container_name: kafka\n    ports:\n      - \"9092:9092\"  # 将 Kafka 的默认端口映射到主机\n      - \'29092:29092\'\n    environment:\n      KAFKA_KRAFT_MODE: \"true\"  # 启用 Kraft 模式以取代 Zookeeper\n      KAFKA_PROCESS_ROLES: \"broker,controller\"  # 定义 Kafka 的角色为 broker 和 controller\n      KAFKA_NODE_ID: 1  # Kafka 节点的唯一 ID\n      KAFKA_LISTENERS: \"PLAINTEXT://:9092,CONTROLLER://:29092\"  # 配置 Kafka 的监听接口\n      KAFKA_HEAP_OPTS: \"-Xms256M -Xmx256M -XX:+UseG1GC -XX:MaxGCPauseMillis=20\"\n      KAFKA_LISTENER_SECURITY_PROTOCOL_MAP: \"PLAINTEXT:PLAINTEXT,CONTROLLER:PLAINTEXT\"  # 定义监听器的协议映射\n      KAFKA_ADVERTISED_LISTENERS: \"PLAINTEXT://kafka.mgface.com:9092\"\n      KAFKA_INTER_BROKER_LISTENER_NAME: \"PLAINTEXT\"  # 用于 broker 之间通信的监听器名称\n      KAFKA_CONTROLLER_LISTENER_NAMES: \"CONTROLLER\"  # 定义控制器使用的监听器名称\n      KAFKA_CONTROLLER_QUORUM_VOTERS: \"1@localhost:29092\"  # 配置控制器投票者\n      KAFKA_LOG_DIRS: \"/var/lib/kafka/data\"  # 数据文件存储目录\n      KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR: 1  # 设置偏移量主题的复制因子\n      KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR: 1  # 定义事务状态日志的复制因子\n      KAFKA_TRANSACTION_STATE_LOG_MIN_ISR: 1  # 事务日志的最小同步副本\n      KAFKA_MIN_INSYNC_REPLICAS: 1  # 最小同步副本数\n      KAFKA_BROKER_ID: 1  # Broker 的唯一 ID\n      KAFKA_LOG4J_LOGGERS: \"kafka.controller=INFO,state.change.logger=INFO\"  # 定义特定日志类别的日志级别\n    volumes:\n      - \"/root/kafka/data:/var/lib/kafka/data\"  # 持久化 Kafka 数据到本地目录\n      - \"/root/kafka/logs:/var/log/kafka\"  # 将 Kafka 容器的日志输出到本地主机目录', 3, '中间件-mysql|mongo|kafka|redis', '2025-03-14 14:18:35', '2025-03-26 21:08:40');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (5, 'docker-compose-godeep.yml', 'version: \'3\'\nservices:\n  exchange-auto-godeep:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/exchange-auto-godeep:{{.Version}}\n    networks:\n      - exchange-auto-godeep\n    restart: always\n    container_name: exchange-auto-godeep\n    privileged: true\n    ports:\n      - \"18080:8080\"\n    environment:\n      TZ: Asia/Shanghai\nnetworks:\n  exchange-auto-godeep:\n       driver: bridge', 4, '部署平台', '2025-03-15 15:19:22', '2025-03-16 00:36:05');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (6, 'docker-compose-nginx.yml', '# nginx 网关\nversion: \'3\'\nservices:\n  gateway:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/mgface-gateway:{{.Version}}\n    restart: always\n    container_name: mgface-gateway\n    privileged: true\n    ports:\n      - \"80:80\"\n      - \"443:443\"\n    environment:\n      TZ: Asia/Shanghai', 5, 'mgface通用网关', '2025-03-16 17:42:16', '2025-03-16 17:43:18');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (7, 'docker-compose-hub.yml', 'version: \'3\'\nservices:\n  hub:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/mgface-hub:{{.Version}}\n    restart: always\n    container_name: mgface-hub\n    privileged: true\n    ports:\n      - \"80:80\"\n      - \"443:443\"\n    environment:\n      TZ: Asia/Shanghai', 6, 'mgfacehub通用网关', '2025-03-16 17:43:09', '2025-03-16 17:43:09');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (8, 'alert-core.yml', 'version: \'3\'\nservices:\n  alert-core:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/alert-core:{{.Version}}\n    networks:\n      - alert-core-network\n    restart: always\n    container_name: alert-core\n    privileged: true\n    ports:\n      - \"6060:6060\"\n    environment:\n      TZ: Asia/Shanghai\nnetworks:\n  alert-core-network:\n       driver: bridge', 7, 'alert-core', '2025-03-18 12:24:42', '2025-03-18 12:24:42');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (9, 'user-center.yml', 'version: \'3\'\nservices:\n  user-center:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/user-center:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 256m\n    network_mode: host\n    restart: always\n    container_name: user-center\n    privileged: true\n    ports:\n      - \"888:888\"\n    environment:\n      TZ: Asia/Shanghai', 8, '用户中心', '2025-03-19 17:06:41', '2025-03-21 00:48:47');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (10, 'server_init.sh', '#!/bin/bash\nset -e  # 任何命令失败立即退出脚本\n\n\n# 添加 Docker 官方 GPG 密钥\ncurl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg\n\n# 安装 Docker 的依赖项\nsudo apt update\nsudo apt install -y \\\n    apt-transport-https \\\n    ca-certificates \\\n    curl \\\n    software-properties-common \\\n    gnupg\n\n\n# 设置 Docker 稳定版仓库\necho \"deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null\n\n# 安装 Docker 引擎\nsudo apt update\nsudo apt install -y \\\n    docker-ce \\\n    docker-ce-cli \\\n    containerd.io\n\n# 启动 Docker 服务并设置开机自启\nsudo systemctl enable --now docker\n\n# 添加当前用户到 docker 用户组（需要重新登录生效）\nsudo usermod -aG docker $USER\necho \"[注意] 用户已加入 docker 组，请注销后重新登录生效\"\n\n# 安装 docker-compose\nCOMPOSE_VERSION=\"v2.20.0\"\nsudo curl -L \"https://github.com/docker/compose/releases/download/${COMPOSE_VERSION}/docker-compose-$(uname -s)-$(uname -m)\" \\\n    -o /usr/local/bin/docker-compose\nsudo chmod +x /usr/local/bin/docker-compose\n\n# 安装 sysstat 并启用数据收集\nsudo apt install -y sysstat\nsudo sed -i \'s/ENABLED=\"false\"/ENABLED=\"true\"/\' /etc/default/sysstat\nsudo systemctl restart sysstat.service\n\n# Docker 仓库登录（密码明文存储存在安全风险）\necho \"尝试登录 Docker 仓库...\"\ndocker login --username wanyuxiang000@163.com \\\n    --password Xiang5326865 \\\n    registry.cn-shenzhen.aliyuncs.com\n\necho \"所有组件安装完成！\"', 9, '新主机初始化', '2025-03-19 18:34:24', '2025-03-19 21:48:05');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (11, 'exchange-configserver.yml', 'version: \'3\'\nservices:\n  config-server:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/config-server:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 256m\n    network_mode: host\n    restart: always\n    container_name: config-server\n    privileged: true\n    ports:\n      - \"12888:12888\"\n    environment:\n      TZ: Asia/Shanghai', 10, 'config-server', '2025-03-20 20:45:07', '2025-03-21 00:11:00');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (12, 'exchange-eureka.yml', 'version: \'3\'\nservices:\n  exchange-eureka:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/exchange-eureka:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 256m\n    network_mode: host\n    restart: always\n    container_name: exchange-eureka\n    privileged: true\n    ports:\n      - \"18761:18761\"\n    environment:\n      TZ: Asia/Shanghai', 11, 'exchange-eureka', '2025-03-20 21:21:51', '2025-03-25 15:14:17');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (13, 'user-center-server.yml', 'version: \'3\'\nservices:\n  user-center-server:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/user-center-server:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 256m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: user-center-server\n    privileged: true\n    ports:\n      - \"771:771\"\n    environment:\n      TZ: Asia/Shanghai', 12, 'user-center-server', '2025-03-22 16:32:19', '2025-03-22 16:32:19');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (14, 'spot-admin-impl.yml', 'version: \'3\'\nservices:\n  spot-admin-impl:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-impl:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-admin-impl\n    privileged: true\n    ports:\n      - \"8092:8092\"\n    environment:\n      TZ: Asia/Shanghai', 13, 'spot-admin-impl', '2025-03-22 21:21:08', '2025-03-27 18:14:35');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (15, 'spot-admin-monitor.yml', 'version: \'3\'\nservices:\n  spot-admin-monitor:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-admin-monitor:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-admin-monitor\n    privileged: true\n    ports:\n      - \"5052:5052\"\n    environment:\n      TZ: Asia/Shanghai', 14, 'spot-admin-monitor', '2025-03-22 21:21:34', '2025-03-27 10:57:42');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (16, 'spot-biz-internal.yml', 'version: \'3\'\nservices:\n  spot-biz-internal:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-internal:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-biz-internal\n    privileged: true\n    ports:\n      - \"8092:8092\"\n    environment:\n      TZ: Asia/Shanghai', 17, 'spot-biz-internal', '2025-03-25 11:09:17', '2025-03-27 10:59:45');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (17, 'spot-biz-openapi.yml', 'version: \'3\'\nservices:\n  spot-biz-openapi:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-openapi:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-biz-openapi\n    privileged: true\n    ports:\n      - \"8069:8069\"\n    environment:\n      TZ: Asia/Shanghai', 16, 'spot-biz-openapi', '2025-03-25 11:09:39', '2025-03-27 10:59:57');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (18, 'spot-biz-user.yml', 'version: \'3\'\nservices:\n  spot-biz-user:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-user:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-biz-user\n    privileged: true\n    ports:\n      - \"8090:8090\"\n    environment:\n      TZ: Asia/Shanghai', 15, 'spot-biz-user', '2025-03-25 11:10:03', '2025-03-27 11:00:03');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (19, 'spot-biz-websocket.yml', 'version: \'3\'\nservices:\n  spot-biz-websocket:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-biz-websocket:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-biz-websocket\n    privileged: true\n    ports:\n      - \"8092:8092\"\n      - \"8081:8081\"\n    environment:\n      TZ: Asia/Shanghai', 18, 'spot-biz-websocket', '2025-03-25 11:10:23', '2025-03-27 11:00:15');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (20, 'spot-scheduled.yml', 'version: \'3\'\nservices:\n  spot-scheduled:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-scheduled:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-scheduled\n    privileged: true\n    ports:\n      - \"8066:8066\"\n    environment:\n      TZ: Asia/Shanghai', 19, 'spot-scheduled', '2025-03-25 11:11:00', '2025-03-27 11:26:42');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (21, 'spot-entrust-impl.yml', 'version: \'3\'\nservices:\n  spot-entrust-impl:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-entrust-impl:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-entrust-impl\n    privileged: true\n    ports:\n      - \"8071:8071\"\n    environment:\n      TZ: Asia/Shanghai', 20, 'spot-entrust-impl', '2025-03-25 21:29:41', '2025-03-26 21:08:55');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (22, 'spot-matcher-cache.yml', 'version: \'3\'\nservices:\n  spot-matcher-cache:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-cache:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 700m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-matcher-cache\n    privileged: true\n    ports:\n      - \"7001:7001\"\n    environment:\n      TZ: Asia/Shanghai', 24, 'spot-matcher-cache', '2025-03-26 16:02:07', '2025-03-27 12:21:59');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (23, 'spot-matcher-execution-router.yml', 'version: \'3\'\nservices:\n  spot-matcher-execution-router:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-execution-router:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 700m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-matcher-execution-router\n    privileged: true\n    ports:\n      - \"7002:7002\"\n    environment:\n      TZ: Asia/Shanghai', 29, 'spot-matcher-execution-router', '2025-03-26 16:02:41', '2025-03-27 12:21:48');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (24, 'spot-matcher-impl.yml', 'version: \'3\'\nservices:\n  spot-matcher-impl:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-impl:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 700m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-matcher-impl\n    privileged: true\n    ports:\n      - \"7003:7003\"\n    environment:\n      TZ: Asia/Shanghai', 25, 'spot-matcher-impl', '2025-03-26 16:03:12', '2025-03-27 12:21:44');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (25, 'spot-matcher-market-router.yml', 'version: \'3\'\nservices:\n  spot-matcher-market-router:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-market-router:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 700m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-matcher-market-router\n    privileged: true\n    ports:\n      - \"7004:7004\"\n    environment:\n      TZ: Asia/Shanghai', 28, 'spot-matcher-market-router', '2025-03-26 16:03:38', '2025-03-27 12:21:40');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (26, 'spot-matcher-order-router.yml', 'version: \'3\'\nservices:\n  spot-matcher-order-router:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-order-router:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 700m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-matcher-order-router\n    privileged: true\n    ports:\n      - \"7005:7005\"\n    environment:\n      TZ: Asia/Shanghai', 27, 'spot-matcher-order-router', '2025-03-26 16:04:12', '2025-03-27 12:21:36');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (27, 'spot-matcher-sync.yml', 'version: \'3\'\nservices:\n  spot-matcher-sync:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-matcher-sync:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 700m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-matcher-sync\n    privileged: true\n    ports:\n      - \"7006:7006\"\n    environment:\n      TZ: Asia/Shanghai', 26, 'spot-matcher-sync', '2025-03-26 16:04:36', '2025-03-27 12:21:32');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (28, 'spot-position-cache.yml', 'version: \'3\'\nservices:\n  spot-position-cache:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-cache:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-position-cache\n    privileged: true\n    ports:\n      - \"5021:5021\"\n    environment:\n      TZ: Asia/Shanghai', 30, 'spot-position-cache', '2025-03-26 16:05:51', '2025-03-26 22:19:22');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (29, 'spot-position-impl.yml', 'version: \'3\'\nservices:\n  spot-position-impl:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-impl:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-position-impl\n    privileged: true\n    ports:\n      - \"5010:5010\"\n    environment:\n      TZ: Asia/Shanghai', 31, 'spot-position-impl', '2025-03-26 16:06:22', '2025-03-26 22:19:16');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (30, 'spot-position-sync.yml', 'version: \'3\'\nservices:\n  spot-position-sync:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-position-sync:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 750m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-position-sync\n    privileged: true\n    ports:\n      - \"5005:5005\"\n    environment:\n      TZ: Asia/Shanghai', 32, 'spot-position-sync', '2025-03-26 16:06:50', '2025-03-26 22:19:05');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (31, 'spot-market-cache.yml', 'version: \'3\'\nservices:\n  spot-market-cache:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-cache:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 700m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-market-cache\n    privileged: true\n    ports:\n      - \"8084:8084\"\n    environment:\n      TZ: Asia/Shanghai', 21, 'spot-market-cache', '2025-03-26 16:11:28', '2025-03-27 12:20:46');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (32, 'spot-market-impl.yml', 'version: \'3\'\nservices:\n  spot-market-impl:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-impl:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 700m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-market-impl\n    privileged: true\n    ports:\n      - \"8082:8082\"\n    environment:\n      TZ: Asia/Shanghai', 22, 'spot-market-impl', '2025-03-26 16:11:53', '2025-03-27 12:20:38');
INSERT INTO `files` (`id`, `name`, `content`, `service_id`, `service_name`, `created_at`, `updated_at`) VALUES (33, 'spot-market-sync.yml', 'version: \'3\'\nservices:\n  spot-market-sync:\n    image: registry.cn-shenzhen.aliyuncs.com/mgface/spot-market-sync:{{.Version}}\n    deploy:\n      resources:\n        limits:\n          memory: 700m #Docker Compose version v2.20.0 要2版本才能限制住内存和CPU\n    network_mode: host\n    restart: always\n    container_name: spot-market-sync\n    privileged: true\n    ports:\n      - \"8083:8083\"\n    environment:\n      TZ: Asia/Shanghai', 23, 'spot-market-sync', '2025-03-26 16:12:16', '2025-03-27 12:20:29');
COMMIT;

-- ----------------------------
-- Table structure for servers
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `ip` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `remark` varchar(500) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `last_ping` datetime(3) DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of servers
-- ----------------------------
BEGIN;
INSERT INTO `servers` (`id`, `created_at`, `updated_at`, `ip`, `name`, `password`, `remark`, `status`, `last_ping`, `expire_time`) VALUES (4, '2025-03-12 13:12:03.000', '2025-03-25 11:28:13.033', '175.178.2.21', '腾讯', 'Xiang5326865+01', '中间件服务', 1, '2025-03-25 11:28:13.024', '2025-05-17 01:36:29');
INSERT INTO `servers` (`id`, `created_at`, `updated_at`, `ip`, `name`, `password`, `remark`, `status`, `last_ping`, `expire_time`) VALUES (5, '2025-03-12 13:12:03.000', '2025-03-23 01:06:11.325', '206.237.12.148', 'HK', '0vHPAG7BirqVqSRL', '香港代理服务器', 1, '2025-03-23 01:06:11.316', '2025-04-22 00:00:00');
INSERT INTO `servers` (`id`, `created_at`, `updated_at`, `ip`, `name`, `password`, `remark`, `status`, `last_ping`, `expire_time`) VALUES (6, '2025-03-13 12:11:21.447', '2025-03-16 01:01:56.254', '120.77.78.126', 'aliyun', 'Xiang5326865+01', '业务系统部署服务器', 1, '2025-03-16 01:01:56.232', '2025-05-16 23:59:59');
INSERT INTO `servers` (`id`, `created_at`, `updated_at`, `ip`, `name`, `password`, `remark`, `status`, `last_ping`, `expire_time`) VALUES (15, '2025-03-13 20:35:59.820', '2025-03-23 01:21:25.890', '172.93.45.93', 'American', 'IgRGDtQChxSz', '代理服务器', 1, '2025-03-23 01:21:25.881', '2025-05-04 00:00:00');
INSERT INTO `servers` (`id`, `created_at`, `updated_at`, `ip`, `name`, `password`, `remark`, `status`, `last_ping`, `expire_time`) VALUES (17, '2025-03-26 17:50:42.335', '2025-03-26 20:37:05.531', '43.255.158.51', 'HK弹性云', 'fwuN1ZYXen0HTJgL', 'HK弹性云', 0, '2025-03-26 17:50:42.326', NULL);
COMMIT;

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '服务名称',
  `git_url` varchar(500) NOT NULL COMMENT 'Git仓库地址',
  `category` varchar(50) NOT NULL COMMENT '服务大类',
  `sub_category` varchar(50) NOT NULL COMMENT '服务小类',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  KEY `idx_name` (`name`),
  KEY `idx_category` (`category`),
  KEY `idx_sub_category` (`sub_category`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='服务表';

-- ----------------------------
-- Records of services
-- ----------------------------
BEGIN;
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (1, '现货-核心', 'https://github.com/mgface-exchange-spot/spot-biz/tree/master/spot-biz-websocket', '现货', '仓位', '核心业务，提供ws服务', '2025-03-13 22:19:14', '2025-03-13 23:28:35');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (2, '现货-用户模块', 'https://github.com/mgface-exchange-spot/spot-biz/tree/master/spot-biz-user', '现货', '其他', '提供用户功能', '2025-03-13 22:20:36', '2025-03-13 22:20:54');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (3, '中间件-mysql|mongo|kafka|redis', 'mysql|mongo|kafka|redis', '中间件', '其他', '中间件mysql|mongo|kafka|redis', '2025-03-14 16:42:14', '2025-03-21 01:01:21');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (4, '部署平台', 'https://github.com/mgface-exchange-deploy/exchange-auto-godeep', '中间件', '其他', '自动化运维部署平台后端', '2025-03-15 15:18:48', '2025-03-15 15:18:48');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (5, 'mgface通用网关', 'https://github.com/mgface2022/mgface-gateway/tree/master/mgface_com_nginx', '中间件', '其他', '网关服务', '2025-03-16 17:39:46', '2025-03-16 17:39:46');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (6, 'mgfacehub通用网关', 'https://github.com/mgface2022/mgface-gateway/tree/master/mgfacehub_xyz_nginx', '中间件', '其他', 'mgfacehub网关', '2025-03-16 17:40:14', '2025-03-16 17:40:14');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (7, 'alert-core', 'https://github.com/mgface2022/alert-core.git', '告警服务', '核心', '告警后台核心服务', '2025-03-18 12:16:46', '2025-03-18 12:16:58');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (8, 'user-center', 'https://github.com/mgface-exchange-user/user_center.git', '用户中心', '核心', '用户中心', '2025-03-19 14:17:59', '2025-03-22 16:30:51');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (9, '新主机初始化', 'server_init', '中间件', '其他', '对新主机进行工具初始化。', '2025-03-19 18:33:41', '2025-03-19 18:33:41');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (10, 'config-server', 'https://github.com/mgface-exchange-configserver/exchange-configserver.git', '中间件', '核心', '配置中心服务，获取各个服务的配置', '2025-03-20 20:43:46', '2025-03-20 20:43:46');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (11, 'exchange-eureka', 'https://github.com/mgface-exchange-eureka/exchange-eureka.git', '中间件', '核心', '注册中心', '2025-03-20 21:19:20', '2025-03-20 21:19:20');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (12, 'user-center-server', 'https://github.com/mgface-exchange-user/user-admin.git', '用户中心', '核心', '用户服务的服务端', '2025-03-22 16:31:24', '2025-03-22 16:31:24');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (13, 'spot-admin-impl', 'https://github.com/mgface-exchange-spot/spot-admin.git', '现货', '核心', '现货管理后端服务', '2025-03-22 21:17:40', '2025-03-22 21:17:40');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (14, 'spot-admin-monitor', 'https://github.com/mgface-exchange-spot/spot-admin.git', '现货', '核心', '现货管理端的监控', '2025-03-22 21:19:00', '2025-03-22 21:19:00');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (15, 'spot-biz-user', 'https://github.com/mgface-exchange-spot/spot-biz/tree/master/spot-biz-user', '现货', '核心', '', '2025-03-25 10:31:34', '2025-03-25 10:31:34');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (16, 'spot-biz-openapi', 'https://github.com/mgface-exchange-spot/spot-biz/tree/master/spot-biz-openapi', '现货', '核心', '', '2025-03-25 10:32:01', '2025-03-25 10:32:01');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (17, 'spot-biz-internal', 'https://github.com/mgface-exchange-spot/spot-biz/tree/master/spot-biz-internal', '现货', '核心', '', '2025-03-25 10:32:28', '2025-03-25 10:32:28');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (18, 'spot-biz-websocket', 'https://github.com/mgface-exchange-spot/spot-biz/tree/master/spot-biz-websocket', '现货', '核心', '', '2025-03-25 10:33:00', '2025-03-25 10:33:00');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (19, 'spot-scheduled', 'https://github.com/mgface-exchange-spot/spot-biz/tree/master/spot-scheduled', '现货', '核心', '', '2025-03-25 10:33:19', '2025-03-25 10:33:19');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (20, 'spot-entrust-impl', 'https://github.com/mgface-exchange-spot/spot-entrust.git', '现货', '委托', '现货委托', '2025-03-25 21:18:46', '2025-03-25 21:29:02');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (21, 'spot-market-cache', 'https://github.com/mgface-exchange-spot/spot-biz.git', '现货', '行情', '', '2025-03-25 22:01:32', '2025-03-25 22:01:32');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (22, 'spot-market-impl', 'https://github.com/mgface-exchange-spot/spot-biz.git', '现货', '行情', '', '2025-03-25 22:02:33', '2025-03-25 22:02:33');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (23, 'spot-market-sync', 'https://github.com/mgface-exchange-spot/spot-market.git', '现货', '行情', '', '2025-03-25 22:03:14', '2025-03-25 22:03:14');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (24, 'spot-matcher-cache', 'https://github.com/mgface-exchange-spot/spot-matcher/tree/master/spot-matcher-cache', '现货', '撮合', '', '2025-03-26 14:12:40', '2025-03-26 14:12:40');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (25, 'spot-matcher-impl', 'https://github.com/mgface-exchange-spot/spot-matcher/tree/master/spot-matcher-impl', '现货', '撮合', '', '2025-03-26 14:13:05', '2025-03-26 14:13:05');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (26, 'spot-matcher-sync', 'https://github.com/mgface-exchange-spot/spot-matcher/tree/master/spot-matcher-sync', '现货', '撮合', '', '2025-03-26 14:13:23', '2025-03-26 14:13:23');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (27, 'spot-matcher-order-router', 'https://github.com/mgface-exchange-spot/spot-matcher/tree/master/spot-matcher-order-router', '现货', '撮合', '', '2025-03-26 14:13:43', '2025-03-26 14:13:43');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (28, 'spot-matcher-market-router', 'https://github.com/mgface-exchange-spot/spot-matcher/tree/master/spot-matcher-market-router', '现货', '撮合', '', '2025-03-26 14:13:59', '2025-03-26 14:13:59');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (29, 'spot-matcher-execution-router', 'https://github.com/mgface-exchange-spot/spot-matcher/tree/master/spot-matcher-execution-router', '现货', '撮合', '', '2025-03-26 14:14:16', '2025-03-26 14:14:16');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (30, 'spot-position-cache', 'https://github.com/mgface-exchange-spot/spot-position/tree/master/spot-position-cache', '现货', '仓位', '', '2025-03-26 15:12:37', '2025-03-26 15:12:37');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (31, 'spot-position-impl', 'https://github.com/mgface-exchange-spot/spot-position/tree/master/spot-position-impl', '现货', '仓位', '', '2025-03-26 15:12:52', '2025-03-26 15:12:52');
INSERT INTO `services` (`id`, `name`, `git_url`, `category`, `sub_category`, `remark`, `created_at`, `updated_at`) VALUES (32, 'spot-position-sync', 'https://github.com/mgface-exchange-spot/spot-position/tree/master/spot-position-sync', '现货', '仓位', '', '2025-03-26 15:13:13', '2025-03-26 15:13:13');
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'user',
  `last_login` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uni_users_username` (`username`),
  UNIQUE KEY `uni_users_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `created_at`, `updated_at`, `username`, `password`, `email`, `role`, `last_login`) VALUES (1, '2025-03-12 13:12:03.000', '2025-03-27 12:16:47.721', 'admin', '$2a$10$3PGyVgOQMXfzNc2loS8h4OXgBLpLu0BwweTN1KAZ7jm0NhTA/q6aW', 'admin@example.com', 'admin', '2025-03-27 12:16:47.711');
INSERT INTO `users` (`id`, `created_at`, `updated_at`, `username`, `password`, `email`, `role`, `last_login`) VALUES (2, '2025-03-12 13:12:03.000', '2025-03-12 13:12:03.000', 'user1', '$2a$10$NxPJ.UZ7jB5.sX1/c.WLEOoJh1Yf.XGe/GR.QKkXJzIUFX8jQMtLa', 'user1@example.com', 'user', '2025-03-12 13:12:03.000');
INSERT INTO `users` (`id`, `created_at`, `updated_at`, `username`, `password`, `email`, `role`, `last_login`) VALUES (3, '2025-03-12 13:12:03.000', '2025-03-12 13:12:03.000', 'user2', '$2a$10$NxPJ.UZ7jB5.sX1/c.WLEOoJh1Yf.XGe/GR.QKkXJzIUFX8jQMtLa', 'user2@example.com', 'user', '2025-03-12 13:12:03.000');
COMMIT;

-- ----------------------------
-- View structure for active_servers
-- ----------------------------
DROP VIEW IF EXISTS `active_servers`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `active_servers` AS select `servers`.`id` AS `id`,`servers`.`ip` AS `ip`,`servers`.`name` AS `name`,`servers`.`status` AS `status`,`servers`.`last_ping` AS `last_ping` from `servers` where ((`servers`.`status` = 1) and (`servers`.`deleted_at` is null));

-- ----------------------------
-- View structure for running_services
-- ----------------------------
DROP VIEW IF EXISTS `running_services`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `running_services` AS select `s`.`id` AS `id`,`s`.`name` AS `name`,`s`.`status` AS `status`,`s`.`last_deploy` AS `last_deploy`,`sv`.`ip` AS `server_ip`,`sv`.`name` AS `server_name` from (`services` `s` join `servers` `sv` on((`s`.`server_id` = `sv`.`id`))) where ((`s`.`status` = 'running') and (`s`.`deleted_at` is null) and (`sv`.`deleted_at` is null));

-- ----------------------------
-- View structure for user_files_stats
-- ----------------------------
DROP VIEW IF EXISTS `user_files_stats`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `user_files_stats` AS select `u`.`id` AS `id`,`u`.`username` AS `username`,count(`f`.`id`) AS `file_count` from (`users` `u` left join `files` `f` on((`u`.`id` = `f`.`created_by`))) where ((`u`.`deleted_at` is null) and ((`f`.`deleted_at` is null) or (`f`.`deleted_at` is null))) group by `u`.`id`,`u`.`username`;

-- ----------------------------
-- Procedure structure for deploy_service
-- ----------------------------
DROP PROCEDURE IF EXISTS `deploy_service`;
delimiter ;;
CREATE PROCEDURE `deploy_service`(IN service_id_param INT)
BEGIN
  UPDATE services
  SET status = 'running', last_deploy = NOW()
  WHERE id = service_id_param;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_server_services
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_server_services`;
delimiter ;;
CREATE PROCEDURE `get_server_services`(IN server_id_param INT)
BEGIN
  SELECT s.*, f.name as file_name
  FROM services s
  LEFT JOIN files f ON s.file_id = f.id
  WHERE s.server_id = server_id_param AND s.deleted_at IS NULL;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for get_user_files
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_user_files`;
delimiter ;;
CREATE PROCEDURE `get_user_files`(IN user_id_param INT)
BEGIN
  SELECT *
  FROM files
  WHERE created_by = user_id_param AND deleted_at IS NULL;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for stop_service
-- ----------------------------
DROP PROCEDURE IF EXISTS `stop_service`;
delimiter ;;
CREATE PROCEDURE `stop_service`(IN service_id_param INT)
BEGIN
  UPDATE services
  SET status = 'stopped', updated_at = NOW()
  WHERE id = service_id_param;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table servers
-- ----------------------------
DROP TRIGGER IF EXISTS `update_server_last_ping`;
delimiter ;;
CREATE TRIGGER `update_server_last_ping` BEFORE UPDATE ON `servers` FOR EACH ROW BEGIN
  IF NEW.status = 1 AND (OLD.status = 0 OR OLD.status IS NULL) THEN
    SET NEW.last_ping = NOW();
  END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
