/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50540
Source Host           : localhost:3306
Source Database       : churui

Target Server Type    : MYSQL
Target Server Version : 50540
File Encoding         : 65001

Date: 2015-05-22 18:14:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for addresses
-- ----------------------------
DROP TABLE IF EXISTS `addresses`;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `region_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of addresses
-- ----------------------------
INSERT INTO `addresses` VALUES ('2', 'zhoukai', '龙蟠中路', '18922750941', '18922750941', '江苏省 南京市 玄武区 龙蟠中路', '1', '3', '121', '2015-03-11 10:29:11', '2015-03-11 10:29:15');
INSERT INTO `addresses` VALUES ('3', '张前飞', '棠东东路', '13421344069', '13421344069', '广东省 广州市 天河区 棠东东路', '0', '1994', '4', '2015-03-11 16:34:47', '2015-03-17 12:10:17');
INSERT INTO `addresses` VALUES ('4', '江先生', '小村庄', '13145794978', '13145794978', '山西省 长治市 襄垣县 小村庄', '1', '392', '5', '2015-03-11 21:43:08', '2015-03-13 10:01:44');
INSERT INTO `addresses` VALUES ('5', '陈鹏', '政治经济', '13380056186', '13380056186', '北京市 北京市 朝阳区 政治经济', '0', '143', '6', '2015-03-12 10:23:04', '2015-03-12 10:23:04');
INSERT INTO `addresses` VALUES ('9', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '0', '143', '1', '2015-03-12 15:47:42', '2015-03-12 15:47:42');
INSERT INTO `addresses` VALUES ('10', '牛肉干', '龙三中路159号', '15692406867', '15657943594', '江苏省 南京市 玄武区 龙三中路159号', '0', '3', '7', '2015-03-13 10:51:07', '2015-03-13 10:51:07');
INSERT INTO `addresses` VALUES ('11', 'iPhone', '龙三中路159', '18520254233', '18520254233', '江苏省 南京市 玄武区 龙三中路159', '0', '3', '2', '2015-03-13 16:46:21', '2015-03-13 16:46:21');

-- ----------------------------
-- Table structure for admins
-- ----------------------------
DROP TABLE IF EXISTS `admins`;
CREATE TABLE `admins` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '管理员',
  `emp_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admins
-- ----------------------------
INSERT INTO `admins` VALUES ('1', '戴.建@毕博诚信息有限公司.info', '13138656869', '$2y$10$aYGHRNpb5KKTS8NhPUi4cuK05KwIqu9ktwJV6cmGO7phoGOp3XXR.', '管理员', '2114', 'fhBale1NKFwDrRZya3ltpSLGjgKhYp6EmQXXisoNjHXRBYXXuChU3G9YvG0b', '2015-03-04 11:23:44', '2015-03-11 09:44:53');
INSERT INTO `admins` VALUES ('2', '成.黎@诺依曼软件科技有限公司.com', '153082185', '$2y$10$7ufqw1ihTP2VIyq24b39sell0292LoV3X2tV.CLwE92R9NO7cSK/u', '管理员', '2818', null, '2015-03-04 11:23:44', '2015-03-04 11:23:44');
INSERT INTO `admins` VALUES ('3', '胡84@gmail.com', '137349812', '$2y$10$gz8x2Dq58kR1ssnQViKF..jg5TOHyQ8I9r2wQN11LojMk73HgKCuq', '管理员', '2017', null, '2015-03-04 11:23:44', '2015-03-04 11:23:44');

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES ('1', '1', '3', '2015-03-04 11:23:44', '2015-03-04 11:23:44');
INSERT INTO `admin_roles` VALUES ('2', '2', '3', '2015-03-04 11:23:44', '2015-03-04 11:23:44');
INSERT INTO `admin_roles` VALUES ('3', '3', '1', '2015-03-04 11:23:44', '2015-03-04 11:23:44');

-- ----------------------------
-- Table structure for advisers
-- ----------------------------
DROP TABLE IF EXISTS `advisers`;
CREATE TABLE `advisers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `real_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identity_num` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `professional` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intro` text COLLATE utf8_unicode_ci,
  `achievement` text COLLATE utf8_unicode_ci,
  `skilled` text COLLATE utf8_unicode_ci,
  `total_asked` int(11) NOT NULL DEFAULT '0',
  `valuation_level` tinyint(4) NOT NULL DEFAULT '1',
  `image_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `money` float(11,2) DEFAULT '0.00',
  `login_tries` int(22) NOT NULL DEFAULT '0',
  `last_login_try` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `token_invalid_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `unlock_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of advisers
-- ----------------------------

-- ----------------------------
-- Table structure for adviser_user_conversition
-- ----------------------------
DROP TABLE IF EXISTS `adviser_user_conversition`;
CREATE TABLE `adviser_user_conversition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `adviser_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `‘isover’` int(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of adviser_user_conversition
-- ----------------------------

-- ----------------------------
-- Table structure for auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `auth_codes`;
CREATE TABLE `auth_codes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `mobile` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expired_at` datetime NOT NULL,
  `effective_minutes` int(11) NOT NULL DEFAULT '15',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_codes
-- ----------------------------
INSERT INTO `auth_codes` VALUES ('1', '13138656889', 'test', '413932', '0', 'mobile', '0000-00-00 00:00:00', '15', '2015-03-06 11:10:04', '2015-03-06 11:10:04');
INSERT INTO `auth_codes` VALUES ('2', '13138656869', 'test', '294141', '0', 'mobile', '0000-00-00 00:00:00', '15', '2015-03-06 11:10:26', '2015-03-06 11:10:26');
INSERT INTO `auth_codes` VALUES ('3', '13138656869', 'test', '320100', '0', 'mobile', '0000-00-00 00:00:00', '15', '2015-03-06 11:11:29', '2015-03-06 11:11:29');
INSERT INTO `auth_codes` VALUES ('4', '13138656869', 'test', '252177', '0', 'mobile', '0000-00-00 00:00:00', '15', '2015-03-06 11:14:44', '2015-03-06 11:14:44');
INSERT INTO `auth_codes` VALUES ('5', '13138656869', 'test', '866073', '0', 'mobile', '0000-00-00 00:00:00', '15', '2015-03-06 11:15:45', '2015-03-06 11:15:45');
INSERT INTO `auth_codes` VALUES ('6', '13138656869', 'test', '253963', '0', 'mobile', '0000-00-00 00:00:00', '15', '2015-03-06 11:15:48', '2015-03-06 11:15:48');
INSERT INTO `auth_codes` VALUES ('8', '18520254233', 'test', '592551', '0', 'mobile', '2015-03-11 22:56:21', '15', '2015-03-11 14:56:21', '2015-03-11 14:56:21');
INSERT INTO `auth_codes` VALUES ('10', '18922750941', 'test', '181117', '0', 'mobile', '2015-03-12 00:33:22', '15', '2015-03-11 16:33:22', '2015-03-11 16:33:22');
INSERT INTO `auth_codes` VALUES ('11', '13145794978', 'test', '894289', '0', 'mobile', '2015-03-12 05:41:54', '15', '2015-03-11 21:41:54', '2015-03-11 21:41:54');
INSERT INTO `auth_codes` VALUES ('12', '13380056186', 'test', '508428', '0', 'mobile', '2015-03-12 18:21:50', '15', '2015-03-12 10:21:50', '2015-03-12 10:21:50');
INSERT INTO `auth_codes` VALUES ('13', '15692406867', 'test', '579993', '0', 'mobile', '2015-03-13 18:46:57', '15', '2015-03-13 10:46:57', '2015-03-13 10:46:57');
INSERT INTO `auth_codes` VALUES ('14', '13138656869', 'test', '620039', '0', 'mobile', '2015-03-13 22:44:33', '15', '2015-03-13 14:44:33', '2015-03-13 14:44:33');
INSERT INTO `auth_codes` VALUES ('15', '13138685715', 'test', '539107', '0', 'mobile', '2015-03-14 00:00:39', '15', '2015-03-13 16:00:39', '2015-03-13 16:00:39');
INSERT INTO `auth_codes` VALUES ('16', '18520254233', 'test', '798797', '0', 'mobile', '2015-03-14 00:44:48', '15', '2015-03-13 16:44:48', '2015-03-13 16:44:48');
INSERT INTO `auth_codes` VALUES ('17', '18922255952', 'test', '703231', '0', 'mobile', '2015-03-14 04:47:02', '15', '2015-03-13 20:47:02', '2015-03-13 20:47:02');
INSERT INTO `auth_codes` VALUES ('18', '13421344069', 'test', '909770', '0', 'mobile', '2015-03-17 19:15:27', '15', '2015-03-17 11:15:27', '2015-03-17 11:15:27');
INSERT INTO `auth_codes` VALUES ('19', '13380056186', 'test', '972382', '0', 'mobile', '2015-03-17 21:25:29', '15', '2015-03-17 13:25:29', '2015-03-17 13:25:29');
INSERT INTO `auth_codes` VALUES ('20', '17722858319', 'test', '634347', '0', 'mobile', '2015-04-11 23:11:23', '15', '2015-04-11 15:11:23', '2015-04-11 15:11:23');
INSERT INTO `auth_codes` VALUES ('21', '17722858319', 'test', '405722', '0', 'mobile', '2015-04-16 22:45:49', '15', '2015-04-16 14:45:49', '2015-04-16 14:45:49');

-- ----------------------------
-- Table structure for banners
-- ----------------------------
DROP TABLE IF EXISTS `banners`;
CREATE TABLE `banners` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `image_id` int(11) DEFAULT '0',
  `visible` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type` tinyint(1) DEFAULT '1',
  `title` varchar(255) DEFAULT '',
  `product_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banners
-- ----------------------------
INSERT INTO `banners` VALUES ('1', 'http://120.24.164.194:8087/products/2', '237', '1', '2015-03-20 13:46:54', '2015-03-20 13:46:54', '1', null, '0');
INSERT INTO `banners` VALUES ('2', 'http://120.24.164.194:8087/products/3', '240', '1', '2015-03-20 13:48:45', '2015-03-20 13:48:45', '1', null, '0');
INSERT INTO `banners` VALUES ('3', 'http://120.24.164.194:8087/products/4', '241', '1', '2015-03-20 13:50:14', '2015-03-20 13:50:14', '1', null, '0');
INSERT INTO `banners` VALUES ('4', 'http://120.24.164.194:8087/products/5', '242', '1', '2015-03-20 13:51:07', '2015-03-20 13:51:07', '1', null, '0');
INSERT INTO `banners` VALUES ('5', 'http://120.24.164.194:8087/products/1', '243', '1', '2015-03-20 13:51:27', '2015-03-20 13:51:27', '1', null, '0');
INSERT INTO `banners` VALUES ('6', 'http://192.168.0.39:8087/products/29', '199', '1', '2015-03-11 15:02:02', '2015-03-11 15:02:02', '2', 'UNES优理氏祛痘控油套装 青春痘祛痘套装', '0');

-- ----------------------------
-- Table structure for category_attributes
-- ----------------------------
DROP TABLE IF EXISTS `category_attributes`;
CREATE TABLE `category_attributes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `input_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frontend_label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category_attributes
-- ----------------------------
INSERT INTO `category_attributes` VALUES ('1', 'Prof. Kieran Heathcote DDS', '', '', '', '', '1', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attributes` VALUES ('2', 'Jaime Connelly', '', '', '', '', '1', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attributes` VALUES ('3', 'Kimberly Zemlak', '', '', '', '', '1', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attributes` VALUES ('4', 'Dianna Graham', '', '', '', '', '1', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attributes` VALUES ('5', 'Crystal Klocko', '', '', '', '', '1', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attributes` VALUES ('6', 'Dr. Kristoffer Runte Jr.', '', '', '', '', '1', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attributes` VALUES ('7', 'Will Wilderman', '', '', '', '', '1', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attributes` VALUES ('8', 'Dr. Miracle Howell V', '', '', '', '', '1', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attributes` VALUES ('9', 'Michale Keebler', '', '', '', '', '1', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attributes` VALUES ('10', 'Prof. Sherwood Cummerata III', '', '', '', '', '1', '2015-03-04 11:21:22', '2015-03-04 11:21:22');

-- ----------------------------
-- Table structure for category_attributes_attribute_sets
-- ----------------------------
DROP TABLE IF EXISTS `category_attributes_attribute_sets`;
CREATE TABLE `category_attributes_attribute_sets` (
  `attribute_id` int(10) unsigned NOT NULL,
  `attribute_set_id` int(10) unsigned NOT NULL,
  KEY `attributes_attribute_sets` (`attribute_id`,`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category_attributes_attribute_sets
-- ----------------------------

-- ----------------------------
-- Table structure for category_attribute_sets
-- ----------------------------
DROP TABLE IF EXISTS `category_attribute_sets`;
CREATE TABLE `category_attribute_sets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category_attribute_sets
-- ----------------------------
INSERT INTO `category_attribute_sets` VALUES ('1', 'Dr. Ruben Cummings Sr.', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_sets` VALUES ('2', 'Verlie Rutherford', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_sets` VALUES ('3', 'Mr. Llewellyn Parker', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_sets` VALUES ('4', 'Vern Kris V', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_sets` VALUES ('5', 'Akeem Williamson', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_sets` VALUES ('6', 'Flo Mraz', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_sets` VALUES ('7', 'Landen Simonis', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_sets` VALUES ('8', 'Dorothy Morissette', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_sets` VALUES ('9', 'Una Rutherford', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_sets` VALUES ('10', 'Prof. Erling McClure DVM', '', '2015-03-04 11:21:20', '2015-03-04 11:21:20');

-- ----------------------------
-- Table structure for category_attribute_sets_categories
-- ----------------------------
DROP TABLE IF EXISTS `category_attribute_sets_categories`;
CREATE TABLE `category_attribute_sets_categories` (
  `category_id` int(10) unsigned NOT NULL,
  `attribute_set_id` int(10) unsigned NOT NULL,
  KEY `attribute_sets_categories` (`category_id`,`attribute_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category_attribute_sets_categories
-- ----------------------------

-- ----------------------------
-- Table structure for category_attribute_values
-- ----------------------------
DROP TABLE IF EXISTS `category_attribute_values`;
CREATE TABLE `category_attribute_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `attribute_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category_attribute_values
-- ----------------------------
INSERT INTO `category_attribute_values` VALUES ('1', 'Dr. Oren Powlowski V', '0', '1', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `category_attribute_values` VALUES ('2', 'Chelsey Jenkins', '1', '1', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('3', 'Reggie Yundt', '2', '1', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('4', 'Dr. Joannie Berge', '3', '1', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('5', 'Dr. Aurelie Haley MD', '4', '1', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('6', 'Brad Walter', '0', '2', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('7', 'Cristal Waelchi', '1', '2', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('8', 'Rosalyn Schroeder', '2', '2', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('9', 'Hank Luettgen', '3', '2', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('10', 'Mrs. Sallie Brekke PhD', '4', '2', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('11', 'Nella Hintz', '0', '3', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('12', 'Ms. Rowena Moore IV', '1', '3', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('13', 'Prof. Tony Lind', '2', '3', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('14', 'Dale Haley', '3', '3', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('15', 'Brionna Emard', '4', '3', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('16', 'Ansel Lockman', '0', '4', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('17', 'Dr. Anais Glover', '1', '4', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('18', 'Emmitt Wunsch', '2', '4', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('19', 'Christop Cronin', '3', '4', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('20', 'Russel Gusikowski', '4', '4', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('21', 'Dalton Gerhold', '0', '5', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('22', 'Dr. Dario Herzog', '1', '5', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('23', 'Prof. Kraig Kohler', '2', '5', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('24', 'Andreanne Flatley', '3', '5', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('25', 'Mrs. Dorothea Funk', '4', '5', '2015-03-04 11:21:21', '2015-03-04 11:21:21');
INSERT INTO `category_attribute_values` VALUES ('26', 'Felipe Sporer', '0', '6', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('27', 'Prof. Eric Stehr', '1', '6', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('28', 'Herta Dach', '2', '6', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('29', 'Mikayla Mitchell', '3', '6', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('30', 'Miss Abagail Crooks DDS', '4', '6', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('31', 'Owen Cronin DDS', '0', '7', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('32', 'Colton Orn', '1', '7', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('33', 'Estefania Wuckert', '2', '7', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('34', 'Isabel Hoppe', '3', '7', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('35', 'Marcus Harber', '4', '7', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('36', 'Letitia Wilkinson', '0', '8', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('37', 'Verdie Bergstrom', '1', '8', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('38', 'Dr. Chanel Williamson Jr.', '2', '8', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('39', 'Miss Willow Torp I', '3', '8', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('40', 'Mr. Green Turner', '4', '8', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('41', 'Dagmar Lueilwitz', '0', '9', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('42', 'Shyann O\'Kon IV', '1', '9', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('43', 'Olga Walter V', '2', '9', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('44', 'Elisa Pollich', '3', '9', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('45', 'Justyn Block DDS', '4', '9', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('46', 'Crystel Botsford', '0', '10', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('47', 'Andres Olson', '1', '10', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('48', 'Jett O\'Kon', '2', '10', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('49', 'Cleveland Streich', '3', '10', '2015-03-04 11:21:22', '2015-03-04 11:21:22');
INSERT INTO `category_attribute_values` VALUES ('50', 'Dawson Upton II', '4', '10', '2015-03-04 11:21:22', '2015-03-04 11:21:22');

-- ----------------------------
-- Table structure for category_attribute_values_products
-- ----------------------------
DROP TABLE IF EXISTS `category_attribute_values_products`;
CREATE TABLE `category_attribute_values_products` (
  `product_id` int(10) unsigned NOT NULL,
  `attribute_id` int(10) unsigned NOT NULL,
  `value_id` int(10) unsigned DEFAULT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  KEY `attribute_values_products` (`product_id`,`attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category_attribute_values_products
-- ----------------------------

-- ----------------------------
-- Table structure for cron_job
-- ----------------------------
DROP TABLE IF EXISTS `cron_job`;
CREATE TABLE `cron_job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `return` text COLLATE utf8_unicode_ci NOT NULL,
  `runtime` float(8,2) NOT NULL,
  `cron_manager_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cron_job_name_cron_manager_id_index` (`name`,`cron_manager_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cron_job
-- ----------------------------

-- ----------------------------
-- Table structure for cron_manager
-- ----------------------------
DROP TABLE IF EXISTS `cron_manager`;
CREATE TABLE `cron_manager` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rundate` datetime NOT NULL,
  `runtime` float(8,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cron_manager
-- ----------------------------
INSERT INTO `cron_manager` VALUES ('1', '2015-03-09 14:04:58', '0.00');
INSERT INTO `cron_manager` VALUES ('2', '2015-03-09 14:05:34', '0.00');
INSERT INTO `cron_manager` VALUES ('3', '2015-03-09 14:14:58', '0.00');
INSERT INTO `cron_manager` VALUES ('4', '2015-03-09 14:15:24', '0.00');
INSERT INTO `cron_manager` VALUES ('5', '2015-03-09 14:18:22', '0.00');
INSERT INTO `cron_manager` VALUES ('6', '2015-03-09 14:18:53', '0.00');
INSERT INTO `cron_manager` VALUES ('7', '2015-03-09 14:19:26', '0.00');
INSERT INTO `cron_manager` VALUES ('8', '2015-03-09 14:22:00', '0.00');
INSERT INTO `cron_manager` VALUES ('9', '2015-03-09 14:29:01', '0.00');
INSERT INTO `cron_manager` VALUES ('10', '2015-03-09 14:30:01', '0.00');
INSERT INTO `cron_manager` VALUES ('11', '2015-03-09 14:31:01', '0.00');
INSERT INTO `cron_manager` VALUES ('12', '2015-03-09 14:37:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('13', '2015-03-09 14:38:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('14', '2015-03-09 14:39:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('15', '2015-03-09 14:40:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('16', '2015-03-09 14:41:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('17', '2015-03-09 14:42:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('18', '2015-03-09 14:43:02', '-1.00');
INSERT INTO `cron_manager` VALUES ('19', '2015-03-09 14:44:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('20', '2015-03-09 14:45:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('21', '2015-03-09 14:46:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('22', '2015-03-09 14:47:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('23', '2015-03-09 14:48:02', '-1.00');
INSERT INTO `cron_manager` VALUES ('24', '2015-03-09 14:49:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('25', '2015-03-09 14:50:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('26', '2015-03-09 14:51:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('27', '2015-03-09 14:52:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('28', '2015-03-09 14:53:02', '-1.00');
INSERT INTO `cron_manager` VALUES ('29', '2015-03-09 14:54:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('30', '2015-03-09 14:55:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('31', '2015-03-09 14:56:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('32', '2015-03-09 14:57:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('33', '2015-03-09 14:58:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('34', '2015-03-09 14:59:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('35', '2015-03-09 15:00:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('36', '2015-03-09 15:01:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('37', '2015-03-09 15:02:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('38', '2015-03-09 15:04:02', '-1.00');
INSERT INTO `cron_manager` VALUES ('39', '2015-03-09 15:05:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('40', '2015-03-09 15:06:01', '-1.00');
INSERT INTO `cron_manager` VALUES ('41', '2015-03-09 15:56:59', '-1.00');
INSERT INTO `cron_manager` VALUES ('42', '2015-03-09 17:17:37', '-1.00');
INSERT INTO `cron_manager` VALUES ('43', '2015-03-09 17:17:38', '-1.00');
INSERT INTO `cron_manager` VALUES ('44', '2015-03-09 17:27:32', '-1.00');
INSERT INTO `cron_manager` VALUES ('45', '2015-03-09 17:27:55', '-1.00');
INSERT INTO `cron_manager` VALUES ('46', '2015-03-09 17:28:05', '-1.00');
INSERT INTO `cron_manager` VALUES ('47', '2015-03-09 17:30:48', '-1.00');
INSERT INTO `cron_manager` VALUES ('48', '2015-03-09 17:33:04', '-1.00');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `leader_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `level_id` int(10) unsigned NOT NULL,
  `order_total_pay` float(11,2) NOT NULL DEFAULT '0.00',
  `order_total_num` int(11) NOT NULL DEFAULT '0',
  `leader_profit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '给上线带来的分润',
  `total_profit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '自己的分润总额',
  `follwer_profit` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '给下线带来的分润',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '账户余额',
  `used_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '已提现金额',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '总分润额',
  `login_tries` int(11) DEFAULT '0',
  `last_login_try` timestamp NULL DEFAULT NULL,
  `token_invalid_at` timestamp NULL DEFAULT NULL,
  `unlock_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customers
-- ----------------------------
INSERT INTO `customers` VALUES ('1', '2', null, '13138656869', '$2y$10$7bAEAxjWqKzPatpmwGsI8.Y7t/EOjjC6o14FKIZg5Asr2VVWlxUPG', 'VWBYjpC9Nx7hloji8I3DyRnX4u16OH0wUDwimhkKRa838lMdJrbvHf6kWrXc', '1', '1', '1', '0.07', '9', '0.00', '10.00', '0.00', '1.00', '0.00', '2015-03-13 14:44:57', '2015-04-11 15:10:49', '0', null, null, null);
INSERT INTO `customers` VALUES ('2', '4', null, '18520254233', '$2y$10$sNtS2b5oGA/hjs3D7g.fSOMuXGG6uGzvbY7V2o4N3MjCEYhbQBila', null, '1', '2', '1', '0.00', '0', '0.00', '20.00', '0.00', '2.00', '1.00', '2015-03-13 16:45:12', '2015-03-13 16:51:02', '0', null, null, null);
INSERT INTO `customers` VALUES ('3', '5', null, '18922255952', '$2y$10$hpUJpowPFLfOqCCzMGEtquD63XCcxE9UfpjUuJVWQu9/BJQllz1Oa', null, '1', '1', '1', '0.00', '1', '0.00', '30.00', '0.00', '3.00', '2.00', '2015-03-13 20:47:37', '2015-03-13 20:50:35', '0', null, null, null);
INSERT INTO `customers` VALUES ('4', '6', null, '13421344069', '$2y$10$qhiKDe5AA1uqiqfjam044uyDrM/c/SQSPi6IEkiwW5LY9ydMKd9sy', null, '1', '1', '1', '2.00', '3', '0.00', '40.00', '0.00', '4.22', '3.00', '2015-03-17 11:16:19', '2015-05-04 17:28:13', '0', null, null, null);
INSERT INTO `customers` VALUES ('5', '6', null, '13380056186', '$2y$10$PWUvnNGLy8SM.bGTBlE/geo9lpPiWDO52ZPsOStTq5JGAH2trxH4a', null, '1', '2', '1', '0.00', '0', '0.00', '50.00', '0.00', '5.00', '4.00', '2015-03-17 13:25:57', '2015-05-04 17:28:29', '0', null, null, null);
INSERT INTO `customers` VALUES ('6', '0', null, '17722858319', '$2y$10$7bAEAxjWqKzPatpmwGsI8.Y7t/EOjjC6o14FKIZg5Asr2VVWlxUPG', 'oB0IUiISgohew2Z3qHiQoqk5sTXzx0gLyMvpTNHfnUF9NnGWrBQ2GnZmwzFa', '1', '1', '1', '0.00', '0', '0.00', '60.00', '0.00', '1.58', '5.00', '2015-05-04 15:11:50', '2015-04-30 14:51:29', '0', null, null, null);

-- ----------------------------
-- Table structure for customer_accounts
-- ----------------------------
DROP TABLE IF EXISTS `customer_accounts`;
CREATE TABLE `customer_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `alipay_account` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `alipay_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cash_account` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `cash_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `bank_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `image1` int(11) NOT NULL,
  `image2` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_accounts
-- ----------------------------
INSERT INTO `customer_accounts` VALUES ('1', '5', '462790727@qq.com', '张小帅', '6227001291082482737', '张小帅', '中国建设银行', '310', '311', '0000-00-00 00:00:00', '2015-05-22 17:23:15');

-- ----------------------------
-- Table structure for customer_account_logs
-- ----------------------------
DROP TABLE IF EXISTS `customer_account_logs`;
CREATE TABLE `customer_account_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `money` decimal(11,2) DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `agree_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_account_logs
-- ----------------------------
INSERT INTO `customer_account_logs` VALUES ('21', '6', '2.22', '1', '0000-00-00 00:00:00', '2015-04-30 14:42:18', '2015-04-30 14:42:18');
INSERT INTO `customer_account_logs` VALUES ('22', '6', '1.24', '1', '0000-00-00 00:00:00', '2015-04-30 14:43:34', '2015-04-30 14:43:34');
INSERT INTO `customer_account_logs` VALUES ('23', '6', '4.33', '2', '0000-00-00 00:00:00', '2015-04-30 14:48:32', '2015-04-30 14:48:32');
INSERT INTO `customer_account_logs` VALUES ('24', '6', '1.20', '0', '0000-00-00 00:00:00', '2015-04-30 14:51:29', '2015-04-30 14:51:29');

-- ----------------------------
-- Table structure for customer_collections
-- ----------------------------
DROP TABLE IF EXISTS `customer_collections`;
CREATE TABLE `customer_collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_collections
-- ----------------------------
INSERT INTO `customer_collections` VALUES ('1', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '5', '2', '2015-03-13 16:47:44', '2015-03-13 16:47:44');
INSERT INTO `customer_collections` VALUES ('9', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '4', '4', '2015-03-19 17:32:17', '2015-03-19 17:32:17');

-- ----------------------------
-- Table structure for customer_customers_groups
-- ----------------------------
DROP TABLE IF EXISTS `customer_customers_groups`;
CREATE TABLE `customer_customers_groups` (
  `customer_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  KEY `customers_groups` (`customer_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_customers_groups
-- ----------------------------

-- ----------------------------
-- Table structure for customer_details
-- ----------------------------
DROP TABLE IF EXISTS `customer_details`;
CREATE TABLE `customer_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `region_id` int(11) NOT NULL DEFAULT '0',
  `skin_type_id` int(11) NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '0',
  `image_id` int(11) NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_details
-- ----------------------------
INSERT INTO `customer_details` VALUES ('1', '下下下级会员1', '0', '0', null, '0', '0', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `customer_details` VALUES ('2', '下下级会员2', '0', '0', null, '0', '0', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `customer_details` VALUES ('3', '下下级会员1', '0', '0', null, '0', '0', '3', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `customer_details` VALUES ('4', '阿林的下级会员2', '0', '0', null, '0', '225', '4', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `customer_details` VALUES ('5', '阿林的下级会员1', '0', '0', null, '0', '0', '5', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `customer_details` VALUES ('6', '阿林', '0', '0', null, '0', '0', '6', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for customer_groups
-- ----------------------------
DROP TABLE IF EXISTS `customer_groups`;
CREATE TABLE `customer_groups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_groups
-- ----------------------------

-- ----------------------------
-- Table structure for customer_levels
-- ----------------------------
DROP TABLE IF EXISTS `customer_levels`;
CREATE TABLE `customer_levels` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_levels
-- ----------------------------

-- ----------------------------
-- Table structure for customer_orders
-- ----------------------------
DROP TABLE IF EXISTS `customer_orders`;
CREATE TABLE `customer_orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_sn` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `count` int(11) NOT NULL DEFAULT '0',
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_id` int(10) unsigned NOT NULL,
  `status_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `agent_id` int(10) NOT NULL DEFAULT '0',
  `customer_id` int(10) unsigned NOT NULL,
  `with_invoice` tinyint(1) NOT NULL DEFAULT '0',
  `invoice_head` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `payment_method` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notify_data` text COLLATE utf8_unicode_ci,
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `adviser_id` int(11) NOT NULL DEFAULT '0',
  `order_type` tinyint(4) NOT NULL DEFAULT '1',
  `is_profited` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `logistics_company_id` int(11) DEFAULT NULL,
  `logistics_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trade_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_payed` tinyint(4) NOT NULL DEFAULT '0',
  `pay_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_orders
-- ----------------------------
INSERT INTO `customer_orders` VALUES ('1', '15031363', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '1', '', '2', '待发货', '2', '1', '0', null, null, 'ALIPAY', '{\"payment_type\":\"1\",\"subject\":\"\\u7f8e\\u5373\\uff08Magic\\uff09\\u51c0\\u767d\\u6c34\\u6da68\\u90014\\u5206\\u4eab\\u88c5 25g\\u00d710\\u7247+3g\\u00d72\\u5bf9\",\"trade_no\":\"2015031300001000540049251060\",\"buyer_email\":\"18874443090\",\"gmt_create\":\"2015-03-13 17:02:32\",\"notify_type\":\"trade_status_sync\",\"quantity\":\"1\",\"out_trade_no\":\"15031363\",\"notify_time\":\"2015-03-13 17:02:41\",\"seller_id\":\"2088412354026973\",\"trade_status\":\"TRADE_SUCCESS\",\"is_total_fee_adjust\":\"N\",\"total_fee\":\"0.01\",\"gmt_payment\":\"2015-03-13 17:02:40\",\"seller_email\":\"188811738@qq.com\",\"price\":\"0.01\",\"buyer_id\":\"2088702865928544\",\"notify_id\":\"26ccb545fdd7536c57eaa0e62483dbe750\",\"use_coupon\":\"N\"}', '0', '0', '1', '1', '2015-03-13 17:02:27', '2015-03-17 11:52:49', '10', 'U45589E3034', '2015031300001000540049251060', '1', '2015-03-13 17:02:41');
INSERT INTO `customer_orders` VALUES ('2', '15031364', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '1.00', '1', '', '1', '待支付', '2', '1', '0', null, null, 'ALIPAY', null, '0', '0', '1', '0', '2015-03-13 20:50:35', '2015-03-13 20:50:35', null, null, null, '0', '0000-00-00 00:00:00');
INSERT INTO `customer_orders` VALUES ('3', '15031765', 'Clinique 倩碧水嫩保湿夜间滋养面膜(水磁场7NR5) 100ml#', '1.00', '1', '留言', '3', '待发货', '2', '1', '0', null, null, 'ALIPAY', '{\"payment_type\":\"1\",\"subject\":\"Clinique \\u5029\\u78a7\\u6c34\\u5ae9\\u4fdd\\u6e7f\\u591c\\u95f4\\u6ecb\\u517b\\u9762\\u819c(\\u6c34\\u78c1\\u573a7NR5) 100ml#\",\"trade_no\":\"2015031700001000470051274787\",\"buyer_email\":\"13421344069\",\"gmt_create\":\"2015-03-17 12:25:28\",\"notify_type\":\"trade_status_sync\",\"quantity\":\"1\",\"out_trade_no\":\"15031765\",\"notify_time\":\"2015-03-17 12:25:43\",\"seller_id\":\"2088412354026973\",\"trade_status\":\"TRADE_SUCCESS\",\"is_total_fee_adjust\":\"N\",\"total_fee\":\"1.00\",\"gmt_payment\":\"2015-03-17 12:25:42\",\"seller_email\":\"188811738@qq.com\",\"price\":\"1.00\",\"buyer_id\":\"2088802736651471\",\"notify_id\":\"e2e0efaa5da18272dcaeeb94f21b84024m\",\"use_coupon\":\"N\"}', '0', '0', '1', '1', '2015-03-17 12:17:59', '2015-03-17 13:44:01', '1', '1111111', '2015031700001000470051274787', '1', '2015-03-17 12:25:43');
INSERT INTO `customer_orders` VALUES ('4', '15031866', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '0.01', '1', '', '5', '待支付', '2', '1', '0', null, null, 'WXPAY', null, '0', '0', '1', '0', '2015-03-18 10:40:21', '2015-03-18 10:40:21', null, null, null, '0', '0000-00-00 00:00:00');
INSERT INTO `customer_orders` VALUES ('5', '15031867', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '0.01', '1', '', '4', '待发货', '4', '2', '0', null, null, 'ALIPAY', '{\"payment_type\":\"1\",\"subject\":\"\\u7f8e\\u5373\\uff08Magic\\uff09\\u6d77\\u6d0b\\u51b0\\u6cc9\\u8865\\u6c34\\u9762\\u819c10\\u7247\\u88c5 25g\\u00d710\\u7247\",\"trade_no\":\"2015031800001000540049626216\",\"buyer_email\":\"18874443090\",\"gmt_create\":\"2015-03-18 11:36:43\",\"notify_type\":\"trade_status_sync\",\"quantity\":\"1\",\"out_trade_no\":\"15031867\",\"notify_time\":\"2015-03-18 11:36:56\",\"seller_id\":\"2088412354026973\",\"trade_status\":\"TRADE_SUCCESS\",\"is_total_fee_adjust\":\"N\",\"total_fee\":\"0.01\",\"gmt_payment\":\"2015-03-18 11:36:56\",\"seller_email\":\"188811738@qq.com\",\"price\":\"0.01\",\"buyer_id\":\"2088702865928544\",\"notify_id\":\"f9c15318f66a0928136a5eaebe6c248550\",\"use_coupon\":\"N\"}', '0', '0', '1', '0', '2015-03-18 11:35:12', '2015-03-18 11:36:56', null, null, '2015031800001000540049626216', '1', '2015-03-18 11:36:56');
INSERT INTO `customer_orders` VALUES ('6', '15031968', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '1', '', '0', '待发货', '5', '3', '0', null, null, 'ALIPAY', '{\"payment_type\":\"1\",\"subject\":\"\\u7f8e\\u5373\\uff08Magic\\uff09\\u51c0\\u767d\\u6c34\\u6da68\\u90014\\u5206\\u4eab\\u88c5 25g\\u00d710\\u7247+3g\\u00d72\\u5bf9\",\"trade_no\":\"2015031900001000540049697064\",\"buyer_email\":\"18874443090\",\"gmt_create\":\"2015-03-19 10:29:45\",\"notify_type\":\"trade_status_sync\",\"quantity\":\"1\",\"out_trade_no\":\"15031968\",\"notify_time\":\"2015-03-19 10:29:54\",\"seller_id\":\"2088412354026973\",\"trade_status\":\"TRADE_SUCCESS\",\"is_total_fee_adjust\":\"N\",\"total_fee\":\"0.01\",\"gmt_payment\":\"2015-03-19 10:29:54\",\"seller_email\":\"188811738@qq.com\",\"price\":\"0.01\",\"buyer_id\":\"2088702865928544\",\"notify_id\":\"1ff3f4bf26468220f9fb7cd0fc4e5c7d50\",\"use_coupon\":\"N\"}', '0', '0', '1', '1', '2015-03-19 10:29:38', '2015-03-19 10:32:01', '183', 'U45589E3034', '2015031900001000540049697064', '1', '2015-03-19 10:29:55');
INSERT INTO `customer_orders` VALUES ('7', '15031969', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '0.01', '1', '', '3', '待发货', '0', '0', '0', null, null, 'ALIPAY', '{\"payment_type\":\"1\",\"subject\":\"\\u7f8e\\u5373\\uff08Magic\\uff09\\u6d77\\u6d0b\\u51b0\\u6cc9\\u8865\\u6c34\\u9762\\u819c10\\u7247\\u88c5 25g\\u00d710\\u7247\",\"trade_no\":\"2015031900001000540049711980\",\"buyer_email\":\"18874443090\",\"gmt_create\":\"2015-03-19 13:20:31\",\"notify_type\":\"trade_status_sync\",\"quantity\":\"1\",\"out_trade_no\":\"15031969\",\"notify_time\":\"2015-03-19 13:20:59\",\"seller_id\":\"2088412354026973\",\"trade_status\":\"TRADE_SUCCESS\",\"is_total_fee_adjust\":\"N\",\"total_fee\":\"0.01\",\"gmt_payment\":\"2015-03-19 13:20:59\",\"seller_email\":\"188811738@qq.com\",\"price\":\"0.01\",\"buyer_id\":\"2088702865928544\",\"notify_id\":\"357050482aeedcd74d5dc61bfb03ede050\",\"use_coupon\":\"N\"}', '0', '0', '1', '1', '2015-03-19 13:20:25', '2015-03-19 13:23:01', '183', 'U45589E3034', '2015031900001000540049711980', '1', '2015-03-19 13:20:59');
INSERT INTO `customer_orders` VALUES ('8', '15031970', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '0.01', '1', '1111', '1', '待支付', '6', '4', '0', null, null, 'ALIPAY', null, '0', '0', '1', '0', '2015-03-19 17:28:25', '2015-03-19 17:28:25', null, null, null, '0', '0000-00-00 00:00:00');
INSERT INTO `customer_orders` VALUES ('9', '15031971', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '1.00', '1', '', '12', '待发货', '6', '4', '0', null, null, 'ALIPAY', '{\"payment_type\":\"1\",\"subject\":\"\\u7f8e\\u5373\\uff08Magic\\uff09\\u6d77\\u6d0b\\u51b0\\u6cc9\\u8865\\u6c34\\u9762\\u819c10\\u7247\\u88c5 25g\\u00d710\\u7247\",\"trade_no\":\"2015031900001000460047365829\",\"buyer_email\":\"18922702208\",\"gmt_create\":\"2015-03-19 17:38:24\",\"notify_type\":\"trade_status_sync\",\"quantity\":\"1\",\"out_trade_no\":\"15031971\",\"notify_time\":\"2015-03-19 17:38:39\",\"seller_id\":\"2088412354026973\",\"trade_status\":\"TRADE_SUCCESS\",\"is_total_fee_adjust\":\"N\",\"total_fee\":\"1.00\",\"gmt_payment\":\"2015-03-19 17:38:38\",\"seller_email\":\"188811738@qq.com\",\"price\":\"1.00\",\"buyer_id\":\"2088212140448462\",\"notify_id\":\"a10db30a95f821943fb9c643731dbc7d4k\",\"use_coupon\":\"N\"}', '0', '0', '1', '1', '2015-03-19 17:36:55', '2015-03-19 17:41:02', '8', '555555', '2015031900001000460047365829', '1', '2015-03-19 17:38:39');
INSERT INTO `customer_orders` VALUES ('10', '15031972', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '1', '', '5', '待发货', '6', '5', '0', null, null, 'ALIPAY', '{\"payment_type\":\"1\",\"subject\":\"\\u7f8e\\u5373\\uff08Magic\\uff09\\u51c0\\u767d\\u6c34\\u6da68\\u90014\\u5206\\u4eab\\u88c5 25g\\u00d710\\u7247+3g\\u00d72\\u5bf9\",\"trade_no\":\"2015031900001000540049736436\",\"buyer_email\":\"18874443090\",\"gmt_create\":\"2015-03-19 18:38:12\",\"notify_type\":\"trade_status_sync\",\"quantity\":\"1\",\"out_trade_no\":\"15031972\",\"notify_time\":\"2015-03-19 18:38:23\",\"seller_id\":\"2088412354026973\",\"trade_status\":\"TRADE_SUCCESS\",\"is_total_fee_adjust\":\"N\",\"total_fee\":\"0.01\",\"gmt_payment\":\"2015-03-19 18:38:23\",\"seller_email\":\"188811738@qq.com\",\"price\":\"0.01\",\"buyer_id\":\"2088702865928544\",\"notify_id\":\"5ba91c652b4c0939ea0162cecb0a2f9450\",\"use_coupon\":\"N\"}', '0', '0', '1', '1', '2015-03-19 18:38:07', '2015-03-19 18:44:44', '182', '3445354345354', '2015031900001000540049736436', '1', '2015-03-19 18:38:24');
INSERT INTO `customer_orders` VALUES ('11', '15031973', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '1', '', '1', '待发货', '6', '5', '0', null, null, 'ALIPAY', '{\"payment_type\":\"1\",\"subject\":\"\\u7f8e\\u5373\\uff08Magic\\uff09\\u51c0\\u767d\\u6c34\\u6da68\\u90014\\u5206\\u4eab\\u88c5 25g\\u00d710\\u7247+3g\\u00d72\\u5bf9\",\"trade_no\":\"2015031900001000540049736824\",\"buyer_email\":\"18874443090\",\"gmt_create\":\"2015-03-19 18:43:38\",\"notify_type\":\"trade_status_sync\",\"quantity\":\"1\",\"out_trade_no\":\"15031973\",\"notify_time\":\"2015-03-19 18:43:52\",\"seller_id\":\"2088412354026973\",\"trade_status\":\"TRADE_SUCCESS\",\"is_total_fee_adjust\":\"N\",\"total_fee\":\"0.01\",\"gmt_payment\":\"2015-03-19 18:43:52\",\"seller_email\":\"188811738@qq.com\",\"price\":\"0.01\",\"buyer_id\":\"2088702865928544\",\"notify_id\":\"fa7ec6e26328674885fdcb54bed4148d50\",\"use_coupon\":\"N\"}', '0', '0', '1', '1', '2015-03-19 18:43:33', '2015-03-21 11:18:52', '76', 'U45589E3034', '2015031900001000540049736824', '1', '2015-03-19 18:43:53');
INSERT INTO `customer_orders` VALUES ('12', '15032174', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '1', '', '4', '待发货', '6', '4', '0', null, null, 'ALIPAY', '{\"payment_type\":\"1\",\"subject\":\"\\u7f8e\\u5373\\uff08Magic\\uff09\\u51c0\\u767d\\u6c34\\u6da68\\u90014\\u5206\\u4eab\\u88c5 25g\\u00d710\\u7247+3g\\u00d72\\u5bf9\",\"trade_no\":\"2015032100001000540049855805\",\"buyer_email\":\"18874443090\",\"gmt_create\":\"2015-03-21 11:01:10\",\"notify_type\":\"trade_status_sync\",\"quantity\":\"1\",\"out_trade_no\":\"15032174\",\"notify_time\":\"2015-03-21 11:01:18\",\"seller_id\":\"2088412354026973\",\"trade_status\":\"TRADE_SUCCESS\",\"is_total_fee_adjust\":\"N\",\"total_fee\":\"0.01\",\"gmt_payment\":\"2015-03-21 11:01:18\",\"seller_email\":\"188811738@qq.com\",\"price\":\"0.01\",\"buyer_id\":\"2088702865928544\",\"notify_id\":\"f93b21f4247d8e6af9a72c899829f6df50\",\"use_coupon\":\"N\"}', '0', '0', '1', '0', '2015-03-21 11:01:03', '2015-03-21 11:17:41', null, null, '2015032100001000540049855805', '1', '2015-03-21 11:01:18');
INSERT INTO `customer_orders` VALUES ('13', '15032375', '玻尿酸肽原液（至臻版）', '0.01', '1', '', '1', '待支付', '6', '5', '0', null, null, 'WXPAY', null, '0', '0', '1', '0', '2015-03-23 15:08:40', '2015-03-23 15:08:40', null, null, null, '0', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for customer_order_addresses
-- ----------------------------
DROP TABLE IF EXISTS `customer_order_addresses`;
CREATE TABLE `customer_order_addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `telephone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `region_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_order_addresses
-- ----------------------------
INSERT INTO `customer_order_addresses` VALUES ('1', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '1', '2015-03-13 14:45:07', '2015-03-13 14:45:07');
INSERT INTO `customer_order_addresses` VALUES ('2', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '1', '2015-03-13 15:13:10', '2015-03-13 15:13:10');
INSERT INTO `customer_order_addresses` VALUES ('3', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '2', '2015-03-13 15:20:26', '2015-03-13 15:20:26');
INSERT INTO `customer_order_addresses` VALUES ('4', 'iPhone', '龙三中路159', '18520254233', '18520254233', '江苏省 南京市 玄武区 龙三中路159', '3', '4', '2015-03-13 16:47:56', '2015-03-13 16:47:56');
INSERT INTO `customer_order_addresses` VALUES ('5', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '1', '2015-03-13 17:02:27', '2015-03-13 17:02:27');
INSERT INTO `customer_order_addresses` VALUES ('6', '张前飞', '棠东东路', '13421344069', '13421344069', '广东省 广州市 天河区 棠东东路', '1994', '3', '2015-03-17 12:17:59', '2015-03-17 12:17:59');
INSERT INTO `customer_order_addresses` VALUES ('7', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '4', '2015-03-18 10:40:21', '2015-03-18 10:40:21');
INSERT INTO `customer_order_addresses` VALUES ('8', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '5', '2015-03-18 11:35:12', '2015-03-18 11:35:12');
INSERT INTO `customer_order_addresses` VALUES ('9', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '6', '2015-03-19 10:29:39', '2015-03-19 10:29:39');
INSERT INTO `customer_order_addresses` VALUES ('10', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '7', '2015-03-19 13:20:25', '2015-03-19 13:20:25');
INSERT INTO `customer_order_addresses` VALUES ('11', '张前飞', '棠东东路', '13421344069', '13421344069', '广东省 广州市 天河区 棠东东路', '1994', '8', '2015-03-19 17:28:25', '2015-03-19 17:28:25');
INSERT INTO `customer_order_addresses` VALUES ('12', '张前飞', '棠东东路', '13421344069', '13421344069', '广东省 广州市 天河区 棠东东路', '1994', '9', '2015-03-19 17:36:55', '2015-03-19 17:36:55');
INSERT INTO `customer_order_addresses` VALUES ('13', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '10', '2015-03-19 18:38:07', '2015-03-19 18:38:07');
INSERT INTO `customer_order_addresses` VALUES ('14', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '11', '2015-03-19 18:43:33', '2015-03-19 18:43:33');
INSERT INTO `customer_order_addresses` VALUES ('15', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '12', '2015-03-21 11:01:03', '2015-03-21 11:01:03');
INSERT INTO `customer_order_addresses` VALUES ('16', '江先生', '谢家庄', '18520254233', '13138656869', '北京市 北京市 朝阳区 谢家庄', '143', '13', '2015-03-23 15:08:40', '2015-03-23 15:08:40');

-- ----------------------------
-- Table structure for customer_order_histories
-- ----------------------------
DROP TABLE IF EXISTS `customer_order_histories`;
CREATE TABLE `customer_order_histories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `comment` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `status_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_order_histories
-- ----------------------------
INSERT INTO `customer_order_histories` VALUES ('1', '买家已下单', '1', '1', '买家已下单', '2015-03-13 14:45:07', '2015-03-13 14:45:07');
INSERT INTO `customer_order_histories` VALUES ('2', '物流签收', '1', '4', '物流签收', '2015-03-13 14:47:08', '2015-03-13 14:47:08');
INSERT INTO `customer_order_histories` VALUES ('3', '买家已下单', '1', '1', '买家已下单', '2015-03-13 15:13:10', '2015-03-13 15:13:10');
INSERT INTO `customer_order_histories` VALUES ('4', '物流签收', '1', '4', '物流签收', '2015-03-13 15:13:54', '2015-03-13 15:13:54');
INSERT INTO `customer_order_histories` VALUES ('5', '买家已下单', '2', '1', '买家已下单', '2015-03-13 15:20:26', '2015-03-13 15:20:26');
INSERT INTO `customer_order_histories` VALUES ('6', '物流签收', '2', '4', '物流签收', '2015-03-13 15:21:14', '2015-03-13 15:21:14');
INSERT INTO `customer_order_histories` VALUES ('7', '买家已下单', '4', '1', '买家已下单', '2015-03-13 16:47:56', '2015-03-13 16:47:56');
INSERT INTO `customer_order_histories` VALUES ('8', '物流签收', '4', '4', '物流签收', '2015-03-13 16:49:07', '2015-03-13 16:49:07');
INSERT INTO `customer_order_histories` VALUES ('9', '买家已下单', '1', '1', '买家已下单', '2015-03-13 17:02:27', '2015-03-13 17:02:27');
INSERT INTO `customer_order_histories` VALUES ('10', '物流签收', '1', '4', '物流签收', '2015-03-13 17:03:53', '2015-03-13 17:03:53');
INSERT INTO `customer_order_histories` VALUES ('11', '买家已评论', '1', '5', '买家已评论', '2015-03-17 11:52:49', '2015-03-17 11:52:49');
INSERT INTO `customer_order_histories` VALUES ('12', '买家已下单', '3', '1', '买家已下单', '2015-03-17 12:17:59', '2015-03-17 12:17:59');
INSERT INTO `customer_order_histories` VALUES ('13', '物流签收', '3', '4', '物流签收', '2015-03-17 13:43:33', '2015-03-17 13:43:33');
INSERT INTO `customer_order_histories` VALUES ('14', '买家已下单', '4', '1', '买家已下单', '2015-03-18 10:40:21', '2015-03-18 10:40:21');
INSERT INTO `customer_order_histories` VALUES ('15', '买家已下单', '5', '1', '买家已下单', '2015-03-18 11:35:12', '2015-03-18 11:35:12');
INSERT INTO `customer_order_histories` VALUES ('16', '买家已下单', '6', '1', '买家已下单', '2015-03-19 10:29:39', '2015-03-19 10:29:39');
INSERT INTO `customer_order_histories` VALUES ('17', '物流签收', '6', '4', '物流签收', '2015-03-19 10:30:52', '2015-03-19 10:30:52');
INSERT INTO `customer_order_histories` VALUES ('18', '买家已下单', '7', '1', '买家已下单', '2015-03-19 13:20:25', '2015-03-19 13:20:25');
INSERT INTO `customer_order_histories` VALUES ('19', '物流签收', '7', '4', '物流签收', '2015-03-19 13:21:45', '2015-03-19 13:21:45');
INSERT INTO `customer_order_histories` VALUES ('20', '买家已下单', '8', '1', '买家已下单', '2015-03-19 17:28:25', '2015-03-19 17:28:25');
INSERT INTO `customer_order_histories` VALUES ('21', '买家已下单', '9', '1', '买家已下单', '2015-03-19 17:36:55', '2015-03-19 17:36:55');
INSERT INTO `customer_order_histories` VALUES ('22', '物流签收', '9', '4', '物流签收', '2015-03-19 17:40:15', '2015-03-19 17:40:15');
INSERT INTO `customer_order_histories` VALUES ('23', '买家已评论', '9', '5', '买家已评论', '2015-03-19 17:40:24', '2015-03-19 17:40:24');
INSERT INTO `customer_order_histories` VALUES ('24', '买家已下单', '10', '1', '买家已下单', '2015-03-19 18:38:07', '2015-03-19 18:38:07');
INSERT INTO `customer_order_histories` VALUES ('25', '物流签收', '10', '4', '物流签收', '2015-03-19 18:39:32', '2015-03-19 18:39:32');
INSERT INTO `customer_order_histories` VALUES ('26', '买家已下单', '11', '1', '买家已下单', '2015-03-19 18:43:33', '2015-03-19 18:43:33');
INSERT INTO `customer_order_histories` VALUES ('27', '物流签收', '11', '4', '物流签收', '2015-03-19 18:44:23', '2015-03-19 18:44:23');
INSERT INTO `customer_order_histories` VALUES ('28', '买家已评论', '10', '5', '买家已评论', '2015-03-19 18:44:44', '2015-03-19 18:44:44');
INSERT INTO `customer_order_histories` VALUES ('29', '买家已下单', '12', '1', '买家已下单', '2015-03-21 11:01:03', '2015-03-21 11:01:03');
INSERT INTO `customer_order_histories` VALUES ('30', '买家已申请退款', '12', '6', '买家已申请退款', '2015-03-21 11:01:39', '2015-03-21 11:01:39');
INSERT INTO `customer_order_histories` VALUES ('31', '买家已评论', '11', '5', '买家已评论', '2015-03-21 11:18:52', '2015-03-21 11:18:52');
INSERT INTO `customer_order_histories` VALUES ('32', '买家已下单', '13', '1', '买家已下单', '2015-03-23 15:08:40', '2015-03-23 15:08:40');

-- ----------------------------
-- Table structure for customer_order_products
-- ----------------------------
DROP TABLE IF EXISTS `customer_order_products`;
CREATE TABLE `customer_order_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `total` decimal(8,2) NOT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `option_set` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_entity_id` int(10) unsigned NOT NULL,
  `shop_id` int(11) NOT NULL DEFAULT '0',
  `shop_product_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `image_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `option_set_values` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_order_products
-- ----------------------------
INSERT INTO `customer_order_products` VALUES ('1', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '0.01', '009', '1', '|51|', '1', '5', '15', '3', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-11/hSR4Z1426058895.jpg', '尺寸:S');
INSERT INTO `customer_order_products` VALUES ('2', 'Clinique 倩碧水嫩保湿夜间滋养面膜(水磁场7NR5) 100ml#', '1.00', '1.00', '004', '15', '|46|', '3', '3', '10', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-11/fuOmA1426054908.jpg', '尺寸:S');
INSERT INTO `customer_order_products` VALUES ('3', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '0.01', '0.01', '007', '1', '|49|', '4', '4', '13', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-11/3pGsf1426058785.jpg', '颜色:红色');
INSERT INTO `customer_order_products` VALUES ('4', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '0.01', '0.01', '007', '2', '|49|', '5', '4', '13', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-11/3pGsf1426058785.jpg', '颜色:红色');
INSERT INTO `customer_order_products` VALUES ('5', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '0.01', '009', '3', '|51|', '6', '5', '15', '3', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-19/ZsK571426730993.jpg', '尺寸:S');
INSERT INTO `customer_order_products` VALUES ('6', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '0.01', '0.01', '007', '4', '|49|', '7', '4', '13', '3', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-19/Ep41C1426731012.jpg', '颜色:红色');
INSERT INTO `customer_order_products` VALUES ('7', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '0.01', '0.01', '007', '1', '|49|', '8', '4', '13', '11', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-19/Ep41C1426731012.jpg', '颜色:红色');
INSERT INTO `customer_order_products` VALUES ('8', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '1.00', '1.00', '007', '2', '|49|', '9', '4', '13', '11', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-19/Ep41C1426731012.jpg', '颜色:红色');
INSERT INTO `customer_order_products` VALUES ('9', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '0.01', '1111', '1', '|55|', '10', '5', '19', '3', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-19/ZsK571426730993.jpg', '颜色:红色');
INSERT INTO `customer_order_products` VALUES ('10', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '0.01', '1111', '1', '|56|', '11', '5', '20', '3', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-19/ZsK571426730993.jpg', '颜色:黑色');
INSERT INTO `customer_order_products` VALUES ('11', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对', '0.01', '0.01', '22', '5', '|57|', '12', '5', '21', '2', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-19/ZsK571426730993.jpg', '颜色:红色');
INSERT INTO `customer_order_products` VALUES ('12', '玻尿酸肽原液（至臻版）', '168.00', '168.00', 'du6952711602957', '3', '|65|', '13', '13', '29', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00', '/uploads/2015-03-23/PRGdI1427082162.jpg', '容量:30ml');

-- ----------------------------
-- Table structure for customer_order_product_options
-- ----------------------------
DROP TABLE IF EXISTS `customer_order_product_options`;
CREATE TABLE `customer_order_product_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `order_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `option_value_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_order_product_options
-- ----------------------------

-- ----------------------------
-- Table structure for customer_refund_images
-- ----------------------------
DROP TABLE IF EXISTS `customer_refund_images`;
CREATE TABLE `customer_refund_images` (
  `order_id` int(11) NOT NULL,
  `image_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_refund_images
-- ----------------------------

-- ----------------------------
-- Table structure for customer_refund_orders
-- ----------------------------
DROP TABLE IF EXISTS `customer_refund_orders`;
CREATE TABLE `customer_refund_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_amount` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `refund_status` int(11) NOT NULL,
  `refund_reason` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer_refund_orders
-- ----------------------------

-- ----------------------------
-- Table structure for customer_shopping_carts
-- ----------------------------
DROP TABLE IF EXISTS `customer_shopping_carts`;
CREATE TABLE `customer_shopping_carts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(10) unsigned NOT NULL,
  `product_entity_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shop_id` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of customer_shopping_carts
-- ----------------------------

-- ----------------------------
-- Table structure for images
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `file_size` int(11) NOT NULL,
  `used` tinyint(1) NOT NULL DEFAULT '0',
  `common` tinyint(1) NOT NULL DEFAULT '0',
  `use_count` int(11) NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of images
-- ----------------------------
INSERT INTO `images` VALUES ('1', '郭瑜', 'http://lorempixel.com/640/480/technics/', '', 'jpg', '9864', '1', '0', '3435712', '31033', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('3', '崔阳', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '21464886', '0', '0', '91921863', '21', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('4', '廖艳', 'http://lorempixel.com/640/480/fashion/', '', 'jpg', '56925', '0', '0', '4510', '776105', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('5', '白萍', 'http://lorempixel.com/640/480/fashion/', '', 'jpg', '348908', '0', '0', '9', '40272675', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('6', '宋霞', 'http://lorempixel.com/640/480/fashion/', '', 'jpg', '872564', '0', '0', '8606', '239588', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('7', '李洁', 'http://lorempixel.com/640/480/food/', '', 'jpg', '111753', '0', '1', '3449816', '39928', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('8', '韩坤', 'http://lorempixel.com/640/480/city/', '', 'jpg', '99', '0', '0', '15', '285198615', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('10', '熊玉', 'http://lorempixel.com/640/480/business/', '', 'jpg', '827', '0', '0', '140', '60957707', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('11', '马莉', 'http://lorempixel.com/640/480/people/', '', 'jpg', '7830047', '0', '0', '672646', '78139989', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('12', '彭俊', 'http://lorempixel.com/640/480/abstract/', '', 'jpg', '1271321', '0', '0', '6', '96', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('13', '赖桂兰', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '10972770', '0', '0', '39710525', '8284', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('14', '秦桂兰', 'http://lorempixel.com/640/480/cats/', '', 'jpg', '25', '0', '0', '94575', '86287', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('15', '曾丽娟', 'http://lorempixel.com/640/480/technics/', '', 'jpg', '97303639', '0', '0', '149831', '57956399', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('16', '郝桂英', 'http://lorempixel.com/640/480/nature/', '', 'jpg', '7474190', '0', '0', '8', '3', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('17', '林秀芳', 'http://lorempixel.com/640/480/cats/', '', 'jpg', '48', '0', '1', '394948720', '56580', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('18', '姜岩', 'http://lorempixel.com/640/480/food/', '', 'jpg', '94143', '0', '0', '8', '71041701', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('19', '谭军', 'http://lorempixel.com/640/480/business/', '', 'jpg', '383613815', '0', '0', '4905594', '2', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('20', '史红', 'http://lorempixel.com/640/480/transport/', '', 'jpg', '75347', '0', '0', '74740672', '7', '2015-03-04 11:21:07', '2015-03-04 11:21:07');
INSERT INTO `images` VALUES ('21', '武凯', 'http://lorempixel.com/640/480/city/', '', 'jpg', '34597082', '0', '0', '40694870', '13', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('22', '苏涛', 'http://lorempixel.com/640/480/nature/', '', 'jpg', '2', '0', '0', '4', '7417', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('23', '胡淑兰', 'http://lorempixel.com/640/480/fashion/', '', 'jpg', '436', '0', '0', '612253', '461', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('24', '杨宇', 'http://lorempixel.com/640/480/technics/', '', 'jpg', '82', '0', '0', '96', '221', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('25', '徐红梅', 'http://lorempixel.com/640/480/nature/', '', 'jpg', '43', '0', '0', '16471028', '74203', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('26', '尹凤英', 'http://lorempixel.com/640/480/sports/', '', 'jpg', '5514563', '0', '0', '61138013', '76343557', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('27', '卢斌', 'http://lorempixel.com/640/480/business/', '', 'jpg', '6387', '0', '0', '612525228', '612785', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('28', '范荣', 'http://lorempixel.com/640/480/technics/', '', 'jpg', '4320747', '0', '0', '57', '1', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('29', '邹燕', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '9612', '0', '0', '643814100', '6003654', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('30', '黄淑华', 'http://lorempixel.com/640/480/technics/', '', 'jpg', '37899', '0', '0', '42389', '2604214', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('31', '马婷', 'http://lorempixel.com/640/480/transport/', '', 'jpg', '25', '0', '0', '8', '438259285', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('32', '蒋雪', 'http://lorempixel.com/640/480/technics/', '', 'jpg', '76', '0', '0', '771', '41274', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('33', '魏玉', 'http://lorempixel.com/640/480/food/', '', 'jpg', '37855195', '0', '0', '128', '43', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('34', '江强', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '472325', '0', '0', '6200', '44017', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('35', '田洋', 'http://lorempixel.com/640/480/food/', '', 'jpg', '911', '0', '0', '43671238', '27375624', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('36', '段旭', 'http://lorempixel.com/640/480/nightlife/', '', 'jpg', '1855', '0', '0', '393120', '116', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('37', '丁晶', 'http://lorempixel.com/640/480/technics/', '', 'jpg', '150778474', '0', '0', '405428', '65', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('38', '孔玉梅', 'http://lorempixel.com/640/480/food/', '', 'jpg', '126890', '0', '0', '701242', '83', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('39', '冯玉珍', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '6897', '0', '0', '476171', '295131', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('40', '唐红霞', 'http://lorempixel.com/640/480/transport/', '', 'jpg', '328', '0', '0', '285941', '24187774', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('41', '侯荣', 'http://lorempixel.com/640/480/abstract/', '', 'jpg', '4213691', '0', '0', '49', '20277', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('42', '何霞', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '11', '1', '0', '68218', '661961292', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('43', '熊刚', 'http://lorempixel.com/640/480/fashion/', '', 'jpg', '580417', '0', '0', '5702600', '7637', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('44', '陆淑珍', 'http://lorempixel.com/640/480/people/', '', 'jpg', '23293', '0', '0', '40322', '36', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('45', '崔玉英', 'http://lorempixel.com/640/480/people/', '', 'jpg', '3100284', '0', '0', '6050195', '8148612', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('46', '叶春梅', 'http://lorempixel.com/640/480/cats/', '', 'jpg', '8', '0', '0', '5540338', '74725', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('47', '薛琳', 'http://lorempixel.com/640/480/cats/', '', 'jpg', '61316', '0', '0', '739640138', '901156', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('48', '夏博', 'http://lorempixel.com/640/480/abstract/', '', 'jpg', '402620', '0', '0', '29', '156486014', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('49', '薛燕', 'http://lorempixel.com/640/480/nature/', '', 'jpg', '3309', '0', '0', '551972166', '391', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('50', '严瑜', 'http://lorempixel.com/640/480/abstract/', '', 'jpg', '36833', '0', '0', '480', '111628', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('51', '贾兵', 'http://lorempixel.com/640/480/fashion/', '', 'jpg', '99', '0', '0', '2', '44933403', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('52', '董建平', 'http://lorempixel.com/640/480/transport/', '', 'jpg', '66', '0', '0', '418336045', '244567', '2015-03-04 11:21:08', '2015-03-04 11:21:08');
INSERT INTO `images` VALUES ('53', '汪磊', 'http://lorempixel.com/640/480/people/', '', 'jpg', '6', '0', '0', '4', '435301', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('54', '周坤', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '0', '0', '0', '86', '2988', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('55', '汪芳', 'http://lorempixel.com/640/480/people/', '', 'jpg', '7129', '0', '0', '3023115', '73', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('56', '赵敏', 'http://lorempixel.com/640/480/nightlife/', '', 'jpg', '685114', '0', '1', '588', '816871', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('57', '孔旭', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '590', '0', '1', '7713', '224', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('58', '罗俊', 'http://lorempixel.com/640/480/people/', '', 'jpg', '167', '1', '0', '70979', '2834', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('59', '贺伟', 'http://lorempixel.com/640/480/nature/', '', 'jpg', '736650589', '0', '0', '986384979', '0', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('60', '方玉', 'http://lorempixel.com/640/480/people/', '', 'jpg', '480', '0', '0', '15657', '641', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('61', '顾玉珍', 'http://lorempixel.com/640/480/cats/', '', 'jpg', '72104', '0', '0', '73898', '5', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('62', '李丹丹', 'http://lorempixel.com/640/480/technics/', '', 'jpg', '9', '0', '0', '3777985', '267', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('63', '邹宁', 'http://lorempixel.com/640/480/city/', '', 'jpg', '7342', '1', '0', '34264', '9', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('64', '于凯', 'http://lorempixel.com/640/480/nature/', '', 'jpg', '602', '0', '0', '5', '5', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('65', '丁敏', 'http://lorempixel.com/640/480/fashion/', '', 'jpg', '648147779', '0', '0', '39140', '926', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('66', '孙文', 'http://lorempixel.com/640/480/sports/', '', 'jpg', '544', '0', '0', '58816', '19', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('67', '曹淑华', 'http://lorempixel.com/640/480/cats/', '', 'jpg', '35254', '0', '0', '7', '138', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('68', '吴瑜', 'http://lorempixel.com/640/480/technics/', '', 'jpg', '965', '0', '0', '837', '2187', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('69', '姜勇', 'http://lorempixel.com/640/480/people/', '', 'jpg', '93', '0', '0', '8', '990172661', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('70', '阎凤英', 'http://lorempixel.com/640/480/food/', '', 'jpg', '745', '0', '0', '870710', '9', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('71', '余刚', 'http://lorempixel.com/640/480/nightlife/', '', 'jpg', '659', '0', '0', '37068', '423936160', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('72', '阎凤英', 'http://lorempixel.com/640/480/sports/', '', 'jpg', '7', '0', '0', '88418391', '5', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('73', '武强', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '655184606', '0', '1', '468493', '774', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('74', '邵兵', 'http://lorempixel.com/640/480/nightlife/', '', 'jpg', '9850', '1', '0', '53429', '60366777', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('75', '陆欣', 'http://lorempixel.com/640/480/sports/', '', 'jpg', '935164', '0', '0', '13', '959474410', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('76', '杜淑珍', 'http://lorempixel.com/640/480/food/', '', 'jpg', '8', '0', '0', '3642563', '2', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('77', '萧宁', 'http://lorempixel.com/640/480/city/', '', 'jpg', '38633676', '0', '0', '409370', '6', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('78', '万娜', 'http://lorempixel.com/640/480/city/', '', 'jpg', '789782367', '0', '0', '335287314', '1851', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('79', '卢建', 'http://lorempixel.com/640/480/abstract/', '', 'jpg', '93687172', '0', '0', '3620', '463261', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('80', '杜萍', 'http://lorempixel.com/640/480/transport/', '', 'jpg', '722', '0', '0', '38717795', '71234', '2015-03-04 11:21:09', '2015-03-04 11:21:09');
INSERT INTO `images` VALUES ('81', '侯宇', 'http://lorempixel.com/640/480/transport/', '', 'jpg', '2', '0', '0', '9181011', '99', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('82', '梁桂珍', 'http://lorempixel.com/640/480/people/', '', 'jpg', '0', '0', '0', '2', '60036', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('83', '洪楠', 'http://lorempixel.com/640/480/food/', '', 'jpg', '648001520', '0', '0', '450599622', '8581', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('84', '贺斌', 'http://lorempixel.com/640/480/fashion/', '', 'jpg', '5589', '0', '0', '699473774', '10', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('85', '叶桂花', 'http://lorempixel.com/640/480/nature/', '', 'jpg', '39', '0', '0', '15654', '207073', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('86', '黎红梅', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '5887', '0', '0', '670954', '854723251', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('87', '潘芳', 'http://lorempixel.com/640/480/transport/', '', 'jpg', '75677158', '0', '0', '350', '9', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('88', '贺成', 'http://lorempixel.com/640/480/animals/', '', 'jpg', '3', '0', '0', '8725719', '2', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('89', '阎坤', 'http://lorempixel.com/640/480/nightlife/', '', 'jpg', '5785590', '0', '0', '385481', '2', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('90', '韩萍', 'http://lorempixel.com/640/480/food/', '', 'jpg', '68', '0', '0', '89572', '91070876', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('91', '方平', 'http://lorempixel.com/640/480/business/', '', 'jpg', '190372', '0', '0', '306328401', '839970', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('92', '钱玉珍', 'http://lorempixel.com/640/480/people/', '', 'jpg', '8', '0', '0', '0', '6292512', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('93', '朱佳', 'http://lorempixel.com/640/480/business/', '', 'jpg', '0', '0', '0', '17', '6559977', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('94', '韩红霞', 'http://lorempixel.com/640/480/business/', '', 'jpg', '66', '0', '0', '87', '93889404', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('95', '龚海燕', 'http://lorempixel.com/640/480/business/', '', 'jpg', '94', '0', '1', '7', '49', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('96', '邱梅', 'http://lorempixel.com/640/480/people/', '', 'jpg', '519629', '0', '0', '6805828', '30', '2015-03-04 11:21:10', '2015-03-04 11:21:10');
INSERT INTO `images` VALUES ('97', '', 'uploads/2015-03-04/famZOEOdTz.jpg', '', 'jpg', '113122', '0', '0', '0', '0', '2015-03-04 12:01:44', '2015-03-04 12:01:44');
INSERT INTO `images` VALUES ('98', '', '/uploads/2015-03-04/TqjfGcGs6f.jpg', '', 'jpg', '148270', '0', '0', '0', '0', '2015-03-04 12:09:20', '2015-03-04 12:09:20');
INSERT INTO `images` VALUES ('100', '1425464598.png', '/uploads/Shops/1425464598.png', '/var/www/youlishi/wap/public/uploads/Shops/1425464598.png', '', '44230', '0', '0', '0', '0', '2015-03-04 18:23:18', '2015-03-04 18:23:18');
INSERT INTO `images` VALUES ('103', '1425519422.jpg', '/uploads/IDCards/1425519422.jpg', '/var/www/youlishi/wap/public/uploads/IDCards/1425519422.jpg', '', '13847', '0', '0', '0', '0', '2015-03-05 09:37:02', '2015-03-05 09:37:02');
INSERT INTO `images` VALUES ('104', '1425519426.jpg', '/uploads/IDCards/1425519426.jpg', '/var/www/youlishi/wap/public/uploads/IDCards/1425519426.jpg', '', '75953', '0', '0', '0', '0', '2015-03-05 09:37:06', '2015-03-05 09:37:06');
INSERT INTO `images` VALUES ('106', '', '/uploads/2015-03-05/PpXU9eA2G7.png', '', 'png', '17613', '0', '0', '0', '0', '2015-03-05 10:53:34', '2015-03-05 10:53:34');
INSERT INTO `images` VALUES ('107', '', '/uploads/2015-03-05/r3I3FSd8XB.png', '', 'png', '44209', '0', '0', '0', '0', '2015-03-05 10:53:40', '2015-03-05 10:53:40');
INSERT INTO `images` VALUES ('108', '', '/uploads/2015-03-05/t6NcUQgJQf.jpg', '', 'jpg', '148270', '0', '0', '0', '0', '2015-03-05 10:53:46', '2015-03-05 10:53:46');
INSERT INTO `images` VALUES ('109', '', '/uploads/2015-03-05/2kCeA1425524875.jpg', '', 'jpg', '148270', '0', '0', '0', '0', '2015-03-05 11:07:55', '2015-03-05 11:07:55');
INSERT INTO `images` VALUES ('110', '', '/uploads/2015-03-05/VczyN1425525017.jpg', '', 'jpg', '113122', '0', '0', '0', '0', '2015-03-05 11:10:18', '2015-03-05 11:10:18');
INSERT INTO `images` VALUES ('111', '', '/uploads/2015-03-05/xHW6f1425526011.jpg', '', 'jpg', '148270', '0', '0', '0', '0', '2015-03-05 11:26:52', '2015-03-05 11:26:52');
INSERT INTO `images` VALUES ('112', '', '/uploads/2015-03-05/5Qbwr1425526015.jpg', '', 'jpg', '113122', '0', '0', '0', '0', '2015-03-05 11:26:55', '2015-03-05 11:26:55');
INSERT INTO `images` VALUES ('113', '', '/uploads/2015-03-05/alyb41425526023.png', '', 'png', '841237', '0', '0', '0', '0', '2015-03-05 11:27:03', '2015-03-05 11:27:03');
INSERT INTO `images` VALUES ('114', '', '/uploads/2015-03-05/khavM1425536425.png', '', 'png', '44230', '0', '0', '0', '0', '2015-03-05 14:20:26', '2015-03-05 14:20:26');
INSERT INTO `images` VALUES ('115', '1425540747.jpg', '/uploads/Shops/1425540747.jpg', '/var/www/youlishi/wap/public/uploads/Shops/1425540747.jpg', '', '75953', '0', '0', '0', '0', '2015-03-05 15:32:27', '2015-03-05 15:32:27');
INSERT INTO `images` VALUES ('116', '1425625160.jpg', '/uploads/Shops/1425625160.jpg', '/var/www/youlishi/wap/public/uploads/Shops/1425625160.jpg', '', '113122', '0', '0', '0', '0', '2015-03-06 14:59:20', '2015-03-06 14:59:20');
INSERT INTO `images` VALUES ('117', '1425625221.jpg', '/uploads/Shops/1425625221.jpg', '/var/www/youlishi/wap/public/uploads/Shops/1425625221.jpg', '', '12415', '0', '0', '0', '0', '2015-03-06 15:00:21', '2015-03-06 15:00:21');
INSERT INTO `images` VALUES ('118', '1425696279.png', '/uploads/Category/1425696279.png', '/var/www/youlishi/backend/public/uploads/Category/1425696279.png', '', '44230', '0', '0', '0', '0', '2015-03-07 10:44:39', '2015-03-07 10:44:39');
INSERT INTO `images` VALUES ('119', '1425696327.png', '/uploads/Category/1425696327.png', '/var/www/youlishi/backend/public/uploads/Category/1425696327.png', '', '44230', '0', '0', '0', '0', '2015-03-07 10:45:28', '2015-03-07 10:45:28');
INSERT INTO `images` VALUES ('120', '1425697195.png', '/uploads/Category/1425697195.png', '/var/www/youlishi/backend/public/uploads/Category/1425697195.png', '', '44230', '0', '0', '0', '0', '2015-03-07 10:59:55', '2015-03-07 10:59:55');
INSERT INTO `images` VALUES ('121', '1425697226.png', '/uploads/Category/1425697226.png', '/var/www/youlishi/backend/public/uploads/Category/1425697226.png', '', '44230', '0', '0', '0', '0', '2015-03-07 11:00:26', '2015-03-07 11:00:26');
INSERT INTO `images` VALUES ('122', '1425697522.jpg', '/uploads/Category/1425697522.jpg', '/var/www/youlishi/backend/public/uploads/Category/1425697522.jpg', '', '12415', '0', '0', '0', '0', '2015-03-07 11:05:22', '2015-03-07 11:05:22');
INSERT INTO `images` VALUES ('123', '1425697613.png', '/uploads/Category/1425697613.png', '/var/www/youlishi/backend/public/uploads/Category/1425697613.png', '', '44230', '0', '0', '0', '0', '2015-03-07 11:06:53', '2015-03-07 11:06:53');
INSERT INTO `images` VALUES ('124', '1425697651.png', '/uploads/Category/1425697651.png', '/var/www/youlishi/backend/public/uploads/Category/1425697651.png', '', '841237', '0', '0', '0', '0', '2015-03-07 11:07:32', '2015-03-07 11:07:32');
INSERT INTO `images` VALUES ('125', '1425697668.jpg', '/uploads/Category/1425697668.jpg', '/var/www/youlishi/backend/public/uploads/Category/1425697668.jpg', '', '12415', '0', '0', '0', '0', '2015-03-07 11:07:48', '2015-03-07 11:07:48');
INSERT INTO `images` VALUES ('126', '1425700058.jpg', '/uploads/Category/1425700058.jpg', '/var/www/youlishi/backend/public/uploads/Category/1425700058.jpg', '', '12415', '0', '0', '0', '0', '2015-03-07 11:47:38', '2015-03-07 11:47:38');
INSERT INTO `images` VALUES ('127', '1425700268.png', '/uploads/Category/1425700268.png', '/var/www/youlishi/backend/public/uploads/Category/1425700268.png', '', '44230', '0', '0', '0', '0', '2015-03-07 11:51:09', '2015-03-07 11:51:09');
INSERT INTO `images` VALUES ('128', '1425700591.jpg', '/uploads/Category/1425700591.jpg', '/var/www/youlishi/backend/public/uploads/Category/1425700591.jpg', '', '12415', '0', '0', '0', '0', '2015-03-07 11:56:31', '2015-03-07 11:56:31');
INSERT INTO `images` VALUES ('129', '1425700599.png', '/uploads/Category/1425700599.png', '/var/www/youlishi/backend/public/uploads/Category/1425700599.png', '', '44230', '0', '0', '0', '0', '2015-03-07 11:56:39', '2015-03-07 11:56:39');
INSERT INTO `images` VALUES ('130', '1425701266.jpg', '/uploads/Category/1425701266.jpg', '/var/www/youlishi/backend/public/uploads/Category/1425701266.jpg', '', '113584', '0', '0', '0', '0', '2015-03-07 12:07:46', '2015-03-07 12:07:46');
INSERT INTO `images` VALUES ('131', '1425701321.jpg', '/uploads/Category/1425701321.jpg', '/var/www/youlishi/backend/public/uploads/Category/1425701321.jpg', '', '37437', '0', '0', '0', '0', '2015-03-07 12:08:41', '2015-03-07 12:08:41');
INSERT INTO `images` VALUES ('133', '1425889615.jpg', '/uploads/Customers/1425889615.jpg', '/var/www/youlishi/wap/public/uploads/Customers/1425889615.jpg', '', '113584', '0', '0', '0', '0', '2015-03-09 16:26:55', '2015-03-09 16:26:55');
INSERT INTO `images` VALUES ('134', '1425896150.jpg', '/uploads/Shops/1425896150.jpg', '/var/www/youlishi/wap/public/uploads/Shops/1425896150.jpg', '', '97323', '0', '0', '0', '0', '2015-03-09 18:15:50', '2015-03-09 18:15:50');
INSERT INTO `images` VALUES ('135', '1425896155.jpg', '/uploads/Shops/1425896155.jpg', '/var/www/youlishi/wap/public/uploads/Shops/1425896155.jpg', '', '97323', '0', '0', '0', '0', '2015-03-09 18:15:55', '2015-03-09 18:15:55');
INSERT INTO `images` VALUES ('142', '', '/uploads/2015-03-10/peCxj1425978154.jpg', '', 'jpg', '97323', '0', '0', '0', '0', '2015-03-10 17:02:34', '2015-03-10 17:02:34');
INSERT INTO `images` VALUES ('143', '', '/uploads/2015-03-10/loMgh1425978166.jpg', '', 'jpg', '343390', '0', '0', '0', '0', '2015-03-10 17:02:46', '2015-03-10 17:02:46');
INSERT INTO `images` VALUES ('144', '', '/uploads/2015-03-10/KPN2v1425978240.jpg', '', 'jpg', '97323', '0', '0', '0', '0', '2015-03-10 17:04:00', '2015-03-10 17:04:00');
INSERT INTO `images` VALUES ('145', '', '/uploads/2015-03-10/lIWbn1425978244.jpg', '', 'jpg', '343390', '0', '0', '0', '0', '2015-03-10 17:04:04', '2015-03-10 17:04:04');
INSERT INTO `images` VALUES ('146', '', '/uploads/2015-03-10/KBRfT1425984240.jpg', '', 'jpg', '556464', '0', '0', '0', '0', '2015-03-10 18:44:00', '2015-03-10 18:44:00');
INSERT INTO `images` VALUES ('147', '', '/uploads/2015-03-10/RSin11425999357.png', '', 'png', '600898', '0', '0', '0', '0', '2015-03-10 22:55:57', '2015-03-10 22:55:57');
INSERT INTO `images` VALUES ('148', '', '/uploads/2015-03-11/9BfuX1426040013.jpg', '', 'jpg', '97323', '0', '0', '0', '0', '2015-03-11 10:13:33', '2015-03-11 10:13:33');
INSERT INTO `images` VALUES ('149', '', '/uploads/2015-03-11/1bXj71426040022.jpg', '', 'jpg', '343390', '0', '0', '0', '0', '2015-03-11 10:13:43', '2015-03-11 10:13:43');
INSERT INTO `images` VALUES ('150', '', '/uploads/2015-03-11/x8h5f1426040030.jpg', '', 'jpg', '343390', '0', '0', '0', '0', '2015-03-11 10:13:50', '2015-03-11 10:13:50');
INSERT INTO `images` VALUES ('151', '', '/uploads/2015-03-11/FOKGo1426040112.jpg', '', 'jpg', '273055', '0', '0', '0', '0', '2015-03-11 10:15:13', '2015-03-11 10:15:13');
INSERT INTO `images` VALUES ('152', '', '/uploads/2015-03-11/2XK5F1426040553.jpg', '', 'jpg', '97323', '0', '0', '0', '0', '2015-03-11 10:22:33', '2015-03-11 10:22:33');
INSERT INTO `images` VALUES ('158', '', '/uploads/2015-03-11/4D7ZQ1426043682.jpg', '', 'jpg', '113584', '0', '0', '0', '0', '2015-03-11 11:14:42', '2015-03-11 11:14:42');
INSERT INTO `images` VALUES ('164', '1426045409.jpg', '/uploads/Merchants/1426045409.jpg', '/var/www/youlishi/public/uploads/Merchants/1426045409.jpg', 'jpg', '113584', '0', '0', '0', '0', '2015-03-11 11:43:29', '2015-03-11 11:43:29');
INSERT INTO `images` VALUES ('165', '1426053207.jpg', '/uploads/Category/1426053207.jpg', '/var/www/youlishi/public/uploads/Category/1426053207.jpg', 'jpg', '8759', '0', '0', '0', '0', '2015-03-11 13:53:27', '2015-03-11 13:53:27');
INSERT INTO `images` VALUES ('166', '1426053214.jpg', '/uploads/Category/1426053214.jpg', '/var/www/youlishi/public/uploads/Category/1426053214.jpg', 'jpg', '6384', '0', '0', '0', '0', '2015-03-11 13:53:34', '2015-03-11 13:53:34');
INSERT INTO `images` VALUES ('167', '1426053267.jpg', '/uploads/Category/1426053267.jpg', '/var/www/youlishi/public/uploads/Category/1426053267.jpg', 'jpg', '5507', '0', '0', '0', '0', '2015-03-11 13:54:27', '2015-03-11 13:54:27');
INSERT INTO `images` VALUES ('168', '1426053281.jpg', '/uploads/Category/1426053281.jpg', '/var/www/youlishi/public/uploads/Category/1426053281.jpg', 'jpg', '7287', '0', '0', '0', '0', '2015-03-11 13:54:41', '2015-03-11 13:54:41');
INSERT INTO `images` VALUES ('169', '', '/uploads/2015-03-11/ML2aa1426053449.jpg', '', 'jpg', '109872', '0', '0', '0', '0', '2015-03-11 13:57:29', '2015-03-11 13:57:29');
INSERT INTO `images` VALUES ('170', '', '/uploads/2015-03-11/OcvEx1426053453.jpg', '', 'jpg', '29448', '0', '0', '0', '0', '2015-03-11 13:57:33', '2015-03-11 13:57:33');
INSERT INTO `images` VALUES ('171', '', '/uploads/2015-03-11/bjKHV1426053457.jpg', '', 'jpg', '22471', '0', '0', '0', '0', '2015-03-11 13:57:37', '2015-03-11 13:57:37');
INSERT INTO `images` VALUES ('172', '', '/uploads/2015-03-11/na8KR1426053478.jpg', '', 'jpg', '38709', '0', '0', '0', '0', '2015-03-11 13:57:58', '2015-03-11 13:57:58');
INSERT INTO `images` VALUES ('173', '', '/uploads/2015-03-11/oSGzT1426053738.jpg', '', 'jpg', '29448', '0', '0', '0', '0', '2015-03-11 14:02:18', '2015-03-11 14:02:18');
INSERT INTO `images` VALUES ('174', '', '/uploads/2015-03-11/7pzcB1426053743.jpg', '', 'jpg', '50142', '0', '0', '0', '0', '2015-03-11 14:02:23', '2015-03-11 14:02:23');
INSERT INTO `images` VALUES ('175', '', '/uploads/2015-03-11/PrCVV1426053747.jpg', '', 'jpg', '22471', '0', '0', '0', '0', '2015-03-11 14:02:27', '2015-03-11 14:02:27');
INSERT INTO `images` VALUES ('176', '', '/uploads/2015-03-11/haISc1426053751.jpg', '', 'jpg', '33832', '0', '0', '0', '0', '2015-03-11 14:02:31', '2015-03-11 14:02:31');
INSERT INTO `images` VALUES ('177', '', '/uploads/2015-03-11/BWwNA1426053801.jpg', '', 'jpg', '29448', '0', '0', '0', '0', '2015-03-11 14:03:21', '2015-03-11 14:03:21');
INSERT INTO `images` VALUES ('178', '', '/uploads/2015-03-11/RLgm71426053803.jpg', '', 'jpg', '50142', '0', '0', '0', '0', '2015-03-11 14:03:23', '2015-03-11 14:03:23');
INSERT INTO `images` VALUES ('179', '', '/uploads/2015-03-11/XRsJ21426053806.jpg', '', 'jpg', '22471', '0', '0', '0', '0', '2015-03-11 14:03:26', '2015-03-11 14:03:26');
INSERT INTO `images` VALUES ('180', '', '/uploads/2015-03-11/CUPZ91426053809.jpg', '', 'jpg', '36684', '0', '0', '0', '0', '2015-03-11 14:03:29', '2015-03-11 14:03:29');
INSERT INTO `images` VALUES ('181', '', '/uploads/2015-03-11/YCZwl1426053883.jpg', '', 'jpg', '37437', '0', '0', '0', '0', '2015-03-11 14:04:43', '2015-03-11 14:04:43');
INSERT INTO `images` VALUES ('182', '', '/uploads/2015-03-11/ycf9U1426054554.jpg', '', 'jpg', '113584', '0', '0', '0', '0', '2015-03-11 14:15:54', '2015-03-11 14:15:54');
INSERT INTO `images` VALUES ('183', '', '/uploads/2015-03-11/n1hFR1426054663.jpg', '', 'jpg', '29448', '0', '0', '0', '0', '2015-03-11 14:17:43', '2015-03-11 14:17:43');
INSERT INTO `images` VALUES ('184', '', '/uploads/2015-03-11/9y7Db1426054666.jpg', '', 'jpg', '50142', '0', '0', '0', '0', '2015-03-11 14:17:47', '2015-03-11 14:17:47');
INSERT INTO `images` VALUES ('185', '', '/uploads/2015-03-11/3Eap11426054670.jpg', '', 'jpg', '22471', '0', '0', '0', '0', '2015-03-11 14:17:50', '2015-03-11 14:17:50');
INSERT INTO `images` VALUES ('186', '', '/uploads/2015-03-11/4LEO91426054673.jpg', '', 'jpg', '36684', '0', '0', '0', '0', '2015-03-11 14:17:53', '2015-03-11 14:17:53');
INSERT INTO `images` VALUES ('187', '', '/uploads/2015-03-11/fuOmA1426054908.jpg', '', 'jpg', '38709', '0', '0', '0', '0', '2015-03-11 14:21:48', '2015-03-11 14:21:48');
INSERT INTO `images` VALUES ('188', '', '/uploads/2015-03-11/8EzB01426054913.jpg', '', 'jpg', '60497', '0', '0', '0', '0', '2015-03-11 14:21:53', '2015-03-11 14:21:53');
INSERT INTO `images` VALUES ('189', '', '/uploads/2015-03-11/6wbwe1426054915.jpg', '', 'jpg', '33832', '0', '0', '0', '0', '2015-03-11 14:21:55', '2015-03-11 14:21:55');
INSERT INTO `images` VALUES ('190', '', '/uploads/2015-03-11/iVRt01426054927.jpg', '', 'jpg', '29448', '0', '0', '0', '0', '2015-03-11 14:22:07', '2015-03-11 14:22:07');
INSERT INTO `images` VALUES ('196', '1426056372.jpg', '/uploads/Shops/1426056372.jpg', '/var/www/youlishi/public/uploads/Shops/1426056372.jpg', 'jpg', '16383', '0', '0', '0', '0', '2015-03-11 14:46:12', '2015-03-11 14:46:12');
INSERT INTO `images` VALUES ('197', '1426056385.jpeg', '/uploads/Shops/1426056385.jpeg', '/var/www/youlishi/public/uploads/Shops/1426056385.jpeg', 'jpeg', '45154', '0', '0', '0', '0', '2015-03-11 14:46:25', '2015-03-11 14:46:25');
INSERT INTO `images` VALUES ('198', '1426056421.jpg', '/uploads/Shops/1426056421.jpg', '/var/www/youlishi/public/uploads/Shops/1426056421.jpg', 'jpg', '97323', '0', '0', '0', '0', '2015-03-11 14:47:01', '2015-03-11 14:47:01');
INSERT INTO `images` VALUES ('199', '1426057221.jpg', '/uploads/Banners/1426057221.jpg', '/var/www/youlishi/public/uploads/Banners/1426057221.jpg', 'jpg', '83154', '0', '0', '0', '0', '2015-03-11 15:00:21', '2015-03-11 15:00:21');
INSERT INTO `images` VALUES ('200', '1426057547.jpg', '/uploads/Customers/1426057547.jpg', '/var/www/youlishi/public/uploads/Customers/1426057547.jpg', 'jpg', '137984', '0', '0', '0', '0', '2015-03-11 15:05:47', '2015-03-11 15:05:47');
INSERT INTO `images` VALUES ('201', '', '/uploads/2015-03-11/3pGsf1426058785.jpg', '', 'jpg', '46860', '0', '0', '0', '0', '2015-03-11 15:26:26', '2015-03-11 15:26:26');
INSERT INTO `images` VALUES ('202', '', '/uploads/2015-03-11/qTlMc1426058788.jpg', '', 'jpg', '22471', '0', '0', '0', '0', '2015-03-11 15:26:28', '2015-03-11 15:26:28');
INSERT INTO `images` VALUES ('203', '', '/uploads/2015-03-11/8vI7K1426058792.jpg', '', 'jpg', '50142', '0', '0', '0', '0', '2015-03-11 15:26:32', '2015-03-11 15:26:32');
INSERT INTO `images` VALUES ('204', '', '/uploads/2015-03-11/AFEYG1426058795.jpg', '', 'jpg', '33832', '0', '0', '0', '0', '2015-03-11 15:26:35', '2015-03-11 15:26:35');
INSERT INTO `images` VALUES ('205', '', '/uploads/2015-03-11/cpmDz1426058797.jpg', '', 'jpg', '38709', '0', '0', '0', '0', '2015-03-11 15:26:38', '2015-03-11 15:26:38');
INSERT INTO `images` VALUES ('206', '', '/uploads/2015-03-11/hSR4Z1426058895.jpg', '', 'jpg', '33832', '0', '0', '0', '0', '2015-03-11 15:28:15', '2015-03-11 15:28:15');
INSERT INTO `images` VALUES ('207', '', '/uploads/2015-03-11/aFmm91426058899.jpg', '', 'jpg', '29448', '0', '0', '0', '0', '2015-03-11 15:28:19', '2015-03-11 15:28:19');
INSERT INTO `images` VALUES ('208', '', '/uploads/2015-03-11/SxkH51426058903.jpg', '', 'jpg', '50142', '0', '0', '0', '0', '2015-03-11 15:28:23', '2015-03-11 15:28:23');
INSERT INTO `images` VALUES ('209', '', '/uploads/2015-03-11/NEi0f1426058906.jpg', '', 'jpg', '22471', '0', '0', '0', '0', '2015-03-11 15:28:26', '2015-03-11 15:28:26');
INSERT INTO `images` VALUES ('210', '', '/uploads/2015-03-11/jGCO81426058909.jpg', '', 'jpg', '46860', '0', '0', '0', '0', '2015-03-11 15:28:29', '2015-03-11 15:28:29');
INSERT INTO `images` VALUES ('211', '1426154796.jpg', '/uploads/Shops/1426154796.jpg', '/var/www/youlishi/public/uploads/Shops/1426154796.jpg', 'jpg', '29448', '0', '0', '0', '0', '2015-03-12 18:06:36', '2015-03-12 18:06:36');
INSERT INTO `images` VALUES ('212', '1426154823.jpg', '/uploads/Shops/1426154823.jpg', '/var/www/youlishi/public/uploads/Shops/1426154823.jpg', 'jpg', '50142', '0', '0', '0', '0', '2015-03-12 18:07:03', '2015-03-12 18:07:03');
INSERT INTO `images` VALUES ('213', '1426154868.jpg', '/uploads/Shops/1426154868.jpg', '/var/www/youlishi/public/uploads/Shops/1426154868.jpg', 'jpg', '109872', '0', '0', '0', '0', '2015-03-12 18:07:48', '2015-03-12 18:07:48');
INSERT INTO `images` VALUES ('215', '1426229001.jpg', '/uploads/Shops/1426229001.jpg', '/var/www/youlishi/public/uploads/Shops/1426229001.jpg', 'jpg', '89944', '0', '0', '0', '0', '2015-03-13 14:43:21', '2015-03-13 14:43:21');
INSERT INTO `images` VALUES ('216', '1426229032.jpg', '/uploads/Shops/1426229032.jpg', '/var/www/youlishi/public/uploads/Shops/1426229032.jpg', 'jpg', '89944', '0', '0', '0', '0', '2015-03-13 14:43:52', '2015-03-13 14:43:52');
INSERT INTO `images` VALUES ('217', '1426232173.jpg', '/uploads/IDCards/1426232173.jpg', '/var/www/youlishi/public/uploads/IDCards/1426232173.jpg', 'jpg', '113584', '0', '0', '0', '0', '2015-03-13 15:36:13', '2015-03-13 15:36:13');
INSERT INTO `images` VALUES ('218', '1426232176.jpg', '/uploads/IDCards/1426232176.jpg', '/var/www/youlishi/public/uploads/IDCards/1426232176.jpg', 'jpg', '37437', '0', '0', '0', '0', '2015-03-13 15:36:16', '2015-03-13 15:36:16');
INSERT INTO `images` VALUES ('219', '1426232977.jpg', '/uploads/Merchants/1426232977.jpg', '/var/www/youlishi/public/uploads/Merchants/1426232977.jpg', 'jpg', '104432', '0', '0', '0', '0', '2015-03-13 15:49:37', '2015-03-13 15:49:37');
INSERT INTO `images` VALUES ('225', '1426562281.jpg', '/uploads/Customers/1426562281.jpg', '/var/www/youlishi/public/uploads/Customers/1426562281.jpg', 'jpg', '439987', '0', '0', '0', '0', '2015-03-17 11:18:01', '2015-03-17 11:18:01');
INSERT INTO `images` VALUES ('226', '1426644429.jpg', '/uploads/Merchants/1426644429.jpg', '/var/www/youlishi/public/uploads/Merchants/1426644429.jpg', 'jpg', '8242', '0', '0', '0', '0', '2015-03-18 10:07:09', '2015-03-18 10:07:09');
INSERT INTO `images` VALUES ('227', '', '/uploads/2015-03-19/GXQKF1426730942.jpg', '', 'jpg', '401877', '0', '0', '0', '0', '2015-03-19 10:09:02', '2015-03-19 10:09:02');
INSERT INTO `images` VALUES ('228', '', '/uploads/2015-03-19/ZsK571426730993.jpg', '', 'jpg', '34277', '0', '0', '0', '0', '2015-03-19 10:09:53', '2015-03-19 10:09:53');
INSERT INTO `images` VALUES ('229', '', '/uploads/2015-03-19/Ep41C1426731012.jpg', '', 'jpg', '51153', '0', '0', '0', '0', '2015-03-19 10:10:13', '2015-03-19 10:10:13');
INSERT INTO `images` VALUES ('230', '', '/uploads/2015-03-19/O7HXq1426731027.jpg', '', 'jpg', '32249', '0', '0', '0', '0', '2015-03-19 10:10:27', '2015-03-19 10:10:27');
INSERT INTO `images` VALUES ('231', '', '/uploads/2015-03-19/eMH3p1426731052.jpg', '', 'jpg', '19341', '0', '0', '0', '0', '2015-03-19 10:10:52', '2015-03-19 10:10:52');
INSERT INTO `images` VALUES ('234', '1426746872.jpg', '/uploads/Shops/1426746872.jpg', '/var/www/youlishi/public/uploads/Shops/1426746872.jpg', 'jpg', '75953', '0', '0', '0', '0', '2015-03-19 14:34:32', '2015-03-19 14:34:32');
INSERT INTO `images` VALUES ('235', '1426746903.jpg', '/uploads/Shops/1426746903.jpg', '/var/www/youlishi/public/uploads/Shops/1426746903.jpg', 'jpg', '12415', '0', '0', '0', '0', '2015-03-19 14:35:03', '2015-03-19 14:35:03');
INSERT INTO `images` VALUES ('236', '1426747199.jpeg', '/uploads/Shops/1426747199.jpeg', '/var/www/youlishi/public/uploads/Shops/1426747199.jpeg', 'jpeg', '54190', '0', '0', '0', '0', '2015-03-19 14:40:00', '2015-03-19 14:40:00');
INSERT INTO `images` VALUES ('237', '1426830414.jpg', '/uploads/Banners/1426830414.jpg', '/var/www/youlishi/public/uploads/Banners/1426830414.jpg', 'jpg', '17739', '0', '0', '0', '0', '2015-03-20 13:46:54', '2015-03-20 13:46:54');
INSERT INTO `images` VALUES ('240', '1426830525.jpg', '/uploads/Banners/1426830525.jpg', '/var/www/youlishi/public/uploads/Banners/1426830525.jpg', 'jpg', '15798', '0', '0', '0', '0', '2015-03-20 13:48:45', '2015-03-20 13:48:45');
INSERT INTO `images` VALUES ('241', '1426830614.jpg', '/uploads/Banners/1426830614.jpg', '/var/www/youlishi/public/uploads/Banners/1426830614.jpg', 'jpg', '22478', '0', '0', '0', '0', '2015-03-20 13:50:14', '2015-03-20 13:50:14');
INSERT INTO `images` VALUES ('242', '1426830667.jpg', '/uploads/Banners/1426830667.jpg', '/var/www/youlishi/public/uploads/Banners/1426830667.jpg', 'jpg', '16721', '0', '0', '0', '0', '2015-03-20 13:51:07', '2015-03-20 13:51:07');
INSERT INTO `images` VALUES ('243', '1426830687.jpg', '/uploads/Banners/1426830687.jpg', '/var/www/youlishi/public/uploads/Banners/1426830687.jpg', 'jpg', '13429', '0', '0', '0', '0', '2015-03-20 13:51:27', '2015-03-20 13:51:27');
INSERT INTO `images` VALUES ('244', '', '/uploads/2015-03-20/TR4lM1426831551.jpg', '', 'jpg', '43985', '0', '0', '0', '0', '2015-03-20 14:05:51', '2015-03-20 14:05:51');
INSERT INTO `images` VALUES ('245', '', 'http://120.24.164.194:8089/uploads/2015-03-20/oOsd81426833967.jpg', '', 'jpg', '113584', '0', '0', '0', '0', '2015-03-20 14:46:08', '2015-03-20 14:46:08');
INSERT INTO `images` VALUES ('246', '', 'http://120.24.164.194:8089/uploads/2015-03-20/kvdQK1426834049.jpg', '', 'jpg', '75953', '0', '0', '0', '0', '2015-03-20 14:47:29', '2015-03-20 14:47:29');
INSERT INTO `images` VALUES ('247', '', '/uploads/2015-03-20/4Pwp91426834061.jpg', '', 'jpg', '113584', '0', '0', '0', '0', '2015-03-20 14:47:41', '2015-03-20 14:47:41');
INSERT INTO `images` VALUES ('248', '', '/uploads/2015-03-20/rM6FN1426834989.jpg', '', 'jpg', '43985', '0', '0', '0', '0', '2015-03-20 15:03:09', '2015-03-20 15:03:09');
INSERT INTO `images` VALUES ('249', '', 'http://120.24.164.194:8089/uploads/2015-03-20/MEvH21426835026.jpg', '', 'jpg', '679725', '0', '0', '0', '0', '2015-03-20 15:03:46', '2015-03-20 15:03:46');
INSERT INTO `images` VALUES ('250', '', '/uploads/2015-03-23/IVX3J1427077096.jpg', '', 'jpg', '19791', '0', '0', '0', '0', '2015-03-23 10:18:16', '2015-03-23 10:18:16');
INSERT INTO `images` VALUES ('251', '', '/uploads/2015-03-23/XUZfQ1427077140.jpg', '', 'jpg', '43636', '0', '0', '0', '0', '2015-03-23 10:19:00', '2015-03-23 10:19:00');
INSERT INTO `images` VALUES ('252', '', 'http://120.24.164.194:8089/uploads/2015-03-23/uCjsA1427077182.jpg', '', 'jpg', '807098', '0', '0', '0', '0', '2015-03-23 10:19:43', '2015-03-23 10:19:43');
INSERT INTO `images` VALUES ('253', '', '/uploads/2015-03-23/ykNEb1427077714.jpg', '', 'jpg', '44250', '0', '0', '0', '0', '2015-03-23 10:28:35', '2015-03-23 10:28:35');
INSERT INTO `images` VALUES ('254', '', 'http://120.24.164.194:8089/uploads/2015-03-23/8qqG91427077847.jpg', '', 'jpg', '1032242', '0', '0', '0', '0', '2015-03-23 10:30:48', '2015-03-23 10:30:48');
INSERT INTO `images` VALUES ('255', '', '/uploads/2015-03-23/supqP1427080104.jpg', '', 'jpg', '44250', '0', '0', '0', '0', '2015-03-23 11:08:24', '2015-03-23 11:08:24');
INSERT INTO `images` VALUES ('256', '', '/uploads/2015-03-23/WYNPz1427080104.jpg', '', 'jpg', '44250', '0', '0', '0', '0', '2015-03-23 11:08:24', '2015-03-23 11:08:24');
INSERT INTO `images` VALUES ('257', '', '/uploads/2015-03-23/4q0Vj1427080105.jpg', '', 'jpg', '44250', '0', '0', '0', '0', '2015-03-23 11:08:25', '2015-03-23 11:08:25');
INSERT INTO `images` VALUES ('258', '', '/uploads/2015-03-23/JcUct1427080121.jpg', '', 'jpg', '44250', '0', '0', '0', '0', '2015-03-23 11:08:41', '2015-03-23 11:08:41');
INSERT INTO `images` VALUES ('259', '', '/uploads/2015-03-23/KOo5n1427080201.jpg', '', 'jpg', '45650', '0', '0', '0', '0', '2015-03-23 11:10:01', '2015-03-23 11:10:01');
INSERT INTO `images` VALUES ('260', '', 'http://120.24.164.194:8089/uploads/2015-03-23/1HY7X1427080251.jpg', '', 'jpg', '668972', '0', '0', '0', '0', '2015-03-23 11:10:52', '2015-03-23 11:10:52');
INSERT INTO `images` VALUES ('261', '', '/uploads/2015-03-23/3r4mu1427080327.jpg', '', 'jpg', '45650', '0', '0', '0', '0', '2015-03-23 11:12:07', '2015-03-23 11:12:07');
INSERT INTO `images` VALUES ('262', '', '/uploads/2015-03-23/6bQD51427080371.jpg', '', 'jpg', '668972', '0', '0', '0', '0', '2015-03-23 11:12:52', '2015-03-23 11:12:52');
INSERT INTO `images` VALUES ('263', '', '/uploads/2015-03-23/bI9CL1427080377.jpg', '', 'jpg', '45650', '0', '0', '0', '0', '2015-03-23 11:12:57', '2015-03-23 11:12:57');
INSERT INTO `images` VALUES ('264', '', '/uploads/2015-03-23/wxmko1427080552.jpg', '', 'jpg', '45650', '0', '0', '0', '0', '2015-03-23 11:15:52', '2015-03-23 11:15:52');
INSERT INTO `images` VALUES ('265', '', 'http://120.24.164.194:8089/uploads/2015-03-23/48U2D1427080588.jpg', '', 'jpg', '668972', '0', '0', '0', '0', '2015-03-23 11:16:29', '2015-03-23 11:16:29');
INSERT INTO `images` VALUES ('266', '', '/uploads/2015-03-23/5vqsU1427080722.jpg', '', 'jpg', '43148', '0', '0', '0', '0', '2015-03-23 11:18:42', '2015-03-23 11:18:42');
INSERT INTO `images` VALUES ('267', '', '/uploads/2015-03-23/nimxz1427080722.jpg', '', 'jpg', '43148', '0', '0', '0', '0', '2015-03-23 11:18:42', '2015-03-23 11:18:42');
INSERT INTO `images` VALUES ('268', '', '/uploads/2015-03-23/gXkNG1427080722.jpg', '', 'jpg', '43148', '0', '0', '0', '0', '2015-03-23 11:18:42', '2015-03-23 11:18:42');
INSERT INTO `images` VALUES ('269', '', '/uploads/2015-03-23/dW88F1427080723.jpg', '', 'jpg', '43148', '0', '0', '0', '0', '2015-03-23 11:18:43', '2015-03-23 11:18:43');
INSERT INTO `images` VALUES ('270', '', '/uploads/2015-03-23/4898q1427080723.jpg', '', 'jpg', '44250', '0', '0', '0', '0', '2015-03-23 11:18:43', '2015-03-23 11:18:43');
INSERT INTO `images` VALUES ('271', '', 'http://120.24.164.194:8089/uploads/2015-03-23/vPZzG1427080743.jpg', '', 'jpg', '1032242', '0', '0', '0', '0', '2015-03-23 11:19:04', '2015-03-23 11:19:04');
INSERT INTO `images` VALUES ('272', '', '/uploads/2015-03-23/y429Y1427081570.jpg', '', 'jpg', '45107', '0', '0', '0', '0', '2015-03-23 11:32:50', '2015-03-23 11:32:50');
INSERT INTO `images` VALUES ('273', '', '/uploads/2015-03-23/pjyqH1427081607.jpg', '', 'jpg', '43636', '0', '0', '0', '0', '2015-03-23 11:33:27', '2015-03-23 11:33:27');
INSERT INTO `images` VALUES ('274', '', 'http://120.24.164.194:8089/uploads/2015-03-23/A70J31427081637.jpg', '', 'jpg', '43636', '0', '0', '0', '0', '2015-03-23 11:33:58', '2015-03-23 11:33:58');
INSERT INTO `images` VALUES ('275', '', '/uploads/2015-03-23/qhRVX1427081674.jpg', '', 'jpg', '43636', '0', '0', '0', '0', '2015-03-23 11:34:34', '2015-03-23 11:34:34');
INSERT INTO `images` VALUES ('276', '', 'http://120.24.164.194:8089/uploads/2015-03-23/looc21427081688.jpg', '', 'jpg', '756464', '0', '0', '0', '0', '2015-03-23 11:34:48', '2015-03-23 11:34:48');
INSERT INTO `images` VALUES ('277', '', '/uploads/2015-03-23/DfIpN1427081765.jpg', '', 'jpg', '43636', '0', '0', '0', '0', '2015-03-23 11:36:05', '2015-03-23 11:36:05');
INSERT INTO `images` VALUES ('278', '', 'http://120.24.164.194:8089/uploads/2015-03-23/khJ5O1427081795.jpg', '', 'jpg', '807098', '0', '0', '0', '0', '2015-03-23 11:36:35', '2015-03-23 11:36:35');
INSERT INTO `images` VALUES ('279', '', 'http://120.24.164.194:8089/uploads/2015-03-23/V01Uf1427081815.jpg', '', 'jpg', '1028854', '0', '0', '0', '0', '2015-03-23 11:36:55', '2015-03-23 11:36:55');
INSERT INTO `images` VALUES ('280', '', '/uploads/2015-03-23/PRGdI1427082162.jpg', '', 'jpg', '44744', '0', '0', '0', '0', '2015-03-23 11:42:42', '2015-03-23 11:42:42');
INSERT INTO `images` VALUES ('281', '', 'http://120.24.164.194:8089/uploads/2015-03-23/9f8PI1427082199.jpg', '', 'jpg', '683279', '0', '0', '0', '0', '2015-03-23 11:43:19', '2015-03-23 11:43:19');
INSERT INTO `images` VALUES ('282', '', '/uploads/2015-03-23/km0yc1427082712.jpg', '', 'jpg', '42606', '0', '0', '0', '0', '2015-03-23 11:51:52', '2015-03-23 11:51:52');
INSERT INTO `images` VALUES ('283', '', 'http://120.24.164.194:8089/uploads/2015-03-23/w8I3q1427082740.jpg', '', 'jpg', '915457', '0', '0', '0', '0', '2015-03-23 11:52:21', '2015-03-23 11:52:21');
INSERT INTO `images` VALUES ('284', '', '/uploads/2015-03-23/C1nFN1427082897.jpg', '', 'jpg', '42381', '0', '0', '0', '0', '2015-03-23 11:54:57', '2015-03-23 11:54:57');
INSERT INTO `images` VALUES ('285', '', 'http://120.24.164.194:8089/uploads/2015-03-23/7pSI81427082954.jpg', '', 'jpg', '601358', '0', '0', '0', '0', '2015-03-23 11:55:54', '2015-03-23 11:55:54');
INSERT INTO `images` VALUES ('286', '', '/uploads/2015-03-23/NYX031427082967.jpg', '', 'jpg', '42381', '0', '0', '0', '0', '2015-03-23 11:56:07', '2015-03-23 11:56:07');
INSERT INTO `images` VALUES ('287', '', '/uploads/2015-03-23/qZsSj1427083098.jpg', '', 'jpg', '66183', '0', '0', '0', '0', '2015-03-23 11:58:18', '2015-03-23 11:58:18');
INSERT INTO `images` VALUES ('288', '', 'http://120.24.164.194:8089/uploads/2015-03-23/9ixXJ1427083150.jpg', '', 'jpg', '756239', '0', '0', '0', '0', '2015-03-23 11:59:11', '2015-03-23 11:59:11');
INSERT INTO `images` VALUES ('289', '', '/uploads/2015-03-23/uW0WM1427083989.jpg', '', 'jpg', '43903', '0', '0', '0', '0', '2015-03-23 12:13:09', '2015-03-23 12:13:09');
INSERT INTO `images` VALUES ('290', '', '/uploads/2015-03-23/fE4Z71427085140.jpg', '', 'jpg', '43903', '0', '0', '0', '0', '2015-03-23 12:32:20', '2015-03-23 12:32:20');
INSERT INTO `images` VALUES ('291', '', 'http://120.24.164.194:8089/uploads/2015-03-23/3twID1427085176.jpg', '', 'jpg', '756239', '0', '0', '0', '0', '2015-03-23 12:32:56', '2015-03-23 12:32:56');
INSERT INTO `images` VALUES ('292', '', 'http://120.24.164.194:8089/uploads/2015-03-23/ez9lT1427085303.jpg', '', 'jpg', '612707', '0', '0', '0', '0', '2015-03-23 12:35:04', '2015-03-23 12:35:04');
INSERT INTO `images` VALUES ('293', '', '/uploads/2015-03-23/cdDcl1427100233.jpg', '', 'jpg', '41020', '0', '0', '0', '0', '2015-03-23 16:43:53', '2015-03-23 16:43:53');
INSERT INTO `images` VALUES ('294', '', 'http://120.24.164.194:8089/uploads/2015-03-23/6gVtp1427100448.jpg', '', 'jpg', '300924', '0', '0', '0', '0', '2015-03-23 16:47:29', '2015-03-23 16:47:29');
INSERT INTO `images` VALUES ('295', '', '/uploads/2015-03-23/XzqS01427100508.jpg', '', 'jpg', '41020', '0', '0', '0', '0', '2015-03-23 16:48:28', '2015-03-23 16:48:28');
INSERT INTO `images` VALUES ('296', '', '/uploads/2015-03-23/LlVGL1427101242.jpg', '', 'jpg', '37525', '0', '0', '0', '0', '2015-03-23 17:00:42', '2015-03-23 17:00:42');
INSERT INTO `images` VALUES ('297', '', 'http://120.24.164.194:8089/uploads/2015-03-23/1TVb01427101287.jpg', '', 'jpg', '37525', '0', '0', '0', '0', '2015-03-23 17:01:27', '2015-03-23 17:01:27');
INSERT INTO `images` VALUES ('298', '1427101317.png', '/uploads/Category/1427101317.png', '/var/www/youlishi/public/uploads/Category/1427101317.png', 'png', '96928', '0', '0', '0', '0', '2015-03-23 17:01:58', '2015-03-23 17:01:58');
INSERT INTO `images` VALUES ('299', '', '/uploads/2015-03-23/xePu91427101669.jpg', '', 'jpg', '45586', '0', '0', '0', '0', '2015-03-23 17:07:49', '2015-03-23 17:07:49');
INSERT INTO `images` VALUES ('300', '', 'http://120.24.164.194:8089/uploads/2015-03-23/Gx68c1427101857.jpg', '', 'jpg', '706239', '0', '0', '0', '0', '2015-03-23 17:10:59', '2015-03-23 17:10:59');
INSERT INTO `images` VALUES ('301', '', '/uploads/2015-03-23/DarYG1427102304.jpg', '', 'jpg', '500230', '0', '0', '0', '0', '2015-03-23 17:18:24', '2015-03-23 17:18:24');
INSERT INTO `images` VALUES ('302', '', '/uploads/2015-03-23/0G7Jg1427102339.jpg', '', 'jpg', '68722', '0', '0', '0', '0', '2015-03-23 17:18:59', '2015-03-23 17:18:59');
INSERT INTO `images` VALUES ('303', '', 'http://120.24.164.194:8089/uploads/2015-03-23/qVmEl1427102391.jpg', '', 'jpg', '500230', '0', '0', '0', '0', '2015-03-23 17:19:52', '2015-03-23 17:19:52');
INSERT INTO `images` VALUES ('304', '', '/uploads/2015-03-23/SX6HK1427102635.jpg', '', 'jpg', '37017', '0', '0', '0', '0', '2015-03-23 17:23:55', '2015-03-23 17:23:55');
INSERT INTO `images` VALUES ('305', '', 'http://120.24.164.194:8089/uploads/2015-03-23/6X6Pa1427102760.jpg', '', 'jpg', '354330', '0', '0', '0', '0', '2015-03-23 17:26:01', '2015-03-23 17:26:01');
INSERT INTO `images` VALUES ('306', '', '/uploads/2015-03-23/ud7Rh1427103327.jpg', '', 'jpg', '42769', '0', '0', '0', '0', '2015-03-23 17:35:27', '2015-03-23 17:35:27');
INSERT INTO `images` VALUES ('307', '', 'http://120.24.164.194:8089/uploads/2015-03-23/EiPdJ1427103412.jpg', '', 'jpg', '630431', '0', '0', '0', '0', '2015-03-23 17:36:52', '2015-03-23 17:36:52');
INSERT INTO `images` VALUES ('308', '', '/uploads/2015-03-23/OR1SU1427103884.jpg', '', 'jpg', '44218', '0', '0', '0', '0', '2015-03-23 17:44:44', '2015-03-23 17:44:44');
INSERT INTO `images` VALUES ('309', '', 'http://120.24.164.194:8089/uploads/2015-03-23/2xK2m1427104005.jpg', '', 'jpg', '665349', '0', '0', '0', '0', '2015-03-23 17:46:45', '2015-03-23 17:46:45');
INSERT INTO `images` VALUES ('310', '', '/assets/images/churui/sfz1.jpg', '', '', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `images` VALUES ('311', '', '/assets/images/churui/sfz2.jpg', '', '', '0', '0', '0', '0', '0', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `passports_id` int(11) DEFAULT '0',
  `passport` char(31) DEFAULT NULL,
  `login` text,
  `client_ip` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `client_type` char(31) DEFAULT NULL,
  `client_agent` varchar(255) DEFAULT NULL,
  `device_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_log
-- ----------------------------

-- ----------------------------
-- Table structure for logistics_companies
-- ----------------------------
DROP TABLE IF EXISTS `logistics_companies`;
CREATE TABLE `logistics_companies` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logistics_companies
-- ----------------------------
INSERT INTO `logistics_companies` VALUES ('1', '安能物流', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('2', '安迅物流', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('3', '包裹/平邮/挂号信', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('4', '巴伦支快递', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('5', '北青小红帽', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('6', '百世汇通', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('7', '百福东方物流', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('8', '邦送物流', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('9', '宝凯物流', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('10', '百千诚物流', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('11', '博源恒通', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('12', '百成大达物流', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('13', 'COE（东方快递）', '2015-03-07 17:00:24', '2015-03-07 17:00:24');
INSERT INTO `logistics_companies` VALUES ('14', '城市100', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('15', '传喜物流', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('16', '城际速递', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('17', '成都立即送', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('18', '出口易', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('19', 'DHL快递（中国件）', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('20', 'DHL（国际件）', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('21', 'DHL（德国件）', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('22', '德邦', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('23', '大田物流', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('24', '东方快递', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('25', '递四方', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('26', '大洋物流', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('27', '店通快递', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('28', '德创物流', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('29', '东红物流', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('30', 'D速物流', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('31', '东瀚物流', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('32', '达方物流', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('33', 'EMS快递查询', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('34', 'EMS国际快递查询', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('35', '俄顺达', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('36', 'FedEx快递查询', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('37', 'FedEx国际件', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('38', 'FedEx（美国）', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('39', '凡客如风达', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('40', '飞康达物流', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('41', '飞豹快递', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('42', '飞狐快递', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('43', '凡宇速递', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('44', '颿达国际', '2015-03-07 17:00:25', '2015-03-07 17:00:25');
INSERT INTO `logistics_companies` VALUES ('45', '飞远配送', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('46', '飞鹰物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('47', 'GATI快递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('48', '国通快递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('49', '国际邮件查询', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('50', '港中能达物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('51', '挂号信/国内邮件', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('52', '共速达', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('53', '广通速递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('54', '广东速腾物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('55', '港快速递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('56', '高铁速递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('57', '冠达快递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('58', '华宇物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('59', '恒路物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('60', '好来运快递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('61', '华夏龙物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('62', '海航天天', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('63', '河北建华', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('64', '海盟速递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('65', '华企快运', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('66', '昊盛物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('67', '户通物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('68', '华航快递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('69', '黄马甲快递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('70', '合众速递（UCS）', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('71', '韩润物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('72', '皇家物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('73', '伙伴物流', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('74', '红马速递', '2015-03-07 17:00:26', '2015-03-07 17:00:26');
INSERT INTO `logistics_companies` VALUES ('75', 'i-parcel', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('76', '佳吉物流', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('77', '佳怡物流', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('78', '加运美快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('79', '急先达物流', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('80', '京广速递快件', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('81', '晋越快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('82', '京东快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('83', '捷特快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('84', '久易快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('85', '快捷快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('86', '康力物流', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('87', '跨越物流', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('88', '快优达速递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('89', '快淘快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('90', '联邦快递（国内）', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('91', '联昊通物流', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('92', '龙邦速递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('93', '乐捷递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('94', '立即送', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('95', '蓝弧快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('96', '民航快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('97', '美国快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('98', '门对门', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('99', '明亮物流', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('100', '民邦速递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('101', '闽盛快递', '2015-03-07 17:00:27', '2015-03-07 17:00:27');
INSERT INTO `logistics_companies` VALUES ('102', '麦力快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('103', '能达速递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('104', '偌亚奥国际', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('105', '南京晟邦物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('106', '平安达腾飞', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('107', '陪行物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('108', '全峰快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('109', '全一快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('110', '全日通快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('111', '全晨快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('112', '7天连锁物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('113', '秦邦快运', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('114', '如风达快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('115', '日昱物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('116', '瑞丰速递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('117', '申通快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('118', '顺丰速运', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('119', '速尔快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('120', '山东海红', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('121', '盛辉物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('122', '世运快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('123', '盛丰物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('124', '上大物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('125', '三态速递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('126', '赛澳递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('127', '申通E物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('128', '圣安物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('129', '山西红马甲', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('130', '穗佳物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('131', '沈阳佳惠尔', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('132', '上海林道货运', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('133', '十方通物流', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('134', 'TNT快递', '2015-03-07 17:00:28', '2015-03-07 17:00:28');
INSERT INTO `logistics_companies` VALUES ('135', '天天快递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('136', '天地华宇', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('137', '通和天下', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('138', '天纵物流', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('139', '同舟行物流', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('140', '腾达速递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('141', 'UPS快递查询', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('142', 'UPS国际快递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('143', 'UC优速快递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('144', 'USPS美国邮政', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('145', '万象物流', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('146', '微特派', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('147', '万家物流', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('148', '万博快递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('149', '希优特快递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('150', '新邦物流', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('151', '信丰物流', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('152', '新蛋物流', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('153', '祥龙运通物流', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('154', '西安城联速递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('155', '西安喜来快递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('156', '鑫世锐达', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('157', '圆通速递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('158', '韵达快运', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('159', '运通快递', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('160', '邮政国内', '2015-03-07 17:00:29', '2015-03-07 17:00:29');
INSERT INTO `logistics_companies` VALUES ('161', '邮政国际', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('162', '远成物流', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('163', '亚风速递', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('164', '优速快递', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('165', '亿顺航', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('166', '越丰物流', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('167', '源安达快递', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('168', '原飞航物流', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('169', '邮政EMS速递', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('170', '银捷速递', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('171', '一统飞鸿', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('172', '宇鑫物流', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('173', '易通达', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('174', '邮必佳', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('175', '一柒物流', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('176', '音素快运', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('177', '亿领速运', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('178', '煜嘉物流', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('179', '英脉物流', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('180', '云豹国际货运', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('181', '云南中诚', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('182', '中通快递', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('183', '宅急送', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('184', '中铁快运', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('185', '中铁物流', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('186', '中邮物流', '2015-03-07 17:00:30', '2015-03-07 17:00:30');
INSERT INTO `logistics_companies` VALUES ('187', '中国东方(COE)', '2015-03-07 17:00:31', '2015-03-07 17:00:31');
INSERT INTO `logistics_companies` VALUES ('188', '芝麻开门', '2015-03-07 17:00:31', '2015-03-07 17:00:31');
INSERT INTO `logistics_companies` VALUES ('189', '中国邮政快递', '2015-03-07 17:00:31', '2015-03-07 17:00:31');
INSERT INTO `logistics_companies` VALUES ('190', '郑州建华', '2015-03-07 17:00:31', '2015-03-07 17:00:31');
INSERT INTO `logistics_companies` VALUES ('191', '中速快件', '2015-03-07 17:00:31', '2015-03-07 17:00:31');
INSERT INTO `logistics_companies` VALUES ('192', '中天万运', '2015-03-07 17:00:31', '2015-03-07 17:00:31');
INSERT INTO `logistics_companies` VALUES ('193', '中睿速递', '2015-03-07 17:00:31', '2015-03-07 17:00:31');
INSERT INTO `logistics_companies` VALUES ('194', '中外运速递', '2015-03-07 17:00:31', '2015-03-07 17:00:31');
INSERT INTO `logistics_companies` VALUES ('195', '增益速递', '2015-03-07 17:00:31', '2015-03-07 17:00:31');
INSERT INTO `logistics_companies` VALUES ('196', '郑州速捷', '2015-03-07 17:00:31', '2015-03-07 17:00:31');

-- ----------------------------
-- Table structure for merchants
-- ----------------------------
DROP TABLE IF EXISTS `merchants`;
CREATE TABLE `merchants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `remember_token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(11) NOT NULL DEFAULT '0',
  `real_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `identity_num` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sex` tinyint(1) NOT NULL DEFAULT '1',
  `age` int(11) NOT NULL DEFAULT '0',
  `region` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `merchant_grade` tinyint(4) NOT NULL DEFAULT '3',
  `customer_num` int(11) NOT NULL DEFAULT '0',
  `order_num` int(11) NOT NULL DEFAULT '0',
  `total_pay` float(8,2) NOT NULL DEFAULT '0.00',
  `follower_profit` float(8,2) NOT NULL DEFAULT '0.00',
  `shop_profit` float(8,2) NOT NULL DEFAULT '0.00',
  `total_profit` float(8,2) NOT NULL DEFAULT '0.00',
  `leader_profit` float(8,2) NOT NULL DEFAULT '0.00',
  `money` float(8,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `follower_num` int(11) NOT NULL DEFAULT '0',
  `leader_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `visible` tinyint(1) DEFAULT '1',
  `company` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `shop_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `shop_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `responsible_area` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `weixin` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of merchants
-- ----------------------------
INSERT INTO `merchants` VALUES ('1', 'qAy9qiH9IT9dtQWluqoM9o1wPvGigNHQGAR41iNhHYESjQRpdEWQfbMED6nj', '13138656869', null, '13138656869', '$2y$10$uma7Pqi4M0XxOME8DNImfOpyxY70yyQi3pyyJNR7EsyIIEfhlvF7K', '226', null, null, '1', '22', '广东省广州市', '1', '1', '0', '0.00', '59.00', '0.00', '23.50', '0.00', '2.00', '1', '3', '0', '2015-03-13 13:58:06', '2015-04-16 17:16:39', '1', '', '', '', null, '');
INSERT INTO `merchants` VALUES ('2', 'JxG4cMZkN5R8hztwDknxNXqEDcWQ7h7s54oCS8STAcHHQn4YPktM3eTkpQMI', '18520254233', null, '18520254233', '$2y$10$azzuJOwyP9grS9q0sQoUoOQynidYjRVLfP29s3mb0crRY3/LthCwq', '219', '阿甘', null, '1', '18', '广州', '2', '0', '1', '0.01', '59.00', '0.00', '35.50', '23.50', '35.50', '1', '1', '1', '2015-03-13 14:35:23', '2015-03-21 11:01:18', '1', '', '', '', null, '');
INSERT INTO `merchants` VALUES ('3', 'QMxvoIOSiTtNNTsHO8LIWemPJuwP5jBX7cyp2o86tYNuwDUn1K3fzjCJA97Y', '18922750941', null, '18922750941', '$2y$10$DhEcZfnc0f36z4Nl/Gc2juJk.WnifM3hlmvM6tD8bZo5peSLh49KS', '0', '跳跳虾', null, '1', '0', '0', '3', '2', '5', '0.05', '0.00', '59.00', '59.00', '35.50', '59.00', '2', '2', '2', '2015-03-13 14:39:56', '2015-03-19 18:46:01', '1', '', '', '', null, '');
INSERT INTO `merchants` VALUES ('4', '', '13826096101', null, '13826096101', '$2y$10$nwZ41l/JqcBdGfOTNieQTOuDIsBT8sxm4hEwI11pPgqEshyzApoRK', '0', null, null, '1', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '13', '2015-03-17 12:35:58', '2015-03-17 12:35:58', '1', '', '', '', null, '');
INSERT INTO `merchants` VALUES ('5', '', '13380056186', null, '13380056186', '$2y$10$p/ofLyr6FffnO3TgjwoAXukgiDG8g.es5ApsYb9akp25sl0qRFHU2', '0', '陈鹏', null, '1', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '1', '2015-03-17 12:49:27', '2015-03-19 10:49:37', '1', '', '', '', null, '');
INSERT INTO `merchants` VALUES ('6', '', '13450141027', null, '13450141027', '$2y$10$PQESBNN36ukdBjsMXvihSelWD81ZY4N3k0KeWstKS68sbidU2wttG', '0', null, null, '1', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '13', '2015-03-19 11:02:35', '2015-03-19 11:02:35', '1', '', '', '', null, '');
INSERT INTO `merchants` VALUES ('7', '', '13138656889', null, '13138656889', '$2y$10$Y8W9LGYXHFvAE2v0gBXe/ey2Cm0oh4Y7HG0AD1xg/IBFuvALlsX2q', '0', '江先礼', null, '1', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '1', '2015-03-19 16:58:41', '2015-03-19 16:58:41', '1', '', '恒大', '黄埔大道西', '华南区', '');
INSERT INTO `merchants` VALUES ('8', '', '13012345678', null, '13012345678', '$2y$10$I5T9doq5i1TPoAGjFZPJSeJ/uwOcMJbflTTZveSLwYmgaCAMl0jcu', '0', '前飞', null, '1', '0', '0', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '1', '2015-03-19 16:59:24', '2015-03-19 16:59:24', '1', '', '我的店', '广州', '广州', '');
INSERT INTO `merchants` VALUES ('9', 'VpQFgQIqZKolx3awBL4PEshwbzMsnFVNuqAg051VGoaWSaAVmliJU6CwefL5', '13421344069', null, '13421344069', '$2y$10$aLO8LoLhNASUwLV5oZN4e.IFwi6Oll7bD0H80izk37KfElkQyAc0G', '0', '前飞', null, '1', '30', '广州', '1', '0', '0', '0.00', '50.00', '0.00', '20.00', '0.00', '20.00', '1', '1', '0', '2015-03-19 17:00:00', '2015-03-20 21:20:11', '1', 'SSSS', '', '', '广州', '');
INSERT INTO `merchants` VALUES ('10', 'KwTQwMZz8mijybxzo8wODoZ0eqQ3ingxGmWZCENrHIvivAEWMAhSMslOX6Wp', '18922702208', null, '18922702208', '$2y$10$vTmH7ALKsNI4E2xalesT1Oz40RQ4mbcpm.SEcmcFBsAx9BIMAjnz6', '0', '崔总', null, '1', '0', '0', '2', '0', '0', '0.00', '50.00', '0.00', '30.00', '20.00', '30.00', '1', '1', '9', '2015-03-19 17:06:18', '2015-03-20 21:06:24', '1', '', '前飞的店', '广州天河', '天河', '');
INSERT INTO `merchants` VALUES ('11', 'uQG83YaTEfXbV40CtqwmA7cMKJMRrwguw3rHWrBzny0VChVZAUpC5XGju6xt', '13450483333', null, '13450483333', '$2y$10$XKJ7kX.tiTTdS9s4ZokyauM2CoJzxb3hAzFD9o3J0XmV5uORGNdJu', '0', '谢建松', null, '1', '0', '0', '3', '0', '1', '1.00', '0.00', '50.00', '50.00', '30.00', '50.00', '1', '0', '10', '2015-03-19 17:09:55', '2015-03-20 21:14:28', '1', '', '', '', '', '');
INSERT INTO `merchants` VALUES ('12', '', '13570953105', null, '13570953105', '$2y$10$cPPR.bUanFxgzU9o6rs3y.SascZNMCbkn4Pd3VrHXq1iR3zXKVa1m', '0', '代理商加', null, '1', '0', '0', '1', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '1', '0', '13', '2015-03-19 18:28:38', '2015-03-19 18:28:38', '1', 'aaaaa', '', '', '广东省广州市', '');
INSERT INTO `merchants` VALUES ('13', 'yjujDfDRvzRB0As9ZPbktOyqDBFLq9EgSqwmJFX7wELJDDgR5ADUFIghNPzA', '饶庆林', null, '17722858319', '$2y$10$uma7Pqi4M0XxOME8DNImfOpyxY70yyQi3pyyJNR7EsyIIEfhlvF7K', '0', '饶庆林', null, '1', '25', '0', '2', '0', '0', '0.00', '0.00', '0.00', '0.00', '0.00', '0.00', '2', '0', '0', '0000-00-00 00:00:00', '2015-04-16 17:36:37', '1', '', '', '', '', '');

-- ----------------------------
-- Table structure for merchant_accounts
-- ----------------------------
DROP TABLE IF EXISTS `merchant_accounts`;
CREATE TABLE `merchant_accounts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `alipay_account` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `alipay_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `merchant_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of merchant_accounts
-- ----------------------------
INSERT INTO `merchant_accounts` VALUES ('1', '18874443090', '江先生', '1', '1', '2015-03-13 13:58:06', '2015-03-20 15:25:49');
INSERT INTO `merchant_accounts` VALUES ('2', null, null, '0', '2', '2015-03-13 14:35:23', '2015-03-13 14:35:23');
INSERT INTO `merchant_accounts` VALUES ('3', null, null, '0', '3', '2015-03-13 14:39:56', '2015-03-13 14:39:56');
INSERT INTO `merchant_accounts` VALUES ('4', null, null, '0', '4', '2015-03-17 12:35:58', '2015-03-17 12:35:58');
INSERT INTO `merchant_accounts` VALUES ('5', null, null, '0', '5', '2015-03-17 12:49:27', '2015-03-17 12:49:27');
INSERT INTO `merchant_accounts` VALUES ('6', null, null, '0', '6', '2015-03-19 11:02:35', '2015-03-19 11:02:35');
INSERT INTO `merchant_accounts` VALUES ('7', null, null, '0', '7', '2015-03-19 16:58:41', '2015-03-19 16:58:41');
INSERT INTO `merchant_accounts` VALUES ('8', null, null, '0', '8', '2015-03-19 16:59:24', '2015-03-19 16:59:24');
INSERT INTO `merchant_accounts` VALUES ('9', null, null, '0', '9', '2015-03-19 17:00:00', '2015-03-19 17:00:00');
INSERT INTO `merchant_accounts` VALUES ('10', null, null, '0', '10', '2015-03-19 17:06:18', '2015-03-19 17:06:18');
INSERT INTO `merchant_accounts` VALUES ('11', null, null, '0', '11', '2015-03-19 17:09:55', '2015-03-19 17:09:55');
INSERT INTO `merchant_accounts` VALUES ('12', null, null, '0', '12', '2015-03-19 18:28:38', '2015-03-19 18:28:38');

-- ----------------------------
-- Table structure for merchant_account_logs
-- ----------------------------
DROP TABLE IF EXISTS `merchant_account_logs`;
CREATE TABLE `merchant_account_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `money` float(8,2) NOT NULL,
  `trade_type` tinyint(4) NOT NULL DEFAULT '1',
  `log` text COLLATE utf8_unicode_ci NOT NULL,
  `operate_type` tinyint(4) NOT NULL DEFAULT '1',
  `merchant_id` int(10) unsigned NOT NULL,
  `alipay_account` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `alipay_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of merchant_account_logs
-- ----------------------------
INSERT INTO `merchant_account_logs` VALUES ('1', '1.00', '0', '申请提现1元', '1', '1', null, null, '0', '2015-03-13 15:36:24', '2015-03-13 15:51:06');
INSERT INTO `merchant_account_logs` VALUES ('2', '0.50', '0', '申请提现0.5元', '1', '1', null, null, '1', '2015-03-17 13:02:26', '2015-03-17 13:02:26');
INSERT INTO `merchant_account_logs` VALUES ('3', '2.50', '1', '从订单【15031968】直接获得分润￥2.5\n            (产品ID:5;SKU:98111448413484;销售价:;分润额:5.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '3', null, null, '2', '2015-03-19 10:32:01', '2015-03-19 16:33:27');
INSERT INTO `merchant_account_logs` VALUES ('4', '1.50', '1', '从订单【15031968】间接获得分润￥1.5\n            (产品ID:5;SKU:98111448413484;销售价:;分润额:5.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '2', null, null, '1', '2015-03-19 10:32:01', '2015-03-19 10:32:01');
INSERT INTO `merchant_account_logs` VALUES ('5', '1.00', '1', '从订单【15031968】间接获得分润￥1\n            (产品ID:5;SKU:98111448413484;销售价:;分润额:5.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '1', null, null, '1', '2015-03-19 10:32:01', '2015-03-19 10:32:01');
INSERT INTO `merchant_account_logs` VALUES ('6', '50.00', '1', '从订单【15031969】直接获得分润￥50\n            (产品ID:4;SKU:36975451156;销售价:;分润额:100.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '3', null, null, '1', '2015-03-19 13:23:01', '2015-03-19 13:23:01');
INSERT INTO `merchant_account_logs` VALUES ('7', '30.00', '1', '从订单【15031969】间接获得分润￥30\n            (产品ID:4;SKU:36975451156;销售价:;分润额:100.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '2', null, null, '1', '2015-03-19 13:23:01', '2015-03-19 13:23:01');
INSERT INTO `merchant_account_logs` VALUES ('8', '20.00', '1', '从订单【15031969】间接获得分润￥20\n            (产品ID:4;SKU:36975451156;销售价:;分润额:100.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '1', null, null, '1', '2015-03-19 13:23:01', '2015-03-19 13:23:01');
INSERT INTO `merchant_account_logs` VALUES ('9', '50.00', '1', '从订单【15031971】直接获得分润￥50\n            (产品ID:4;SKU:36975451156;销售价:;分润额:100.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '11', null, null, '1', '2015-03-19 17:41:02', '2015-03-19 17:41:02');
INSERT INTO `merchant_account_logs` VALUES ('10', '30.00', '1', '从订单【15031971】间接获得分润￥30\n            (产品ID:4;SKU:36975451156;销售价:;分润额:100.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '10', null, null, '1', '2015-03-19 17:41:02', '2015-03-19 17:41:02');
INSERT INTO `merchant_account_logs` VALUES ('11', '20.00', '1', '从订单【15031971】间接获得分润￥20\n            (产品ID:4;SKU:36975451156;销售价:;分润额:100.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '9', null, null, '1', '2015-03-19 17:41:02', '2015-03-19 17:41:02');
INSERT INTO `merchant_account_logs` VALUES ('12', '21.00', '0', '后台管理员(ID:1,mobile:13138656869)将余额￥21.00转入客户账户', '1', '1', null, null, '2', '2015-03-19 18:15:44', '2015-03-19 18:15:44');
INSERT INTO `merchant_account_logs` VALUES ('13', '2.50', '1', '从订单【15031972】直接获得分润￥2.5\n            (产品ID:5;SKU:98111448413484;销售价:;分润额:5.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '3', null, null, '1', '2015-03-19 18:41:02', '2015-03-19 18:41:02');
INSERT INTO `merchant_account_logs` VALUES ('14', '1.50', '1', '从订单【15031972】间接获得分润￥1.5\n            (产品ID:5;SKU:98111448413484;销售价:;分润额:5.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '2', null, null, '1', '2015-03-19 18:41:02', '2015-03-19 18:41:02');
INSERT INTO `merchant_account_logs` VALUES ('15', '1.00', '1', '从订单【15031972】间接获得分润￥1\n            (产品ID:5;SKU:98111448413484;销售价:;分润额:5.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '1', null, null, '1', '2015-03-19 18:41:02', '2015-03-19 18:41:02');
INSERT INTO `merchant_account_logs` VALUES ('16', '2.50', '1', '从订单【15031973】直接获得分润￥2.5\n            (产品ID:5;SKU:98111448413484;销售价:5.00;分润额:5.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '3', null, null, '2', '2015-03-19 18:46:01', '2015-03-19 18:46:01');
INSERT INTO `merchant_account_logs` VALUES ('17', '1.50', '1', '从订单【15031973】间接获得分润￥1.5\n            (产品ID:5;SKU:98111448413484;销售价:5.00;分润额:5.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '2', null, null, '2', '2015-03-19 18:46:01', '2015-03-19 18:46:01');
INSERT INTO `merchant_account_logs` VALUES ('18', '1.00', '1', '从订单【15031973】间接获得分润￥1\n            (产品ID:5;SKU:98111448413484;销售价:5.00;分润额:5.00;\n            分润配置:[BA:50%,门店:30%,代理商:20%]\n            )', '2', '1', null, null, '2', '2015-03-19 18:46:01', '2015-03-19 18:46:01');

-- ----------------------------
-- Table structure for merchant_responsible_areas
-- ----------------------------
DROP TABLE IF EXISTS `merchant_responsible_areas`;
CREATE TABLE `merchant_responsible_areas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `merchant_id` int(11) NOT NULL DEFAULT '0',
  `region_id` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of merchant_responsible_areas
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2014_12_30_032919_create_merchants_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_034501_create_product_categories_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_034547_create_products_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_035525_create_product_services_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_035529_create_products_product_services_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_035529_create_proudct_products_services_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_040003_create_images_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_040053_create_product_images_products_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_055532_create_product_brands_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_055905_create_category_attribute_sets_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_060048_create_category_attributes_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_060241_create_category_attribute_values_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_060759_create_category_attributes_attribute_sets_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_062735_create_category_attribute_sets_categoires_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_063123_create_category_attribute_values_products_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_063413_create_product_comments_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_063936_create_product_options_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_064033_create_product_default_option_values_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_064034_create_product_option_values_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_064135_create_product_options_products_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_064324_create_product_entities_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_072211_create_customers_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_072333_create_customer_details_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_072335_create_customer_levels_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_072337_create_customer_groups_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_072605_create_customer_customers_groups_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_072958_create_customer_collections_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_073111_create_customer_shopping_carts_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_073217_create_regions_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_073305_create_addresses_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_073518_create_customer_orders_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_073745_create_customer_order_products_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_074155_create_customer_order_product_options_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_074306_create_customer_order_addresses_table', '1');
INSERT INTO `migrations` VALUES ('2014_12_30_074430_create_customer_order_histories_table', '1');
INSERT INTO `migrations` VALUES ('2015_01_15_062936_create_auth_code_table', '1');
INSERT INTO `migrations` VALUES ('2015_01_28_170044_create_merchant_accounts_table', '1');
INSERT INTO `migrations` VALUES ('2015_01_28_170807_create_merchant_account_logs_table', '1');
INSERT INTO `migrations` VALUES ('2015_01_28_171400_create_shops_table', '1');
INSERT INTO `migrations` VALUES ('2015_01_28_172119_create_shop_products_table', '1');
INSERT INTO `migrations` VALUES ('2015_01_28_175621_create_skin_types_table', '1');
INSERT INTO `migrations` VALUES ('2015_01_28_181228_create_skin_checks_table', '1');
INSERT INTO `migrations` VALUES ('2015_01_28_181714_create_advisers_table', '1');
INSERT INTO `migrations` VALUES ('2015_01_29_110740_create_order_sn', '1');
INSERT INTO `migrations` VALUES ('2015_02_04_095004_create_admins_table', '1');
INSERT INTO `migrations` VALUES ('2015_02_04_095323_create_roles_table', '1');
INSERT INTO `migrations` VALUES ('2015_02_04_095519_create_admin_roles_table', '1');
INSERT INTO `migrations` VALUES ('2015_02_04_144314_create_product_profits_table', '1');
INSERT INTO `migrations` VALUES ('2015_02_04_144317_create_recommend_products_table', '1');
INSERT INTO `migrations` VALUES ('2013_06_27_143953_create_cronmanager_table', '2');
INSERT INTO `migrations` VALUES ('2013_06_27_144035_create_cronjob_table', '2');

-- ----------------------------
-- Table structure for order_sn_ids
-- ----------------------------
DROP TABLE IF EXISTS `order_sn_ids`;
CREATE TABLE `order_sn_ids` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of order_sn_ids
-- ----------------------------
INSERT INTO `order_sn_ids` VALUES ('1');
INSERT INTO `order_sn_ids` VALUES ('2');
INSERT INTO `order_sn_ids` VALUES ('3');
INSERT INTO `order_sn_ids` VALUES ('4');
INSERT INTO `order_sn_ids` VALUES ('5');
INSERT INTO `order_sn_ids` VALUES ('6');
INSERT INTO `order_sn_ids` VALUES ('7');
INSERT INTO `order_sn_ids` VALUES ('8');
INSERT INTO `order_sn_ids` VALUES ('9');
INSERT INTO `order_sn_ids` VALUES ('10');
INSERT INTO `order_sn_ids` VALUES ('11');
INSERT INTO `order_sn_ids` VALUES ('12');
INSERT INTO `order_sn_ids` VALUES ('13');
INSERT INTO `order_sn_ids` VALUES ('14');
INSERT INTO `order_sn_ids` VALUES ('15');
INSERT INTO `order_sn_ids` VALUES ('16');
INSERT INTO `order_sn_ids` VALUES ('17');
INSERT INTO `order_sn_ids` VALUES ('18');
INSERT INTO `order_sn_ids` VALUES ('19');
INSERT INTO `order_sn_ids` VALUES ('20');
INSERT INTO `order_sn_ids` VALUES ('21');
INSERT INTO `order_sn_ids` VALUES ('22');
INSERT INTO `order_sn_ids` VALUES ('23');
INSERT INTO `order_sn_ids` VALUES ('24');
INSERT INTO `order_sn_ids` VALUES ('25');
INSERT INTO `order_sn_ids` VALUES ('26');
INSERT INTO `order_sn_ids` VALUES ('27');
INSERT INTO `order_sn_ids` VALUES ('28');
INSERT INTO `order_sn_ids` VALUES ('29');
INSERT INTO `order_sn_ids` VALUES ('30');
INSERT INTO `order_sn_ids` VALUES ('31');
INSERT INTO `order_sn_ids` VALUES ('32');
INSERT INTO `order_sn_ids` VALUES ('33');
INSERT INTO `order_sn_ids` VALUES ('34');
INSERT INTO `order_sn_ids` VALUES ('35');
INSERT INTO `order_sn_ids` VALUES ('36');
INSERT INTO `order_sn_ids` VALUES ('37');
INSERT INTO `order_sn_ids` VALUES ('38');
INSERT INTO `order_sn_ids` VALUES ('39');
INSERT INTO `order_sn_ids` VALUES ('40');
INSERT INTO `order_sn_ids` VALUES ('41');
INSERT INTO `order_sn_ids` VALUES ('42');
INSERT INTO `order_sn_ids` VALUES ('43');
INSERT INTO `order_sn_ids` VALUES ('44');
INSERT INTO `order_sn_ids` VALUES ('45');
INSERT INTO `order_sn_ids` VALUES ('46');
INSERT INTO `order_sn_ids` VALUES ('47');
INSERT INTO `order_sn_ids` VALUES ('48');
INSERT INTO `order_sn_ids` VALUES ('49');
INSERT INTO `order_sn_ids` VALUES ('50');
INSERT INTO `order_sn_ids` VALUES ('51');
INSERT INTO `order_sn_ids` VALUES ('52');
INSERT INTO `order_sn_ids` VALUES ('53');
INSERT INTO `order_sn_ids` VALUES ('54');
INSERT INTO `order_sn_ids` VALUES ('55');
INSERT INTO `order_sn_ids` VALUES ('56');
INSERT INTO `order_sn_ids` VALUES ('57');
INSERT INTO `order_sn_ids` VALUES ('58');
INSERT INTO `order_sn_ids` VALUES ('59');
INSERT INTO `order_sn_ids` VALUES ('60');
INSERT INTO `order_sn_ids` VALUES ('61');
INSERT INTO `order_sn_ids` VALUES ('62');
INSERT INTO `order_sn_ids` VALUES ('63');
INSERT INTO `order_sn_ids` VALUES ('64');
INSERT INTO `order_sn_ids` VALUES ('65');
INSERT INTO `order_sn_ids` VALUES ('66');
INSERT INTO `order_sn_ids` VALUES ('67');
INSERT INTO `order_sn_ids` VALUES ('68');
INSERT INTO `order_sn_ids` VALUES ('69');
INSERT INTO `order_sn_ids` VALUES ('70');
INSERT INTO `order_sn_ids` VALUES ('71');
INSERT INTO `order_sn_ids` VALUES ('72');
INSERT INTO `order_sn_ids` VALUES ('73');
INSERT INTO `order_sn_ids` VALUES ('74');
INSERT INTO `order_sn_ids` VALUES ('75');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'entity',
  `par_price` decimal(8,2) NOT NULL,
  `sale_price` decimal(8,2) NOT NULL,
  `image_id` int(10) unsigned DEFAULT NULL,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `brand_id` int(10) unsigned DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `published_at` timestamp NULL DEFAULT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_by` int(10) unsigned NOT NULL DEFAULT '0',
  `updated_by` int(10) unsigned NOT NULL DEFAULT '0',
  `sale_count` int(10) unsigned NOT NULL DEFAULT '0',
  `comment_count` int(10) DEFAULT '0',
  `visit_count` int(10) unsigned NOT NULL DEFAULT '0',
  `collection_count` int(10) unsigned NOT NULL DEFAULT '0',
  `stock` int(10) unsigned NOT NULL DEFAULT '0',
  `invoice` int(10) unsigned NOT NULL DEFAULT '0',
  `counting_method` int(10) unsigned NOT NULL DEFAULT '0',
  `logistics` int(10) unsigned NOT NULL DEFAULT '0',
  `attribute_values` text COLLATE utf8_unicode_ci,
  `profit_id` int(11) NOT NULL DEFAULT '0',
  `profit` float(8,2) NOT NULL DEFAULT '0.00',
  `display_type` tinyint(4) NOT NULL DEFAULT '1',
  `first_profit` int(11) NOT NULL DEFAULT '0',
  `two_profit` int(11) NOT NULL DEFAULT '0',
  `three_profit` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `use_position` tinyint(1) DEFAULT '1',
  `skin_status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES ('1', '23333333333333333333', '2332', '<p>dssssssssssssssssssss</p>\r\n', '', '33', 'entity', '232.00', '232.00', '182', '5', null, '1', '0', null, '0', '0', '0', '0', '0', '0', '0', '22', '0', '0', '0', null, '0', '23.00', '0', '10', '2', '3', '2015-03-11 14:16:11', '2015-03-13 22:42:26', '1', '1');
INSERT INTO `products` VALUES ('2', 'Lancome兰蔻 水份缘舒悦补水面膜100ml 补水 保湿 免洗', '保湿补水 美白', '<p>就我工作中所见，<strong>要区分真假乞丐其实是很简单的，就是看他们是否接受除了财物以外的东西。</strong><br />\r\n真乞丐都是生活所迫，乞讨的目的是为了吃饭，并且往往自身罹患精神性疾病，肢体残疾，器官障碍等等，只要能够填饱肚子，他们对于现金与其他东西的区别并不怎么在意。<br />\r\n知友&nbsp;<a href=\"http://www.zhihu.com/people/78398b74f29462ee17bd5ae845650035\">@笛涤</a>说，要钱给饭，要饭给钱，前半句对了，后半句错了。<br />\r\n应该要钱给饭，要饭也给饭，包括你可以给他一些衣物，小的生活用品，真正的乞丐一般都是会接受的，如果你说我带你吃饭、买票，去派出所求助，他拒绝的话，是假乞丐无疑。<br />\r\n另外还有一类就是在固定地点乞讨的，比如什么家庭困难，家人去世，学生求学，工伤致残一类的，要分辨这种很好办，直接给110打电话，就说怀疑有人冒充乞丐诈骗，但是请正确区分，我们往往把街头卖唱的一些人也算成乞讨人员，我觉得并不恰当，一般我见到卖唱的都会给，因为我觉得他们和耍猴的可以算一类，都是混演艺圈的。</p>\r\n', '', '12365845', 'entity', '5.00', '5.00', '231', '6', null, '1', '0', null, '0', '0', '0', '4', '0', '0', '1', '25', '0', '0', '0', null, '0', '5.00', '0', '50', '30', '20', '2015-03-11 14:18:59', '2015-03-20 13:51:59', '1', '1');
INSERT INTO `products` VALUES ('3', 'Clinique 倩碧水嫩保湿夜间滋养面膜(水磁场7NR5) 100ml#', '浪漫初春，美妆盛会，单笔满80即享包邮！', '<p>另外下面我想给大家讲个故事，这也是我觉得卖唱者不是乞丐的原因：<br />\r\n我所生活的城市，有一条非常繁华的商业街。<br />\r\n商业街是一座城市的面孔和形象，也是人流财帛集中之地，所以往往是警察城管与乞讨人员的必争之地。<br />\r\n但是就在这条街上，曾经长期存在过一对卖唱者，他们唱戏的时候，警察城管从不驱赶，也禁止其他乞丐来骚扰抢地盘。<br />\r\n这是一对老夫妻，都已双目失明，老头会拉二胡，老婆儿会唱几句二人台（我们当地的一种地方戏），在我刚上班的时候，就见过他们卖唱，说句实话，唱得相当难听，我是完全听不懂也听不下去的，如果单以歌声而论，我觉得应该按照《噪音污染防治法》处以罚款。<br />\r\n有一年我们这里搞什么精神文明城市评比，大家都懂得，街头乞讨是重点打击对象，这对老夫妻被送到了社会福利院。</p>\r\n', '', '12355486', 'entity', '2.00', '2.00', '230', '7', null, '1', '0', null, '0', '0', '0', '5', '0', '0', '1', '35', '0', '0', '0', null, '0', '1.00', '0', '50', '30', '20', '2015-03-11 14:22:53', '2015-03-20 13:51:59', '1', '1');
INSERT INTO `products` VALUES ('4', '美即（Magic）海洋冰泉补水面膜10片装 25g×10片', '闺蜜节本店所有商品6.5折起 购买本店产品更有精美小样赠送哦！！  ', '<p>但是他们后来坚决的拒绝了福利院的照顾，又走上了街头。<br />\r\n他们说：&rdquo;<strong>我们是卖唱，不是要饭</strong>。&ldquo;<br />\r\n我是听我管片儿的同学说起的这件事，因为他这么说，我突然对这对老夫妻产生了兴趣，我就特意去观察他们，一年之中，我大概去看过他们十几次。</p>\r\n', '', '36975451156', 'entity', '10.00', '10.00', '229', '8', null, '1', '0', null, '0', '0', '0', '10', '0', '0', '3', '50', '0', '0', '0', null, '0', '100.00', '0', '50', '30', '20', '2015-03-11 15:27:14', '2015-03-20 13:51:59', '1', '1');
INSERT INTO `products` VALUES ('5', '美即（Magic）净白水润8送4分享装 25g×10片+3g×2对  5', '丰盈清透，幼滑白嫩，滋养后的肌肤清隽、匀亮，整日沁润亮泽。【100%正品，15天无理由退换货】  ', '<p>这对老夫妻并不整天在街上乞讨，他们的作息随着季节而有所变化，冬季一般就是在午后比较暖和的时段，其他三季基本都是下午三到五点之间，老头手里拿着二胡和盲杖，哒哒哒的在前面开路，老婆儿一手拿着暖壶和毛巾，另一只手挽着老头的胳膊，怯怯的跟在后面。每次他们都是站在十字路口的中间，会有附近商场的保安把他们领到合适的位置，然后老头坐在马扎上，老婆开始唱，他们没有开场白，总是突然就唱了起来，也可能想说的话，都在这戏里面吧。唱上几分钟，老婆儿的气力不济，就要休息，然后老头会自己再拉一阵二胡，说真话我不懂乐器，不过二胡比老婆儿唱的还好听些，只是曲子太单调了，我每次去，都只听到一曲《二泉映月》。</p>\r\n', '', '98111448413484', 'entity', '5.00', '5.00', '228', '5', null, '1', '0', null, '0', '0', '0', '33', '0', '0', '1', '20', '0', '0', '0', null, '0', '5.00', '0', '50', '30', '20', '2015-03-11 15:29:10', '2015-03-20 13:52:03', '1', '1');
INSERT INTO `products` VALUES ('6', '甘草多肽原液（至臻版）', '', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-20/MEvH21426835026.jpg\" style=\"height:2393px; width:640px\" /></p>\r\n', '', 'du6952711603305', 'entity', '168.00', '168.00', '248', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '10000', '0', '0', '0', null, '0', '168.00', '0', '25', '15', '10', '2015-03-20 15:03:53', '2015-03-20 15:03:53', '2', '3');
INSERT INTO `products` VALUES ('7', ' 杜鹃花肽原液（至臻版）', '净化肌肤圣品', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/uCjsA1427077182.jpg\" /></p>\r\n', '', 'DU6952711603299', 'entity', '168.00', '168.00', '251', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '1000', '0', '0', '0', null, '0', '168.00', '0', '25', '15', '10', '2015-03-23 10:19:48', '2015-03-23 10:19:48', '1', '3');
INSERT INTO `products` VALUES ('8', '胎盘多肽原液（至臻版）', '', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/8qqG91427077847.jpg\" /></p>\r\n', '', 'du6952711603282', 'entity', '168.00', '168.00', '258', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '9999', '0', '0', '0', null, '0', '168.00', '0', '25', '15', '10', '2015-03-23 11:07:16', '2015-03-23 11:08:45', '1', '3');
INSERT INTO `products` VALUES ('9', '胶原蛋白肽原液（至臻版）', '', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/48U2D1427080588.jpg\" /></p>\r\n', '', 'du6952711603275', 'entity', '168.00', '168.00', '264', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '168.00', '0', '25', '15', '10', '2015-03-23 11:16:35', '2015-03-23 11:16:35', '1', '2');
INSERT INTO `products` VALUES ('10', '六胜肽原液 （至臻版）', '六胜肽原液 （至臻版）', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/vPZzG1427080743.jpg\" /></p>\r\n', '', 'du6952711603268', 'entity', '168.00', '168.00', '266', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '168.00', '0', '25', '15', '10', '2015-03-23 11:19:10', '2015-03-23 11:19:10', '1', '1');
INSERT INTO `products` VALUES ('11', '左旋C肽原液（至臻版）', '左旋C肽原液（至臻版）', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/looc21427081688.jpg\" /></p>\r\n', '', 'du6952711602971', 'entity', '168.00', '168.00', '275', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '168.00', '0', '25', '15', '10', '2015-03-23 11:34:53', '2015-03-23 11:34:53', '1', '1');
INSERT INTO `products` VALUES ('12', '燕麻素原液（至臻版）', '燕麻素原液（至臻版）', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/V01Uf1427081815.jpg\" /></p>\r\n', '', 'du6952711602964', 'entity', '168.00', '168.00', '277', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '168.00', '0', '25', '15', '10', '2015-03-23 11:37:03', '2015-03-23 11:37:03', '1', '1');
INSERT INTO `products` VALUES ('13', '玻尿酸肽原液（至臻版）2', '玻尿酸肽原液（至臻版）', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/9f8PI1427082199.jpg\" /></p>\r\n', '', 'du6952711602957', 'entity', '168.00', '168.00', '280', '16', null, '1', '1', null, '0', '0', '0', '1', '0', '0', '0', '999', '0', '0', '0', null, '0', '168.00', '0', '25', '15', '10', '2015-03-23 11:43:24', '2015-03-23 11:43:24', '1', '1');
INSERT INTO `products` VALUES ('14', '臻采新肌多肽原液（至臻版）', '臻采新肌多肽原液（至臻版）', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/w8I3q1427082740.jpg\" /></p>\r\n', '', 'du6952711602940', 'entity', '268.00', '268.00', '282', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '268.00', '0', '25', '15', '10', '2015-03-23 11:52:28', '2015-03-23 11:52:28', '1', '1');
INSERT INTO `products` VALUES ('15', '金纯弹力眼精华', '金纯弹力眼精华30ml', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/7pSI81427082954.jpg\" /></p>\r\n', '', 'du6952711603503', 'entity', '298.00', '298.00', '286', '17', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '298.00', '0', '25', '15', '10', '2015-03-23 11:56:29', '2015-03-23 11:56:29', '3', '1');
INSERT INTO `products` VALUES ('16', '密集修护精华眼霜', '密集修护精华眼霜', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/9ixXJ1427083150.jpg\" /></p>\r\n', '', 'du6952711603497', 'entity', '198.00', '198.00', '287', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '198.00', '0', '25', '15', '10', '2015-03-23 11:59:15', '2015-03-23 11:59:15', '3', '1');
INSERT INTO `products` VALUES ('17', '玻尿酸肽保湿洗面奶（六角水分团）', '玻尿酸肽保湿洗面奶（六角水分团）', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/ez9lT1427085303.jpg\" style=\"height:3198px; width:640px\" /></p>\r\n', '', '6952711603534', 'entity', '76.00', '76.00', '290', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '76.00', '0', '25', '15', '10', '2015-03-23 12:35:22', '2015-03-23 12:35:22', '1', '1');
INSERT INTO `products` VALUES ('18', '温和去角质磨砂膏', '温和去角质磨砂膏', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/6gVtp1427100448.jpg\" /></p>\r\n', '', 'du6952711603367', 'entity', '78.00', '78.00', '295', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '78.00', '0', '25', '15', '10', '2015-03-23 16:48:30', '2015-03-23 16:48:30', '1', '3');
INSERT INTO `products` VALUES ('19', '玻尿酸肽原液蚕丝面膜', '玻尿酸肽原液蚕丝面膜', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/1TVb01427101287.jpg\" style=\"height:647px; width:640px\" /></p>\r\n', '', 'DU6952711601424', 'entity', '98.00', '98.00', '296', '20', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '98.00', '0', '25', '15', '10', '2015-03-23 17:01:31', '2015-03-23 17:02:23', '1', '1');
INSERT INTO `products` VALUES ('20', '优理氏六胜肽原液蚕丝面膜', '优理氏六胜肽原液蚕丝面膜', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/Gx68c1427101857.jpg\" /></p>\r\n', '', 'du6952711601448', 'entity', '98.00', '98.00', '299', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '899', '0', '0', '0', null, '0', '98.00', '0', '25', '15', '10', '2015-03-23 17:11:19', '2015-03-23 17:11:19', '1', '1');
INSERT INTO `products` VALUES ('21', '活细胞原晶原子液套盒（3D美白）', '活细胞原晶原子液套盒（3D美白）', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/qVmEl1427102391.jpg\" /></p>\r\n', '', 'du6952711603619', 'entity', '598.00', '598.00', '302', '19', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '598.00', '0', '25', '15', '10', '2015-03-23 17:19:57', '2015-03-23 17:19:57', '1', '1');
INSERT INTO `products` VALUES ('22', '香子兰原液身体乳', '香子兰原液身体乳', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/6X6Pa1427102760.jpg\" /></p>\r\n', '', 'du6952711603398', 'entity', '98.00', '98.00', '304', '18', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '98.00', '0', '25', '15', '10', '2015-03-23 17:26:06', '2015-03-23 17:26:06', '1', '1');
INSERT INTO `products` VALUES ('23', '燕麻素美白夜间乳霜', '燕麻素美白夜间乳霜', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/EiPdJ1427103412.jpg\" /></p>\r\n', '', 'du6952711603473', 'entity', '168.00', '168.00', '306', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '0', '168.00', '0', '25', '15', '10', '2015-03-23 17:36:57', '2015-03-23 17:36:57', '1', '1');
INSERT INTO `products` VALUES ('24', '燕麻素美白日间乳霜', '燕麻素美白日间乳霜', '<p><img alt=\"\" src=\"http://120.24.164.194:8089/uploads/2015-03-23/2xK2m1427104005.jpg\" /></p>\r\n', '', 'du6952711603466', 'entity', '158.00', '158.00', '308', '16', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '999', '0', '0', '0', null, '1', '158.00', '0', '5', '10', '15', '2015-03-23 17:46:50', '2015-04-16 14:19:29', '1', '1');
INSERT INTO `products` VALUES ('25', '我的测试商品', '测试', '<p>这是一个测试商品</p>\r\n', '', 'rao', 'entity', '12.00', '12.00', '308', '20', null, '1', '1', null, '0', '0', '0', '0', '0', '0', '0', '123', '0', '0', '0', null, '2', '2.00', '0', '1', '2', '3', '2015-04-16 14:24:10', '2015-04-16 14:35:15', '2', '3');

-- ----------------------------
-- Table structure for products_product_services
-- ----------------------------
DROP TABLE IF EXISTS `products_product_services`;
CREATE TABLE `products_product_services` (
  `service_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  KEY `products_services` (`service_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of products_product_services
-- ----------------------------

-- ----------------------------
-- Table structure for product_brands
-- ----------------------------
DROP TABLE IF EXISTS `product_brands`;
CREATE TABLE `product_brands` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` text COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_brands
-- ----------------------------

-- ----------------------------
-- Table structure for product_categories
-- ----------------------------
DROP TABLE IF EXISTS `product_categories`;
CREATE TABLE `product_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `depth` int(11) DEFAULT NULL,
  `products_count` int(10) unsigned NOT NULL DEFAULT '0',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `visible` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `product_categories_parent_id_index` (`parent_id`),
  KEY `product_categories_lft_index` (`lft`),
  KEY `product_categories_rgt_index` (`rgt`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_categories
-- ----------------------------
INSERT INTO `product_categories` VALUES ('16', '面部护理', null, null, '1', '4', '0', '0', '0', '2015-03-20 14:02:01', '2015-03-23 17:00:33', '1');
INSERT INTO `product_categories` VALUES ('17', '眼部护理', null, null, '5', '6', '0', '0', '0', '2015-03-20 14:02:11', '2015-03-23 17:00:33', '1');
INSERT INTO `product_categories` VALUES ('18', '身体护理', null, null, '7', '8', '0', '0', '0', '2015-03-20 14:02:22', '2015-03-23 17:00:33', '1');
INSERT INTO `product_categories` VALUES ('19', '特惠套装', null, null, '9', '10', '0', '0', '0', '2015-03-20 14:02:52', '2015-03-23 17:00:33', '1');
INSERT INTO `product_categories` VALUES ('20', '美白', '298', '16', '2', '3', '1', '0', '0', '2015-03-23 17:00:21', '2015-03-23 17:02:01', '1');

-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` text COLLATE utf8_unicode_ci,
  `reply` text COLLATE utf8_unicode_ci,
  `star` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `product_entity_id` int(10) unsigned NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_comments
-- ----------------------------
INSERT INTO `product_comments` VALUES ('1', '我有一个很叼的名字', '真的是不错的选择', null, '3', '3', '10', '1', '2015-03-12 14:19:56', '2015-03-12 14:19:56');
INSERT INTO `product_comments` VALUES ('2', '18922750941', '这个牌子的我很满意，也买了很多次了，下次会再来的', null, '3', '5', '15', '1', '2015-03-17 11:52:49', '2015-03-17 11:52:49');
INSERT INTO `product_comments` VALUES ('3', '13450483333', 'ok', null, '3', '4', '13', '4', '2015-03-19 17:40:24', '2015-03-19 17:40:24');
INSERT INTO `product_comments` VALUES ('4', '18922750941', '我是真的醉了', null, '3', '5', '19', '1', '2015-03-19 18:44:44', '2015-03-19 18:44:44');
INSERT INTO `product_comments` VALUES ('5', '18520254233', '买了很多次了，很满意', null, '3', '5', '20', '1', '2015-03-21 11:18:52', '2015-03-21 11:18:52');

-- ----------------------------
-- Table structure for product_default_option_values
-- ----------------------------
DROP TABLE IF EXISTS `product_default_option_values`;
CREATE TABLE `product_default_option_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `image_id` int(10) unsigned DEFAULT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_default_option_values
-- ----------------------------
INSERT INTO `product_default_option_values` VALUES ('1', '红色', '0', null, '1', '2015-03-21 10:59:49', '2015-03-21 10:59:58');
INSERT INTO `product_default_option_values` VALUES ('2', '紫色', '0', null, '1', '2015-03-21 10:59:58', '2015-03-21 10:59:58');
INSERT INTO `product_default_option_values` VALUES ('3', '30ml', '0', null, '2', '2015-03-23 10:24:48', '2015-03-23 10:24:48');

-- ----------------------------
-- Table structure for product_entities
-- ----------------------------
DROP TABLE IF EXISTS `product_entities`;
CREATE TABLE `product_entities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sku` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sale_price` decimal(8,2) NOT NULL,
  `stock` int(10) unsigned NOT NULL DEFAULT '0',
  `product_id` int(10) unsigned NOT NULL,
  `option_set` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `option_set_values` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mapping_option_set` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_entities
-- ----------------------------
INSERT INTO `product_entities` VALUES ('1', '3', '11.00', '2', '1', '|37|39|42|', '颜色:红色\n尺寸:S\n容量:100ML', '20000|20010|20020');
INSERT INTO `product_entities` VALUES ('2', '3', '11.00', '2', '1', '|37|40|42|', '颜色:红色\n尺寸:M\n容量:100ML', '20000|20011|20020');
INSERT INTO `product_entities` VALUES ('3', '3', '11.00', '2', '1', '|37|41|42|', '颜色:红色\n尺寸:L\n容量:100ML', '20000|20022|20020');
INSERT INTO `product_entities` VALUES ('4', '3', '11.00', '2', '1', '|38|39|42|', '颜色:黑色\n尺寸:S\n容量:100ML', '20001|20010|20020');
INSERT INTO `product_entities` VALUES ('5', '3', '11.00', '2', '1', '|38|40|42|', '颜色:黑色\n尺寸:M\n容量:100ML', '20001|20011|20020');
INSERT INTO `product_entities` VALUES ('6', '3', '11.00', '2', '1', '|38|41|42|', '颜色:黑色\n尺寸:L\n容量:100ML', '20001|20022|20020');
INSERT INTO `product_entities` VALUES ('7', '001', '0.01', '5', '2', '|43|', '容量:100ML', '20021');
INSERT INTO `product_entities` VALUES ('8', '002', '5.00', '5', '2', '|44|', '容量:200ML', '20021');
INSERT INTO `product_entities` VALUES ('9', '003', '10.00', '5', '2', '|45|', '容量:300ML', '20023');
INSERT INTO `product_entities` VALUES ('13', '007', '1.00', '10', '4', '|49|', '颜色:红色', '20000');
INSERT INTO `product_entities` VALUES ('14', '008', '1.00', '10', '4', '|50|', '颜色:黑色', '20001');
INSERT INTO `product_entities` VALUES ('18', '', '5.00', '10', '3', '|54|', '颜色:红色', '20000');
INSERT INTO `product_entities` VALUES ('21', '22', '0.01', '22', '5', '|57|', '颜色:红色', '1');
INSERT INTO `product_entities` VALUES ('22', 'DU6952711603299', '168.00', '1000', '7', '|58|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('23', 'du6952711603305', '168.00', '1000', '6', '|59|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('24', 'du6952711603282', '168.00', '9999', '8', '|60|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('25', 'du6952711603275', '168.00', '999', '9', '|61|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('26', 'du6952711603268', '168.00', '999', '10', '|62|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('27', 'du6952711602971', '168.00', '999', '11', '|63|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('28', 'du6952711602964', '168.00', '999', '12', '|64|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('29', 'du6952711602957', '168.00', '999', '13', '|65|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('30', 'du6952711602940', '268.00', '999', '14', '|66|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('31', 'du6952711603503', '298.00', '999', '15', '|67|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('32', 'du6952711603497', '198.00', '999', '16', '|68|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('33', 'du6952711603534', '76.00', '999', '17', '|69|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('34', 'du6952711603367', '78.00', '999', '18', '|70|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('35', 'DU6952711601424', '98.00', '999', '19', '|71|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('36', 'du6952711601448', '98.00', '899', '20', '|72|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('37', 'du6952711603619', '598.00', '999', '21', '|73|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('38', 'du6952711603398', '98.00', '999', '22', '|74|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('39', 'du6952711603473', '168.00', '999', '23', '|75|', '容量:30ml', '3');
INSERT INTO `product_entities` VALUES ('40', 'du6952711603466', '158.00', '999', '24', '|76|', '容量:30ml', '3');

-- ----------------------------
-- Table structure for product_images_products
-- ----------------------------
DROP TABLE IF EXISTS `product_images_products`;
CREATE TABLE `product_images_products` (
  `image_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  KEY `images_products` (`image_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_images_products
-- ----------------------------
INSERT INTO `product_images_products` VALUES ('182', '1');
INSERT INTO `product_images_products` VALUES ('228', '5');
INSERT INTO `product_images_products` VALUES ('229', '4');
INSERT INTO `product_images_products` VALUES ('230', '3');
INSERT INTO `product_images_products` VALUES ('231', '2');
INSERT INTO `product_images_products` VALUES ('248', '6');
INSERT INTO `product_images_products` VALUES ('251', '7');
INSERT INTO `product_images_products` VALUES ('258', '8');
INSERT INTO `product_images_products` VALUES ('264', '9');
INSERT INTO `product_images_products` VALUES ('266', '10');
INSERT INTO `product_images_products` VALUES ('267', '10');
INSERT INTO `product_images_products` VALUES ('268', '10');
INSERT INTO `product_images_products` VALUES ('269', '10');
INSERT INTO `product_images_products` VALUES ('270', '10');
INSERT INTO `product_images_products` VALUES ('275', '11');
INSERT INTO `product_images_products` VALUES ('277', '12');
INSERT INTO `product_images_products` VALUES ('280', '13');
INSERT INTO `product_images_products` VALUES ('282', '14');
INSERT INTO `product_images_products` VALUES ('286', '15');
INSERT INTO `product_images_products` VALUES ('287', '16');
INSERT INTO `product_images_products` VALUES ('290', '17');
INSERT INTO `product_images_products` VALUES ('295', '18');
INSERT INTO `product_images_products` VALUES ('296', '19');
INSERT INTO `product_images_products` VALUES ('299', '20');
INSERT INTO `product_images_products` VALUES ('302', '21');
INSERT INTO `product_images_products` VALUES ('304', '22');
INSERT INTO `product_images_products` VALUES ('306', '23');
INSERT INTO `product_images_products` VALUES ('308', '24');
INSERT INTO `product_images_products` VALUES ('308', '25');

-- ----------------------------
-- Table structure for product_options
-- ----------------------------
DROP TABLE IF EXISTS `product_options`;
CREATE TABLE `product_options` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_options
-- ----------------------------
INSERT INTO `product_options` VALUES ('1', '颜色', '2015-03-21 10:59:36', '2015-03-21 10:59:36');
INSERT INTO `product_options` VALUES ('2', '容量', '2015-03-23 10:24:48', '2015-03-23 10:24:48');

-- ----------------------------
-- Table structure for product_options_products
-- ----------------------------
DROP TABLE IF EXISTS `product_options_products`;
CREATE TABLE `product_options_products` (
  `product_id` int(10) unsigned NOT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `option_value_id` int(10) unsigned NOT NULL,
  KEY `options_products` (`product_id`,`option_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_options_products
-- ----------------------------
INSERT INTO `product_options_products` VALUES ('101', '10020', '30');
INSERT INTO `product_options_products` VALUES ('101', '10020', '32');
INSERT INTO `product_options_products` VALUES ('96', '10000', '33');
INSERT INTO `product_options_products` VALUES ('96', '10010', '34');
INSERT INTO `product_options_products` VALUES ('96', '10010', '35');
INSERT INTO `product_options_products` VALUES ('96', '10020', '36');
INSERT INTO `product_options_products` VALUES ('1', '10000', '37');
INSERT INTO `product_options_products` VALUES ('1', '10000', '38');
INSERT INTO `product_options_products` VALUES ('1', '10010', '39');
INSERT INTO `product_options_products` VALUES ('1', '10010', '40');
INSERT INTO `product_options_products` VALUES ('1', '10010', '41');
INSERT INTO `product_options_products` VALUES ('1', '10020', '42');
INSERT INTO `product_options_products` VALUES ('2', '10020', '43');
INSERT INTO `product_options_products` VALUES ('2', '10020', '44');
INSERT INTO `product_options_products` VALUES ('2', '10020', '45');
INSERT INTO `product_options_products` VALUES ('4', '10000', '49');
INSERT INTO `product_options_products` VALUES ('4', '10000', '50');
INSERT INTO `product_options_products` VALUES ('3', '10000', '54');
INSERT INTO `product_options_products` VALUES ('5', '1', '57');
INSERT INTO `product_options_products` VALUES ('7', '2', '58');
INSERT INTO `product_options_products` VALUES ('6', '2', '59');
INSERT INTO `product_options_products` VALUES ('8', '2', '60');
INSERT INTO `product_options_products` VALUES ('9', '2', '61');
INSERT INTO `product_options_products` VALUES ('10', '2', '62');
INSERT INTO `product_options_products` VALUES ('11', '2', '63');
INSERT INTO `product_options_products` VALUES ('12', '2', '64');
INSERT INTO `product_options_products` VALUES ('13', '2', '65');
INSERT INTO `product_options_products` VALUES ('14', '2', '66');
INSERT INTO `product_options_products` VALUES ('15', '2', '67');
INSERT INTO `product_options_products` VALUES ('16', '2', '68');
INSERT INTO `product_options_products` VALUES ('17', '2', '69');
INSERT INTO `product_options_products` VALUES ('18', '2', '70');
INSERT INTO `product_options_products` VALUES ('19', '2', '71');
INSERT INTO `product_options_products` VALUES ('20', '2', '72');
INSERT INTO `product_options_products` VALUES ('21', '2', '73');
INSERT INTO `product_options_products` VALUES ('22', '2', '74');
INSERT INTO `product_options_products` VALUES ('23', '2', '75');
INSERT INTO `product_options_products` VALUES ('24', '2', '76');
INSERT INTO `product_options_products` VALUES ('25', '1', '77');
INSERT INTO `product_options_products` VALUES ('25', '2', '78');

-- ----------------------------
-- Table structure for product_option_values
-- ----------------------------
DROP TABLE IF EXISTS `product_option_values`;
CREATE TABLE `product_option_values` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `image_id` int(10) unsigned DEFAULT NULL,
  `option_id` int(10) unsigned NOT NULL,
  `mapping_value_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_option_values
-- ----------------------------
INSERT INTO `product_option_values` VALUES ('30', '100ML', '0', null, '10020', '20020', '2015-03-05 14:16:09', '2015-03-05 14:16:09');
INSERT INTO `product_option_values` VALUES ('32', '300ML', '0', null, '10020', '20023', '2015-03-05 14:16:09', '2015-03-05 14:16:09');
INSERT INTO `product_option_values` VALUES ('33', '红色', '0', null, '10000', '20000', '2015-03-09 09:40:29', '2015-03-09 09:40:29');
INSERT INTO `product_option_values` VALUES ('34', 'S', '0', null, '10010', '20010', '2015-03-09 09:40:29', '2015-03-09 09:40:29');
INSERT INTO `product_option_values` VALUES ('35', 'M', '0', null, '10010', '20011', '2015-03-09 09:40:29', '2015-03-09 09:40:29');
INSERT INTO `product_option_values` VALUES ('36', '200ML', '0', null, '10020', '20021', '2015-03-09 09:40:29', '2015-03-09 09:40:29');
INSERT INTO `product_option_values` VALUES ('37', '红色', '0', null, '10000', '20000', '2015-03-11 14:16:11', '2015-03-11 14:16:11');
INSERT INTO `product_option_values` VALUES ('38', '黑色', '0', null, '10000', '20001', '2015-03-11 14:16:11', '2015-03-11 14:16:11');
INSERT INTO `product_option_values` VALUES ('39', 'S', '0', null, '10010', '20010', '2015-03-11 14:16:11', '2015-03-11 14:16:11');
INSERT INTO `product_option_values` VALUES ('40', 'M', '0', null, '10010', '20011', '2015-03-11 14:16:11', '2015-03-11 14:16:11');
INSERT INTO `product_option_values` VALUES ('41', 'L', '0', null, '10010', '20022', '2015-03-11 14:16:11', '2015-03-11 14:16:11');
INSERT INTO `product_option_values` VALUES ('42', '100ML', '0', null, '10020', '20020', '2015-03-11 14:16:11', '2015-03-11 14:16:11');
INSERT INTO `product_option_values` VALUES ('43', '100ML', '0', null, '10020', '20020', '2015-03-11 14:18:59', '2015-03-11 14:18:59');
INSERT INTO `product_option_values` VALUES ('44', '200ML', '0', null, '10020', '20021', '2015-03-11 14:18:59', '2015-03-11 14:18:59');
INSERT INTO `product_option_values` VALUES ('45', '300ML', '0', null, '10020', '20023', '2015-03-11 14:18:59', '2015-03-11 14:18:59');
INSERT INTO `product_option_values` VALUES ('49', '红色', '0', null, '10000', '20000', '2015-03-11 15:27:14', '2015-03-11 15:27:14');
INSERT INTO `product_option_values` VALUES ('50', '黑色', '0', null, '10000', '20001', '2015-03-11 15:27:14', '2015-03-11 15:27:14');
INSERT INTO `product_option_values` VALUES ('54', '红色', '0', null, '10000', '20000', '2015-03-19 17:21:36', '2015-03-19 17:21:36');
INSERT INTO `product_option_values` VALUES ('57', '红色', '0', null, '1', '1', '2015-03-21 11:00:48', '2015-03-21 11:00:48');
INSERT INTO `product_option_values` VALUES ('58', '30ml', '0', null, '2', '3', '2015-03-23 10:26:34', '2015-03-23 10:26:34');
INSERT INTO `product_option_values` VALUES ('59', '30ml', '0', null, '2', '3', '2015-03-23 10:27:41', '2015-03-23 10:27:41');
INSERT INTO `product_option_values` VALUES ('60', '30ml', '0', null, '2', '3', '2015-03-23 11:07:16', '2015-03-23 11:07:16');
INSERT INTO `product_option_values` VALUES ('61', '30ml', '0', null, '2', '3', '2015-03-23 11:16:35', '2015-03-23 11:16:35');
INSERT INTO `product_option_values` VALUES ('62', '30ml', '0', null, '2', '3', '2015-03-23 11:19:10', '2015-03-23 11:19:10');
INSERT INTO `product_option_values` VALUES ('63', '30ml', '0', null, '2', '3', '2015-03-23 11:34:53', '2015-03-23 11:34:53');
INSERT INTO `product_option_values` VALUES ('64', '30ml', '0', null, '2', '3', '2015-03-23 11:37:03', '2015-03-23 11:37:03');
INSERT INTO `product_option_values` VALUES ('65', '30ml', '0', null, '2', '3', '2015-03-23 11:43:24', '2015-03-23 11:43:24');
INSERT INTO `product_option_values` VALUES ('66', '30ml', '0', null, '2', '3', '2015-03-23 11:52:28', '2015-03-23 11:52:28');
INSERT INTO `product_option_values` VALUES ('67', '30ml', '0', null, '2', '3', '2015-03-23 11:56:29', '2015-03-23 11:56:29');
INSERT INTO `product_option_values` VALUES ('68', '30ml', '0', null, '2', '3', '2015-03-23 11:59:15', '2015-03-23 11:59:15');
INSERT INTO `product_option_values` VALUES ('69', '30ml', '0', null, '2', '3', '2015-03-23 12:35:22', '2015-03-23 12:35:22');
INSERT INTO `product_option_values` VALUES ('70', '30ml', '0', null, '2', '3', '2015-03-23 16:48:30', '2015-03-23 16:48:30');
INSERT INTO `product_option_values` VALUES ('71', '30ml', '0', null, '2', '3', '2015-03-23 17:01:31', '2015-03-23 17:01:31');
INSERT INTO `product_option_values` VALUES ('72', '30ml', '0', null, '2', '3', '2015-03-23 17:11:19', '2015-03-23 17:11:19');
INSERT INTO `product_option_values` VALUES ('73', '30ml', '0', null, '2', '3', '2015-03-23 17:19:57', '2015-03-23 17:19:57');
INSERT INTO `product_option_values` VALUES ('74', '30ml', '0', null, '2', '3', '2015-03-23 17:26:06', '2015-03-23 17:26:06');
INSERT INTO `product_option_values` VALUES ('75', '30ml', '0', null, '2', '3', '2015-03-23 17:36:57', '2015-03-23 17:36:57');
INSERT INTO `product_option_values` VALUES ('76', '30ml', '0', null, '2', '3', '2015-03-23 17:46:50', '2015-03-23 17:46:50');
INSERT INTO `product_option_values` VALUES ('77', '红色', '0', null, '1', '1', '2015-04-16 14:24:10', '2015-04-16 14:24:10');
INSERT INTO `product_option_values` VALUES ('78', '30ml', '0', null, '2', '3', '2015-04-16 14:24:10', '2015-04-16 14:24:10');

-- ----------------------------
-- Table structure for product_products_services
-- ----------------------------
DROP TABLE IF EXISTS `product_products_services`;
CREATE TABLE `product_products_services` (
  `service_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  KEY `products_services` (`service_id`,`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_products_services
-- ----------------------------

-- ----------------------------
-- Table structure for product_profits
-- ----------------------------
DROP TABLE IF EXISTS `product_profits`;
CREATE TABLE `product_profits` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `first` int(11) NOT NULL DEFAULT '0',
  `two` int(11) NOT NULL DEFAULT '0',
  `three` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_profits
-- ----------------------------
INSERT INTO `product_profits` VALUES ('1', '分润方案1', '5', '10', '15', '2015-04-16 11:43:40', '2015-04-16 11:43:40');
INSERT INTO `product_profits` VALUES ('2', '分润方案2', '1', '2', '3', '2015-04-16 12:05:08', '2015-04-16 12:05:08');

-- ----------------------------
-- Table structure for product_services
-- ----------------------------
DROP TABLE IF EXISTS `product_services`;
CREATE TABLE `product_services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product_services
-- ----------------------------
INSERT INTO `product_services` VALUES ('1', '七天退货', '七天内不满意无条件退货', '2015-03-04 11:21:20', '2015-03-04 11:21:20');
INSERT INTO `product_services` VALUES ('2', '限时送达', '保证3天内送达', '2015-03-04 11:21:20', '2015-03-04 11:21:20');

-- ----------------------------
-- Table structure for recommend_products
-- ----------------------------
DROP TABLE IF EXISTS `recommend_products`;
CREATE TABLE `recommend_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `position` int(11) NOT NULL DEFAULT '0',
  `skin_check_result` int(11) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of recommend_products
-- ----------------------------

-- ----------------------------
-- Table structure for regions
-- ----------------------------
DROP TABLE IF EXISTS `regions`;
CREATE TABLE `regions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `province_id` int(11) NOT NULL DEFAULT '0',
  `city_id` int(11) NOT NULL DEFAULT '0',
  `district_id` int(11) NOT NULL DEFAULT '0',
  `postcode` char(31) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sort_order` int(9) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_locations_on_city_id` (`city_id`) USING BTREE,
  KEY `index_locations_on_country_id` (`country_id`) USING BTREE,
  KEY `index_locations_on_district_id` (`district_id`) USING BTREE,
  KEY `index_locations_on_province_id` (`province_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3502 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of regions
-- ----------------------------
INSERT INTO `regions` VALUES ('1', '江苏省', '1', '0', '0', '0', '320000', '0', '2014-06-04 04:51:13', '2014-06-04 04:51:13');
INSERT INTO `regions` VALUES ('2', '南京市', '1', '1', '0', '0', '320100', '0', '2014-06-04 04:51:13', '2014-06-04 04:51:13');
INSERT INTO `regions` VALUES ('3', '玄武区', '1', '1', '2', '0', '320102', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('4', '白下区', '1', '1', '2', '0', '320103', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('5', '秦淮区', '1', '1', '2', '0', '320104', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('6', '建邺区', '1', '1', '2', '0', '320105', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('7', '鼓楼区', '1', '1', '2', '0', '320106', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('8', '下关区', '1', '1', '2', '0', '320107', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('9', '浦口区', '1', '1', '2', '0', '320111', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('10', '栖霞区', '1', '1', '2', '0', '320113', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('11', '雨花台区', '1', '1', '2', '0', '320114', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('12', '江宁区', '1', '1', '2', '0', '320115', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('13', '六合区', '1', '1', '2', '0', '320116', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('14', '溧水县', '1', '1', '2', '0', '320124', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('15', '高淳县', '1', '1', '2', '0', '320125', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('16', '无锡市', '1', '1', '0', '0', '320200', '0', '2014-06-04 04:51:13', '2014-06-04 04:51:13');
INSERT INTO `regions` VALUES ('17', '崇安区', '1', '1', '16', '0', '320202', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('18', '南长区', '1', '1', '16', '0', '320203', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('19', '北塘区', '1', '1', '16', '0', '320204', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('20', '锡山区', '1', '1', '16', '0', '320205', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('21', '惠山区', '1', '1', '16', '0', '320206', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('22', '滨湖区', '1', '1', '16', '0', '320211', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('23', '无锡新区', '1', '1', '16', '0', '320212', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('24', '江阴市', '1', '1', '16', '0', '320281', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('25', '宜兴市', '1', '1', '16', '0', '320282', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('26', '徐州市', '1', '1', '0', '0', '320300', '0', '2014-06-04 04:51:13', '2014-06-04 04:51:13');
INSERT INTO `regions` VALUES ('27', '鼓楼区', '1', '1', '26', '0', '320302', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('28', '云龙区', '1', '1', '26', '0', '320303', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('29', '九里区', '1', '1', '26', '0', '320304', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('30', '贾汪区', '1', '1', '26', '0', '320305', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('31', '泉山区', '1', '1', '26', '0', '320311', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('32', '铜山区', '1', '1', '26', '0', '320312', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('33', '丰县', '1', '1', '26', '0', '320321', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('34', '沛县', '1', '1', '26', '0', '320322', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('35', '睢宁县', '1', '1', '26', '0', '320324', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:51');
INSERT INTO `regions` VALUES ('36', '新沂市', '1', '1', '26', '0', '320381', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('37', '邳州市', '1', '1', '26', '0', '320382', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('38', '经济开发区', '1', '1', '26', '0', '3203a1', '0', '2014-06-04 04:51:13', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('39', '常州市', '1', '1', '0', '0', '320400', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('40', '天宁区', '1', '1', '39', '0', '320402', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('41', '钟楼区', '1', '1', '39', '0', '320404', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('42', '戚墅堰区', '1', '1', '39', '0', '320405', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('43', '新北区', '1', '1', '39', '0', '320411', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('44', '武进区', '1', '1', '39', '0', '320412', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('45', '溧阳市', '1', '1', '39', '0', '320481', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('46', '金坛市', '1', '1', '39', '0', '320482', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('47', '苏州市', '1', '1', '0', '0', '320500', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('48', '沧浪区', '1', '1', '47', '0', '320502', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('49', '平江区', '1', '1', '47', '0', '320503', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('50', '金阊区', '1', '1', '47', '0', '320504', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('51', '虎丘区', '1', '1', '47', '0', '320505', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('52', '吴中区', '1', '1', '47', '0', '320506', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('53', '相城区', '1', '1', '47', '0', '320507', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('54', '姑苏区', '1', '1', '47', '0', '320508', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('55', '工业园区', '1', '1', '47', '0', '320509', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('56', '常熟市', '1', '1', '47', '0', '320581', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('57', '张家港市', '1', '1', '47', '0', '320582', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('58', '昆山市', '1', '1', '47', '0', '320583', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('59', '吴江市', '1', '1', '47', '0', '320584', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('60', '太仓市', '1', '1', '47', '0', '320585', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('61', '南通市', '1', '1', '0', '0', '320600', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('62', '崇川区', '1', '1', '61', '0', '320602', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('63', '港闸区', '1', '1', '61', '0', '320611', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('64', '通州区', '1', '1', '61', '0', '320612', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('65', '海安县', '1', '1', '61', '0', '320621', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('66', '如东县', '1', '1', '61', '0', '320623', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('67', '启东市', '1', '1', '61', '0', '320681', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('68', '如皋市', '1', '1', '61', '0', '320682', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('69', '海门市', '1', '1', '61', '0', '320684', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('70', '开发区', '1', '1', '61', '0', '320685', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('71', '开发区', '1', '1', '61', '0', '3206a1', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('72', '连云港市', '1', '1', '0', '0', '320700', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('73', '连云区', '1', '1', '72', '0', '320703', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('74', '新浦区', '1', '1', '72', '0', '320705', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('75', '海州区', '1', '1', '72', '0', '320706', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('76', '开发区', '1', '1', '72', '0', '320707', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('77', '科教园区', '1', '1', '72', '0', '320708', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('78', '徐圩新区', '1', '1', '72', '0', '320709', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('79', '赣榆县', '1', '1', '72', '0', '320721', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('80', '东海县', '1', '1', '72', '0', '320722', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('81', '灌云县', '1', '1', '72', '0', '320723', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('82', '灌南县', '1', '1', '72', '0', '320724', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('83', '淮安市', '1', '1', '0', '0', '320800', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('84', '清河区', '1', '1', '83', '0', '320802', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('85', '淮安区', '1', '1', '83', '0', '320803', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('86', '淮阴区', '1', '1', '83', '0', '320804', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('87', '清浦区', '1', '1', '83', '0', '320811', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('88', '经济技术开发区', '1', '1', '83', '0', '320812', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('89', '工业园区', '1', '1', '83', '0', '320813', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('90', '涟水县', '1', '1', '83', '0', '320826', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('91', '洪泽县', '1', '1', '83', '0', '320829', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('92', '盱眙县', '1', '1', '83', '0', '320830', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('93', '金湖县', '1', '1', '83', '0', '320831', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('94', '盐城市', '1', '1', '0', '0', '320900', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('95', '亭湖区', '1', '1', '94', '0', '320902', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('96', '盐都区', '1', '1', '94', '0', '320903', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('97', '开发区', '1', '1', '94', '0', '320904', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('98', '城南新区', '1', '1', '94', '0', '320905', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('99', '响水县', '1', '1', '94', '0', '320921', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('100', '滨海县', '1', '1', '94', '0', '320922', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('101', '阜宁县', '1', '1', '94', '0', '320923', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('102', '射阳县', '1', '1', '94', '0', '320924', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('103', '建湖县', '1', '1', '94', '0', '320925', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('104', '东台市', '1', '1', '94', '0', '320981', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('105', '大丰市', '1', '1', '94', '0', '320982', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('106', '扬州市', '1', '1', '0', '0', '321000', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('107', '广陵区', '1', '1', '106', '0', '321002', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('108', '邗江区', '1', '1', '106', '0', '321003', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('109', '江都区', '1', '1', '106', '0', '321012', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('110', '宝应县', '1', '1', '106', '0', '321023', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('111', '仪征市', '1', '1', '106', '0', '321081', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('112', '高邮市', '1', '1', '106', '0', '321084', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('113', '开发区', '1', '1', '106', '0', '3210a1', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('114', '镇江市', '1', '1', '0', '0', '321100', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('115', '京口区', '1', '1', '114', '0', '321102', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('116', '润州区', '1', '1', '114', '0', '321111', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('117', '丹徒区', '1', '1', '114', '0', '321112', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('118', '丹阳市', '1', '1', '114', '0', '321181', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('119', '扬中市', '1', '1', '114', '0', '321182', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('120', '句容市', '1', '1', '114', '0', '321183', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('121', '泰州市', '1', '1', '0', '0', '321200', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('122', '海陵区', '1', '1', '121', '0', '321202', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('123', '高港区', '1', '1', '121', '0', '321203', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('124', '医药高新区', '1', '1', '121', '0', '321204', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('125', '兴化市', '1', '1', '121', '0', '321281', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('126', '靖江市', '1', '1', '121', '0', '321282', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('127', '泰兴市', '1', '1', '121', '0', '321283', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('128', '姜堰区', '1', '1', '121', '0', '321284', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('129', '宿迁市', '1', '1', '0', '0', '321300', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('130', '宿城区', '1', '1', '129', '0', '321302', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('131', '宿豫区', '1', '1', '129', '0', '321311', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('132', '经济开发区', '1', '1', '129', '0', '321312', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('133', '骆马湖现代生态农业示范区', '1', '1', '129', '0', '321313', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('134', '苏宿工业园区', '1', '1', '129', '0', '321314', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('135', '宿豫区', '1', '1', '129', '0', '321320', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('136', '沭阳县', '1', '1', '129', '0', '321322', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('137', '泗阳县', '1', '1', '129', '0', '321323', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('138', '泗洪县', '1', '1', '129', '0', '321324', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('139', '洋河新城', '1', '1', '129', '0', '321325', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('140', '北京市', '1', '0', '0', '0', '110000', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('141', '东城区', '1', '140', '3499', '0', '110101', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('142', '西城区', '1', '140', '3499', '0', '110102', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('143', '朝阳区', '1', '140', '3499', '0', '110105', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('144', '丰台区', '1', '140', '3499', '0', '110106', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('145', '石景山区', '1', '140', '3499', '0', '110107', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('146', '海淀区', '1', '140', '3499', '0', '110108', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('147', '门头沟区', '1', '140', '3499', '0', '110109', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('148', '房山区', '1', '140', '3499', '0', '110111', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('149', '通州区', '1', '140', '3499', '0', '110112', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('150', '顺义区', '1', '140', '3499', '0', '110113', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('151', '昌平区', '1', '140', '3499', '0', '110114', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('152', '大兴区', '1', '140', '3499', '0', '110115', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('153', '怀柔区', '1', '140', '3499', '0', '110116', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('154', '平谷区', '1', '140', '3499', '0', '110117', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('155', '密云县', '1', '140', '3499', '0', '110228', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('156', '延庆县', '1', '140', '3499', '0', '110229', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('157', '天津市', '1', '0', '0', '0', '120000', '0', '2014-06-04 04:51:14', '2014-06-04 04:51:14');
INSERT INTO `regions` VALUES ('158', '和平区', '1', '157', '3500', '0', '120101', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('159', '河东区', '1', '157', '3500', '0', '120102', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('160', '河西区', '1', '157', '3500', '0', '120103', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('161', '南开区', '1', '157', '3500', '0', '120104', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('162', '河北区', '1', '157', '3500', '0', '120105', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('163', '红桥区', '1', '157', '3500', '0', '120106', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('164', '东丽区', '1', '157', '3500', '0', '120110', '0', '2014-06-04 04:51:14', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('165', '西青区', '1', '157', '3500', '0', '120111', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('166', '津南区', '1', '157', '3500', '0', '120112', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('167', '北辰区', '1', '157', '3500', '0', '120113', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('168', '武清区', '1', '157', '3500', '0', '120114', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('169', '宝坻区', '1', '157', '3500', '0', '120115', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('170', '滨海新区', '1', '157', '3500', '0', '120116', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('171', '宁河县', '1', '157', '3500', '0', '120221', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('172', '静海县', '1', '157', '3500', '0', '120223', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('173', '蓟县', '1', '157', '3500', '0', '120225', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('174', '河北省', '1', '0', '0', '0', '130000', '0', '2014-06-04 04:51:15', '2014-06-04 04:51:15');
INSERT INTO `regions` VALUES ('175', '石家庄市', '1', '174', '0', '0', '130100', '0', '2014-06-04 04:51:15', '2014-06-04 04:51:15');
INSERT INTO `regions` VALUES ('176', '长安区', '1', '174', '175', '0', '130102', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('177', '桥东区', '1', '174', '175', '0', '130103', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('178', '桥西区', '1', '174', '175', '0', '130104', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('179', '新华区', '1', '174', '175', '0', '130105', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('180', '井陉矿区', '1', '174', '175', '0', '130107', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('181', '裕华区', '1', '174', '175', '0', '130108', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('182', '井陉县', '1', '174', '175', '0', '130121', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('183', '正定县', '1', '174', '175', '0', '130123', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('184', '栾城县', '1', '174', '175', '0', '130124', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('185', '行唐县', '1', '174', '175', '0', '130125', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('186', '灵寿县', '1', '174', '175', '0', '130126', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('187', '高邑县', '1', '174', '175', '0', '130127', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('188', '深泽县', '1', '174', '175', '0', '130128', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('189', '赞皇县', '1', '174', '175', '0', '130129', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('190', '无极县', '1', '174', '175', '0', '130130', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('191', '平山县', '1', '174', '175', '0', '130131', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('192', '元氏县', '1', '174', '175', '0', '130132', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('193', '赵县', '1', '174', '175', '0', '130133', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('194', '辛集市', '1', '174', '175', '0', '130181', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('195', '藁城市', '1', '174', '175', '0', '130182', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('196', '晋州市', '1', '174', '175', '0', '130183', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('197', '新乐市', '1', '174', '175', '0', '130184', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('198', '鹿泉市', '1', '174', '175', '0', '130185', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('199', '唐山市', '1', '174', '0', '0', '130200', '0', '2014-06-04 04:51:15', '2014-06-04 04:51:15');
INSERT INTO `regions` VALUES ('200', '路南区', '1', '174', '199', '0', '130202', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('201', '路北区', '1', '174', '199', '0', '130203', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('202', '古冶区', '1', '174', '199', '0', '130204', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('203', '开平区', '1', '174', '199', '0', '130205', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('204', '丰南区', '1', '174', '199', '0', '130207', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('205', '丰润区', '1', '174', '199', '0', '130208', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('206', '滦县', '1', '174', '199', '0', '130223', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:52');
INSERT INTO `regions` VALUES ('207', '滦南县', '1', '174', '199', '0', '130224', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('208', '乐亭县', '1', '174', '199', '0', '130225', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('209', '迁西县', '1', '174', '199', '0', '130227', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('210', '玉田县', '1', '174', '199', '0', '130229', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('211', '唐海县', '1', '174', '199', '0', '130230', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('212', '遵化市', '1', '174', '199', '0', '130281', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('213', '迁安市', '1', '174', '199', '0', '130283', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('214', '秦皇岛市', '1', '174', '0', '0', '130300', '0', '2014-06-04 04:51:15', '2014-06-04 04:51:15');
INSERT INTO `regions` VALUES ('215', '海港区', '1', '174', '214', '0', '130302', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('216', '山海关区', '1', '174', '214', '0', '130303', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('217', '北戴河区', '1', '174', '214', '0', '130304', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('218', '青龙满族自治县', '1', '174', '214', '0', '130321', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('219', '昌黎县', '1', '174', '214', '0', '130322', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('220', '抚宁县', '1', '174', '214', '0', '130323', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('221', '卢龙县', '1', '174', '214', '0', '130324', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('222', '邯郸市', '1', '174', '0', '0', '130400', '0', '2014-06-04 04:51:15', '2014-06-04 04:51:15');
INSERT INTO `regions` VALUES ('223', '邯山区', '1', '174', '222', '0', '130402', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('224', '丛台区', '1', '174', '222', '0', '130403', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('225', '复兴区', '1', '174', '222', '0', '130404', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('226', '峰峰矿区', '1', '174', '222', '0', '130406', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('227', '邯郸县', '1', '174', '222', '0', '130421', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('228', '临漳县', '1', '174', '222', '0', '130423', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('229', '成安县', '1', '174', '222', '0', '130424', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('230', '大名县', '1', '174', '222', '0', '130425', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('231', '涉县', '1', '174', '222', '0', '130426', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('232', '磁县', '1', '174', '222', '0', '130427', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('233', '肥乡县', '1', '174', '222', '0', '130428', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('234', '永年县', '1', '174', '222', '0', '130429', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('235', '邱县', '1', '174', '222', '0', '130430', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('236', '鸡泽县', '1', '174', '222', '0', '130431', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('237', '广平县', '1', '174', '222', '0', '130432', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('238', '馆陶县', '1', '174', '222', '0', '130433', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('239', '魏县', '1', '174', '222', '0', '130434', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('240', '曲周县', '1', '174', '222', '0', '130435', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('241', '武安市', '1', '174', '222', '0', '130481', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('242', '邢台市', '1', '174', '0', '0', '130500', '0', '2014-06-04 04:51:15', '2014-06-04 04:51:15');
INSERT INTO `regions` VALUES ('243', '桥东区', '1', '174', '242', '0', '130502', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('244', '桥西区', '1', '174', '242', '0', '130503', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('245', '邢台县', '1', '174', '242', '0', '130521', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('246', '临城县', '1', '174', '242', '0', '130522', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('247', '内丘县', '1', '174', '242', '0', '130523', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('248', '柏乡县', '1', '174', '242', '0', '130524', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('249', '隆尧县', '1', '174', '242', '0', '130525', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('250', '任县', '1', '174', '242', '0', '130526', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('251', '南和县', '1', '174', '242', '0', '130527', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('252', '宁晋县', '1', '174', '242', '0', '130528', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('253', '巨鹿县', '1', '174', '242', '0', '130529', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('254', '新河县', '1', '174', '242', '0', '130530', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('255', '广宗县', '1', '174', '242', '0', '130531', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('256', '平乡县', '1', '174', '242', '0', '130532', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('257', '威县', '1', '174', '242', '0', '130533', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('258', '清河县', '1', '174', '242', '0', '130534', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('259', '临西县', '1', '174', '242', '0', '130535', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('260', '南宫市', '1', '174', '242', '0', '130581', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('261', '沙河市', '1', '174', '242', '0', '130582', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('262', '保定市', '1', '174', '0', '0', '130600', '0', '2014-06-04 04:51:15', '2014-06-04 04:51:15');
INSERT INTO `regions` VALUES ('263', '新市区', '1', '174', '262', '0', '130602', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('264', '北市区', '1', '174', '262', '0', '130603', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('265', '南市区', '1', '174', '262', '0', '130604', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('266', '满城县', '1', '174', '262', '0', '130621', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('267', '清苑县', '1', '174', '262', '0', '130622', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('268', '涞水县', '1', '174', '262', '0', '130623', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('269', '阜平县', '1', '174', '262', '0', '130624', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('270', '徐水县', '1', '174', '262', '0', '130625', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('271', '定兴县', '1', '174', '262', '0', '130626', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('272', '唐县', '1', '174', '262', '0', '130627', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('273', '高阳县', '1', '174', '262', '0', '130628', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('274', '容城县', '1', '174', '262', '0', '130629', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('275', '涞源县', '1', '174', '262', '0', '130630', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('276', '望都县', '1', '174', '262', '0', '130631', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('277', '安新县', '1', '174', '262', '0', '130632', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('278', '易县', '1', '174', '262', '0', '130633', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('279', '曲阳县', '1', '174', '262', '0', '130634', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('280', '蠡县', '1', '174', '262', '0', '130635', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('281', '顺平县', '1', '174', '262', '0', '130636', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('282', '博野县', '1', '174', '262', '0', '130637', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('283', '雄县', '1', '174', '262', '0', '130638', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('284', '涿州市', '1', '174', '262', '0', '130681', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('285', '定州市', '1', '174', '262', '0', '130682', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('286', '安国市', '1', '174', '262', '0', '130683', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('287', '高碑店市', '1', '174', '262', '0', '130684', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('288', '张家口市', '1', '174', '0', '0', '130700', '0', '2014-06-04 04:51:15', '2014-06-04 04:51:15');
INSERT INTO `regions` VALUES ('289', '桥东区', '1', '174', '288', '0', '130702', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('290', '桥西区', '1', '174', '288', '0', '130703', '0', '2014-06-04 04:51:15', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('291', '宣化区', '1', '174', '288', '0', '130705', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('292', '下花园区', '1', '174', '288', '0', '130706', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('293', '宣化县', '1', '174', '288', '0', '130721', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('294', '张北县', '1', '174', '288', '0', '130722', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('295', '康保县', '1', '174', '288', '0', '130723', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('296', '沽源县', '1', '174', '288', '0', '130724', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('297', '尚义县', '1', '174', '288', '0', '130725', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('298', '蔚县', '1', '174', '288', '0', '130726', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('299', '阳原县', '1', '174', '288', '0', '130727', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('300', '怀安县', '1', '174', '288', '0', '130728', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('301', '万全县', '1', '174', '288', '0', '130729', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('302', '怀来县', '1', '174', '288', '0', '130730', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('303', '涿鹿县', '1', '174', '288', '0', '130731', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('304', '赤城县', '1', '174', '288', '0', '130732', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('305', '崇礼县', '1', '174', '288', '0', '130733', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('306', '承德市', '1', '174', '0', '0', '130800', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('307', '双桥区', '1', '174', '306', '0', '130802', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('308', '双滦区', '1', '174', '306', '0', '130803', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('309', '鹰手营子矿区', '1', '174', '306', '0', '130804', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('310', '承德县', '1', '174', '306', '0', '130821', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('311', '兴隆县', '1', '174', '306', '0', '130822', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('312', '平泉县', '1', '174', '306', '0', '130823', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('313', '滦平县', '1', '174', '306', '0', '130824', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('314', '隆化县', '1', '174', '306', '0', '130825', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('315', '丰宁满族自治县', '1', '174', '306', '0', '130826', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('316', '宽城满族自治县', '1', '174', '306', '0', '130827', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('317', '围场满族蒙古族自治县', '1', '174', '306', '0', '130828', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('318', '沧州市', '1', '174', '0', '0', '130900', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('319', '新华区', '1', '174', '318', '0', '130902', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('320', '运河区', '1', '174', '318', '0', '130903', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('321', '沧县', '1', '174', '318', '0', '130921', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('322', '青县', '1', '174', '318', '0', '130922', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('323', '东光县', '1', '174', '318', '0', '130923', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('324', '海兴县', '1', '174', '318', '0', '130924', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('325', '盐山县', '1', '174', '318', '0', '130925', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('326', '肃宁县', '1', '174', '318', '0', '130926', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('327', '南皮县', '1', '174', '318', '0', '130927', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('328', '吴桥县', '1', '174', '318', '0', '130928', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('329', '献县', '1', '174', '318', '0', '130929', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('330', '孟村回族自治县', '1', '174', '318', '0', '130930', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('331', '泊头市', '1', '174', '318', '0', '130981', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('332', '任丘市', '1', '174', '318', '0', '130982', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('333', '黄骅市', '1', '174', '318', '0', '130983', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('334', '河间市', '1', '174', '318', '0', '130984', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('335', '廊坊市', '1', '174', '0', '0', '131000', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('336', '安次区', '1', '174', '335', '0', '131002', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('337', '广阳区', '1', '174', '335', '0', '131003', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('338', '固安县', '1', '174', '335', '0', '131022', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('339', '永清县', '1', '174', '335', '0', '131023', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('340', '香河县', '1', '174', '335', '0', '131024', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('341', '大城县', '1', '174', '335', '0', '131025', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('342', '文安县', '1', '174', '335', '0', '131026', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('343', '大厂回族自治县', '1', '174', '335', '0', '131028', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('344', '霸州市', '1', '174', '335', '0', '131081', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('345', '三河市', '1', '174', '335', '0', '131082', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('346', '衡水市', '1', '174', '0', '0', '131100', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('347', '桃城区', '1', '174', '346', '0', '131102', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('348', '枣强县', '1', '174', '346', '0', '131121', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('349', '武邑县', '1', '174', '346', '0', '131122', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('350', '武强县', '1', '174', '346', '0', '131123', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('351', '饶阳县', '1', '174', '346', '0', '131124', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('352', '安平县', '1', '174', '346', '0', '131125', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('353', '故城县', '1', '174', '346', '0', '131126', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('354', '景县', '1', '174', '346', '0', '131127', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('355', '阜城县', '1', '174', '346', '0', '131128', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('356', '冀州市', '1', '174', '346', '0', '131181', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('357', '深州市', '1', '174', '346', '0', '131182', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('358', '山西省', '1', '0', '0', '0', '140000', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('359', '太原市', '1', '358', '0', '0', '140100', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('360', '小店区', '1', '358', '359', '0', '140105', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('361', '迎泽区', '1', '358', '359', '0', '140106', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('362', '杏花岭区', '1', '358', '359', '0', '140107', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('363', '尖草坪区', '1', '358', '359', '0', '140108', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('364', '万柏林区', '1', '358', '359', '0', '140109', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:53');
INSERT INTO `regions` VALUES ('365', '晋源区', '1', '358', '359', '0', '140110', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('366', '清徐县', '1', '358', '359', '0', '140121', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('367', '阳曲县', '1', '358', '359', '0', '140122', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('368', '娄烦县', '1', '358', '359', '0', '140123', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('369', '古交市', '1', '358', '359', '0', '140181', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('370', '大同市', '1', '358', '0', '0', '140200', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('371', '城区', '1', '358', '370', '0', '140202', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('372', '矿区', '1', '358', '370', '0', '140203', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('373', '南郊区', '1', '358', '370', '0', '140211', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('374', '新荣区', '1', '358', '370', '0', '140212', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('375', '阳高县', '1', '358', '370', '0', '140221', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('376', '天镇县', '1', '358', '370', '0', '140222', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('377', '广灵县', '1', '358', '370', '0', '140223', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('378', '灵丘县', '1', '358', '370', '0', '140224', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('379', '浑源县', '1', '358', '370', '0', '140225', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('380', '左云县', '1', '358', '370', '0', '140226', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('381', '大同县', '1', '358', '370', '0', '140227', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('382', '阳泉市', '1', '358', '0', '0', '140300', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('383', '城区', '1', '358', '382', '0', '140302', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('384', '矿区', '1', '358', '382', '0', '140303', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('385', '郊区', '1', '358', '382', '0', '140311', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('386', '平定县', '1', '358', '382', '0', '140321', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('387', '盂县', '1', '358', '382', '0', '140322', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('388', '长治市', '1', '358', '0', '0', '140400', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('389', '城区', '1', '358', '388', '0', '140402', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('390', '郊区', '1', '358', '388', '0', '140411', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('391', '长治县', '1', '358', '388', '0', '140421', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('392', '襄垣县', '1', '358', '388', '0', '140423', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('393', '屯留县', '1', '358', '388', '0', '140424', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('394', '平顺县', '1', '358', '388', '0', '140425', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('395', '黎城县', '1', '358', '388', '0', '140426', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('396', '壶关县', '1', '358', '388', '0', '140427', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('397', '长子县', '1', '358', '388', '0', '140428', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('398', '武乡县', '1', '358', '388', '0', '140429', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('399', '沁县', '1', '358', '388', '0', '140430', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('400', '沁源县', '1', '358', '388', '0', '140431', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('401', '潞城市', '1', '358', '388', '0', '140481', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('402', '晋城市', '1', '358', '0', '0', '140500', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('403', '城区', '1', '358', '402', '0', '140502', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('404', '沁水县', '1', '358', '402', '0', '140521', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('405', '阳城县', '1', '358', '402', '0', '140522', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('406', '陵川县', '1', '358', '402', '0', '140524', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('407', '泽州县', '1', '358', '402', '0', '140525', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('408', '高平市', '1', '358', '402', '0', '140581', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('409', '朔州市', '1', '358', '0', '0', '140600', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('410', '朔城区', '1', '358', '409', '0', '140602', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('411', '平鲁区', '1', '358', '409', '0', '140603', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('412', '山阴县', '1', '358', '409', '0', '140621', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('413', '应县', '1', '358', '409', '0', '140622', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('414', '右玉县', '1', '358', '409', '0', '140623', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('415', '怀仁县', '1', '358', '409', '0', '140624', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('416', '晋中市', '1', '358', '0', '0', '140700', '0', '2014-06-04 04:51:16', '2014-06-04 04:51:16');
INSERT INTO `regions` VALUES ('417', '榆次区', '1', '358', '416', '0', '140702', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('418', '榆社县', '1', '358', '416', '0', '140721', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('419', '左权县', '1', '358', '416', '0', '140722', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('420', '和顺县', '1', '358', '416', '0', '140723', '0', '2014-06-04 04:51:16', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('421', '昔阳县', '1', '358', '416', '0', '140724', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('422', '寿阳县', '1', '358', '416', '0', '140725', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('423', '太谷县', '1', '358', '416', '0', '140726', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('424', '祁县', '1', '358', '416', '0', '140727', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('425', '平遥县', '1', '358', '416', '0', '140728', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('426', '灵石县', '1', '358', '416', '0', '140729', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('427', '介休市', '1', '358', '416', '0', '140781', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('428', '运城市', '1', '358', '0', '0', '140800', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('429', '盐湖区', '1', '358', '428', '0', '140802', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('430', '临猗县', '1', '358', '428', '0', '140821', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('431', '万荣县', '1', '358', '428', '0', '140822', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('432', '闻喜县', '1', '358', '428', '0', '140823', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('433', '稷山县', '1', '358', '428', '0', '140824', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('434', '新绛县', '1', '358', '428', '0', '140825', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('435', '绛县', '1', '358', '428', '0', '140826', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('436', '垣曲县', '1', '358', '428', '0', '140827', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('437', '夏县', '1', '358', '428', '0', '140828', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('438', '平陆县', '1', '358', '428', '0', '140829', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('439', '芮城县', '1', '358', '428', '0', '140830', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('440', '永济市', '1', '358', '428', '0', '140881', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('441', '河津市', '1', '358', '428', '0', '140882', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('442', '忻州市', '1', '358', '0', '0', '140900', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('443', '忻府区', '1', '358', '442', '0', '140902', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('444', '定襄县', '1', '358', '442', '0', '140921', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('445', '五台县', '1', '358', '442', '0', '140922', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('446', '代县', '1', '358', '442', '0', '140923', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('447', '繁峙县', '1', '358', '442', '0', '140924', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('448', '宁武县', '1', '358', '442', '0', '140925', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('449', '静乐县', '1', '358', '442', '0', '140926', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('450', '神池县', '1', '358', '442', '0', '140927', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('451', '五寨县', '1', '358', '442', '0', '140928', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('452', '岢岚县', '1', '358', '442', '0', '140929', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('453', '河曲县', '1', '358', '442', '0', '140930', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('454', '保德县', '1', '358', '442', '0', '140931', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('455', '偏关县', '1', '358', '442', '0', '140932', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('456', '原平市', '1', '358', '442', '0', '140981', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('457', '临汾市', '1', '358', '0', '0', '141000', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('458', '尧都区', '1', '358', '457', '0', '141002', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('459', '曲沃县', '1', '358', '457', '0', '141021', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('460', '翼城县', '1', '358', '457', '0', '141022', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('461', '襄汾县', '1', '358', '457', '0', '141023', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('462', '洪洞县', '1', '358', '457', '0', '141024', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('463', '古县', '1', '358', '457', '0', '141025', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('464', '安泽县', '1', '358', '457', '0', '141026', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('465', '浮山县', '1', '358', '457', '0', '141027', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('466', '吉县', '1', '358', '457', '0', '141028', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('467', '乡宁县', '1', '358', '457', '0', '141029', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('468', '大宁县', '1', '358', '457', '0', '141030', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('469', '隰县', '1', '358', '457', '0', '141031', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('470', '永和县', '1', '358', '457', '0', '141032', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('471', '蒲县', '1', '358', '457', '0', '141033', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('472', '汾西县', '1', '358', '457', '0', '141034', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('473', '侯马市', '1', '358', '457', '0', '141081', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('474', '霍州市', '1', '358', '457', '0', '141082', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('475', '吕梁市', '1', '358', '0', '0', '141100', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('476', '离石区', '1', '358', '475', '0', '141102', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('477', '文水县', '1', '358', '475', '0', '141121', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('478', '交城县', '1', '358', '475', '0', '141122', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('479', '兴县', '1', '358', '475', '0', '141123', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('480', '临县', '1', '358', '475', '0', '141124', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('481', '柳林县', '1', '358', '475', '0', '141125', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('482', '石楼县', '1', '358', '475', '0', '141126', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('483', '岚县', '1', '358', '475', '0', '141127', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('484', '方山县', '1', '358', '475', '0', '141128', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('485', '中阳县', '1', '358', '475', '0', '141129', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('486', '交口县', '1', '358', '475', '0', '141130', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('487', '孝义市', '1', '358', '475', '0', '141181', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('488', '汾阳市', '1', '358', '475', '0', '141182', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('489', '内蒙古自治区', '1', '0', '0', '0', '150000', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('490', '呼和浩特市', '1', '489', '0', '0', '150100', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('491', '新城区', '1', '489', '490', '0', '150102', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('492', '回民区', '1', '489', '490', '0', '150103', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('493', '玉泉区', '1', '489', '490', '0', '150104', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('494', '赛罕区', '1', '489', '490', '0', '150105', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('495', '土默特左旗', '1', '489', '490', '0', '150121', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('496', '托克托县', '1', '489', '490', '0', '150122', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('497', '和林格尔县', '1', '489', '490', '0', '150123', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('498', '清水河县', '1', '489', '490', '0', '150124', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('499', '武川县', '1', '489', '490', '0', '150125', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('500', '包头市', '1', '489', '0', '0', '150200', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('501', '东河区', '1', '489', '500', '0', '150202', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('502', '昆都仑区', '1', '489', '500', '0', '150203', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('503', '青山区', '1', '489', '500', '0', '150204', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('504', '石拐区', '1', '489', '500', '0', '150205', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('505', '白云鄂博矿区', '1', '489', '500', '0', '150206', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('506', '九原区', '1', '489', '500', '0', '150207', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('507', '土默特右旗', '1', '489', '500', '0', '150221', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('508', '固阳县', '1', '489', '500', '0', '150222', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('509', '达尔罕茂明安联合旗', '1', '489', '500', '0', '150223', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('510', '乌海市', '1', '489', '0', '0', '150300', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('511', '海勃湾区', '1', '489', '510', '0', '150302', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('512', '海南区', '1', '489', '510', '0', '150303', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('513', '乌达区', '1', '489', '510', '0', '150304', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('514', '赤峰市', '1', '489', '0', '0', '150400', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('515', '红山区', '1', '489', '514', '0', '150402', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('516', '元宝山区', '1', '489', '514', '0', '150403', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('517', '松山区', '1', '489', '514', '0', '150404', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('518', '阿鲁科尔沁旗', '1', '489', '514', '0', '150421', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('519', '巴林左旗', '1', '489', '514', '0', '150422', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('520', '巴林右旗', '1', '489', '514', '0', '150423', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('521', '林西县', '1', '489', '514', '0', '150424', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('522', '克什克腾旗', '1', '489', '514', '0', '150425', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('523', '翁牛特旗', '1', '489', '514', '0', '150426', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('524', '喀喇沁旗', '1', '489', '514', '0', '150428', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('525', '宁城县', '1', '489', '514', '0', '150429', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('526', '敖汉旗', '1', '489', '514', '0', '150430', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('527', '通辽市', '1', '489', '0', '0', '150500', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('528', '科尔沁区', '1', '489', '527', '0', '150502', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('529', '科尔沁左翼中旗', '1', '489', '527', '0', '150521', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('530', '科尔沁左翼后旗', '1', '489', '527', '0', '150522', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('531', '开鲁县', '1', '489', '527', '0', '150523', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('532', '库伦旗', '1', '489', '527', '0', '150524', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('533', '奈曼旗', '1', '489', '527', '0', '150525', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:54');
INSERT INTO `regions` VALUES ('534', '扎鲁特旗', '1', '489', '527', '0', '150526', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('535', '霍林郭勒市', '1', '489', '527', '0', '150581', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('536', '鄂尔多斯市', '1', '489', '0', '0', '150600', '0', '2014-06-04 04:51:17', '2014-06-04 04:51:17');
INSERT INTO `regions` VALUES ('537', '东胜区', '1', '489', '536', '0', '150602', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('538', '达拉特旗', '1', '489', '536', '0', '150621', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('539', '准格尔旗', '1', '489', '536', '0', '150622', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('540', '鄂托克前旗', '1', '489', '536', '0', '150623', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('541', '鄂托克旗', '1', '489', '536', '0', '150624', '0', '2014-06-04 04:51:17', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('542', '杭锦旗', '1', '489', '536', '0', '150625', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('543', '乌审旗', '1', '489', '536', '0', '150626', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('544', '伊金霍洛旗', '1', '489', '536', '0', '150627', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('545', '呼伦贝尔市', '1', '489', '0', '0', '150700', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('546', '海拉尔区', '1', '489', '545', '0', '150702', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('547', '阿荣旗', '1', '489', '545', '0', '150721', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('548', '莫力达瓦达斡尔族自治旗', '1', '489', '545', '0', '150722', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('549', '鄂伦春自治旗', '1', '489', '545', '0', '150723', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('550', '鄂温克族自治旗', '1', '489', '545', '0', '150724', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('551', '陈巴尔虎旗', '1', '489', '545', '0', '150725', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('552', '新巴尔虎左旗', '1', '489', '545', '0', '150726', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('553', '新巴尔虎右旗', '1', '489', '545', '0', '150727', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('554', '满洲里市', '1', '489', '545', '0', '150781', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('555', '牙克石市', '1', '489', '545', '0', '150782', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('556', '扎兰屯市', '1', '489', '545', '0', '150783', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('557', '额尔古纳市', '1', '489', '545', '0', '150784', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('558', '根河市', '1', '489', '545', '0', '150785', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('559', '巴彦淖尔市', '1', '489', '0', '0', '150800', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('560', '临河区', '1', '489', '559', '0', '150802', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('561', '五原县', '1', '489', '559', '0', '150821', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('562', '磴口县', '1', '489', '559', '0', '150822', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('563', '乌拉特前旗', '1', '489', '559', '0', '150823', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('564', '乌拉特中旗', '1', '489', '559', '0', '150824', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('565', '乌拉特后旗', '1', '489', '559', '0', '150825', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('566', '杭锦后旗', '1', '489', '559', '0', '150826', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('567', '乌兰察布市', '1', '489', '0', '0', '150900', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('568', '集宁区', '1', '489', '567', '0', '150902', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('569', '卓资县', '1', '489', '567', '0', '150921', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('570', '化德县', '1', '489', '567', '0', '150922', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('571', '商都县', '1', '489', '567', '0', '150923', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('572', '兴和县', '1', '489', '567', '0', '150924', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('573', '凉城县', '1', '489', '567', '0', '150925', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('574', '察哈尔右翼前旗', '1', '489', '567', '0', '150926', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('575', '察哈尔右翼中旗', '1', '489', '567', '0', '150927', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('576', '察哈尔右翼后旗', '1', '489', '567', '0', '150928', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('577', '四子王旗', '1', '489', '567', '0', '150929', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('578', '丰镇市', '1', '489', '567', '0', '150981', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('579', '兴安盟', '1', '489', '0', '0', '152200', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('580', '乌兰浩特市', '1', '489', '579', '0', '152201', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('581', '阿尔山市', '1', '489', '579', '0', '152202', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('582', '科尔沁右翼前旗', '1', '489', '579', '0', '152221', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('583', '科尔沁右翼中旗', '1', '489', '579', '0', '152222', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('584', '扎赉特旗', '1', '489', '579', '0', '152223', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('585', '突泉县', '1', '489', '579', '0', '152224', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('586', '锡林郭勒盟', '1', '489', '0', '0', '152500', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('587', '二连浩特市', '1', '489', '586', '0', '152501', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('588', '锡林浩特市', '1', '489', '586', '0', '152502', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('589', '阿巴嘎旗', '1', '489', '586', '0', '152522', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('590', '苏尼特左旗', '1', '489', '586', '0', '152523', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('591', '苏尼特右旗', '1', '489', '586', '0', '152524', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('592', '东乌珠穆沁旗', '1', '489', '586', '0', '152525', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('593', '西乌珠穆沁旗', '1', '489', '586', '0', '152526', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('594', '太仆寺旗', '1', '489', '586', '0', '152527', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('595', '镶黄旗', '1', '489', '586', '0', '152528', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('596', '正镶白旗', '1', '489', '586', '0', '152529', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('597', '正蓝旗', '1', '489', '586', '0', '152530', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('598', '多伦县', '1', '489', '586', '0', '152531', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('599', '阿拉善盟', '1', '489', '0', '0', '152900', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('600', '阿拉善左旗', '1', '489', '599', '0', '152921', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('601', '阿拉善右旗', '1', '489', '599', '0', '152922', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('602', '额济纳旗', '1', '489', '599', '0', '152923', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('603', '辽宁省', '1', '0', '0', '0', '210000', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('604', '沈阳市', '1', '603', '0', '0', '210100', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('605', '和平区', '1', '603', '604', '0', '210102', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('606', '沈河区', '1', '603', '604', '0', '210103', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('607', '大东区', '1', '603', '604', '0', '210104', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('608', '皇姑区', '1', '603', '604', '0', '210105', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('609', '铁西区', '1', '603', '604', '0', '210106', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('610', '苏家屯区', '1', '603', '604', '0', '210111', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('611', '东陵区', '1', '603', '604', '0', '210112', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('612', '沈北新区', '1', '603', '604', '0', '210113', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('613', '于洪区', '1', '603', '604', '0', '210114', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('614', '辽中县', '1', '603', '604', '0', '210122', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('615', '康平县', '1', '603', '604', '0', '210123', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('616', '法库县', '1', '603', '604', '0', '210124', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('617', '新民市', '1', '603', '604', '0', '210181', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('618', '大连市', '1', '603', '0', '0', '210200', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('619', '中山区', '1', '603', '618', '0', '210202', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('620', '西岗区', '1', '603', '618', '0', '210203', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('621', '沙河口区', '1', '603', '618', '0', '210204', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('622', '甘井子区', '1', '603', '618', '0', '210211', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('623', '旅顺口区', '1', '603', '618', '0', '210212', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('624', '金州区', '1', '603', '618', '0', '210213', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('625', '长海县', '1', '603', '618', '0', '210224', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('626', '瓦房店市', '1', '603', '618', '0', '210281', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('627', '普兰店市', '1', '603', '618', '0', '210282', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('628', '庄河市', '1', '603', '618', '0', '210283', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('629', '鞍山市', '1', '603', '0', '0', '210300', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('630', '铁东区', '1', '603', '629', '0', '210302', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('631', '铁西区', '1', '603', '629', '0', '210303', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('632', '立山区', '1', '603', '629', '0', '210304', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('633', '千山区', '1', '603', '629', '0', '210311', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('634', '台安县', '1', '603', '629', '0', '210321', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('635', '岫岩满族自治县', '1', '603', '629', '0', '210323', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('636', '海城市', '1', '603', '629', '0', '210381', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('637', '抚顺市', '1', '603', '0', '0', '210400', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('638', '新抚区', '1', '603', '637', '0', '210402', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('639', '东洲区', '1', '603', '637', '0', '210403', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('640', '望花区', '1', '603', '637', '0', '210404', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('641', '顺城区', '1', '603', '637', '0', '210411', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('642', '抚顺县', '1', '603', '637', '0', '210421', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('643', '新宾满族自治县', '1', '603', '637', '0', '210422', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('644', '清原满族自治县', '1', '603', '637', '0', '210423', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('645', '本溪市', '1', '603', '0', '0', '210500', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('646', '平山区', '1', '603', '645', '0', '210502', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('647', '溪湖区', '1', '603', '645', '0', '210503', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('648', '明山区', '1', '603', '645', '0', '210504', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('649', '南芬区', '1', '603', '645', '0', '210505', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('650', '本溪满族自治县', '1', '603', '645', '0', '210521', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('651', '桓仁满族自治县', '1', '603', '645', '0', '210522', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('652', '丹东市', '1', '603', '0', '0', '210600', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('653', '元宝区', '1', '603', '652', '0', '210602', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('654', '振兴区', '1', '603', '652', '0', '210603', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('655', '振安区', '1', '603', '652', '0', '210604', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('656', '宽甸满族自治县', '1', '603', '652', '0', '210624', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('657', '东港市', '1', '603', '652', '0', '210681', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('658', '凤城市', '1', '603', '652', '0', '210682', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('659', '锦州市', '1', '603', '0', '0', '210700', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('660', '古塔区', '1', '603', '659', '0', '210702', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('661', '凌河区', '1', '603', '659', '0', '210703', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('662', '太和区', '1', '603', '659', '0', '210711', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('663', '黑山县', '1', '603', '659', '0', '210726', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('664', '义县', '1', '603', '659', '0', '210727', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('665', '凌海市', '1', '603', '659', '0', '210781', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('666', '北镇市', '1', '603', '659', '0', '210782', '0', '2014-06-04 04:51:18', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('667', '营口市', '1', '603', '0', '0', '210800', '0', '2014-06-04 04:51:18', '2014-06-04 04:51:18');
INSERT INTO `regions` VALUES ('668', '站前区', '1', '603', '667', '0', '210802', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('669', '西市区', '1', '603', '667', '0', '210803', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('670', '鲅鱼圈区', '1', '603', '667', '0', '210804', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('671', '老边区', '1', '603', '667', '0', '210811', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('672', '盖州市', '1', '603', '667', '0', '210881', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('673', '大石桥市', '1', '603', '667', '0', '210882', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('674', '阜新市', '1', '603', '0', '0', '210900', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('675', '海州区', '1', '603', '674', '0', '210902', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('676', '新邱区', '1', '603', '674', '0', '210903', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('677', '太平区', '1', '603', '674', '0', '210904', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('678', '清河门区', '1', '603', '674', '0', '210905', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('679', '细河区', '1', '603', '674', '0', '210911', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('680', '阜新蒙古族自治县', '1', '603', '674', '0', '210921', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('681', '彰武县', '1', '603', '674', '0', '210922', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('682', '辽阳市', '1', '603', '0', '0', '211000', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('683', '白塔区', '1', '603', '682', '0', '211002', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('684', '文圣区', '1', '603', '682', '0', '211003', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('685', '宏伟区', '1', '603', '682', '0', '211004', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('686', '弓长岭区', '1', '603', '682', '0', '211005', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('687', '太子河区', '1', '603', '682', '0', '211011', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('688', '辽阳县', '1', '603', '682', '0', '211021', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('689', '灯塔市', '1', '603', '682', '0', '211081', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('690', '盘锦市', '1', '603', '0', '0', '211100', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('691', '双台子区', '1', '603', '690', '0', '211102', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('692', '兴隆台区', '1', '603', '690', '0', '211103', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('693', '大洼县', '1', '603', '690', '0', '211121', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('694', '盘山县', '1', '603', '690', '0', '211122', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('695', '铁岭市', '1', '603', '0', '0', '211200', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('696', '银州区', '1', '603', '695', '0', '211202', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('697', '清河区', '1', '603', '695', '0', '211204', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('698', '铁岭县', '1', '603', '695', '0', '211221', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('699', '西丰县', '1', '603', '695', '0', '211223', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('700', '昌图县', '1', '603', '695', '0', '211224', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('701', '调兵山市', '1', '603', '695', '0', '211281', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('702', '开原市', '1', '603', '695', '0', '211282', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('703', '朝阳市', '1', '603', '0', '0', '211300', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('704', '双塔区', '1', '603', '703', '0', '211302', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('705', '龙城区', '1', '603', '703', '0', '211303', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('706', '朝阳县', '1', '603', '703', '0', '211321', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('707', '建平县', '1', '603', '703', '0', '211322', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('708', '喀喇沁左翼蒙古族自治县', '1', '603', '703', '0', '211324', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('709', '北票市', '1', '603', '703', '0', '211381', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('710', '凌源市', '1', '603', '703', '0', '211382', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('711', '葫芦岛市', '1', '603', '0', '0', '211400', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('712', '连山区', '1', '603', '711', '0', '211402', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('713', '龙港区', '1', '603', '711', '0', '211403', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('714', '南票区', '1', '603', '711', '0', '211404', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:55');
INSERT INTO `regions` VALUES ('715', '绥中县', '1', '603', '711', '0', '211421', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('716', '建昌县', '1', '603', '711', '0', '211422', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('717', '兴城市', '1', '603', '711', '0', '211481', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('718', '吉林省', '1', '0', '0', '0', '220000', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('719', '长春市', '1', '718', '0', '0', '220100', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('720', '南关区', '1', '718', '719', '0', '220102', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('721', '宽城区', '1', '718', '719', '0', '220103', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('722', '朝阳区', '1', '718', '719', '0', '220104', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('723', '二道区', '1', '718', '719', '0', '220105', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('724', '绿园区', '1', '718', '719', '0', '220106', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('725', '双阳区', '1', '718', '719', '0', '220112', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('726', '农安县', '1', '718', '719', '0', '220122', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('727', '九台市', '1', '718', '719', '0', '220181', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('728', '榆树市', '1', '718', '719', '0', '220182', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('729', '德惠市', '1', '718', '719', '0', '220183', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('730', '吉林市', '1', '718', '0', '0', '220200', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('731', '昌邑区', '1', '718', '730', '0', '220202', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('732', '龙潭区', '1', '718', '730', '0', '220203', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('733', '船营区', '1', '718', '730', '0', '220204', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('734', '丰满区', '1', '718', '730', '0', '220211', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('735', '永吉县', '1', '718', '730', '0', '220221', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('736', '蛟河市', '1', '718', '730', '0', '220281', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('737', '桦甸市', '1', '718', '730', '0', '220282', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('738', '舒兰市', '1', '718', '730', '0', '220283', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('739', '磐石市', '1', '718', '730', '0', '220284', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('740', '四平市', '1', '718', '0', '0', '220300', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('741', '铁西区', '1', '718', '740', '0', '220302', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('742', '铁东区', '1', '718', '740', '0', '220303', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('743', '梨树县', '1', '718', '740', '0', '220322', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('744', '伊通满族自治县', '1', '718', '740', '0', '220323', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('745', '公主岭市', '1', '718', '740', '0', '220381', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('746', '双辽市', '1', '718', '740', '0', '220382', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('747', '辽源市', '1', '718', '0', '0', '220400', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('748', '龙山区', '1', '718', '747', '0', '220402', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('749', '西安区', '1', '718', '747', '0', '220403', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('750', '东丰县', '1', '718', '747', '0', '220421', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('751', '东辽县', '1', '718', '747', '0', '220422', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('752', '通化市', '1', '718', '0', '0', '220500', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('753', '东昌区', '1', '718', '752', '0', '220502', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('754', '二道江区', '1', '718', '752', '0', '220503', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('755', '通化县', '1', '718', '752', '0', '220521', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('756', '辉南县', '1', '718', '752', '0', '220523', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('757', '柳河县', '1', '718', '752', '0', '220524', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('758', '梅河口市', '1', '718', '752', '0', '220581', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('759', '集安市', '1', '718', '752', '0', '220582', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('760', '白山市', '1', '718', '0', '0', '220600', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('761', '八道江区', '1', '718', '760', '0', '220602', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('762', '江源区', '1', '718', '760', '0', '220605', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('763', '抚松县', '1', '718', '760', '0', '220621', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('764', '靖宇县', '1', '718', '760', '0', '220622', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('765', '长白朝鲜族自治县', '1', '718', '760', '0', '220623', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('766', '临江市', '1', '718', '760', '0', '220681', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('767', '松原市', '1', '718', '0', '0', '220700', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('768', '宁江区', '1', '718', '767', '0', '220702', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('769', '前郭尔罗斯蒙古族自治县', '1', '718', '767', '0', '220721', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('770', '长岭县', '1', '718', '767', '0', '220722', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('771', '乾安县', '1', '718', '767', '0', '220723', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('772', '扶余县', '1', '718', '767', '0', '220724', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('773', '白城市', '1', '718', '0', '0', '220800', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('774', '洮北区', '1', '718', '773', '0', '220802', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('775', '镇赉县', '1', '718', '773', '0', '220821', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('776', '通榆县', '1', '718', '773', '0', '220822', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('777', '洮南市', '1', '718', '773', '0', '220881', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('778', '大安市', '1', '718', '773', '0', '220882', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('779', '延边朝鲜族自治州', '1', '718', '0', '0', '222400', '0', '2014-06-04 04:51:19', '2014-06-04 04:51:19');
INSERT INTO `regions` VALUES ('780', '延吉市', '1', '718', '779', '0', '222401', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('781', '图们市', '1', '718', '779', '0', '222402', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('782', '敦化市', '1', '718', '779', '0', '222403', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('783', '珲春市', '1', '718', '779', '0', '222404', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('784', '龙井市', '1', '718', '779', '0', '222405', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('785', '和龙市', '1', '718', '779', '0', '222406', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('786', '汪清县', '1', '718', '779', '0', '222424', '0', '2014-06-04 04:51:19', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('787', '安图县', '1', '718', '779', '0', '222426', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('788', '黑龙江省', '1', '0', '0', '0', '230000', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('789', '哈尔滨市', '1', '788', '0', '0', '230100', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('790', '道里区', '1', '788', '789', '0', '230102', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('791', '南岗区', '1', '788', '789', '0', '230103', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('792', '道外区', '1', '788', '789', '0', '230104', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('793', '平房区', '1', '788', '789', '0', '230108', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('794', '松北区', '1', '788', '789', '0', '230109', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('795', '香坊区', '1', '788', '789', '0', '230110', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('796', '呼兰区', '1', '788', '789', '0', '230111', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('797', '阿城区', '1', '788', '789', '0', '230112', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('798', '依兰县', '1', '788', '789', '0', '230123', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('799', '方正县', '1', '788', '789', '0', '230124', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('800', '宾县', '1', '788', '789', '0', '230125', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('801', '巴彦县', '1', '788', '789', '0', '230126', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('802', '木兰县', '1', '788', '789', '0', '230127', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('803', '通河县', '1', '788', '789', '0', '230128', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('804', '延寿县', '1', '788', '789', '0', '230129', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('805', '双城市', '1', '788', '789', '0', '230182', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('806', '尚志市', '1', '788', '789', '0', '230183', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('807', '五常市', '1', '788', '789', '0', '230184', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('808', '齐齐哈尔市', '1', '788', '0', '0', '230200', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('809', '龙沙区', '1', '788', '808', '0', '230202', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('810', '建华区', '1', '788', '808', '0', '230203', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('811', '铁锋区', '1', '788', '808', '0', '230204', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('812', '昂昂溪区', '1', '788', '808', '0', '230205', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('813', '富拉尔基区', '1', '788', '808', '0', '230206', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('814', '碾子山区', '1', '788', '808', '0', '230207', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('815', '梅里斯达斡尔族区', '1', '788', '808', '0', '230208', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('816', '龙江县', '1', '788', '808', '0', '230221', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('817', '依安县', '1', '788', '808', '0', '230223', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('818', '泰来县', '1', '788', '808', '0', '230224', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('819', '甘南县', '1', '788', '808', '0', '230225', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('820', '富裕县', '1', '788', '808', '0', '230227', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('821', '克山县', '1', '788', '808', '0', '230229', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('822', '克东县', '1', '788', '808', '0', '230230', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('823', '拜泉县', '1', '788', '808', '0', '230231', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('824', '讷河市', '1', '788', '808', '0', '230281', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('825', '鸡西市', '1', '788', '0', '0', '230300', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('826', '鸡冠区', '1', '788', '825', '0', '230302', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('827', '恒山区', '1', '788', '825', '0', '230303', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('828', '滴道区', '1', '788', '825', '0', '230304', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('829', '梨树区', '1', '788', '825', '0', '230305', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('830', '城子河区', '1', '788', '825', '0', '230306', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('831', '麻山区', '1', '788', '825', '0', '230307', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('832', '鸡东县', '1', '788', '825', '0', '230321', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('833', '虎林市', '1', '788', '825', '0', '230381', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('834', '密山市', '1', '788', '825', '0', '230382', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('835', '鹤岗市', '1', '788', '0', '0', '230400', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('836', '向阳区', '1', '788', '835', '0', '230402', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('837', '工农区', '1', '788', '835', '0', '230403', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('838', '南山区', '1', '788', '835', '0', '230404', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('839', '兴安区', '1', '788', '835', '0', '230405', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('840', '东山区', '1', '788', '835', '0', '230406', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('841', '兴山区', '1', '788', '835', '0', '230407', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('842', '萝北县', '1', '788', '835', '0', '230421', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('843', '绥滨县', '1', '788', '835', '0', '230422', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('844', '双鸭山市', '1', '788', '0', '0', '230500', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('845', '尖山区', '1', '788', '844', '0', '230502', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('846', '岭东区', '1', '788', '844', '0', '230503', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('847', '四方台区', '1', '788', '844', '0', '230505', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('848', '宝山区', '1', '788', '844', '0', '230506', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('849', '集贤县', '1', '788', '844', '0', '230521', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('850', '友谊县', '1', '788', '844', '0', '230522', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('851', '宝清县', '1', '788', '844', '0', '230523', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('852', '饶河县', '1', '788', '844', '0', '230524', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('853', '大庆市', '1', '788', '0', '0', '230600', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('854', '萨尔图区', '1', '788', '853', '0', '230602', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('855', '龙凤区', '1', '788', '853', '0', '230603', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('856', '让胡路区', '1', '788', '853', '0', '230604', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('857', '红岗区', '1', '788', '853', '0', '230605', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('858', '大同区', '1', '788', '853', '0', '230606', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('859', '肇州县', '1', '788', '853', '0', '230621', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('860', '肇源县', '1', '788', '853', '0', '230622', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('861', '林甸县', '1', '788', '853', '0', '230623', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('862', '杜尔伯特蒙古族自治县', '1', '788', '853', '0', '230624', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('863', '伊春市', '1', '788', '0', '0', '230700', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('864', '伊春区', '1', '788', '863', '0', '230702', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('865', '南岔区', '1', '788', '863', '0', '230703', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('866', '友好区', '1', '788', '863', '0', '230704', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('867', '西林区', '1', '788', '863', '0', '230705', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('868', '翠峦区', '1', '788', '863', '0', '230706', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('869', '新青区', '1', '788', '863', '0', '230707', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('870', '美溪区', '1', '788', '863', '0', '230708', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('871', '金山屯区', '1', '788', '863', '0', '230709', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('872', '五营区', '1', '788', '863', '0', '230710', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('873', '乌马河区', '1', '788', '863', '0', '230711', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('874', '汤旺河区', '1', '788', '863', '0', '230712', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('875', '带岭区', '1', '788', '863', '0', '230713', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('876', '乌伊岭区', '1', '788', '863', '0', '230714', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('877', '红星区', '1', '788', '863', '0', '230715', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('878', '上甘岭区', '1', '788', '863', '0', '230716', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('879', '嘉荫县', '1', '788', '863', '0', '230722', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('880', '铁力市', '1', '788', '863', '0', '230781', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('881', '佳木斯市', '1', '788', '0', '0', '230800', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('882', '向阳区', '1', '788', '881', '0', '230803', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('883', '前进区', '1', '788', '881', '0', '230804', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('884', '东风区', '1', '788', '881', '0', '230805', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('885', '郊区', '1', '788', '881', '0', '230811', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('886', '桦南县', '1', '788', '881', '0', '230822', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('887', '桦川县', '1', '788', '881', '0', '230826', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('888', '汤原县', '1', '788', '881', '0', '230828', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('889', '抚远县', '1', '788', '881', '0', '230833', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('890', '同江市', '1', '788', '881', '0', '230881', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('891', '富锦市', '1', '788', '881', '0', '230882', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:56');
INSERT INTO `regions` VALUES ('892', '七台河市', '1', '788', '0', '0', '230900', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('893', '新兴区', '1', '788', '892', '0', '230902', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('894', '桃山区', '1', '788', '892', '0', '230903', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('895', '茄子河区', '1', '788', '892', '0', '230904', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('896', '勃利县', '1', '788', '892', '0', '230921', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('897', '牡丹江市', '1', '788', '0', '0', '231000', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('898', '东安区', '1', '788', '897', '0', '231002', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('899', '阳明区', '1', '788', '897', '0', '231003', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('900', '爱民区', '1', '788', '897', '0', '231004', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('901', '西安区', '1', '788', '897', '0', '231005', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('902', '东宁县', '1', '788', '897', '0', '231024', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('903', '林口县', '1', '788', '897', '0', '231025', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('904', '绥芬河市', '1', '788', '897', '0', '231081', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('905', '海林市', '1', '788', '897', '0', '231083', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('906', '宁安市', '1', '788', '897', '0', '231084', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('907', '穆棱市', '1', '788', '897', '0', '231085', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('908', '黑河市', '1', '788', '0', '0', '231100', '0', '2014-06-04 04:51:20', '2014-06-04 04:51:20');
INSERT INTO `regions` VALUES ('909', '爱辉区', '1', '788', '908', '0', '231102', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('910', '嫩江县', '1', '788', '908', '0', '231121', '0', '2014-06-04 04:51:20', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('911', '逊克县', '1', '788', '908', '0', '231123', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('912', '孙吴县', '1', '788', '908', '0', '231124', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('913', '北安市', '1', '788', '908', '0', '231181', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('914', '五大连池市', '1', '788', '908', '0', '231182', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('915', '绥化市', '1', '788', '0', '0', '231200', '0', '2014-06-04 04:51:21', '2014-06-04 04:51:21');
INSERT INTO `regions` VALUES ('916', '北林区', '1', '788', '915', '0', '231202', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('917', '望奎县', '1', '788', '915', '0', '231221', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('918', '兰西县', '1', '788', '915', '0', '231222', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('919', '青冈县', '1', '788', '915', '0', '231223', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('920', '庆安县', '1', '788', '915', '0', '231224', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('921', '明水县', '1', '788', '915', '0', '231225', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('922', '绥棱县', '1', '788', '915', '0', '231226', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('923', '安达市', '1', '788', '915', '0', '231281', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('924', '肇东市', '1', '788', '915', '0', '231282', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('925', '海伦市', '1', '788', '915', '0', '231283', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('926', '大兴安岭地区', '1', '788', '0', '0', '232700', '0', '2014-06-04 04:51:21', '2014-06-04 04:51:21');
INSERT INTO `regions` VALUES ('927', '加格达奇区', '1', '788', '926', '0', '232701', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('928', '松岭区', '1', '788', '926', '0', '232702', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('929', '新林区', '1', '788', '926', '0', '232703', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('930', '呼中区', '1', '788', '926', '0', '232704', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('931', '呼玛县', '1', '788', '926', '0', '232721', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('932', '塔河县', '1', '788', '926', '0', '232722', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('933', '漠河县', '1', '788', '926', '0', '232723', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('934', '黑龙江森工总局', '1', '788', '0', '0', '235200', '0', '2014-06-04 04:51:21', '2014-06-04 04:51:21');
INSERT INTO `regions` VALUES ('935', '牡丹江林管局', '1', '788', '934', '0', '235201', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('936', '松花江林管局', '1', '788', '934', '0', '235202', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('937', '合江林管局', '1', '788', '934', '0', '235203', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('938', '农垦总局', '1', '788', '0', '0', '235300', '0', '2014-06-04 04:51:21', '2014-06-04 04:51:21');
INSERT INTO `regions` VALUES ('939', '总局直属单位', '1', '788', '938', '0', '235301', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('940', '宝泉岭管理局', '1', '788', '938', '0', '235302', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('941', '红兴隆管理局', '1', '788', '938', '0', '235303', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('942', '建三江管理局', '1', '788', '938', '0', '235304', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('943', '牡丹江管理局', '1', '788', '938', '0', '235305', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('944', '北安管理局', '1', '788', '938', '0', '235306', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('945', '九三管理局', '1', '788', '938', '0', '235307', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('946', '齐齐哈尔管理局', '1', '788', '938', '0', '235308', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('947', '绥化管理局', '1', '788', '938', '0', '235309', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('948', '哈尔滨管理局', '1', '788', '938', '0', '235310', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('949', '上海市', '1', '0', '0', '0', '310000', '0', '2014-06-04 04:51:21', '2014-06-04 04:51:21');
INSERT INTO `regions` VALUES ('950', '黄浦区', '1', '949', '938', '0', '310101', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('951', '徐汇区', '1', '949', '938', '0', '310104', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('952', '长宁区', '1', '949', '938', '0', '310105', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('953', '静安区', '1', '949', '938', '0', '310106', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('954', '普陀区', '1', '949', '938', '0', '310107', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('955', '闸北区', '1', '949', '938', '0', '310108', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('956', '虹口区', '1', '949', '938', '0', '310109', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('957', '杨浦区', '1', '949', '938', '0', '310110', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('958', '闵行区', '1', '949', '938', '0', '310112', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('959', '宝山区', '1', '949', '938', '0', '310113', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('960', '嘉定区', '1', '949', '938', '0', '310114', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('961', '浦东新区', '1', '949', '938', '0', '310115', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('962', '金山区', '1', '949', '938', '0', '310116', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('963', '松江区', '1', '949', '938', '0', '310117', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('964', '青浦区', '1', '949', '938', '0', '310118', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('965', '奉贤区', '1', '949', '938', '0', '310120', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('966', '崇明县', '1', '949', '938', '0', '310230', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('967', '浙江省', '1', '0', '0', '0', '330000', '0', '2014-06-04 04:51:21', '2014-06-04 04:51:21');
INSERT INTO `regions` VALUES ('968', '杭州市', '1', '967', '0', '0', '330100', '0', '2014-06-04 04:51:21', '2014-06-04 04:51:21');
INSERT INTO `regions` VALUES ('969', '上城区', '1', '967', '968', '0', '330102', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('970', '下城区', '1', '967', '968', '0', '330103', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('971', '江干区', '1', '967', '968', '0', '330104', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('972', '拱墅区', '1', '967', '968', '0', '330105', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('973', '西湖区', '1', '967', '968', '0', '330106', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('974', '滨江区', '1', '967', '968', '0', '330108', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('975', '萧山区', '1', '967', '968', '0', '330109', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('976', '余杭区', '1', '967', '968', '0', '330110', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('977', '桐庐县', '1', '967', '968', '0', '330122', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('978', '淳安县', '1', '967', '968', '0', '330127', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('979', '建德市', '1', '967', '968', '0', '330182', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('980', '富阳市', '1', '967', '968', '0', '330183', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('981', '临安市', '1', '967', '968', '0', '330185', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('982', '宁波市', '1', '967', '0', '0', '330200', '0', '2014-06-04 04:51:21', '2014-06-04 04:51:21');
INSERT INTO `regions` VALUES ('983', '海曙区', '1', '967', '982', '0', '330203', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('984', '江东区', '1', '967', '982', '0', '330204', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('985', '江北区', '1', '967', '982', '0', '330205', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('986', '北仑区', '1', '967', '982', '0', '330206', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('987', '镇海区', '1', '967', '982', '0', '330211', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('988', '鄞州区', '1', '967', '982', '0', '330212', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('989', '象山县', '1', '967', '982', '0', '330225', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('990', '宁海县', '1', '967', '982', '0', '330226', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('991', '余姚市', '1', '967', '982', '0', '330281', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('992', '慈溪市', '1', '967', '982', '0', '330282', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('993', '奉化市', '1', '967', '982', '0', '330283', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('994', '温州市', '1', '967', '0', '0', '330300', '0', '2014-06-04 04:51:21', '2014-06-04 04:51:21');
INSERT INTO `regions` VALUES ('995', '鹿城区', '1', '967', '994', '0', '330302', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('996', '龙湾区', '1', '967', '994', '0', '330303', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('997', '瓯海区', '1', '967', '994', '0', '330304', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('998', '洞头县', '1', '967', '994', '0', '330322', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('999', '永嘉县', '1', '967', '994', '0', '330324', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1000', '平阳县', '1', '967', '994', '0', '330326', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1001', '苍南县', '1', '967', '994', '0', '330327', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1002', '文成县', '1', '967', '994', '0', '330328', '0', '2014-06-04 04:51:21', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1003', '泰顺县', '1', '967', '994', '0', '330329', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1004', '瑞安市', '1', '967', '994', '0', '330381', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1005', '乐清市', '1', '967', '994', '0', '330382', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1006', '嘉兴市', '1', '967', '0', '0', '330400', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1007', '南湖区', '1', '967', '1006', '0', '330402', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1008', '秀洲区', '1', '967', '1006', '0', '330411', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1009', '嘉善县', '1', '967', '1006', '0', '330421', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1010', '海盐县', '1', '967', '1006', '0', '330424', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1011', '海宁市', '1', '967', '1006', '0', '330481', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1012', '平湖市', '1', '967', '1006', '0', '330482', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1013', '桐乡市', '1', '967', '1006', '0', '330483', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1014', '湖州市', '1', '967', '0', '0', '330500', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1015', '吴兴区', '1', '967', '1014', '0', '330502', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1016', '南浔区', '1', '967', '1014', '0', '330503', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1017', '德清县', '1', '967', '1014', '0', '330521', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1018', '长兴县', '1', '967', '1014', '0', '330522', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1019', '安吉县', '1', '967', '1014', '0', '330523', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1020', '绍兴市', '1', '967', '0', '0', '330600', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1021', '越城区', '1', '967', '1020', '0', '330602', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1022', '绍兴县', '1', '967', '1020', '0', '330621', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1023', '新昌县', '1', '967', '1020', '0', '330624', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1024', '诸暨市', '1', '967', '1020', '0', '330681', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1025', '上虞市', '1', '967', '1020', '0', '330682', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1026', '嵊州市', '1', '967', '1020', '0', '330683', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1027', '金华市', '1', '967', '0', '0', '330700', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1028', '婺城区', '1', '967', '1027', '0', '330702', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1029', '金东区', '1', '967', '1027', '0', '330703', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1030', '武义县', '1', '967', '1027', '0', '330723', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1031', '浦江县', '1', '967', '1027', '0', '330726', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1032', '磐安县', '1', '967', '1027', '0', '330727', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1033', '兰溪市', '1', '967', '1027', '0', '330781', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1034', '义乌市', '1', '967', '1027', '0', '330782', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1035', '东阳市', '1', '967', '1027', '0', '330783', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1036', '永康市', '1', '967', '1027', '0', '330784', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1037', '衢州市', '1', '967', '0', '0', '330800', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1038', '柯城区', '1', '967', '1037', '0', '330802', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1039', '衢江区', '1', '967', '1037', '0', '330803', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1040', '常山县', '1', '967', '1037', '0', '330822', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1041', '开化县', '1', '967', '1037', '0', '330824', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1042', '龙游县', '1', '967', '1037', '0', '330825', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1043', '江山市', '1', '967', '1037', '0', '330881', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1044', '舟山市', '1', '967', '0', '0', '330900', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1045', '定海区', '1', '967', '1044', '0', '330902', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1046', '普陀区', '1', '967', '1044', '0', '330903', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1047', '岱山县', '1', '967', '1044', '0', '330921', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1048', '嵊泗县', '1', '967', '1044', '0', '330922', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1049', '台州市', '1', '967', '0', '0', '331000', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1050', '椒江区', '1', '967', '1049', '0', '331002', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1051', '黄岩区', '1', '967', '1049', '0', '331003', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1052', '路桥区', '1', '967', '1049', '0', '331004', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1053', '玉环县', '1', '967', '1049', '0', '331021', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1054', '三门县', '1', '967', '1049', '0', '331022', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1055', '天台县', '1', '967', '1049', '0', '331023', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1056', '仙居县', '1', '967', '1049', '0', '331024', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1057', '温岭市', '1', '967', '1049', '0', '331081', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1058', '临海市', '1', '967', '1049', '0', '331082', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1059', '丽水市', '1', '967', '0', '0', '331100', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1060', '莲都区', '1', '967', '1059', '0', '331102', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1061', '青田县', '1', '967', '1059', '0', '331121', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1062', '缙云县', '1', '967', '1059', '0', '331122', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1063', '遂昌县', '1', '967', '1059', '0', '331123', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1064', '松阳县', '1', '967', '1059', '0', '331124', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1065', '云和县', '1', '967', '1059', '0', '331125', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1066', '庆元县', '1', '967', '1059', '0', '331126', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1067', '景宁畲族自治县', '1', '967', '1059', '0', '331127', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1068', '龙泉市', '1', '967', '1059', '0', '331181', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1069', '安徽省', '1', '0', '0', '0', '340000', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1070', '合肥市', '1', '1069', '0', '0', '340100', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1071', '瑶海区', '1', '1069', '1070', '0', '340102', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1072', '庐阳区', '1', '1069', '1070', '0', '340103', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1073', '蜀山区', '1', '1069', '1070', '0', '340104', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:57');
INSERT INTO `regions` VALUES ('1074', '包河区', '1', '1069', '1070', '0', '340111', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1075', '长丰县', '1', '1069', '1070', '0', '340121', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1076', '肥东县', '1', '1069', '1070', '0', '340122', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1077', '肥西县', '1', '1069', '1070', '0', '340123', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1078', '庐江县', '1', '1069', '1070', '0', '340124', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1079', '巢湖市', '1', '1069', '1070', '0', '340181', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1080', '芜湖市', '1', '1069', '0', '0', '340200', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1081', '镜湖区', '1', '1069', '1080', '0', '340202', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1082', '弋江区', '1', '1069', '1080', '0', '340203', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1083', '鸠江区', '1', '1069', '1080', '0', '340207', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1084', '三山区', '1', '1069', '1080', '0', '340208', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1085', '芜湖县', '1', '1069', '1080', '0', '340221', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1086', '繁昌县', '1', '1069', '1080', '0', '340222', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1087', '南陵县', '1', '1069', '1080', '0', '340223', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1088', '无为县', '1', '1069', '1080', '0', '340225', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1089', '蚌埠市', '1', '1069', '0', '0', '340300', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1090', '龙子湖区', '1', '1069', '1089', '0', '340302', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1091', '蚌山区', '1', '1069', '1089', '0', '340303', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1092', '禹会区', '1', '1069', '1089', '0', '340304', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1093', '淮上区', '1', '1069', '1089', '0', '340311', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1094', '怀远县', '1', '1069', '1089', '0', '340321', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1095', '五河县', '1', '1069', '1089', '0', '340322', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1096', '固镇县', '1', '1069', '1089', '0', '340323', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1097', '淮南市', '1', '1069', '0', '0', '340400', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1098', '大通区', '1', '1069', '1097', '0', '340402', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1099', '田家庵区', '1', '1069', '1097', '0', '340403', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1100', '谢家集区', '1', '1069', '1097', '0', '340404', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1101', '八公山区', '1', '1069', '1097', '0', '340405', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1102', '潘集区', '1', '1069', '1097', '0', '340406', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1103', '凤台县', '1', '1069', '1097', '0', '340421', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1104', '马鞍山市', '1', '1069', '0', '0', '340500', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1105', '金家庄区', '1', '1069', '1104', '0', '340502', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1106', '花山区', '1', '1069', '1104', '0', '340503', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1107', '雨山区', '1', '1069', '1104', '0', '340504', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1108', '当涂县', '1', '1069', '1104', '0', '340521', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1109', '含山县', '1', '1069', '1104', '0', '340522', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1110', '和县', '1', '1069', '1104', '0', '340523', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1111', '淮北市', '1', '1069', '0', '0', '340600', '0', '2014-06-04 04:51:22', '2014-06-04 04:51:22');
INSERT INTO `regions` VALUES ('1112', '杜集区', '1', '1069', '1111', '0', '340602', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1113', '相山区', '1', '1069', '1111', '0', '340603', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1114', '烈山区', '1', '1069', '1111', '0', '340604', '0', '2014-06-04 04:51:22', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1115', '濉溪县', '1', '1069', '1111', '0', '340621', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1116', '铜陵市', '1', '1069', '0', '0', '340700', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1117', '铜官山区', '1', '1069', '1116', '0', '340702', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1118', '狮子山区', '1', '1069', '1116', '0', '340703', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1119', '郊区', '1', '1069', '1116', '0', '340711', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1120', '铜陵县', '1', '1069', '1116', '0', '340721', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1121', '安庆市', '1', '1069', '0', '0', '340800', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1122', '迎江区', '1', '1069', '1121', '0', '340802', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1123', '大观区', '1', '1069', '1121', '0', '340803', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1124', '宜秀区', '1', '1069', '1121', '0', '340811', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1125', '怀宁县', '1', '1069', '1121', '0', '340822', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1126', '枞阳县', '1', '1069', '1121', '0', '340823', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1127', '潜山县', '1', '1069', '1121', '0', '340824', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1128', '太湖县', '1', '1069', '1121', '0', '340825', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1129', '宿松县', '1', '1069', '1121', '0', '340826', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1130', '望江县', '1', '1069', '1121', '0', '340827', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1131', '岳西县', '1', '1069', '1121', '0', '340828', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1132', '桐城市', '1', '1069', '1121', '0', '340881', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1133', '黄山市', '1', '1069', '0', '0', '341000', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1134', '屯溪区', '1', '1069', '1133', '0', '341002', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1135', '黄山区', '1', '1069', '1133', '0', '341003', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1136', '徽州区', '1', '1069', '1133', '0', '341004', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1137', '歙县', '1', '1069', '1133', '0', '341021', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1138', '休宁县', '1', '1069', '1133', '0', '341022', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1139', '黟县', '1', '1069', '1133', '0', '341023', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1140', '祁门县', '1', '1069', '1133', '0', '341024', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1141', '滁州市', '1', '1069', '0', '0', '341100', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1142', '琅琊区', '1', '1069', '1141', '0', '341102', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1143', '南谯区', '1', '1069', '1141', '0', '341103', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1144', '来安县', '1', '1069', '1141', '0', '341122', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1145', '全椒县', '1', '1069', '1141', '0', '341124', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1146', '定远县', '1', '1069', '1141', '0', '341125', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1147', '凤阳县', '1', '1069', '1141', '0', '341126', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1148', '天长市', '1', '1069', '1141', '0', '341181', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1149', '明光市', '1', '1069', '1141', '0', '341182', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1150', '阜阳市', '1', '1069', '0', '0', '341200', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1151', '颍州区', '1', '1069', '1150', '0', '341202', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1152', '颍东区', '1', '1069', '1150', '0', '341203', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1153', '颍泉区', '1', '1069', '1150', '0', '341204', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1154', '临泉县', '1', '1069', '1150', '0', '341221', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1155', '太和县', '1', '1069', '1150', '0', '341222', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1156', '阜南县', '1', '1069', '1150', '0', '341225', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1157', '颍上县', '1', '1069', '1150', '0', '341226', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1158', '界首市', '1', '1069', '1150', '0', '341282', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1159', '宿州市', '1', '1069', '0', '0', '341300', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1160', '埇桥区', '1', '1069', '1159', '0', '341302', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1161', '砀山县', '1', '1069', '1159', '0', '341321', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1162', '萧县', '1', '1069', '1159', '0', '341322', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1163', '灵璧县', '1', '1069', '1159', '0', '341323', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1164', '泗县', '1', '1069', '1159', '0', '341324', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1165', '六安市', '1', '1069', '0', '0', '341500', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1166', '金安区', '1', '1069', '1165', '0', '341502', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1167', '裕安区', '1', '1069', '1165', '0', '341503', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1168', '寿县', '1', '1069', '1165', '0', '341521', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1169', '霍邱县', '1', '1069', '1165', '0', '341522', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1170', '舒城县', '1', '1069', '1165', '0', '341523', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1171', '金寨县', '1', '1069', '1165', '0', '341524', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1172', '霍山县', '1', '1069', '1165', '0', '341525', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1173', '亳州市', '1', '1069', '0', '0', '341600', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1174', '谯城区', '1', '1069', '1173', '0', '341602', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1175', '涡阳县', '1', '1069', '1173', '0', '341621', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1176', '蒙城县', '1', '1069', '1173', '0', '341622', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1177', '利辛县', '1', '1069', '1173', '0', '341623', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1178', '池州市', '1', '1069', '0', '0', '341700', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1179', '贵池区', '1', '1069', '1178', '0', '341702', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1180', '东至县', '1', '1069', '1178', '0', '341721', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1181', '石台县', '1', '1069', '1178', '0', '341722', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1182', '青阳县', '1', '1069', '1178', '0', '341723', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1183', '宣城市', '1', '1069', '0', '0', '341800', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1184', '宣州区', '1', '1069', '1183', '0', '341802', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1185', '郎溪县', '1', '1069', '1183', '0', '341821', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1186', '广德县', '1', '1069', '1183', '0', '341822', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1187', '泾县', '1', '1069', '1183', '0', '341823', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1188', '绩溪县', '1', '1069', '1183', '0', '341824', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1189', '旌德县', '1', '1069', '1183', '0', '341825', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1190', '宁国市', '1', '1069', '1183', '0', '341881', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1191', '福建省', '1', '0', '0', '0', '350000', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1192', '福州市', '1', '1191', '0', '0', '350100', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1193', '鼓楼区', '1', '1191', '1192', '0', '350102', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1194', '台江区', '1', '1191', '1192', '0', '350103', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1195', '仓山区', '1', '1191', '1192', '0', '350104', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1196', '马尾区', '1', '1191', '1192', '0', '350105', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1197', '晋安区', '1', '1191', '1192', '0', '350111', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1198', '闽侯县', '1', '1191', '1192', '0', '350121', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1199', '连江县', '1', '1191', '1192', '0', '350122', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1200', '罗源县', '1', '1191', '1192', '0', '350123', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1201', '闽清县', '1', '1191', '1192', '0', '350124', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1202', '永泰县', '1', '1191', '1192', '0', '350125', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1203', '平潭县', '1', '1191', '1192', '0', '350128', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1204', '福清市', '1', '1191', '1192', '0', '350181', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1205', '长乐市', '1', '1191', '1192', '0', '350182', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1206', '厦门市', '1', '1191', '0', '0', '350200', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1207', '思明区', '1', '1191', '1206', '0', '350203', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1208', '海沧区', '1', '1191', '1206', '0', '350205', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1209', '湖里区', '1', '1191', '1206', '0', '350206', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1210', '集美区', '1', '1191', '1206', '0', '350211', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1211', '同安区', '1', '1191', '1206', '0', '350212', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1212', '翔安区', '1', '1191', '1206', '0', '350213', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1213', '莆田市', '1', '1191', '0', '0', '350300', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1214', '城厢区', '1', '1191', '1213', '0', '350302', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1215', '涵江区', '1', '1191', '1213', '0', '350303', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1216', '荔城区', '1', '1191', '1213', '0', '350304', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1217', '秀屿区', '1', '1191', '1213', '0', '350305', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1218', '仙游县', '1', '1191', '1213', '0', '350322', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1219', '三明市', '1', '1191', '0', '0', '350400', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1220', '梅列区', '1', '1191', '1219', '0', '350402', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1221', '三元区', '1', '1191', '1219', '0', '350403', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1222', '明溪县', '1', '1191', '1219', '0', '350421', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1223', '清流县', '1', '1191', '1219', '0', '350423', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1224', '宁化县', '1', '1191', '1219', '0', '350424', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1225', '大田县', '1', '1191', '1219', '0', '350425', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1226', '尤溪县', '1', '1191', '1219', '0', '350426', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1227', '沙县', '1', '1191', '1219', '0', '350427', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1228', '将乐县', '1', '1191', '1219', '0', '350428', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1229', '泰宁县', '1', '1191', '1219', '0', '350429', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1230', '建宁县', '1', '1191', '1219', '0', '350430', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1231', '永安市', '1', '1191', '1219', '0', '350481', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1232', '泉州市', '1', '1191', '0', '0', '350500', '0', '2014-06-04 04:51:23', '2014-06-04 04:51:23');
INSERT INTO `regions` VALUES ('1233', '鲤城区', '1', '1191', '1232', '0', '350502', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1234', '丰泽区', '1', '1191', '1232', '0', '350503', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1235', '洛江区', '1', '1191', '1232', '0', '350504', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1236', '泉港区', '1', '1191', '1232', '0', '350505', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1237', '惠安县', '1', '1191', '1232', '0', '350521', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1238', '安溪县', '1', '1191', '1232', '0', '350524', '0', '2014-06-04 04:51:23', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1239', '永春县', '1', '1191', '1232', '0', '350525', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1240', '德化县', '1', '1191', '1232', '0', '350526', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1241', '金门县', '1', '1191', '1232', '0', '350527', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1242', '石狮市', '1', '1191', '1232', '0', '350581', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1243', '晋江市', '1', '1191', '1232', '0', '350582', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1244', '南安市', '1', '1191', '1232', '0', '350583', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1245', '漳州市', '1', '1191', '0', '0', '350600', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1246', '芗城区', '1', '1191', '1245', '0', '350602', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1247', '龙文区', '1', '1191', '1245', '0', '350603', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1248', '云霄县', '1', '1191', '1245', '0', '350622', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1249', '漳浦县', '1', '1191', '1245', '0', '350623', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1250', '诏安县', '1', '1191', '1245', '0', '350624', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1251', '长泰县', '1', '1191', '1245', '0', '350625', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1252', '东山县', '1', '1191', '1245', '0', '350626', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1253', '南靖县', '1', '1191', '1245', '0', '350627', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1254', '平和县', '1', '1191', '1245', '0', '350628', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1255', '华安县', '1', '1191', '1245', '0', '350629', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1256', '龙海市', '1', '1191', '1245', '0', '350681', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1257', '南平市', '1', '1191', '0', '0', '350700', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1258', '延平区', '1', '1191', '1257', '0', '350702', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1259', '顺昌县', '1', '1191', '1257', '0', '350721', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1260', '浦城县', '1', '1191', '1257', '0', '350722', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:58');
INSERT INTO `regions` VALUES ('1261', '光泽县', '1', '1191', '1257', '0', '350723', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1262', '松溪县', '1', '1191', '1257', '0', '350724', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1263', '政和县', '1', '1191', '1257', '0', '350725', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1264', '邵武市', '1', '1191', '1257', '0', '350781', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1265', '武夷山市', '1', '1191', '1257', '0', '350782', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1266', '建瓯市', '1', '1191', '1257', '0', '350783', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1267', '建阳市', '1', '1191', '1257', '0', '350784', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1268', '龙岩市', '1', '1191', '0', '0', '350800', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1269', '新罗区', '1', '1191', '1268', '0', '350802', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1270', '长汀县', '1', '1191', '1268', '0', '350821', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1271', '永定县', '1', '1191', '1268', '0', '350822', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1272', '上杭县', '1', '1191', '1268', '0', '350823', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1273', '武平县', '1', '1191', '1268', '0', '350824', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1274', '连城县', '1', '1191', '1268', '0', '350825', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1275', '漳平市', '1', '1191', '1268', '0', '350881', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1276', '宁德市', '1', '1191', '0', '0', '350900', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1277', '蕉城区', '1', '1191', '1276', '0', '350902', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1278', '霞浦县', '1', '1191', '1276', '0', '350921', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1279', '古田县', '1', '1191', '1276', '0', '350922', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1280', '屏南县', '1', '1191', '1276', '0', '350923', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1281', '寿宁县', '1', '1191', '1276', '0', '350924', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1282', '周宁县', '1', '1191', '1276', '0', '350925', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1283', '柘荣县', '1', '1191', '1276', '0', '350926', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1284', '福安市', '1', '1191', '1276', '0', '350981', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1285', '福鼎市', '1', '1191', '1276', '0', '350982', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1286', '江西省', '1', '0', '0', '0', '360000', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1287', '南昌市', '1', '1286', '0', '0', '360100', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1288', '东湖区', '1', '1286', '1287', '0', '360102', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1289', '西湖区', '1', '1286', '1287', '0', '360103', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1290', '青云谱区', '1', '1286', '1287', '0', '360104', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1291', '湾里区', '1', '1286', '1287', '0', '360105', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1292', '青山湖区', '1', '1286', '1287', '0', '360111', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1293', '南昌县', '1', '1286', '1287', '0', '360121', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1294', '新建县', '1', '1286', '1287', '0', '360122', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1295', '安义县', '1', '1286', '1287', '0', '360123', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1296', '进贤县', '1', '1286', '1287', '0', '360124', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1297', '景德镇市', '1', '1286', '0', '0', '360200', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1298', '昌江区', '1', '1286', '1297', '0', '360202', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1299', '珠山区', '1', '1286', '1297', '0', '360203', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1300', '浮梁县', '1', '1286', '1297', '0', '360222', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1301', '乐平市', '1', '1286', '1297', '0', '360281', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1302', '萍乡市', '1', '1286', '0', '0', '360300', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1303', '安源区', '1', '1286', '1302', '0', '360302', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1304', '湘东区', '1', '1286', '1302', '0', '360313', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1305', '莲花县', '1', '1286', '1302', '0', '360321', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1306', '上栗县', '1', '1286', '1302', '0', '360322', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1307', '芦溪县', '1', '1286', '1302', '0', '360323', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1308', '九江市', '1', '1286', '0', '0', '360400', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1309', '庐山区', '1', '1286', '1308', '0', '360402', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1310', '浔阳区', '1', '1286', '1308', '0', '360403', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1311', '九江县', '1', '1286', '1308', '0', '360421', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1312', '武宁县', '1', '1286', '1308', '0', '360423', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1313', '修水县', '1', '1286', '1308', '0', '360424', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1314', '永修县', '1', '1286', '1308', '0', '360425', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1315', '德安县', '1', '1286', '1308', '0', '360426', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1316', '星子县', '1', '1286', '1308', '0', '360427', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1317', '都昌县', '1', '1286', '1308', '0', '360428', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1318', '湖口县', '1', '1286', '1308', '0', '360429', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1319', '彭泽县', '1', '1286', '1308', '0', '360430', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1320', '瑞昌市', '1', '1286', '1308', '0', '360481', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1321', '共青城市', '1', '1286', '1308', '0', '360482', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1322', '新余市', '1', '1286', '0', '0', '360500', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1323', '渝水区', '1', '1286', '1322', '0', '360502', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1324', '分宜县', '1', '1286', '1322', '0', '360521', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1325', '鹰潭市', '1', '1286', '0', '0', '360600', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1326', '月湖区', '1', '1286', '1325', '0', '360602', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1327', '余江县', '1', '1286', '1325', '0', '360622', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1328', '贵溪市', '1', '1286', '1325', '0', '360681', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1329', '赣州市', '1', '1286', '0', '0', '360700', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1330', '章贡区', '1', '1286', '1329', '0', '360702', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1331', '赣县', '1', '1286', '1329', '0', '360721', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1332', '信丰县', '1', '1286', '1329', '0', '360722', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1333', '大余县', '1', '1286', '1329', '0', '360723', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1334', '上犹县', '1', '1286', '1329', '0', '360724', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1335', '崇义县', '1', '1286', '1329', '0', '360725', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1336', '安远县', '1', '1286', '1329', '0', '360726', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1337', '龙南县', '1', '1286', '1329', '0', '360727', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1338', '定南县', '1', '1286', '1329', '0', '360728', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1339', '全南县', '1', '1286', '1329', '0', '360729', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1340', '宁都县', '1', '1286', '1329', '0', '360730', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1341', '于都县', '1', '1286', '1329', '0', '360731', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1342', '兴国县', '1', '1286', '1329', '0', '360732', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1343', '会昌县', '1', '1286', '1329', '0', '360733', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1344', '寻乌县', '1', '1286', '1329', '0', '360734', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1345', '石城县', '1', '1286', '1329', '0', '360735', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1346', '瑞金市', '1', '1286', '1329', '0', '360781', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1347', '南康市', '1', '1286', '1329', '0', '360782', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1348', '吉安市', '1', '1286', '0', '0', '360800', '0', '2014-06-04 04:51:24', '2014-06-04 04:51:24');
INSERT INTO `regions` VALUES ('1349', '吉州区', '1', '1286', '1348', '0', '360802', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1350', '青原区', '1', '1286', '1348', '0', '360803', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1351', '吉安县', '1', '1286', '1348', '0', '360821', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1352', '吉水县', '1', '1286', '1348', '0', '360822', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1353', '峡江县', '1', '1286', '1348', '0', '360823', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1354', '新干县', '1', '1286', '1348', '0', '360824', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1355', '永丰县', '1', '1286', '1348', '0', '360825', '0', '2014-06-04 04:51:24', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1356', '泰和县', '1', '1286', '1348', '0', '360826', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1357', '遂川县', '1', '1286', '1348', '0', '360827', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1358', '万安县', '1', '1286', '1348', '0', '360828', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1359', '安福县', '1', '1286', '1348', '0', '360829', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1360', '永新县', '1', '1286', '1348', '0', '360830', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1361', '井冈山市', '1', '1286', '1348', '0', '360881', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1362', '宜春市', '1', '1286', '0', '0', '360900', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1363', '袁州区', '1', '1286', '1362', '0', '360902', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1364', '奉新县', '1', '1286', '1362', '0', '360921', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1365', '万载县', '1', '1286', '1362', '0', '360922', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1366', '上高县', '1', '1286', '1362', '0', '360923', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1367', '宜丰县', '1', '1286', '1362', '0', '360924', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1368', '靖安县', '1', '1286', '1362', '0', '360925', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1369', '铜鼓县', '1', '1286', '1362', '0', '360926', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1370', '丰城市', '1', '1286', '1362', '0', '360981', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1371', '樟树市', '1', '1286', '1362', '0', '360982', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1372', '高安市', '1', '1286', '1362', '0', '360983', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1373', '抚州市', '1', '1286', '0', '0', '361000', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1374', '临川区', '1', '1286', '1373', '0', '361002', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1375', '南城县', '1', '1286', '1373', '0', '361021', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1376', '黎川县', '1', '1286', '1373', '0', '361022', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1377', '南丰县', '1', '1286', '1373', '0', '361023', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1378', '崇仁县', '1', '1286', '1373', '0', '361024', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1379', '乐安县', '1', '1286', '1373', '0', '361025', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1380', '宜黄县', '1', '1286', '1373', '0', '361026', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1381', '金溪县', '1', '1286', '1373', '0', '361027', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1382', '资溪县', '1', '1286', '1373', '0', '361028', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1383', '东乡县', '1', '1286', '1373', '0', '361029', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1384', '广昌县', '1', '1286', '1373', '0', '361030', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1385', '上饶市', '1', '1286', '0', '0', '361100', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1386', '信州区', '1', '1286', '1385', '0', '361102', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1387', '上饶县', '1', '1286', '1385', '0', '361121', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1388', '广丰县', '1', '1286', '1385', '0', '361122', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1389', '玉山县', '1', '1286', '1385', '0', '361123', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1390', '铅山县', '1', '1286', '1385', '0', '361124', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1391', '横峰县', '1', '1286', '1385', '0', '361125', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1392', '弋阳县', '1', '1286', '1385', '0', '361126', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1393', '余干县', '1', '1286', '1385', '0', '361127', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1394', '鄱阳县', '1', '1286', '1385', '0', '361128', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1395', '万年县', '1', '1286', '1385', '0', '361129', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1396', '婺源县', '1', '1286', '1385', '0', '361130', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1397', '德兴市', '1', '1286', '1385', '0', '361181', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1398', '山东省', '1', '0', '0', '0', '370000', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1399', '济南市', '1', '1398', '0', '0', '370100', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1400', '历下区', '1', '1398', '1399', '0', '370102', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1401', '市中区', '1', '1398', '1399', '0', '370103', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1402', '槐荫区', '1', '1398', '1399', '0', '370104', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1403', '天桥区', '1', '1398', '1399', '0', '370105', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1404', '历城区', '1', '1398', '1399', '0', '370112', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1405', '长清区', '1', '1398', '1399', '0', '370113', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1406', '平阴县', '1', '1398', '1399', '0', '370124', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1407', '济阳县', '1', '1398', '1399', '0', '370125', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1408', '商河县', '1', '1398', '1399', '0', '370126', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1409', '章丘市', '1', '1398', '1399', '0', '370181', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1410', '青岛市', '1', '1398', '0', '0', '370200', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1411', '市南区', '1', '1398', '1410', '0', '370202', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1412', '市北区', '1', '1398', '1410', '0', '370203', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1413', '四方区', '1', '1398', '1410', '0', '370205', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1414', '黄岛区', '1', '1398', '1410', '0', '370211', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1415', '崂山区', '1', '1398', '1410', '0', '370212', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1416', '李沧区', '1', '1398', '1410', '0', '370213', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1417', '城阳区', '1', '1398', '1410', '0', '370214', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1418', '胶州市', '1', '1398', '1410', '0', '370281', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1419', '即墨市', '1', '1398', '1410', '0', '370282', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1420', '平度市', '1', '1398', '1410', '0', '370283', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1421', '胶南市', '1', '1398', '1410', '0', '370284', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1422', '莱西市', '1', '1398', '1410', '0', '370285', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1423', '淄博市', '1', '1398', '0', '0', '370300', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1424', '淄川区', '1', '1398', '1423', '0', '370302', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1425', '张店区', '1', '1398', '1423', '0', '370303', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1426', '博山区', '1', '1398', '1423', '0', '370304', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1427', '临淄区', '1', '1398', '1423', '0', '370305', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1428', '周村区', '1', '1398', '1423', '0', '370306', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1429', '桓台县', '1', '1398', '1423', '0', '370321', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1430', '高青县', '1', '1398', '1423', '0', '370322', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1431', '沂源县', '1', '1398', '1423', '0', '370323', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1432', '枣庄市', '1', '1398', '0', '0', '370400', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1433', '市中区', '1', '1398', '1432', '0', '370402', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1434', '薛城区', '1', '1398', '1432', '0', '370403', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1435', '峄城区', '1', '1398', '1432', '0', '370404', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1436', '台儿庄区', '1', '1398', '1432', '0', '370405', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1437', '山亭区', '1', '1398', '1432', '0', '370406', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1438', '滕州市', '1', '1398', '1432', '0', '370481', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1439', '东营市', '1', '1398', '0', '0', '370500', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1440', '东营区', '1', '1398', '1439', '0', '370502', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1441', '河口区', '1', '1398', '1439', '0', '370503', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1442', '垦利县', '1', '1398', '1439', '0', '370521', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1443', '利津县', '1', '1398', '1439', '0', '370522', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1444', '广饶县', '1', '1398', '1439', '0', '370523', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1445', '烟台市', '1', '1398', '0', '0', '370600', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1446', '芝罘区', '1', '1398', '1445', '0', '370602', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1447', '福山区', '1', '1398', '1445', '0', '370611', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1448', '牟平区', '1', '1398', '1445', '0', '370612', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1449', '莱山区', '1', '1398', '1445', '0', '370613', '0', '2014-06-04 04:51:25', '2014-08-23 03:21:59');
INSERT INTO `regions` VALUES ('1450', '长岛县', '1', '1398', '1445', '0', '370634', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1451', '龙口市', '1', '1398', '1445', '0', '370681', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1452', '莱阳市', '1', '1398', '1445', '0', '370682', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1453', '莱州市', '1', '1398', '1445', '0', '370683', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1454', '蓬莱市', '1', '1398', '1445', '0', '370684', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1455', '招远市', '1', '1398', '1445', '0', '370685', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1456', '栖霞市', '1', '1398', '1445', '0', '370686', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1457', '海阳市', '1', '1398', '1445', '0', '370687', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1458', '潍坊市', '1', '1398', '0', '0', '370700', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1459', '潍城区', '1', '1398', '1458', '0', '370702', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1460', '寒亭区', '1', '1398', '1458', '0', '370703', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1461', '坊子区', '1', '1398', '1458', '0', '370704', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1462', '奎文区', '1', '1398', '1458', '0', '370705', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1463', '临朐县', '1', '1398', '1458', '0', '370724', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1464', '昌乐县', '1', '1398', '1458', '0', '370725', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1465', '青州市', '1', '1398', '1458', '0', '370781', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1466', '诸城市', '1', '1398', '1458', '0', '370782', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1467', '寿光市', '1', '1398', '1458', '0', '370783', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1468', '安丘市', '1', '1398', '1458', '0', '370784', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1469', '高密市', '1', '1398', '1458', '0', '370785', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1470', '昌邑市', '1', '1398', '1458', '0', '370786', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1471', '济宁市', '1', '1398', '0', '0', '370800', '0', '2014-06-04 04:51:25', '2014-06-04 04:51:25');
INSERT INTO `regions` VALUES ('1472', '市中区', '1', '1398', '1471', '0', '370802', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1473', '任城区', '1', '1398', '1471', '0', '370811', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1474', '微山县', '1', '1398', '1471', '0', '370826', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1475', '鱼台县', '1', '1398', '1471', '0', '370827', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1476', '金乡县', '1', '1398', '1471', '0', '370828', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1477', '嘉祥县', '1', '1398', '1471', '0', '370829', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1478', '汶上县', '1', '1398', '1471', '0', '370830', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1479', '泗水县', '1', '1398', '1471', '0', '370831', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1480', '梁山县', '1', '1398', '1471', '0', '370832', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1481', '曲阜市', '1', '1398', '1471', '0', '370881', '0', '2014-06-04 04:51:25', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1482', '兖州市', '1', '1398', '1471', '0', '370882', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1483', '邹城市', '1', '1398', '1471', '0', '370883', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1484', '泰安市', '1', '1398', '0', '0', '370900', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1485', '泰山区', '1', '1398', '1484', '0', '370902', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1486', '岱岳区', '1', '1398', '1484', '0', '370911', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1487', '宁阳县', '1', '1398', '1484', '0', '370921', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1488', '东平县', '1', '1398', '1484', '0', '370923', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1489', '新泰市', '1', '1398', '1484', '0', '370982', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1490', '肥城市', '1', '1398', '1484', '0', '370983', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1491', '威海市', '1', '1398', '0', '0', '371000', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1492', '环翠区', '1', '1398', '1491', '0', '371002', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1493', '文登市', '1', '1398', '1491', '0', '371081', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1494', '荣成市', '1', '1398', '1491', '0', '371082', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1495', '乳山市', '1', '1398', '1491', '0', '371083', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1496', '日照市', '1', '1398', '0', '0', '371100', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1497', '东港区', '1', '1398', '1496', '0', '371102', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1498', '岚山区', '1', '1398', '1496', '0', '371103', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1499', '五莲县', '1', '1398', '1496', '0', '371121', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1500', '莒县', '1', '1398', '1496', '0', '371122', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1501', '莱芜市', '1', '1398', '0', '0', '371200', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1502', '莱城区', '1', '1398', '1501', '0', '371202', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1503', '钢城区', '1', '1398', '1501', '0', '371203', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1504', '临沂市', '1', '1398', '0', '0', '371300', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1505', '兰山区', '1', '1398', '1504', '0', '371302', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1506', '罗庄区', '1', '1398', '1504', '0', '371311', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1507', '河东区', '1', '1398', '1504', '0', '371312', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1508', '沂南县', '1', '1398', '1504', '0', '371321', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1509', '郯城县', '1', '1398', '1504', '0', '371322', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1510', '沂水县', '1', '1398', '1504', '0', '371323', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1511', '苍山县', '1', '1398', '1504', '0', '371324', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1512', '费县', '1', '1398', '1504', '0', '371325', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1513', '平邑县', '1', '1398', '1504', '0', '371326', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1514', '莒南县', '1', '1398', '1504', '0', '371327', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1515', '蒙阴县', '1', '1398', '1504', '0', '371328', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1516', '临沭县', '1', '1398', '1504', '0', '371329', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1517', '德州市', '1', '1398', '0', '0', '371400', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1518', '德城区', '1', '1398', '1517', '0', '371402', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1519', '陵县', '1', '1398', '1517', '0', '371421', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1520', '宁津县', '1', '1398', '1517', '0', '371422', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1521', '庆云县', '1', '1398', '1517', '0', '371423', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1522', '临邑县', '1', '1398', '1517', '0', '371424', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1523', '齐河县', '1', '1398', '1517', '0', '371425', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1524', '平原县', '1', '1398', '1517', '0', '371426', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1525', '夏津县', '1', '1398', '1517', '0', '371427', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1526', '武城县', '1', '1398', '1517', '0', '371428', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1527', '乐陵市', '1', '1398', '1517', '0', '371481', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1528', '禹城市', '1', '1398', '1517', '0', '371482', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1529', '聊城市', '1', '1398', '0', '0', '371500', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1530', '东昌府区', '1', '1398', '1529', '0', '371502', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1531', '阳谷县', '1', '1398', '1529', '0', '371521', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1532', '莘县', '1', '1398', '1529', '0', '371522', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1533', '茌平县', '1', '1398', '1529', '0', '371523', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1534', '东阿县', '1', '1398', '1529', '0', '371524', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1535', '冠县', '1', '1398', '1529', '0', '371525', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1536', '高唐县', '1', '1398', '1529', '0', '371526', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1537', '临清市', '1', '1398', '1529', '0', '371581', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1538', '滨州市', '1', '1398', '0', '0', '371600', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1539', '滨城区', '1', '1398', '1538', '0', '371602', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1540', '惠民县', '1', '1398', '1538', '0', '371621', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1541', '阳信县', '1', '1398', '1538', '0', '371622', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1542', '无棣县', '1', '1398', '1538', '0', '371623', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1543', '沾化县', '1', '1398', '1538', '0', '371624', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1544', '博兴县', '1', '1398', '1538', '0', '371625', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1545', '邹平县', '1', '1398', '1538', '0', '371626', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1546', '菏泽市', '1', '1398', '0', '0', '371700', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1547', '牡丹区', '1', '1398', '1546', '0', '371702', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1548', '曹县', '1', '1398', '1546', '0', '371721', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1549', '单县', '1', '1398', '1546', '0', '371722', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1550', '成武县', '1', '1398', '1546', '0', '371723', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1551', '巨野县', '1', '1398', '1546', '0', '371724', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1552', '郓城县', '1', '1398', '1546', '0', '371725', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1553', '鄄城县', '1', '1398', '1546', '0', '371726', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1554', '定陶县', '1', '1398', '1546', '0', '371727', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1555', '东明县', '1', '1398', '1546', '0', '371728', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1556', '河南省', '1', '0', '0', '0', '410000', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1557', '郑州市', '1', '1556', '0', '0', '410100', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1558', '中原区', '1', '1556', '1557', '0', '410102', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1559', '二七区', '1', '1556', '1557', '0', '410103', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1560', '管城回族区', '1', '1556', '1557', '0', '410104', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1561', '金水区', '1', '1556', '1557', '0', '410105', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1562', '上街区', '1', '1556', '1557', '0', '410106', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1563', '惠济区', '1', '1556', '1557', '0', '410108', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1564', '中牟县', '1', '1556', '1557', '0', '410122', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1565', '巩义市', '1', '1556', '1557', '0', '410181', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1566', '荥阳市', '1', '1556', '1557', '0', '410182', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1567', '新密市', '1', '1556', '1557', '0', '410183', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1568', '新郑市', '1', '1556', '1557', '0', '410184', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1569', '登封市', '1', '1556', '1557', '0', '410185', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1570', '开封市', '1', '1556', '0', '0', '410200', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1571', '龙亭区', '1', '1556', '1570', '0', '410202', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1572', '顺河回族区', '1', '1556', '1570', '0', '410203', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1573', '鼓楼区', '1', '1556', '1570', '0', '410204', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1574', '禹王台区', '1', '1556', '1570', '0', '410205', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1575', '金明区', '1', '1556', '1570', '0', '410211', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1576', '杞县', '1', '1556', '1570', '0', '410221', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1577', '通许县', '1', '1556', '1570', '0', '410222', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1578', '尉氏县', '1', '1556', '1570', '0', '410223', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1579', '开封县', '1', '1556', '1570', '0', '410224', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1580', '兰考县', '1', '1556', '1570', '0', '410225', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1581', '洛阳市', '1', '1556', '0', '0', '410300', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1582', '老城区', '1', '1556', '1581', '0', '410302', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1583', '西工区', '1', '1556', '1581', '0', '410303', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1584', '瀍河回族区', '1', '1556', '1581', '0', '410304', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1585', '涧西区', '1', '1556', '1581', '0', '410305', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1586', '吉利区', '1', '1556', '1581', '0', '410306', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1587', '洛龙区', '1', '1556', '1581', '0', '410311', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1588', '孟津县', '1', '1556', '1581', '0', '410322', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1589', '新安县', '1', '1556', '1581', '0', '410323', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1590', '栾川县', '1', '1556', '1581', '0', '410324', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1591', '嵩县', '1', '1556', '1581', '0', '410325', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1592', '汝阳县', '1', '1556', '1581', '0', '410326', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1593', '宜阳县', '1', '1556', '1581', '0', '410327', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1594', '洛宁县', '1', '1556', '1581', '0', '410328', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1595', '伊川县', '1', '1556', '1581', '0', '410329', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1596', '偃师市', '1', '1556', '1581', '0', '410381', '0', '2014-06-04 04:51:26', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1597', '平顶山市', '1', '1556', '0', '0', '410400', '0', '2014-06-04 04:51:26', '2014-06-04 04:51:26');
INSERT INTO `regions` VALUES ('1598', '新华区', '1', '1556', '1597', '0', '410402', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1599', '卫东区', '1', '1556', '1597', '0', '410403', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1600', '石龙区', '1', '1556', '1597', '0', '410404', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1601', '湛河区', '1', '1556', '1597', '0', '410411', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1602', '宝丰县', '1', '1556', '1597', '0', '410421', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:00');
INSERT INTO `regions` VALUES ('1603', '叶县', '1', '1556', '1597', '0', '410422', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1604', '鲁山县', '1', '1556', '1597', '0', '410423', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1605', '郏县', '1', '1556', '1597', '0', '410425', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1606', '舞钢市', '1', '1556', '1597', '0', '410481', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1607', '汝州市', '1', '1556', '1597', '0', '410482', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1608', '安阳市', '1', '1556', '0', '0', '410500', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1609', '文峰区', '1', '1556', '1608', '0', '410502', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1610', '北关区', '1', '1556', '1608', '0', '410503', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1611', '殷都区', '1', '1556', '1608', '0', '410505', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1612', '龙安区', '1', '1556', '1608', '0', '410506', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1613', '安阳县', '1', '1556', '1608', '0', '410522', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1614', '汤阴县', '1', '1556', '1608', '0', '410523', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1615', '滑县', '1', '1556', '1608', '0', '410526', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1616', '内黄县', '1', '1556', '1608', '0', '410527', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1617', '林州市', '1', '1556', '1608', '0', '410581', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1618', '鹤壁市', '1', '1556', '0', '0', '410600', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1619', '鹤山区', '1', '1556', '1618', '0', '410602', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1620', '山城区', '1', '1556', '1618', '0', '410603', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1621', '淇滨区', '1', '1556', '1618', '0', '410611', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1622', '浚县', '1', '1556', '1618', '0', '410621', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1623', '淇县', '1', '1556', '1618', '0', '410622', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1624', '新乡市', '1', '1556', '0', '0', '410700', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1625', '红旗区', '1', '1556', '1624', '0', '410702', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1626', '卫滨区', '1', '1556', '1624', '0', '410703', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1627', '凤泉区', '1', '1556', '1624', '0', '410704', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1628', '牧野区', '1', '1556', '1624', '0', '410711', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1629', '新乡县', '1', '1556', '1624', '0', '410721', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1630', '获嘉县', '1', '1556', '1624', '0', '410724', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1631', '原阳县', '1', '1556', '1624', '0', '410725', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1632', '延津县', '1', '1556', '1624', '0', '410726', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1633', '封丘县', '1', '1556', '1624', '0', '410727', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1634', '长垣县', '1', '1556', '1624', '0', '410728', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1635', '卫辉市', '1', '1556', '1624', '0', '410781', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1636', '辉县市', '1', '1556', '1624', '0', '410782', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1637', '焦作市', '1', '1556', '0', '0', '410800', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1638', '解放区', '1', '1556', '1637', '0', '410802', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1639', '中站区', '1', '1556', '1637', '0', '410803', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1640', '马村区', '1', '1556', '1637', '0', '410804', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1641', '山阳区', '1', '1556', '1637', '0', '410811', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1642', '修武县', '1', '1556', '1637', '0', '410821', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1643', '博爱县', '1', '1556', '1637', '0', '410822', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1644', '武陟县', '1', '1556', '1637', '0', '410823', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1645', '温县', '1', '1556', '1637', '0', '410825', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1646', '沁阳市', '1', '1556', '1637', '0', '410882', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1647', '孟州市', '1', '1556', '1637', '0', '410883', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1648', '濮阳市', '1', '1556', '0', '0', '410900', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1649', '华龙区', '1', '1556', '1648', '0', '410902', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1650', '清丰县', '1', '1556', '1648', '0', '410922', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1651', '南乐县', '1', '1556', '1648', '0', '410923', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1652', '范县', '1', '1556', '1648', '0', '410926', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1653', '台前县', '1', '1556', '1648', '0', '410927', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1654', '濮阳县', '1', '1556', '1648', '0', '410928', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1655', '许昌市', '1', '1556', '0', '0', '411000', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1656', '魏都区', '1', '1556', '1655', '0', '411002', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1657', '许昌县', '1', '1556', '1655', '0', '411023', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1658', '鄢陵县', '1', '1556', '1655', '0', '411024', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1659', '襄城县', '1', '1556', '1655', '0', '411025', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1660', '禹州市', '1', '1556', '1655', '0', '411081', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1661', '长葛市', '1', '1556', '1655', '0', '411082', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1662', '漯河市', '1', '1556', '0', '0', '411100', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1663', '源汇区', '1', '1556', '1662', '0', '411102', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1664', '郾城区', '1', '1556', '1662', '0', '411103', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1665', '召陵区', '1', '1556', '1662', '0', '411104', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1666', '舞阳县', '1', '1556', '1662', '0', '411121', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1667', '临颍县', '1', '1556', '1662', '0', '411122', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1668', '三门峡市', '1', '1556', '0', '0', '411200', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1669', '湖滨区', '1', '1556', '1668', '0', '411202', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1670', '渑池县', '1', '1556', '1668', '0', '411221', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1671', '陕县', '1', '1556', '1668', '0', '411222', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1672', '卢氏县', '1', '1556', '1668', '0', '411224', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1673', '义马市', '1', '1556', '1668', '0', '411281', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1674', '灵宝市', '1', '1556', '1668', '0', '411282', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1675', '南阳市', '1', '1556', '0', '0', '411300', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1676', '宛城区', '1', '1556', '1675', '0', '411302', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1677', '卧龙区', '1', '1556', '1675', '0', '411303', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1678', '南召县', '1', '1556', '1675', '0', '411321', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1679', '方城县', '1', '1556', '1675', '0', '411322', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1680', '西峡县', '1', '1556', '1675', '0', '411323', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1681', '镇平县', '1', '1556', '1675', '0', '411324', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1682', '内乡县', '1', '1556', '1675', '0', '411325', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1683', '淅川县', '1', '1556', '1675', '0', '411326', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1684', '社旗县', '1', '1556', '1675', '0', '411327', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1685', '唐河县', '1', '1556', '1675', '0', '411328', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1686', '新野县', '1', '1556', '1675', '0', '411329', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1687', '桐柏县', '1', '1556', '1675', '0', '411330', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1688', '邓州市', '1', '1556', '1675', '0', '411381', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1689', '商丘市', '1', '1556', '0', '0', '411400', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1690', '梁园区', '1', '1556', '1689', '0', '411402', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1691', '睢阳区', '1', '1556', '1689', '0', '411403', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1692', '民权县', '1', '1556', '1689', '0', '411421', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1693', '睢县', '1', '1556', '1689', '0', '411422', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1694', '宁陵县', '1', '1556', '1689', '0', '411423', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1695', '柘城县', '1', '1556', '1689', '0', '411424', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1696', '虞城县', '1', '1556', '1689', '0', '411425', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1697', '夏邑县', '1', '1556', '1689', '0', '411426', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1698', '永城市', '1', '1556', '1689', '0', '411481', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1699', '信阳市', '1', '1556', '0', '0', '411500', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1700', '浉河区', '1', '1556', '1699', '0', '411502', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1701', '平桥区', '1', '1556', '1699', '0', '411503', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1702', '罗山县', '1', '1556', '1699', '0', '411521', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1703', '光山县', '1', '1556', '1699', '0', '411522', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1704', '新县', '1', '1556', '1699', '0', '411523', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1705', '商城县', '1', '1556', '1699', '0', '411524', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1706', '固始县', '1', '1556', '1699', '0', '411525', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1707', '潢川县', '1', '1556', '1699', '0', '411526', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1708', '淮滨县', '1', '1556', '1699', '0', '411527', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1709', '息县', '1', '1556', '1699', '0', '411528', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1710', '周口市', '1', '1556', '0', '0', '411600', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1711', '川汇区', '1', '1556', '1710', '0', '411602', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1712', '扶沟县', '1', '1556', '1710', '0', '411621', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1713', '西华县', '1', '1556', '1710', '0', '411622', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1714', '商水县', '1', '1556', '1710', '0', '411623', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1715', '沈丘县', '1', '1556', '1710', '0', '411624', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1716', '郸城县', '1', '1556', '1710', '0', '411625', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1717', '淮阳县', '1', '1556', '1710', '0', '411626', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1718', '太康县', '1', '1556', '1710', '0', '411627', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1719', '鹿邑县', '1', '1556', '1710', '0', '411628', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1720', '项城市', '1', '1556', '1710', '0', '411681', '0', '2014-06-04 04:51:27', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1721', '驻马店市', '1', '1556', '0', '0', '411700', '0', '2014-06-04 04:51:27', '2014-06-04 04:51:27');
INSERT INTO `regions` VALUES ('1722', '驿城区', '1', '1556', '1721', '0', '411702', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1723', '西平县', '1', '1556', '1721', '0', '411721', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1724', '上蔡县', '1', '1556', '1721', '0', '411722', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1725', '平舆县', '1', '1556', '1721', '0', '411723', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1726', '正阳县', '1', '1556', '1721', '0', '411724', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1727', '确山县', '1', '1556', '1721', '0', '411725', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1728', '泌阳县', '1', '1556', '1721', '0', '411726', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1729', '汝南县', '1', '1556', '1721', '0', '411727', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1730', '遂平县', '1', '1556', '1721', '0', '411728', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1731', '新蔡县', '1', '1556', '1721', '0', '411729', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1732', '省直辖县级行政区划', '1', '1556', '0', '0', '419000', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1733', '济源市', '1', '1556', '1732', '0', '419001', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1734', '湖北省', '1', '0', '0', '0', '420000', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1735', '武汉市', '1', '1734', '0', '0', '420100', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1736', '江岸区', '1', '1734', '1735', '0', '420102', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1737', '江汉区', '1', '1734', '1735', '0', '420103', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1738', '硚口区', '1', '1734', '1735', '0', '420104', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1739', '汉阳区', '1', '1734', '1735', '0', '420105', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1740', '武昌区', '1', '1734', '1735', '0', '420106', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1741', '青山区', '1', '1734', '1735', '0', '420107', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1742', '洪山区', '1', '1734', '1735', '0', '420111', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1743', '东西湖区', '1', '1734', '1735', '0', '420112', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1744', '汉南区', '1', '1734', '1735', '0', '420113', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1745', '蔡甸区', '1', '1734', '1735', '0', '420114', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1746', '江夏区', '1', '1734', '1735', '0', '420115', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1747', '黄陂区', '1', '1734', '1735', '0', '420116', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1748', '新洲区', '1', '1734', '1735', '0', '420117', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1749', '黄石市', '1', '1734', '0', '0', '420200', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1750', '黄石港区', '1', '1734', '1749', '0', '420202', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1751', '西塞山区', '1', '1734', '1749', '0', '420203', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1752', '下陆区', '1', '1734', '1749', '0', '420204', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1753', '铁山区', '1', '1734', '1749', '0', '420205', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1754', '阳新县', '1', '1734', '1749', '0', '420222', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1755', '大冶市', '1', '1734', '1749', '0', '420281', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1756', '十堰市', '1', '1734', '0', '0', '420300', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1757', '茅箭区', '1', '1734', '1756', '0', '420302', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:01');
INSERT INTO `regions` VALUES ('1758', '张湾区', '1', '1734', '1756', '0', '420303', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1759', '郧县', '1', '1734', '1756', '0', '420321', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1760', '郧西县', '1', '1734', '1756', '0', '420322', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1761', '竹山县', '1', '1734', '1756', '0', '420323', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1762', '竹溪县', '1', '1734', '1756', '0', '420324', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1763', '房县', '1', '1734', '1756', '0', '420325', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1764', '丹江口市', '1', '1734', '1756', '0', '420381', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1765', '宜昌市', '1', '1734', '0', '0', '420500', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1766', '西陵区', '1', '1734', '1765', '0', '420502', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1767', '伍家岗区', '1', '1734', '1765', '0', '420503', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1768', '点军区', '1', '1734', '1765', '0', '420504', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1769', '猇亭区', '1', '1734', '1765', '0', '420505', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1770', '夷陵区', '1', '1734', '1765', '0', '420506', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1771', '远安县', '1', '1734', '1765', '0', '420525', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1772', '兴山县', '1', '1734', '1765', '0', '420526', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1773', '秭归县', '1', '1734', '1765', '0', '420527', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1774', '长阳土家族自治县', '1', '1734', '1765', '0', '420528', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1775', '五峰土家族自治县', '1', '1734', '1765', '0', '420529', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1776', '宜都市', '1', '1734', '1765', '0', '420581', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1777', '当阳市', '1', '1734', '1765', '0', '420582', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1778', '枝江市', '1', '1734', '1765', '0', '420583', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1779', '襄樊市', '1', '1734', '0', '0', '420600', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1780', '襄城区', '1', '1734', '1779', '0', '420602', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1781', '樊城区', '1', '1734', '1779', '0', '420606', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1782', '襄阳区', '1', '1734', '1779', '0', '420607', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1783', '南漳县', '1', '1734', '1779', '0', '420624', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1784', '谷城县', '1', '1734', '1779', '0', '420625', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1785', '保康县', '1', '1734', '1779', '0', '420626', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1786', '老河口市', '1', '1734', '1779', '0', '420682', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1787', '枣阳市', '1', '1734', '1779', '0', '420683', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1788', '宜城市', '1', '1734', '1779', '0', '420684', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1789', '鄂州市', '1', '1734', '0', '0', '420700', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1790', '梁子湖区', '1', '1734', '1789', '0', '420702', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1791', '华容区', '1', '1734', '1789', '0', '420703', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1792', '鄂城区', '1', '1734', '1789', '0', '420704', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1793', '荆门市', '1', '1734', '0', '0', '420800', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1794', '东宝区', '1', '1734', '1793', '0', '420802', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1795', '掇刀区', '1', '1734', '1793', '0', '420804', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1796', '京山县', '1', '1734', '1793', '0', '420821', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1797', '沙洋县', '1', '1734', '1793', '0', '420822', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1798', '钟祥市', '1', '1734', '1793', '0', '420881', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1799', '孝感市', '1', '1734', '0', '0', '420900', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1800', '孝南区', '1', '1734', '1799', '0', '420902', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1801', '孝昌县', '1', '1734', '1799', '0', '420921', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1802', '大悟县', '1', '1734', '1799', '0', '420922', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1803', '云梦县', '1', '1734', '1799', '0', '420923', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1804', '应城市', '1', '1734', '1799', '0', '420981', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1805', '安陆市', '1', '1734', '1799', '0', '420982', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1806', '汉川市', '1', '1734', '1799', '0', '420984', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1807', '荆州市', '1', '1734', '0', '0', '421000', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1808', '沙市区', '1', '1734', '1807', '0', '421002', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1809', '荆州区', '1', '1734', '1807', '0', '421003', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1810', '公安县', '1', '1734', '1807', '0', '421022', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1811', '监利县', '1', '1734', '1807', '0', '421023', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1812', '江陵县', '1', '1734', '1807', '0', '421024', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1813', '石首市', '1', '1734', '1807', '0', '421081', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1814', '洪湖市', '1', '1734', '1807', '0', '421083', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1815', '松滋市', '1', '1734', '1807', '0', '421087', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1816', '黄冈市', '1', '1734', '0', '0', '421100', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1817', '黄州区', '1', '1734', '1816', '0', '421102', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1818', '团风县', '1', '1734', '1816', '0', '421121', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1819', '红安县', '1', '1734', '1816', '0', '421122', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1820', '罗田县', '1', '1734', '1816', '0', '421123', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1821', '英山县', '1', '1734', '1816', '0', '421124', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1822', '浠水县', '1', '1734', '1816', '0', '421125', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1823', '蕲春县', '1', '1734', '1816', '0', '421126', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1824', '黄梅县', '1', '1734', '1816', '0', '421127', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1825', '麻城市', '1', '1734', '1816', '0', '421181', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1826', '武穴市', '1', '1734', '1816', '0', '421182', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1827', '咸宁市', '1', '1734', '0', '0', '421200', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1828', '咸安区', '1', '1734', '1827', '0', '421202', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1829', '嘉鱼县', '1', '1734', '1827', '0', '421221', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1830', '通城县', '1', '1734', '1827', '0', '421222', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1831', '崇阳县', '1', '1734', '1827', '0', '421223', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1832', '通山县', '1', '1734', '1827', '0', '421224', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1833', '赤壁市', '1', '1734', '1827', '0', '421281', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1834', '随州市', '1', '1734', '0', '0', '421300', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1835', '曾都区', '1', '1734', '1834', '0', '421303', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1836', '随县', '1', '1734', '1834', '0', '421321', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1837', '广水市', '1', '1734', '1834', '0', '421381', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1838', '恩施土家族苗族自治州', '1', '1734', '0', '0', '422800', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1839', '恩施市', '1', '1734', '1838', '0', '422801', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1840', '利川市', '1', '1734', '1838', '0', '422802', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1841', '建始县', '1', '1734', '1838', '0', '422822', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1842', '巴东县', '1', '1734', '1838', '0', '422823', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1843', '宣恩县', '1', '1734', '1838', '0', '422825', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1844', '咸丰县', '1', '1734', '1838', '0', '422826', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1845', '来凤县', '1', '1734', '1838', '0', '422827', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1846', '鹤峰县', '1', '1734', '1838', '0', '422828', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1847', '省直辖县级行政区划', '1', '1734', '0', '0', '429000', '0', '2014-06-04 04:51:28', '2014-06-04 04:51:28');
INSERT INTO `regions` VALUES ('1848', '仙桃市', '1', '1734', '1847', '0', '429004', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1849', '潜江市', '1', '1734', '1847', '0', '429005', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1850', '天门市', '1', '1734', '1847', '0', '429006', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1851', '神农架林区', '1', '1734', '1847', '0', '429021', '0', '2014-06-04 04:51:28', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1852', '湖南省', '1', '0', '0', '0', '430000', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1853', '长沙市', '1', '1852', '0', '0', '430100', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1854', '芙蓉区', '1', '1852', '1853', '0', '430102', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1855', '天心区', '1', '1852', '1853', '0', '430103', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1856', '岳麓区', '1', '1852', '1853', '0', '430104', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1857', '开福区', '1', '1852', '1853', '0', '430105', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1858', '雨花区', '1', '1852', '1853', '0', '430111', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1859', '望城区', '1', '1852', '1853', '0', '430112', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1860', '长沙县', '1', '1852', '1853', '0', '430121', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1861', '宁乡县', '1', '1852', '1853', '0', '430124', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1862', '浏阳市', '1', '1852', '1853', '0', '430181', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1863', '株洲市', '1', '1852', '0', '0', '430200', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1864', '荷塘区', '1', '1852', '1863', '0', '430202', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1865', '芦淞区', '1', '1852', '1863', '0', '430203', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1866', '石峰区', '1', '1852', '1863', '0', '430204', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1867', '天元区', '1', '1852', '1863', '0', '430211', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1868', '株洲县', '1', '1852', '1863', '0', '430221', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1869', '攸县', '1', '1852', '1863', '0', '430223', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1870', '茶陵县', '1', '1852', '1863', '0', '430224', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1871', '炎陵县', '1', '1852', '1863', '0', '430225', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1872', '醴陵市', '1', '1852', '1863', '0', '430281', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1873', '湘潭市', '1', '1852', '0', '0', '430300', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1874', '雨湖区', '1', '1852', '1873', '0', '430302', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1875', '岳塘区', '1', '1852', '1873', '0', '430304', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1876', '湘潭县', '1', '1852', '1873', '0', '430321', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1877', '湘乡市', '1', '1852', '1873', '0', '430381', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1878', '韶山市', '1', '1852', '1873', '0', '430382', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1879', '衡阳市', '1', '1852', '0', '0', '430400', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1880', '珠晖区', '1', '1852', '1879', '0', '430405', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1881', '雁峰区', '1', '1852', '1879', '0', '430406', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1882', '石鼓区', '1', '1852', '1879', '0', '430407', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1883', '蒸湘区', '1', '1852', '1879', '0', '430408', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1884', '南岳区', '1', '1852', '1879', '0', '430412', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1885', '衡阳县', '1', '1852', '1879', '0', '430421', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1886', '衡南县', '1', '1852', '1879', '0', '430422', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1887', '衡山县', '1', '1852', '1879', '0', '430423', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1888', '衡东县', '1', '1852', '1879', '0', '430424', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1889', '祁东县', '1', '1852', '1879', '0', '430426', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1890', '耒阳市', '1', '1852', '1879', '0', '430481', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1891', '常宁市', '1', '1852', '1879', '0', '430482', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1892', '邵阳市', '1', '1852', '0', '0', '430500', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1893', '双清区', '1', '1852', '1892', '0', '430502', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1894', '大祥区', '1', '1852', '1892', '0', '430503', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1895', '北塔区', '1', '1852', '1892', '0', '430511', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1896', '邵东县', '1', '1852', '1892', '0', '430521', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1897', '新邵县', '1', '1852', '1892', '0', '430522', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1898', '邵阳县', '1', '1852', '1892', '0', '430523', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1899', '隆回县', '1', '1852', '1892', '0', '430524', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1900', '洞口县', '1', '1852', '1892', '0', '430525', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1901', '绥宁县', '1', '1852', '1892', '0', '430527', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1902', '新宁县', '1', '1852', '1892', '0', '430528', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1903', '城步苗族自治县', '1', '1852', '1892', '0', '430529', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1904', '武冈市', '1', '1852', '1892', '0', '430581', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1905', '岳阳市', '1', '1852', '0', '0', '430600', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1906', '岳阳楼区', '1', '1852', '1905', '0', '430602', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1907', '云溪区', '1', '1852', '1905', '0', '430603', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1908', '君山区', '1', '1852', '1905', '0', '430611', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1909', '岳阳县', '1', '1852', '1905', '0', '430621', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1910', '华容县', '1', '1852', '1905', '0', '430623', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1911', '湘阴县', '1', '1852', '1905', '0', '430624', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1912', '平江县', '1', '1852', '1905', '0', '430626', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1913', '汨罗市', '1', '1852', '1905', '0', '430681', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1914', '临湘市', '1', '1852', '1905', '0', '430682', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1915', '常德市', '1', '1852', '0', '0', '430700', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1916', '武陵区', '1', '1852', '1915', '0', '430702', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1917', '鼎城区', '1', '1852', '1915', '0', '430703', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1918', '安乡县', '1', '1852', '1915', '0', '430721', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1919', '汉寿县', '1', '1852', '1915', '0', '430722', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1920', '澧县', '1', '1852', '1915', '0', '430723', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1921', '临澧县', '1', '1852', '1915', '0', '430724', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1922', '桃源县', '1', '1852', '1915', '0', '430725', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1923', '石门县', '1', '1852', '1915', '0', '430726', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1924', '津市市', '1', '1852', '1915', '0', '430781', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1925', '张家界市', '1', '1852', '0', '0', '430800', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1926', '永定区', '1', '1852', '1925', '0', '430802', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1927', '武陵源区', '1', '1852', '1925', '0', '430811', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1928', '慈利县', '1', '1852', '1925', '0', '430821', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:02');
INSERT INTO `regions` VALUES ('1929', '桑植县', '1', '1852', '1925', '0', '430822', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1930', '益阳市', '1', '1852', '0', '0', '430900', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1931', '资阳区', '1', '1852', '1930', '0', '430902', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1932', '赫山区', '1', '1852', '1930', '0', '430903', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1933', '南县', '1', '1852', '1930', '0', '430921', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1934', '桃江县', '1', '1852', '1930', '0', '430922', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1935', '安化县', '1', '1852', '1930', '0', '430923', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1936', '沅江市', '1', '1852', '1930', '0', '430981', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1937', '郴州市', '1', '1852', '0', '0', '431000', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1938', '北湖区', '1', '1852', '1937', '0', '431002', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1939', '苏仙区', '1', '1852', '1937', '0', '431003', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1940', '桂阳县', '1', '1852', '1937', '0', '431021', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1941', '宜章县', '1', '1852', '1937', '0', '431022', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1942', '永兴县', '1', '1852', '1937', '0', '431023', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1943', '嘉禾县', '1', '1852', '1937', '0', '431024', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1944', '临武县', '1', '1852', '1937', '0', '431025', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1945', '汝城县', '1', '1852', '1937', '0', '431026', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1946', '桂东县', '1', '1852', '1937', '0', '431027', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1947', '安仁县', '1', '1852', '1937', '0', '431028', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1948', '资兴市', '1', '1852', '1937', '0', '431081', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1949', '永州市', '1', '1852', '0', '0', '431100', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1950', '零陵区', '1', '1852', '1949', '0', '431102', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1951', '冷水滩区', '1', '1852', '1949', '0', '431103', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1952', '祁阳县', '1', '1852', '1949', '0', '431121', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1953', '东安县', '1', '1852', '1949', '0', '431122', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1954', '双牌县', '1', '1852', '1949', '0', '431123', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1955', '道县', '1', '1852', '1949', '0', '431124', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1956', '江永县', '1', '1852', '1949', '0', '431125', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1957', '宁远县', '1', '1852', '1949', '0', '431126', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1958', '蓝山县', '1', '1852', '1949', '0', '431127', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1959', '新田县', '1', '1852', '1949', '0', '431128', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1960', '江华瑶族自治县', '1', '1852', '1949', '0', '431129', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1961', '怀化市', '1', '1852', '0', '0', '431200', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1962', '鹤城区', '1', '1852', '1961', '0', '431202', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1963', '中方县', '1', '1852', '1961', '0', '431221', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1964', '沅陵县', '1', '1852', '1961', '0', '431222', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1965', '辰溪县', '1', '1852', '1961', '0', '431223', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1966', '溆浦县', '1', '1852', '1961', '0', '431224', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1967', '会同县', '1', '1852', '1961', '0', '431225', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1968', '麻阳苗族自治县', '1', '1852', '1961', '0', '431226', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1969', '新晃侗族自治县', '1', '1852', '1961', '0', '431227', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1970', '芷江侗族自治县', '1', '1852', '1961', '0', '431228', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1971', '靖州苗族侗族自治县', '1', '1852', '1961', '0', '431229', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1972', '通道侗族自治县', '1', '1852', '1961', '0', '431230', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1973', '洪江市', '1', '1852', '1961', '0', '431281', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1974', '娄底市', '1', '1852', '0', '0', '431300', '0', '2014-06-04 04:51:29', '2014-06-04 04:51:29');
INSERT INTO `regions` VALUES ('1975', '娄星区', '1', '1852', '1974', '0', '431302', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1976', '双峰县', '1', '1852', '1974', '0', '431321', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1977', '新化县', '1', '1852', '1974', '0', '431322', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1978', '冷水江市', '1', '1852', '1974', '0', '431381', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1979', '涟源市', '1', '1852', '1974', '0', '431382', '0', '2014-06-04 04:51:29', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1980', '湘西土家族苗族自治州', '1', '1852', '0', '0', '433100', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('1981', '吉首市', '1', '1852', '1980', '0', '433101', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1982', '泸溪县', '1', '1852', '1980', '0', '433122', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1983', '凤凰县', '1', '1852', '1980', '0', '433123', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1984', '花垣县', '1', '1852', '1980', '0', '433124', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1985', '保靖县', '1', '1852', '1980', '0', '433125', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1986', '古丈县', '1', '1852', '1980', '0', '433126', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1987', '永顺县', '1', '1852', '1980', '0', '433127', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1988', '龙山县', '1', '1852', '1980', '0', '433130', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1989', '广东省', '1', '0', '0', '0', '440000', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('1990', '广州市', '1', '1989', '0', '0', '440100', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('1991', '荔湾区', '1', '1989', '1990', '0', '440103', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1992', '越秀区', '1', '1989', '1990', '0', '440104', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1993', '海珠区', '1', '1989', '1990', '0', '440105', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1994', '天河区', '1', '1989', '1990', '0', '440106', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1995', '白云区', '1', '1989', '1990', '0', '440111', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1996', '黄埔区', '1', '1989', '1990', '0', '440112', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1997', '番禺区', '1', '1989', '1990', '0', '440113', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1998', '花都区', '1', '1989', '1990', '0', '440114', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('1999', '南沙区', '1', '1989', '1990', '0', '440115', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2000', '萝岗区', '1', '1989', '1990', '0', '440116', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2001', '增城市', '1', '1989', '1990', '0', '440183', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2002', '从化市', '1', '1989', '1990', '0', '440184', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2003', '韶关市', '1', '1989', '0', '0', '440200', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2004', '武江区', '1', '1989', '2003', '0', '440203', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2005', '浈江区', '1', '1989', '2003', '0', '440204', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2006', '曲江区', '1', '1989', '2003', '0', '440205', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2007', '始兴县', '1', '1989', '2003', '0', '440222', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2008', '仁化县', '1', '1989', '2003', '0', '440224', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2009', '翁源县', '1', '1989', '2003', '0', '440229', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2010', '乳源瑶族自治县', '1', '1989', '2003', '0', '440232', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2011', '新丰县', '1', '1989', '2003', '0', '440233', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2012', '乐昌市', '1', '1989', '2003', '0', '440281', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2013', '南雄市', '1', '1989', '2003', '0', '440282', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2014', '深圳市', '1', '1989', '0', '0', '440300', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2015', '罗湖区', '1', '1989', '2014', '0', '440303', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2016', '福田区', '1', '1989', '2014', '0', '440304', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2017', '南山区', '1', '1989', '2014', '0', '440305', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2018', '宝安区', '1', '1989', '2014', '0', '440306', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2019', '龙岗区', '1', '1989', '2014', '0', '440307', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2020', '盐田区', '1', '1989', '2014', '0', '440308', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2021', '珠海市', '1', '1989', '0', '0', '440400', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2022', '香洲区', '1', '1989', '2021', '0', '440402', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2023', '斗门区', '1', '1989', '2021', '0', '440403', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2024', '金湾区', '1', '1989', '2021', '0', '440404', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2025', '汕头市', '1', '1989', '0', '0', '440500', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2026', '龙湖区', '1', '1989', '2025', '0', '440507', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2027', '金平区', '1', '1989', '2025', '0', '440511', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2028', '濠江区', '1', '1989', '2025', '0', '440512', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2029', '潮阳区', '1', '1989', '2025', '0', '440513', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2030', '潮南区', '1', '1989', '2025', '0', '440514', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2031', '澄海区', '1', '1989', '2025', '0', '440515', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2032', '南澳县', '1', '1989', '2025', '0', '440523', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2033', '佛山市', '1', '1989', '0', '0', '440600', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2034', '禅城区', '1', '1989', '2033', '0', '440604', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2035', '南海区', '1', '1989', '2033', '0', '440605', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2036', '顺德区', '1', '1989', '2033', '0', '440606', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2037', '三水区', '1', '1989', '2033', '0', '440607', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2038', '高明区', '1', '1989', '2033', '0', '440608', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2039', '江门市', '1', '1989', '0', '0', '440700', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2040', '蓬江区', '1', '1989', '2039', '0', '440703', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2041', '江海区', '1', '1989', '2039', '0', '440704', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2042', '新会区', '1', '1989', '2039', '0', '440705', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2043', '台山市', '1', '1989', '2039', '0', '440781', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2044', '开平市', '1', '1989', '2039', '0', '440783', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2045', '鹤山市', '1', '1989', '2039', '0', '440784', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2046', '恩平市', '1', '1989', '2039', '0', '440785', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2047', '湛江市', '1', '1989', '0', '0', '440800', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2048', '赤坎区', '1', '1989', '2047', '0', '440802', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2049', '霞山区', '1', '1989', '2047', '0', '440803', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2050', '坡头区', '1', '1989', '2047', '0', '440804', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2051', '麻章区', '1', '1989', '2047', '0', '440811', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2052', '遂溪县', '1', '1989', '2047', '0', '440823', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2053', '徐闻县', '1', '1989', '2047', '0', '440825', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2054', '廉江市', '1', '1989', '2047', '0', '440881', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2055', '雷州市', '1', '1989', '2047', '0', '440882', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2056', '吴川市', '1', '1989', '2047', '0', '440883', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2057', '茂名市', '1', '1989', '0', '0', '440900', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2058', '茂南区', '1', '1989', '2057', '0', '440902', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2059', '茂港区', '1', '1989', '2057', '0', '440903', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2060', '电白县', '1', '1989', '2057', '0', '440923', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2061', '高州市', '1', '1989', '2057', '0', '440981', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2062', '化州市', '1', '1989', '2057', '0', '440982', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2063', '信宜市', '1', '1989', '2057', '0', '440983', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2064', '肇庆市', '1', '1989', '0', '0', '441200', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2065', '端州区', '1', '1989', '2064', '0', '441202', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2066', '鼎湖区', '1', '1989', '2064', '0', '441203', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2067', '广宁县', '1', '1989', '2064', '0', '441223', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2068', '怀集县', '1', '1989', '2064', '0', '441224', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2069', '封开县', '1', '1989', '2064', '0', '441225', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2070', '德庆县', '1', '1989', '2064', '0', '441226', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2071', '高要市', '1', '1989', '2064', '0', '441283', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2072', '四会市', '1', '1989', '2064', '0', '441284', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2073', '惠州市', '1', '1989', '0', '0', '441300', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2074', '惠城区', '1', '1989', '2073', '0', '441302', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2075', '惠阳区', '1', '1989', '2073', '0', '441303', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2076', '博罗县', '1', '1989', '2073', '0', '441322', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2077', '惠东县', '1', '1989', '2073', '0', '441323', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2078', '龙门县', '1', '1989', '2073', '0', '441324', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2079', '梅州市', '1', '1989', '0', '0', '441400', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2080', '梅江区', '1', '1989', '2079', '0', '441402', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2081', '梅县', '1', '1989', '2079', '0', '441421', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2082', '大埔县', '1', '1989', '2079', '0', '441422', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2083', '丰顺县', '1', '1989', '2079', '0', '441423', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2084', '五华县', '1', '1989', '2079', '0', '441424', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2085', '平远县', '1', '1989', '2079', '0', '441426', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2086', '蕉岭县', '1', '1989', '2079', '0', '441427', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2087', '兴宁市', '1', '1989', '2079', '0', '441481', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2088', '汕尾市', '1', '1989', '0', '0', '441500', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2089', '城区', '1', '1989', '2088', '0', '441502', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2090', '海丰县', '1', '1989', '2088', '0', '441521', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2091', '陆河县', '1', '1989', '2088', '0', '441523', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2092', '陆丰市', '1', '1989', '2088', '0', '441581', '0', '2014-06-04 04:51:30', '2014-08-23 03:22:03');
INSERT INTO `regions` VALUES ('2093', '河源市', '1', '1989', '0', '0', '441600', '0', '2014-06-04 04:51:30', '2014-06-04 04:51:30');
INSERT INTO `regions` VALUES ('2094', '源城区', '1', '1989', '2093', '0', '441602', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2095', '紫金县', '1', '1989', '2093', '0', '441621', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2096', '龙川县', '1', '1989', '2093', '0', '441622', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2097', '连平县', '1', '1989', '2093', '0', '441623', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2098', '和平县', '1', '1989', '2093', '0', '441624', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2099', '东源县', '1', '1989', '2093', '0', '441625', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2100', '阳江市', '1', '1989', '0', '0', '441700', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2101', '江城区', '1', '1989', '2100', '0', '441702', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2102', '阳西县', '1', '1989', '2100', '0', '441721', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2103', '阳东县', '1', '1989', '2100', '0', '441723', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2104', '阳春市', '1', '1989', '2100', '0', '441781', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2105', '清远市', '1', '1989', '0', '0', '441800', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2106', '清城区', '1', '1989', '2105', '0', '441802', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2107', '佛冈县', '1', '1989', '2105', '0', '441821', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2108', '阳山县', '1', '1989', '2105', '0', '441823', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2109', '连山壮族瑶族自治县', '1', '1989', '2105', '0', '441825', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2110', '连南瑶族自治县', '1', '1989', '2105', '0', '441826', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2111', '清新县', '1', '1989', '2105', '0', '441827', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2112', '英德市', '1', '1989', '2105', '0', '441881', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2113', '连州市', '1', '1989', '2105', '0', '441882', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2114', '东莞市', '1', '1989', '0', '0', '441900', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2115', '中山市', '1', '1989', '0', '0', '442000', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2116', '潮州市', '1', '1989', '0', '0', '445100', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2117', '湘桥区', '1', '1989', '2116', '0', '445102', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2118', '潮安县', '1', '1989', '2116', '0', '445121', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2119', '饶平县', '1', '1989', '2116', '0', '445122', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2120', '揭阳市', '1', '1989', '0', '0', '445200', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2121', '榕城区', '1', '1989', '2120', '0', '445202', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2122', '揭东县', '1', '1989', '2120', '0', '445221', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2123', '揭西县', '1', '1989', '2120', '0', '445222', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2124', '惠来县', '1', '1989', '2120', '0', '445224', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2125', '普宁市', '1', '1989', '2120', '0', '445281', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2126', '云浮市', '1', '1989', '0', '0', '445300', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2127', '云城区', '1', '1989', '2126', '0', '445302', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2128', '新兴县', '1', '1989', '2126', '0', '445321', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2129', '郁南县', '1', '1989', '2126', '0', '445322', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2130', '云安县', '1', '1989', '2126', '0', '445323', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2131', '罗定市', '1', '1989', '2126', '0', '445381', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2132', '广西壮族自治区', '1', '0', '0', '0', '450000', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2133', '南宁市', '1', '2132', '0', '0', '450100', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2134', '兴宁区', '1', '2132', '2133', '0', '450102', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2135', '青秀区', '1', '2132', '2133', '0', '450103', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2136', '江南区', '1', '2132', '2133', '0', '450105', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2137', '西乡塘区', '1', '2132', '2133', '0', '450107', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2138', '良庆区', '1', '2132', '2133', '0', '450108', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2139', '邕宁区', '1', '2132', '2133', '0', '450109', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2140', '武鸣县', '1', '2132', '2133', '0', '450122', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2141', '隆安县', '1', '2132', '2133', '0', '450123', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2142', '马山县', '1', '2132', '2133', '0', '450124', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2143', '上林县', '1', '2132', '2133', '0', '450125', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2144', '宾阳县', '1', '2132', '2133', '0', '450126', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2145', '横县', '1', '2132', '2133', '0', '450127', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2146', '柳州市', '1', '2132', '0', '0', '450200', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2147', '城中区', '1', '2132', '2146', '0', '450202', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2148', '鱼峰区', '1', '2132', '2146', '0', '450203', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2149', '柳南区', '1', '2132', '2146', '0', '450204', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2150', '柳北区', '1', '2132', '2146', '0', '450205', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2151', '柳江县', '1', '2132', '2146', '0', '450221', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2152', '柳城县', '1', '2132', '2146', '0', '450222', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2153', '鹿寨县', '1', '2132', '2146', '0', '450223', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2154', '融安县', '1', '2132', '2146', '0', '450224', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2155', '融水苗族自治县', '1', '2132', '2146', '0', '450225', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2156', '三江侗族自治县', '1', '2132', '2146', '0', '450226', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2157', '桂林市', '1', '2132', '0', '0', '450300', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2158', '秀峰区', '1', '2132', '2157', '0', '450302', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2159', '叠彩区', '1', '2132', '2157', '0', '450303', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2160', '象山区', '1', '2132', '2157', '0', '450304', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2161', '七星区', '1', '2132', '2157', '0', '450305', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2162', '雁山区', '1', '2132', '2157', '0', '450311', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2163', '阳朔县', '1', '2132', '2157', '0', '450321', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2164', '临桂县', '1', '2132', '2157', '0', '450322', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2165', '灵川县', '1', '2132', '2157', '0', '450323', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2166', '全州县', '1', '2132', '2157', '0', '450324', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2167', '兴安县', '1', '2132', '2157', '0', '450325', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2168', '永福县', '1', '2132', '2157', '0', '450326', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2169', '灌阳县', '1', '2132', '2157', '0', '450327', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2170', '龙胜各族自治县', '1', '2132', '2157', '0', '450328', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2171', '资源县', '1', '2132', '2157', '0', '450329', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2172', '平乐县', '1', '2132', '2157', '0', '450330', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2173', '荔蒲县', '1', '2132', '2157', '0', '450331', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2174', '恭城瑶族自治县', '1', '2132', '2157', '0', '450332', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2175', '梧州市', '1', '2132', '0', '0', '450400', '0', '2014-06-04 04:51:31', '2014-06-04 04:51:31');
INSERT INTO `regions` VALUES ('2176', '万秀区', '1', '2132', '2175', '0', '450403', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2177', '蝶山区', '1', '2132', '2175', '0', '450404', '0', '2014-06-04 04:51:31', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2178', '长洲区', '1', '2132', '2175', '0', '450405', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2179', '苍梧县', '1', '2132', '2175', '0', '450421', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2180', '藤县', '1', '2132', '2175', '0', '450422', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2181', '蒙山县', '1', '2132', '2175', '0', '450423', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2182', '岑溪市', '1', '2132', '2175', '0', '450481', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2183', '北海市', '1', '2132', '0', '0', '450500', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2184', '海城区', '1', '2132', '2183', '0', '450502', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2185', '银海区', '1', '2132', '2183', '0', '450503', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2186', '铁山港区', '1', '2132', '2183', '0', '450512', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2187', '合浦县', '1', '2132', '2183', '0', '450521', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2188', '防城港市', '1', '2132', '0', '0', '450600', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2189', '港口区', '1', '2132', '2188', '0', '450602', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2190', '防城区', '1', '2132', '2188', '0', '450603', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2191', '上思县', '1', '2132', '2188', '0', '450621', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2192', '东兴市', '1', '2132', '2188', '0', '450681', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2193', '钦州市', '1', '2132', '0', '0', '450700', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2194', '钦南区', '1', '2132', '2193', '0', '450702', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2195', '钦北区', '1', '2132', '2193', '0', '450703', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2196', '灵山县', '1', '2132', '2193', '0', '450721', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2197', '浦北县', '1', '2132', '2193', '0', '450722', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2198', '贵港市', '1', '2132', '0', '0', '450800', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2199', '港北区', '1', '2132', '2198', '0', '450802', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2200', '港南区', '1', '2132', '2198', '0', '450803', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2201', '覃塘区', '1', '2132', '2198', '0', '450804', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2202', '平南县', '1', '2132', '2198', '0', '450821', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2203', '桂平市', '1', '2132', '2198', '0', '450881', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2204', '玉林市', '1', '2132', '0', '0', '450900', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2205', '玉州区', '1', '2132', '2204', '0', '450902', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2206', '容县', '1', '2132', '2204', '0', '450921', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2207', '陆川县', '1', '2132', '2204', '0', '450922', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2208', '博白县', '1', '2132', '2204', '0', '450923', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2209', '兴业县', '1', '2132', '2204', '0', '450924', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2210', '北流市', '1', '2132', '2204', '0', '450981', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2211', '百色市', '1', '2132', '0', '0', '451000', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2212', '右江区', '1', '2132', '2211', '0', '451002', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2213', '田阳县', '1', '2132', '2211', '0', '451021', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2214', '田东县', '1', '2132', '2211', '0', '451022', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2215', '平果县', '1', '2132', '2211', '0', '451023', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2216', '德保县', '1', '2132', '2211', '0', '451024', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2217', '靖西县', '1', '2132', '2211', '0', '451025', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2218', '那坡县', '1', '2132', '2211', '0', '451026', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2219', '凌云县', '1', '2132', '2211', '0', '451027', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2220', '乐业县', '1', '2132', '2211', '0', '451028', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2221', '田林县', '1', '2132', '2211', '0', '451029', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2222', '西林县', '1', '2132', '2211', '0', '451030', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2223', '隆林各族自治县', '1', '2132', '2211', '0', '451031', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2224', '贺州市', '1', '2132', '0', '0', '451100', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2225', '八步区', '1', '2132', '2224', '0', '451102', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2226', '平桂管理区', '1', '2132', '2224', '0', '451119', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2227', '昭平县', '1', '2132', '2224', '0', '451121', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2228', '钟山县', '1', '2132', '2224', '0', '451122', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2229', '富川瑶族自治县', '1', '2132', '2224', '0', '451123', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2230', '河池市', '1', '2132', '0', '0', '451200', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2231', '金城江区', '1', '2132', '2230', '0', '451202', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2232', '南丹县', '1', '2132', '2230', '0', '451221', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2233', '天峨县', '1', '2132', '2230', '0', '451222', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2234', '凤山县', '1', '2132', '2230', '0', '451223', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2235', '东兰县', '1', '2132', '2230', '0', '451224', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2236', '罗城仫佬族自治县', '1', '2132', '2230', '0', '451225', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2237', '环江毛南族自治县', '1', '2132', '2230', '0', '451226', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2238', '巴马瑶族自治县', '1', '2132', '2230', '0', '451227', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2239', '都安瑶族自治县', '1', '2132', '2230', '0', '451228', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2240', '大化瑶族自治县', '1', '2132', '2230', '0', '451229', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2241', '宜州市', '1', '2132', '2230', '0', '451281', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2242', '来宾市', '1', '2132', '0', '0', '451300', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2243', '兴宾区', '1', '2132', '2242', '0', '451302', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2244', '忻城县', '1', '2132', '2242', '0', '451321', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2245', '象州县', '1', '2132', '2242', '0', '451322', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2246', '武宣县', '1', '2132', '2242', '0', '451323', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2247', '金秀瑶族自治县', '1', '2132', '2242', '0', '451324', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2248', '合山市', '1', '2132', '2242', '0', '451381', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2249', '崇左市', '1', '2132', '0', '0', '451400', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2250', '江洲区', '1', '2132', '2249', '0', '451402', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2251', '扶绥县', '1', '2132', '2249', '0', '451421', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2252', '宁明县', '1', '2132', '2249', '0', '451422', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2253', '龙州县', '1', '2132', '2249', '0', '451423', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2254', '大新县', '1', '2132', '2249', '0', '451424', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2255', '天等县', '1', '2132', '2249', '0', '451425', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2256', '凭祥市', '1', '2132', '2249', '0', '451481', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:04');
INSERT INTO `regions` VALUES ('2257', '海南省', '1', '0', '0', '0', '460000', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2258', '海口市', '1', '2257', '0', '0', '460100', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2259', '秀英区', '1', '2257', '2258', '0', '460105', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2260', '龙华区', '1', '2257', '2258', '0', '460106', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2261', '琼山区', '1', '2257', '2258', '0', '460107', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2262', '美兰区', '1', '2257', '2258', '0', '460108', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2263', '三亚市', '1', '2257', '0', '0', '460200', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2264', '省直辖县级行政区划', '1', '2257', '0', '0', '469000', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2265', '五指山市', '1', '2257', '2264', '0', '469001', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2266', '琼海市', '1', '2257', '2264', '0', '469002', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2267', '儋州市', '1', '2257', '2264', '0', '469003', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2268', '文昌市', '1', '2257', '2264', '0', '469005', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2269', '万宁市', '1', '2257', '2264', '0', '469006', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2270', '东方市', '1', '2257', '2264', '0', '469007', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2271', '定安县', '1', '2257', '2264', '0', '469021', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2272', '屯昌县', '1', '2257', '2264', '0', '469022', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2273', '澄迈县', '1', '2257', '2264', '0', '469023', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2274', '临高县', '1', '2257', '2264', '0', '469024', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2275', '白沙黎族自治县', '1', '2257', '2264', '0', '469025', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2276', '昌江黎族自治县', '1', '2257', '2264', '0', '469026', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2277', '乐东黎族自治县', '1', '2257', '2264', '0', '469027', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2278', '陵水黎族自治县', '1', '2257', '2264', '0', '469028', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2279', '保亭黎族苗族自治县', '1', '2257', '2264', '0', '469029', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2280', '琼中黎族苗族自治县', '1', '2257', '2264', '0', '469030', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2281', '西沙群岛', '1', '2257', '2264', '0', '469031', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2282', '南沙群岛', '1', '2257', '2264', '0', '469032', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2283', '中沙群岛的岛礁及其海域', '1', '2257', '2264', '0', '469033', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2284', '重庆市', '1', '0', '0', '0', '500000', '0', '2014-06-04 04:51:32', '2014-06-04 04:51:32');
INSERT INTO `regions` VALUES ('2285', '万州区', '1', '2284', '3501', '0', '500101', '0', '2014-06-04 04:51:32', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2286', '涪陵区', '1', '2284', '3501', '0', '500102', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2287', '渝中区', '1', '2284', '3501', '0', '500103', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2288', '大渡口区', '1', '2284', '3501', '0', '500104', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2289', '江北区', '1', '2284', '3501', '0', '500105', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2290', '沙坪坝区', '1', '2284', '3501', '0', '500106', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2291', '九龙坡区', '1', '2284', '3501', '0', '500107', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2292', '南岸区', '1', '2284', '3501', '0', '500108', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2293', '北碚区', '1', '2284', '3501', '0', '500109', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2294', '万盛区', '1', '2284', '3501', '0', '500110', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2295', '双桥区', '1', '2284', '3501', '0', '500111', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2296', '渝北区', '1', '2284', '3501', '0', '500112', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2297', '巴南区', '1', '2284', '3501', '0', '500113', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2298', '黔江区', '1', '2284', '3501', '0', '500114', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2299', '长寿区', '1', '2284', '3501', '0', '500115', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2300', '江津区', '1', '2284', '3501', '0', '500116', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2301', '合川区', '1', '2284', '3501', '0', '500117', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2302', '永川区', '1', '2284', '3501', '0', '500118', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2303', '南川区', '1', '2284', '3501', '0', '500119', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2304', '綦江县', '1', '2284', '3501', '0', '500222', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2305', '潼南县', '1', '2284', '3501', '0', '500223', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2306', '铜梁县', '1', '2284', '3501', '0', '500224', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2307', '大足县', '1', '2284', '3501', '0', '500225', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2308', '荣昌县', '1', '2284', '3501', '0', '500226', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2309', '璧山县', '1', '2284', '3501', '0', '500227', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2310', '梁平县', '1', '2284', '3501', '0', '500228', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2311', '城口县', '1', '2284', '3501', '0', '500229', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2312', '丰都县', '1', '2284', '3501', '0', '500230', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2313', '垫江县', '1', '2284', '3501', '0', '500231', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2314', '武隆县', '1', '2284', '3501', '0', '500232', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2315', '忠县', '1', '2284', '3501', '0', '500233', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2316', '开县', '1', '2284', '3501', '0', '500234', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2317', '云阳县', '1', '2284', '3501', '0', '500235', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2318', '奉节县', '1', '2284', '3501', '0', '500236', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2319', '巫山县', '1', '2284', '3501', '0', '500237', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2320', '巫溪县', '1', '2284', '3501', '0', '500238', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2321', '石柱土家族自治县', '1', '2284', '3501', '0', '500240', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2322', '秀山土家族苗族自治县', '1', '2284', '3501', '0', '500241', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2323', '酉阳土家族苗族自治县', '1', '2284', '3501', '0', '500242', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2324', '彭水苗族土家族自治县', '1', '2284', '3501', '0', '500243', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2325', '万盛经济开发区', '1', '2284', '3501', '0', '500244', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2326', '北部新区', '1', '2284', '3501', '0', '500245', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2327', '四川省', '1', '0', '0', '0', '510000', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2328', '成都市', '1', '2327', '0', '0', '510100', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2329', '锦江区', '1', '2327', '2328', '0', '510104', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2330', '青羊区', '1', '2327', '2328', '0', '510105', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2331', '金牛区', '1', '2327', '2328', '0', '510106', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2332', '武侯区', '1', '2327', '2328', '0', '510107', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2333', '成华区', '1', '2327', '2328', '0', '510108', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2334', '龙泉驿区', '1', '2327', '2328', '0', '510112', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2335', '青白江区', '1', '2327', '2328', '0', '510113', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2336', '新都区', '1', '2327', '2328', '0', '510114', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2337', '温江区', '1', '2327', '2328', '0', '510115', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2338', '金堂县', '1', '2327', '2328', '0', '510121', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2339', '双流县', '1', '2327', '2328', '0', '510122', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2340', '郫县', '1', '2327', '2328', '0', '510124', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2341', '大邑县', '1', '2327', '2328', '0', '510129', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2342', '蒲江县', '1', '2327', '2328', '0', '510131', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2343', '新津县', '1', '2327', '2328', '0', '510132', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2344', '都江堰市', '1', '2327', '2328', '0', '510181', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2345', '彭州市', '1', '2327', '2328', '0', '510182', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2346', '邛崃市', '1', '2327', '2328', '0', '510183', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2347', '崇州市', '1', '2327', '2328', '0', '510184', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2348', '自贡市', '1', '2327', '0', '0', '510300', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2349', '自流井区', '1', '2327', '2348', '0', '510302', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2350', '贡井区', '1', '2327', '2348', '0', '510303', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2351', '大安区', '1', '2327', '2348', '0', '510304', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2352', '沿滩区', '1', '2327', '2348', '0', '510311', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2353', '荣县', '1', '2327', '2348', '0', '510321', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2354', '富顺县', '1', '2327', '2348', '0', '510322', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2355', '攀枝花市', '1', '2327', '0', '0', '510400', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2356', '东区', '1', '2327', '2355', '0', '510402', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2357', '西区', '1', '2327', '2355', '0', '510403', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2358', '仁和区', '1', '2327', '2355', '0', '510411', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2359', '米易县', '1', '2327', '2355', '0', '510421', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2360', '盐边县', '1', '2327', '2355', '0', '510422', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2361', '泸州市', '1', '2327', '0', '0', '510500', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2362', '江阳区', '1', '2327', '2361', '0', '510502', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2363', '纳溪区', '1', '2327', '2361', '0', '510503', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2364', '龙马潭区', '1', '2327', '2361', '0', '510504', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2365', '泸县', '1', '2327', '2361', '0', '510521', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2366', '合江县', '1', '2327', '2361', '0', '510522', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2367', '叙永县', '1', '2327', '2361', '0', '510524', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2368', '古蔺县', '1', '2327', '2361', '0', '510525', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2369', '德阳市', '1', '2327', '0', '0', '510600', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2370', '旌阳区', '1', '2327', '2369', '0', '510603', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2371', '中江县', '1', '2327', '2369', '0', '510623', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2372', '罗江县', '1', '2327', '2369', '0', '510626', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2373', '广汉市', '1', '2327', '2369', '0', '510681', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2374', '什邡市', '1', '2327', '2369', '0', '510682', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2375', '绵竹市', '1', '2327', '2369', '0', '510683', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2376', '绵阳市', '1', '2327', '0', '0', '510700', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2377', '涪城区', '1', '2327', '2376', '0', '510703', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2378', '游仙区', '1', '2327', '2376', '0', '510704', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2379', '三台县', '1', '2327', '2376', '0', '510722', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2380', '盐亭县', '1', '2327', '2376', '0', '510723', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2381', '安县', '1', '2327', '2376', '0', '510724', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2382', '梓潼县', '1', '2327', '2376', '0', '510725', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2383', '北川羌族自治县', '1', '2327', '2376', '0', '510726', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2384', '平武县', '1', '2327', '2376', '0', '510727', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2385', '江油市', '1', '2327', '2376', '0', '510781', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2386', '广元市', '1', '2327', '0', '0', '510800', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2387', '市中区', '1', '2327', '2386', '0', '510802', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2388', '元坝区', '1', '2327', '2386', '0', '510811', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2389', '朝天区', '1', '2327', '2386', '0', '510812', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2390', '旺苍县', '1', '2327', '2386', '0', '510821', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2391', '青川县', '1', '2327', '2386', '0', '510822', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2392', '剑阁县', '1', '2327', '2386', '0', '510823', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2393', '苍溪县', '1', '2327', '2386', '0', '510824', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2394', '遂宁市', '1', '2327', '0', '0', '510900', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2395', '船山区', '1', '2327', '2394', '0', '510903', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2396', '安居区', '1', '2327', '2394', '0', '510904', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2397', '蓬溪县', '1', '2327', '2394', '0', '510921', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2398', '射洪县', '1', '2327', '2394', '0', '510922', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2399', '大英县', '1', '2327', '2394', '0', '510923', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2400', '内江市', '1', '2327', '0', '0', '511000', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2401', '市中区', '1', '2327', '2400', '0', '511002', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2402', '东兴区', '1', '2327', '2400', '0', '511011', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2403', '威远县', '1', '2327', '2400', '0', '511024', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2404', '资中县', '1', '2327', '2400', '0', '511025', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2405', '隆昌县', '1', '2327', '2400', '0', '511028', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2406', '乐山市', '1', '2327', '0', '0', '511100', '0', '2014-06-04 04:51:33', '2014-06-04 04:51:33');
INSERT INTO `regions` VALUES ('2407', '市中区', '1', '2327', '2406', '0', '511102', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2408', '沙湾区', '1', '2327', '2406', '0', '511111', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2409', '五通桥区', '1', '2327', '2406', '0', '511112', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2410', '金口河区', '1', '2327', '2406', '0', '511113', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2411', '犍为县', '1', '2327', '2406', '0', '511123', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2412', '井研县', '1', '2327', '2406', '0', '511124', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2413', '夹江县', '1', '2327', '2406', '0', '511126', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2414', '沐川县', '1', '2327', '2406', '0', '511129', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:05');
INSERT INTO `regions` VALUES ('2415', '峨边彝族自治县', '1', '2327', '2406', '0', '511132', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2416', '马边彝族自治县', '1', '2327', '2406', '0', '511133', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2417', '峨眉山市', '1', '2327', '2406', '0', '511181', '0', '2014-06-04 04:51:33', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2418', '南充市', '1', '2327', '0', '0', '511300', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2419', '顺庆区', '1', '2327', '2418', '0', '511302', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2420', '高坪区', '1', '2327', '2418', '0', '511303', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2421', '嘉陵区', '1', '2327', '2418', '0', '511304', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2422', '南部县', '1', '2327', '2418', '0', '511321', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2423', '营山县', '1', '2327', '2418', '0', '511322', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2424', '蓬安县', '1', '2327', '2418', '0', '511323', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2425', '仪陇县', '1', '2327', '2418', '0', '511324', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2426', '西充县', '1', '2327', '2418', '0', '511325', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2427', '阆中市', '1', '2327', '2418', '0', '511381', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2428', '眉山市', '1', '2327', '0', '0', '511400', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2429', '东坡区', '1', '2327', '2428', '0', '511402', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2430', '仁寿县', '1', '2327', '2428', '0', '511421', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2431', '彭山县', '1', '2327', '2428', '0', '511422', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2432', '洪雅县', '1', '2327', '2428', '0', '511423', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2433', '丹棱县', '1', '2327', '2428', '0', '511424', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2434', '青神县', '1', '2327', '2428', '0', '511425', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2435', '宜宾市', '1', '2327', '0', '0', '511500', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2436', '翠屏区', '1', '2327', '2435', '0', '511502', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2437', '南溪区', '1', '2327', '2435', '0', '511503', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2438', '宜宾县', '1', '2327', '2435', '0', '511521', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2439', '江安县', '1', '2327', '2435', '0', '511523', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2440', '长宁县', '1', '2327', '2435', '0', '511524', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2441', '高县', '1', '2327', '2435', '0', '511525', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2442', '珙县', '1', '2327', '2435', '0', '511526', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2443', '筠连县', '1', '2327', '2435', '0', '511527', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2444', '兴文县', '1', '2327', '2435', '0', '511528', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2445', '屏山县', '1', '2327', '2435', '0', '511529', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2446', '广安市', '1', '2327', '0', '0', '511600', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2447', '广安区', '1', '2327', '2446', '0', '511602', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2448', '岳池县', '1', '2327', '2446', '0', '511621', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2449', '武胜县', '1', '2327', '2446', '0', '511622', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2450', '邻水县', '1', '2327', '2446', '0', '511623', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2451', '华蓥市', '1', '2327', '2446', '0', '511681', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2452', '达州市', '1', '2327', '0', '0', '511700', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2453', '通川区', '1', '2327', '2452', '0', '511702', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2454', '达县', '1', '2327', '2452', '0', '511721', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2455', '宣汉县', '1', '2327', '2452', '0', '511722', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2456', '开江县', '1', '2327', '2452', '0', '511723', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2457', '大竹县', '1', '2327', '2452', '0', '511724', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2458', '渠县', '1', '2327', '2452', '0', '511725', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2459', '万源市', '1', '2327', '2452', '0', '511781', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2460', '雅安市', '1', '2327', '0', '0', '511800', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2461', '雨城区', '1', '2327', '2460', '0', '511802', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2462', '名山县', '1', '2327', '2460', '0', '511821', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2463', '荥经县', '1', '2327', '2460', '0', '511822', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2464', '汉源县', '1', '2327', '2460', '0', '511823', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2465', '石棉县', '1', '2327', '2460', '0', '511824', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2466', '天全县', '1', '2327', '2460', '0', '511825', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2467', '芦山县', '1', '2327', '2460', '0', '511826', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2468', '宝兴县', '1', '2327', '2460', '0', '511827', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2469', '巴中市', '1', '2327', '0', '0', '511900', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2470', '巴州区', '1', '2327', '2469', '0', '511902', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2471', '通江县', '1', '2327', '2469', '0', '511921', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2472', '南江县', '1', '2327', '2469', '0', '511922', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2473', '平昌县', '1', '2327', '2469', '0', '511923', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2474', '资阳市', '1', '2327', '0', '0', '512000', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2475', '雁江区', '1', '2327', '2474', '0', '512002', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2476', '安岳县', '1', '2327', '2474', '0', '512021', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2477', '乐至县', '1', '2327', '2474', '0', '512022', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2478', '简阳市', '1', '2327', '2474', '0', '512081', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2479', '阿坝藏族羌族自治州', '1', '2327', '0', '0', '513200', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2480', '汶川县', '1', '2327', '2479', '0', '513221', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2481', '理县', '1', '2327', '2479', '0', '513222', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2482', '茂县', '1', '2327', '2479', '0', '513223', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2483', '松潘县', '1', '2327', '2479', '0', '513224', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2484', '九寨沟县', '1', '2327', '2479', '0', '513225', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2485', '金川县', '1', '2327', '2479', '0', '513226', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2486', '小金县', '1', '2327', '2479', '0', '513227', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2487', '黑水县', '1', '2327', '2479', '0', '513228', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2488', '马尔康县', '1', '2327', '2479', '0', '513229', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2489', '壤塘县', '1', '2327', '2479', '0', '513230', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2490', '阿坝县', '1', '2327', '2479', '0', '513231', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2491', '若尔盖县', '1', '2327', '2479', '0', '513232', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2492', '红原县', '1', '2327', '2479', '0', '513233', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2493', '甘孜藏族自治州', '1', '2327', '0', '0', '513300', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2494', '康定县', '1', '2327', '2493', '0', '513321', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2495', '泸定县', '1', '2327', '2493', '0', '513322', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2496', '丹巴县', '1', '2327', '2493', '0', '513323', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2497', '九龙县', '1', '2327', '2493', '0', '513324', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2498', '雅江县', '1', '2327', '2493', '0', '513325', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2499', '道孚县', '1', '2327', '2493', '0', '513326', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2500', '炉霍县', '1', '2327', '2493', '0', '513327', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2501', '甘孜县', '1', '2327', '2493', '0', '513328', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2502', '新龙县', '1', '2327', '2493', '0', '513329', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2503', '德格县', '1', '2327', '2493', '0', '513330', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2504', '白玉县', '1', '2327', '2493', '0', '513331', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2505', '石渠县', '1', '2327', '2493', '0', '513332', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2506', '色达县', '1', '2327', '2493', '0', '513333', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2507', '理塘县', '1', '2327', '2493', '0', '513334', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2508', '巴塘县', '1', '2327', '2493', '0', '513335', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2509', '乡城县', '1', '2327', '2493', '0', '513336', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2510', '稻城县', '1', '2327', '2493', '0', '513337', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2511', '得荣县', '1', '2327', '2493', '0', '513338', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2512', '凉山彝族自治州', '1', '2327', '0', '0', '513400', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2513', '西昌市', '1', '2327', '2512', '0', '513401', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2514', '木里藏族自治县', '1', '2327', '2512', '0', '513422', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2515', '盐源县', '1', '2327', '2512', '0', '513423', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2516', '德昌县', '1', '2327', '2512', '0', '513424', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2517', '会理县', '1', '2327', '2512', '0', '513425', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2518', '会东县', '1', '2327', '2512', '0', '513426', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2519', '宁南县', '1', '2327', '2512', '0', '513427', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2520', '普格县', '1', '2327', '2512', '0', '513428', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2521', '布拖县', '1', '2327', '2512', '0', '513429', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2522', '金阳县', '1', '2327', '2512', '0', '513430', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2523', '昭觉县', '1', '2327', '2512', '0', '513431', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2524', '喜德县', '1', '2327', '2512', '0', '513432', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2525', '冕宁县', '1', '2327', '2512', '0', '513433', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2526', '越西县', '1', '2327', '2512', '0', '513434', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2527', '甘洛县', '1', '2327', '2512', '0', '513435', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2528', '美姑县', '1', '2327', '2512', '0', '513436', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2529', '雷波县', '1', '2327', '2512', '0', '513437', '0', '2014-06-04 04:51:34', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2530', '贵州省', '1', '0', '0', '0', '520000', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2531', '贵阳市', '1', '2530', '0', '0', '520100', '0', '2014-06-04 04:51:34', '2014-06-04 04:51:34');
INSERT INTO `regions` VALUES ('2532', '南明区', '1', '2530', '2531', '0', '520102', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2533', '云岩区', '1', '2530', '2531', '0', '520103', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2534', '花溪区', '1', '2530', '2531', '0', '520111', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2535', '乌当区', '1', '2530', '2531', '0', '520112', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2536', '白云区', '1', '2530', '2531', '0', '520113', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2537', '小河区', '1', '2530', '2531', '0', '520114', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2538', '开阳县', '1', '2530', '2531', '0', '520121', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2539', '息烽县', '1', '2530', '2531', '0', '520122', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2540', '修文县', '1', '2530', '2531', '0', '520123', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2541', '清镇市', '1', '2530', '2531', '0', '520181', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2542', '六盘水市', '1', '2530', '0', '0', '520200', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2543', '钟山区', '1', '2530', '2542', '0', '520201', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2544', '六枝特区', '1', '2530', '2542', '0', '520203', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2545', '水城县', '1', '2530', '2542', '0', '520221', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2546', '盘县', '1', '2530', '2542', '0', '520222', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2547', '遵义市', '1', '2530', '0', '0', '520300', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2548', '红花岗区', '1', '2530', '2547', '0', '520302', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2549', '汇川区', '1', '2530', '2547', '0', '520303', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2550', '遵义县', '1', '2530', '2547', '0', '520321', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2551', '桐梓县', '1', '2530', '2547', '0', '520322', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2552', '绥阳县', '1', '2530', '2547', '0', '520323', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2553', '正安县', '1', '2530', '2547', '0', '520324', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2554', '道真仡佬族苗族自治县', '1', '2530', '2547', '0', '520325', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2555', '务川仡佬族苗族自治县', '1', '2530', '2547', '0', '520326', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2556', '凤冈县', '1', '2530', '2547', '0', '520327', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2557', '湄潭县', '1', '2530', '2547', '0', '520328', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2558', '余庆县', '1', '2530', '2547', '0', '520329', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2559', '习水县', '1', '2530', '2547', '0', '520330', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2560', '赤水市', '1', '2530', '2547', '0', '520381', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2561', '仁怀市', '1', '2530', '2547', '0', '520382', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2562', '安顺市', '1', '2530', '0', '0', '520400', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2563', '西秀区', '1', '2530', '2562', '0', '520402', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2564', '平坝县', '1', '2530', '2562', '0', '520421', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2565', '普定县', '1', '2530', '2562', '0', '520422', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2566', '镇宁布依族苗族自治县', '1', '2530', '2562', '0', '520423', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2567', '关岭布依族苗族自治县', '1', '2530', '2562', '0', '520424', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2568', '紫云苗族布依族自治县', '1', '2530', '2562', '0', '520425', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2569', '毕节市', '1', '2530', '0', '0', '520500', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2570', '市辖区', '1', '2530', '2569', '0', '520501', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2571', '七星关区', '1', '2530', '2569', '0', '520502', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2572', '大方县', '1', '2530', '2569', '0', '520521', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2573', '黔西县', '1', '2530', '2569', '0', '520522', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2574', '金沙县', '1', '2530', '2569', '0', '520523', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2575', '织金县', '1', '2530', '2569', '0', '520524', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2576', '纳雍县', '1', '2530', '2569', '0', '520525', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2577', '威宁彝族回族苗族自治县', '1', '2530', '2569', '0', '520526', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2578', '赫章县', '1', '2530', '2569', '0', '520527', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2579', '铜仁市', '1', '2530', '0', '0', '520600', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2580', '市辖区', '1', '2530', '2579', '0', '520601', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2581', '碧江区', '1', '2530', '2579', '0', '520602', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2582', '万山区', '1', '2530', '2579', '0', '520603', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2583', '江口县', '1', '2530', '2579', '0', '520621', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2584', '玉屏侗族自治县', '1', '2530', '2579', '0', '520622', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2585', '石阡县', '1', '2530', '2579', '0', '520623', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2586', '思南县', '1', '2530', '2579', '0', '520624', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2587', '印江土家族苗族自治县', '1', '2530', '2579', '0', '520625', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2588', '德江县', '1', '2530', '2579', '0', '520626', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2589', '沿河土家族自治县', '1', '2530', '2579', '0', '520627', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:06');
INSERT INTO `regions` VALUES ('2590', '松桃苗族自治县', '1', '2530', '2579', '0', '520628', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2591', '黔西南布依族苗族自治州', '1', '2530', '0', '0', '522300', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2592', '兴义市', '1', '2530', '2591', '0', '522301', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2593', '兴仁县', '1', '2530', '2591', '0', '522322', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2594', '普安县', '1', '2530', '2591', '0', '522323', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2595', '晴隆县', '1', '2530', '2591', '0', '522324', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2596', '贞丰县', '1', '2530', '2591', '0', '522325', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2597', '望谟县', '1', '2530', '2591', '0', '522326', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2598', '册亨县', '1', '2530', '2591', '0', '522327', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2599', '安龙县', '1', '2530', '2591', '0', '522328', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2600', '黔东南苗族侗族自治州', '1', '2530', '0', '0', '522600', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2601', '凯里市', '1', '2530', '2600', '0', '522601', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2602', '黄平县', '1', '2530', '2600', '0', '522622', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2603', '施秉县', '1', '2530', '2600', '0', '522623', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2604', '三穗县', '1', '2530', '2600', '0', '522624', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2605', '镇远县', '1', '2530', '2600', '0', '522625', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2606', '岑巩县', '1', '2530', '2600', '0', '522626', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2607', '天柱县', '1', '2530', '2600', '0', '522627', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2608', '锦屏县', '1', '2530', '2600', '0', '522628', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2609', '剑河县', '1', '2530', '2600', '0', '522629', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2610', '台江县', '1', '2530', '2600', '0', '522630', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2611', '黎平县', '1', '2530', '2600', '0', '522631', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2612', '榕江县', '1', '2530', '2600', '0', '522632', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2613', '从江县', '1', '2530', '2600', '0', '522633', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2614', '雷山县', '1', '2530', '2600', '0', '522634', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2615', '麻江县', '1', '2530', '2600', '0', '522635', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2616', '丹寨县', '1', '2530', '2600', '0', '522636', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2617', '黔南布依族苗族自治州', '1', '2530', '0', '0', '522700', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2618', '都匀市', '1', '2530', '2617', '0', '522701', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2619', '福泉市', '1', '2530', '2617', '0', '522702', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2620', '荔波县', '1', '2530', '2617', '0', '522722', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2621', '贵定县', '1', '2530', '2617', '0', '522723', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2622', '瓮安县', '1', '2530', '2617', '0', '522725', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2623', '独山县', '1', '2530', '2617', '0', '522726', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2624', '平塘县', '1', '2530', '2617', '0', '522727', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2625', '罗甸县', '1', '2530', '2617', '0', '522728', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2626', '长顺县', '1', '2530', '2617', '0', '522729', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2627', '龙里县', '1', '2530', '2617', '0', '522730', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2628', '惠水县', '1', '2530', '2617', '0', '522731', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2629', '三都水族自治县', '1', '2530', '2617', '0', '522732', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2630', '云南省', '1', '0', '0', '0', '530000', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2631', '昆明市', '1', '2630', '0', '0', '530100', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2632', '五华区', '1', '2630', '2631', '0', '530102', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2633', '盘龙区', '1', '2630', '2631', '0', '530103', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2634', '官渡区', '1', '2630', '2631', '0', '530111', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2635', '西山区', '1', '2630', '2631', '0', '530112', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2636', '东川区', '1', '2630', '2631', '0', '530113', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2637', '呈贡县', '1', '2630', '2631', '0', '530114', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2638', '晋宁县', '1', '2630', '2631', '0', '530122', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2639', '富民县', '1', '2630', '2631', '0', '530124', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2640', '宜良县', '1', '2630', '2631', '0', '530125', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2641', '石林彝族自治县', '1', '2630', '2631', '0', '530126', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2642', '嵩明县', '1', '2630', '2631', '0', '530127', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2643', '禄劝彝族苗族自治县', '1', '2630', '2631', '0', '530128', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2644', '寻甸回族彝族自治县', '1', '2630', '2631', '0', '530129', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2645', '安宁市', '1', '2630', '2631', '0', '530181', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2646', '曲靖市', '1', '2630', '0', '0', '530300', '0', '2014-06-04 04:51:35', '2014-06-04 04:51:35');
INSERT INTO `regions` VALUES ('2647', '麒麟区', '1', '2630', '2646', '0', '530302', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2648', '马龙县', '1', '2630', '2646', '0', '530321', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2649', '陆良县', '1', '2630', '2646', '0', '530322', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2650', '师宗县', '1', '2630', '2646', '0', '530323', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2651', '罗平县', '1', '2630', '2646', '0', '530324', '0', '2014-06-04 04:51:35', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2652', '富源县', '1', '2630', '2646', '0', '530325', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2653', '会泽县', '1', '2630', '2646', '0', '530326', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2654', '沾益县', '1', '2630', '2646', '0', '530328', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2655', '宣威市', '1', '2630', '2646', '0', '530381', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2656', '玉溪市', '1', '2630', '0', '0', '530400', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2657', '红塔区', '1', '2630', '2656', '0', '530402', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2658', '江川县', '1', '2630', '2656', '0', '530421', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2659', '澄江县', '1', '2630', '2656', '0', '530422', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2660', '通海县', '1', '2630', '2656', '0', '530423', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2661', '华宁县', '1', '2630', '2656', '0', '530424', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2662', '易门县', '1', '2630', '2656', '0', '530425', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2663', '峨山彝族自治县', '1', '2630', '2656', '0', '530426', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2664', '新平彝族傣族自治县', '1', '2630', '2656', '0', '530427', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2665', '元江哈尼族彝族傣族自治县', '1', '2630', '2656', '0', '530428', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2666', '保山市', '1', '2630', '0', '0', '530500', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2667', '隆阳区', '1', '2630', '2666', '0', '530502', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2668', '施甸县', '1', '2630', '2666', '0', '530521', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2669', '腾冲县', '1', '2630', '2666', '0', '530522', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2670', '龙陵县', '1', '2630', '2666', '0', '530523', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2671', '昌宁县', '1', '2630', '2666', '0', '530524', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2672', '昭通市', '1', '2630', '0', '0', '530600', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2673', '昭阳区', '1', '2630', '2672', '0', '530602', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2674', '鲁甸县', '1', '2630', '2672', '0', '530621', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2675', '巧家县', '1', '2630', '2672', '0', '530622', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2676', '盐津县', '1', '2630', '2672', '0', '530623', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2677', '大关县', '1', '2630', '2672', '0', '530624', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2678', '永善县', '1', '2630', '2672', '0', '530625', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2679', '绥江县', '1', '2630', '2672', '0', '530626', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2680', '镇雄县', '1', '2630', '2672', '0', '530627', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2681', '彝良县', '1', '2630', '2672', '0', '530628', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2682', '威信县', '1', '2630', '2672', '0', '530629', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2683', '水富县', '1', '2630', '2672', '0', '530630', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2684', '丽江市', '1', '2630', '0', '0', '530700', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2685', '古城区', '1', '2630', '2684', '0', '530702', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2686', '玉龙纳西族自治县', '1', '2630', '2684', '0', '530721', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2687', '永胜县', '1', '2630', '2684', '0', '530722', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2688', '华坪县', '1', '2630', '2684', '0', '530723', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2689', '宁蒗彝族自治县', '1', '2630', '2684', '0', '530724', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2690', '普洱市', '1', '2630', '0', '0', '530800', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2691', '思茅区', '1', '2630', '2690', '0', '530802', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2692', '宁洱哈尼族彝族自治县', '1', '2630', '2690', '0', '530821', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2693', '墨江哈尼族自治县', '1', '2630', '2690', '0', '530822', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2694', '景东彝族自治县', '1', '2630', '2690', '0', '530823', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2695', '景谷傣族彝族自治县', '1', '2630', '2690', '0', '530824', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2696', '镇沅彝族哈尼族拉祜族自治县', '1', '2630', '2690', '0', '530825', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2697', '江城哈尼族彝族自治县', '1', '2630', '2690', '0', '530826', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2698', '孟连傣族拉祜族佤族自治县', '1', '2630', '2690', '0', '530827', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2699', '澜沧拉祜族自治县', '1', '2630', '2690', '0', '530828', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2700', '西盟佤族自治县', '1', '2630', '2690', '0', '530829', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2701', '临沧市', '1', '2630', '0', '0', '530900', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2702', '临翔区', '1', '2630', '2701', '0', '530902', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2703', '凤庆县', '1', '2630', '2701', '0', '530921', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2704', '云县', '1', '2630', '2701', '0', '530922', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2705', '永德县', '1', '2630', '2701', '0', '530923', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2706', '镇康县', '1', '2630', '2701', '0', '530924', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2707', '双江拉祜族佤族布朗族傣族自治县', '1', '2630', '2701', '0', '530925', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2708', '耿马傣族佤族自治县', '1', '2630', '2701', '0', '530926', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2709', '沧源佤族自治县', '1', '2630', '2701', '0', '530927', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2710', '楚雄彝族自治州', '1', '2630', '0', '0', '532300', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2711', '楚雄市', '1', '2630', '2710', '0', '532301', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2712', '双柏县', '1', '2630', '2710', '0', '532322', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2713', '牟定县', '1', '2630', '2710', '0', '532323', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2714', '南华县', '1', '2630', '2710', '0', '532324', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2715', '姚安县', '1', '2630', '2710', '0', '532325', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2716', '大姚县', '1', '2630', '2710', '0', '532326', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2717', '永仁县', '1', '2630', '2710', '0', '532327', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2718', '元谋县', '1', '2630', '2710', '0', '532328', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2719', '武定县', '1', '2630', '2710', '0', '532329', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2720', '禄丰县', '1', '2630', '2710', '0', '532331', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2721', '红河哈尼族彝族自治州', '1', '2630', '0', '0', '532500', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2722', '个旧市', '1', '2630', '2721', '0', '532501', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2723', '开远市', '1', '2630', '2721', '0', '532502', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2724', '蒙自县', '1', '2630', '2721', '0', '532503', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2725', '屏边苗族自治县', '1', '2630', '2721', '0', '532523', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2726', '建水县', '1', '2630', '2721', '0', '532524', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2727', '石屏县', '1', '2630', '2721', '0', '532525', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2728', '弥勒县', '1', '2630', '2721', '0', '532526', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2729', '泸西县', '1', '2630', '2721', '0', '532527', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2730', '元阳县', '1', '2630', '2721', '0', '532528', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2731', '红河县', '1', '2630', '2721', '0', '532529', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2732', '金平苗族瑶族傣族自治县', '1', '2630', '2721', '0', '532530', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2733', '绿春县', '1', '2630', '2721', '0', '532531', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2734', '河口瑶族自治县', '1', '2630', '2721', '0', '532532', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2735', '文山壮族苗族自治州', '1', '2630', '0', '0', '532600', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2736', '文山县', '1', '2630', '2735', '0', '532601', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2737', '砚山县', '1', '2630', '2735', '0', '532622', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2738', '西畴县', '1', '2630', '2735', '0', '532623', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2739', '麻栗坡县', '1', '2630', '2735', '0', '532624', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2740', '马关县', '1', '2630', '2735', '0', '532625', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2741', '丘北县', '1', '2630', '2735', '0', '532626', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2742', '广南县', '1', '2630', '2735', '0', '532627', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2743', '富宁县', '1', '2630', '2735', '0', '532628', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2744', '西双版纳傣族自治州', '1', '2630', '0', '0', '532800', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2745', '景洪市', '1', '2630', '2744', '0', '532801', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2746', '勐海县', '1', '2630', '2744', '0', '532822', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2747', '勐腊县', '1', '2630', '2744', '0', '532823', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2748', '大理白族自治州', '1', '2630', '0', '0', '532900', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2749', '大理市', '1', '2630', '2748', '0', '532901', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2750', '漾濞彝族自治县', '1', '2630', '2748', '0', '532922', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2751', '祥云县', '1', '2630', '2748', '0', '532923', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2752', '宾川县', '1', '2630', '2748', '0', '532924', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2753', '弥渡县', '1', '2630', '2748', '0', '532925', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2754', '南涧彝族自治县', '1', '2630', '2748', '0', '532926', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2755', '巍山彝族回族自治县', '1', '2630', '2748', '0', '532927', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2756', '永平县', '1', '2630', '2748', '0', '532928', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2757', '云龙县', '1', '2630', '2748', '0', '532929', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2758', '洱源县', '1', '2630', '2748', '0', '532930', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2759', '剑川县', '1', '2630', '2748', '0', '532931', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2760', '鹤庆县', '1', '2630', '2748', '0', '532932', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2761', '德宏傣族景颇族自治州', '1', '2630', '0', '0', '533100', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2762', '瑞丽市', '1', '2630', '2761', '0', '533102', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2763', '潞西市', '1', '2630', '2761', '0', '533103', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2764', '梁河县', '1', '2630', '2761', '0', '533122', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2765', '盈江县', '1', '2630', '2761', '0', '533123', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2766', '陇川县', '1', '2630', '2761', '0', '533124', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2767', '怒江傈僳族自治州', '1', '2630', '0', '0', '533300', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2768', '泸水县', '1', '2630', '2767', '0', '533321', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2769', '福贡县', '1', '2630', '2767', '0', '533323', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:07');
INSERT INTO `regions` VALUES ('2770', '贡山独龙族怒族自治县', '1', '2630', '2767', '0', '533324', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2771', '兰坪白族普米族自治县', '1', '2630', '2767', '0', '533325', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2772', '迪庆藏族自治州', '1', '2630', '0', '0', '533400', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2773', '香格里拉县', '1', '2630', '2772', '0', '533421', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2774', '德钦县', '1', '2630', '2772', '0', '533422', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2775', '维西傈僳族自治县', '1', '2630', '2772', '0', '533423', '0', '2014-06-04 04:51:36', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2776', '西藏自治区', '1', '0', '0', '0', '540000', '0', '2014-06-04 04:51:36', '2014-06-04 04:51:36');
INSERT INTO `regions` VALUES ('2777', '拉萨市', '1', '2776', '0', '0', '540100', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2778', '城关区', '1', '2776', '2777', '0', '540102', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2779', '林周县', '1', '2776', '2777', '0', '540121', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2780', '当雄县', '1', '2776', '2777', '0', '540122', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2781', '尼木县', '1', '2776', '2777', '0', '540123', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2782', '曲水县', '1', '2776', '2777', '0', '540124', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2783', '堆龙德庆县', '1', '2776', '2777', '0', '540125', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2784', '达孜县', '1', '2776', '2777', '0', '540126', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2785', '墨竹工卡县', '1', '2776', '2777', '0', '540127', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2786', '昌都地区', '1', '2776', '0', '0', '542100', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2787', '昌都县', '1', '2776', '2786', '0', '542121', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2788', '江达县', '1', '2776', '2786', '0', '542122', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2789', '贡觉县', '1', '2776', '2786', '0', '542123', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2790', '类乌齐县', '1', '2776', '2786', '0', '542124', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2791', '丁青县', '1', '2776', '2786', '0', '542125', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2792', '察雅县', '1', '2776', '2786', '0', '542126', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2793', '八宿县', '1', '2776', '2786', '0', '542127', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2794', '左贡县', '1', '2776', '2786', '0', '542128', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2795', '芒康县', '1', '2776', '2786', '0', '542129', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2796', '洛隆县', '1', '2776', '2786', '0', '542132', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2797', '边坝县', '1', '2776', '2786', '0', '542133', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2798', '山南地区', '1', '2776', '0', '0', '542200', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2799', '乃东县', '1', '2776', '2798', '0', '542221', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2800', '扎囊县', '1', '2776', '2798', '0', '542222', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2801', '贡嘎县', '1', '2776', '2798', '0', '542223', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2802', '桑日县', '1', '2776', '2798', '0', '542224', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2803', '琼结县', '1', '2776', '2798', '0', '542225', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2804', '曲松县', '1', '2776', '2798', '0', '542226', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2805', '措美县', '1', '2776', '2798', '0', '542227', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2806', '洛扎县', '1', '2776', '2798', '0', '542228', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2807', '加查县', '1', '2776', '2798', '0', '542229', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2808', '隆子县', '1', '2776', '2798', '0', '542231', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2809', '错那县', '1', '2776', '2798', '0', '542232', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2810', '浪卡子县', '1', '2776', '2798', '0', '542233', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2811', '日喀则地区', '1', '2776', '0', '0', '542300', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2812', '日喀则市', '1', '2776', '2811', '0', '542301', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2813', '南木林县', '1', '2776', '2811', '0', '542322', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2814', '江孜县', '1', '2776', '2811', '0', '542323', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2815', '定日县', '1', '2776', '2811', '0', '542324', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2816', '萨迦县', '1', '2776', '2811', '0', '542325', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2817', '拉孜县', '1', '2776', '2811', '0', '542326', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2818', '昂仁县', '1', '2776', '2811', '0', '542327', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2819', '谢通门县', '1', '2776', '2811', '0', '542328', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2820', '白朗县', '1', '2776', '2811', '0', '542329', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2821', '仁布县', '1', '2776', '2811', '0', '542330', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2822', '康马县', '1', '2776', '2811', '0', '542331', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2823', '定结县', '1', '2776', '2811', '0', '542332', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2824', '仲巴县', '1', '2776', '2811', '0', '542333', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2825', '亚东县', '1', '2776', '2811', '0', '542334', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2826', '吉隆县', '1', '2776', '2811', '0', '542335', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2827', '聂拉木县', '1', '2776', '2811', '0', '542336', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2828', '萨嘎县', '1', '2776', '2811', '0', '542337', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2829', '岗巴县', '1', '2776', '2811', '0', '542338', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2830', '那曲地区', '1', '2776', '0', '0', '542400', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2831', '那曲县', '1', '2776', '2830', '0', '542421', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2832', '嘉黎县', '1', '2776', '2830', '0', '542422', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2833', '比如县', '1', '2776', '2830', '0', '542423', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2834', '聂荣县', '1', '2776', '2830', '0', '542424', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2835', '安多县', '1', '2776', '2830', '0', '542425', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2836', '申扎县', '1', '2776', '2830', '0', '542426', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2837', '索县', '1', '2776', '2830', '0', '542427', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2838', '班戈县', '1', '2776', '2830', '0', '542428', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2839', '巴青县', '1', '2776', '2830', '0', '542429', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2840', '尼玛县', '1', '2776', '2830', '0', '542430', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2841', '阿里地区', '1', '2776', '0', '0', '542500', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2842', '普兰县', '1', '2776', '2841', '0', '542521', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2843', '札达县', '1', '2776', '2841', '0', '542522', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2844', '噶尔县', '1', '2776', '2841', '0', '542523', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2845', '日土县', '1', '2776', '2841', '0', '542524', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2846', '革吉县', '1', '2776', '2841', '0', '542525', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2847', '改则县', '1', '2776', '2841', '0', '542526', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2848', '措勤县', '1', '2776', '2841', '0', '542527', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2849', '林芝地区', '1', '2776', '0', '0', '542600', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2850', '林芝县', '1', '2776', '2849', '0', '542621', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2851', '工布江达县', '1', '2776', '2849', '0', '542622', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2852', '米林县', '1', '2776', '2849', '0', '542623', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2853', '墨脱县', '1', '2776', '2849', '0', '542624', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2854', '波密县', '1', '2776', '2849', '0', '542625', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2855', '察隅县', '1', '2776', '2849', '0', '542626', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2856', '朗县', '1', '2776', '2849', '0', '542627', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2857', '陕西省', '1', '0', '0', '0', '610000', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2858', '西安市', '1', '2857', '0', '0', '610100', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2859', '新城区', '1', '2857', '2858', '0', '610102', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2860', '碑林区', '1', '2857', '2858', '0', '610103', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2861', '莲湖区', '1', '2857', '2858', '0', '610104', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2862', '灞桥区', '1', '2857', '2858', '0', '610111', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2863', '未央区', '1', '2857', '2858', '0', '610112', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2864', '雁塔区', '1', '2857', '2858', '0', '610113', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2865', '阎良区', '1', '2857', '2858', '0', '610114', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2866', '临潼区', '1', '2857', '2858', '0', '610115', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2867', '长安区', '1', '2857', '2858', '0', '610116', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2868', '蓝田县', '1', '2857', '2858', '0', '610122', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2869', '周至县', '1', '2857', '2858', '0', '610124', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2870', '户县', '1', '2857', '2858', '0', '610125', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2871', '高陵县', '1', '2857', '2858', '0', '610126', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2872', '铜川市', '1', '2857', '0', '0', '610200', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2873', '王益区', '1', '2857', '2872', '0', '610202', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2874', '印台区', '1', '2857', '2872', '0', '610203', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2875', '耀州区', '1', '2857', '2872', '0', '610204', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2876', '宜君县', '1', '2857', '2872', '0', '610222', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2877', '宝鸡市', '1', '2857', '0', '0', '610300', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2878', '渭滨区', '1', '2857', '2877', '0', '610302', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2879', '金台区', '1', '2857', '2877', '0', '610303', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2880', '陈仓区', '1', '2857', '2877', '0', '610304', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2881', '凤翔县', '1', '2857', '2877', '0', '610322', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2882', '岐山县', '1', '2857', '2877', '0', '610323', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2883', '扶风县', '1', '2857', '2877', '0', '610324', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2884', '眉县', '1', '2857', '2877', '0', '610326', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2885', '陇县', '1', '2857', '2877', '0', '610327', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2886', '千阳县', '1', '2857', '2877', '0', '610328', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2887', '麟游县', '1', '2857', '2877', '0', '610329', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2888', '凤县', '1', '2857', '2877', '0', '610330', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2889', '太白县', '1', '2857', '2877', '0', '610331', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2890', '咸阳市', '1', '2857', '0', '0', '610400', '0', '2014-06-04 04:51:37', '2014-06-04 04:51:37');
INSERT INTO `regions` VALUES ('2891', '秦都区', '1', '2857', '2890', '0', '610402', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2892', '杨凌区', '1', '2857', '2890', '0', '610403', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2893', '渭城区', '1', '2857', '2890', '0', '610404', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2894', '三原县', '1', '2857', '2890', '0', '610422', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2895', '泾阳县', '1', '2857', '2890', '0', '610423', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2896', '乾县', '1', '2857', '2890', '0', '610424', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2897', '礼泉县', '1', '2857', '2890', '0', '610425', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2898', '永寿县', '1', '2857', '2890', '0', '610426', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2899', '彬县', '1', '2857', '2890', '0', '610427', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2900', '长武县', '1', '2857', '2890', '0', '610428', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2901', '旬邑县', '1', '2857', '2890', '0', '610429', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2902', '淳化县', '1', '2857', '2890', '0', '610430', '0', '2014-06-04 04:51:37', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2903', '武功县', '1', '2857', '2890', '0', '610431', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2904', '兴平市', '1', '2857', '2890', '0', '610481', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2905', '渭南市', '1', '2857', '0', '0', '610500', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2906', '临渭区', '1', '2857', '2905', '0', '610502', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2907', '华县', '1', '2857', '2905', '0', '610521', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2908', '潼关县', '1', '2857', '2905', '0', '610522', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2909', '大荔县', '1', '2857', '2905', '0', '610523', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2910', '合阳县', '1', '2857', '2905', '0', '610524', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2911', '澄城县', '1', '2857', '2905', '0', '610525', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2912', '蒲城县', '1', '2857', '2905', '0', '610526', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2913', '白水县', '1', '2857', '2905', '0', '610527', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2914', '富平县', '1', '2857', '2905', '0', '610528', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2915', '韩城市', '1', '2857', '2905', '0', '610581', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2916', '华阴市', '1', '2857', '2905', '0', '610582', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2917', '延安市', '1', '2857', '0', '0', '610600', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2918', '宝塔区', '1', '2857', '2917', '0', '610602', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2919', '延长县', '1', '2857', '2917', '0', '610621', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2920', '延川县', '1', '2857', '2917', '0', '610622', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2921', '子长县', '1', '2857', '2917', '0', '610623', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2922', '安塞县', '1', '2857', '2917', '0', '610624', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2923', '志丹县', '1', '2857', '2917', '0', '610625', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2924', '吴起县', '1', '2857', '2917', '0', '610626', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2925', '甘泉县', '1', '2857', '2917', '0', '610627', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2926', '富县', '1', '2857', '2917', '0', '610628', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2927', '洛川县', '1', '2857', '2917', '0', '610629', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2928', '宜川县', '1', '2857', '2917', '0', '610630', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2929', '黄龙县', '1', '2857', '2917', '0', '610631', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2930', '黄陵县', '1', '2857', '2917', '0', '610632', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2931', '汉中市', '1', '2857', '0', '0', '610700', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2932', '汉台区', '1', '2857', '2931', '0', '610702', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2933', '南郑县', '1', '2857', '2931', '0', '610721', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2934', '城固县', '1', '2857', '2931', '0', '610722', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2935', '洋县', '1', '2857', '2931', '0', '610723', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2936', '西乡县', '1', '2857', '2931', '0', '610724', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2937', '勉县', '1', '2857', '2931', '0', '610725', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2938', '宁强县', '1', '2857', '2931', '0', '610726', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2939', '略阳县', '1', '2857', '2931', '0', '610727', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2940', '镇巴县', '1', '2857', '2931', '0', '610728', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2941', '留坝县', '1', '2857', '2931', '0', '610729', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2942', '佛坪县', '1', '2857', '2931', '0', '610730', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2943', '榆林市', '1', '2857', '0', '0', '610800', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2944', '榆阳区', '1', '2857', '2943', '0', '610802', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2945', '神木县', '1', '2857', '2943', '0', '610821', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2946', '府谷县', '1', '2857', '2943', '0', '610822', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2947', '横山县', '1', '2857', '2943', '0', '610823', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2948', '靖边县', '1', '2857', '2943', '0', '610824', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2949', '定边县', '1', '2857', '2943', '0', '610825', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2950', '绥德县', '1', '2857', '2943', '0', '610826', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2951', '米脂县', '1', '2857', '2943', '0', '610827', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2952', '佳县', '1', '2857', '2943', '0', '610828', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2953', '吴堡县', '1', '2857', '2943', '0', '610829', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2954', '清涧县', '1', '2857', '2943', '0', '610830', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2955', '子洲县', '1', '2857', '2943', '0', '610831', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:08');
INSERT INTO `regions` VALUES ('2956', '安康市', '1', '2857', '0', '0', '610900', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2957', '汉滨区', '1', '2857', '2956', '0', '610902', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2958', '汉阴县', '1', '2857', '2956', '0', '610921', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2959', '石泉县', '1', '2857', '2956', '0', '610922', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2960', '宁陕县', '1', '2857', '2956', '0', '610923', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2961', '紫阳县', '1', '2857', '2956', '0', '610924', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2962', '岚皋县', '1', '2857', '2956', '0', '610925', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2963', '平利县', '1', '2857', '2956', '0', '610926', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2964', '镇坪县', '1', '2857', '2956', '0', '610927', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2965', '旬阳县', '1', '2857', '2956', '0', '610928', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2966', '白河县', '1', '2857', '2956', '0', '610929', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2967', '商洛市', '1', '2857', '0', '0', '611000', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2968', '商州区', '1', '2857', '2967', '0', '611002', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2969', '洛南县', '1', '2857', '2967', '0', '611021', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2970', '丹凤县', '1', '2857', '2967', '0', '611022', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2971', '商南县', '1', '2857', '2967', '0', '611023', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2972', '山阳县', '1', '2857', '2967', '0', '611024', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2973', '镇安县', '1', '2857', '2967', '0', '611025', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2974', '柞水县', '1', '2857', '2967', '0', '611026', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2975', '甘肃省', '1', '0', '0', '0', '620000', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2976', '兰州市', '1', '2975', '0', '0', '620100', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2977', '城关区', '1', '2975', '2976', '0', '620102', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2978', '七里河区', '1', '2975', '2976', '0', '620103', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2979', '西固区', '1', '2975', '2976', '0', '620104', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2980', '安宁区', '1', '2975', '2976', '0', '620105', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2981', '红古区', '1', '2975', '2976', '0', '620111', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2982', '永登县', '1', '2975', '2976', '0', '620121', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2983', '皋兰县', '1', '2975', '2976', '0', '620122', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2984', '榆中县', '1', '2975', '2976', '0', '620123', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2985', '嘉峪关市', '1', '2975', '0', '0', '620200', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2986', '金昌市', '1', '2975', '0', '0', '620300', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2987', '金川区', '1', '2975', '2986', '0', '620302', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2988', '永昌县', '1', '2975', '2986', '0', '620321', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2989', '白银市', '1', '2975', '0', '0', '620400', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2990', '白银区', '1', '2975', '2989', '0', '620402', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2991', '平川区', '1', '2975', '2989', '0', '620403', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2992', '靖远县', '1', '2975', '2989', '0', '620421', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2993', '会宁县', '1', '2975', '2989', '0', '620422', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2994', '景泰县', '1', '2975', '2989', '0', '620423', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2995', '天水市', '1', '2975', '0', '0', '620500', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('2996', '秦州区', '1', '2975', '2995', '0', '620502', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2997', '麦积区', '1', '2975', '2995', '0', '620503', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2998', '清水县', '1', '2975', '2995', '0', '620521', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('2999', '秦安县', '1', '2975', '2995', '0', '620522', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3000', '甘谷县', '1', '2975', '2995', '0', '620523', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3001', '武山县', '1', '2975', '2995', '0', '620524', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3002', '张家川回族自治县', '1', '2975', '2995', '0', '620525', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3003', '武威市', '1', '2975', '0', '0', '620600', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('3004', '凉州区', '1', '2975', '3003', '0', '620602', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3005', '民勤县', '1', '2975', '3003', '0', '620621', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3006', '古浪县', '1', '2975', '3003', '0', '620622', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3007', '天祝藏族自治县', '1', '2975', '3003', '0', '620623', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3008', '张掖市', '1', '2975', '0', '0', '620700', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('3009', '甘州区', '1', '2975', '3008', '0', '620702', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3010', '肃南裕固族自治县', '1', '2975', '3008', '0', '620721', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3011', '民乐县', '1', '2975', '3008', '0', '620722', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3012', '临泽县', '1', '2975', '3008', '0', '620723', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3013', '高台县', '1', '2975', '3008', '0', '620724', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3014', '山丹县', '1', '2975', '3008', '0', '620725', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3015', '平凉市', '1', '2975', '0', '0', '620800', '0', '2014-06-04 04:51:38', '2014-06-04 04:51:38');
INSERT INTO `regions` VALUES ('3016', '崆峒区', '1', '2975', '3015', '0', '620802', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3017', '泾川县', '1', '2975', '3015', '0', '620821', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3018', '灵台县', '1', '2975', '3015', '0', '620822', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3019', '崇信县', '1', '2975', '3015', '0', '620823', '0', '2014-06-04 04:51:38', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3020', '华亭县', '1', '2975', '3015', '0', '620824', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3021', '庄浪县', '1', '2975', '3015', '0', '620825', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3022', '静宁县', '1', '2975', '3015', '0', '620826', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3023', '酒泉市', '1', '2975', '0', '0', '620900', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3024', '肃州区', '1', '2975', '3023', '0', '620902', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3025', '金塔县', '1', '2975', '3023', '0', '620921', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3026', '瓜州县', '1', '2975', '3023', '0', '620922', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3027', '肃北蒙古族自治县', '1', '2975', '3023', '0', '620923', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3028', '阿克塞哈萨克族自治县', '1', '2975', '3023', '0', '620924', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3029', '玉门市', '1', '2975', '3023', '0', '620981', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3030', '敦煌市', '1', '2975', '3023', '0', '620982', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3031', '庆阳市', '1', '2975', '0', '0', '621000', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3032', '西峰区', '1', '2975', '3031', '0', '621002', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3033', '庆城县', '1', '2975', '3031', '0', '621021', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3034', '环县', '1', '2975', '3031', '0', '621022', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3035', '华池县', '1', '2975', '3031', '0', '621023', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3036', '合水县', '1', '2975', '3031', '0', '621024', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3037', '正宁县', '1', '2975', '3031', '0', '621025', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3038', '宁县', '1', '2975', '3031', '0', '621026', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3039', '镇原县', '1', '2975', '3031', '0', '621027', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3040', '定西市', '1', '2975', '0', '0', '621100', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3041', '安定区', '1', '2975', '3040', '0', '621102', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3042', '通渭县', '1', '2975', '3040', '0', '621121', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3043', '陇西县', '1', '2975', '3040', '0', '621122', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3044', '渭源县', '1', '2975', '3040', '0', '621123', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3045', '临洮县', '1', '2975', '3040', '0', '621124', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3046', '漳县', '1', '2975', '3040', '0', '621125', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3047', '岷县', '1', '2975', '3040', '0', '621126', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3048', '陇南市', '1', '2975', '0', '0', '621200', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3049', '武都区', '1', '2975', '3048', '0', '621202', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3050', '成县', '1', '2975', '3048', '0', '621221', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3051', '文县', '1', '2975', '3048', '0', '621222', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3052', '宕昌县', '1', '2975', '3048', '0', '621223', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3053', '康县', '1', '2975', '3048', '0', '621224', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3054', '西和县', '1', '2975', '3048', '0', '621225', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3055', '礼县', '1', '2975', '3048', '0', '621226', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3056', '徽县', '1', '2975', '3048', '0', '621227', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3057', '两当县', '1', '2975', '3048', '0', '621228', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3058', '临夏回族自治州', '1', '2975', '0', '0', '622900', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3059', '临夏市', '1', '2975', '3058', '0', '622901', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3060', '临夏县', '1', '2975', '3058', '0', '622921', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3061', '康乐县', '1', '2975', '3058', '0', '622922', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3062', '永靖县', '1', '2975', '3058', '0', '622923', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3063', '广河县', '1', '2975', '3058', '0', '622924', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3064', '和政县', '1', '2975', '3058', '0', '622925', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3065', '东乡族自治县', '1', '2975', '3058', '0', '622926', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3066', '积石山保安族东乡族撒拉族自治县', '1', '2975', '3058', '0', '622927', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3067', '甘南藏族自治州', '1', '2975', '0', '0', '623000', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3068', '合作市', '1', '2975', '3067', '0', '623001', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3069', '临潭县', '1', '2975', '3067', '0', '623021', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3070', '卓尼县', '1', '2975', '3067', '0', '623022', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3071', '舟曲县', '1', '2975', '3067', '0', '623023', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3072', '迭部县', '1', '2975', '3067', '0', '623024', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3073', '玛曲县', '1', '2975', '3067', '0', '623025', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3074', '碌曲县', '1', '2975', '3067', '0', '623026', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3075', '夏河县', '1', '2975', '3067', '0', '623027', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3076', '青海省', '1', '0', '0', '0', '630000', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3077', '西宁市', '1', '3076', '0', '0', '630100', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3078', '城东区', '1', '3076', '3077', '0', '630102', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3079', '城中区', '1', '3076', '3077', '0', '630103', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3080', '城西区', '1', '3076', '3077', '0', '630104', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3081', '城北区', '1', '3076', '3077', '0', '630105', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3082', '大通回族土族自治县', '1', '3076', '3077', '0', '630121', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3083', '湟中县', '1', '3076', '3077', '0', '630122', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3084', '湟源县', '1', '3076', '3077', '0', '630123', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3085', '海东地区', '1', '3076', '0', '0', '632100', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3086', '平安县', '1', '3076', '3085', '0', '632121', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3087', '民和回族土族自治县', '1', '3076', '3085', '0', '632122', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3088', '乐都县', '1', '3076', '3085', '0', '632123', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3089', '互助土族自治县', '1', '3076', '3085', '0', '632126', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3090', '化隆回族自治县', '1', '3076', '3085', '0', '632127', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3091', '循化撒拉族自治县', '1', '3076', '3085', '0', '632128', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3092', '海北藏族自治州', '1', '3076', '0', '0', '632200', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3093', '门源回族自治县', '1', '3076', '3092', '0', '632221', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3094', '祁连县', '1', '3076', '3092', '0', '632222', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3095', '海晏县', '1', '3076', '3092', '0', '632223', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3096', '刚察县', '1', '3076', '3092', '0', '632224', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3097', '黄南藏族自治州', '1', '3076', '0', '0', '632300', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3098', '同仁县', '1', '3076', '3097', '0', '632321', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3099', '尖扎县', '1', '3076', '3097', '0', '632322', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3100', '泽库县', '1', '3076', '3097', '0', '632323', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3101', '河南蒙古族自治县', '1', '3076', '3097', '0', '632324', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3102', '海南藏族自治州', '1', '3076', '0', '0', '632500', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3103', '共和县', '1', '3076', '3102', '0', '632521', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3104', '同德县', '1', '3076', '3102', '0', '632522', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3105', '贵德县', '1', '3076', '3102', '0', '632523', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3106', '兴海县', '1', '3076', '3102', '0', '632524', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3107', '贵南县', '1', '3076', '3102', '0', '632525', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3108', '果洛藏族自治州', '1', '3076', '0', '0', '632600', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3109', '玛沁县', '1', '3076', '3108', '0', '632621', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3110', '班玛县', '1', '3076', '3108', '0', '632622', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3111', '甘德县', '1', '3076', '3108', '0', '632623', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3112', '达日县', '1', '3076', '3108', '0', '632624', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3113', '久治县', '1', '3076', '3108', '0', '632625', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3114', '玛多县', '1', '3076', '3108', '0', '632626', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3115', '玉树藏族自治州', '1', '3076', '0', '0', '632700', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3116', '玉树县', '1', '3076', '3115', '0', '632721', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3117', '杂多县', '1', '3076', '3115', '0', '632722', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3118', '称多县', '1', '3076', '3115', '0', '632723', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3119', '治多县', '1', '3076', '3115', '0', '632724', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3120', '囊谦县', '1', '3076', '3115', '0', '632725', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3121', '曲麻莱县', '1', '3076', '3115', '0', '632726', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3122', '海西蒙古族藏族自治州', '1', '3076', '0', '0', '632800', '0', '2014-06-04 04:51:39', '2014-06-04 04:51:39');
INSERT INTO `regions` VALUES ('3123', '格尔木市', '1', '3076', '3122', '0', '632801', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3124', '德令哈市', '1', '3076', '3122', '0', '632802', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3125', '乌兰县', '1', '3076', '3122', '0', '632821', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3126', '都兰县', '1', '3076', '3122', '0', '632822', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3127', '天峻县', '1', '3076', '3122', '0', '632823', '0', '2014-06-04 04:51:39', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3128', '宁夏回族自治区', '1', '0', '0', '0', '640000', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3129', '银川市', '1', '3128', '0', '0', '640100', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3130', '兴庆区', '1', '3128', '3129', '0', '640104', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3131', '西夏区', '1', '3128', '3129', '0', '640105', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3132', '金凤区', '1', '3128', '3129', '0', '640106', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3133', '永宁县', '1', '3128', '3129', '0', '640121', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3134', '贺兰县', '1', '3128', '3129', '0', '640122', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3135', '灵武市', '1', '3128', '3129', '0', '640181', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3136', '石嘴山市', '1', '3128', '0', '0', '640200', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3137', '大武口区', '1', '3128', '3136', '0', '640202', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:09');
INSERT INTO `regions` VALUES ('3138', '惠农区', '1', '3128', '3136', '0', '640205', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3139', '平罗县', '1', '3128', '3136', '0', '640221', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3140', '吴忠市', '1', '3128', '0', '0', '640300', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3141', '利通区', '1', '3128', '3140', '0', '640302', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3142', '红寺堡区', '1', '3128', '3140', '0', '640303', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3143', '盐池县', '1', '3128', '3140', '0', '640323', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3144', '同心县', '1', '3128', '3140', '0', '640324', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3145', '青铜峡市', '1', '3128', '3140', '0', '640381', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3146', '固原市', '1', '3128', '0', '0', '640400', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3147', '原州区', '1', '3128', '3146', '0', '640402', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3148', '西吉县', '1', '3128', '3146', '0', '640422', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3149', '隆德县', '1', '3128', '3146', '0', '640423', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3150', '泾源县', '1', '3128', '3146', '0', '640424', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3151', '彭阳县', '1', '3128', '3146', '0', '640425', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3152', '中卫市', '1', '3128', '0', '0', '640500', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3153', '沙坡头区', '1', '3128', '3152', '0', '640502', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3154', '中宁县', '1', '3128', '3152', '0', '640521', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3155', '海原县', '1', '3128', '3152', '0', '640522', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3156', '新疆维吾尔自治区', '1', '0', '0', '0', '650000', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3157', '乌鲁木齐市', '1', '3156', '0', '0', '650100', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3158', '天山区', '1', '3156', '3157', '0', '650102', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3159', '沙依巴克区', '1', '3156', '3157', '0', '650103', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3160', '新市区', '1', '3156', '3157', '0', '650104', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3161', '水磨沟区', '1', '3156', '3157', '0', '650105', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3162', '头屯河区', '1', '3156', '3157', '0', '650106', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3163', '达坂城区', '1', '3156', '3157', '0', '650107', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3164', '米东区', '1', '3156', '3157', '0', '650109', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3165', '乌鲁木齐县', '1', '3156', '3157', '0', '650121', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3166', '克拉玛依市', '1', '3156', '0', '0', '650200', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3167', '独山子区', '1', '3156', '3166', '0', '650202', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3168', '克拉玛依区', '1', '3156', '3166', '0', '650203', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3169', '白碱滩区', '1', '3156', '3166', '0', '650204', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3170', '乌尔禾区', '1', '3156', '3166', '0', '650205', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3171', '吐鲁番地区', '1', '3156', '0', '0', '652100', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3172', '吐鲁番市', '1', '3156', '3171', '0', '652101', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3173', '鄯善县', '1', '3156', '3171', '0', '652122', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3174', '托克逊县', '1', '3156', '3171', '0', '652123', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3175', '哈密地区', '1', '3156', '0', '0', '652200', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3176', '哈密市', '1', '3156', '3175', '0', '652201', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3177', '巴里坤哈萨克自治县', '1', '3156', '3175', '0', '652222', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3178', '伊吾县', '1', '3156', '3175', '0', '652223', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3179', '昌吉回族自治州', '1', '3156', '0', '0', '652300', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3180', '昌吉市', '1', '3156', '3179', '0', '652301', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3181', '阜康市', '1', '3156', '3179', '0', '652302', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3182', '呼图壁县', '1', '3156', '3179', '0', '652323', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3183', '玛纳斯县', '1', '3156', '3179', '0', '652324', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3184', '奇台县', '1', '3156', '3179', '0', '652325', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3185', '吉木萨尔县', '1', '3156', '3179', '0', '652327', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3186', '木垒哈萨克自治县', '1', '3156', '3179', '0', '652328', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3187', '博尔塔拉蒙古自治州', '1', '3156', '0', '0', '652700', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3188', '博乐市', '1', '3156', '3187', '0', '652701', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3189', '精河县', '1', '3156', '3187', '0', '652722', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3190', '温泉县', '1', '3156', '3187', '0', '652723', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3191', '巴音郭楞蒙古自治州', '1', '3156', '0', '0', '652800', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3192', '库尔勒市', '1', '3156', '3191', '0', '652801', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3193', '轮台县', '1', '3156', '3191', '0', '652822', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3194', '尉犁县', '1', '3156', '3191', '0', '652823', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3195', '若羌县', '1', '3156', '3191', '0', '652824', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3196', '且末县', '1', '3156', '3191', '0', '652825', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3197', '焉耆回族自治县', '1', '3156', '3191', '0', '652826', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3198', '和静县', '1', '3156', '3191', '0', '652827', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3199', '和硕县', '1', '3156', '3191', '0', '652828', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3200', '博湖县', '1', '3156', '3191', '0', '652829', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3201', '阿克苏地区', '1', '3156', '0', '0', '652900', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3202', '阿克苏市', '1', '3156', '3201', '0', '652901', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3203', '温宿县', '1', '3156', '3201', '0', '652922', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3204', '库车县', '1', '3156', '3201', '0', '652923', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3205', '沙雅县', '1', '3156', '3201', '0', '652924', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3206', '新和县', '1', '3156', '3201', '0', '652925', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3207', '拜城县', '1', '3156', '3201', '0', '652926', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3208', '乌什县', '1', '3156', '3201', '0', '652927', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3209', '阿瓦提县', '1', '3156', '3201', '0', '652928', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3210', '柯坪县', '1', '3156', '3201', '0', '652929', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3211', '克孜勒苏柯尔克孜自治州', '1', '3156', '0', '0', '653000', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3212', '阿图什市', '1', '3156', '3211', '0', '653001', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3213', '阿克陶县', '1', '3156', '3211', '0', '653022', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3214', '阿合奇县', '1', '3156', '3211', '0', '653023', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3215', '乌恰县', '1', '3156', '3211', '0', '653024', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3216', '喀什地区', '1', '3156', '0', '0', '653100', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3217', '喀什市', '1', '3156', '3216', '0', '653101', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3218', '疏附县', '1', '3156', '3216', '0', '653121', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3219', '疏勒县', '1', '3156', '3216', '0', '653122', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3220', '英吉沙县', '1', '3156', '3216', '0', '653123', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3221', '泽普县', '1', '3156', '3216', '0', '653124', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3222', '莎车县', '1', '3156', '3216', '0', '653125', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3223', '叶城县', '1', '3156', '3216', '0', '653126', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3224', '麦盖提县', '1', '3156', '3216', '0', '653127', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3225', '岳普湖县', '1', '3156', '3216', '0', '653128', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3226', '伽师县', '1', '3156', '3216', '0', '653129', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3227', '巴楚县', '1', '3156', '3216', '0', '653130', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3228', '塔什库尔干塔吉克自治县', '1', '3156', '3216', '0', '653131', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3229', '和田地区', '1', '3156', '0', '0', '653200', '0', '2014-06-04 04:51:40', '2014-06-04 04:51:40');
INSERT INTO `regions` VALUES ('3230', '和田市', '1', '3156', '3229', '0', '653201', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3231', '和田县', '1', '3156', '3229', '0', '653221', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3232', '墨玉县', '1', '3156', '3229', '0', '653222', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3233', '皮山县', '1', '3156', '3229', '0', '653223', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3234', '洛浦县', '1', '3156', '3229', '0', '653224', '0', '2014-06-04 04:51:40', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3235', '策勒县', '1', '3156', '3229', '0', '653225', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3236', '于田县', '1', '3156', '3229', '0', '653226', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3237', '民丰县', '1', '3156', '3229', '0', '653227', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3238', '伊犁哈萨克自治州', '1', '3156', '0', '0', '654000', '0', '2014-06-04 04:51:41', '2014-06-04 04:51:41');
INSERT INTO `regions` VALUES ('3239', '伊宁市', '1', '3156', '3238', '0', '654002', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3240', '奎屯市', '1', '3156', '3238', '0', '654003', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3241', '伊宁县', '1', '3156', '3238', '0', '654021', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3242', '察布查尔锡伯自治县', '1', '3156', '3238', '0', '654022', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3243', '霍城县', '1', '3156', '3238', '0', '654023', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3244', '巩留县', '1', '3156', '3238', '0', '654024', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3245', '新源县', '1', '3156', '3238', '0', '654025', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3246', '昭苏县', '1', '3156', '3238', '0', '654026', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3247', '特克斯县', '1', '3156', '3238', '0', '654027', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3248', '尼勒克县', '1', '3156', '3238', '0', '654028', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3249', '塔城地区', '1', '3156', '0', '0', '654200', '0', '2014-06-04 04:51:41', '2014-06-04 04:51:41');
INSERT INTO `regions` VALUES ('3250', '塔城市', '1', '3156', '3249', '0', '654201', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3251', '乌苏市', '1', '3156', '3249', '0', '654202', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3252', '额敏县', '1', '3156', '3249', '0', '654221', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3253', '沙湾县', '1', '3156', '3249', '0', '654223', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3254', '托里县', '1', '3156', '3249', '0', '654224', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3255', '裕民县', '1', '3156', '3249', '0', '654225', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3256', '和布克赛尔蒙古自治县', '1', '3156', '3249', '0', '654226', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3257', '阿勒泰地区', '1', '3156', '0', '0', '654300', '0', '2014-06-04 04:51:41', '2014-06-04 04:51:41');
INSERT INTO `regions` VALUES ('3258', '阿勒泰市', '1', '3156', '3257', '0', '654301', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3259', '布尔津县', '1', '3156', '3257', '0', '654321', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3260', '富蕴县', '1', '3156', '3257', '0', '654322', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3261', '福海县', '1', '3156', '3257', '0', '654323', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3262', '哈巴河县', '1', '3156', '3257', '0', '654324', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3263', '青河县', '1', '3156', '3257', '0', '654325', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3264', '吉木乃县', '1', '3156', '3257', '0', '654326', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3265', '自治区直辖县级行政区划', '1', '3156', '0', '0', '659000', '0', '2014-06-04 04:51:41', '2014-06-04 04:51:41');
INSERT INTO `regions` VALUES ('3266', '石河子市', '1', '3156', '3265', '0', '659001', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3267', '阿拉尔市', '1', '3156', '3265', '0', '659002', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3268', '图木舒克市', '1', '3156', '3265', '0', '659003', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3269', '五家渠市', '1', '3156', '3265', '0', '659004', '0', '2014-06-04 04:51:41', '2014-08-23 03:22:10');
INSERT INTO `regions` VALUES ('3495', '台湾省', '1', '0', '0', '0', '710000', '0', '2014-06-04 04:51:43', '2014-06-04 04:51:43');
INSERT INTO `regions` VALUES ('3496', '香港特别行政区', '1', '0', '0', '0', '810000', '0', '2014-06-04 04:51:43', '2014-06-04 04:51:43');
INSERT INTO `regions` VALUES ('3497', '澳门特别行政区', '1', '0', '0', '0', '820000', '0', '2014-06-04 04:51:43', '2014-06-04 04:51:43');
INSERT INTO `regions` VALUES ('3499', '北京市', '1', '140', '0', '0', '110000', '0', '2014-06-12 16:39:52', '2014-06-12 16:39:52');
INSERT INTO `regions` VALUES ('3500', '天津市', '1', '157', '0', '0', '120000', '0', '2014-06-12 16:40:34', '2014-06-12 16:40:34');
INSERT INTO `regions` VALUES ('3501', '重庆市', '1', '2284', '0', '0', '500000', '0', '2014-06-12 16:40:45', '2014-06-12 16:40:45');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `detail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', '张阳', 'cn', 'Est est dolores ut aspernatur rerum ad quis.', '2015-03-04 11:23:44', '2015-03-04 11:23:44');
INSERT INTO `roles` VALUES ('2', '万桂荣', 'it', 'Iure quos aut assumenda laboriosam.', '2015-03-04 11:23:44', '2015-03-04 11:23:44');
INSERT INTO `roles` VALUES ('3', '高兵', 'en', 'Qui consequatur rerum et.', '2015-03-04 11:23:44', '2015-03-04 11:23:44');

-- ----------------------------
-- Table structure for shops
-- ----------------------------
DROP TABLE IF EXISTS `shops`;
CREATE TABLE `shops` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '我的店铺',
  `logo_image_id` int(11) NOT NULL DEFAULT '0',
  `cover_image_id` int(11) NOT NULL DEFAULT '0',
  `weixin` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `intro` text COLLATE utf8_unicode_ci NOT NULL,
  `merchant_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shops
-- ----------------------------
INSERT INTO `shops` VALUES ('1', 'PHPer', '234', '236', 'JXLLOVECLX', '欢迎大家来买哦！', '1', '2015-03-13 13:58:06', '2015-03-19 14:49:06');
INSERT INTO `shops` VALUES ('2', '阿甘', '215', '216', '67992649826', '我的店铺时尚时尚最时尚', '2', '2015-03-13 14:35:23', '2015-03-13 14:44:07');
INSERT INTO `shops` VALUES ('3', '店铺名称', '0', '0', '', '我的店铺', '3', '2015-03-13 14:39:56', '2015-03-13 14:39:56');
INSERT INTO `shops` VALUES ('4', '店铺名称', '0', '0', '', '', '4', '2015-03-17 12:35:58', '2015-03-17 12:35:58');
INSERT INTO `shops` VALUES ('5', '店铺名称', '0', '0', '', '我的店铺', '5', '2015-03-17 12:49:27', '2015-03-17 12:49:27');
INSERT INTO `shops` VALUES ('6', '店铺名称', '0', '0', '', '', '6', '2015-03-19 11:02:35', '2015-03-19 11:02:35');
INSERT INTO `shops` VALUES ('7', '店铺名称', '0', '0', '', '我的店铺', '7', '2015-03-19 16:58:41', '2015-03-19 16:58:41');
INSERT INTO `shops` VALUES ('8', '店铺名称', '0', '0', '', '我的店铺', '8', '2015-03-19 16:59:24', '2015-03-19 16:59:24');
INSERT INTO `shops` VALUES ('9', '店铺名称', '0', '0', '', '我的店铺', '9', '2015-03-19 17:00:00', '2015-03-19 17:00:00');
INSERT INTO `shops` VALUES ('10', '店铺名称', '0', '0', '', '我的店铺', '10', '2015-03-19 17:06:18', '2015-03-19 17:06:18');
INSERT INTO `shops` VALUES ('11', '店铺名称', '0', '0', '', '我的店铺', '11', '2015-03-19 17:09:55', '2015-03-19 17:09:55');
INSERT INTO `shops` VALUES ('12', '店铺名称', '0', '0', '', '我的店铺', '12', '2015-03-19 18:28:38', '2015-03-19 18:28:38');
INSERT INTO `shops` VALUES ('13', '优米洗面奶', '234', '0', '', '这是一家护肤品店', '13', '2015-04-16 14:54:22', '0000-00-00 00:00:00');

-- ----------------------------
-- Table structure for shop_products
-- ----------------------------
DROP TABLE IF EXISTS `shop_products`;
CREATE TABLE `shop_products` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(10) unsigned NOT NULL,
  `product_id` int(10) unsigned NOT NULL,
  `merchant_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shop_products
-- ----------------------------
INSERT INTO `shop_products` VALUES ('1', '3', '5', '3', '2015-03-13 14:41:54', '2015-03-13 14:41:54');
INSERT INTO `shop_products` VALUES ('2', '3', '4', '3', '2015-03-13 14:41:55', '2015-03-13 14:41:55');
INSERT INTO `shop_products` VALUES ('6', '2', '3', '2', '2015-03-16 13:49:41', '2015-03-16 13:49:41');
INSERT INTO `shop_products` VALUES ('7', '1', '5', '1', '2015-03-19 14:32:56', '2015-03-19 14:32:56');
INSERT INTO `shop_products` VALUES ('8', '1', '4', '1', '2015-03-19 14:32:58', '2015-03-19 14:32:58');
INSERT INTO `shop_products` VALUES ('9', '1', '3', '1', '2015-03-19 14:32:59', '2015-03-19 14:32:59');
INSERT INTO `shop_products` VALUES ('10', '1', '2', '1', '2015-03-19 14:33:02', '2015-03-19 14:33:02');
INSERT INTO `shop_products` VALUES ('11', '2', '5', '2', '2015-03-19 15:05:07', '2015-03-19 15:05:07');
INSERT INTO `shop_products` VALUES ('12', '11', '5', '11', '2015-03-19 17:12:53', '2015-03-19 17:12:53');
INSERT INTO `shop_products` VALUES ('13', '11', '4', '11', '2015-03-19 17:12:57', '2015-03-19 17:12:57');
INSERT INTO `shop_products` VALUES ('14', '11', '3', '11', '2015-03-19 17:13:02', '2015-03-19 17:13:02');
INSERT INTO `shop_products` VALUES ('15', '10', '6', '10', '2015-03-20 20:41:29', '2015-03-20 20:41:29');
INSERT INTO `shop_products` VALUES ('16', '1', '25', '1', '2015-04-16 15:21:28', '2015-04-16 15:21:28');
INSERT INTO `shop_products` VALUES ('17', '13', '25', '13', '2015-04-16 15:30:01', '2015-04-16 15:30:01');
INSERT INTO `shop_products` VALUES ('18', '13', '24', '13', '2015-04-16 15:47:17', '2015-04-16 15:47:17');

-- ----------------------------
-- Table structure for skin_checks
-- ----------------------------
DROP TABLE IF EXISTS `skin_checks`;
CREATE TABLE `skin_checks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` tinyint(4) NOT NULL DEFAULT '1',
  `moisture` float(8,2) NOT NULL DEFAULT '0.00',
  `oil` float(8,2) NOT NULL DEFAULT '0.00',
  `result_percent` float(8,2) NOT NULL DEFAULT '0.00',
  `result_value` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of skin_checks
-- ----------------------------

-- ----------------------------
-- Table structure for skin_result
-- ----------------------------
DROP TABLE IF EXISTS `skin_result`;
CREATE TABLE `skin_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skin_status` text,
  `skin_suggest` text,
  `skin_suggest_code` int(1) NOT NULL DEFAULT '0',
  `positionl` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of skin_result
-- ----------------------------

-- ----------------------------
-- Table structure for skin_types
-- ----------------------------
DROP TABLE IF EXISTS `skin_types`;
CREATE TABLE `skin_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of skin_types
-- ----------------------------

-- ----------------------------
-- Table structure for user_adviser_star
-- ----------------------------
DROP TABLE IF EXISTS `user_adviser_star`;
CREATE TABLE `user_adviser_star` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cust_id` int(11) NOT NULL DEFAULT '0',
  `adviser_id` int(11) NOT NULL DEFAULT '0',
  `star_score` int(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_adviser_star
-- ----------------------------
