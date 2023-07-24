-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 24, 2023 at 08:40 AM
-- Server version: 8.0.33-0ubuntu0.22.04.2
-- PHP Version: 8.1.2-1ubuntu2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cart`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user`
--

CREATE TABLE `accounts_user` (
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `id` bigint NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `phone` varchar(10) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `address` varchar(200) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `position` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `accounts_user`
--

INSERT INTO `accounts_user` (`last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `id`, `name`, `password`, `email`, `phone`, `address`, `position`) VALUES
('2023-02-22 08:01:01.000000', 1, 'ad', '', '', 1, 1, '2023-01-30 06:26:16.000000', 2, 'ad', 'pbkdf2_sha256$390000$k1pVHsjL0DDto6yd6ToIrh$646A1VhXJCZFqg7T2aiqc60T12ksCvRnsEGuzJOOL54=', 'ad@gmail.com', '088292876', 'Ha Noi', 'customer'),
('2023-05-19 00:11:29.992278', 1, 'an', '', '', 1, 1, '2023-02-03 09:18:31.000000', 3, 'an', 'pbkdf2_sha256$390000$SdeGj8VZiLdI2HyrTI7vcI$/ZI5kCup+EoDxgLRVKfx+h8cg0nTqWwEBmhbPgbdd4E=', 'an@gmail.com', '0123456789', 'pl', 'seller'),
('2023-04-12 05:15:38.918282', 0, 'phong', '', '', 0, 1, '2023-02-28 03:26:58.000000', 4, 'phong', 'pbkdf2_sha256$390000$oSuWsfBM88L2a9K2E5KdTu$/+x+0KHw7EYR77GJNlE3plfBSmvJ3RsheEX5vLJwVLI=', 'phong@gmail.com', '0987654123', 'Da Nang', 'customer'),
('2023-04-14 09:48:18.308430', 0, 'phutran', '', '', 0, 1, '2023-04-11 04:06:05.383914', 5, 'Phu Tran', 'pbkdf2_sha256$390000$QTOhheCFgM5uM3m1nkqNhr$5GpSlyOvikixeD4PHl8ttTgxFT3e2iZSFKh/4s2QptQ=', 'phutran@gmail.com', '0147258369', 'Hue', 'customer'),
(NULL, 0, 'binhle', '', '', 0, 1, '2023-05-18 03:59:07.407825', 6, 'Bình', 'pbkdf2_sha256$390000$MOoJZZvnNo0hekwbrVI9TP$SMIIeLCeGjJxbjIyxU2t0UOpawAO76+toFvovhMp/4g=', '', '', '', 'customer'),
('2023-05-18 17:15:03.816195', 1, 'admin', '', '', 1, 1, '2023-05-18 16:21:35.621377', 7, '', 'pbkdf2_sha256$390000$aXbWtBQp042wzzbzkUM9Ij$fM0tFKIzkgenfi9uE7jSRGVVQuio0/M0Xxl/1s2XKpQ=', 'admin@gmail.com', NULL, NULL, ''),
('2023-05-18 17:28:21.229650', 0, 'bro', '', '', 0, 1, '2023-05-18 17:28:12.525546', 8, 'bro', 'pbkdf2_sha256$390000$jiarj6UaplSHEWEU8v9RX7$xB6VPP7qwody7TDE7UYcl1gWK9m+DZUj9o46kzHvOek=', 'bro@bro', '0964253123', 'bro house', 'customer');

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_groups`
--

CREATE TABLE `accounts_user_groups` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `accounts_user_user_permissions`
--

CREATE TABLE `accounts_user_user_permissions` (
  `id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int NOT NULL,
  `name` varchar(150) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add producer', 6, 'add_producer'),
(22, 'Can change producer', 6, 'change_producer'),
(23, 'Can delete producer', 6, 'delete_producer'),
(24, 'Can view producer', 6, 'view_producer'),
(25, 'Can add product', 7, 'add_product'),
(26, 'Can change product', 7, 'change_product'),
(27, 'Can delete product', 7, 'delete_product'),
(28, 'Can view product', 7, 'view_product'),
(29, 'Can add user', 8, 'add_user'),
(30, 'Can change user', 8, 'change_user'),
(31, 'Can delete user', 8, 'delete_user'),
(32, 'Can view user', 8, 'view_user'),
(33, 'Can add cart', 9, 'add_cart'),
(34, 'Can change cart', 9, 'change_cart'),
(35, 'Can delete cart', 9, 'delete_cart'),
(36, 'Can view cart', 9, 'view_cart'),
(37, 'Can add history', 10, 'add_history'),
(38, 'Can change history', 10, 'change_history'),
(39, 'Can delete history', 10, 'delete_history'),
(40, 'Can view history', 10, 'view_history'),
(41, 'Can add order', 10, 'add_order'),
(42, 'Can change order', 10, 'change_order'),
(43, 'Can delete order', 10, 'delete_order'),
(44, 'Can view order', 10, 'view_order'),
(45, 'Can add order detail', 11, 'add_orderdetail'),
(46, 'Can change order detail', 11, 'change_orderdetail'),
(47, 'Can delete order detail', 11, 'delete_orderdetail'),
(48, 'Can view order detail', 11, 'view_orderdetail'),
(49, 'Can add category', 6, 'add_category'),
(50, 'Can change category', 6, 'change_category'),
(51, 'Can delete category', 6, 'delete_category'),
(52, 'Can view category', 6, 'view_category'),
(53, 'Can add customer', 12, 'add_customer'),
(54, 'Can change customer', 12, 'change_customer'),
(55, 'Can delete customer', 12, 'delete_customer'),
(56, 'Can view customer', 12, 'view_customer'),
(57, 'Can add comment', 13, 'add_comment'),
(58, 'Can change comment', 13, 'change_comment'),
(59, 'Can delete comment', 13, 'delete_comment'),
(60, 'Can view comment', 13, 'view_comment'),
(61, 'Can add like', 14, 'add_like'),
(62, 'Can change like', 14, 'change_like'),
(63, 'Can delete like', 14, 'delete_like'),
(64, 'Can view like', 14, 'view_like');

-- --------------------------------------------------------

--
-- Table structure for table `cart_cart`
--

CREATE TABLE `cart_cart` (
  `id` bigint NOT NULL,
  `number` int NOT NULL,
  `product_id_id` bigint NOT NULL,
  `user_id_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `cart_cart`
--

INSERT INTO `cart_cart` (`id`, `number`, `product_id_id`, `user_id_id`) VALUES
(142, 3, 62, 3),
(143, 3, 59, 3),
(150, 1, 86, 7),
(151, 1, 61, 7),
(153, 17, 69, 3);

-- --------------------------------------------------------

--
-- Table structure for table `cart_order`
--

CREATE TABLE `cart_order` (
  `id` bigint NOT NULL,
  `address` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `phone` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `receiver` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_id` int NOT NULL,
  `date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `cart_order`
--

INSERT INTO `cart_order` (`id`, `address`, `phone`, `receiver`, `user_id`, `date`) VALUES
(44, '12 Le Loi Giang Nam TQ', '0984756298', 'Le Thi Cam Ly', 3, '2023-05-18 15:15:45.101946'),
(45, 'Phu Tho', '0123456789', 'Le Phong', 3, '2023-05-18 15:19:05.199399'),
(46, 'Tran Duy Tan, Lang Son', '057385923', 'Nguyen Minh', 3, '2023-05-18 15:26:52.496131'),
(47, 'Can Tho', '0123456789', 'Le Minh Choke', 7, '2023-05-18 16:55:17.982105'),
(48, 'Ha Noi', '0123456789', 'Chien Than', 7, '2023-05-18 16:55:39.566914'),
(49, 'Can Tho', '0147258369', 'Phong', 3, '2023-05-18 16:56:14.742990'),
(50, 'Can Tho', '1234567890', 'Chien Than', 3, '2023-05-18 18:09:47.790083');

-- --------------------------------------------------------

--
-- Table structure for table `cart_orderdetail`
--

CREATE TABLE `cart_orderdetail` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `image` varchar(10000) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `number` int NOT NULL,
  `price` int NOT NULL,
  `order_id_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `cart_orderdetail`
--

INSERT INTO `cart_orderdetail` (`id`, `name`, `image`, `number`, `price`, `order_id_id`) VALUES
(107, 'Áo Crotop Tay Bồng', 'product_img/Áo_Crotop_Tay_Bồng.jpg', 1, 59, 44),
(108, 'Áo Crotop Tay Bồng', 'product_img/Áo_Crotop_Tay_Bồng.jpg', 2, 59, 45),
(109, 'Áo phông Nam Cotton', 'product_img/Áo_phông_Nam_cotton.jpg', 2, 60, 45),
(110, 'Áo lông cừu cho bé', 'product_img/Áo_lông_cừu_cho_bé.jpg', 1, 39, 46),
(111, 'Áo lông cừu cho bé', 'product_img/Áo_lông_cừu_cho_bé.jpg', 2, 39, 47),
(112, 'Áo phông Nam Cotton', 'product_img/Áo_phông_Nam_cotton.jpg', 4, 60, 47),
(113, 'Bộ 2 Nhẫn 925 Bằng Kim Loại', 'product_img/Bộ_2_Nhẫn_925_Bằng_Kim_Loại.jpg', 1, 20, 48),
(114, 'Bộ 2 Nhẫn 925 Bằng Kim Loại', 'product_img/Bộ_2_Nhẫn_925_Bằng_Kim_Loại.jpg', 2, 20, 49),
(115, 'Giày adidas GOLF Nam GV9674', 'product_img/Giày_adidas_GOLF_Nam_GV9674.jpg', 2, 289, 49),
(116, 'Áo Crotop Tay Bồng', 'product_img/Áo_Crotop_Tay_Bồng.jpg', 1, 59, 50);

-- --------------------------------------------------------

--
-- Table structure for table `comments_comment`
--

CREATE TABLE `comments_comment` (
  `id` int NOT NULL,
  `content` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `path` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `date_posting` date NOT NULL,
  `product_id_id` bigint NOT NULL,
  `user_id_id` bigint NOT NULL,
  `path_length` int NOT NULL,
  `count_like` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `comments_comment`
--

INSERT INTO `comments_comment` (`id`, `content`, `path`, `date_posting`, `product_id_id`, `user_id_id`, `path_length`, `count_like`) VALUES
(266, 'This is a woderful thing i ever have bought', '0001', '2023-05-18', 60, 3, 0, 1),
(267, 'beautiful', '0001.0001', '2023-05-18', 60, 3, 1, 1),
(269, 'Ship hàng bị hư hại a', '0002', '2023-05-18', 60, 3, 0, 1),
(270, 'Tuyệt vời ông mặt trời', '0003', '2023-05-18', 60, 3, 0, 1),
(271, 'em xin lỗi, để em hoàn tiền', '0002.0001', '2023-05-18', 60, 7, 1, 1),
(272, 'a', '0001', '2023-05-19', 62, 3, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments_like`
--

CREATE TABLE `comments_like` (
  `id` int NOT NULL,
  `comment_id_id` int NOT NULL,
  `user_id_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `comments_like`
--

INSERT INTO `comments_like` (`id`, `comment_id_id`, `user_id_id`) VALUES
(32, 266, 3),
(33, 267, 3),
(38, 270, 3),
(39, 269, 7),
(40, 271, 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_vietnamese_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL
) ;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(5, '2023-02-01 07:44:21.483348', '1', 'Cart object (1)', 3, '', 9, 2),
(6, '2023-02-03 09:20:16.154046', '3', 'an', 2, '[{\"changed\": {\"fields\": [\"Superuser status\", \"Staff status\"]}}]', 8, 2),
(7, '2023-02-04 09:08:43.170829', '4', 'Product object (4)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(8, '2023-02-04 09:10:32.643213', '4', 'Product object (4)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(9, '2023-02-06 07:06:17.178489', '5', 'Product object (5)', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(10, '2023-02-06 07:55:32.720783', '12', '13412', 3, '', 7, 3),
(11, '2023-02-06 07:55:32.792354', '11', 'gưaeg', 3, '', 7, 3),
(12, '2023-02-06 07:55:32.848872', '10', '2536', 3, '', 7, 3),
(13, '2023-02-06 07:55:32.916277', '9', '124', 3, '', 7, 3),
(14, '2023-02-06 07:55:33.041277', '8', '12123', 3, '', 7, 3),
(15, '2023-02-06 07:55:33.121325', '7', '3412', 3, '', 7, 3),
(16, '2023-02-06 07:55:48.455934', '13', '12', 1, '[{\"added\": {}}]', 7, 3),
(17, '2023-02-06 08:11:45.100317', '14', '1', 1, '[{\"added\": {}}]', 7, 3),
(18, '2023-02-06 09:58:12.855705', '2', 'ad', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Phone\", \"Address\"]}}]', 8, 2),
(19, '2023-02-06 09:58:27.218181', '1', 'admin', 3, '', 8, 2),
(20, '2023-02-13 07:37:49.636215', '8', 'ád', 3, '', 10, 3),
(21, '2023-02-13 07:37:49.681387', '7', 'io', 3, '', 10, 3),
(22, '2023-02-13 07:37:49.749022', '6', 'Le Pi', 3, '', 10, 3),
(23, '2023-02-13 07:37:49.838745', '5', 'Le Pi', 3, '', 10, 3),
(24, '2023-02-13 07:37:49.906765', '4', 'An', 3, '', 10, 3),
(25, '2023-02-13 07:37:49.974697', '3', 'An', 3, '', 10, 3),
(26, '2023-02-13 07:37:50.100582', '2', 'An', 3, '', 10, 3),
(27, '2023-02-13 07:37:50.204316', '1', 'an', 3, '', 10, 3),
(28, '2023-02-13 07:46:26.044266', '23', 'gum', 3, '', 11, 3),
(29, '2023-02-13 07:46:26.186949', '22', '2', 3, '', 11, 3),
(30, '2023-02-13 07:46:26.333271', '21', 'Tie', 3, '', 11, 3),
(31, '2023-02-13 07:46:26.466849', '20', 'gum', 3, '', 11, 3),
(32, '2023-02-13 07:46:26.600577', '19', '2', 3, '', 11, 3),
(33, '2023-02-13 07:46:26.800936', '18', 'gum', 3, '', 11, 3),
(34, '2023-02-13 07:46:26.956633', '17', '2', 3, '', 11, 3),
(35, '2023-02-13 07:46:27.146346', '16', 'gum', 3, '', 11, 3),
(36, '2023-02-13 07:46:27.647827', '15', '2', 3, '', 11, 3),
(37, '2023-02-13 07:46:27.906205', '23', 'gum', 3, '', 11, 3),
(38, '2023-02-13 07:46:28.082258', '14', 'gum', 3, '', 11, 3),
(39, '2023-02-13 07:46:28.271657', '22', '2', 3, '', 11, 3),
(40, '2023-02-13 07:46:28.368618', '13', '2', 3, '', 11, 3),
(41, '2023-02-13 07:46:28.703551', '21', 'Tie', 3, '', 11, 3),
(42, '2023-02-13 07:46:28.895150', '12', 'Tie', 3, '', 11, 3),
(43, '2023-02-13 07:46:29.005759', '20', 'gum', 3, '', 11, 3),
(44, '2023-02-13 07:46:29.095008', '11', 'Shoes', 3, '', 11, 3),
(45, '2023-02-13 07:46:29.162274', '19', '2', 3, '', 11, 3),
(46, '2023-02-13 07:46:29.295784', '10', 'Tie', 3, '', 11, 3),
(47, '2023-02-13 07:46:29.362233', '18', 'gum', 3, '', 11, 3),
(48, '2023-02-13 07:46:29.495861', '9', 'Shoes', 3, '', 11, 3),
(49, '2023-02-13 07:46:29.630193', '17', '2', 3, '', 11, 3),
(50, '2023-02-13 07:46:29.728347', '8', 'Tie', 3, '', 11, 3),
(51, '2023-02-13 07:46:29.830651', '16', 'gum', 3, '', 11, 3),
(52, '2023-02-13 07:46:29.928908', '7', 'Shoes', 3, '', 11, 3),
(53, '2023-02-13 07:46:30.129600', '15', '2', 3, '', 11, 3),
(54, '2023-02-13 07:46:30.240889', '6', 'gum', 3, '', 11, 3),
(55, '2023-02-13 07:46:30.387442', '14', 'gum', 3, '', 11, 3),
(56, '2023-02-13 07:46:30.453984', '5', '2', 3, '', 11, 3),
(57, '2023-02-13 07:46:30.632383', '13', '2', 3, '', 11, 3),
(58, '2023-02-13 07:46:30.721285', '4', 'gum', 3, '', 11, 3),
(59, '2023-02-13 07:46:30.844036', '12', 'Tie', 3, '', 11, 3),
(60, '2023-02-13 07:46:30.934274', '3', '2', 3, '', 11, 3),
(61, '2023-02-13 07:46:31.112762', '11', 'Shoes', 3, '', 11, 3),
(62, '2023-02-13 07:46:31.145602', '2', '2', 3, '', 11, 3),
(63, '2023-02-13 07:46:31.257040', '10', 'Tie', 3, '', 11, 3),
(64, '2023-02-13 07:46:31.346262', '1', '2', 3, '', 11, 3),
(65, '2023-02-13 07:46:31.457997', '9', 'Shoes', 3, '', 11, 3),
(66, '2023-02-13 07:46:31.658419', '8', 'Tie', 3, '', 11, 3),
(67, '2023-02-13 07:46:31.859121', '7', 'Shoes', 3, '', 11, 3),
(68, '2023-02-13 07:46:32.014503', '6', 'gum', 3, '', 11, 3),
(69, '2023-02-13 07:46:32.192958', '5', '2', 3, '', 11, 3),
(70, '2023-02-13 07:46:32.393298', '4', 'gum', 3, '', 11, 3),
(71, '2023-02-13 07:46:32.561722', '3', '2', 3, '', 11, 3),
(72, '2023-02-13 07:46:32.961449', '2', '2', 3, '', 11, 3),
(73, '2023-02-13 07:46:33.218029', '1', '2', 3, '', 11, 3),
(74, '2023-02-13 07:46:41.153792', '11', 'Le Pi', 3, '', 10, 3),
(75, '2023-02-13 07:46:41.428041', '10', 'Le Pi', 3, '', 10, 3),
(76, '2023-02-13 07:46:41.839705', '9', 'Le Pi', 3, '', 10, 3),
(77, '2023-02-13 08:01:17.105736', '14', 'Le Pi', 3, '', 10, 3),
(78, '2023-02-13 08:01:17.240232', '13', 'An', 3, '', 10, 3),
(79, '2023-02-13 08:01:17.404575', '12', 'An', 3, '', 10, 3),
(80, '2023-02-13 08:15:19.882218', '79', 'gum', 3, '', 11, 3),
(81, '2023-02-13 08:15:20.060713', '78', '2', 3, '', 11, 3),
(82, '2023-02-14 02:00:46.555144', '18', 'an', 3, '', 10, 3),
(83, '2023-02-14 02:00:46.673275', '17', 'An', 3, '', 10, 3),
(84, '2023-02-14 02:00:46.740668', '16', 'Le Pi', 3, '', 10, 3),
(85, '2023-02-14 02:00:46.785786', '15', 'Le Pi', 3, '', 10, 3),
(86, '2023-02-17 07:14:50.478860', '25', 'iiii', 3, '', 10, 3),
(87, '2023-02-17 07:14:50.584788', '24', 'iiii', 3, '', 10, 3),
(88, '2023-02-17 07:14:50.652462', '23', 'aaa', 3, '', 10, 3),
(89, '2023-02-17 07:20:07.303222', '29', 'An', 3, '', 10, 3),
(90, '2023-02-17 07:20:07.372789', '28', 'An', 3, '', 10, 3),
(91, '2023-02-17 07:20:07.417698', '27', 'An', 3, '', 10, 3),
(92, '2023-02-17 07:20:07.474097', '26', 'An', 3, '', 10, 3),
(93, '2023-02-24 07:08:24.662685', '1', 'Shoes', 1, '[{\"added\": {}}]', 6, 3),
(94, '2023-02-24 07:08:31.671338', '2', 'Phone', 1, '[{\"added\": {}}]', 6, 3),
(95, '2023-02-24 07:09:02.223355', '3', 'Laptop', 1, '[{\"added\": {}}]', 6, 3),
(96, '2023-02-24 07:09:12.577443', '4', 'Pet', 1, '[{\"added\": {}}]', 6, 3),
(97, '2023-02-24 07:27:52.409013', '22', '563423', 3, '', 7, 3),
(98, '2023-02-24 07:27:52.470798', '21', 'dvwv', 3, '', 7, 3),
(99, '2023-02-24 07:27:52.527231', '20', 'Shi Zi Oh', 3, '', 7, 3),
(100, '2023-02-24 07:27:52.674936', '19', 'Foza', 3, '', 7, 3),
(101, '2023-02-24 07:27:52.742584', '15', 'FloKa', 3, '', 7, 3),
(102, '2023-02-24 07:27:52.787758', '4', 'Top', 3, '', 7, 3),
(103, '2023-02-24 07:27:52.844275', '3', 'Phao', 3, '', 7, 3),
(104, '2023-02-24 07:27:52.911706', '1', 'Zao', 3, '', 7, 3),
(105, '2023-02-24 08:10:21.920445', '23', 'Giày thể thao', 1, '[{\"added\": {}}]', 7, 3),
(106, '2023-02-24 08:14:07.476583', '24', 'Pháo hoa', 1, '[{\"added\": {}}]', 7, 3),
(107, '2023-02-24 08:14:17.570444', '5', 'other', 1, '[{\"added\": {}}]', 6, 3),
(108, '2023-02-24 08:14:30.747414', '4', 'pet', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 6, 3),
(109, '2023-02-24 08:14:36.691050', '3', 'laptop', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 6, 3),
(110, '2023-02-24 08:14:41.953803', '2', 'phone', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 6, 3),
(111, '2023-02-24 08:14:46.725292', '1', 'shoes', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 6, 3),
(112, '2023-02-24 08:14:59.925844', '24', 'Pháo hoa', 2, '[{\"changed\": {\"fields\": [\"Category id\"]}}]', 7, 3),
(113, '2023-02-24 08:16:18.177105', '25', 'Bread', 1, '[{\"added\": {}}]', 7, 3),
(114, '2023-02-24 08:16:27.857449', '6', 'food', 1, '[{\"added\": {}}]', 6, 3),
(115, '2023-02-24 08:16:38.604630', '25', 'Bread', 2, '[{\"changed\": {\"fields\": [\"Category id\"]}}]', 7, 3),
(116, '2023-02-24 09:18:23.107443', '1', 'sports', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 6, 3),
(117, '2023-02-24 09:18:28.627442', '1', 'sport', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 6, 3),
(118, '2023-02-27 07:05:04.245099', '26', 'Bánh bao', 1, '[{\"added\": {}}]', 7, 3),
(119, '2023-02-27 07:06:22.434500', '27', 'Fruits candy', 1, '[{\"added\": {}}]', 7, 3),
(120, '2023-02-27 07:24:53.137371', '28', 'Pin', 1, '[{\"added\": {}}]', 7, 3),
(121, '2023-02-27 07:25:40.877557', '29', 'Ipone5', 1, '[{\"added\": {}}]', 7, 3),
(122, '2023-02-27 09:24:25.362921', '30', 'Chocolate Cake', 1, '[{\"added\": {}}]', 7, 3),
(123, '2023-02-28 01:31:22.047917', '31', 'Pháo hoa', 1, '[{\"added\": {}}]', 7, 3),
(124, '2023-02-28 01:32:08.675990', '32', 'Mì cay', 1, '[{\"added\": {}}]', 7, 3),
(125, '2023-02-28 01:32:43.702663', '32', 'Mì cay', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(126, '2023-02-28 01:32:51.272842', '31', 'Pháo hoa', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(127, '2023-02-28 01:33:34.200356', '33', 'Bún chả cá', 1, '[{\"added\": {}}]', 7, 3),
(128, '2023-02-28 01:34:18.147069', '34', 'Pin', 1, '[{\"added\": {}}]', 7, 3),
(129, '2023-02-28 01:35:23.630399', '35', 'Husky', 1, '[{\"added\": {}}]', 7, 3),
(130, '2023-02-28 01:36:10.066859', '36', 'Bread', 1, '[{\"added\": {}}]', 7, 3),
(131, '2023-02-28 01:36:51.176681', '37', 'Shoes', 1, '[{\"added\": {}}]', 7, 3),
(132, '2023-02-28 01:38:33.650634', '38', 'Egg', 1, '[{\"added\": {}}]', 7, 3),
(133, '2023-02-28 01:39:21.082193', '39', 'Lemon', 1, '[{\"added\": {}}]', 7, 3),
(134, '2023-02-28 01:40:17.544490', '40', 'Ipone5', 1, '[{\"added\": {}}]', 7, 3),
(135, '2023-02-28 03:08:43.528295', '3', 'an', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 8, 3),
(136, '2023-02-28 03:09:02.462002', '2', 'ad', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 8, 3),
(137, '2023-02-28 03:27:27.198331', '4', 'phong', 2, '[{\"changed\": {\"fields\": [\"Position\"]}}]', 8, 3),
(138, '2023-03-10 07:37:23.987821', '1', 'Comment object (1)', 1, '[{\"added\": {}}]', 13, 3),
(139, '2023-03-10 07:38:16.208668', '2', 'Comment object (2)', 1, '[{\"added\": {}}]', 13, 3),
(140, '2023-03-10 09:10:39.931848', '1', 'Comment object (1)', 2, '[]', 13, 3),
(141, '2023-03-10 09:10:45.220201', '1', 'Comment object (1)', 2, '[]', 13, 3),
(142, '2023-03-10 09:21:58.895298', '9', 'Comment object (9)', 3, '', 13, 3),
(143, '2023-03-10 09:21:59.062130', '8', 'Comment object (8)', 3, '', 13, 3),
(144, '2023-03-10 09:21:59.107299', '7', 'Comment object (7)', 3, '', 13, 3),
(145, '2023-03-10 09:21:59.163526', '6', 'Comment object (6)', 3, '', 13, 3),
(146, '2023-03-10 09:21:59.220139', '5', 'Comment object (5)', 3, '', 13, 3),
(147, '2023-03-10 09:21:59.287227', '4', 'Comment object (4)', 3, '', 13, 3),
(148, '2023-03-10 09:21:59.332289', '3', 'Comment object (3)', 3, '', 13, 3),
(149, '2023-03-13 01:32:24.231019', '2', 'Comment object (2)', 2, '[]', 13, 3),
(150, '2023-03-13 01:32:27.862082', '1', 'Comment object (1)', 2, '[]', 13, 3),
(151, '2023-03-13 02:35:35.285422', '8', 'Comment object (8)', 3, '', 13, 3),
(152, '2023-03-13 02:35:35.360802', '7', 'Comment object (7)', 3, '', 13, 3),
(153, '2023-03-13 02:35:35.405914', '6', 'Comment object (6)', 3, '', 13, 3),
(154, '2023-03-13 02:35:35.451088', '5', 'Comment object (5)', 3, '', 13, 3),
(155, '2023-03-13 02:35:35.518965', '4', 'Comment object (4)', 3, '', 13, 3),
(156, '2023-03-13 08:16:23.944084', '1', 'Like object (1)', 1, '[{\"added\": {}}]', 14, 3),
(157, '2023-03-15 06:25:41.723701', '2', 'Like object (2)', 1, '[{\"added\": {}}]', 14, 3),
(158, '2023-03-15 06:25:59.497679', '3', 'Like object (3)', 1, '[{\"added\": {}}]', 14, 3),
(159, '2023-03-20 02:49:55.514372', '12', '0004.0001', 1, '[{\"added\": {}}]', 13, 3),
(160, '2023-04-03 08:29:06.598649', '7', 'snacks', 1, '[{\"added\": {}}]', 6, 3),
(161, '2023-04-03 08:29:30.654156', '8', 'drinks', 1, '[{\"added\": {}}]', 6, 3),
(162, '2023-04-07 16:25:21.548424', '9', 'no', 1, '[{\"added\": {}}]', 6, 3),
(163, '2023-04-07 16:25:42.283686', '9', 'no', 3, '', 6, 3),
(164, '2023-04-07 17:07:38.368858', '8', 'drinks', 3, '', 6, 3),
(165, '2023-04-07 17:07:38.416322', '7', 'snacks', 3, '', 6, 3),
(166, '2023-04-07 17:10:39.732985', '10', 'snacks', 1, '[{\"added\": {}}]', 6, 3),
(167, '2023-04-07 17:10:49.200956', '11', 'drinks', 1, '[{\"added\": {}}]', 6, 3),
(168, '2023-04-08 04:34:05.741850', '33', 'Eel soup', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 7, 3),
(169, '2023-04-10 03:33:02.471577', '12', 'Coca', 1, '[{\"added\": {}}]', 6, 3),
(170, '2023-04-10 03:33:22.959055', '13', 'Water lavi', 1, '[{\"added\": {}}]', 6, 3),
(171, '2023-04-10 03:39:30.757433', '14', 'cat', 1, '[{\"added\": {}}]', 6, 3),
(172, '2023-04-10 03:39:42.120597', '15', 'dog', 1, '[{\"added\": {}}]', 6, 3),
(173, '2023-04-10 06:53:14.026281', '41', 'Cat', 1, '[{\"added\": {}}]', 7, 3),
(174, '2023-04-12 01:46:37.879796', '16', 'Producer', 1, '[{\"added\": {}}]', 6, 3),
(175, '2023-04-12 01:47:24.400685', '17', 'ASUS', 1, '[{\"added\": {}}]', 6, 3),
(176, '2023-04-12 01:47:33.297585', '18', 'HP', 1, '[{\"added\": {}}]', 6, 3),
(177, '2023-04-12 01:47:42.177373', '19', 'DELL', 1, '[{\"added\": {}}]', 6, 3),
(178, '2023-04-12 01:48:11.819266', '20', 'oshi', 1, '[{\"added\": {}}]', 6, 3),
(179, '2023-04-12 01:51:26.819259', '41', 'Cat', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 3),
(180, '2023-04-12 01:55:08.004699', '42', 'Coca', 1, '[{\"added\": {}}]', 7, 3),
(181, '2023-04-12 05:13:04.463157', '21', 'bird', 1, '[{\"added\": {}}]', 6, 3),
(182, '2023-04-14 07:30:28.849884', '117', 'Cart object (117)', 2, '[{\"changed\": {\"fields\": [\"Number\"]}}]', 9, 3),
(183, '2023-04-14 07:49:28.318123', '117', 'Cart object (117)', 2, '[{\"changed\": {\"fields\": [\"Number\"]}}]', 9, 3),
(184, '2023-05-15 10:34:10.482384', '39', 'an', 3, '', 10, 3),
(185, '2023-05-15 10:35:39.428009', '40', 'an', 3, '', 10, 3),
(186, '2023-05-18 08:50:52.594667', '41', 'Chien Than', 3, '', 10, 3),
(187, '2023-05-18 09:01:05.650852', '38', 'An', 3, '', 10, 3),
(188, '2023-05-18 13:57:18.969630', '1', 'sport', 3, '', 6, 3),
(189, '2023-05-18 13:57:19.015746', '2', 'phone', 3, '', 6, 3),
(190, '2023-05-18 13:57:19.072241', '3', 'laptop', 3, '', 6, 3),
(191, '2023-05-18 13:57:19.117436', '16', 'Producer', 3, '', 6, 3),
(192, '2023-05-18 13:57:19.185096', '17', 'ASUS', 3, '', 6, 3),
(193, '2023-05-18 13:57:19.230607', '19', 'DELL', 3, '', 6, 3),
(194, '2023-05-18 13:57:19.298012', '18', 'HP', 3, '', 6, 3),
(195, '2023-05-18 13:57:19.465766', '4', 'pet', 3, '', 6, 3),
(196, '2023-05-18 13:57:19.510804', '21', 'bird', 3, '', 6, 3),
(197, '2023-05-18 13:57:19.567776', '14', 'cat', 3, '', 6, 3),
(198, '2023-05-18 13:57:19.704605', '15', 'dog', 3, '', 6, 3),
(199, '2023-05-18 13:57:19.796902', '5', 'other', 3, '', 6, 3),
(200, '2023-05-18 13:57:19.842262', '6', 'food', 3, '', 6, 3),
(201, '2023-05-18 13:57:19.909880', '11', 'drinks', 3, '', 6, 3),
(202, '2023-05-18 13:57:19.966306', '12', 'coca', 3, '', 6, 3),
(203, '2023-05-18 13:57:20.034018', '13', 'water lavi', 3, '', 6, 3),
(204, '2023-05-18 13:57:20.079213', '10', 'snacks', 3, '', 6, 3),
(205, '2023-05-18 13:57:20.135587', '20', 'oshi', 3, '', 6, 3),
(206, '2023-05-18 13:57:43.440009', '43', 'Noddle', 3, '', 7, 3),
(207, '2023-05-18 13:57:43.487308', '42', 'Coca', 3, '', 7, 3),
(208, '2023-05-18 13:57:43.555477', '41', 'Cat', 3, '', 7, 3),
(209, '2023-05-18 13:57:43.679992', '40', 'Ipone5', 3, '', 7, 3),
(210, '2023-05-18 13:57:43.725166', '39', 'Lemon', 3, '', 7, 3),
(211, '2023-05-18 13:57:43.793039', '38', 'Egg', 3, '', 7, 3),
(212, '2023-05-18 13:57:43.860813', '37', 'Shoes', 3, '', 7, 3),
(213, '2023-05-18 13:57:43.905831', '36', 'Bread', 3, '', 7, 3),
(214, '2023-05-18 13:57:44.042848', '35', 'Husky', 3, '', 7, 3),
(215, '2023-05-18 13:57:44.087913', '33', 'Eel soup', 3, '', 7, 3),
(216, '2023-05-18 13:57:44.144645', '32', 'Mì cay', 3, '', 7, 3),
(217, '2023-05-18 13:57:44.189699', '31', 'Pháo hoa', 3, '', 7, 3),
(218, '2023-05-18 13:57:52.612513', '1', 'sport', 3, '', 6, 3),
(219, '2023-05-18 13:57:52.684233', '2', 'phone', 3, '', 6, 3),
(220, '2023-05-18 13:57:52.729068', '3', 'laptop', 3, '', 6, 3),
(221, '2023-05-18 13:57:52.796901', '16', 'Producer', 3, '', 6, 3),
(222, '2023-05-18 13:57:52.870569', '17', 'ASUS', 3, '', 6, 3),
(223, '2023-05-18 13:57:52.910701', '1', 'sport', 3, '', 6, 3),
(224, '2023-05-18 13:57:53.054593', '19', 'DELL', 3, '', 6, 3),
(225, '2023-05-18 13:57:53.077538', '2', 'phone', 3, '', 6, 3),
(226, '2023-05-18 13:57:53.145194', '18', 'HP', 3, '', 6, 3),
(227, '2023-05-18 13:57:53.167452', '3', 'laptop', 3, '', 6, 3),
(228, '2023-05-18 13:57:53.224003', '4', 'pet', 3, '', 6, 3),
(229, '2023-05-18 13:57:53.246946', '16', 'Producer', 3, '', 6, 3),
(230, '2023-05-18 13:57:53.292022', '21', 'bird', 3, '', 6, 3),
(231, '2023-05-18 13:57:53.314694', '17', 'ASUS', 3, '', 6, 3),
(232, '2023-05-18 13:57:53.359786', '14', 'cat', 3, '', 6, 3),
(233, '2023-05-18 13:57:53.382431', '19', 'DELL', 3, '', 6, 3),
(234, '2023-05-18 13:57:53.429165', '15', 'dog', 3, '', 6, 3),
(235, '2023-05-18 13:57:53.451820', '18', 'HP', 3, '', 6, 3),
(236, '2023-05-18 13:57:53.519285', '5', 'other', 3, '', 6, 3),
(237, '2023-05-18 13:57:53.530556', '4', 'pet', 3, '', 6, 3),
(238, '2023-05-18 13:57:53.576068', '6', 'food', 3, '', 6, 3),
(239, '2023-05-18 13:57:53.598992', '21', 'bird', 3, '', 6, 3),
(240, '2023-05-18 13:57:53.751005', '11', 'drinks', 3, '', 6, 3),
(241, '2023-05-18 13:57:53.797843', '14', 'cat', 3, '', 6, 3),
(242, '2023-05-18 13:57:53.889200', '12', 'coca', 3, '', 6, 3),
(243, '2023-05-18 13:57:53.900563', '15', 'dog', 3, '', 6, 3),
(244, '2023-05-18 13:57:53.991780', '13', 'water lavi', 3, '', 6, 3),
(245, '2023-05-18 13:57:54.014966', '5', 'other', 3, '', 6, 3),
(246, '2023-05-18 13:57:54.083535', '10', 'snacks', 3, '', 6, 3),
(247, '2023-05-18 13:57:54.106399', '6', 'food', 3, '', 6, 3),
(248, '2023-05-18 13:57:54.174266', '20', 'oshi', 3, '', 6, 3),
(249, '2023-05-18 13:57:54.207873', '11', 'drinks', 3, '', 6, 3),
(250, '2023-05-18 13:57:54.333909', '12', 'coca', 3, '', 6, 3),
(251, '2023-05-18 13:57:54.435671', '13', 'water lavi', 3, '', 6, 3),
(252, '2023-05-18 13:57:54.592062', '10', 'snacks', 3, '', 6, 3),
(253, '2023-05-18 13:57:54.637614', '20', 'oshi', 3, '', 6, 3),
(254, '2023-05-18 14:00:28.034713', '22', 'Electronics', 1, '[{\"added\": {}}]', 6, 3),
(255, '2023-05-18 14:00:36.952502', '23', 'mobile phones', 1, '[{\"added\": {}}]', 6, 3),
(256, '2023-05-18 14:00:45.231588', '24', 'laptop', 1, '[{\"added\": {}}]', 6, 3),
(257, '2023-05-18 14:00:54.162114', '25', 'Fashion', 1, '[{\"added\": {}}]', 6, 3),
(258, '2023-05-18 14:01:02.889662', '26', 'clothing', 1, '[{\"added\": {}}]', 6, 3),
(259, '2023-05-18 14:01:17.589283', '27', 'footwear', 1, '[{\"added\": {}}]', 6, 3),
(260, '2023-05-18 14:01:40.471660', '28', 'Health and Beauty', 1, '[{\"added\": {}}]', 6, 3),
(261, '2023-05-18 14:01:46.174381', '29', 'cosmetics', 1, '[{\"added\": {}}]', 6, 3),
(262, '2023-05-18 14:01:57.237556', '30', 'haircare', 1, '[{\"added\": {}}]', 6, 3),
(263, '2023-05-18 14:02:09.173097', '31', 'Sports', 1, '[{\"added\": {}}]', 6, 3),
(264, '2023-05-18 14:02:14.419123', '32', 'sportswear', 1, '[{\"added\": {}}]', 6, 3),
(265, '2023-05-18 14:03:41.040249', '33', 'camping gear', 1, '[{\"added\": {}}]', 6, 3),
(266, '2023-05-18 14:03:51.058962', '34', 'Toys', 1, '[{\"added\": {}}]', 6, 3),
(267, '2023-05-18 14:04:03.293614', '35', 'Books', 1, '[{\"added\": {}}]', 6, 3),
(268, '2023-05-18 14:04:15.053070', '36', 'textbooks', 1, '[{\"added\": {}}]', 6, 3),
(269, '2023-05-18 14:04:21.168492', '37', 'manga', 1, '[{\"added\": {}}]', 6, 3),
(270, '2023-05-18 14:04:30.093477', '38', 'light novel', 1, '[{\"added\": {}}]', 6, 3),
(271, '2023-05-18 14:08:23.262954', '49', 'Samsung Galaxy A24', 1, '[{\"added\": {}}]', 7, 3),
(272, '2023-05-18 14:10:05.012719', '50', 'iPhone 14 Pro Max', 1, '[{\"added\": {}}]', 7, 3),
(273, '2023-05-18 14:10:53.888439', '51', 'iPhone 14 Pro', 1, '[{\"added\": {}}]', 7, 3),
(274, '2023-05-18 14:12:13.255933', '52', 'Samsung Galaxy S21 FE 5G', 1, '[{\"added\": {}}]', 7, 3),
(275, '2023-05-18 14:12:53.884748', '53', 'Samsung Galaxy S23 Ultra 5G', 1, '[{\"added\": {}}]', 7, 3),
(276, '2023-05-18 14:13:35.936268', '54', 'Laptop Apple MacBook Air M1 2020', 1, '[{\"added\": {}}]', 7, 3),
(277, '2023-05-18 14:14:22.613500', '55', 'Laptop Lenovo IdeaPad 1', 1, '[{\"added\": {}}]', 7, 3),
(278, '2023-05-18 14:14:53.427919', '56', 'Laptop HP 15s fq2716TU', 1, '[{\"added\": {}}]', 7, 3),
(279, '2023-05-18 14:15:23.986848', '57', 'Laptop Asus Vivobook X415EA', 1, '[{\"added\": {}}]', 7, 3),
(280, '2023-05-18 14:15:58.557531', '58', 'Laptop itel SPIRIT', 1, '[{\"added\": {}}]', 7, 3),
(281, '2023-05-18 14:17:46.041515', '59', 'Áo phông Nam Cotton', 1, '[{\"added\": {}}]', 7, 3),
(282, '2023-05-18 14:19:39.144109', '60', 'áo thun nam nữ tay lỡ unisex', 1, '[{\"added\": {}}]', 7, 3),
(283, '2023-05-18 14:26:33.026062', '61', 'Áo Crotop Tay Bồng', 1, '[{\"added\": {}}]', 7, 3),
(284, '2023-05-18 14:28:51.471255', '62', 'Áo lông cừu cho bé', 1, '[{\"added\": {}}]', 7, 3),
(285, '2023-05-18 14:29:25.098035', '63', 'Đầm thun ngắn tay', 1, '[{\"added\": {}}]', 7, 3),
(286, '2023-05-18 14:30:15.336944', '64', 'Giày adidas ORIGINALS HF2020', 1, '[{\"added\": {}}]', 7, 3),
(287, '2023-05-18 14:30:52.039067', '65', 'Giày adidas ORIGINALS Nam Hu NMD', 1, '[{\"added\": {}}]', 7, 3),
(288, '2023-05-18 14:32:44.999080', '66', 'Giày adidas RUNNING Unisex Alphalava GX1191', 1, '[{\"added\": {}}]', 7, 3),
(289, '2023-05-18 14:33:19.400895', '67', 'Giày adidas GOLF Nam GV9674', 1, '[{\"added\": {}}]', 7, 3),
(290, '2023-05-18 14:33:52.603315', '68', 'GIÀY THỂ THAO CHỮ N NB530', 1, '[{\"added\": {}}]', 7, 3),
(291, '2023-05-18 14:34:28.200949', '39', 'jewelry', 1, '[{\"added\": {}}]', 6, 3),
(292, '2023-05-18 14:35:08.254267', '69', 'Bộ 2 Nhẫn 925 Bằng Kim Loại', 1, '[{\"added\": {}}]', 7, 3),
(293, '2023-05-18 14:35:31.839376', '70', 'Moonlight Stone Bells Vòng đeo tay', 1, '[{\"added\": {}}]', 7, 3),
(294, '2023-05-18 14:41:26.015599', '71', 'Set 7 Khuyên Tai Thời Trang', 1, '[{\"added\": {}}]', 7, 3),
(295, '2023-05-18 14:42:45.593147', '72', 'Lắc tay nữ bạc S925', 1, '[{\"added\": {}}]', 7, 3),
(296, '2023-05-18 14:43:26.024013', '73', 'Nhẫn Bạc nữ đính đá vương miện', 1, '[{\"added\": {}}]', 7, 3),
(297, '2023-05-18 14:44:46.237518', '74', 'mỹ phẩm chăm sóc da FENYI', 1, '[{\"added\": {}}]', 7, 3),
(298, '2023-05-18 14:45:17.402551', '75', 'mỹ phẩm chăm sóc da LAIKOU', 1, '[{\"added\": {}}]', 7, 3),
(299, '2023-05-18 14:48:29.657346', '76', 'Nước dưỡng tóc tinh dầu bưởi', 1, '[{\"added\": {}}]', 7, 3),
(300, '2023-05-18 14:49:30.804614', '77', 'Tinh Dầu Moroccan Collagen', 1, '[{\"added\": {}}]', 7, 3),
(301, '2023-05-18 14:50:26.633406', '78', 'Bộ đồ thể thao LOCO FISH', 1, '[{\"added\": {}}]', 7, 3),
(302, '2023-05-18 14:51:06.555736', '79', 'QUẦN THỂ THAO NAM', 1, '[{\"added\": {}}]', 7, 3),
(303, '2023-05-18 14:51:45.006143', '80', 'M47 - BỘ ARSENAL', 1, '[{\"added\": {}}]', 7, 3),
(304, '2023-05-18 14:52:38.317856', '81', 'Lều Cắm Trại Mông Cổ MOUNTAINHIKER', 1, '[{\"added\": {}}]', 7, 3),
(305, '2023-05-18 14:53:23.495814', '82', 'ĐỒ DÙNG ĐI PHƯỢT CHO GIA ĐÌNH', 1, '[{\"added\": {}}]', 7, 3),
(306, '2023-05-18 14:53:55.929029', '83', 'Giá Treo Đồ Cắm Trại Picnic', 1, '[{\"added\": {}}]', 7, 3),
(307, '2023-05-18 14:55:50.639859', '84', 'Đồ Chơi B.Brand Thú Nhún Hà Mã', 1, '[{\"added\": {}}]', 7, 3),
(308, '2023-05-18 14:56:28.524342', '85', 'Đồ chơi giảm stress Khỉ Đột', 1, '[{\"added\": {}}]', 7, 3),
(309, '2023-05-18 14:57:07.886173', '86', 'Bộ Đồ Chơi Nhà Bếp Mini Cho Bé', 1, '[{\"added\": {}}]', 7, 3),
(310, '2023-05-18 15:07:04.492913', '87', 'Không diệt không sinh đừng sợ hãi', 1, '[{\"added\": {}}]', 7, 3),
(311, '2023-05-18 15:08:17.687267', '88', 'Sách - Vòng Đời (Life Cycles)', 1, '[{\"added\": {}}]', 7, 3),
(312, '2023-05-18 15:08:54.266602', '89', 'Sách - Pnin - Vladimir Nabokov', 1, '[{\"added\": {}}]', 7, 3),
(313, '2023-05-18 15:09:31.592499', '90', 'Truyện tranh - DR. STONE', 1, '[{\"added\": {}}]', 7, 3),
(314, '2023-05-18 15:10:06.207722', '91', 'Sách - Combo Conan - 20 quyển', 1, '[{\"added\": {}}]', 7, 3),
(315, '2023-05-18 15:10:42.660517', '92', 'Truyện tranh - Bộ 10 cuốn Doraemon', 1, '[{\"added\": {}}]', 7, 3),
(316, '2023-05-18 15:11:53.772885', '93', 'Sách - Colorful (Light Novel)', 1, '[{\"added\": {}}]', 7, 3),
(317, '2023-05-18 15:12:37.840050', '94', 'Sách Phù Thùy Trắng Định Tội Tập 1', 1, '[{\"added\": {}}]', 7, 3),
(318, '2023-05-18 15:13:45.215052', '95', 'Chuyện tình thanh xuân bi hài của tôi quả nhiên là sai lầm', 1, '[{\"added\": {}}]', 7, 3),
(319, '2023-05-18 15:16:24.440154', '43', 'Le An', 3, '', 10, 3),
(320, '2023-05-18 15:16:24.503449', '42', 'Chien Than', 3, '', 10, 3),
(321, '2023-05-18 15:16:24.548380', '37', 'Funky', 3, '', 10, 3),
(322, '2023-05-18 15:16:24.606444', '36', 'An', 3, '', 10, 3),
(323, '2023-05-18 15:16:24.651597', '35', 'Tran Phong', 3, '', 10, 3),
(324, '2023-05-18 15:16:24.707879', '34', 'qqqqqq', 3, '', 10, 3),
(325, '2023-05-18 15:16:24.753377', '33', 'Tran Van Phu', 3, '', 10, 3),
(326, '2023-05-18 15:16:24.820830', '32', 'iiii', 3, '', 10, 3),
(327, '2023-05-18 15:16:24.865912', '31', 'io', 3, '', 10, 3),
(328, '2023-05-18 15:16:24.933582', '30', 'An', 3, '', 10, 3),
(329, '2023-05-18 15:16:24.978845', '22', 'aaa', 3, '', 10, 3),
(330, '2023-05-18 15:16:25.024063', '21', 'Nguyen Phuc', 3, '', 10, 3),
(331, '2023-05-18 15:16:25.080635', '20', 'Tran Ptu', 3, '', 10, 3),
(332, '2023-05-18 15:16:25.265363', '19', 'Le Phu', 3, '', 10, 3),
(333, '2023-05-18 16:22:59.024256', '3', 'an', 2, '[{\"changed\": {\"fields\": [\"Password\"]}}]', 8, 7);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int NOT NULL,
  `app_label` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(12, 'accounts', 'customer'),
(8, 'accounts', 'user'),
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(9, 'cart', 'cart'),
(10, 'cart', 'order'),
(11, 'cart', 'orderdetail'),
(13, 'comments', 'comment'),
(14, 'comments', 'like'),
(4, 'contenttypes', 'contenttype'),
(6, 'products', 'category'),
(7, 'products', 'product'),
(5, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL,
  `app` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-01-11 06:44:36.862002'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-01-11 06:45:53.329199'),
(3, 'auth', '0001_initial', '2023-01-11 06:45:57.781762'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-01-11 06:45:58.585865'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-01-11 06:45:58.636683'),
(6, 'auth', '0004_alter_user_username_opts', '2023-01-11 06:45:58.706458'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-01-11 06:45:58.766792'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-01-11 06:45:58.831648'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-01-11 06:45:58.909628'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-01-11 06:45:58.991344'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-01-11 06:45:59.058436'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-01-11 06:45:59.295608'),
(13, 'auth', '0011_update_proxy_permissions', '2023-01-11 06:45:59.351539'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-01-11 06:45:59.418116'),
(15, 'accounts', '0001_initial', '2023-01-11 06:46:04.811071'),
(16, 'admin', '0001_initial', '2023-01-11 06:46:50.700385'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-01-11 06:46:50.753251'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-01-11 06:46:50.831878'),
(19, 'products', '0001_initial', '2023-01-11 06:46:51.549342'),
(20, 'sessions', '0001_initial', '2023-01-11 06:46:52.218751'),
(21, 'products', '0002_alter_product_describe_alter_product_producer', '2023-01-13 03:27:10.639813'),
(22, 'cart', '0001_initial', '2023-01-13 03:27:12.044657'),
(23, 'cart', '0002_remove_cart_describe', '2023-01-30 08:35:07.649447'),
(24, 'cart', '0003_remove_cart_product_id', '2023-01-30 08:40:58.368732'),
(25, 'cart', '0004_remove_cart_producer', '2023-01-31 03:46:27.182455'),
(26, 'cart', '0005_history', '2023-02-03 07:29:07.229436'),
(27, 'accounts', '0002_alter_user_username', '2023-02-03 09:15:38.670810'),
(28, 'products', '0003_product_user_id', '2023-02-04 07:00:43.186508'),
(29, 'products', '0004_alter_product_image', '2023-02-06 07:55:12.552827'),
(30, 'products', '0005_alter_product_image', '2023-02-06 08:39:56.911010'),
(31, 'products', '0006_alter_product_image', '2023-02-06 08:41:12.242867'),
(32, 'cart', '0006_rename_history_order_remove_cart_image_and_more', '2023-02-08 06:34:11.035957'),
(33, 'cart', '0007_alter_cart_product_id', '2023-02-08 07:13:19.363942'),
(34, 'cart', '0008_rename_name_order_address_remove_order_image_and_more', '2023-02-13 07:30:28.521975'),
(35, 'cart', '0002_order_user_id', '2023-02-13 08:32:36.610864'),
(36, 'cart', '0003_order_date', '2023-02-14 04:31:56.073610'),
(37, 'accounts', '0002_customer', '2023-02-24 07:05:05.396606'),
(38, 'products', '0002_rename_producer_category', '2023-02-24 07:05:06.129230'),
(39, 'products', '0002_alter_product_category_id', '2023-02-24 07:51:30.562869'),
(40, 'accounts', '0002_user_position', '2023-02-28 03:08:19.713582'),
(41, 'comments', '0001_initial', '2023-03-10 07:35:34.563547'),
(42, 'comments', '0002_alter_comment_path', '2023-03-10 07:36:45.274129'),
(43, 'comments', '0003_alter_comment_path', '2023-03-13 02:47:16.775370'),
(44, 'comments', '0004_like', '2023-03-13 08:02:04.059004'),
(45, 'comments', '0005_alter_like_comment_id', '2023-03-13 08:15:24.657656'),
(46, 'comments', '0006_comment_path_length', '2023-03-20 00:42:27.537131'),
(47, 'comments', '0007_comment_count_like', '2023-03-20 08:58:15.786199'),
(48, 'cart', '0002_cart_user_id', '2023-04-03 02:51:32.986080'),
(49, 'products', '0002_category_parent', '2023-04-03 06:40:49.076875'),
(50, 'products', '0003_category_level_category_lft_category_rght_and_more', '2023-04-03 07:08:40.959512'),
(51, 'products', '0004_alter_category_id', '2023-04-03 07:15:44.588285'),
(52, 'products', '0005_remove_category_level_remove_category_lft_and_more', '2023-04-03 08:23:19.641607'),
(53, 'products', '0006_remove_category_path_remove_category_path_length_and_more', '2023-04-07 17:01:27.382717'),
(54, 'accounts', '0003_delete_customer', '2023-05-15 10:22:40.902679'),
(55, 'products', '0007_alter_product_describe', '2023-05-18 14:06:40.291561');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1g3amb6utggztjvjcckrz7pj5brz9t2x', '.eJwtyksKgCAURuG9_GOp7DVwGw0jwuxiQtfEbBTtPYOGH-fccOtsdExQtUAiDjv9Hu_coKSA10xQGLaDTgg41vZziMd6mTQ7tqWsm7bri-BtHvzFC8V8yIwQnflu2VUVnul5ATSwI0o:1pN8OE:Wlz5a6KiPyCxpiSfE3Dzq1JB2-5-1C6dRUxlSl2Y8TQ', '2023-02-15 08:22:46.193602'),
('1y0u816go59gz00zwslcdg82tk7ikn3r', '.eJwtyksKgCAURuG9_GOp7DVwGw0jwuxiQtfEbBTtPYOGH-fccOtsdExQtUAiDjv9Hu_coKSA10xQGLaDTgg41vZziMd6mTQ7tqWsm7bri-BtHvzFC8V8yIwQnflu2VUVnul5ATSwI0o:1pNpo2:4tvu6I60nRpBvjZXfi5M-ZrVk9TcmeBBW_yUQwZxxoI', '2023-02-17 06:44:18.108278'),
('2r34hgvk4slt1si5txyvvksipvi26qsx', '.eJxdj8tuwyAQRf9l1siyscGPZff5gqpC4wHXbglEBlZR_j2QWm2T5cy5Zx5X2LQi3CNMLYNozhdrjvr9mhlMDQOXzrPZYYIGGFx2rxNFVViXYQpmfxQuWXtjPxL_J_FXib9KH3-BslqRTy4fIBgoTHFVv2lo4ak3I30bV4D-QvfpK_Iu7ttclUh10FCdvDb27cg-DVgxrNnuBlOPmveSxpH3tR5lj0iixhFpWGS9CG5Ii1lqFDh0fcPnpeWcGimw1c1SPvRhi5t3eVow1ubPb3e8JnKD:1pnFk8:HWI1bByWYHUjnrnnnYskSuj3Sd-p3PL74v_wloKEu4c', '2023-04-28 09:29:20.790007'),
('2w9oxpmb9e1fyfixbdj95esvzn8cdnnp', '.eJwtyksKgCAURuG9_GOp7DVwGw0jwuxiQtfEbBTtPYOGH-fccOtsdExQtUAiDjv9Hu_coKSA10xQGLaDTgg41vZziMd6mTQ7tqWsm7bri-BtHvzFC8V8yIwQnflu2VUVnul5ATSwI0o:1pNpcq:_DBthUxtFULNBJADTCh7ja9XPY_tsEoRy_Cnr-T59Uw', '2023-02-17 06:32:44.183755'),
('9x63zhbnrv7fgjwseyyg3xv8yd4cc907', 'eyJwcm9kdWN0X2NhcnRfY291bnQiOjB9:1pzUCU:lM1_dNz78au23biPeIdbg0UyeTaHYGgfYe2jwOizgl4', '2023-06-01 03:21:10.941116'),
('9y1fhajsr7vnm38j7q9ciwzw1k7vgl6l', '.eJyNj81ug0AMhN_FZ4R2vdmF5dh7nqCKkNdeCm0CET-niHcvW5E2kaqqR898nrFvUNMyt_UyxbHuBCowkD1qgfgj9smQd-rfhpyHfh67kCck390pPw4Szy87-xTQ0tRu24cyKi9YOPYeCyXeFURsFXnisnGqsRhZbHBClspDoTE0BpG1s2REN1tov1zCFngdB1l4hur1lME-1ExjUm7w9YNW-puHyqs1-9XAf-j4oJt1a-xkLzMZzPFyPcfncv3DQ1q-X5g8o-_J-Dd1Wj8BF6-A8g:1pcMYl:Xtco27wNXfAkFRtoVFLY3aHlENcTGlmIcIT2Emo4rUo', '2023-03-29 08:32:35.011707'),
('akni6rbjg6n0drq4fdekoyqzgizuo7ok', 'e30:1pNpgW:Np4Dd2cA5qXjpcZGJ3d0_7dvDyUO9i4RvuKLrn2O9zY', '2023-02-17 06:36:32.483284'),
('budk7jjhpcip4ow6s4qqalgyxiydxen3', '.eJwtysEKhCAURuF3-dcypY2z8DVaxhCmFxO6Jmar6N3HYJYf51yIfna2VBglUInzRn9PV2swUiBZJhiM604HBCLb8DiX3Z-uzpFDJ9Xw1p9XTqEN6eSFSjuUbMolumeXuu9xf-8fVqMjfA:1pN87Z:-5i-PFufBujxN8y5Nv4TofxN0FXsno9n3rUPnWEBnwc', '2023-02-15 08:05:33.977211'),
('fkb2t24kpbcvx0akwvfkj7etv3nn6h37', 'e30:1pNpgw:dr48QK6iA8Vfom-_j1dlZOC2zxONs85pLdIbH_2j49o', '2023-02-17 06:36:58.010978'),
('g8ss4n2p06nu3gpp49v8n9xec0c9w121', '.eJwtyksKgCAURuG9_GOp7DVwGw0jwuxiQtfEbBTtPYOGH-fccOtsdExQtUAiDjv9Hu_coKSA10xQGLaDTgg41vZziMd6mTQ7tqWsm7bri-BtHvzFC8V8yIwQnflu2VUVnul5ATSwI0o:1pNpsS:r0Re3snuytKaKtjl9-CcPiXPkatPl2ng1tvOeKzzcHU', '2023-02-17 06:48:52.437297'),
('gdpt52j1fb39d6frgl9p4o79afmeuer5', '.eJydk9turCAUhl_FkMydcQRFZe5q0qseXmC3IQiM0ipMPLQXzX73gnXPdibBtL0xsNb6_nWQ9QFOvRETHylnvf2YSY_gkIaAsmls6DTInioBDiABF7aK8VepnUO8MF2biBs99qqKXEi0eIfowQjZlkvshUDDhsbSaSFjIlCecUJQHguS5YxxHDPCeHHM4iNGkgtcZYJhVqQ5RNUxQYjDDLNEwKMVPZlBjcpoqzbItpW9tSkx9wMOEIdglN2plYvhzwdw_cAQ6KmrbLCtwYksU3C-JAvBuXE9te3f8AtCKyi5glLogZINyJsp3cqEPBBeQei7ULaC4HehfAPKfIMoNsrzQmQDwsQDwXhF4etUsY-CWwV6c6HfzAJuvYrC9ypg-qMRPoeXy_2m5PvFArBOWqHyaYJSkAAFj407skoHBOFgtldQ18Gd6oJ7M_ugctvVsdqR-04KxfbnKrp6X-5u4a4sd4RQRB-b-Xazuyk1tZK0XO6lVaVWld6bfxFQRS-nGvxvELnqFbd5kP1joxlZa19kfN3VuSEAk3yNu8CZoouMZT8BemyRMQ:1pzfRc:DY7LCJFkp_9I6vjZXKH_ZkNwGbmp0D_Y9D8AEKBsy8Y', '2023-06-01 15:21:32.130683'),
('gv1mv8pavbe9gp9772675tcvnulyk3uv', '.eJwtyksKgCAURuG9_GOp7DVwGw0jwuxiQtfEbBTtPYOGH-fccOtsdExQtUAiDjv9Hu_coKSA10xQGLaDTgg41vZziMd6mTQ7tqWsm7bri-BtHvzFC8V8yIwQnflu2VUVnul5ATSwI0o:1pNpqY:XjNIopdBBC2Ns8N7ZEx9gJMPNmPXWSPrqtijU_8zFJc', '2023-02-17 06:46:54.970561'),
('gvn8dasbfh680vdz8hidj4q48vs1ik5k', '.eJxVj8sKgzAQRf8lawl5mGhcdt8vKCKTmVjtIyk-VuK_V4uUdjn3nntgFtbAPHXNPIah6YlVTLPsN_OA9xD3gm4Qr4ljitPQe74j_GhHfk4UHqeD_RN0MHbbOi-DcKQKi86pQpCzBQAaAQ6wbK1ojQpIxlsCA2VeSOVbrRRKa0CTbDdpnJ9-E76GRDNOrLrUGTuOBmHYk4V9fpBCf3lWybVe38IaTDo:1pgPGd:8l0hpTvydS15bS8EXbjGO7HaWHOXZ9qBzaO6pjrSvg4', '2023-04-09 12:14:35.647583'),
('hd3u80jrkl00m762l9tbqa6j4r6w1swv', '.eJwtyksKgCAURuG9_GOp7DVwGw0jwuxiQtfEbBTtPYOGH-fccOtsdExQtUAiDjv9Hu_coKSA10xQGLaDTgg41vZziMd6mTQ7tqWsm7bri-BtHvzFC8V8yIwQnflu2VUVnul5ATSwI0o:1pNppW:jFSxzftGGjau48-skL0nSuxq6zXJXcloFkZakeMPY9o', '2023-02-17 06:45:50.311146'),
('ig6to3tht6leqqao7abhupz7nhit2nr0', '.eJxVj0FuxCAQBP8yZ8sy2GDjY-55QbRCA4NjEi-sAJ9W-_dgiUjJcbqrS5onaDzLrs_skvYEK4zQ_c0M2m8XroK-MHzG3sZQkjf9hfStzf17JHe8NfafYMe81_W0uEERn6VVis8DKTkjWjGgQrtsctgEd5aEkYQCl2lm3Gwj55ZJgSOxrUofMfviY6i27I7DpZp50hZTgZV3UNz9cbh2fzzheod1EM67qewK7HKkSKct7dUJXrdfQLeqTm-vH_u6W3s:1pfeCx:NDv7vyH4ksD9DkC-u1367grIqetQlXpDmmucR-4jpJc', '2023-04-07 09:59:39.835597'),
('j8vftteomvuqbbw3xl29d19frpo43vgj', 'eyJwcm9kdWN0X2NhcnRfY291bnQiOjB9:1q0EFM:X1SMl42zCtMA4u_pLpSa5V9H6ALAEaU_CzPoJ-r6_7Q', '2023-06-03 04:31:12.319548'),
('jiq6gvitqxmfcqtuinea2oe2tissk70h', '.eJyVkUtuxCAQRO_Sa2RhbPBnmX1OEEVWG3DshAGLz2o0dw841ihZzEjZIHVVvRKtvsLunUoyThJ9flyyEcaawKYOBUZOIOrLbvQ5v12zd0Rsuszawwg1kHtN8aApSgraH6NNxtzID8aeYt0jrHmKNY-w9p-ffCcwYYrrdJehdP_SZpRf2hZDfaL9cJV0NvptrkqkOt1QvTqlzcuZ_VOwYlgz3faaDop1Qg4D66gaRIcoOcUBZb8IunCmpeKzUMixb7uazUvDmKwFx0bVS1nGhS1uzua2oI3JS-ZLuYhm2v0mdT4RpbdvU_ubEQ:1pjBwf:D6RH6KeqG3ufmGj2jwbB0DbLQ1dn-9p33Dk-QLUqIXw', '2023-04-17 04:37:29.584884'),
('kkfy95a5p4rdp44l1gv1vzxi4jgz2uxf', 'eyJwcm9kdWN0X2NhcnRfY291bnQiOjB9:1poDZ8:4g-G4J2QgKPba11ix2ya5UOksF-R5YrUymFzTZyZEzY', '2023-05-01 01:21:58.441926'),
('lcac7jlg62qv0u1hjskgxjpra2qn48n1', '.eJwtyksKgCAURuG9_GOp7DVwGw0jwuxiQtfEbBTtPYOGH-fccOtsdExQtUAiDjv9Hu_coKSA10xQGLaDTgg41vZziMd6mTQ7tqWsm7bri-BtHvzFC8V8yIwQnflu2VUVnul5ATSwI0o:1pNpf7:_tbT6SH4QkOSYvqNIE4CDhWeDJ1oJ5bYf8FwEZxAArI', '2023-02-17 06:35:05.173786'),
('u2v8o8uxtdfbbg15k9gk5zcfs8fjxvcn', '.eJwtyksKgCAURuG9_GOp7DVwGw0jwuxiQtfEbBTtPYOGH-fccOtsdExQtUAiDjv9Hu_coKSA10xQGLaDTgg41vZziMd6mTQ7tqWsm7bri-BtHvzFC8V8yIwQnflu2VUVnul5ATSwI0o:1pNphs:MBzeC6N9SwqJhNfkMsdV5HQow5kAuhJoSqTIqoO8-rs', '2023-02-17 06:37:56.303232'),
('vfu6rp9ryxy99ufbg6dh7xdb3ri62z9l', '.eJxVj0uKwzAQRO_Sa2Ek2ZItL2c_JxgG0_o4dkaRgj6rkLuPHEwgm4aqV11QD7inaKspi8HUTqyhwCwJ7PblwMwJFHe7e3fqn0djMDMCod60SzADA_KuOdhACdTs0kuE6v3zl8CCtWzL24YePjyN5s-FA9grhkvsTAwl7bo7It1Jc_cdrfNfZ_ajYMO8te9hclRZPkqjFB-pVXJENIKiQjOtkq6CO2OFlhYFTsPIuF57zg2TAnvL1mNKzHvZY2ht2XnfJj7_AckaYas:1psJtY:pXxgulD-JAGyFbV5HLzA0Wok9OSCfU1Fd36cWnQv2wc', '2023-05-12 08:56:00.164290'),
('x99ssrxmx6nk6pgj92wk9m7hmlr3l0ks', '.eJwtyksKgCAURuG9_GOp7DVwGw0jwuxiQtfEbBTtPYOGH-fccOtsdExQtUAiDjv9Hu_coKSA10xQGLaDTgg41vZziMd6mTQ7tqWsm7bri-BtHvzFC8V8yIwQnflu2VUVnul5ATSwI0o:1pNpqy:6e0gWSGM6983bN-MfMR_Je43CwJmURcvnHqGyYxExpc', '2023-02-17 06:47:20.054369'),
('xxuev4vwjcu2cnwcvqno9fe1fcmuh7uq', '.eJxVjEEOwiAQRe_C2hCgTAGX7j0DGWBGqoYmpV0Z765NutDtf-_9l4i4rTVunZY4FXEWWpx-t4T5QW0H5Y7tNss8t3WZktwVedAur3Oh5-Vw_w4q9vqtmZO3Blkr6yAgDJ4AQlCenSFO2tMIgDpTxjCUURkk76wurjAxJS3eH-YeOHY:1pGAj5:MOs88BtvbBEOeph82lm6f9dZGJFuA_lAUsQc2zc2QRY', '2023-01-27 03:27:31.514300'),
('yha6v5ybw95tzrtc0pi4v27ysxaxx1n4', '.eJxVjEEOgyAQRe_CuiGIAtJl9z2DGWaGSmvAiK6a3r2auGi3_73_3mKAbR2HrfIyJBJX0YrL7xYAX5wPQE_IjyKx5HVJQR6KPGmV90I83U73LzBCHfd317PypJ1F77VT5K0DQKPAA_bRqmg0I5lgCQz0nWt0iK3W2FgDLTVxj86lpjWVvNcqTxMv4vMFh4g-7g:1pfEr8:PwNAv9ivYwKBdmN0PJMUrJrnWmtrvg07DIglFe05loU', '2023-04-06 06:55:26.946831'),
('zy44d0f0v53zmto5495sg7nypc10psnn', 'e30:1pNpfc:2t4lk9CWPh6xNdHGYM69ShGAm3Eq4g6RroHW24AnBGk', '2023-02-17 06:35:36.779768');

-- --------------------------------------------------------

--
-- Table structure for table `products_category`
--

CREATE TABLE `products_category` (
  `id` bigint NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `level` int UNSIGNED NOT NULL,
  `lft` int UNSIGNED NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `rght` int UNSIGNED NOT NULL,
  `tree_id` int UNSIGNED NOT NULL
) ;

--
-- Dumping data for table `products_category`
--

INSERT INTO `products_category` (`id`, `name`, `level`, `lft`, `parent_id`, `rght`, `tree_id`) VALUES
(22, 'Electronics', 0, 1, NULL, 6, 2),
(23, 'mobile phones', 1, 4, 22, 5, 2),
(24, 'laptop', 1, 2, 22, 3, 2),
(25, 'Fashion', 0, 1, NULL, 8, 3),
(26, 'clothing', 1, 2, 25, 3, 3),
(27, 'footwear', 1, 4, 25, 5, 3),
(28, 'Health and Beauty', 0, 1, NULL, 6, 4),
(29, 'cosmetics', 1, 2, 28, 3, 4),
(30, 'haircare', 1, 4, 28, 5, 4),
(31, 'Sports', 0, 1, NULL, 6, 5),
(32, 'sportswear', 1, 4, 31, 5, 5),
(33, 'camping gear', 1, 2, 31, 3, 5),
(34, 'Toys', 0, 1, NULL, 2, 6),
(35, 'Books', 0, 1, NULL, 8, 1),
(36, 'textbooks', 1, 6, 35, 7, 1),
(37, 'manga', 1, 4, 35, 5, 1),
(38, 'light novel', 1, 2, 35, 3, 1),
(39, 'jewelry', 1, 6, 25, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `products_product`
--

CREATE TABLE `products_product` (
  `id` bigint NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `number` int NOT NULL,
  `price` int NOT NULL,
  `describe` varchar(1000) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `producer` varchar(100) COLLATE utf8mb4_vietnamese_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `user_id_id` bigint NOT NULL,
  `category_id_id` bigint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;

--
-- Dumping data for table `products_product`
--

INSERT INTO `products_product` (`id`, `name`, `number`, `price`, `describe`, `producer`, `image`, `user_id_id`, `category_id_id`) VALUES
(49, 'Samsung Galaxy A24', 100, 100, 'Samsung Galaxy A24 6GB - là thế hệ điện thoại thuộc dòng Galaxy vừa được nhà Samsung giới thiệu đến thị trường Việt Nam vào tháng 04/2023. Máy sở hữu cụm camera có độ phân giải chính 50 MP, chip tốt cùng màn hình Super AMOLED chất lượng.', 'VN', 'product_img/samsung-galaxy-a24.jpg', 3, 23),
(50, 'iPhone 14 Pro Max', 10, 200, 'Điểm nhấn của sự kiện ra mắt sản phẩm tháng 9/2022 của Apple chính là siêu phẩm iPhone 14 Pro Max 128GB với thiết kế mặt trước đổi mới, camera nâng cấp mạnh mẽ và hiệu năng bùng nổ từ chip A16 Bionic, đáp ứng mọi nhu cầu của người dùng.', 'NA', 'product_img/iphone-14-pro-max.jpg', 3, 23),
(51, 'iPhone 14 Pro', 40, 150, 'Mới đây (09/2022), Apple đã tung ra thị trường mẫu điện thoại iPhone 14 series, trong đó có một cái tên nhận được nhiều sự quan tâm của giới công nghệ là iPhone 14 Pro, sở hữu hiệu năng mạnh mẽ, màn hình hiển thị hình ảnh chân thực và cụm camera cho khả năng chụp ảnh đẹp mắt.', 'NA', 'product_img/iphone-14-pro.jpg', 4, 23),
(52, 'Samsung Galaxy S21 FE 5G', 40, 200, 'Samsung mang đến cho người dùng phiên bản điện thoại Samsung Galaxy S21 FE 5G (8GB/128GB) mới có sức hút hấp dẫn với ngoại hình tinh tế, nịnh mắt, một cấu hình mạnh mẽ từ chip Exynos 2100 và ấn tượng ở khả năng quay chụp từ hệ thống camera thông minh, xịn sò.', 'VN', 'product_img/Samsung-Galaxy-S21-FE.jpg', 5, 23),
(53, 'Samsung Galaxy S23 Ultra 5G', 50, 220, 'Samsung Galaxy S23 Ultra được xác nhận sẽ ra mắt trong sự kiện Galaxy Unpacked diễn ra vào đầu tháng 2 năm nay, theo thông tin từ hãng thì đây sẽ là mẫu điện thoại được nâng cấp mạnh về khả năng chụp ảnh nhờ camera 200 MP cũng như hiệu năng vô đối với con chip Snapdragon 8 Gen 2.', 'VN', 'product_img/samsung-galaxy-s23-ultra.jpg', 5, 23),
(54, 'Laptop Apple MacBook Air M1 2020', 30, 500, 'MacBook Air M1 2020 sở hữu thiết kế sang trọng nhỏ gọn có thể dễ dàng mang theo bên mình. Cấu hình máy với hiệu năng xử lý nhanh, đạt hiệu quả cao với chip Apple M1 mới, sẽ là trợ thủ đắc lực hỗ trợ bạn tốt trong mọi công việc.', 'VN', 'product_img/macbook-air-m1-2020.jpg', 6, 24),
(55, 'Laptop Lenovo IdeaPad 1', 40, 499, 'Với cấu hình mạnh mẽ và thiết kế thanh lịch, chiếc laptop Lenovo IdeaPad 1 15AMN7 R5 (82VG0061VN) sẽ đáp ứng đầy đủ các tiêu chí khi bạn chọn mua laptop học tập - văn phòng. Đây cũng là mẫu laptop đầu tiên trang bị CPU AMD 7000 series mới nhất tại Điện máy XANH.', 'VN', 'product_img/vi-vn-lenovo-ideapad-1.jpg', 6, 24),
(56, 'Laptop HP 15s fq2716TU', 30, 449, 'Laptop HP 15s fq2716TU i3 (7C0X3PA) có thể đáp ứng hoàn hảo các tác vụ thường dùng của người dùng sinh viên hay nhân viên văn phòng, thậm chí còn có thể thiết kế đồ họa cơ bản. Một chiếc laptop học tập - văn phòng đáng để bạn cân nhắc trong phân khúc giá rẻ.', 'NA', 'product_img/Laptop_HP_15s_fq2716TU.jpg', 3, 24),
(57, 'Laptop Asus Vivobook X415EA', 40, 489, 'Laptop Asus Vivobook X415EA i3 (EK2034W) sở hữu vẻ ngoài hiện đại, kiểu dáng nhỏ gọn, cấu hình ổn định, xử lý các tác vụ văn phòng mượt mà với con chip Intel Core thế hệ 11, lựa chọn phù hợp cho dân văn phòng, học sinh, sinh viên.', 'VN', 'product_img/Laptop_Asus_Vivobook_X415EA.jpg', 3, 24),
(58, 'Laptop itel SPIRIT', 40, 449, 'Laptop Itel Spirit 1 i3 (71006300035) sở hữu thiết kế đơn giản, hiệu năng ổn định giúp xử lý tốt các công việc văn phòng với một mức giá vô cùng phải chăng.', 'NA', 'product_img/Laptop_itel_SPIRIT.jpg', 6, 24),
(59, 'Áo phông Nam Cotton', 34, 60, 'Tên sản phẩm: Áo phông cổ tròn Unisex cotton dập nổi chữ dolce quanh áo 		Xuất xứ: Việt Nam 		Chất liệu: Vải Cotton Premium 100% không nhăn không xù cao cấp siêu dày dặn, mềm mại, co dãn đàn hồi và thấm hút mồ hôi cực tốt 		Kích cỡ: S/M/L/XL (45- 75kg) 		Màu sắc: Đen, trắng 		Hoạ tiết: In nổi chữ quanh áo 		Phối đồ: Dễ phối với mọi loại quần jean, short, âu và tạo được điểm nhấn nổi bật, cá tính hơn hẳn mà không hề bị “rườm rà” hay “làm quá”', 'VN', 'product_img/Áo_phông_Nam_cotton.jpg', 4, 26),
(60, 'áo thun nam nữ tay lỡ unisex', 30, 49, 'Sản phẩm áo phông tay lỡ form rộng Pi fashion giống mô tả 90-100% tùy mẫu\\n 		Đảm bảo vải chất lượng vải cũng như hình in.<br> 		Áo được kiểm tra kĩ càng, doublecheck cẩn thận trước khi gói hàng giao cho Quý Khách<br> 		Hàng có sẵn, giao hàng ngay khi nhận được đơn <br> 		Chấp nhận đổi hàng khi size không vừa<br> 		Giao hàng trên toàn quốc<br>', 'VN', 'product_img/áo_thun_nam_nữ_tay_lỡ_unisex.jpg', 3, 26),
(61, 'Áo Crotop Tay Bồng', 26, 59, 'Set 2in1 về sẵn tại shop chất coton co dãn . Form <55kg mặc đẹp . Chất coton tàu hàng treo shop khách nha 		Lô này về siêu xịn mịn luôn ak . Áo trắng chất coton còn xám đen chất nỉ tăm cực xịn cho mùa thu này nha ạ', 'VN', 'product_img/Áo_Crotop_Tay_Bồng.jpg', 3, 26),
(62, 'Áo lông cừu cho bé', 47, 39, '- Tên sản phẩm: Áo lông cừu cho bé trai gái mùa đông, áo khoác trẻ em kèm mũ đẹp thời trang - Samy Kids 		- Thương hiệu: SAMY 		- Sản xuất tại Việt Nam. 		- Màu sắc: trắng 		- Phù hợp: Cho bé gái mặc ở nhà, đi chơi, đi học, hoạt động vui chơi... 		- Chất liệu: 100%  nỉ cotton cao cấp, thấm hút mồ hôi rất tốt, thoáng mát, bề mặt vải mịn, không xù, không gião', 'VN', 'product_img/Áo_lông_cừu_cho_bé.jpg', 3, 26),
(63, 'Đầm thun ngắn tay', 30, 55, '- Tên sản phẩm: Đầm thun ngắn tay dáng rộng in hình gấu dễ thương thời trang mùa hè Hàn Quốc cho bé gái - Samy Kids 		- Thương hiệu: SAMY 		- Sản xuất tại Việt Nam. 		- Màu sắc: Đỏ - Trắng 		- Phù hợp: Cho bé gái mặc ở nhà, đi chơi, đi học, hoạt động vui chơi... 		- Chất liệu: 100% Cotton cao cấp, thấm hút mồ hôi rất tốt, thoáng mát, bề mặt vải mịn, không xù, không gião', 'VN', 'product_img/Đầm_thun_ngắn_tay.jpg', 3, 26),
(64, 'Giày adidas ORIGINALS HF2020', 40, 300, '- Có dây buộc 		- Thân dép bằng chất liệu tổng hợp 		- Đế đúc bằng cao su 		- SYNTHETICS', 'VN', 'product_img/Giày_adidas_ORIGINALS.jpg', 4, 27),
(65, 'Giày adidas ORIGINALS Nam Hu NMD', 40, 299, 'Through a shared vision of connectivity, adidas and Pharrell\'s ongoing collaboration continues to celebrate the diversity of humanity. The iconic Hu NMD Shoes exude fresh energy with bold colours and a graphic pop on the flexible adidas Primeknit upper. Boost cushioning brings comfort to every step. 		- Lace closure 		- adidas Primeknit textile upper 		- Boost midsole 		- Rubber outsole', 'NA', 'product_img/Giày_adidas_ORIGINALS_Nam_Hu_NMD.jpg', 3, 27),
(66, 'Giày adidas RUNNING Unisex Alphalava GX1191', 40, 249, 'Whether you\'re exploding onto the track, digging into a dead lift or pushing to peak energy in HIIT class, these adidas running shoes support your efforts. Boost cushioning gives you the energy to keep going, and the lightweight upper adds stability during high-intensity sessions.         - Lace closure         - Textile upper         - Boost midsole         - Textile lining', 'NA', 'product_img/Giày_adidas_RUNNING_Unisex_Alphalava_GX1191.jpg', 3, 27),
(67, 'Giày adidas GOLF Nam GV9674', 18, 289, 'Sản phẩm này có sử dụng thành phần tái chế từ rác thải sản xuất, chẳng hạn như vật liệu cắt bỏ, cũng như rác thải sinh hoạt sau tiêu dùng, nhằm giảm thiểu tác động môi trường do sử dụng thành phần nguyên sinh trong sản xuất.         - Có dây giày         - Thân giày bằng vải dệt chống thấm nước với lớp màng polyurethane phủ ngoài         - Lớp lót bằng vải dệt         - Đế giữa Bounce         - Đế ngoài Adiwear sáu đinh         - Rộng chiều ngang', 'VN', 'product_img/Giày_adidas_GOLF_Nam_GV9674.jpg', 3, 27),
(68, 'GIÀY THỂ THAO CHỮ N NB530', 40, 220, 'WERU Chuyên order tất cả các loại giày dép, quần áo, túi xách ulzzang,...         nhận tìm hàng qua hình ảnh          nhận thêm CTV toàn quốc         Không đổi trả dưới mọi hình thức trừ phi giao nhầm mẫu', 'VN', 'product_img/GIÀY_THỂ_THAO_CHỮ_N_NB530.jpg', 3, 27),
(69, 'Bộ 2 Nhẫn 925 Bằng Kim Loại', 17, 20, 'Tên sản phẩm: Bộ nhẫn đính kim cương nhân tạo         Kim loại: Bạc sterling 925         Loại đá chính: Kim cương/sapphire trắng nhân tạo         Màu sắc: Màu trắng         Kích thước nhẫn: US 4, 5, 6, 7, 8, 9, 10, 11', 'VN', 'product_img/Bộ_2_Nhẫn_925_Bằng_Kim_Loại.jpg', 3, 39),
(70, 'Moonlight Stone Bells Vòng đeo tay', 20, 30, 'Mô tả sản phẩm<br>Thiết kế, đẹp, thời trang và giản dị         Bao bì: Bao bì màng bong bóng độc lập         Lưu ý: Do sự khác biệt về ánh sáng và màn hình, màu sắc của mặt hàng có thể hơi khác so với hình ảnh, do đo lường thủ công, vui lòng cho phép chênh lệch 1-2mm.', 'VN', 'product_img/Moonlight_Stone_Bells_Vòng_đeo_tay.jpg', 3, 39),
(71, 'Set 7 Khuyên Tai Thời Trang', 12, 19, 'Tên sản phẩm: Hoa tai <br>         Chất liệu: hợp kim<br>         Dành cho: Bạn nữ<br>         Phong cách thời trang<br>         Màu sắc: như trong hình<br>         Kích thước: như trong hình<br>', 'VN', 'product_img/Set_7_Khuyên_Tai_Thời_Trang.jpg', 3, 39),
(72, 'Lắc tay nữ bạc S925', 30, 30, 'Sản phẩm lắc tay này được thiết kế với kiểu dáng đơn giản phong cách thanh lịch và rất xinh xắn.<br>         Chất liệu: Sản phẩm được thiết kế với chất liệu hợp kim cao cấp được bao phủ bên ngoài bề mặt bởi bạc s925 sáng bóng tạo nên một sản phẩm vô cùng tinh xảo và phù hợp xu hướng thời trang hiện nay.  <br>       Kích thước: lắc tay dài 17cm + 3.5cm dây nối điều chỉnh độ dài lắc         Trọng lượng: 20g <br>', 'VN', 'product_img/Lắc_tay_nữ_bạc_S925.jpg', 4, 39),
(73, 'Nhẫn Bạc nữ đính đá vương miện', 20, 50, '- Chất Liệu :  Bạc ta<br>      <br>   - Size : Mẫu này là nhẫn có size mn nha, mọi người đo size tay theo hướng dẫn!     <br>    - Kiểu Dáng : gắn đá cao cấp lấp lánh, thiết kế tinh tế sắc sảo, mẫu mã mới nhất theo Trend !', 'VN', 'product_img/Nhẫn_Bạc_nữ_đính_đá_vương_miện.jpg', 4, 39),
(74, 'mỹ phẩm chăm sóc da FENYI', 12, 45, 'Set 6 mỹ phẩm chăm sóc da FENYI chiết xuất trà xanh gồm sữa rửa mặt 50g, serum 17ml, kem dưỡng da mắt 15g, toner 100ml, lotion 100ml, nước dưỡng ẩm da mặt 40g phục hồi làm dịu da.', 'VN', 'product_img/mỹ_phẩm_chăm_sóc_da_FENYI.jpg', 5, 29),
(75, 'mỹ phẩm chăm sóc da LAIKOU', 12, 100, '<br>  Bộ 6 sản phẩm chăm sóc da Laikou Sakura làm mịn/ sáng/ sạch trẻ hóa làn da        <br> Thương hiệu: LAIKOU         <br>Thời hạn sử dụng: 3 năm         <br>Nguồn gốc: Trung Quốc          <br>Bảo quản: Để nơi thoáng mát', 'VN', 'product_img/mỹ_phẩm_chăm_sóc_da_LAIKOU.jpg', 4, 29),
(76, 'Nước dưỡng tóc tinh dầu bưởi', 12, 130, 'Nước dưỡng tóc tinh dầu bưởi pomelo thuần chay phiên bản nâng cấp là sản phẩm treatment dành cho tóc rụng, tóc yếu, tóc thưa mỏng và chậm phát triển. Bên cạnh các thành phần chủ đạo của phiên bản hiện tại, phiên bản nâng cấp được bổ sung thêm 2 hoạt chất là Baicapil và Bisabolol, mang đến giải pháp mạnh mẽ giải quyết tình trạng rụng tóc và tăng cường sự phát triển của mái tóc.', 'VN', 'product_img/Nước_dưỡng_tóc_tinh_dầu_bưởi.jpg', 5, 30),
(77, 'Tinh Dầu Moroccan Collagen', 12, 109, 'Đặc điểm:        <br> 1 、 Nuôi dưỡng, xây dựng lại và phục hồi tóc, phục hồi độ đàn hồi của tóc,        <br> 2 、 Cải thiện lưu thông chất dinh dưỡng của da đầu,        <br> 3 、 Làm cho tóc của bạn sáng bóng và mịn,         <br> 4 、 Tăng kích thước rễ để giúp ngăn ngừa gãy rụng.', 'VN', 'product_img/Tinh_Dầu_Moroccan_Collagen.jpg', 5, 30),
(78, 'Bộ đồ thể thao LOCO FISH', 12, 89, '<br>  Danh mục sản phẩm: Bộ đồ       <br>   Chức năng: Khô nhanh       <br>   Dành cho: Nữ       <br>   Chất vải: Sữa vụn', 'VN', 'product_img/Bộ_đồ_thể_thao_LOCO_FISH.jpg', 5, 32),
(79, 'QUẦN THỂ THAO NAM', 12, 49, '<br>    Quần Short Thể Thao 2 Lớp       <br>   Chất Liệu: Lớp ngoài vải dù mịn, Lớp trong Thun Lạnh 4 Chiều lỗ kim cực mịn, thấm hút tốt      <br>   Thích hợp tập gym, thiết kế lớp bên trong ôm đùi.      <br>   2 túi khóa xịn, dây cột bên trong.      <br>   Độ dài 33CM', 'NA', 'product_img/QUẦN_THỂ_THAO_NAM.jpg', 5, 32),
(80, 'M47 - BỘ ARSENAL', 21, 99, '- Chất Liệu: Thun Lạnh thể thao, thấm hút mồ hôi tốt, độ co giãn cực tốt. In ép công nghệ 3D hiện đại,màu sắc luôn tươi mới, Sử dụng mực INTECK Hàn Quốc lành tính với tất cả làn da nhạy cảm nhất', 'VN', 'product_img/M47_-_BỘ_ARSENAL.jpg', 5, 32),
(81, 'Lều Cắm Trại Mông Cổ MOUNTAINHIKER', 33, 400, '<br>  -Thương hiệu: MOUNTAINHIKER        <br> -Chất liệu: Vải sợi cotton pha, lưới polyester, khóa YKK, vải PVC         <br> -Màu sắc: vàng cát', 'MC', 'product_img/Lều_Cắm_Trại_Mông_Cổ_MOUNTAINHIKER.jpg', 6, 33),
(82, 'ĐỒ DÙNG ĐI PHƯỢT CHO GIA ĐÌNH', 21, 100, '- Kích thước: 200x150x110 (cm).       <br>  - Lều được làm bằng chất vải chống nước cao cấp rất bền theo thời gian.      <br>   - Đặc biệt lều có khả năng tránh mưa, sương mù và bảo vệ khỏi côn trùng cắn.      <br>   - Khung lều làm bằng hợp kim thép không gỉ có độ dẻo dai, đường chỉ may chắc chắn.       <br>  - Thiết kế nhỏ gọn, phù hợp với 2-3 người, có túi xách giúp bạn dễ dàng mang theo.       <br>  - Các bạn có thể hoàn toàn yên tâm khi cắm trại trong bất cứ điều kiện thời tiết nào.', 'VN', 'product_img/ĐỒ_DÙNG_ĐI_PHƯỢT_CHO_GIA_ĐÌNH.jpg', 6, 33),
(83, 'Giá Treo Đồ Cắm Trại Picnic', 21, 99, 'Sản phẩm Giá Treo Đồ Cắm Trại Picnic Giã Ngoại Gỗ Thông Gấp Gọn được ANNHIME STUDIO NHẬP KHẨU CHÍNH NGẠCH,từng sản phẩm được TỰ CHỤP-QUAY VIDEO để khách yên tâm lựa chọn, nếu ảnh bị vỡ nét do tiêu chuẩn shopee mời inbox shop để xem thêm nhé.', 'VN', 'product_img/Giá_Treo_Đồ_Cắm_Trại_Picnic.jpg', 6, 33),
(84, 'Đồ Chơi B.Brand Thú Nhún Hà Mã', 12, 30, 'Đồ chơi thú nhúng - Hà mã đáng yêu B.BRAND  BX2127Z    <br> Được làm từ nhựa cao cấp, siêu mềm    <br> Có ống bơm đi kèm sản phẩm   <br>  Có thể xì hơi, và bơm lại dễ dàng, thuận tiện đem theo khắp nơi    <br> Giúp bé phát triển kỹ năng vận động thô và cân bằng', 'VN', 'product_img/Đồ_Chơi_B.Brand_Thú_Nhún_Hà_Mã.jpg', 4, 34),
(85, 'Đồ chơi giảm stress Khỉ Đột', 23, 12, '<br> Thông Tin Sản PHẩm:    <br> Đồ chơi Khỉ đột King Kong    <br>  -  gồm 2 loại 250g và 450g    <br> - Khỉ đột King Kong Dẻo bóp mềm,bên trong là cát sạch có thể  co dãn đàn hồi ngộ nghĩnh giải tỏa căng thẳng công việc văn phòng...    <br> - Hàng Silicon chất lượng cao bao rách bao bền', 'VN', 'product_img/Đồ_chơi_giảm_stress_Khỉ_Đột.jpg', 4, 34),
(86, 'Bộ Đồ Chơi Nhà Bếp Mini Cho Bé', 12, 19, '<br>  Thông tin sản phẩm  <br> Tên sản phẩm: Ngôi nhà chơi Mini  <br> Chất liệu sản phẩm: Nhựa  <br> Tính năng sản phẩm: Nhà bếp nhỏ Mini thực sự, Vì vậy trẻ em có thể bắt chước Hoạt động của nhà bếp, hành động ma sát, đối chiếu và thú vị với đặc tính tư duy của trẻ. Nhiều loại thành phần mô phỏng hoạt hình khác nhau, hình dạng dễ thương Và Màu Sắc Sáng, Đủ Thu Thuật Sự Tâm Thoại Của Bé, Có Thể Tăng thêm Vui Vẻ Khi Chơi Game.', 'VN', 'product_img/Bộ_Đồ_Chơi_Nhà_Bếp_Mini_Cho_Bé.jpg', 4, 34),
(87, 'Không diệt không sinh đừng sợ hãi', 12, 50, 'Nhiều người trong chúng ta tin rằng cuộc đời của ta bắt đầu từ lúc chào đời và kết thúc khi ta chết. Chúng ta tin rằng chúng ta tới từ cái Không, nên khi chết chúng ta cũng không còn lại gì hết. Và chúng ta lo lắng vì sẽ trở thành hư vô.', 'VN', 'product_img/Sách_-_Không_diệt_không_sinh_đừng_sợ_hãi.jpg', 5, 36),
(88, 'Sách - Vòng Đời (Life Cycles)', 32, 60, '<br>  Tác giả: Dan Derek Harvey        <br> Nhà phát hành : ZenBooks        <br> NXB : Dân Trí         <br>Số trang: 143         <br>Năm phát hành: 2022', 'VN', 'product_img/Sách_-_Vòng_Đời_Life_Cycles.jpg', 5, 36),
(89, 'Sách - Pnin - Vladimir Nabokov', 20, 39, 'Mặc dù người ta luôn nhớ đến Lolita khi nghĩ về Vladimir Nabokov, tuy nhiên chính Pnin – một tiểu thuyết được xuất bản vào năm 1957, đúng sáu mươi năm trước – mới là tác phẩm khiến ông trở thành nhà văn nổi tiếng ở Mỹ. Ngay tuần thứ hai sau khi ra mắt, Pnin đã được tái bản, và tác giả của nó được tạp chí Newsweekđánh giá là ‘một trong các nhà văn tinh tế nhất, hài hước nhất, cảm động nhất nước Mỹ ngày nay’. Pnin cũng được đề cử tranh giải National Book Award for Fiction năm 1958, và sau này nó luôn được đánh giá như một trong các tiểu thuyết hay nhất của nhà văn Mỹ gốc Nga vĩ đại này.', 'VN', 'product_img/Sách_-_Pnin_-_Vladimir_Nabokov.jpg', 5, 36),
(90, 'Truyện tranh - DR. STONE', 12, 30, 'Senku và Dr. Xeno, hai nhà khoa học mạnh nhất thế giới đá đã hợp tác để xác định nguồn phát         sinh của sự kiện hóa đá nhân loại!! Tránh khỏi nanh vuốt của Stanley, kẻ đang ráo riết truy đuổi         khắp đại dương và lục địa Nam Mĩ, họ sẽ đến gần với bí mật của “khởi đầu”!!', 'VN', 'product_img/Truyện_tranh_-_DR._STONE.jpg', 5, 37),
(91, 'Sách - Combo Conan - 20 quyển', 12, 100, 'Mở đầu câu truyện, cậu học sinh trung học 17 tuổi Shinichi Kudo bị biến thành cậu bé Conan Edogawa. Shinichi trong phần đầu của Thám tử lừng danh Conan được miêu tả là một thám tử học đường xuất sắc. Trong một lần đi chơi công viên \"Miền Nhiệt đới\" với cô bạn từ thuở nhỏ Ran Mori, cậu tình cờ chứng kiến vụ một án giết người, Kishida - một hành khách trong trò chơi Chuyến tàu tốc hành đã bị giết một cách dã man. Cậu đã giúp cảnh sát làm sáng tỏ vụ án. Trên đường về nhà, cậu vô tình phát hiện một vụ làm ăn mờ ám của những người đàn ông mặc toàn đồ đen. Khi chúng phát hiện ra cậu, Shinichi đã bị đánh ngất đi. Sau đó những người đàn ông áo đen đó đã cho cậu uống một thứ thuốc độc chưa qua thử nghiệm là Apotoxin-4869 (APTX 4869) với mục đích thủ tiêu cậu. Tuy nhiên chất độc đã không giết chết Kudo. Khi tỉnh lại, cậu bàng hoàng nhận thấy mình đã bị teo nhỏ lại thành hình dạng của một cậu học sinh tiểu học.', 'JP', 'product_img/Sách_-_Combo_Conan_-_20_quyển.jpg', 5, 37),
(92, 'Truyện tranh - Bộ 10 cuốn Doraemon', 12, 100, 'Trong bộ truyện Doraemon, ta thấy có không ít những mẩu truyện khiến cho ta cảm động và nhận ra rằng thiên nhiên, sinh mệnh một con người hay bạn bè đều là những điều ta đáng phải trân trọng. Chính những thông điệp đầy ý nghĩa từ chú mèo máy Doraemon hiền lành, tốt bụng và các bạn đã chạm tới trái tim của các bạn độc giả một cách nhẹ nhàng, tinh tế', 'JP', 'product_img/Truyện_tranh_-_Bộ_10_cuốn_Doraemon.jpg', 5, 37),
(93, 'Sách - Colorful (Light Novel)', 45, 45, 'TOP 100 BEST SELLER - Có một người phạm tội nặng, chết đi không được luân hồi. Nhưng trong lúc linh hồn người này đang mất trí nhớ và trôi nổi vô định về một nơi tối tăm xứng đáng với cậu ta, thì một thiên sứ cánh trắng xuất hiện, giơ tay chặn lại, thông báo rằng cậu vừa trúng phiên xổ số may mắn của thiên đình, nhận được cơ hội tu hành kiêm tái thử thách. Theo đó, hồn cậu sẽ quay về trần gian, nhập vào xác một người vừa tự sát, ở trọ nhà người ta, nếm trải nhân tình thế thái và xử lý đống hỗn độn mà họ để lại. Mức độ hỗn độn tương đương với mức độ tội lỗi cậu phạm phải trong kiếp trước. Nếu việc tu hành diễn ra thuận lợi, ký ức kiếp trước sẽ dần dần quay về. Giây phút nhớ được tội lỗi mình đã gây ra cũng là lúc kết thúc quá trình ở trọ.', 'JP', 'product_img/Sách_-_Colorful_Light_Novel.jpg', 5, 38),
(94, 'Sách Phù Thùy Trắng Định Tội Tập 1', 34, 40, 'Giới thiệu nội dung: Phù thủy trắng định tội là light novel nói về cô phù thủy nhỏ được tìm thấy tuy nhiên cô lại chẳng hề hay có ký ức gì về mình cả . Cùng với đó là biết bao nguy hiểm và âu lo đang rình rập cô chờ đợi một thời cơ sẵn sàng ra tay với người mang danh sức mạnh phép thuật . Cuộc hành trình tìm lại ký ức cùng phép thuật của mình sẽ đem bạn đến một thế giới đầy rẫy những ảo ảnh trù phú những bài ca mơ màng cùng các trận chiến đầy gay go và hồi hộp . Chắc hẳn bạn sẽ không nỡ bỏ qua một cuốn sách với chiếc bìa in hình của cô nàng phù thủy này đâu nha . Hãy cùng cô ấy khám phá những câu chuyện phía sau trang giấy ấy nào , một cuộc phiêu lưu mới đang chờ đón bạn ở đây.', 'JP', 'product_img/Sách_Phù_Thùy_Trắng_Định_Tội_Tập_1.jpg', 5, 38),
(95, 'Chuyện tình thanh xuân bi hài của tôi quả nhiên là sai lầm', 12, 50, 'Đây là quyển sách viết về cuộc đời của cậu học sinh mắt cá chết và bạn bè của cậu.', 'JP', 'product_img/Sách_Chuyện_tình_thanh_xuân_bi_hài_của_tôi_quả_nhiên_là_sai_lầm_-_Tập_14.5.jpg', 5, 38);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_user`
--
ALTER TABLE `accounts_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_groups_user_id_group_id_59c0b32f_uniq` (`user_id`,`group_id`),
  ADD KEY `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accounts_user_user_permi_user_id_permission_id_2ab516c2_uniq` (`user_id`,`permission_id`),
  ADD KEY `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_cart_product_id_id_98f4df5a_fk_products_product_id` (`product_id_id`),
  ADD KEY `cart_cart_user_id_id_13cd7a13_fk_accounts_user_id` (`user_id_id`);

--
-- Indexes for table `cart_order`
--
ALTER TABLE `cart_order`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_orderdetail_order_id_id_0ac83fa8_fk_cart_order_id` (`order_id_id`);

--
-- Indexes for table `comments_comment`
--
ALTER TABLE `comments_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_comment_product_id_id_046d9c87_fk_products_product_id` (`product_id_id`),
  ADD KEY `comments_comment_user_id_id_ea2cabd6_fk_accounts_user_id` (`user_id_id`);

--
-- Indexes for table `comments_like`
--
ALTER TABLE `comments_like`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_like_user_id_id_b5103211_fk_accounts_user_id` (`user_id_id`),
  ADD KEY `comments_like_comment_id_id_7d229c38_fk_comments_comment_id` (`comment_id_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_accounts_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `products_category`
--
ALTER TABLE `products_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_category_parent_id_3388f6c9` (`parent_id`),
  ADD KEY `products_category_tree_id_7d9b3ae8` (`tree_id`);

--
-- Indexes for table `products_product`
--
ALTER TABLE `products_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_product_user_id_id_a332fd0f_fk_accounts_user_id` (`user_id_id`),
  ADD KEY `category_id_id` (`category_id_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_user`
--
ALTER TABLE `accounts_user`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT for table `cart_cart`
--
ALTER TABLE `cart_cart`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=158;

--
-- AUTO_INCREMENT for table `cart_order`
--
ALTER TABLE `cart_order`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `comments_comment`
--
ALTER TABLE `comments_comment`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=273;

--
-- AUTO_INCREMENT for table `comments_like`
--
ALTER TABLE `comments_like`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `products_category`
--
ALTER TABLE `products_category`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products_product`
--
ALTER TABLE `products_product`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts_user_groups`
--
ALTER TABLE `accounts_user_groups`
  ADD CONSTRAINT `accounts_user_groups_group_id_bd11a704_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `accounts_user_groups_user_id_52b62117_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `accounts_user_user_permissions`
--
ALTER TABLE `accounts_user_user_permissions`
  ADD CONSTRAINT `accounts_user_user_p_permission_id_113bb443_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `accounts_user_user_p_user_id_e4f0a161_fk_accounts_` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `cart_cart`
--
ALTER TABLE `cart_cart`
  ADD CONSTRAINT `cart_cart_product_id_id_98f4df5a_fk_products_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `cart_cart_user_id_id_13cd7a13_fk_accounts_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `cart_orderdetail`
--
ALTER TABLE `cart_orderdetail`
  ADD CONSTRAINT `cart_orderdetail_order_id_id_0ac83fa8_fk_cart_order_id` FOREIGN KEY (`order_id_id`) REFERENCES `cart_order` (`id`);

--
-- Constraints for table `comments_comment`
--
ALTER TABLE `comments_comment`
  ADD CONSTRAINT `comments_comment_product_id_id_046d9c87_fk_products_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `products_product` (`id`),
  ADD CONSTRAINT `comments_comment_user_id_id_ea2cabd6_fk_accounts_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `comments_like`
--
ALTER TABLE `comments_like`
  ADD CONSTRAINT `comments_like_comment_id_id_7d229c38_fk_comments_comment_id` FOREIGN KEY (`comment_id_id`) REFERENCES `comments_comment` (`id`),
  ADD CONSTRAINT `comments_like_user_id_id_b5103211_fk_accounts_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`);

--
-- Constraints for table `products_category`
--
ALTER TABLE `products_category`
  ADD CONSTRAINT `products_category_parent_id_3388f6c9_fk_products_category_id` FOREIGN KEY (`parent_id`) REFERENCES `products_category` (`id`);

--
-- Constraints for table `products_product`
--
ALTER TABLE `products_product`
  ADD CONSTRAINT `products_product_ibfk_1` FOREIGN KEY (`category_id_id`) REFERENCES `products_category` (`id`),
  ADD CONSTRAINT `products_product_user_id_id_a332fd0f_fk_accounts_user_id` FOREIGN KEY (`user_id_id`) REFERENCES `accounts_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
