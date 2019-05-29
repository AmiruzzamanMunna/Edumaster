-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 29, 2019 at 09:23 AM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `edumaster1`
--

-- --------------------------------------------------------

--
-- Table structure for table `oc_api`
--

DROP TABLE IF EXISTS `oc_api`;
CREATE TABLE IF NOT EXISTS `oc_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'eTXan3TBFpZyjfQtEMSsO3M1KpIWgQKmnrbIzjFd4AUNMdB4v1CIWCJWX5aq3qPNf05bqrD3OtB5r82eVo4TTIkS1ysUiQxFiAJn8RuQWYhn1Tx1SzzLyCeBUKN6bCQEpz5pkINxyfeXJHDhfUNVrbSDTFZ4oQCqCF6znO3lzsUTbKpxMortt8uHvJIsdYYuteyzWXDBJTIXhubj27kkGzd1FKtw4YdL0yN8MaO0mtaSWxY4N3S0V4oHAS66rFum', 1, '2019-04-30 17:30:28', '2019-05-05 11:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_ip`
--

DROP TABLE IF EXISTS `oc_api_ip`;
CREATE TABLE IF NOT EXISTS `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api_ip`
--

INSERT INTO `oc_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(2, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `oc_api_session`
--

DROP TABLE IF EXISTS `oc_api_session`;
CREATE TABLE IF NOT EXISTS `oc_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_api_session`
--

INSERT INTO `oc_api_session` (`api_session_id`, `api_id`, `session_id`, `ip`, `date_added`, `date_modified`) VALUES
(1, 1, '36f12c98b6199e1617b94031aa', '127.0.0.1', '2019-05-04 15:13:57', '2019-05-04 15:13:57');

-- --------------------------------------------------------

--
-- Table structure for table `oc_event`
--

DROP TABLE IF EXISTS `oc_event`;
CREATE TABLE IF NOT EXISTS `oc_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', 'catalog/model/account/customer/addCustomer/after', 'event/activity/addCustomer', 1, 0),
(2, 'activity_customer_edit', 'catalog/model/account/customer/editCustomer/after', 'event/activity/editCustomer', 1, 0),
(3, 'activity_customer_password', 'catalog/model/account/customer/editPassword/after', 'event/activity/editPassword', 1, 0),
(4, 'activity_customer_forgotten', 'catalog/model/account/customer/editCode/after', 'event/activity/forgotten', 1, 0),
(5, 'activity_transaction', 'catalog/model/account/customer/addTransaction/after', 'event/activity/addTransaction', 1, 0),
(6, 'activity_customer_login', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity/login', 1, 0),
(7, 'activity_address_add', 'catalog/model/account/address/addAddress/after', 'event/activity/addAddress', 1, 0),
(8, 'activity_address_edit', 'catalog/model/account/address/editAddress/after', 'event/activity/editAddress', 1, 0),
(9, 'activity_address_delete', 'catalog/model/account/address/deleteAddress/after', 'event/activity/deleteAddress', 1, 0),
(10, 'activity_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'event/activity/addAffiliate', 1, 0),
(11, 'activity_affiliate_edit', 'catalog/model/account/customer/editAffiliate/after', 'event/activity/editAffiliate', 1, 0),
(12, 'activity_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'event/activity/addOrderHistory', 1, 0),
(13, 'activity_return_add', 'catalog/model/account/return/addReturn/after', 'event/activity/addReturn', 1, 0),
(14, 'mail_transaction', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 0),
(15, 'mail_forgotten', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 0),
(16, 'mail_customer_add', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 0),
(17, 'mail_customer_alert', 'catalog/model/account/customer/addCustomer/after', 'mail/register/alert', 1, 0),
(18, 'mail_affiliate_add', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate', 1, 0),
(19, 'mail_affiliate_alert', 'catalog/model/account/customer/addAffiliate/after', 'mail/affiliate/alert', 1, 0),
(20, 'mail_voucher', 'catalog/model/checkout/order/addOrderHistory/after', 'extension/total/voucher/send', 1, 0),
(21, 'mail_order_add', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order', 1, 0),
(22, 'mail_order_alert', 'catalog/model/checkout/order/addOrderHistory/before', 'mail/order/alert', 1, 0),
(23, 'statistics_review_add', 'catalog/model/catalog/review/addReview/after', 'event/statistics/addReview', 1, 0),
(24, 'statistics_return_add', 'catalog/model/account/return/addReturn/after', 'event/statistics/addReturn', 1, 0),
(25, 'statistics_order_history', 'catalog/model/checkout/order/addOrderHistory/after', 'event/statistics/addOrderHistory', 1, 0),
(26, 'admin_mail_affiliate_approve', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate/approve', 1, 0),
(27, 'admin_mail_affiliate_deny', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate/deny', 1, 0),
(28, 'admin_mail_customer_approve', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer/approve', 1, 0),
(29, 'admin_mail_customer_deny', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer/deny', 1, 0),
(30, 'admin_mail_reward', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 0),
(31, 'admin_mail_transaction', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 0),
(32, 'admin_mail_return', 'admin/model/sale/return/addReturn/after', 'mail/return', 1, 0),
(33, 'admin_mail_forgotten', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 0),
(34, 'advertise_google', 'admin/model/catalog/product/deleteProduct/after', 'extension/advertise/google/deleteProduct', 1, 0),
(35, 'advertise_google', 'admin/model/catalog/product/copyProduct/after', 'extension/advertise/google/copyProduct', 1, 0),
(36, 'advertise_google', 'admin/view/common/column_left/before', 'extension/advertise/google/admin_link', 1, 0),
(37, 'advertise_google', 'admin/model/catalog/product/addProduct/after', 'extension/advertise/google/addProduct', 1, 0),
(38, 'advertise_google', 'catalog/controller/checkout/success/before', 'extension/advertise/google/before_checkout_success', 1, 0),
(39, 'advertise_google', 'catalog/view/common/header/after', 'extension/advertise/google/google_global_site_tag', 1, 0),
(40, 'advertise_google', 'catalog/view/common/success/after', 'extension/advertise/google/google_dynamic_remarketing_purchase', 1, 0),
(41, 'advertise_google', 'catalog/view/product/product/after', 'extension/advertise/google/google_dynamic_remarketing_product', 1, 0),
(42, 'advertise_google', 'catalog/view/product/search/after', 'extension/advertise/google/google_dynamic_remarketing_searchresults', 1, 0),
(43, 'advertise_google', 'catalog/view/product/category/after', 'extension/advertise/google/google_dynamic_remarketing_category', 1, 0),
(44, 'advertise_google', 'catalog/view/common/home/after', 'extension/advertise/google/google_dynamic_remarketing_home', 1, 0),
(45, 'advertise_google', 'catalog/view/checkout/cart/after', 'extension/advertise/google/google_dynamic_remarketing_cart', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension`
--

DROP TABLE IF EXISTS `oc_extension`;
CREATE TABLE IF NOT EXISTS `oc_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(20, 'theme', 'default'),
(22, 'dashboard', 'sale'),
(23, 'dashboard', 'recent'),
(24, 'dashboard', 'order'),
(25, 'dashboard', 'online'),
(27, 'dashboard', 'customer'),
(29, 'report', 'sale_coupon'),
(31, 'report', 'customer_search'),
(32, 'report', 'customer_transaction'),
(33, 'report', 'product_purchased'),
(34, 'report', 'product_viewed'),
(35, 'report', 'sale_return'),
(36, 'report', 'sale_order'),
(37, 'report', 'sale_shipping'),
(38, 'report', 'sale_tax'),
(39, 'report', 'customer_activity'),
(40, 'report', 'customer_order'),
(41, 'report', 'customer_reward');

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_install`
--

DROP TABLE IF EXISTS `oc_extension_install`;
CREATE TABLE IF NOT EXISTS `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_download_id` int(11) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`extension_install_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_extension_path`
--

DROP TABLE IF EXISTS `oc_extension_path`;
CREATE TABLE IF NOT EXISTS `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`extension_path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_feature`
--

DROP TABLE IF EXISTS `oc_feature`;
CREATE TABLE IF NOT EXISTS `oc_feature` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `featurename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oc_feature`
--

INSERT INTO `oc_feature` (`id`, `featurename`) VALUES
(1, 'school'),
(2, 'system'),
(3, 'setting'),
(4, 'user');

-- --------------------------------------------------------

--
-- Table structure for table `oc_hishab_stores`
--

DROP TABLE IF EXISTS `oc_hishab_stores`;
CREATE TABLE IF NOT EXISTS `oc_hishab_stores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `owner_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `latitude` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `longitude` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `store_type_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oc_language`
--

DROP TABLE IF EXISTS `oc_language`;
CREATE TABLE IF NOT EXISTS `oc_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'English', 'en-gb', 'en-US,en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_modification`
--

DROP TABLE IF EXISTS `oc_modification`;
CREATE TABLE IF NOT EXISTS `oc_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `extension_install_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_module`
--

DROP TABLE IF EXISTS `oc_module`;
CREATE TABLE IF NOT EXISTS `oc_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{\"name\":\"Category\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}'),
(29, 'Home Page', 'carousel', '{\"name\":\"Home Page\",\"banner_id\":\"8\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}'),
(28, 'Home Page', 'featured', '{\"name\":\"Home Page\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(27, 'Home Page', 'slideshow', '{\"name\":\"Home Page\",\"banner_id\":\"7\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(31, 'Banner 1', 'banner', '{\"name\":\"Banner 1\",\"banner_id\":\"6\",\"width\":\"182\",\"height\":\"182\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Table structure for table `oc_permission`
--

DROP TABLE IF EXISTS `oc_permission`;
CREATE TABLE IF NOT EXISTS `oc_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feature_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oc_permission`
--

INSERT INTO `oc_permission` (`id`, `user_group_id`, `user_id`, `feature_id`, `status`) VALUES
(1, 2, 2, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `oc_school`
--

DROP TABLE IF EXISTS `oc_school`;
CREATE TABLE IF NOT EXISTS `oc_school` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `school_code` varchar(100) NOT NULL,
  `school_name` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `total_student` varchar(100) NOT NULL,
  `school_account` varchar(100) NOT NULL,
  `school_account_type` varchar(100) NOT NULL,
  `academic_session` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `oc_school`
--

INSERT INTO `oc_school` (`id`, `school_code`, `school_name`, `location`, `total_student`, `school_account`, `school_account_type`, `academic_session`) VALUES
(14, 'Rbm 1001', 'RaniBilash Moni', 'Gazipur', '7000', 'Goverment', 'Debit', '2019-2020'),
(15, 'Bari 1002', 'Bari school', 'Gazipur', '4000', 'Semi Goverment', 'Debit', '2019-2020');

-- --------------------------------------------------------

--
-- Table structure for table `oc_session`
--

DROP TABLE IF EXISTS `oc_session`;
CREATE TABLE IF NOT EXISTS `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_session`
--

INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('06de576ea79f145ed4c797bef8', '{\"user_id\":null,\"user_token\":\"TtZqeKD8OJN4IGAQLoy6imhUEuXDoDDQ\",\"id\":\"1\"}', '2019-05-27 04:03:44'),
('0d2af0a44a0848fe8bf77fb14c', '{\"user_id\":\"1\",\"user_token\":\"qieGcjNI2PpVFoEmEmqua7haDp9GQCoW\"}', '2019-05-08 08:55:43'),
('0fd2c6e2301f74289e3284672a', '{\"user_id\":\"1\",\"user_token\":\"1u2PYqhmSmKMfzGTzXQqCxDCafXSfLsN\"}', '2019-04-30 12:27:51'),
('1e419d26e9f62f428c59e8ce78', '{\"user_id\":\"1\",\"user_token\":\"r6Re73CXrBM4SSjAxws79e7R3B2IzjOI\"}', '2019-05-13 04:39:28'),
('36f12c98b6199e1617b94031aa', '{\"api_id\":\"1\"}', '2019-05-04 09:37:58'),
('37af2dd956ee5bacb74662bbd6', '{\"user_id\":\"1\",\"user_token\":\"qYikO2BeFAhOcKJr08fFrmjjdylVygOW\"}', '2019-05-22 05:53:24'),
('3aea8dba8dd767c5738c35c057', '[]', '2019-05-12 09:40:23'),
('459a525e1157ab6d0e9a430fe2', 'false', '2019-05-23 12:25:52'),
('70439f20c49cfac12116194ab3', 'false', '2019-05-23 12:25:45'),
('70f81294552efe05a62a820133', 'false', '2019-05-23 12:25:47'),
('72062cd9b41f3dc3bfba76cbed', '{\"user_id\":\"1\",\"user_token\":\"fNqNNQv1rdt6Qo7np8fsH7hgRU9VGg50\"}', '2019-05-15 08:48:17'),
('7c63d41e25287de25f7b42435d', 'false', '2019-05-23 12:25:50'),
('7d32a9f67e4fcc5cd137affe6c', '[]', '2019-05-23 12:26:55'),
('815943c13840e94245cc97a3a2', '{\"user_id\":\"1\",\"user_token\":\"JWlU42KVQacBOYLokKmFBQo4x2uF7tkF\"}', '2019-05-09 10:01:40'),
('8a343f1efbdfa76b5e7bf08660', '{\"user_id\":\"1\"}', '2019-05-23 09:40:13'),
('8bf9077aca39a402983af1d023', 'false', '2019-05-13 03:34:35'),
('8dec4378056009405fe119ffbb', '[]', '2019-05-06 05:22:51'),
('9c209b1c50635d7a88d84266b4', '[]', '2019-05-25 12:45:50'),
('9cd239901f17f9d6e840aee4a6', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2019-05-02 06:43:34'),
('a6b7b6ca668e28c7886e7168d0', '{\"user_id\":\"1\",\"user_token\":\"Slkl3QTkjQEiEPeM2fEMvAqRjxxRseC5\"}', '2019-05-14 10:04:23'),
('bb5d2407fdba78259ac2b2e36e', '{\"user_id\":\"2\",\"user_token\":\"GkRy6s8Pn23rJDLIv8OKPPq78CPrYNSC\"}', '2019-05-02 12:58:55'),
('bffebed8dd3e71b6c665db8aa3', '[]', '2019-05-07 12:14:33'),
('c3b5a1e9f8afd91354d7eb5906', '{\"user_id\":\"1\",\"user_token\":\"XrDIH80hvUIkd3m8JEp6tG1tO8LlDuPF\"}', '2019-05-26 10:29:03'),
('ceae7320254220b9ba09ef71b3', '{\"user_id\":\"1\",\"user_token\":\"UkLtjPwud1lxLgJQvoHaRAscQ3F6IWi2\"}', '2019-05-11 09:13:03'),
('dc486f27265146c692db20153e', '{\"language\":\"en-gb\",\"currency\":\"USD\"}', '2019-05-04 10:13:50'),
('e0baba788e7246d52741c42665', '{\"language\":\"en-gb\",\"currency\":\"USD\",\"user_id\":\"1\",\"user_token\":\"O1ctiBx9lVcmvSqkSYG0aBF5hNhyKQ5J\"}', '2019-05-05 12:11:08');

-- --------------------------------------------------------

--
-- Table structure for table `oc_setting`
--

DROP TABLE IF EXISTS `oc_setting`;
CREATE TABLE IF NOT EXISTS `oc_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM AUTO_INCREMENT=338 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(323, 0, 'config', 'config_compression', '0', 0),
(324, 0, 'config', 'config_secure', '0', 0),
(325, 0, 'config', 'config_password', '1', 0),
(326, 0, 'config', 'config_shared', '0', 0),
(327, 0, 'config', 'config_encryption', 'PwXwePMOVOt4FqTNrY4S0GkIj8QCDC77GM4cGLb1LYox1IvLglInvYtQKdg2xLNtagGtXRPkw58etX7u1emH3iqCXKCIj4X5m6U0Sv8oVe1EBMQJydxXROYQMODZI3NuarvE9vuB4uoxRazgv8p9sJT04h1FQK0f1mRbAkZazUGTUxoAkBXzzlcgLOuSMq2uUQtpzd5C3Pnaru2GSuPOqCWjHVMw6KPqTP6giEwSniW9d3PIrMbWFuBc806sbfYNKgZ1wC4bEAJPp9RMABQNqEDHIZi4ZamtdpS45j0nJBo5P2wnUtzSEzBVn3pXppPQ1S5vwTAjpOvJta6FT5gIaVBSC6SqVyxenrUnhyT9twHBAHeW1SIX0pBvS3n8IslVGHd9nwNG6ws3MFfreIXrraOS4sabQicc9BIwtpiVnwHo2QpR4C04U2VtrKKsmQy5lmdR8wNlWpH1dUz6qfdBUbPoPXXt5Pm4MlmlatkNTuxtn3e8TDdGZSN1rZEYFiREgRT4N2pjm82T37EJgqWKFPUYA9bO2MKCRuCALOwg6zFaBzY8cdQodaqUQrbckV0MpTQy0PryZSDi6ISDb9xwR9PWTRNKIRL5sJTOk8Hvr8UJRw2TRyXOQeoUXJCAKgdQIsmodoicC7pnHuZb52hMrquDKb46gbewOhXalVsbAGBpJ3lFaJzoPStLRzMuS1UK4Q23WRqwD2mVkj76PrUYiHpOROGvOFNp0ohLYHQKtjTeMIc9TjUiXKHbbfd9gF7pyLPlYGnTRTTDKt6b3hW8Pyk0wTauk6AZpQ9C3CLbHon6ijeluW685kg1QLP9fRmv34fbbeQtnFxhfUeyynsMys12uO4CYsPVl6nvJvsYKV45K55eYcff8vaEz1Y1pz5OrxpH67Z2y7O3QrwT5VfiMKVNc7zkuui4I3P5csygHhjAqyXnLkj1h7G1OkNig1Z7Zm2paEoSuS78MxuxBSUAq8bxogipB5I47WcVwkNko8wg9aNL8SRVbPAQItZja5em', 0),
(4, 0, 'voucher', 'total_voucher_sort_order', '8', 0),
(5, 0, 'voucher', 'total_voucher_status', '1', 0),
(322, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(321, 0, 'config', 'config_seo_url', '0', 0),
(320, 0, 'config', 'config_maintenance', '0', 0),
(319, 0, 'config', 'config_mail_alert_email', '', 0),
(318, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(317, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(316, 0, 'config', 'config_mail_smtp_port', '25', 0),
(315, 0, 'config', 'config_mail_smtp_password', '', 0),
(314, 0, 'config', 'config_mail_smtp_username', '', 0),
(313, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(312, 0, 'config', 'config_mail_parameter', '', 0),
(311, 0, 'config', 'config_mail_engine', 'mail', 0),
(310, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(309, 0, 'config', 'config_logo', 'catalog/logo.png', 0),
(308, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(307, 0, 'config', 'config_captcha', '', 0),
(306, 0, 'config', 'config_return_status_id', '2', 0),
(305, 0, 'config', 'config_return_id', '0', 0),
(304, 0, 'config', 'config_affiliate_id', '4', 0),
(303, 0, 'config', 'config_affiliate_commission', '5', 0),
(302, 0, 'config', 'config_affiliate_auto', '0', 0),
(301, 0, 'config', 'config_affiliate_approval', '0', 0),
(300, 0, 'config', 'config_affiliate_group_id', '1', 0),
(299, 0, 'config', 'config_stock_checkout', '0', 0),
(298, 0, 'config', 'config_stock_warning', '0', 0),
(297, 0, 'config', 'config_stock_display', '0', 0),
(296, 0, 'config', 'config_api_id', '1', 0),
(295, 0, 'config', 'config_fraud_status_id', '7', 0),
(292, 0, 'config', 'config_order_status_id', '1', 0),
(293, 0, 'config', 'config_processing_status', '[\"5\",\"1\",\"2\",\"12\",\"3\"]', 1),
(294, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1),
(283, 0, 'config', 'config_customer_group_id', '1', 0),
(284, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(285, 0, 'config', 'config_customer_price', '0', 0),
(286, 0, 'config', 'config_login_attempts', '5', 0),
(287, 0, 'config', 'config_account_id', '3', 0),
(288, 0, 'config', 'config_invoice_prefix', 'INV-2019-00', 0),
(289, 0, 'config', 'config_cart_weight', '1', 0),
(290, 0, 'config', 'config_checkout_guest', '1', 0),
(291, 0, 'config', 'config_checkout_id', '5', 0),
(282, 0, 'config', 'config_customer_search', '0', 0),
(281, 0, 'config', 'config_customer_activity', '0', 0),
(261, 0, 'config', 'config_open', '', 0),
(260, 0, 'config', 'config_image', '', 0),
(259, 0, 'config', 'config_fax', '', 0),
(258, 0, 'config', 'config_telephone', '123456789', 0),
(257, 0, 'config', 'config_email', 'info@onelimitedbd.com', 0),
(256, 0, 'config', 'config_geocode', '', 0),
(255, 0, 'config', 'config_address', 'Gazipur', 0),
(254, 0, 'config', 'config_owner', 'One Limited', 0),
(253, 0, 'config', 'config_name', 'Hishab', 0),
(252, 0, 'config', 'config_layout_id', '4', 0),
(251, 0, 'config', 'config_theme', 'default', 0),
(250, 0, 'config', 'config_meta_keyword', '', 0),
(249, 0, 'config', 'config_meta_description', 'My Store', 0),
(248, 0, 'config', 'config_meta_title', 'Hishab', 0),
(95, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(96, 0, 'payment_free_checkout', 'free_checkout_order_status_id', '1', 0),
(97, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(98, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(99, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(100, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(101, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(102, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(103, 0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(104, 0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(105, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(106, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '9', 0),
(107, 0, 'shipping_flat', 'shipping_flat_cost', '5.00', 0),
(108, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(109, 0, 'total_sub_total', 'sub_total_sort_order', '1', 0),
(110, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(111, 0, 'total_tax', 'total_tax_status', '1', 0),
(112, 0, 'total_total', 'total_total_sort_order', '9', 0),
(113, 0, 'total_total', 'total_total_status', '1', 0),
(114, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(115, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(116, 0, 'total_credit', 'total_credit_status', '1', 0),
(117, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(118, 0, 'total_reward', 'total_reward_status', '1', 0),
(119, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(120, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(121, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(122, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(123, 0, 'module_category', 'module_category_status', '1', 0),
(124, 0, 'module_account', 'module_account_status', '1', 0),
(125, 0, 'theme_default', 'theme_default_product_limit', '15', 0),
(126, 0, 'theme_default', 'theme_default_product_description_length', '100', 0),
(127, 0, 'theme_default', 'theme_default_image_thumb_width', '228', 0),
(128, 0, 'theme_default', 'theme_default_image_thumb_height', '228', 0),
(129, 0, 'theme_default', 'theme_default_image_popup_width', '500', 0),
(130, 0, 'theme_default', 'theme_default_image_popup_height', '500', 0),
(131, 0, 'theme_default', 'theme_default_image_category_width', '80', 0),
(132, 0, 'theme_default', 'theme_default_image_category_height', '80', 0),
(133, 0, 'theme_default', 'theme_default_image_product_width', '228', 0),
(134, 0, 'theme_default', 'theme_default_image_product_height', '228', 0),
(135, 0, 'theme_default', 'theme_default_image_additional_width', '74', 0),
(136, 0, 'theme_default', 'theme_default_image_additional_height', '74', 0),
(137, 0, 'theme_default', 'theme_default_image_related_width', '200', 0),
(138, 0, 'theme_default', 'theme_default_image_related_height', '200', 0),
(139, 0, 'theme_default', 'theme_default_image_compare_width', '90', 0),
(140, 0, 'theme_default', 'theme_default_image_compare_height', '90', 0),
(141, 0, 'theme_default', 'theme_default_image_wishlist_width', '47', 0),
(142, 0, 'theme_default', 'theme_default_image_wishlist_height', '47', 0),
(143, 0, 'theme_default', 'theme_default_image_cart_height', '47', 0),
(144, 0, 'theme_default', 'theme_default_image_cart_width', '47', 0),
(145, 0, 'theme_default', 'theme_default_image_location_height', '50', 0),
(146, 0, 'theme_default', 'theme_default_image_location_width', '268', 0),
(147, 0, 'theme_default', 'theme_default_directory', 'default', 0),
(148, 0, 'theme_default', 'theme_default_status', '1', 0),
(151, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(152, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(155, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(156, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(159, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(160, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(161, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(162, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(163, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(164, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(165, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(166, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(169, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(170, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(172, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(173, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(174, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(175, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(176, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(177, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(178, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(179, 0, 'report_customer_search', 'report_customer_search_sort_order', '3', 0),
(180, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(181, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(182, 0, 'report_customer_transaction', 'report_customer_transaction_status_sort_order', '4', 0),
(183, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(184, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '5', 0),
(185, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(186, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '6', 0),
(187, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(188, 0, 'report_sale_return', 'report_sale_return_sort_order', '7', 0),
(189, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(190, 0, 'report_sale_order', 'report_sale_order_sort_order', '8', 0),
(191, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(192, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '9', 0),
(193, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(194, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '10', 0),
(195, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(196, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '11', 0),
(197, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(198, 0, 'report_marketing', 'report_marketing_sort_order', '12', 0),
(337, 0, 'developer', 'developer_sass', '1', 0),
(262, 0, 'config', 'config_comment', '', 0),
(263, 0, 'config', 'config_country_id', '222', 0),
(264, 0, 'config', 'config_zone_id', '3563', 0),
(265, 0, 'config', 'config_language', 'en-gb', 0),
(266, 0, 'config', 'config_admin_language', 'en-gb', 0),
(267, 0, 'config', 'config_currency', 'USD', 0),
(268, 0, 'config', 'config_currency_auto', '1', 0),
(269, 0, 'config', 'config_length_class_id', '1', 0),
(270, 0, 'config', 'config_weight_class_id', '1', 0),
(271, 0, 'config', 'config_product_count', '1', 0),
(272, 0, 'config', 'config_limit_admin', '20', 0),
(273, 0, 'config', 'config_review_status', '1', 0),
(274, 0, 'config', 'config_review_guest', '1', 0),
(275, 0, 'config', 'config_voucher_min', '1', 0),
(276, 0, 'config', 'config_voucher_max', '1000', 0),
(277, 0, 'config', 'config_tax', '1', 0),
(278, 0, 'config', 'config_tax_default', 'shipping', 0),
(279, 0, 'config', 'config_tax_customer', 'shipping', 0),
(280, 0, 'config', 'config_customer_online', '0', 0),
(336, 0, 'developer', 'developer_theme', '1', 0),
(212, 1, 'config', 'config_url', 'http://localhost:81/hishabone', 0),
(213, 1, 'config', 'config_ssl', '', 0),
(214, 1, 'config', 'config_meta_title', 'Hishab One', 0),
(215, 1, 'config', 'config_meta_description', '', 0),
(216, 1, 'config', 'config_meta_keyword', '', 0),
(217, 1, 'config', 'config_theme', 'default', 0),
(218, 1, 'config', 'config_layout_id', '4', 0),
(219, 1, 'config', 'config_name', 'Hishab One', 0),
(220, 1, 'config', 'config_owner', 'ONE', 0),
(221, 1, 'config', 'config_address', 'Joydebpur, Gazipur', 0),
(222, 1, 'config', 'config_geocode', '', 0),
(223, 1, 'config', 'config_email', 'hishab@gmail.com', 0),
(224, 1, 'config', 'config_telephone', '01913442973', 0),
(225, 1, 'config', 'config_fax', '', 0),
(226, 1, 'config', 'config_image', '', 0),
(227, 1, 'config', 'config_open', '', 0),
(228, 1, 'config', 'config_comment', '', 0),
(229, 1, 'config', 'config_country_id', '222', 0),
(230, 1, 'config', 'config_zone_id', '3563', 0),
(231, 1, 'config', 'config_language', 'en-gb', 0),
(232, 1, 'config', 'config_currency', 'USD', 0),
(233, 1, 'config', 'config_tax', '0', 0),
(234, 1, 'config', 'config_tax_default', '', 0),
(235, 1, 'config', 'config_tax_customer', '', 0),
(236, 1, 'config', 'config_customer_group_id', '1', 0),
(237, 1, 'config', 'config_customer_price', '0', 0),
(238, 1, 'config', 'config_account_id', '0', 0),
(239, 1, 'config', 'config_cart_weight', '0', 0),
(240, 1, 'config', 'config_checkout_guest', '0', 0),
(241, 1, 'config', 'config_checkout_id', '0', 0),
(242, 1, 'config', 'config_order_status_id', '7', 0),
(243, 1, 'config', 'config_stock_display', '0', 0),
(244, 1, 'config', 'config_stock_checkout', '0', 0),
(245, 1, 'config', 'config_logo', '', 0),
(246, 1, 'config', 'config_icon', '', 0),
(247, 1, 'config', 'config_secure', '0', 0),
(328, 0, 'config', 'config_file_max_size', '300000', 0),
(329, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(330, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf', 0),
(331, 0, 'config', 'config_error_display', '1', 0),
(332, 0, 'config', 'config_error_log', '1', 0),
(333, 0, 'config', 'config_error_filename', 'error.log', 0);

-- --------------------------------------------------------

--
-- Table structure for table `oc_store`
--

DROP TABLE IF EXISTS `oc_store`;
CREATE TABLE IF NOT EXISTS `oc_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_store`
--

INSERT INTO `oc_store` (`store_id`, `name`, `url`, `ssl`) VALUES
(1, 'Hishab One', 'http://localhost:81/hishabone', '');

-- --------------------------------------------------------

--
-- Table structure for table `oc_theme`
--

DROP TABLE IF EXISTS `oc_theme`;
CREATE TABLE IF NOT EXISTS `oc_theme` (
  `theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `theme` varchar(64) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`theme_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_translation`
--

DROP TABLE IF EXISTS `oc_translation`;
CREATE TABLE IF NOT EXISTS `oc_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`translation_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_upload`
--

DROP TABLE IF EXISTS `oc_upload`;
CREATE TABLE IF NOT EXISTS `oc_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `oc_user`
--

DROP TABLE IF EXISTS `oc_user`;
CREATE TABLE IF NOT EXISTS `oc_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `salt` varchar(9) DEFAULT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `ip` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user`
--

INSERT INTO `oc_user` (`id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'hishab', '57f7cf9504c7dd8f8d2f0ac3755d34f58c9a40c0', 'v14IHEMPu', 'Amiruzzaman', 'Munna Admin', 'munna.ak17@gmail.com', '', '', '::1', 1, '2019-05-24 18:00:00'),
(4, 4, 'hishabadmin', 'b1903e2ec8f640d363f12142216e7b94b8ebca97', 'mcD1iTaUx', 'Hishab', 'Admin', 'hishab@gmail.com', '', 'DdhEb7ho2zzAf8F08sCjjpJn1phZTNp2bPpsm3fN', '::1', 1, '2019-05-02 03:39:27'),
(2, 2, 'Munna', '$2y$10$W9KyKmi7yU6OKOw4qwAmceYi0UgqKlcm9iMKHn.hk6NEnrDVJGraa', '1', 'Amiruzzaman', 'Munna Admin', 'munna.ak17@gmail.com', '1558865013admin-1.jpg', 'sadf', '127.0.0.1', 1, '2019-04-30 11:30:28');

-- --------------------------------------------------------

--
-- Table structure for table `oc_user_group`
--

DROP TABLE IF EXISTS `oc_user_group`;
CREATE TABLE IF NOT EXISTS `oc_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(2, 'Administrator', '{\"access\":[\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"school\\/school\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"],\"modify\":[\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/dashboard\\/activity\",\"extension\\/dashboard\\/chart\",\"extension\\/dashboard\\/customer\",\"extension\\/dashboard\\/map\",\"extension\\/dashboard\\/online\",\"extension\\/dashboard\\/order\",\"extension\\/dashboard\\/recent\",\"extension\\/dashboard\\/sale\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\",\"extension\\/extension\\/feed\",\"extension\\/extension\\/fraud\",\"extension\\/extension\\/menu\",\"extension\\/extension\\/module\",\"extension\\/extension\\/payment\",\"extension\\/extension\\/report\",\"extension\\/extension\\/shipping\",\"extension\\/extension\\/theme\",\"extension\\/extension\\/total\",\"extension\\/report\\/customer_activity\",\"extension\\/report\\/customer_order\",\"extension\\/report\\/customer_reward\",\"extension\\/report\\/customer_search\",\"extension\\/report\\/customer_transaction\",\"extension\\/report\\/marketing\",\"extension\\/report\\/product_purchased\",\"extension\\/report\\/product_viewed\",\"extension\\/report\\/sale_coupon\",\"extension\\/report\\/sale_order\",\"extension\\/report\\/sale_return\",\"extension\\/report\\/sale_shipping\",\"extension\\/report\\/sale_tax\",\"extension\\/theme\\/default\",\"extension\\/total\\/coupon\",\"extension\\/total\\/credit\",\"extension\\/total\\/handling\",\"extension\\/total\\/klarna_fee\",\"extension\\/total\\/low_order_fee\",\"extension\\/total\\/reward\",\"extension\\/total\\/shipping\",\"extension\\/total\\/sub_total\",\"extension\\/total\\/tax\",\"extension\\/total\\/total\",\"extension\\/total\\/voucher\",\"mail\\/affiliate\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/return\",\"mail\\/reward\",\"mail\\/transaction\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/install\",\"marketplace\\/installer\",\"marketplace\\/modification\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"school\\/school\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/error\",\"startup\\/event\",\"startup\\/login\",\"startup\\/permission\",\"startup\\/router\",\"startup\\/sass\",\"startup\\/startup\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/upload\",\"user\\/api\",\"user\\/user\",\"user\\/user_permission\"]}'),
(4, 'Demonstration', ''),
(1, 'hishabadmin', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/filter\",\"catalog\\/manufacturer\",\"catalog\\/product\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/filter\",\"catalog\\/manufacturer\",\"catalog\\/product\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/profile\",\"common\\/security\",\"event\\/language\",\"event\\/statistics\",\"event\\/theme\",\"extension\\/captcha\\/basic\",\"extension\\/captcha\\/google\",\"extension\\/extension\\/advertise\",\"extension\\/extension\\/analytics\",\"extension\\/extension\\/captcha\",\"extension\\/extension\\/dashboard\"]}');

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_permission_access`
-- (See below for the actual view)
--
DROP VIEW IF EXISTS `view_permission_access`;
CREATE TABLE IF NOT EXISTS `view_permission_access` (
`id` int(11)
,`user_group_id` int(11)
,`user_id` int(11)
,`feature_id` int(11)
,`featurename` varchar(100)
,`status` tinyint(1)
);

-- --------------------------------------------------------

--
-- Structure for view `view_permission_access`
--
DROP TABLE IF EXISTS `view_permission_access`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_permission_access`  AS  select `oc_permission`.`id` AS `id`,`oc_permission`.`user_group_id` AS `user_group_id`,`oc_permission`.`user_id` AS `user_id`,`oc_permission`.`feature_id` AS `feature_id`,`oc_feature`.`featurename` AS `featurename`,`oc_permission`.`status` AS `status` from (`oc_permission` left join `oc_feature` on((`oc_permission`.`feature_id` = `oc_feature`.`id`))) ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
