-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 15, 2026 at 12:54 PM
-- Server version: 8.0.36-28
-- PHP Version: 8.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `listify`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `features` varchar(255) DEFAULT NULL,
  `version` float DEFAULT NULL,
  `unique_identifier` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `purchase_code` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `addons`
--

INSERT INTO `addons` (`id`, `title`, `parent_id`, `features`, `version`, `unique_identifier`, `status`, `created_at`, `updated_at`, `purchase_code`) VALUES
(1, 'Shop', NULL, 'E-commerce', 1, 'shop', 1, NULL, '2025-08-14 09:53:56', NULL),
(2, 'Form Builder', NULL, 'Form Builder', 1, 'form_builder', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `amenities`
--

CREATE TABLE `amenities` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent` int DEFAULT NULL,
  `rating` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `amenities`
--

INSERT INTO `amenities` (`id`, `user_id`, `name`, `icon`, `type`, `identifier`, `parent`, `rating`, `image`, `designation`, `time`, `price`, `created_at`, `updated_at`, `type_id`) VALUES
(1, NULL, 'Parking Near Office', NULL, 'it-services', 'feature', NULL, NULL, 'uploads/amenities/1754493073_cd07091f1c14927cf97931a3cbaf331a.jpg', NULL, NULL, NULL, '2025-08-06 09:16:00', '2026-06-26 06:02:59', 28),
(2, NULL, 'Airconditioned Environment', NULL, 'it-services', 'feature', NULL, NULL, 'uploads/amenities/1754493088_images.png', NULL, NULL, NULL, '2025-08-06 09:20:34', '2026-06-26 06:02:59', 28),
(3, NULL, 'Courtesies Staff', NULL, 'it-services', 'feature', NULL, NULL, 'uploads/amenities/1754493100_staff-icon-vector-12638697.jpg', NULL, NULL, NULL, '2025-08-06 09:21:16', '2026-06-26 06:02:59', 28),
(4, NULL, 'Nearby Restaurant', NULL, 'it-services', 'feature', NULL, NULL, 'uploads/amenities/1754493201_154-1542117_fork-and-plate-icon-free-hotel-restaurant-icons-png.png', NULL, NULL, NULL, '2025-08-06 15:13:21', '2026-06-26 06:02:59', 28),
(5, NULL, 'Nearby Printing Services', NULL, 'it-services', 'feature', NULL, NULL, 'uploads/amenities/1754493331_94-945959_printer-7-icons-print-icon-vector-png.png', NULL, NULL, NULL, '2025-08-06 15:15:31', '2026-06-26 06:02:59', 28),
(8, NULL, 'Financial planning', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968483_financial planning..png', NULL, NULL, NULL, '2025-09-04 06:48:03', '2026-06-26 06:19:57', 23),
(9, NULL, 'High security', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968541_High end secruity.png', NULL, NULL, NULL, '2025-09-04 06:49:01', '2026-06-26 06:19:57', 23),
(10, NULL, 'Increase risk', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968574_increases risk.png', NULL, NULL, NULL, '2025-09-04 06:49:34', '2026-06-26 06:19:57', 23),
(11, NULL, 'Swing trade', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968594_swing-trading.png', NULL, NULL, NULL, '2025-09-04 06:49:54', '2026-06-26 06:19:57', 23),
(12, NULL, 'Strategy Sharing', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968637_strategy sharing..png', NULL, NULL, NULL, '2025-09-04 06:50:37', '2026-06-26 06:19:57', 23),
(13, NULL, 'Monitoring the market', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968666_monitoring the market..png', NULL, NULL, NULL, '2025-09-04 06:51:06', '2026-06-26 06:19:57', 23),
(14, NULL, 'Stock market', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968689_stock-market.png', NULL, NULL, NULL, '2025-09-04 06:51:29', '2026-06-26 06:19:57', 23),
(15, NULL, 'Manage risk', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968723_manage risk..png', NULL, NULL, NULL, '2025-09-04 06:52:03', '2026-06-26 06:19:57', 23),
(17, NULL, 'Operate 24/7', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968768_operate 24-7.png', NULL, NULL, NULL, '2025-09-04 06:52:48', '2026-06-26 06:19:57', 23),
(18, NULL, 'Passive participation', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968799_passive participation..png', NULL, NULL, NULL, '2025-09-04 06:53:19', '2026-06-26 06:19:57', 23),
(19, NULL, 'Customer support', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968828_Customer Support.png', NULL, NULL, NULL, '2025-09-04 06:53:48', '2026-06-26 06:19:57', 23),
(20, NULL, 'Automate Strategies', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968886_automate strategies..png', NULL, NULL, NULL, '2025-09-04 06:54:46', '2026-06-26 06:19:57', 23),
(21, NULL, 'Real time charts', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968910_real-time charts.png', NULL, NULL, NULL, '2025-09-04 06:55:10', '2026-06-26 06:19:57', 23),
(22, NULL, 'Forex', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968928_forex.png', NULL, NULL, NULL, '2025-09-04 06:55:28', '2026-06-26 06:19:57', 23),
(23, NULL, 'Global Economic Trends', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756968968_global economic trends..png', NULL, NULL, NULL, '2025-09-04 06:56:08', '2026-06-26 06:19:57', 23),
(24, NULL, 'Tutorial , webinars and demo account', NULL, 'trading', 'feature', NULL, NULL, 'uploads/amenities/1756969102_tutorials, webinars, and demo accounts..png', NULL, NULL, NULL, '2025-09-04 06:58:22', '2026-06-26 06:19:57', 23),
(25, NULL, '24/7 surveillance', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969161_247 surveillance.png', NULL, NULL, NULL, '2025-09-04 06:59:21', '2026-06-26 06:06:52', 31),
(26, NULL, 'Cafeteria', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969179_cafeteria.png', NULL, NULL, NULL, '2025-09-04 06:59:39', '2026-06-26 06:06:52', 31),
(27, NULL, 'Computer lab', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969194_computer lab.png', NULL, NULL, NULL, '2025-09-04 06:59:54', '2026-06-26 06:06:52', 31),
(28, NULL, 'E-learning Platform', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969221_E-learning Platforms.png', NULL, NULL, NULL, '2025-09-04 07:00:21', '2026-06-26 06:06:52', 31),
(29, NULL, 'Emergency Services', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969246_emergency services.png', NULL, NULL, NULL, '2025-09-04 07:00:46', '2026-06-26 06:06:52', 31),
(30, NULL, 'Laboratories', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969275_Laboratories.png', NULL, NULL, NULL, '2025-09-04 07:01:15', '2026-06-26 06:06:52', 31),
(31, NULL, 'Libraries', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969293_Libraries.png', NULL, NULL, NULL, '2025-09-04 07:01:33', '2026-06-26 06:06:52', 31),
(32, NULL, 'Private Study Rooms', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969317_Private Study Rooms.png', NULL, NULL, NULL, '2025-09-04 07:01:57', '2026-06-26 06:06:52', 31),
(33, NULL, 'Resource Centers', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969347_Resource Centers.png', NULL, NULL, NULL, '2025-09-04 07:02:27', '2026-06-26 06:06:52', 31),
(34, NULL, 'Free wifi', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969367_wifi.png', NULL, NULL, NULL, '2025-09-04 07:02:47', '2026-06-26 06:06:52', 31),
(35, NULL, 'Fitness Center', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969389_Fitness Centers.png', NULL, NULL, NULL, '2025-09-04 07:03:09', '2026-06-26 06:06:52', 31),
(36, NULL, 'Gymnasium', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969409_Gymnasium.png', NULL, NULL, NULL, '2025-09-04 07:03:29', '2026-06-26 06:06:52', 31),
(37, NULL, 'Coaching Staff', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969490_Coaching Staff.png', NULL, NULL, NULL, '2025-09-04 07:04:50', '2026-06-26 06:06:52', 31),
(38, NULL, 'Indoor games', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969509_indoor game.png', NULL, NULL, NULL, '2025-09-04 07:05:09', '2026-06-26 06:06:52', 31),
(39, NULL, 'Outdoors Games', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969527_Outdoor game.png', NULL, NULL, NULL, '2025-09-04 07:05:27', '2026-06-26 06:06:52', 31),
(40, NULL, 'Study desks', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969637_study desks.png', NULL, NULL, NULL, '2025-09-04 07:07:17', '2026-06-26 06:06:52', 31),
(41, NULL, 'Gaming Zones', NULL, 'academies', 'feature', NULL, NULL, 'uploads/amenities/1756969651_game zones,.png', NULL, NULL, NULL, '2025-09-04 07:07:31', '2026-06-26 06:06:52', 31),
(42, NULL, 'Biometric Security', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756969787_biometric security.png', NULL, NULL, NULL, '2025-09-04 07:09:47', '2026-06-26 06:01:05', 29),
(43, NULL, 'Certification Programs', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756969820_certification programs.png', NULL, NULL, NULL, '2025-09-04 07:10:20', '2026-06-26 06:01:05', 29),
(44, NULL, 'Climate control', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756969839_climate control.png', NULL, NULL, NULL, '2025-09-04 07:10:39', '2026-06-26 06:01:05', 29),
(45, NULL, 'Cloud Based data management', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756969883_Cloud-based data management.png', NULL, NULL, NULL, '2025-09-04 07:11:23', '2026-06-26 06:01:05', 29),
(46, NULL, 'Collaborative Meeting room', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756969923_collaborative meeting room.png', NULL, NULL, NULL, '2025-09-04 07:12:03', '2026-06-26 06:01:05', 29),
(47, NULL, 'CRM Platforms', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756969945_CRM platforms.png', NULL, NULL, NULL, '2025-09-04 07:12:25', '2026-06-26 06:01:05', 29),
(48, NULL, 'Digital Kiosks', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756969967_Digital kiosks.png', NULL, NULL, NULL, '2025-09-04 07:12:47', '2026-06-26 06:01:05', 29),
(49, NULL, 'Digital signage', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756969998_Digital signage.png', NULL, NULL, NULL, '2025-09-04 07:13:18', '2026-06-26 06:01:05', 29),
(50, NULL, 'Flexible Work Hours', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970028_Flexible work hours.png', NULL, NULL, NULL, '2025-09-04 07:13:48', '2026-06-26 06:01:05', 29),
(51, NULL, 'High speed internet', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970059_High-speed internet.png', NULL, NULL, NULL, '2025-09-04 07:14:19', '2026-06-26 06:01:05', 29),
(52, NULL, 'Hybrid Work Setups', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970089_hybrid work setups.png', NULL, NULL, NULL, '2025-09-04 07:14:49', '2026-06-26 06:01:05', 29),
(53, NULL, 'Infrastructure', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970110_infrastructure.png', NULL, NULL, NULL, '2025-09-04 07:15:10', '2026-06-26 06:01:05', 29),
(54, NULL, 'Innovation labs', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970140_Innovation labs.png', NULL, NULL, NULL, '2025-09-04 07:15:40', '2026-06-26 06:01:05', 29),
(55, NULL, 'Interactive Maps', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970158_interactive maps.png', NULL, NULL, NULL, '2025-09-04 07:15:58', '2026-06-26 06:01:05', 29),
(56, NULL, 'Multilingual support', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970185_Multilingual support.png', NULL, NULL, NULL, '2025-09-04 07:16:25', '2026-06-26 06:01:05', 29),
(57, NULL, 'On site Gym', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970214_On-site gym.png', NULL, NULL, NULL, '2025-09-04 07:16:54', '2026-06-26 06:01:05', 29),
(58, NULL, 'Car Parking', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970237_parked-car.png', NULL, NULL, NULL, '2025-09-04 07:17:17', '2026-06-26 06:01:05', 29),
(59, NULL, 'Quiet zone', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970260_quiet zones.png', NULL, NULL, NULL, '2025-09-04 07:17:40', '2026-06-26 06:01:05', 29),
(60, NULL, 'Refreshment', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970279_refreshments.png', NULL, NULL, NULL, '2025-09-04 07:17:59', '2026-06-26 06:01:05', 29),
(61, NULL, 'Secure networks', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970303_secure networks.png', NULL, NULL, NULL, '2025-09-04 07:18:23', '2026-06-26 06:01:05', 29),
(62, NULL, 'Server rooms', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970323_Server rooms.png', NULL, NULL, NULL, '2025-09-04 07:18:43', '2026-06-26 06:01:05', 29),
(63, NULL, 'Smart Access System', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970374_Smart access systems.png', NULL, NULL, NULL, '2025-09-04 07:19:34', '2026-06-26 06:01:05', 29),
(64, NULL, 'Workplace comfort', NULL, 'agencies', 'feature', NULL, NULL, 'uploads/amenities/1756970401_Workplace Comfort.png', NULL, NULL, NULL, '2025-09-04 07:20:01', '2026-06-26 06:01:05', 29),
(65, NULL, 'High speed internet', NULL, 'it-services', 'feature', NULL, NULL, 'uploads/amenities/1756970453_High-speed internet.png', NULL, NULL, NULL, '2025-09-04 07:20:53', '2026-06-26 06:02:59', 28),
(66, NULL, 'Cyber security service', NULL, 'it-services', 'feature', NULL, NULL, 'uploads/amenities/1756970505_Cybersecurity services.png', NULL, NULL, NULL, '2025-09-04 07:21:45', '2026-06-26 06:02:59', 28),
(67, NULL, 'Using Advanced Machinery', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756970574_Advanced Machinery.png', NULL, NULL, NULL, '2025-09-04 07:22:54', '2026-06-26 06:06:07', 27),
(68, NULL, 'Biometric Entry', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756970595_biometric entry.png', NULL, NULL, NULL, '2025-09-04 07:23:15', '2026-06-26 06:06:07', 27),
(69, NULL, 'Available Power backup system', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756970647_Power Backup Systems.png', NULL, NULL, NULL, '2025-09-04 07:24:07', '2026-06-26 06:06:07', 27),
(70, NULL, 'Warehouse available', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756970683_Warehousing.png', NULL, NULL, NULL, '2025-09-04 07:24:43', '2026-06-26 06:06:07', 27),
(71, NULL, 'CCTV Camera available', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756970737_cctv.png', NULL, NULL, NULL, '2025-09-04 07:25:37', '2026-06-26 06:06:07', 27),
(72, NULL, 'Fire safety system available', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756970766_Fire Safety Systems.png', NULL, NULL, NULL, '2025-09-04 07:26:06', '2026-06-26 06:06:07', 27),
(73, NULL, 'Workout area available', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756971255_Workout Facilities.png', NULL, NULL, NULL, '2025-09-04 07:34:15', '2026-06-26 06:06:07', 27),
(74, NULL, 'cafeteria nearby', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756971309_cafeteria.png', NULL, NULL, NULL, '2025-09-04 07:35:09', '2026-06-26 06:06:07', 27),
(75, NULL, 'First Aid facility', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756971463_first-aid centers.png', NULL, NULL, NULL, '2025-09-04 07:37:43', '2026-06-26 06:06:07', 27),
(76, NULL, '24/7 power supply', NULL, 'industrial', 'feature', NULL, NULL, 'uploads/amenities/1756971496_Continuous power supply.png', NULL, NULL, NULL, '2025-09-04 07:38:16', '2026-06-26 06:06:07', 27),
(77, NULL, 'Advance printing machine available', NULL, 'corporate-gifting-and-printing-services', 'feature', NULL, NULL, 'uploads/amenities/1756971627_full-service printing.png', NULL, NULL, NULL, '2025-09-04 07:40:27', '2026-06-26 06:08:40', 26),
(78, NULL, 'Security available', NULL, 'corporate-gifting-and-printing-services', 'feature', NULL, NULL, 'uploads/amenities/1756971673_Security.png', NULL, NULL, NULL, '2025-09-04 07:41:13', '2026-06-26 06:08:40', 26),
(79, NULL, 'Bulk Order support', NULL, 'corporate-gifting-and-printing-services', 'feature', NULL, NULL, 'uploads/amenities/1756971702_Bulk Order Support.png', NULL, NULL, NULL, '2025-09-04 07:41:42', '2026-06-26 06:08:40', 26),
(80, NULL, 'Customization option Available', NULL, 'corporate-gifting-and-printing-services', 'feature', NULL, NULL, 'uploads/amenities/1756971741_Customization Options.png', NULL, NULL, NULL, '2025-09-04 07:42:21', '2026-06-26 06:08:40', 26),
(81, NULL, 'Free wifi available', NULL, 'corporate-gifting-and-printing-services', 'feature', NULL, NULL, 'uploads/amenities/1756971786_wifi.png', NULL, NULL, NULL, '2025-09-04 07:43:06', '2026-06-26 06:08:40', 26),
(82, NULL, 'Parking', NULL, 'corporate-gifting-and-printing-services', 'feature', NULL, NULL, 'uploads/amenities/1756971857_Valet parking.png', NULL, NULL, NULL, '2025-09-04 07:44:17', '2026-06-26 06:08:40', 26),
(83, NULL, 'Cafe nearby', NULL, 'recreation', 'feature', NULL, NULL, 'uploads/amenities/1756971895_Cafés.png', NULL, NULL, NULL, '2025-09-04 07:44:55', '2026-06-26 06:11:22', 25),
(84, NULL, 'Courts nearby', NULL, 'recreation', 'feature', NULL, NULL, 'uploads/amenities/1756971918_Courts and Fields.png', NULL, NULL, NULL, '2025-09-04 07:45:18', '2026-06-26 06:11:22', 25),
(85, NULL, 'specialized facilities available', NULL, 'recreation', 'feature', NULL, NULL, 'uploads/amenities/1756971961_Specialized Facilities.png', NULL, NULL, NULL, '2025-09-04 07:46:01', '2026-06-26 06:11:22', 25),
(86, NULL, 'gym and fitness center nearby', NULL, 'recreation', 'feature', NULL, NULL, 'uploads/amenities/1756972027_Fitness centers and gyms.png', NULL, NULL, NULL, '2025-09-04 07:47:07', '2026-06-26 06:11:22', 25),
(87, NULL, 'Air condition Environment', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972086_air-conditioner.png', NULL, NULL, NULL, '2025-09-04 07:48:06', '2025-09-04 09:50:11', NULL),
(88, NULL, 'Butler service available', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972114_butler service.png', NULL, NULL, NULL, '2025-09-04 07:48:34', '2025-09-04 07:48:34', NULL),
(89, NULL, 'Car rental service available', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972137_car rentals.png', NULL, NULL, NULL, '2025-09-04 07:48:57', '2025-09-04 07:48:57', NULL),
(90, NULL, 'Elevators available', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972181_elevators.png', NULL, NULL, NULL, '2025-09-04 07:49:41', '2025-09-04 09:50:31', NULL),
(91, NULL, 'Free wifi', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972198_free-wifi (1).png', NULL, NULL, NULL, '2025-09-04 07:49:58', '2025-09-04 07:49:58', NULL),
(92, NULL, 'Doctor on call available', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972222_doctor on call.png', NULL, NULL, NULL, '2025-09-04 07:50:22', '2025-09-04 07:50:22', NULL),
(93, NULL, 'Gym', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972613_Gym.png', NULL, NULL, NULL, '2025-09-04 07:56:53', '2025-09-04 07:57:08', NULL),
(94, NULL, 'Wheelchair Accessibility', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972706_Wheelchair accessibility.png', NULL, NULL, NULL, '2025-09-04 07:58:26', '2025-09-04 07:58:26', NULL),
(95, NULL, 'Security Staff available', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972749_security-staff.png', NULL, NULL, NULL, '2025-09-04 07:59:09', '2025-09-04 07:59:09', NULL),
(96, NULL, 'Swimming pool available', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756972806_Swimming pool.png', NULL, NULL, NULL, '2025-09-04 08:00:06', '2025-09-04 08:00:06', NULL),
(97, NULL, 'Security camera available', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756973062_security-camera.png', NULL, NULL, NULL, '2025-09-04 08:04:22', '2025-09-04 08:04:22', NULL),
(98, NULL, 'Weeding Hall Nearby', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756973103_wedding hall.png', NULL, NULL, NULL, '2025-09-04 08:05:03', '2025-09-04 08:05:03', NULL),
(99, NULL, 'Best view from room', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756973294_ocean.png', NULL, NULL, NULL, '2025-09-04 08:08:14', '2025-09-04 08:08:28', NULL),
(100, NULL, 'Massage service available', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756973351_massage services.png', NULL, NULL, NULL, '2025-09-04 08:09:11', '2025-09-04 09:50:55', NULL),
(101, NULL, 'Airport pickup and drop service free', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756973395_Airport transfers.png', NULL, NULL, NULL, '2025-09-04 08:09:55', '2025-09-04 08:09:55', NULL),
(102, NULL, 'Certified personal trainers', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756973487_Certified personal trainers.png', NULL, NULL, NULL, '2025-09-04 08:11:27', '2026-06-26 07:18:59', 20),
(103, NULL, 'stair climber available', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756973525_stair-climber.png', NULL, NULL, NULL, '2025-09-04 08:12:05', '2026-06-26 07:18:59', 20),
(104, NULL, 'Locker Rooms available', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756973577_Locker rooms,.png', NULL, NULL, NULL, '2025-09-04 08:12:57', '2026-06-26 07:18:59', 20),
(105, NULL, 'Zumba classes available', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756973609_Zumba class.png', NULL, NULL, NULL, '2025-09-04 08:13:29', '2026-06-26 07:18:59', 20),
(106, NULL, 'Medical assistance', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756973630_medical assistance.png', NULL, NULL, NULL, '2025-09-04 08:13:50', '2026-06-26 07:18:59', 20),
(107, NULL, 'Energy bar free', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756973661_energy bar free.png', NULL, NULL, NULL, '2025-09-04 08:14:21', '2026-06-26 07:18:59', 20),
(108, NULL, 'Physiotherapy support available', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756973711_physiotherapy support.png', NULL, NULL, NULL, '2025-09-04 08:15:11', '2026-06-26 07:18:59', 20),
(109, NULL, 'Showers service available', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756973742_showers.png', NULL, NULL, NULL, '2025-09-04 08:15:42', '2026-06-26 07:18:59', 20),
(110, NULL, 'New dumblee', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756977343_dumbbell.png', NULL, NULL, NULL, '2025-09-04 09:15:43', '2026-06-26 07:18:59', 20),
(111, NULL, 'Sports academies nearby', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756977382_Sports Academies.png', NULL, NULL, NULL, '2025-09-04 09:16:22', '2026-06-26 07:18:59', 20),
(112, NULL, 'new weightlifting benches', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756977429_Weightlifting benches.png', NULL, NULL, NULL, '2025-09-04 09:17:09', '2026-06-26 07:18:59', 20),
(113, NULL, 'Audio system available', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756977542_audio-system.png', NULL, NULL, NULL, '2025-09-04 09:19:02', '2026-06-26 07:18:59', 20),
(114, NULL, 'Audio system available', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756977543_audio-system.png', NULL, NULL, NULL, '2025-09-04 09:19:03', '2026-06-26 07:18:59', 20),
(115, NULL, 'Fully A/C facility', NULL, 'fitness', 'feature', NULL, NULL, 'uploads/amenities/1756977568_air-conditioner.png', NULL, NULL, NULL, '2025-09-04 09:19:28', '2026-06-26 07:18:59', 20),
(116, NULL, 'New self service kiosks', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756977700_Self-service kiosks.png', NULL, NULL, NULL, '2025-09-04 09:21:40', '2025-09-04 09:21:40', NULL),
(117, NULL, 'Buffet available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756977725_buffet.png', NULL, NULL, NULL, '2025-09-04 09:22:05', '2025-09-04 09:22:05', NULL),
(118, NULL, 'Home delivery available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756977752_home delivery.png', NULL, NULL, NULL, '2025-09-04 09:22:32', '2025-09-04 09:22:32', NULL),
(119, NULL, 'New vending machine available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756977785_vending-machine.png', NULL, NULL, NULL, '2025-09-04 09:23:05', '2025-09-04 09:23:05', NULL),
(120, NULL, 'Air Condition Environment', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756977809_air-conditioner.png', NULL, NULL, NULL, '2025-09-04 09:23:29', '2025-09-04 09:43:59', NULL),
(121, NULL, 'Security camera available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756977831_security-camera.png', NULL, NULL, NULL, '2025-09-04 09:23:51', '2025-09-04 09:23:51', NULL),
(122, NULL, 'Wifi  free service', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756977880_free-wifi (1).png', NULL, NULL, NULL, '2025-09-04 09:24:40', '2025-09-04 09:24:40', NULL),
(123, NULL, 'Mini bar available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756977901_minibar.png', NULL, NULL, NULL, '2025-09-04 09:25:01', '2025-09-04 09:25:01', NULL),
(124, NULL, 'Multi staff available for services', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756978046_group.png', NULL, NULL, NULL, '2025-09-04 09:27:26', '2025-09-04 09:27:39', NULL),
(125, NULL, 'Free car parking available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756978189_free-parking.png', NULL, NULL, NULL, '2025-09-04 09:29:49', '2025-09-04 09:29:49', NULL),
(126, NULL, 'Large sitting area available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756978354_restaurant (1).png', NULL, NULL, NULL, '2025-09-04 09:32:34', '2025-09-04 09:47:03', NULL),
(127, NULL, 'Lounge available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756978406_lounge.png', NULL, NULL, NULL, '2025-09-04 09:33:26', '2025-09-04 09:33:26', NULL),
(128, NULL, '100% fresh food available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756978456_Fresh items.png', NULL, NULL, NULL, '2025-09-04 09:34:16', '2025-09-04 09:34:16', NULL),
(129, NULL, 'Catered meals available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756978605_Catered Meals.png', NULL, NULL, NULL, '2025-09-04 09:36:45', '2025-09-04 09:36:45', NULL),
(130, NULL, 'Wifi service available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756978719_wifi (1).png', NULL, NULL, NULL, '2025-09-04 09:38:39', '2026-06-26 06:31:51', 21),
(131, NULL, 'Stream room available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756978748_steam-room.png', NULL, NULL, NULL, '2025-09-04 09:39:08', '2026-06-26 06:31:51', 21),
(132, NULL, 'Free coffee service available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756978782_free coffee.png', NULL, NULL, NULL, '2025-09-04 09:39:42', '2026-06-26 06:31:51', 21),
(133, NULL, 'Stream room available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756978979_steam-room.png', NULL, NULL, NULL, '2025-09-04 09:42:59', '2026-06-26 06:31:51', 21),
(134, NULL, 'Specialized facilities available', NULL, 'restaurant', 'feature', NULL, NULL, 'uploads/amenities/1756979190_Specialized Facilities.png', NULL, NULL, NULL, '2025-09-04 09:46:30', '2025-09-04 09:46:30', NULL),
(135, NULL, 'Room with  balcony view', NULL, 'hotel', 'feature', NULL, NULL, 'uploads/amenities/1756979332_Balconies view.png', NULL, NULL, NULL, '2025-09-04 09:48:52', '2025-09-04 09:51:09', NULL),
(136, NULL, 'A/c repair', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980014_AC repair.png', NULL, NULL, NULL, '2025-09-04 10:00:14', '2026-07-10 11:16:17', 24),
(137, NULL, 'Alloy wheel', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980049_alloy-wheel.png', NULL, NULL, NULL, '2025-09-04 10:00:49', '2026-07-10 11:16:17', 24),
(138, NULL, 'Car audio system available', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980080_Car audio systems.png', NULL, NULL, NULL, '2025-09-04 10:01:20', '2026-07-10 11:16:17', 24),
(139, NULL, 'Led for Headlight', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980127_car led lights.png', NULL, NULL, NULL, '2025-09-04 10:02:07', '2026-07-10 11:16:17', 24),
(140, NULL, 'Denting available', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980147_Denting.png', NULL, NULL, NULL, '2025-09-04 10:02:27', '2026-07-10 11:16:17', 24),
(141, NULL, 'Premium detailing available', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980203_detailing.png', NULL, NULL, NULL, '2025-09-04 10:03:23', '2026-07-10 11:16:17', 24),
(142, NULL, 'Free car wash', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980224_free  car washing.png', NULL, NULL, NULL, '2025-09-04 10:03:44', '2026-07-10 11:16:17', 24),
(143, NULL, 'Wheels alignment available', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980256_wheel-alignment.png', NULL, NULL, NULL, '2025-09-04 10:04:16', '2026-07-10 11:16:17', 24),
(144, NULL, 'Car body paint available', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980414_painting.png', NULL, NULL, NULL, '2025-09-04 10:06:54', '2026-07-10 11:16:17', 24),
(145, NULL, 'Periodic services available', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980464_Periodic servicing.png', NULL, NULL, NULL, '2025-09-04 10:07:44', '2026-07-10 11:16:17', 24),
(146, NULL, 'Pollution testing available', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980519_Pollution testing.png', NULL, NULL, NULL, '2025-09-04 10:08:39', '2026-07-10 11:16:17', 24),
(147, NULL, 'All car seat cover available', NULL, 'automobiles', 'feature', NULL, NULL, 'uploads/amenities/1756980549_seat cover.png', NULL, NULL, NULL, '2025-09-04 10:09:09', '2026-07-10 11:16:17', 24),
(148, NULL, 'New alloy wheels available', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756980625_alloy-wheel.png', NULL, NULL, NULL, '2025-09-04 10:10:25', '2025-09-04 10:10:38', NULL),
(149, NULL, 'Auto parking sensor available', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756980703_auto-parking.png', NULL, NULL, NULL, '2025-09-04 10:11:43', '2025-09-04 10:11:43', NULL),
(150, NULL, 'Air bags for all vehicle', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756980776_airbag.png', NULL, NULL, NULL, '2025-09-04 10:12:56', '2025-09-04 10:12:56', NULL),
(151, NULL, 'Voice control', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756980800_voice-control.png', NULL, NULL, NULL, '2025-09-04 10:13:20', '2025-09-04 10:13:20', NULL),
(152, NULL, 'Vechile Tracking  system available', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756980859_vehicle-tracking.png', NULL, NULL, NULL, '2025-09-04 10:14:19', '2025-09-04 10:14:19', NULL),
(153, NULL, 'New Power window available', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756980936_power window.png', NULL, NULL, NULL, '2025-09-04 10:15:36', '2025-09-04 10:15:36', NULL),
(154, NULL, 'Spare tyre available', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756980974_spare-tire.png', NULL, NULL, NULL, '2025-09-04 10:16:14', '2025-09-04 10:16:14', NULL),
(155, NULL, 'Denting Available', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756981899_Denting.png', NULL, NULL, NULL, '2025-09-04 10:31:39', '2025-09-04 10:31:53', NULL),
(156, NULL, 'Periodic services available', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756981996_Periodic servicing.png', NULL, NULL, NULL, '2025-09-04 10:33:16', '2025-09-04 10:33:16', NULL),
(157, NULL, 'Pollution testing available', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756982022_Pollution testing.png', NULL, NULL, NULL, '2025-09-04 10:33:42', '2025-09-04 10:33:42', NULL),
(158, NULL, 'A/c repair', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756982459_AC repair.png', NULL, NULL, NULL, '2025-09-04 10:40:59', '2025-09-04 10:40:59', NULL),
(159, NULL, 'Car audio system available', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756982551_Car audio systems.png', NULL, NULL, NULL, '2025-09-04 10:42:31', '2025-09-04 10:42:31', NULL),
(160, NULL, 'Car washing', NULL, 'car', 'model', NULL, NULL, 'uploads/amenities/1756982607_free  car washing.png', NULL, NULL, NULL, '2025-09-04 10:43:27', '2025-09-04 10:43:27', NULL),
(161, NULL, 'New style chair', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982757_beard styling chairs.png', NULL, NULL, NULL, '2025-09-04 10:45:57', '2026-06-26 06:31:51', 21),
(162, NULL, 'Blow dryer', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982775_Blow-dryers.png', NULL, NULL, NULL, '2025-09-04 10:46:15', '2026-06-26 06:31:51', 21),
(163, NULL, 'Bridal packages', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982797_bridal packages..png', NULL, NULL, NULL, '2025-09-04 10:46:37', '2026-06-26 06:31:51', 21),
(164, NULL, 'New equipment', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982822_equipment.png', NULL, NULL, NULL, '2025-09-04 10:47:02', '2026-06-26 06:31:51', 21),
(165, NULL, 'Essential oils available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982846_essential oils.png', NULL, NULL, NULL, '2025-09-04 10:47:26', '2026-06-26 06:31:51', 21),
(166, NULL, 'Facial massage available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982873_facial-massage.png', NULL, NULL, NULL, '2025-09-04 10:47:53', '2026-06-26 06:31:51', 21),
(167, NULL, 'Hair colouring', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982898_Hair coloring.png', NULL, NULL, NULL, '2025-09-04 10:48:18', '2026-06-26 06:31:51', 21),
(168, NULL, 'New hair wash units', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982924_Hair wash units.png', NULL, NULL, NULL, '2025-09-04 10:48:44', '2026-06-26 06:31:51', 21),
(169, NULL, 'New style hair cutting available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982958_hair-cutting.png', NULL, NULL, NULL, '2025-09-04 10:49:18', '2026-06-26 06:31:51', 21),
(170, NULL, 'Hair straightener available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756982992_hair-straightener.png', NULL, NULL, NULL, '2025-09-04 10:49:52', '2026-06-26 06:31:51', 21),
(171, NULL, 'Head massage available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756983019_head massages..png', NULL, NULL, NULL, '2025-09-04 10:50:19', '2026-06-26 06:31:51', 21),
(172, NULL, 'Sauna available', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756983041_sauna.png', NULL, NULL, NULL, '2025-09-04 10:50:41', '2026-06-26 06:31:51', 21),
(173, NULL, 'Skin therapy', NULL, 'grooming', 'feature', NULL, NULL, 'uploads/amenities/1756983071_skin therapy.png', NULL, NULL, NULL, '2025-09-04 10:51:11', '2026-06-26 06:31:51', 21),
(174, NULL, '24/7 power supply', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983349_Continuous power supply.png', NULL, NULL, NULL, '2025-09-04 10:55:49', '2026-06-26 06:28:50', 22),
(175, NULL, 'Canteen nearby', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983369_canteen.png', NULL, NULL, NULL, '2025-09-04 10:56:09', '2026-06-26 06:28:50', 22),
(176, NULL, 'Changing rooms available', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983396_changing rooms.png', NULL, NULL, NULL, '2025-09-04 10:56:36', '2026-06-26 06:28:50', 22),
(177, NULL, 'First Aid facility', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983420_first-aid centers.png', NULL, NULL, NULL, '2025-09-04 10:57:00', '2026-06-26 06:28:50', 22),
(178, NULL, 'Use Modern Machinery', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983482_Modern machinery.png', NULL, NULL, NULL, '2025-09-04 10:58:02', '2026-06-26 06:28:50', 22),
(179, NULL, 'Automated system available', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983507_Automated systems.png', NULL, NULL, NULL, '2025-09-04 10:58:27', '2026-06-26 06:28:50', 22),
(180, NULL, 'Personal protective equipment', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983542_Personal protective equipment.png', NULL, NULL, NULL, '2025-09-04 10:59:02', '2026-06-26 06:28:50', 22),
(181, NULL, 'Pollution control system available', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983571_Pollution control systems.png', NULL, NULL, NULL, '2025-09-04 10:59:31', '2026-06-26 06:28:50', 22),
(182, NULL, 'Solar system available', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983600_solar-system.png', NULL, NULL, NULL, '2025-09-04 11:00:00', '2026-06-26 06:28:50', 22),
(183, NULL, 'Treatment Facilities Available', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983692_treatment facilities.png', NULL, NULL, NULL, '2025-09-04 11:01:32', '2026-06-26 06:28:50', 22),
(184, NULL, 'Warehouse facility available', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983737_warehousing facilities.png', NULL, NULL, NULL, '2025-09-04 11:02:17', '2026-06-26 06:28:50', 22),
(185, NULL, 'Extinguishers', NULL, 'manufacturing', 'feature', NULL, NULL, 'uploads/amenities/1756983782_extinguishers.png', NULL, NULL, NULL, '2025-09-04 11:03:02', '2026-06-26 06:28:50', 22),
(186, NULL, '24/7  under surveillance', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756984222_24-7 security with CCTV surveillance.png', NULL, NULL, NULL, '2025-09-04 11:10:22', '2025-09-04 11:10:22', NULL),
(187, NULL, 'Cafeteria nearby', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756984268_cafeteria (1).png', NULL, NULL, NULL, '2025-09-04 11:11:08', '2025-09-04 11:11:08', NULL),
(188, NULL, 'Charging station nearby', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756984318_charging-station.png', NULL, NULL, NULL, '2025-09-04 11:11:58', '2025-09-04 11:11:58', NULL),
(189, NULL, 'elevators available', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756984414_elevator (1).png', NULL, NULL, NULL, '2025-09-04 11:13:34', '2025-09-04 11:13:34', NULL),
(190, NULL, 'Retail store Nearby', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756984435_retail stores.png', NULL, NULL, NULL, '2025-09-04 11:13:55', '2025-09-04 11:13:55', NULL),
(191, NULL, 'Dedicated Parking space', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756984483_Dedicated parking spaces.png', NULL, NULL, NULL, '2025-09-04 11:14:43', '2025-09-04 11:14:43', NULL),
(192, NULL, 'Smart Home Automation', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756984542_Smart home automation.png', NULL, NULL, NULL, '2025-09-04 11:15:42', '2025-09-04 11:15:42', NULL),
(193, NULL, 'Solar system available', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756984609_solar-panel.png', NULL, NULL, NULL, '2025-09-04 11:16:49', '2025-09-04 11:16:49', NULL),
(194, NULL, 'Swimming pool available', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756984641_Swimming pool.png', NULL, NULL, NULL, '2025-09-04 11:17:21', '2025-09-04 11:17:21', NULL),
(195, NULL, 'Wifi service available', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756985144_free-wifi (1).png', NULL, NULL, NULL, '2025-09-04 11:25:44', '2025-09-04 11:25:44', NULL),
(196, NULL, 'A/C environment', NULL, 'real-estate', 'feature', NULL, NULL, 'uploads/amenities/1756985197_air-conditioner.png', NULL, NULL, NULL, '2025-09-04 11:26:37', '2025-09-04 11:26:37', NULL),
(197, NULL, 'Buffet available', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987181_buffet.png', NULL, NULL, NULL, '2025-09-04 11:59:41', '2026-06-29 05:38:39', 19),
(198, NULL, 'Catered meals available', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987250_Catered Meals.png', NULL, NULL, NULL, '2025-09-04 12:00:50', '2026-06-29 05:38:39', 19),
(199, NULL, 'Crockery', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987285_crockery.png', NULL, NULL, NULL, '2025-09-04 12:01:25', '2026-06-29 05:38:39', 19),
(200, NULL, 'Digital menu', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987321_digital menus.png', NULL, NULL, NULL, '2025-09-04 12:02:01', '2026-06-29 05:38:39', 19),
(201, NULL, 'Self service kiosks available', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987360_Self-service kiosks.png', NULL, NULL, NULL, '2025-09-04 12:02:40', '2026-06-29 05:38:39', 19),
(202, NULL, 'Home delivery available', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987399_home delivery.png', NULL, NULL, NULL, '2025-09-04 12:03:19', '2026-06-29 05:38:39', 19),
(203, NULL, 'New vending machine available', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987429_vending-machine.png', NULL, NULL, NULL, '2025-09-04 12:03:49', '2026-06-29 05:38:39', 19),
(204, NULL, 'Large sitting area available', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987451_group.png', NULL, NULL, NULL, '2025-09-04 12:04:11', '2026-06-29 05:38:39', 19),
(205, NULL, 'Multi staff available for service', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987480_group.png', NULL, NULL, NULL, '2025-09-04 12:04:40', '2026-06-29 05:38:39', 19),
(206, NULL, '100% fresh food available', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987591_Fresh items.png', NULL, NULL, NULL, '2025-09-04 12:06:31', '2026-06-29 05:38:39', 19),
(207, NULL, 'Lounge available', NULL, 'food', 'feature', NULL, NULL, 'uploads/amenities/1756987637_lounge.png', NULL, NULL, NULL, '2025-09-04 12:07:17', '2026-06-29 05:38:39', 19),
(208, NULL, 'Petrol', NULL, 'car', 'fuel_type', NULL, NULL, 'uploads/amenities/1775631497_jaguar-1 - Copy.jpg', NULL, NULL, NULL, '2026-04-08 06:58:17', '2026-04-08 06:58:17', NULL),
(209, NULL, 'Free Wi-Fi', NULL, 'travel-tourism', 'feature', NULL, NULL, 'uploads/amenities/1778928348_internet.png', NULL, NULL, NULL, '2026-05-16 10:45:48', '2026-06-29 06:20:46', 35),
(210, NULL, 'Parking Facility', NULL, 'travel-tourism', 'feature', NULL, NULL, 'uploads/amenities/1778928581_parking.png', NULL, NULL, NULL, '2026-05-16 10:49:41', '2026-06-29 06:20:46', 35),
(211, NULL, 'Cab Service', NULL, 'travel-tourism', 'feature', NULL, NULL, 'uploads/amenities/1778928641_taxi.png', NULL, NULL, NULL, '2026-05-16 10:50:41', '2026-06-29 06:20:46', 35),
(212, NULL, 'Gym/Fitness Center', NULL, 'travel-tourism', 'feature', NULL, NULL, 'uploads/amenities/1778928706_gym.png', NULL, NULL, NULL, '2026-05-16 10:51:46', '2026-06-29 06:20:46', 35),
(213, NULL, 'Complimentary Breakfast', NULL, 'travel-tourism', 'feature', NULL, NULL, 'uploads/amenities/1778928761_croissant.png', NULL, NULL, NULL, '2026-05-16 10:52:41', '2026-06-29 06:20:46', 35),
(214, NULL, 'Room Service', NULL, 'travel-tourism', 'feature', NULL, NULL, 'uploads/amenities/1778928861_hotel-service.png', NULL, NULL, NULL, '2026-05-16 10:54:21', '2026-06-29 06:20:46', 35),
(215, NULL, 'Pet Friendly', NULL, 'travel-tourism', 'feature', NULL, NULL, 'uploads/amenities/1778928908_veterinary.png', NULL, NULL, NULL, '2026-05-16 10:55:08', '2026-06-29 06:20:46', 35),
(216, NULL, 'Digital Marketing', NULL, 'business-services', 'feature', NULL, NULL, 'uploads/amenities/1778929036_social-media-marketing.png', NULL, NULL, NULL, '2026-05-16 10:57:16', '2026-06-29 06:31:41', 36),
(217, NULL, 'Content Writing', NULL, 'business-services', 'feature', NULL, NULL, 'uploads/amenities/1778929107_copywriting.png', NULL, NULL, NULL, '2026-05-16 10:58:27', '2026-06-29 06:31:41', 36),
(218, NULL, 'Graphic Design', NULL, 'business-services', 'feature', NULL, NULL, 'uploads/amenities/1778929210_illustration.png', NULL, NULL, NULL, '2026-05-16 11:00:10', '2026-06-29 06:31:41', 36),
(219, NULL, 'Data Analytics', NULL, 'business-services', 'feature', NULL, NULL, 'uploads/amenities/1778929378_data.png', NULL, NULL, NULL, '2026-05-16 11:02:58', '2026-06-29 06:31:41', 36),
(220, NULL, 'CRM Solutions', NULL, 'business-services', 'feature', NULL, NULL, 'uploads/amenities/1778929418_solutions.png', NULL, NULL, NULL, '2026-05-16 11:03:38', '2026-06-29 06:31:41', 36),
(221, NULL, 'Meeting Rooms', NULL, 'business-services', 'feature', NULL, NULL, 'uploads/amenities/1778929513_conversation.png', NULL, NULL, NULL, '2026-05-16 11:05:13', '2026-06-29 06:31:41', 36),
(222, NULL, 'Health Checkups', NULL, 'healthcare-services', 'feature', NULL, NULL, 'uploads/amenities/1778929613_health-check.png', NULL, NULL, NULL, '2026-05-16 11:06:53', '2026-06-29 11:49:46', 34),
(223, NULL, '24/7 Emergency', NULL, 'healthcare-services', 'feature', NULL, NULL, 'uploads/amenities/1778929705_24-hour-service.png', NULL, NULL, NULL, '2026-05-16 11:08:25', '2026-06-29 11:49:46', 34),
(224, NULL, 'Ambulance Service', NULL, 'healthcare-services', 'feature', NULL, NULL, 'uploads/amenities/1778929750_ambulance.png', NULL, NULL, NULL, '2026-05-16 11:09:10', '2026-06-29 11:49:46', 34),
(225, NULL, 'Ultrasound', NULL, 'healthcare-services', 'feature', NULL, NULL, 'uploads/amenities/1778929814_ultrasound.png', NULL, NULL, NULL, '2026-05-16 11:10:14', '2026-06-29 11:49:46', 34),
(226, NULL, 'Blood Testing', NULL, 'healthcare-services', 'feature', NULL, NULL, 'uploads/amenities/1778929854_blood-test.png', NULL, NULL, NULL, '2026-05-16 11:10:54', '2026-06-29 11:49:46', 34),
(227, NULL, 'Physiotherapy', NULL, 'healthcare-services', 'feature', NULL, NULL, 'uploads/amenities/1778929899_massage.png', NULL, NULL, NULL, '2026-05-16 11:11:39', '2026-06-29 11:49:46', 34);

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` bigint UNSIGNED NOT NULL,
  `date` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `listing_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `aditional_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `customer_id` int NOT NULL,
  `agent_id` int NOT NULL,
  `time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `listing_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zoom_link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `date`, `type`, `listing_id`, `name`, `phone`, `email`, `message`, `aditional_information`, `customer_id`, `agent_id`, `time`, `listing_type`, `zoom_link`, `status`, `created_at`, `updated_at`) VALUES
(8, '2026-05-08 10:20:31', 'person', 31, 'Harmanpreet Singh', '01987979900', 'singhharmanpreet646@gmail.com', 'Form Builder', '{\"text-1774611906896-0\":\"singhharmanpreet646\",\"number-1774611926923-0\":\"9717161203\",\"text-1774611945074-0\":\"singhharmanpreet646@gmail.com\",\"date-1774611958993-0\":\"2026-05-15 12:00:00\",\"select-1774611983277-0\":\"Family\"}', 43, 1, '10:20', 'travel-tourism', NULL, 0, '2026-05-08 10:20:31', '2026-05-08 10:20:31'),
(10, '2026-05-11 11:12:06', 'person', 32, 'Harmanpreet Singh', '01987979900', 'singhharmanpreet646@gmail.com', 'Form Builder', '{\"text-1774612045905-0\":\"Abhishek\",\"number-1774612062444-0\":\"9717161203\",\"text-1774612060277-0\":\"dev.acnosoft@gmail.com\",\"date-1774612092819-0\":\"2026-05-12 12:00:00\",\"select-1774612113129-0\":\"SME\"}', 43, 1, '11:12', 'business-services', NULL, 0, '2026-05-11 11:12:06', '2026-05-11 11:12:06'),
(11, '2026-05-11 11:24:16', 'person', 3, 'listify.asia', '01987979900', 'thecorpmarvel@gmail.com', 'Form Builder', '{\"text-1756464128722-0\":\"Ravit Chhabra\",\"number-1756464179041-0\":\"7419287536\",\"text-1756464145325-0\":\"chhabraravit@gmail.com\",\"date-1756464197981-0\":\"2026-05-12 12:00:00\",\"date-1756795942397-0\":\"2026-05-13 12:00:00\",\"checkbox-group-1756464206746-0\":\"Breakfast, Lunch\",\"textarea-1756796172011-0\":\"testt\"}', 1, 43, '11:24', 'hotel', NULL, 0, '2026-05-11 11:24:16', '2026-05-11 11:24:16'),
(12, '2026-05-16 05:46:24', 'person', 11, 'Ravit Chhabra', '01987979900', 'chhabraravit@gmail.com', 'Form Builder', '{\"text-1774423012800-0\":\"Ravit Chhabra\",\"text-1774423021882-0\":\"7419287536\",\"text-1774423041816-0\":\"chhabraravit@gmail.com\",\"text-1774423050816-0\":\"tdi\",\"textarea-1774423086299-0\":\"test\",\"select-1774423161953-0\":\"12PM-4PM\",\"textarea-1774423273539-0\":\"test\"}', 47, 43, '05:46', 'it-services', NULL, 0, '2026-05-16 05:46:24', '2026-05-16 05:46:24');

-- --------------------------------------------------------

--
-- Table structure for table `beauty_listings`
--

CREATE TABLE `beauty_listings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_hours` json DEFAULT NULL,
  `category` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `team` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `service` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `user_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `listing_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'premium',
  `img_base_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT 'https://www.listify.asia/',
  `data_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `is_popular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_claimed` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` int NOT NULL,
  `user_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL,
  `is_popular` int DEFAULT NULL,
  `keyword` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `image`, `category`, `user_id`, `description`, `status`, `is_popular`, `keyword`, `time`, `created_at`, `updated_at`) VALUES
(1, 'Get Listed, Get Found: The Future of Business Visibility', '1778916115.png', 1, '1', '<h2>📍 Unlocking Visibility: The Power of a Directory Listing Business</h2><p>In today’s digital-first world, visibility is currency. Whether you\'re a local bakery, a freelance designer, or a multinational supplier, being discoverable online is no longer optional—it\'s essential. That’s where directory listing businesses come in, bridging the gap between service seekers and providers with precision and ease.</p><p><br></p><h3>🧭 What Is a Directory Listing Business?</h3><p>A directory listing business is a digital platform that organizes and showcases businesses, professionals, or services across various categories. Think of it as the modern-day Yellow Pages—only smarter, searchable, and optimized for the web.</p><p>These platforms allow users to:</p><ul><li><p>Search for services by location, category, or rating</p></li><li><p>Compare offerings and read reviews</p></li><li><p>Contact businesses directly or via integrated booking tools</p></li></ul><p>For listed businesses, it’s a gateway to:</p><ul><li><p>Increased online visibility</p></li><li><p>Enhanced credibility through reviews and ratings</p></li><li><p>Direct customer engagement</p><p><br></p></li></ul><h3>🚀 Why Directory Listings Matter More Than Ever</h3><p>With search engines prioritizing local results and users relying on peer reviews, directory listings offer a strategic advantage:</p><p><h3></h3></p><ul><li><p><span><strong>SEO Boost</strong>: Listings improve search engine rankings by creating backlinks and structured data.</span></p></li><li><p><span><strong>Trust Building</strong>: Verified profiles and user reviews foster trust.</span></p></li><li><p><span><strong>Lead Generation</strong>: Targeted visibility attracts high-intent customers.</span></p></li><li><p><span><strong>Cost-Effective Marketing</strong>: Compared to paid ads, listings offer long-term exposure at minimal cost.</span></p><p><span><br></span></p><h3>🌐 Industries Ripe for Directory Listings</h3><p>While the model is versatile, some industries thrive especially well:</p><ul><li><p>Local services (plumbers, electricians, tutors)</p></li><li><p>Health &amp; wellness (clinics, therapists, gyms)</p></li><li><p>Events &amp; entertainment (venues, artists, caterers)</p></li><li><p>B2B suppliers (manufacturers, consultants)</p></li><li><p>Niche communities (barter platforms, eco-friendly brands)</p><p><br></p></li></ul><h3>🧠 Final Thoughts</h3><p></p><p>A directory listing business isn’t just a digital catalog—it’s a discovery engine. By curating quality listings, enabling user interaction, and offering smart monetization, it creates value for both users and businesses. In a world overflowing with options, being findable is the first step to being chosen.</p></li></ul>', 1, 1, 'directory listing business, online business directory, local business listings, business directory website, directory platform, get listed online, business visibility, local SEO, service provider directory, find businesses online, business listing site, digital directory, business discovery platform, online directory services, business directory software, premium business listings, verified listings, review-based directory, niche directory platform, B2B directory, local service directory, business lead generation, online marketplace, business listing benefits, directory monetization, listing management system, mobile-friendly directory, search optimized listings', 1778916115, '2025-08-06 14:18:39', '2026-05-16 07:21:55'),
(2, 'Why Getting Listed Matters: The Hidden Power of Online Directories', '1778917166.png', 1, '1', '<h3>🧭 Blog Title: “Why Getting Listed Matters: The Hidden Power of Online Directories”</h3><h4>📌 Introduction</h4><p>In today’s digital-first world, visibility is currency. Whether you\'re a small business or a global enterprise, being discoverable online is non-negotiable. But beyond social media and search engines lies a powerful yet underutilized tool—online directories.</p><p><br></p><h4>🔍 What Are Online Directories?</h4><p>Online directories are platforms that categorize businesses by industry, location, or service type. Think of them as the modern-day Yellow Pages, but smarter, searchable, and SEO-friendly.</p><p><br></p><h4>🚀 Benefits of Being Listed</h4><ul><li><p><strong>Enhanced Discoverability</strong>: Customers searching for specific services often start with directories.</p></li><li><p><strong>SEO Boost</strong>: Listings with backlinks improve your search engine rankings.</p></li><li><p><strong>Credibility &amp; Trust</strong>: Being listed on reputable platforms signals legitimacy.</p></li><li><p><strong>Lead Generation</strong>: Many directories offer inquiry forms or direct contact options.</p></li><li><p><strong>Local Optimization</strong>: Perfect for businesses targeting regional markets.</p><p><br></p></li></ul><h4>🛠️ How to Optimize Your Listing</h4><ul><li><p>Use consistent NAP (Name, Address, Phone) details across platforms.</p></li><li><p>Add high-quality images and a compelling business description.</p></li><li><p>Encourage reviews and respond to them professionally.</p></li><li><p>Choose the right categories and tags.</p><p><br></p></li></ul><h4>📈 Real-World Impact</h4><p>Businesses that actively manage their directory presence often see:</p><ul><li><p>20–30% increase in inbound inquiries</p></li><li><p>Higher conversion rates from local searches</p></li><li><p>Improved brand recall and trust</p><p><br></p></li></ul><h4>🧠 Final Thoughts</h4><p><div></div><p></p></p><p><span>Getting listed isn’t just about being found—it’s about being chosen. In a crowded marketplace, online directories offer a structured, credible way to stand out. If you\'re not listed, you\'re missing out.</span></p>', 1, 1, 'online business directory, directory listing services, get listed online, business visibility online, local business directories, B2B directory platform, business listing benefits, improve online discoverability, local business listing India, regional directory platforms, industry-specific directories, SME online visibility, best directories for startups, directory listing for consultants, e-commerce business listing, how to get listed on online directories, benefits of directory listing for small businesses, increase website traffic through business directories, best online directories for B2B companies, why directory listings improve SEO, directory listing vs social media marketing, optimize business profile for online directories, boost your brand visibility, get discovered by the right audience, improve your local search ranking, trusted platforms for business listings, drive inbound leads through directory presence', 1778917166, '2025-08-06 14:24:03', '2026-05-16 07:39:26'),
(3, 'Building the Future: Website & Mobile App Development with PHP, Python, React, Angular, React Native & Ionic', '1778916563.png', 2, '1', '<h3><span style=\"font-size: 1.75rem;\">🧩 Introduction</span></h3><p>In the digital age, your website and mobile app are more than just tools—they\'re your brand\'s frontline. Whether you\'re launching a startup or scaling an enterprise, choosing the right tech stack is critical. Let’s explore how modern frameworks like PHP, Python, React, Angular, React Native, and Ionic are reshaping digital experiences.</p><p><br></p><div></div><h3>🖥️ Website Development: Backend Meets Frontend</h3><h4>🔧 PHP &amp; Python: The Backend Powerhouses</h4><ul><li><p><strong>PHP</strong>: Ideal for content-heavy websites, CMS platforms, and rapid deployment. It powers giants like WordPress and Facebook.</p></li><li><p><strong>Python</strong>: Known for its readability and scalability, Python is perfect for data-driven platforms, AI integrations, and secure web applications.</p><p><br></p></li></ul><h4>⚡ React &amp; Angular: Dynamic Frontend Frameworks</h4><ul><li><p><strong>React</strong>: Component-based, fast, and SEO-friendly. Great for interactive UIs and single-page applications.</p></li><li><p><strong>Angular</strong>: A full-fledged framework with built-in tools for routing, state management, and form handling. Perfect for enterprise-grade apps.</p><p><br></p></li></ul><div></div><h3>📱 Mobile App Development: Cross-Platform Brilliance</h3><h4>🌐 React Native</h4><ul><li><p>Developed by Facebook, React Native allows you to build native-like apps using JavaScript.</p></li><li><p>Reusable components and fast refresh make it ideal for MVPs and scalable mobile solutions.</p><p><br></p></li></ul><h4>🧪 Ionic</h4><ul><li><p>Built on web technologies (HTML, CSS, JS), Ionic lets you create hybrid apps with a single codebase.</p></li><li><p>Integrates seamlessly with Angular, React, or Vue, and offers native plugins for device features.</p><p><br></p></li></ul><div></div><h3>🔄 Why Full-Stack Matters</h3><ul><li><p><strong>Unified Development</strong>: Shared logic between web and mobile apps.</p></li><li><p><strong>Faster Deployment</strong>: Reusable components and APIs.</p></li><li><p><strong>Cost Efficiency</strong>: One team, one codebase, multiple platforms.</p></li><li><p><strong>Scalability</strong>: Easily integrate new features across platforms.</p><p><br></p></li></ul><div></div><h3>🧠 Final Thoughts</h3><p></p><div></div><p></p><p><span>Choosing the right tech stack isn’t just about trends—it’s about aligning with your business goals. PHP and Python offer robust backend capabilities, React and Angular deliver stunning frontends, and React Native and Ionic bridge the mobile gap. Together, they form a powerful ecosystem for building future-ready digital solutions.</span></p>', 1, 1, 'website development, mobile app development, PHP web development, Python web development, React frontend development, Angular web development, React Native mobile apps, Ionic mobile development, full-stack development, cross-platform app development, hybrid mobile apps, backend development with PHP, backend development with Python, frontend frameworks, single-page applications, enterprise web development, scalable mobile apps, MVP development, native-like mobile apps, web technologies for mobile, unified codebase, reusable components, mobile app frameworks, modern web development, digital product development, app development for startups, tech stack for web and mobile', 1778916563, '2025-08-06 14:35:25', '2026-05-16 07:29:23'),
(19, 'How to Optimize Your Business Profile for Maximum Visibility', '1778918128.png', 1, '1', '<h2 data-section-id=\"111u4n2\" data-start=\"131\" data-end=\"194\">How to Optimize Your Business Profile for Maximum Visibility</h2><p data-start=\"196\" data-end=\"534\">In today’s digital world, customers search online before choosing a business. Whether you\'re a startup, freelancer, local shop, or established company, having a strong online presence is essential. Simply creating a business listing is not enough — optimizing your profile is the key to attracting more customers and improving visibility.</p><p data-start=\"536\" data-end=\"683\">A properly optimized business profile helps search engines understand your business and makes it easier for potential customers to find you online.</p><h3 data-section-id=\"1dsshap\" data-start=\"685\" data-end=\"724\"><br></h3><h3 data-section-id=\"1dsshap\" data-start=\"685\" data-end=\"724\">1. Use a Professional Business Name</h3><p data-start=\"726\" data-end=\"948\">Your business name should remain consistent across all online platforms. Avoid adding extra keywords or promotional phrases unnecessarily. A clean and professional business name builds trust and improves brand recognition.</p><h3 data-section-id=\"1j0688x\" data-start=\"950\" data-end=\"999\"><br></h3><h3 data-section-id=\"1j0688x\" data-start=\"950\" data-end=\"999\">2. Write a Clear and SEO-Friendly Description</h3><p data-start=\"1001\" data-end=\"1050\">Your business description should clearly explain:</p><ul data-start=\"1051\" data-end=\"1144\">\r\n<li data-section-id=\"d0twjs\" data-start=\"1051\" data-end=\"1076\">\r\nWhat your business does\r\n</li>\r\n<li data-section-id=\"f2p7p9\" data-start=\"1077\" data-end=\"1097\">\r\nServices you offer\r\n</li>\r\n<li data-section-id=\"183tfp8\" data-start=\"1098\" data-end=\"1120\">\r\nYour target audience\r\n</li>\r\n<li data-section-id=\"tx9zng\" data-start=\"1121\" data-end=\"1144\">\r\nYour unique strengths\r\n</li>\r\n</ul><p data-start=\"1146\" data-end=\"1233\">Use relevant keywords naturally while keeping the content informative and easy to read.</p><h3 data-section-id=\"xmgj6q\" data-start=\"1235\" data-end=\"1278\"><br></h3><h3 data-section-id=\"xmgj6q\" data-start=\"1235\" data-end=\"1278\">3. Select the Correct Business Category</h3><p data-start=\"1280\" data-end=\"1479\">Choosing the right business category helps customers and search engines understand your services better. Accurate categories improve discoverability and help your profile appear in relevant searches.</p><h3 data-section-id=\"1eqs4th\" data-start=\"1481\" data-end=\"1514\"><br></h3><h3 data-section-id=\"1eqs4th\" data-start=\"1481\" data-end=\"1514\">4. Upload High-Quality Images</h3><p data-start=\"1516\" data-end=\"1570\">Visual content creates a strong first impression. Add:</p><ul data-start=\"1571\" data-end=\"1657\">\r\n<li data-section-id=\"1tth58l\" data-start=\"1571\" data-end=\"1586\">\r\nBusiness logo\r\n</li>\r\n<li data-section-id=\"1l1nbbb\" data-start=\"1587\" data-end=\"1608\">\r\nOffice/store photos\r\n</li>\r\n<li data-section-id=\"1dzb5yv\" data-start=\"1609\" data-end=\"1625\">\r\nProduct images\r\n</li>\r\n<li data-section-id=\"1ufyzu2\" data-start=\"1626\" data-end=\"1639\">\r\nTeam photos\r\n</li>\r\n<li data-section-id=\"a05j0y\" data-start=\"1640\" data-end=\"1657\">\r\nService banners\r\n</li>\r\n</ul><p data-start=\"1659\" data-end=\"1731\">Profiles with quality images receive more engagement and customer trust.</p><h3 data-section-id=\"1fmoxwm\" data-start=\"1733\" data-end=\"1772\"><br></h3><h3 data-section-id=\"1fmoxwm\" data-start=\"1733\" data-end=\"1772\">5. Add Accurate Contact Information</h3><p data-start=\"1774\" data-end=\"1791\">Always keep your:</p><ul data-start=\"1792\" data-end=\"1872\">\r\n<li data-section-id=\"1h37kgn\" data-start=\"1792\" data-end=\"1806\">\r\nPhone number\r\n</li>\r\n<li data-section-id=\"1c1efm\" data-start=\"1807\" data-end=\"1822\">\r\nEmail address\r\n</li>\r\n<li data-section-id=\"1nju16b\" data-start=\"1823\" data-end=\"1837\">\r\nWebsite link\r\n</li>\r\n<li data-section-id=\"ctkz08\" data-start=\"1838\" data-end=\"1856\">\r\nBusiness address\r\n</li>\r\n<li data-section-id=\"16mcihm\" data-start=\"1857\" data-end=\"1872\">\r\nWorking hours\r\n</li>\r\n</ul><p data-start=\"1874\" data-end=\"1945\">updated and accurate. Incorrect information can lead to lost customers.</p><h3 data-section-id=\"1lrg56m\" data-start=\"1947\" data-end=\"1991\"><br></h3><h3 data-section-id=\"1lrg56m\" data-start=\"1947\" data-end=\"1991\">6. Connect Your Website and Social Media</h3><p data-start=\"1993\" data-end=\"2116\">Adding website and social media links helps customers learn more about your business and increases your online credibility.</p><h3 data-section-id=\"1pee46k\" data-start=\"2118\" data-end=\"2149\"><br></h3><h3 data-section-id=\"1pee46k\" data-start=\"2118\" data-end=\"2149\">7. Collect Customer Reviews</h3><p data-start=\"2151\" data-end=\"2317\">Positive customer reviews improve trust and influence buying decisions. Encourage satisfied customers to leave genuine feedback and respond professionally to reviews.</p><h3 data-section-id=\"1v381ji\" data-start=\"2319\" data-end=\"2357\"><br></h3><h3 data-section-id=\"1v381ji\" data-start=\"2319\" data-end=\"2357\">8. Use Relevant Keywords Naturally</h3><p data-start=\"2359\" data-end=\"2508\">Include keywords related to your services, industry, and location naturally throughout your profile. Avoid keyword stuffing and focus on readability.</p><h3 data-section-id=\"1bfrlvp\" data-start=\"2510\" data-end=\"2542\"><br></h3><h3 data-section-id=\"1bfrlvp\" data-start=\"2510\" data-end=\"2542\">9. Keep Your Profile Updated</h3><p data-start=\"2544\" data-end=\"2699\">Regularly update your business information, services, offers, images, and announcements. Active profiles perform better online and attract more engagement.</p><h3 data-section-id=\"amdykn\" data-start=\"2701\" data-end=\"2747\"><br></h3><h3 data-section-id=\"amdykn\" data-start=\"2701\" data-end=\"2747\">10. Complete Every Section of Your Profile</h3><p data-start=\"2749\" data-end=\"2912\">Complete profiles rank better and look more trustworthy. Fill all important sections including description, categories, contact details, images, and website links.</p><h2 data-section-id=\"114wazr\" data-start=\"2914\" data-end=\"2931\"><br></h2><h2 data-section-id=\"114wazr\" data-start=\"2914\" data-end=\"2931\">Final Thoughts</h2><p data-start=\"2933\" data-end=\"3195\">Optimizing your business profile is one of the easiest and most effective ways to improve online visibility and attract more customers. A complete, accurate, and engaging profile helps your business stand out and grow successfully in today’s digital marketplace.</p><p>\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n</p><p data-start=\"3197\" data-end=\"3295\">Start optimizing your business profile today and create a stronger online presence for your brand.</p>', 1, 1, 'business profile optimization ,online business visibility,local SEO tips, optimize business listing,improve online presence,SEO business profile, directory listing, business growth', 1778919433, '2026-05-16 07:55:28', '2026-05-16 08:17:13'),
(22, 'Test Blog 1', '1780294684.png', 2, '4', 'Lorem Ipust Dolor Amet Iset', 0, 1, 'asd, asdf', 1780294684, '2026-06-01 06:18:04', '2026-07-03 12:06:49'),
(23, 'our project', '1783768968.avif', 1, '50', 'A gift, also known as a present, is an item given to someone without the expectation of payment or anything in return. In many countries, the act of mutually exchanging money, goods, etc., may sustain social relationships and contribute to social cohesion. Economists have elaborated the economics of gift-giving into the notion of a gift economy. By extension, the term gift can refer to any item or act of service that makes the other happier or less sad, especially as a favor, including forgiveness and kindness. Gifts are often presented on occasions such as birthdays and holidays.', 1, 1, 'testing,checking,top,category', 1783768968, '2026-07-09 11:27:25', '2026-07-11 11:22:48');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Business Directory', '2025-08-06 14:11:53', '2025-08-06 14:11:53'),
(2, 'IT Services', '2025-08-06 14:30:43', '2025-08-06 14:31:07');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('chhabraravit@gmail.com|175.111.134.209', 'i:1;', 1783923436),
('chhabraravit@gmail.com|175.111.134.209:timer', 'i:1783923436;', 1783923436),
('thecorpmarvel@gmail.com|103.158.104.155', 'i:2;', 1784110733),
('thecorpmarvel@gmail.com|103.158.104.155:timer', 'i:1784110733;', 1784110733);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `car_listings`
--

CREATE TABLE `car_listings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `car_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `transmission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `fuel_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `engine_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cylinder` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `interior_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exterior_color` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `drive_train` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `trim` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mileage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `vin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `discount_price` double DEFAULT NULL,
  `visibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int NOT NULL,
  `feature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_hours` json DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `listing_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_base_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'web',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `is_popular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `parent`, `type`, `created_at`, `updated_at`, `type_id`) VALUES
(1, 'Restaurants', '1', 'food', '2025-08-05 11:14:31', '2026-06-29 05:38:39', 19),
(2, 'Fast Food - Quick Street', '1', 'food', '2025-08-05 11:15:12', '2026-06-29 05:38:39', 19),
(3, 'Beverages and Shakes', '1', 'food', '2025-08-05 11:15:51', '2026-06-29 05:38:39', 19),
(4, 'Cafe', '1', 'food', '2025-08-05 11:16:14', '2026-06-29 05:38:39', 19),
(5, 'Bars', '1', 'food', '2025-08-05 11:16:25', '2026-06-29 05:38:39', 19),
(6, 'Gym', '6', 'fitness', '2025-08-05 11:22:35', '2026-06-26 07:18:59', 20),
(7, 'Yoga Classes', '7', 'fitness', '2025-08-05 11:23:01', '2026-06-26 07:18:59', 20),
(8, 'Personal Trainings', '8', 'fitness', '2025-08-05 11:23:35', '2026-06-26 07:18:59', 20),
(9, 'Aerobics and Cardio', '', 'fitness', '2025-08-05 11:24:37', '2026-06-26 07:18:59', 20),
(10, 'Salon', '', 'grooming', '2025-08-05 11:27:10', '2026-06-26 06:31:51', 21),
(11, 'Beauty Parlour', '', 'grooming', '2025-08-05 11:28:08', '2026-06-26 06:31:51', 21),
(12, 'Website and Softwares', '12', 'it-services', '2025-08-05 13:38:17', '2026-06-26 06:02:59', 28),
(14, 'Modelling Agencies', '', 'agencies', '2025-08-05 13:39:48', '2026-06-26 06:01:05', 29),
(15, 'Advertising Agency', '', 'agencies', '2025-08-05 13:40:15', '2026-06-26 06:01:05', 29),
(16, 'Newspaper Agency', '15', 'agencies', '2025-08-05 13:40:56', '2026-06-26 06:01:05', 29),
(17, 'Highway Motels', '', 'hotel', '2025-08-05 13:42:12', '2026-06-29 12:01:35', 2),
(18, '2 Star Hotels', '', 'hotel', '2025-08-05 13:42:27', '2026-06-29 12:01:35', 2),
(19, '3 Star Hotels', '', 'hotel', '2025-08-05 13:42:39', '2026-06-29 12:01:35', 2),
(20, '4 Star Hotels', '', 'hotel', '2025-08-05 13:43:02', '2026-06-29 12:01:35', 2),
(21, '5 Star Hotels', '', 'hotel', '2025-08-05 13:43:12', '2026-06-29 12:01:35', 2),
(22, 'Community Club', '', 'hotel', '2025-08-05 13:44:11', '2026-06-29 12:01:35', 2),
(23, 'Special Club', '', 'hotel', '2025-08-05 13:44:29', '2026-06-29 12:01:35', 2),
(24, 'Property Dealers', '', 'real-estate', '2025-08-05 13:44:51', '2026-06-29 05:51:57', 5),
(25, 'Rental Services', '', 'real-estate', '2025-08-05 13:45:00', '2026-06-29 05:51:57', 5),
(26, 'Builders and Collaborators', '', 'real-estate', '2025-08-05 13:45:35', '2026-06-29 05:51:57', 5),
(27, 'Industrial Property Consultants', '', 'real-estate', '2025-08-05 13:46:00', '2026-06-29 05:51:57', 5),
(28, 'Residential Property Consultants', '', 'real-estate', '2025-08-05 13:46:22', '2026-06-29 05:51:57', 5),
(29, 'Massage Centres', '', 'grooming', '2025-08-05 13:47:22', '2026-06-26 06:31:51', 21),
(30, 'Confectionary', '', 'trading', '2025-08-05 13:47:45', '2026-06-26 06:19:57', 23),
(31, 'General Items', '', 'trading', '2025-08-05 13:48:00', '2026-06-26 06:19:57', 23),
(32, 'Disposable Items', '', 'trading', '2025-08-05 13:48:21', '2026-06-26 06:19:57', 23),
(33, 'Birthday Items', '', 'trading', '2025-08-05 13:48:35', '2026-06-26 06:19:57', 23),
(34, 'Confectionary Shops', '', 'food', '2025-08-05 13:48:54', '2026-06-29 05:38:39', 19),
(35, 'General Stores', '', 'food', '2025-08-05 13:49:02', '2026-06-29 05:38:39', 19),
(36, 'Dairy', '', 'food', '2025-08-05 13:49:13', '2026-06-29 05:38:39', 19),
(37, 'Sweets Shops', '', 'food', '2025-08-05 13:49:27', '2026-06-29 05:38:39', 19),
(38, 'Others', '', 'food', '2025-08-05 13:50:05', '2026-06-29 05:38:39', 19),
(39, 'Auto Spare Parts', '', 'manufacturing', '2025-08-05 13:50:32', '2026-06-26 06:28:50', 22),
(40, 'Electrical Appliances', '', 'manufacturing', '2025-08-05 13:50:48', '2026-06-26 06:28:50', 22),
(41, 'Perfumes and Fragrances', '', 'manufacturing', '2025-08-05 13:51:03', '2026-06-26 06:28:50', 22),
(42, 'Diaries', '', 'manufacturing', '2025-08-05 13:51:18', '2026-06-26 06:28:50', 22),
(43, 'Plastic Items', '', 'manufacturing', '2025-08-05 13:51:33', '2026-06-26 06:28:50', 22),
(44, 'Food and Supplies Manufacturing', '', 'manufacturing', '2025-08-05 13:56:18', '2026-06-26 06:28:50', 22),
(45, 'Electronic Components', '', 'manufacturing', '2025-08-05 13:56:34', '2026-06-26 06:28:50', 22),
(46, 'Cars Sale Purchase', '', 'automobiles', '2025-08-05 13:57:10', '2026-07-10 11:16:17', 24),
(47, '4 Wheeler Repairing Workshops', '', 'automobiles', '2025-08-05 13:57:34', '2026-07-10 11:16:17', 24),
(48, '2 Wheeler Spare Parts', '', 'automobiles', '2025-08-05 13:58:15', '2026-07-10 11:16:17', 24),
(49, '4 Wheeler Spare parts', '', 'automobiles', '2025-08-05 13:58:28', '2026-07-10 11:16:17', 24),
(50, '2 Wheeler Sale Purchase', '', 'automobiles', '2025-08-05 13:59:03', '2026-07-10 11:16:17', 24),
(51, '2 Wheeler Repairing Workshops', '', 'automobiles', '2025-08-05 14:00:11', '2026-07-10 11:16:17', 24),
(52, 'Banquet Halls', '', 'hotel', '2025-08-05 14:00:39', '2026-06-29 12:01:35', 2),
(53, 'Farm Houses', '', 'hotel', '2025-08-05 14:00:53', '2026-06-29 12:01:35', 2),
(54, 'Offset Printing press', '', 'corporate-gifting-and-printing-services', '2025-08-05 14:01:36', '2026-06-26 06:08:40', 26),
(55, 'Digital Printing Press', '', 'corporate-gifting-and-printing-services', '2025-08-05 14:01:54', '2026-06-26 06:08:40', 26),
(56, 'Corporate Gifting', '', 'corporate-gifting-and-printing-services', '2025-08-05 14:02:06', '2026-06-26 06:08:40', 26),
(57, 'Gaming Zone', '', 'recreation', '2025-08-05 14:03:54', '2026-06-26 06:11:22', 25),
(58, 'Water Park', '', 'recreation', '2025-08-05 14:04:12', '2026-06-26 06:11:22', 25),
(59, 'Cricket', '66', 'academies', '2025-08-05 14:04:54', '2026-06-26 06:06:52', 31),
(60, 'Tennis', '66', 'academies', '2025-08-05 14:05:01', '2026-06-26 06:06:52', 31),
(61, 'Swimming', '66', 'academies', '2025-08-05 14:05:11', '2026-06-26 06:06:52', 31),
(62, 'Badminton', '66', 'academies', '2025-08-05 14:05:19', '2026-06-26 06:06:52', 31),
(63, 'Taekwondo', '67', 'academies', '2025-08-05 14:06:02', '2026-06-26 06:06:52', 31),
(64, 'Self Defence', '67', 'academies', '2025-08-05 14:06:14', '2026-06-26 06:06:52', 31),
(65, 'Drawing and Fine Arts', '67', 'academies', '2025-08-05 14:06:33', '2026-06-26 06:06:52', 31),
(66, 'Sports', '', 'academies', '2025-08-05 14:06:46', '2026-06-26 06:06:52', 31),
(67, 'Hobbies', '', 'academies', '2025-08-05 14:08:32', '2026-06-26 06:06:52', 31),
(68, 'Luxury Hotels', '21', 'hotel', '2025-08-14 10:18:48', '2026-06-29 12:01:35', 2),
(69, 'Acnosoft_seo', '69', 'acnosoft-listing', '2025-08-16 05:25:21', '2025-08-16 05:26:21', 33),
(70, 'Acnosoft_webdev', '70', 'acnosoft-listing', '2025-08-16 05:26:53', '2025-08-16 05:27:50', 33),
(71, 'Medical Products', '', 'healthcare-services', '2026-03-27 06:45:24', '2026-06-29 11:49:46', 34),
(72, 'Diagnostic Services', '', 'healthcare-services', '2026-03-27 06:45:38', '2026-06-29 11:49:46', 34),
(73, 'Medical Services', '', 'healthcare-services', '2026-03-27 06:45:51', '2026-06-29 11:49:46', 34),
(74, 'Travel Agency', '', 'travel-tourism', '2026-03-27 07:04:32', '2026-06-29 06:20:46', 35),
(75, 'Adventure Tours', '', 'travel-tourism', '2026-03-27 07:08:42', '2026-06-29 06:20:46', 35),
(76, 'Holiday Packages Provider', '', 'travel-tourism', '2026-03-27 07:08:52', '2026-06-29 06:20:46', 35),
(77, 'Translation Services', '', 'business-services', '2026-03-27 07:14:57', '2026-06-29 06:31:41', 36),
(78, 'Document Services', '', 'business-services', '2026-03-27 07:15:04', '2026-06-29 06:31:41', 36),
(79, 'Advertising', '', 'business-services', '2026-03-27 07:58:46', '2026-06-29 06:31:41', 36),
(80, 'Goods Moving Equipment', '', 'manufacturing', '2026-03-27 08:03:14', '2026-06-26 06:28:50', 22),
(81, 'Mechanic', '81', 'car', '2026-04-03 06:31:43', '2026-06-29 12:02:12', 1),
(82, 'Tyre Shop', '82', 'car', '2026-04-03 06:32:15', '2026-06-29 12:02:12', 1),
(83, 'Dining', '', 'restaurant', '2026-07-13 06:31:55', '2026-07-13 06:31:55', 4);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` bigint NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `country`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Sonipat', 98, '1783602406_m_Sonipat_Mojoland_adventure_park_1_l_479_640.avif', '2025-08-05 11:03:11', '2026-07-09 13:06:46'),
(2, 'New Delhi', 98, '1754489107_india-gate-delhi-1-attr-hero.jpeg', '2025-08-06 14:05:07', '2025-08-06 14:05:07'),
(4, 'Panipat', 98, '1754489241_IOCL-Refinery.jpg', '2025-08-06 14:07:21', '2025-08-06 14:07:21'),
(6, 'kundli', 98, '1783924906_india.png', '2026-07-13 06:41:46', '2026-07-13 06:41:46'),
(7, 'Mumbai', 98, '1783925513_india.png', '2026-07-13 06:51:53', '2026-07-13 06:51:53'),
(8, 'Bengaluru', 98, '1783925584_india.png', '2026-07-13 06:53:04', '2026-07-13 06:53:04'),
(9, 'Chennai', 98, '1783925619_india.png', '2026-07-13 06:53:39', '2026-07-13 06:53:39'),
(10, 'Hyderabad', 98, '1783925645_india.png', '2026-07-13 06:54:05', '2026-07-13 06:54:05'),
(11, 'Kolkata', 98, '1783925673_india.png', '2026-07-13 06:54:33', '2026-07-13 06:54:33'),
(12, 'Pune', 98, '1783925701_india.png', '2026-07-13 06:55:01', '2026-07-13 06:55:01'),
(13, 'Ahmedabad', 98, '1783925743_india.png', '2026-07-13 06:55:43', '2026-07-13 06:55:43'),
(14, 'Jaipur', 98, '1783925780_india.png', '2026-07-13 06:56:20', '2026-07-13 06:56:20'),
(15, 'Lucknow', 98, '1783925806_india.png', '2026-07-13 06:56:46', '2026-07-13 06:56:46');

-- --------------------------------------------------------

--
-- Table structure for table `claimed_listings`
--

CREATE TABLE `claimed_listings` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `listing_id` int DEFAULT NULL,
  `listing_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `additional_info` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `status` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `claimed_listings`
--

INSERT INTO `claimed_listings` (`id`, `user_id`, `listing_id`, `listing_type`, `user_name`, `user_phone`, `additional_info`, `status`, `created_at`, `updated_at`) VALUES
(2, 43, 34, 'travel-tourism', 'singhharmanpreet646', '9898989898', 'This is my listing Please Check it now', 1, '2026-05-07 11:19:37', '2026-06-15 09:49:13'),
(4, 38, 3, 'hotel', 'Rahul Sharma', '9876543210', 'Test claim', 0, '2026-05-08 07:39:13', '2026-05-08 07:39:13'),
(5, 38, 2, 'custom', 'asdf', '2435', 'asdfasdf', 0, '2026-05-08 09:02:02', '2026-05-08 09:02:02'),
(7, 50, 32, 'custom', 'sdf', '5142541545', 'xdf', 0, '2026-07-15 10:16:12', '2026-07-15 10:16:12'),
(8, 50, 11, 'it-services', 'hgf', '3456789087', 'ogf', 0, '2026-07-15 10:37:39', '2026-07-15 10:37:39'),
(9, 17, 1, 'custom', 'vivek', '9971345053', 'testing', 1, '2026-07-15 10:38:26', '2026-07-15 10:40:12'),
(10, 50, 61, 'custom', 'karan', '9548924034', 'hello', 0, '2026-07-15 10:39:28', '2026-07-15 10:39:28'),
(11, 50, 29, 'custom', 'hello', '9548924034', 'jahvs', 0, '2026-07-15 10:39:58', '2026-07-15 10:39:58');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `has_read` int DEFAULT '0',
  `replied` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `address`, `message`, `has_read`, `replied`, `created_at`, `updated_at`) VALUES
(2, 'Sachin', 'sachin.webbraininfotech@gmail.com', '20', 'Tiegemberg 41', 'Hi,\n\nI am a digital marketing provider.\n\nI saw your present website & I can help you to improve your website on the top in GOOGLE Search.\n\nOur main focus will be to help generate more sales & online traffic.\n\nLet me know if you are interested, we will send you further details.\n\nThank You,\nSachin', 0, 0, '2025-08-09 19:04:17', '2025-08-09 19:04:17'),
(3, 'Nikita', 'nikita.rocketdigitaltech@gmail.com', '7532833829', 'Smaratun 92', 'Hi,\n\nJust had a look at your site – it’s well-designed, but not performing well in search engines.\n\nWould you be interested in improving your SEO and getting more traffic?\n\nI can send over a detailed proposal with affordable packages.\n\nWarm regards,\nNikita', 0, 0, '2025-08-13 17:53:58', '2025-08-13 17:53:58'),
(4, 'Abhishek sharma', 'davilsharma1999@gmail.com', '09717161203', 'D-3,12/4 Ramavihar mohd pur majri', 'Testing message from listify contact page', 0, 0, '2025-08-14 09:17:06', '2025-08-14 09:17:06'),
(5, 'Search Index', 'domain@search-indexer.net', '639000990', 'Dag Hammerskjoldstraat 177', 'Hi,\n\nRegister listify.asia to the Google Search Index to have it displayed in search results. Visit now: -&gt;\n\nhttps://SearchRegister.org/', 0, 0, '2025-08-17 16:38:47', '2025-08-17 16:38:47'),
(6, 'SEO Directory', 'join@seodlrectory.site', '25771033', 'Holmevej 84', 'Hi,\n\njoin our Search Engine - optmized directory for a quick improvement in traffic.\n\n\nAdd listify.asia to SEODIRECTORY now! -&gt;\n\n\nhttps://seodirectory.site', 0, 0, '2025-08-18 19:51:05', '2025-08-18 19:51:05'),
(7, 'Nikita', 'nikita.rocketdigitaltech@gmail.com', '7532833829', '3885 Bellwood Acres Rd', 'Hi,\n\nJust had a look at your site – it’s well-designed, but not performing well in search engines.\n\nWould you be interested in improving your SEO and getting more traffic?\n\nI can send over a detailed proposal with affordable packages.\n\nWarm regards,\nNikita', 0, 0, '2025-08-19 08:59:10', '2025-08-19 08:59:10'),
(8, 'Deepa Sharma', 'deepa.dgtlsolution@gmail.com', '9266141479', '22 Yarra Street', 'Hello,\n\nYour website is not ranking well on Google.\n\nI can help you in putting your website on the Google\'s top-3 Rank and getting more customers Guaranteed.\n\nWould you like to me seo proposal your business site\n\nIf you are interested, I can send you our strategies and pricing.\n\nBest Regards,\nDeepa', 0, 0, '2025-08-23 17:00:57', '2025-08-23 17:00:57'),
(9, 'Nikita', 'nikita.rocketdigitaltech@gmail.com', '7532833829', 'Ul. Kokota Jozefa 111', 'Hi,\n\nI\'m Nikita, and I\'m part of a leading SEO company based in India.\n\nWe specialize in achieving top rankings for our clients\' websites on Google and other major search engines, ensuring high revenue and top page rank within a guaranteed 3-4 months.\n\nWe\'re excited to present you with a special SEO package that includes:\n\n•Detailed Website Audit\n•Keyword research\n•Competitor Analysis\n•Meta tags optimizations\n•Content Optimization\n•Article Posting(Weekly)\n•Blog Posting\n•Guest Posting\n•Article Submissions\n•Blog Submissions\n•Heading tag changes\n•Alt tag changes\n•Interlinking wherever required.\n•Keyword Density in site content.\n•HTML Site Map\n•XML site map and Submission in webmaster tool\n•Link Building & Marketing\n\n\nIf you\'re interested, we\'d love to analyze your website and suggest the best strategy for you. Please share your website URL along with up to 10 keywords to get started.\n\nLooking forward to your positive reply.\n\nBest regards,\nNikita', 0, 0, '2025-08-25 07:00:37', '2025-08-25 07:00:37'),
(10, 'Search Index', 'domains@searchindexing.pro', '537696754', 'Ul. Sarbinowska 56', 'Hi,\n\nRegister listify.asia in the Google Search Index and it will be displayed in search results. Visit now:\n\nhttps://SearchRegister.org/', 0, 0, '2025-08-27 16:43:20', '2025-08-27 16:43:20'),
(11, 'Nikita', 'nikita.rocketdigitaltech@gmail.com', '7532833829', 'Parkring 49', 'Hi,\n\nYour website is not ranking well on Google.\n\nI can help you in putting your website on the Google\'s top-3 Rank and getting more customers Guaranteed.\n\nWould you like to me seo proposal your business site\n\nI can send over a detailed proposal with affordable packages.\n\nWarm regards,\nNikita', 0, 0, '2025-08-28 11:21:24', '2025-08-28 11:21:24'),
(12, 'Joanna Riggs', 'joannariggs278@gmail.com', '670366799', 'Nieuwe Parklaan 28', 'Hi,\n\nI just visited listify.asia and wondered if you\'d ever thought about having an engaging video to explain what you do?\n\nOur prices start from just $195 (USD).\n\nLet me know if you\'re interested in seeing samples of our previous work.\n\nRegards,\nJoanna\n\nUnsubscribe: https://unsubscribe.video/unsubscribe.php?d=listify.asia', 0, 0, '2025-09-03 15:27:24', '2025-09-03 15:27:24'),
(13, 'Stephaine Meier', 'stephaine.meier@gmail.com', '8173161742', '3721 Oliver Street', 'Hey from SeoBests,\n\nImprove your website’s SEO performance, grow your search appearance and gain powerful backlinks!\nBuy the most effective SEO services all on one platform - SeoBests.com\n\nView current SEO bonuses:\n50% DISCOUNT - Monthly SEO Campaigns + Up To 5,000 Backlinks FOR FREE:\n\nSeoBests.com/DEAL\nOr click shortlink: https://tiny.cc/SeoBests\n\nBrowse through a lot of SEO services, 100+ deals online, and top-tier specialists.\n\nSeoBests.com - your leading SEO backlinks store.', 0, 0, '2025-09-09 23:19:34', '2025-09-09 23:19:34'),
(15, 'Joanna Riggs', 'joannariggs278@gmail.com', '42795701', 'Lodskovvej 61', 'Hi,\n\nI just visited listify.asia and wondered if you\'ve ever considered an impactful video to advertise your business? Our videos can generate impressive results on both your website and across social media.\n\nOur videos cost just $195 (USD) for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\n\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\n\nRegards,\nJoanna\n\nUnsubscribe: https://unsubscribe.video/unsubscribe.php?d=listify.asia', 0, 0, '2025-09-27 00:12:55', '2025-09-27 00:12:55'),
(16, 'Margaret Julia', 'royalredover@outlook.com', '3655905471', 'Via Torino 103', 'Hello,\n\nWe have a promotional offer for your website listify.asia.\n\nWhat if you could use the best AI models in the world without limits or extra costs? Now you can. With our brand-new AI-powered app, you\'ll have ChatGPT, Gemini Pro, Stable Diffusion, Cohere AI, Leonardo AI Pro, and more — all under one roof. No monthly subscriptions, no API key expenses, no experience required, just one dashboard, one payment, and endless possibilities.\n\nSee it in action: https://aistore.vinhgrowth.com\n\nYou are receiving this message because we believe our offer may be relevant to you. \nIf you do not wish to receive further communications from us, please click here to UNSUBSCRIBE: https://vinhgrowth.com/unsubscribe?domain=listify.asia\nAddress: 60 Crown Street, London\nLooking out for you, Margaret Julia', 0, 0, '2025-10-01 11:50:50', '2025-10-01 11:50:50'),
(17, 'Marianne Annunziata', 'marianne.annunziata@gmail.com', '3368397678', 'Via Leopardi 32', 'Hi,\n\nWe\'d like to introduce to you, ChatGPT 5 Mastery, a tool that allows you to profit with a done-for-you PLR package that’s ready to sell.\n\nHere’s what you get:\n\n1. A ready-made premium product in the hottest niche\n2. Instant authority in the booming AI & income market\n3. Done-for-you sales pages, emails, and graphics (no design/copy costs)\n4. Multiple ways to profit: sell it, use as a lead magnet, bundle with offers\n5. Full PLR rights—rebrand, resell, and keep 100% of the profits\n\nFind out more here:\nhttps://furtherinfo.info/chatgpt\n\nBest regards,\nMarianne', 0, 0, '2025-10-02 10:46:20', '2025-10-02 10:46:20'),
(18, 'Sonam Prajapati', 'sonam.dgtlsolution@gmail.com', '9266141479', '40 Quai Saint-Nicolas', 'Hi,\n\nI checked your website. You have an impressive site but ranking is not good on Google, Yahoo and Bing.Would you like to optimize your site?\n\n\nI will be happy to share with you our strategies with packages details.\n\n\nCan I send?\n\n\nWarm regards,\n\nSonam\"', 0, 0, '2025-10-09 12:17:29', '2025-10-09 12:17:29'),
(19, 'Alfonso Robey', 'mckeeknight85065@gmail.com', '92228533', 'Dybedalsveien 177', 'Hello,\n\nWant more visitors and clients for your listify.asia?\n\nAs a bonus, we can offer you a free SEO Audit and a free SEO Backlinks service.\n\nWe help websites get real visitors and real clients through proven online marketing methods.\n\nWould you like a quick free analysis of your site’s potential?\n\nBest regards,\nAlfonso from Digital Marketing Team\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nNorway, NA, Grimstad, 4877, Dybedalsveien 177\n\nTo stop any further communication through your website form, Please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2025-10-21 09:02:25', '2025-10-21 09:02:25'),
(20, 'Elijah Heaton', 'domains@indexersearch.pro', '694404215', 'Ij ihvhlgmd', 'Hello,\n\nYour listify.asia website needs to be indexed in Google Search Index for it  to appear in Web Search Results.\n\nSubmit  listify.asia at https://searchregister.net', 0, 0, '2025-10-23 17:10:33', '2025-10-23 17:10:33'),
(21, 'Luciana Crider', 'mckeeknight85065@gmail.com', '886256319', 'Ul. Kruszcowa 28', 'Your website listify.asia has some issues that...', 0, 0, '2025-10-24 08:56:12', '2025-10-24 08:56:12'),
(22, 'Deepak Parcha', 'parchad78@gmail.com', '7678308208', '53 Scotswood Road', 'Hi,\n \nHope you’re doing well!\n \nI’d love to help you with a fresh, modern, and high-performing website — whether you want to redesign your existing one or build a new site from scratch.\nWe work across all major platforms like Shopify, WordPress, Wix, Squarespace, and more.\n\nCould you please share your current website link (if any) and a reference website you like? That’ll help me share layout ideas, design suggestions, and an estimated timeline.\n \nLooking forward to your reply!\n \nBest,\nDeepak', 0, 0, '2025-10-24 10:00:20', '2025-10-24 10:00:20'),
(23, 'Jaimie Chewings', 'domains@domainindex.pro', '403890895', 'Fxtscmvu Aq Cy', 'Hello,\n\nHave your listify.asia website indexed in Google Search Index for it  to appear in Web Search Results.\n\nRegister listify.asia at https://searchregister.net', 0, 0, '2025-10-24 15:28:27', '2025-10-24 15:28:27'),
(24, 'Denise Toombs', 'join@seo-today.pro', '5176765368', '515 Haven Lane', 'Hello,\n\nAddr listify.asia website to SEODIRECTORY to get a better ranking in Web Searches.\n\nTry it for free:\n\nAdd it now at https://seodir.pro', 0, 0, '2025-10-26 19:52:47', '2025-10-26 19:52:47'),
(25, 'Deepak Parcha', 'parchad78@gmail.com', '7678308208', 'Holtagata 22', 'Hi,\nHope you’re doing well!\n\nI’d love to help you with a fresh, modern, and high-performing website — whether you want to redesign your existing one or build a new site from scratch.\n\nWe work across all major platforms like Shopify, WordPress, Wix, Squarespace, and more.\n\nCould you please share your current website link (if any) and a reference website you like?\n\nThat’ll help me share layout ideas, design suggestions, and an estimated timeline.\n\nLooking forward to your reply!\n \nBest,\nDeepak', 0, 0, '2025-10-28 12:10:27', '2025-10-28 12:10:27'),
(26, 'Colby Gillis', 'mckeeknight85065@gmail.com', '745773263', '46 Cunningham Street', 'Hello,\n\nYour website has some issues, take a look: https://www.seoptimer.com/listify.asia\n\nWe can help fix these issues and improve your backlink profile.\n\nClaim your first SEO Backlink service for free, so you can see results before committing.\n\nAre you interested?\n\nBest regards,\nColby from Digital Marketing Team\n\n\n\n\n\n\n\n\n\n\nAustralia, QLD, Dargal Road, 4455, 46 Cunningham Street\nTo stop any further communication through your website form, Please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2025-10-28 19:59:51', '2025-10-28 19:59:51'),
(27, 'Jesus Kernot', 'tu.rnerfisher348382+jesus.kernot@gmail.com', '3488441807', 'Strada Bresciana 5', 'We can create a free professional video for listify.asia to help attract more customers and make your site stand out,  want to see it?', 0, 0, '2025-11-05 13:10:20', '2025-11-05 13:10:20'),
(28, 'Karol Garvin', 'parker.harrison31023+karol.garvin@gmail.com', '756960910', '25 Albert Street', 'Hey, noticed listify.asia could use more visitors — want to try our Free Website Traffic?', 0, 0, '2025-11-11 11:14:46', '2025-11-11 11:14:46'),
(29, 'Wilbur Satterwhite', 'register@domainssubmlt.net', '640725561', 'Pocsavjytwx', 'Addr your listify.asia website to Google Search Index and it will be displayed in Web Search Results.\n\nRegister listify.asia at https://searchregister.org', 0, 0, '2025-11-12 18:03:38', '2025-11-12 18:03:38'),
(30, 'Nick Kim', 'aboout@airegistry.pro', '7022294162', '17 George Street', 'More and more people skip Google Search and ask ChatGPT to search for everything.\n\nAdd listify.asia to our AI-optimized directory to help them find listify.asia\n\nJoin now: https://AIREG.pro/', 0, 0, '2025-11-13 21:54:08', '2025-11-13 21:54:08'),
(31, 'Deepak Parcha', 'parchad78@gmail.com', '9217127210', '9 Boat Lane', 'Hi https://www.listify.asia/contact-us,\nI help businesses build modern, high-performing websites that attract more customers and strengthen their online presence. With 8 years of experience in custom website design and development, I can help you create a fast, responsive, and user-friendly website that effectively represents your brand and drives results.\n\nIf you’re interested, please share:\n\n1.Reference websites you like.\n\n2.Your business type or niche.\n\n3.Any specific features or goals for the new website.\n\nOur team will then prepare a detailed proposal with design options and development packages.\nIf possible, we can also schedule an online meeting to walk you through the proposal and discuss the best approach for your project.\n\nLooking forward to hearing from you.\nThank you,\nDeepak Parcha', 0, 0, '2025-11-18 01:57:33', '2025-11-18 01:57:33'),
(32, 'Gemma Marshall', 'gemmamarshall811@gmail.com', '49', 'Zeppelinstr 40', 'Hi there,\n\nWe run an Instagram growth service, which increases your number of followers both safely and practically. \n\n- Real, human followers: People follow you because they are interested in your business or niche.\n- Safe: All actions are made manually. We do not use any bots.\n- The price is from just $60 per month, and we can start immediately.\n\nIf you\'d like to see some of our previous work, let me know, and we can discuss it further.\n\nKind Regards,\nGemma', 0, 0, '2025-11-22 02:24:56', '2025-11-22 02:24:56'),
(33, 'Hollie Weiland', 'parkerhar.rison31023+hollie.weiland@gmail.com', '9231734031', 'Fontenay 13', 'Ready to boost listify.asia audience quickly? Get your Free Demo.', 0, 0, '2025-11-23 15:11:50', '2025-11-23 15:11:50'),
(34, 'Ferdinand Vanburen', 'new@submitdomains.pro', '406085138', 'Knmsg Av zz S', 'Hi,\n\nList listify.asia website to Google Search Index to be displayed in Google Search Results!\n\nAdd listify.asia at https://searchregister.info', 0, 0, '2025-11-24 23:31:29', '2025-11-24 23:31:29'),
(35, 'Leonida Garrity', 'leonida.garrity58@gmail.com', '92', 'Kimpling 61', 'Do you want to discover how emails can create real cash flow online? See https://rb.gy/uxe0l2', 0, 0, '2025-11-27 02:07:50', '2025-11-27 02:07:50'),
(36, 'Lloyd Kaiser', 'mckee.knight85065+lloyd.kaiser@gmail.com', '3316616528', 'Via Venezia 76', 'Ready to see listify.asia gain real SEO power? Access here: https://rb.gy/19b0ah', 0, 0, '2025-11-30 21:42:16', '2025-11-30 21:42:16'),
(37, 'Emma Wilson', 'emma.wilson1768@gmail.com', '8862842604', 'Rua Tabeliao Antonio Almeida 61', 'Hi,\n\nI came across listify.asia and wanted to connect.\n\nWe specializes in helping websites expand their reach and get their content in front of the right people.\n\nWe\'ve developed a process that can significantly boost online visibility, whether you\'re focused on building a strong local presence or reaching a global audience (over 30 million).\n\nIf growing your audience is a priority right now, which of these is more relevant to your current goals?\n\nIf you would like further information on our services, please get back in touch.\n\nThanks for your time,\nEmma', 0, 0, '2025-12-02 00:50:44', '2025-12-02 00:50:44'),
(38, 'Lashawnda Francois', 'mckeeknight.85065+lashawnda.francois@gmail.com', '884266221', 'Ul. Chelmonskiego Jozefa 29', 'Curious how backlinks can improve listify.asia visibility? Tap to begin: https://rb.gy/19b0ah', 0, 0, '2025-12-02 11:41:10', '2025-12-02 11:41:10'),
(39, 'Jayme Townson', 'park.erharrison31023+jayme.townson@gmail.com', '126241155', '75 Faubourg Saint Honore', 'Wondering how to get real traffic for listify.asia? Launch here: https://rb.gy/p82gvr', 0, 0, '2025-12-06 06:17:22', '2025-12-06 06:17:22'),
(40, 'Joanna Riggs', 'joannariggs278@gmail.com', '261307360', '48 West Street', 'Hi,\n\nI just visited listify.asia and wondered if you\'d ever thought about having an engaging video to explain what you do?\n\nOur prices start from just $195 (USD).\n\nLet me know if you\'re interested in seeing samples of our previous work.\n\nRegards,\nJoanna\n\nUnsubscribe: https://unsubscribe.video/unsubscribe.php?d=listify.asia', 0, 0, '2025-12-10 03:45:18', '2025-12-10 03:45:18'),
(41, 'Lorraine Barton', 'lorrainebartonseo@gmail.com', '3417170696', 'Via Giotto 101', 'Hi,\n\nI recently checked out listify.asia and wanted to share our approach to safe and effective link building.\n\nOur backlink service is built around quality and transparency, designed to increase your Domain Authority and search rankings without risk.\n\nThe Benefits of Our Manual Service:\n\n1. Google-Friendly Growth: We provide high-quality links from high-traffic, established domains that significantly improve your search engine standing.\n2. Safety First: Every link is built manually by our team—no automated tools—ensuring a safe, natural, and penalty-proof profile.\n3. Comprehensive Diversity: You get 14 diverse placements from Articles, Blog Posts, Web 2.0, Profiles, and more, creating a robust and natural link distribution.\n4. Proof of Work: A detailed, easy-to-read report is delivered the moment the service is complete.\n\nI\'d be happy to send over a sample report or answer any questions you have about our process. Which would be most helpful?\n\nKind Regards, Lorraine', 0, 0, '2025-12-19 14:56:56', '2025-12-19 14:56:56'),
(42, 'Miriam Amies', 'miriam.amies@msn.com', '4972190711', 'Luckenwalder Strasse 46', 'Upgrade listify.asia SEO performance, grow your search visibility and generate powerful backlinks! \nBonusBacklinks.com - we provide daily backlinks and drive website visits to your website EVERY DAY:\n\n+ Take 85% OFF\n+ Quality daily backlinks\n+ Organic website traffic\n+ Prices cheap as $1\n+ Bonus coupon codes:\n\nhttps://tiny.cc/bonusbacklinks-coupon\n\nBonusBacklinks.com - daily backlinks and organic visits to grow your webpage every day', 0, 0, '2025-12-31 03:54:29', '2025-12-31 03:54:29'),
(43, 'Marilyn Aitken', 'turnerfishe.r348382+marilyn.aitken@gmail.com', '3572869068', 'Via Castelfidardo 7', 'Want more targeted traffic for listify.asia? Start your Free Test.\n\nGo to the https://rb.gy/kkhq2m, fill in your site details, then apply the coupon FREE_TRAFFIC at checkout to get the product free for 7 days.\n\nDon’t forget to create a free account.\n\n\n\n\n\n\n\n\n\n\nTo unsubscribe, please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2026-01-01 10:09:10', '2026-01-01 10:09:10'),
(44, 'Joanna Riggs', 'joannariggs83@gmail.com', '8382713356', 'Potsdamer Platz 79', 'Hi,\n\nI just visited listify.asia and wondered if you\'ve ever considered an impactful video to advertise your business? Our videos can generate impressive results on both your website and across social media.\n\nOur videos cost just $195 (USD) for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\n\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\n\nRegards,\nJoanna', 0, 0, '2026-01-02 22:21:30', '2026-01-02 22:21:30'),
(45, 'Janet Julian', 'ruchiuyou@gmail.com', '3759314331', 'Via Gaetano Donizetti 109', 'Hi. We run a YouTube growth service, which increases your number of subscribers both safety and practically.\n\n- We guarantee to gain you new 300-500 subscribers per month\n- People subscribe because they are interested in your videos/channel, increasing video likes, comments and interaction.\n- All actions are made manually by our team. We do not use any bots.\n\nThe price is just $60 (USD) per month, and we can start immediately. If you are interested and would like to see some of our previous work, let me know and we can discuss further.\n\nKind Regards,\n\nTo Unsubscribe, reply with the word unsubscribe in the subject.', 0, 0, '2026-01-05 06:21:11', '2026-01-05 06:21:11'),
(46, 'Nikita Joshi', 'nikitajoshi.sale@gmail.com', '7532833829', '59 Rue Frederic Chopin', 'Hi https://www.listify.asia/contact-us,\n\nI noticed that your website has great potential but is not currently ranking in the top search results on Google.\n\nI specialize in SEO and can help your business rank in the Top 3 positions, get more visibility, and ultimately increase your customer base â€\" guaranteed!\n\nWould you like me to send a quick SEO proposal with pricing and strategies?\n\nBest regards,\nNikita', 0, 0, '2026-01-07 19:49:35', '2026-01-07 19:49:35'),
(47, 'Gemma Marshall', 'gemmamarshall811@gmail.com', '476220365', '93 Boulevard De Normandie', 'Hi,\n\nAre you looking to grow your Instagram audience (or perhaps launch a new page)?\n\nWe run a manual Instagram service that acts as your dedicated assistant. We can build your profile from scratch or grow your existing account by 300+ real followers a month.\n\nAll work is done manually on real phones—no bots—starting at just $60/month.\n\nMind if I send over the details?\n\nKind Regards,\nGemma\n\nhttps://unsubscribe.social/unsubscribe.php?d=listify.asia', 0, 0, '2026-01-11 00:39:12', '2026-01-11 00:39:12'),
(48, 'Virgil Beckman', 'virgil.beckman@hotmail.com', '3420773115', 'Via Rocca De Baldi 124', 'I make money daily using the program — it automates email sending, sends buyers, and collects sales automatically. No experience required, no paid ads, nothing to sell — just plug in and watch results.\n\nStart using Email Cash Machine and start earning immediately:  https://rb.gy/uxe0l2', 0, 0, '2026-01-13 06:38:27', '2026-01-13 06:38:27'),
(49, 'Elva Stubbs', 'join@seo4listify.asia', '71359284', 'Handvarkervej 34', 'Hi,\n\nList listify.asia in S.E.O. DIRECTORY for a better ranking in the Search Results order.\n\nJoin at https://SEODIR.pro', 0, 0, '2026-01-13 21:02:56', '2026-01-13 21:02:56'),
(50, 'Lamont Greenwell', 'better@ai-listify.asia', '7033892190', 'Hallesches Ufer 48', 'Users search using AI more & more.\n\nAdd listify.asia to our AI-optimized directory now to increase your chances of being recommended / mentioned.\n\nList it here:  https://AIREG.pro', 0, 0, '2026-01-14 23:31:33', '2026-01-14 23:31:33'),
(51, 'Luca Broinowski', 'broinowski.luca@gmail.com', '4261705', 'Gar?Avegur 67', 'Want to increase listify.asia’s online audience? Launch today: https://rb.gy/p82gvr', 0, 0, '2026-01-17 17:03:43', '2026-01-17 17:03:43'),
(52, 'Lori Shultz', 'yiyayova@gmail.com', '6887959701', 'Schmiedsberg 89', 'Hello,\n\nWe have a special opportunity that could significantly boost traffic and visibility for your website listify.asia.\n\nWhat if you could drive real, targeted website traffic automatically using AI — without paid ads, complicated setups, or ongoing management?\n\nThat’s exactly what AI Traffic Whale delivers.\n\nAI Traffic Whale uses advanced AI technology to generate consistent, high-quality traffic from multiple sources, helping websites increase exposure, improve engagement, and grow faster — all on autopilot. No technical skills required, no monthly ad spend, and no complex tools to manage.\n\nYou set it up once, and the AI does the work for you.\n\n See how it works here: https://traffic.vinhgrowth.com\n\nYou are receiving this message because we believe this offer may be relevant to your website.\n\nIf you do not wish to receive further communications from us, please click here to UNSUBSCRIBE:\n\nhttps://vinhgrowth.com/unsubscribe?domain=listify.asia\n\nAddress: 60 Crown Street, London\n\nLooking out for you,\n\nLori Shultz', 0, 0, '2026-01-20 16:29:47', '2026-01-20 16:29:47'),
(53, 'Joanna Riggs', 'joannariggs211@gmail.com', '6048782182', '4014 Sixth Street', 'Hi,\n\nI just visited listify.asia and wondered if you\'ve ever considered an impactful video to advertise your business? Our videos can generate impressive results on both your website and across social media.\n\nOur prices start from just $195 (USD).\n\nLet me know if you\'re interested in seeing samples of our previous work.\n\nRegards,\nJoanna', 0, 0, '2026-01-21 17:17:17', '2026-01-21 17:17:17'),
(54, 'Austin Hinkle', 'better@ai-listify.asia', '240053696', '2 Sale Street', 'Users search using AI more & more.\n\nAdd listify.asia to our AI-optimized directory now to increase your chances of being recommended / mentioned.\n\nList it here:  https://AIREG.pro', 0, 0, '2026-01-23 20:48:31', '2026-01-23 20:48:31'),
(55, 'Kandis Crookes', 'turnerfisher3.48382+kandis.crookes@gmail.com', '31436560', 'Mosegardsvej 69', 'Searching for increased visibility for Listify Asia?\n\nOur team offers high-impact marketing tools built to improve your rankings. We specialize in YouTube Video Ranking and diverse backlink campaigns such as Web 2.0, Wiki, and Blog Comments. Our services are optimized to help you dominate search results at affordable rates.\n\nSee how we can boost your rankings here: https://rb.gy/t7gc5i\n\nThank you, Kandis\n\n\n\n\n\n\n\n\n\nTo unsubscribe, please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2026-01-27 18:59:14', '2026-01-27 18:59:14'),
(56, 'Lisa', 'lisa.99seosolutionworld@gmail.com', '8468088599', '3624 Vine Street', 'Hello https://www.listify.asia/contact-us,\n\nI checked your website. You have an impressive site but ranking is not good on Google, Yahoo and Bing.\n\nWould you like to optimize your site?\n\nIf you’re interested, then I will send you SEO Packages and strategies.\n\nCan I send?\n\nWarm regards,\nLisa', 0, 0, '2026-02-01 14:09:01', '2026-02-01 14:09:01'),
(57, 'Candra Plumlee', 'better@ai-listify.asia', '495063023', '25 Rue De La Pompe', 'Users search using AI more & more.\n\nAdd listify.asia to our AI-optimized directory now to increase your chances of being recommended / mentioned.\n\nList it here:  https://AIREG.pro', 0, 0, '2026-02-05 00:31:38', '2026-02-05 00:31:38'),
(58, 'Chad Fredericks', 'join@seo4listify.asia', '8532754465', 'Ziegelstr. 69', 'Hi,\n\nList listify.asia in S.E.O. DIRECTORY for a better ranking in the Search Results order.\n\nJoin at https://SEODIR.pro', 0, 0, '2026-02-06 02:07:20', '2026-02-06 02:07:20'),
(59, 'Kate Armstrong', 'katearmstrong1976@gmail.com', '56', 'Lettental 55', 'Hi there,\n\nWe run a YouTube growth service, which increases your number of subscribers both safely and practically.\n\n- We guarantee to gain you 400+ subscribers per month.\n- People subscribe because they are interested in your channel/videos, increasing likes, comments and interaction.\n- All actions are made manually by our team. We do not use any \'bots\'.\n\nThe price is just $90 (USD) per month, and we can start immediately.\n\nIf you have any questions, let me know, and we can discuss further.\n\nKind Regards,\nKate\n\nOpt-out: https://unsubscribe.social/unsubscribe.php?d=listify.asia', 0, 0, '2026-02-11 21:02:37', '2026-02-11 21:02:37'),
(60, 'Lisa', 'lisa.99seosolutionworld@gmail.com', '8468088599', 'Aspernstrasse 66', 'Hello https://www.listify.asia/contact-us,\n\nI’d like to discuss SEO support that can improve your online visibility.\n\nIf interested, I’ll share our detailed SEO packages with pricing.\n\nBest Regards,\nLisa', 0, 0, '2026-02-12 22:14:50', '2026-02-12 22:14:50'),
(61, 'Sam Wentcher', 'sam.wentcher@gmail.com', '7071423451', '13 Great North Road', 'Do you require premium Proxy infrastructure for Listify Asia?\n\nIf you require reliable connections, this service is the perfect choice. You get unmetered traffic, quick access, and great pricing with solid uptime.\n\nAccess the website here: https://fas.st/t/4Sd3661X\n\nRegards, Sam', 0, 0, '2026-02-15 04:46:04', '2026-02-15 04:46:04'),
(62, 'Siobhan Grieve', 'form@ebr-listify.asia', '5733606068', '3737 Maple Court', 'Dear listify.asia owner,\n\nUpdate your company\'s information in Eu Business Register for 2026/2027.\n\nUpdating is free. Find the form at: ebr-form.pro', 0, 0, '2026-02-18 21:42:42', '2026-02-18 21:42:42'),
(63, 'Lyn Magnuson', 'lyn.magnuson@gmail.com', '134293357', '42 Rue Des Six Freres Ruellan', 'In search of high-speed Proxy tools for Listify Asia?\n\nIf you require optimal results, this is the ideal solution. Access unlimited data, instant activation, and great pricing with reliable uptime.\n\nView the offer: https://fas.st/t/4Sd3661X\n\nRegards, Lyn', 0, 0, '2026-02-24 03:47:22', '2026-02-24 03:47:22'),
(64, 'Web Agency', '99usd@new-listify.asia', '6785678007', '246 Hanifan Lane', 'Hi,\n\nWe’d love to create a brand-new, professional website for listify.asia or your next project.\n\nFrom fresh builds to updates or redesigns, we’re here to help.\n\nVisit us at: 99usdweb.site', 0, 0, '2026-02-27 22:17:58', '2026-02-27 22:17:58'),
(65, 'Anaya', 'anaya.dgtlsolution@gmail.com', '9266141479', 'Glennerstrasse 128', 'Hi https://www.listify.asia/contact-us,\n\nI would like to discuss a business SEO.\n\nLet me know if you are interested, then I can send you our Full SEO Packages with plan, activities, and Price list.\n\nBest Regards,\nAnaya', 0, 0, '2026-03-05 15:07:40', '2026-03-05 15:07:40'),
(66, 'Jayrn Smith', 'phillis.linderman@yahoo.com', '7738795461', '3842 Point Street', 'Hi, it’s Jayrn.\n\nWant to find \"hidden money\" in your business? Dan shares exactly how to exponentially increase your cashflow and the value of your company with these 5 Key Strategies. \n\nFind out how to find your customer \"trigger points\" so you know how to market and sell to them. And the best part is... it\'s way easier than you think!\n\nLearn More: https://marketersmentor.com/hidden-money.php?refer=listify.asia\n\nJayrn\n\n\n\n\n\n\n\n\nUnsubscribe: \nhttps://marketersmentor.com/unsubscribe.php?d=listify.asia', 0, 0, '2026-03-09 22:23:55', '2026-03-09 22:23:55'),
(67, 'Jayrn Smith', 'icely.letha@gmail.com', '6641217837', 'Lerchenfelder Stra?E 17', 'Hi, it’s Jayrn.\n\nDo you want to stop chasing fleeting tactics and finally build a predictable, consistent flood of high-quality customers?\n\nIf so, you’re going to love this: https://marketersmentor.com/nobsletter.php?refer=listify.asia\n\nDan Kennedy, the \"Renegade Millionaire Maker\" who has guided the empires of marketing legends like Ryan Deiss and Frank Kern, has teamed up with Russell Brunson to open his private vault for the first time. \n\nTogether, they are revealing the exact frameworks that generated 95% of the revenue across millions of analyzed funnels.\n\nIf you’ve been suffering from \"ADHD Marketing\"—hopping from one social media trend to another while your ad budget disappears with no ROI—you need to see this:\n\nhttps://marketersmentor.com/nobsletter.php?refer=listify.asia\n\nRight now, you can \"test-drive\" their combined wisdom for 30 days and claim a $19,997 value stack of bonuses—including a massive 653-page physical swipe file of the world\'s most profitable funnels—simply by saying \"maybe\". \n\nThis is the end of the \"tactic-hopping\" nightmare and the beginning of a business that runs like clockwork.\n\nTo multiplying your leverage,\nJayrn\n\n\n\nMy Blog:\nhttps://www.jayrn.com\nUnsubscribe: \nhttps://marketersmentor.com/unsubscribe.php?d=listify.asia', 0, 0, '2026-03-16 15:31:44', '2026-03-16 15:31:44'),
(68, 'Klaus Morice', 'turnerfishe.r348382+klaus.morice@gmail.com', '3042177749', '2923 Tavern Place', 'I saw that listify.asia has great potential, however, competitors are taking your organic traffic because they have stronger backlinks.\n\nUpgrade your rankings with our proven, high-authority backlink services—test it out, you won\'t regret the return on investment.\n\nStop losing clients and start owning your search results: https://rb.gy/brgbb3\n\n\n\n\n\n\n\n\n\n\nTo unsubscribe, please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2026-03-23 18:21:17', '2026-03-23 18:21:17'),
(69, 'Joanna Riggs', 'joannariggs211@gmail.com', '7030305881', '82 Ramsgate Rd', 'Hi,\n\nI just visited listify.asia and wondered if you\'ve ever considered an impactful video to advertise your business? Our videos can generate impressive results on both your website and across social media.\n\nOur prices start from just $195 (USD).\n\nLet me know if you\'re interested in seeing samples of our previous work.\n\nRegards,\nJoanna', 0, 0, '2026-03-26 02:11:47', '2026-03-26 02:11:47'),
(70, 'Paula Oneill', 'turnerfisher348.382+paula.oneill@gmail.com', '4273437', 'Skolastigur 50', 'Social media taking too much time for you?\n\nWe offer full Social Media Management, content creation, and engagement services to keep your brand visible across all platforms.\n\nGo to site here:  https://rb.gy/8ddzt2\n\n\n\n\n\n\n\n\n\n\nTo unsubscribe, please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2026-04-03 04:34:36', '2026-04-03 04:34:36'),
(71, 'Sara', 'sara.brandelo@gmail.com', '62', '8 Campbells River Road', 'Hi https://www.listify.asia/contact-us,\n\nA strong online presence starts with a well-designed, user-friendly website. We create visually appealing and high-performing websites that help brands stand out and turn visitors into customers.\n\nI’d be happy to suggest a few practical improvements that could increase engagement and drive better results for your business.\n\nLooking forward to your reply.\n\nThank you.\nSara', 0, 0, '2026-04-09 17:32:48', '2026-04-09 17:32:48'),
(72, 'Jayrn Smith', 'tawnya.oswalt@msn.com', '2534163742', '4950 Hillcrest Drive', 'Hi, it’s Jayrn.\n\nEvery market has one rule: He who can spend the most to acquire a customer, wins. But here’s the question nobody answers: How do you actually do it?\n\nIn this video, Darcy Juarez walk through the single number that separates the amateurs from the market dominators—Maximum Allowable Cost Per Acquisition. \n\nGet this wrong, and you’ll bleed cash. Get it right, and you’ll buy customers at scale while your competitors are stuck Googling cheaper ad hacks.\n\nWatch it here: https://marketersmentor.com/crush-your-competition.php?refer=listify.asia\n\n\nTo multiplying your leverage,\nJayrn\n\nP.S.: I’m Jayrn, a digital marketer and e-commerce seller with a passion for sharing knowledge. I share proven strategies, tips, and resources to help you grow your online business.\n\n\n\nMy Blog:\nhttps://www.jayrn.com\nUnsubscribe: \nhttps://marketersmentor.com/unsubscribe.php?d=listify.asia', 0, 0, '2026-04-17 14:35:57', '2026-04-17 14:35:57'),
(73, 'Joanna Riggs', 'joannariggs278@gmail.com', '199685361', '6 Rue Cazade', 'Hi,\n\nI just visited listify.asia and wondered if you\'ve ever considered an impactful video to advertise your business? Our videos can generate impressive results on both your website and across social media.\n\nOur videos cost just $195 (USD) for a 30 second video ($239 for 60 seconds) and include a full script, voice-over and video.\n\nI can show you some previous videos we\'ve done if you want me to send some over. Let me know if you\'re interested in seeing samples of our previous work.\n\nRegards,\nJoanna', 0, 0, '2026-04-18 19:40:37', '2026-04-18 19:40:37'),
(74, 'Jayrn Smith', 'hobbs.teodoro@googlemail.com', '2630233920', 'Storkower Strasse 90', 'Hey,it’s Jayrn.\n\nThere’s a pattern I keep seeing…\n\nPeople who *work hard*, try different strategies, even invest in tools…\n\n…but still don’t see consistent results.\n\nIt’s not because they’re lazy.\nIt’s not because they’re unlucky.\n\nIt’s because they’re following **disconnected advice**.\n\nOne strategy here.\nAnother tactic there.\n\nNo real understanding of what actually drives revenue.\n\nAnd when you don’t understand the “why”…\n\nYou’re stuck guessing.\n\n---\n\nThat’s exactly where I was.\n\nUntil I started studying something different:\n\nNot surface-level tactics…\n\n…but the **actual thinking behind successful marketing campaigns**.\n\nThat’s when things finally started to click.\n\n---\n\nIf you want to see what I mean, take a look at this:\n\n https://marketersmentor.com/NO-BS-Letter.php?refer=listify.asia\n\nEven just reading the page will shift how you think about marketing.\n\nMore tomorrow.\n\n—\nJayrn\n\nP.S.: I’m Jayrn, a digital marketer and e-commerce seller with a passion for sharing knowledge. I share proven strategies, tips, and resources to help you grow your online business.\n\n\n\nMy Blog:\nhttps://www.jayrn.com\nUnsubscribe: \nhttps://marketersmentor.com/unsubscribe.php?d=listify.asia', 0, 0, '2026-04-22 00:20:40', '2026-04-22 00:20:40'),
(75, 'Deepa', 'deepa.sale01@gmail.com', '55', 'Joachimstaler Str. 65', 'Hi https://www.listify.asia/contact-us,\n\nI checked your website. It has a good design, but its ranking on Google, Yahoo, and Bing is not strong.\n\nWould you like to optimize your website for better visibility and traffic?\n\nI can share our SEO strategies along with package details. If you’re interested, please share your mobile number.\n\nShall I send the details?\n\nThank you,\nDeepa', 0, 0, '2026-04-24 07:13:39', '2026-04-24 07:13:39'),
(76, 'Edgar Kerrigan', 'turnerfisher348382+edgar.kerrigan@gmail.com', '4724497288', 'Angsv 60', 'Do you want increased traffic and leads for your website?\n\nA site with no visitors leads to lost revenue every single day. Without steady traffic, you are losing business to your competitors and missing out on revenue.\n\nDon\'t lose any more sales. Get the visitors you deserve right now:  https://rb.gy/kkhq2m\n\n\n\n\n\n\n\n\n\n\nTo unsubscribe, please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2026-04-29 19:52:45', '2026-04-29 19:52:45'),
(77, 'ravit', 'chhabraravit199@gmail.com', '7419287536', 'kundli', 'just testing', 0, 0, '2026-05-05 10:37:20', '2026-05-05 10:37:20'),
(78, 'Ravit Chhabra', 'chhabraravit@gmail.com', '12345678', 'kundli', 'testttttttttttttttttttt', 0, 0, '2026-05-06 05:37:30', '2026-05-06 05:37:30'),
(79, 'hlhiooxyxn', 'gyuenjnv@immenseignite.info', '1186', 'hyemjktyxx', 'exezilvenhglmvpmhlzhfhmhgtkqms', 0, 0, '2026-05-07 12:49:25', '2026-05-07 12:49:25'),
(80, 'Gemma Marshall', 'gemmamarshall811@gmail.com', '50482478', 'Slotsgade 51', 'Hi,\n\nI was just looking at listify.asia and wanted to ask: are you looking to scale your Instagram presence right now?\n\nWe help brands like yours add 300+ targeted Instagram followers every month using manual outreach and ads. We can grow your existing page or even build a brand-new profile from scratch for you if you\'d prefer a fresh start.\n\nIf this is something of interest, you can find out more information here:\n\nhttps://furtherinfo.info/instagram\n\nIf you are not interested, either ignore this email or you can use the link further down.\n\nThanks for your time,\nGemma\n\nUnsubscribe: https://unsubscribe.social/unsubscribe.php?d=listify.asia', 0, 0, '2026-05-12 03:50:05', '2026-05-12 03:50:05'),
(81, 'Christen Wallis', 'turnerfishe.r348382+christen.wallis@gmail.com', '537383685', 'Ul. Kopernika Mikolaja 10', 'Would you like to generate more leads through high-retention traffic?\n\nhttp://utraker.com/JNbzf\n\n\n\n\n\n\n\n\n\n\nTo unsubscribe, please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2026-05-22 08:13:55', '2026-05-22 08:13:55'),
(82, 'Nancy', 'nancy.99seosolutionworld@gmail.com', '8468088599', 'Stadtplatz 13', 'Hello https://www.listify.asia/contact-us,\n\nI noticed some technical SEO issues on your website that might be affecting its performance on Google.\n\nIf you’re interested, please share your target keywords and target locations.\n\nWould you like me to share it?\n\nThank you,\nNancy', 0, 0, '2026-05-28 23:07:52', '2026-05-28 23:07:52'),
(83, 'Joanna Riggs', 'joannariggs278@gmail.com', '559769088', 'Schuetzenweg 133', 'Hi,\n\nI just visited listify.asia and wondered if you\'ve ever considered an impactful video to advertise your business? Our videos can generate impressive results on both your website and across social media.\n\nOur prices start from just $195 (USD).\n\nLet me know if you\'re interested in seeing samples of our previous work.\n\nRegards,\nJoanna', 0, 0, '2026-06-12 07:55:45', '2026-06-12 07:55:45'),
(84, 'Brandon Philpott', 'turnerfisher3.48382+brandon.philpott@gmail.com', '367225345', '72 Boulevard Albin Durand', 'Do you need a massive traffic boost to jumpstart your new website?\n\nhttp://utraker.com/JNbzf?rio\n\n\n\n\n\n\n\n\n\n\nTo unsubscribe, please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2026-06-14 20:15:35', '2026-06-14 20:15:35'),
(85, 'Lisa', 'lisa.99seosolutionworld@gmail.com', '8468088599', '1148 Hamilton Street', 'Hi there https://www.listify.asia/,\n\nI did a quick review of your website and found a few opportunities to improve your search rankings.\n\nIf you’re interested, please share your target keywords and target locations.\n\nShould I send it?\n\nThank you,\nLisa', 0, 0, '2026-06-20 23:10:47', '2026-06-20 23:10:47'),
(86, 'Gemma Marshall', 'gemmamarshall811@gmail.com', '561682176', '94 Rue Pierre De Coubertin', 'Hi,\n\nI’m reaching out because we help brands connected to listify.asia build authority on Instagram.\n\nWe use our customized AI system, mixed with natural manual interaction to drive niche-relevant followers to your page safely.\n\nOpen to finding out more about this?\n\nGemma', 0, 0, '2026-07-04 06:31:50', '2026-07-04 06:31:50'),
(87, 'Arlie Bruche', 'turnerfisher348.382+arlie.bruche@gmail.com', '99293641', 'Vettrebukta 208', 'Greetings, \n\nWant a steady stream of ready-to-buy clients? Turn ChatGPT and Gemini into your biggest source of daily traffic for listify.asia here:\nhttp://utraker.com/FrLxO?yct\n\nSincerely,\nArlie\n\n\n\n\n\n\n\n\n\nTo unsubscribe, please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2026-07-08 22:53:13', '2026-07-08 22:53:13'),
(88, 'Mike Rabinovitch', 't.urnerfisher348382+mike.rabinovitch@gmail.com', '247569562', 'Via Verbano 65', 'Hi, I checked out listify.asia and found a few opportunities to bring in more customers. I\'d be happy to send over a free, no-obligation site audit: http://utraker.com/vBhNj?dyw\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nTo unsubscribe, please reply with subject:  Unsubscribe !listify.asia', 0, 0, '2026-07-12 15:51:14', '2026-07-12 15:51:14');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dial_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thumbnail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_symbol` int DEFAULT NULL,
  `currency_code` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`, `dial_code`, `currency_name`, `thumbnail`, `currency_symbol`, `currency_code`, `created_at`, `updated_at`) VALUES
(1, 'Afghanistan', 'AF', '+93', 'Afghan afghani', '1741687214.webp', 0, 0, NULL, '2025-03-11 04:00:14'),
(2, 'Aland Islands', 'AX', '+358', '', '1733385195.webp', 0, 0, NULL, '2024-12-05 01:53:15'),
(3, 'Albania', 'AL', '+355', 'Albanian lek', '1733569672.webp', 0, 0, NULL, '2024-12-07 05:07:52'),
(4, 'Algeria', 'DZ', '+213', 'Algerian dinar', NULL, 0, 0, NULL, NULL),
(5, 'AmericanSamoa', 'AS', '+1684', '', NULL, 0, 0, NULL, NULL),
(6, 'Andorra', 'AD', '+376', 'Euro', '1733569643.webp', 0, 0, NULL, '2024-12-07 05:07:23'),
(7, 'Angola', 'AO', '+244', 'Angolan kwanza', '1733392190.webp', 0, 0, NULL, '2024-12-05 03:49:50'),
(8, 'Anguilla', 'AI', '+1264', 'East Caribbean dolla', NULL, 0, 0, NULL, NULL),
(9, 'Antarctica', 'AQ', '+672', '', NULL, 0, 0, NULL, NULL),
(10, 'Antigua and Barbuda', 'AG', '+1268', 'East Caribbean dolla', NULL, 0, 0, NULL, NULL),
(11, 'Argentina', 'AR', '+54', 'Argentine peso', NULL, 0, 0, NULL, NULL),
(12, 'Armenia', 'AM', '+374', 'Armenian dram', NULL, 0, 0, NULL, NULL),
(13, 'Aruba', 'AW', '+297', 'Aruban florin', NULL, 0, 0, NULL, NULL),
(14, 'Australia', 'AU', '+61', 'Australian dollar', NULL, 0, 0, NULL, NULL),
(15, 'Austria', 'AT', '+43', 'Euro', NULL, 0, 0, NULL, NULL),
(16, 'Azerbaijan', 'AZ', '+994', 'Azerbaijani manat', NULL, 0, 0, NULL, NULL),
(17, 'Bahamas', 'BS', '+1242', '', NULL, 0, 0, NULL, NULL),
(18, 'Bahrain', 'BH', '+973', 'Bahraini dinar', '1727859648.webp', 0, 0, NULL, '2024-10-02 03:00:48'),
(19, 'Bangladesh', 'BD', '+880', 'Bangladeshi taka', '1733386184.webp', 0, 0, NULL, '2024-12-05 02:09:44'),
(20, 'Barbados', 'BB', '+1246', 'Barbadian dollar', NULL, 0, 0, NULL, NULL),
(21, 'Belarus', 'BY', '+375', 'Belarusian ruble', NULL, 0, 0, NULL, NULL),
(22, 'Belgium', 'BE', '+32', 'Euro', '1733569353.webp', 0, 0, NULL, '2024-12-07 05:02:34'),
(23, 'Belize', 'BZ', '+501', 'Belize dollar', NULL, 0, 0, NULL, NULL),
(24, 'Benin', 'BJ', '+229', 'West African CFA fra', NULL, 0, 0, NULL, NULL),
(25, 'Bermuda', 'BM', '+1441', 'Bermudian dollar', NULL, 0, 0, NULL, NULL),
(26, 'Bhutan', 'BT', '+975', 'Bhutanese ngultrum', NULL, 0, 0, NULL, NULL),
(27, 'Bolivia, Plurination', 'BO', '+591', '', NULL, 0, 0, NULL, NULL),
(28, 'Bosnia and Herzegovi', 'BA', '+387', '', NULL, 0, 0, NULL, NULL),
(29, 'Botswana', 'BW', '+267', 'Botswana pula', NULL, 0, 0, NULL, NULL),
(30, 'Brazil', 'BR', '+55', 'Brazilian real', NULL, 0, 0, NULL, NULL),
(31, 'British Indian Ocean', 'IO', '+246', '', NULL, 0, 0, NULL, NULL),
(32, 'Brunei Darussalam', 'BN', '+673', '', NULL, 0, 0, NULL, NULL),
(33, 'Bulgaria', 'BG', '+359', 'Bulgarian lev', NULL, 0, 0, NULL, NULL),
(34, 'Burkina Faso', 'BF', '+226', 'West African CFA fra', NULL, 0, 0, NULL, NULL),
(35, 'Burundi', 'BI', '+257', 'Burundian franc', NULL, 0, 0, NULL, NULL),
(36, 'Cambodia', 'KH', '+855', 'Cambodian riel', NULL, 0, 0, NULL, NULL),
(37, 'Cameroon', 'CM', '+237', 'Central African CFA ', NULL, 0, 0, NULL, NULL),
(38, 'Canada', 'CA', '+1', 'Canadian dollar', NULL, 0, 0, NULL, NULL),
(39, 'Cape Verde', 'CV', '+238', 'Cape Verdean escudo', NULL, 0, 0, NULL, NULL),
(40, 'Cayman Islands', 'KY', '+ 345', 'Cayman Islands dolla', NULL, 0, 0, NULL, NULL),
(41, 'Central African Repu', 'CF', '+236', '', NULL, 0, 0, NULL, NULL),
(42, 'Chad', 'TD', '+235', 'Central African CFA ', NULL, 0, 0, NULL, NULL),
(43, 'Chile', 'CL', '+56', 'Chilean peso', NULL, 0, 0, NULL, NULL),
(44, 'China', 'CN', '+86', 'Chinese yuan', NULL, 0, 0, NULL, NULL),
(45, 'Christmas Island', 'CX', '+61', '', NULL, 0, 0, NULL, NULL),
(46, 'Cocos (Keeling) Isla', 'CC', '+61', '', NULL, 0, 0, NULL, NULL),
(47, 'Colombia', 'CO', '+57', 'Colombian peso', NULL, 0, 0, NULL, NULL),
(48, 'Comoros', 'KM', '+269', 'Comorian franc', NULL, 0, 0, NULL, NULL),
(49, 'Congo', 'CG', '+242', '', NULL, 0, 0, NULL, NULL),
(50, 'Congo, The Democrati', 'CD', '+243', '', NULL, 0, 0, NULL, NULL),
(51, 'Cook Islands', 'CK', '+682', 'New Zealand dollar', NULL, 0, 0, NULL, NULL),
(52, 'Costa Rica', 'CR', '+506', 'Costa Rican colón', NULL, 0, 0, NULL, NULL),
(53, 'Cote d\'Ivoire', 'CI', '+225', 'West African CFA fra', NULL, 0, 0, NULL, NULL),
(54, 'Croatia', 'HR', '+385', 'Croatian kuna', NULL, 0, 0, NULL, NULL),
(55, 'Cuba', 'CU', '+53', 'Cuban convertible pe', NULL, 0, 0, NULL, NULL),
(56, 'Cyprus', 'CY', '+357', 'Euro', NULL, 0, 0, NULL, NULL),
(57, 'Czech Republic', 'CZ', '+420', 'Czech koruna', NULL, 0, 0, NULL, NULL),
(58, 'Denmark', 'DK', '+45', 'Danish krone', NULL, 0, 0, NULL, NULL),
(59, 'Djibouti', 'DJ', '+253', 'Djiboutian franc', NULL, 0, 0, NULL, NULL),
(60, 'Dominica', 'DM', '+1767', 'East Caribbean dolla', NULL, 0, 0, NULL, NULL),
(61, 'Dominican Republic', 'DO', '+1849', 'Dominican peso', NULL, 0, 0, NULL, NULL),
(62, 'Ecuador', 'EC', '+593', 'United States dollar', NULL, 0, 0, NULL, NULL),
(63, 'Egypt', 'EG', '+20', 'Egyptian pound', NULL, 0, 0, NULL, NULL),
(64, 'El Salvador', 'SV', '+503', 'United States dollar', NULL, 0, 0, NULL, NULL),
(65, 'Equatorial Guinea', 'GQ', '+240', 'Central African CFA ', NULL, 0, 0, NULL, NULL),
(66, 'Eritrea', 'ER', '+291', 'Eritrean nakfa', NULL, 0, 0, NULL, NULL),
(67, 'Estonia', 'EE', '+372', 'Euro', NULL, 0, 0, NULL, NULL),
(68, 'Ethiopia', 'ET', '+251', 'Ethiopian birr', NULL, 0, 0, NULL, NULL),
(69, 'Falkland Islands (Ma', 'FK', '+500', '', NULL, 0, 0, NULL, NULL),
(70, 'Faroe Islands', 'FO', '+298', 'Danish krone', NULL, 0, 0, NULL, NULL),
(71, 'Fiji', 'FJ', '+679', 'Fijian dollar', NULL, 0, 0, NULL, NULL),
(72, 'Finland', 'FI', '+358', 'Euro', NULL, 0, 0, NULL, NULL),
(73, 'France', 'FR', '+33', 'Euro', NULL, 0, 0, NULL, NULL),
(74, 'French Guiana', 'GF', '+594', '', NULL, 0, 0, NULL, NULL),
(75, 'French Polynesia', 'PF', '+689', 'CFP franc', NULL, 0, 0, NULL, NULL),
(76, 'Gabon', 'GA', '+241', 'Central African CFA ', NULL, 0, 0, NULL, NULL),
(77, 'Gambia', 'GM', '+220', '', NULL, 0, 0, NULL, NULL),
(78, 'Georgia', 'GE', '+995', 'Georgian lari', NULL, 0, 0, NULL, NULL),
(79, 'Germany', 'DE', '+49', 'Euro', NULL, 0, 0, NULL, NULL),
(80, 'Ghana', 'GH', '+233', 'Ghana cedi', NULL, 0, 0, NULL, NULL),
(81, 'Gibraltar', 'GI', '+350', 'Gibraltar pound', NULL, 0, 0, NULL, NULL),
(82, 'Greece', 'GR', '+30', 'Euro', NULL, 0, 0, NULL, NULL),
(83, 'Greenland', 'GL', '+299', '', NULL, 0, 0, NULL, NULL),
(84, 'Grenada', 'GD', '+1473', 'East Caribbean dolla', NULL, 0, 0, NULL, NULL),
(85, 'Guadeloupe', 'GP', '+590', '', NULL, 0, 0, NULL, NULL),
(86, 'Guam', 'GU', '+1671', '', NULL, 0, 0, NULL, NULL),
(87, 'Guatemala', 'GT', '+502', 'Guatemalan quetzal', NULL, 0, 0, NULL, NULL),
(88, 'Guernsey', 'GG', '+44', 'British pound', NULL, 0, 0, NULL, NULL),
(89, 'Guinea', 'GN', '+224', 'Guinean franc', NULL, 0, 0, NULL, NULL),
(90, 'Guinea-Bissau', 'GW', '+245', 'West African CFA fra', NULL, 0, 0, NULL, NULL),
(91, 'Guyana', 'GY', '+595', 'Guyanese dollar', NULL, 0, 0, NULL, NULL),
(92, 'Haiti', 'HT', '+509', 'Haitian gourde', NULL, 0, 0, NULL, NULL),
(93, 'Holy See (Vatican Ci', 'VA', '+379', '', NULL, 0, 0, NULL, NULL),
(94, 'Honduras', 'HN', '+504', 'Honduran lempira', NULL, 0, 0, NULL, NULL),
(95, 'Hong Kong', 'HK', '+852', 'Hong Kong dollar', NULL, 0, 0, NULL, NULL),
(96, 'Hungary', 'HU', '+36', 'Hungarian forint', NULL, 0, 0, NULL, NULL),
(97, 'Iceland', 'IS', '+354', 'Icelandic króna', NULL, 0, 0, NULL, NULL),
(98, 'India', 'IN', '+91', 'Indian rupee', '1754489287.jpeg', 0, 0, NULL, '2025-08-06 14:08:07'),
(99, 'Indonesia', 'ID', '+62', 'Indonesian rupiah', NULL, 0, 0, NULL, NULL),
(100, 'Iran, Islamic Republ', 'IR', '+98', '', NULL, 0, 0, NULL, NULL),
(101, 'Iraq', 'IQ', '+964', 'Iraqi dinar', NULL, 0, 0, NULL, NULL),
(102, 'Ireland', 'IE', '+353', 'Euro', NULL, 0, 0, NULL, NULL),
(103, 'Isle of Man', 'IM', '+44', 'British pound', NULL, 0, 0, NULL, NULL),
(104, 'Israel', 'IL', '+972', 'Israeli new shekel', NULL, 0, 0, NULL, NULL),
(105, 'Italy', 'IT', '+39', 'Euro', NULL, 0, 0, NULL, NULL),
(106, 'Jamaica', 'JM', '+1876', 'Jamaican dollar', NULL, 0, 0, NULL, NULL),
(107, 'Japan', 'JP', '+81', 'Japanese yen', NULL, 0, 0, NULL, NULL),
(108, 'Jersey', 'JE', '+44', 'British pound', NULL, 0, 0, NULL, NULL),
(109, 'Jordan', 'JO', '+962', 'Jordanian dinar', NULL, 0, 0, NULL, NULL),
(110, 'Kazakhstan', 'KZ', '+7 7', 'Kazakhstani tenge', NULL, 0, 0, NULL, NULL),
(111, 'Kenya', 'KE', '+254', 'Kenyan shilling', NULL, 0, 0, NULL, NULL),
(112, 'Kiribati', 'KI', '+686', 'Australian dollar', NULL, 0, 0, NULL, NULL),
(113, 'Korea, Democratic Pe', 'KP', '+850', '', NULL, 0, 0, NULL, NULL),
(114, 'Korea, Republic of S', 'KR', '+82', '', NULL, 0, 0, NULL, NULL),
(115, 'Kuwait', 'KW', '+965', 'Kuwaiti dinar', NULL, 0, 0, NULL, NULL),
(116, 'Kyrgyzstan', 'KG', '+996', 'Kyrgyzstani som', NULL, 0, 0, NULL, NULL),
(117, 'Laos', 'LA', '+856', 'Lao kip', NULL, 0, 0, NULL, NULL),
(118, 'Latvia', 'LV', '+371', 'Euro', NULL, 0, 0, NULL, NULL),
(119, 'Lebanon', 'LB', '+961', 'Lebanese pound', NULL, 0, 0, NULL, NULL),
(120, 'Lesotho', 'LS', '+266', 'Lesotho loti', NULL, 0, 0, NULL, NULL),
(121, 'Liberia', 'LR', '+231', 'Liberian dollar', NULL, 0, 0, NULL, NULL),
(122, 'Libyan Arab Jamahiri', 'LY', '+218', '', NULL, 0, 0, NULL, NULL),
(123, 'Liechtenstein', 'LI', '+423', 'Swiss franc', NULL, 0, 0, NULL, NULL),
(124, 'Lithuania', 'LT', '+370', 'Euro', NULL, 0, 0, NULL, NULL),
(125, 'Luxembourg', 'LU', '+352', 'Euro', NULL, 0, 0, NULL, NULL),
(126, 'Macao', 'MO', '+853', '', NULL, 0, 0, NULL, NULL),
(127, 'Macedonia', 'MK', '+389', '', NULL, 0, 0, NULL, NULL),
(128, 'Madagascar', 'MG', '+261', 'Malagasy ariary', NULL, 0, 0, NULL, NULL),
(129, 'Malawi', 'MW', '+265', 'Malawian kwacha', NULL, 0, 0, NULL, NULL),
(130, 'Malaysia', 'MY', '+60', 'Malaysian ringgit', NULL, 0, 0, NULL, NULL),
(131, 'Maldives', 'MV', '+960', 'Maldivian rufiyaa', NULL, 0, 0, NULL, NULL),
(132, 'Mali', 'ML', '+223', 'West African CFA fra', NULL, 0, 0, NULL, NULL),
(133, 'Malta', 'MT', '+356', 'Euro', NULL, 0, 0, NULL, NULL),
(134, 'Marshall Islands', 'MH', '+692', 'United States dollar', NULL, 0, 0, NULL, NULL),
(135, 'Martinique', 'MQ', '+596', '', NULL, 0, 0, NULL, NULL),
(136, 'Mauritania', 'MR', '+222', 'Mauritanian ouguiya', NULL, 0, 0, NULL, NULL),
(137, 'Mauritius', 'MU', '+230', 'Mauritian rupee', NULL, 0, 0, NULL, NULL),
(138, 'Mayotte', 'YT', '+262', '', NULL, 0, 0, NULL, NULL),
(139, 'Mexico', 'MX', '+52', 'Mexican peso', NULL, 0, 0, NULL, NULL),
(140, 'Micronesia, Federate', 'FM', '+691', '', NULL, 0, 0, NULL, NULL),
(141, 'Moldova', 'MD', '+373', 'Moldovan leu', NULL, 0, 0, NULL, NULL),
(142, 'Monaco', 'MC', '+377', 'Euro', NULL, 0, 0, NULL, NULL),
(143, 'Mongolia', 'MN', '+976', 'Mongolian tögrög', NULL, 0, 0, NULL, NULL),
(144, 'Montenegro', 'ME', '+382', 'Euro', NULL, 0, 0, NULL, NULL),
(145, 'Montserrat', 'MS', '+1664', 'East Caribbean dolla', NULL, 0, 0, NULL, NULL),
(146, 'Morocco', 'MA', '+212', 'Moroccan dirham', NULL, 0, 0, NULL, NULL),
(147, 'Mozambique', 'MZ', '+258', 'Mozambican metical', NULL, 0, 0, NULL, NULL),
(148, 'Myanmar', 'MM', '+95', 'Burmese kyat', NULL, 0, 0, NULL, NULL),
(149, 'Namibia', 'NA', '+264', 'Namibian dollar', NULL, 0, 0, NULL, NULL),
(150, 'Nauru', 'NR', '+674', 'Australian dollar', NULL, 0, 0, NULL, NULL),
(151, 'Nepal', 'NP', '+977', 'Nepalese rupee', NULL, 0, 0, NULL, NULL),
(152, 'Netherlands', 'NL', '+31', 'Euro', NULL, 0, 0, NULL, NULL),
(153, 'Netherlands Antilles', 'AN', '+599', '', NULL, 0, 0, NULL, NULL),
(154, 'New Caledonia', 'NC', '+687', 'CFP franc', NULL, 0, 0, NULL, NULL),
(155, 'New Zealand', 'NZ', '+64', 'New Zealand dollar', NULL, 0, 0, NULL, NULL),
(156, 'Nicaragua', 'NI', '+505', 'Nicaraguan córdoba', NULL, 0, 0, NULL, NULL),
(157, 'Niger', 'NE', '+227', 'West African CFA fra', NULL, 0, 0, NULL, NULL),
(158, 'Nigeria', 'NG', '+234', 'Nigerian naira', NULL, 0, 0, NULL, NULL),
(159, 'Niue', 'NU', '+683', 'New Zealand dollar', NULL, 0, 0, NULL, NULL),
(160, 'Norfolk Island', 'NF', '+672', '', NULL, 0, 0, NULL, NULL),
(161, 'Northern Mariana Isl', 'MP', '+1670', '', NULL, 0, 0, NULL, NULL),
(162, 'Norway', 'NO', '+47', 'Norwegian krone', NULL, 0, 0, NULL, NULL),
(163, 'Oman', 'OM', '+968', 'Omani rial', NULL, 0, 0, NULL, NULL),
(164, 'Pakistan', 'PK', '+92', 'Pakistani rupee', NULL, 0, 0, NULL, NULL),
(165, 'Palau', 'PW', '+680', 'Palauan dollar', NULL, 0, 0, NULL, NULL),
(166, 'Palestinian Territor', 'PS', '+970', '', NULL, 0, 0, NULL, NULL),
(167, 'Panama', 'PA', '+507', 'Panamanian balboa', NULL, 0, 0, NULL, NULL),
(168, 'Papua New Guinea', 'PG', '+675', 'Papua New Guinean ki', NULL, 0, 0, NULL, NULL),
(169, 'Paraguay', 'PY', '+595', 'Paraguayan guaraní', NULL, 0, 0, NULL, NULL),
(170, 'Peru', 'PE', '+51', 'Peruvian nuevo sol', NULL, 0, 0, NULL, NULL),
(171, 'Philippines', 'PH', '+63', 'Philippine peso', NULL, 0, 0, NULL, NULL),
(172, 'Pitcairn', 'PN', '+872', '', NULL, 0, 0, NULL, NULL),
(173, 'Poland', 'PL', '+48', 'Polish z?oty', NULL, 0, 0, NULL, NULL),
(174, 'Portugal', 'PT', '+351', 'Euro', NULL, 0, 0, NULL, NULL),
(175, 'Puerto Rico', 'PR', '+1939', '', NULL, 0, 0, NULL, NULL),
(176, 'Qatar', 'QA', '+974', 'Qatari riyal', NULL, 0, 0, NULL, NULL),
(177, 'Romania', 'RO', '+40', 'Romanian leu', NULL, 0, 0, NULL, NULL),
(178, 'Russia', 'RU', '+7', 'Russian ruble', NULL, 0, 0, NULL, NULL),
(179, 'Rwanda', 'RW', '+250', 'Rwandan franc', NULL, 0, 0, NULL, NULL),
(180, 'Reunion', 'RE', '+262', '', NULL, 0, 0, NULL, NULL),
(181, 'Saint Barthelemy', 'BL', '+590', '', NULL, 0, 0, NULL, NULL),
(182, 'Saint Helena, Ascens', 'SH', '+290', '', NULL, 0, 0, NULL, NULL),
(183, 'Saint Kitts and Nevi', 'KN', '+1869', '', NULL, 0, 0, NULL, NULL),
(184, 'Saint Lucia', 'LC', '+1758', 'East Caribbean dolla', NULL, 0, 0, NULL, NULL),
(185, 'Saint Martin', 'MF', '+590', '', NULL, 0, 0, NULL, NULL),
(186, 'Saint Pierre and Miq', 'PM', '+508', '', NULL, 0, 0, NULL, NULL),
(187, 'Saint Vincent and th', 'VC', '+1784', '', NULL, 0, 0, NULL, NULL),
(188, 'Samoa', 'WS', '+685', 'Samoan t?l?', NULL, 0, 0, NULL, NULL),
(189, 'San Marino', 'SM', '+378', 'Euro', NULL, 0, 0, NULL, NULL),
(190, 'Sao Tome and Princip', 'ST', '+239', '', NULL, 0, 0, NULL, NULL),
(191, 'Saudi Arabia', 'SA', '+966', 'Saudi riyal', NULL, 0, 0, NULL, NULL),
(192, 'Senegal', 'SN', '+221', 'West African CFA fra', NULL, 0, 0, NULL, NULL),
(193, 'Serbia', 'RS', '+381', 'Serbian dinar', NULL, 0, 0, NULL, NULL),
(194, 'Seychelles', 'SC', '+248', 'Seychellois rupee', NULL, 0, 0, NULL, NULL),
(195, 'Sierra Leone', 'SL', '+232', 'Sierra Leonean leone', NULL, 0, 0, NULL, NULL),
(196, 'Singapore', 'SG', '+65', 'Brunei dollar', NULL, 0, 0, NULL, NULL),
(197, 'Slovakia', 'SK', '+421', 'Euro', NULL, 0, 0, NULL, NULL),
(198, 'Slovenia', 'SI', '+386', 'Euro', NULL, 0, 0, NULL, NULL),
(199, 'Solomon Islands', 'SB', '+677', 'Solomon Islands doll', NULL, 0, 0, NULL, NULL),
(200, 'Somalia', 'SO', '+252', 'Somali shilling', NULL, 0, 0, NULL, NULL),
(201, 'South Africa', 'ZA', '+27', 'South African rand', NULL, 0, 0, NULL, NULL),
(202, 'South Georgia and th', 'GS', '+500', '', NULL, 0, 0, NULL, NULL),
(203, 'Spain', 'ES', '+34', 'Euro', NULL, 0, 0, NULL, NULL),
(204, 'Sri Lanka', 'LK', '+94', 'Sri Lankan rupee', NULL, 0, 0, NULL, NULL),
(205, 'Sudan', 'SD', '+249', 'Sudanese pound', NULL, 0, 0, NULL, NULL),
(206, 'Suriname', 'SR', '+597', 'Surinamese dollar', NULL, 0, 0, NULL, NULL),
(207, 'Svalbard and Jan May', 'SJ', '+47', '', NULL, 0, 0, NULL, NULL),
(208, 'Swaziland', 'SZ', '+268', 'Swazi lilangeni', NULL, 0, 0, NULL, NULL),
(209, 'Sweden', 'SE', '+46', 'Swedish krona', NULL, 0, 0, NULL, NULL),
(210, 'Switzerland', 'CH', '+41', 'Swiss franc', NULL, 0, 0, NULL, NULL),
(211, 'Syrian Arab Republic', 'SY', '+963', '', NULL, 0, 0, NULL, NULL),
(212, 'Taiwan', 'TW', '+886', 'New Taiwan dollar', NULL, 0, 0, NULL, NULL),
(213, 'Tajikistan', 'TJ', '+992', 'Tajikistani somoni', NULL, 0, 0, NULL, NULL),
(214, 'Tanzania, United Rep', 'TZ', '+255', '', NULL, 0, 0, NULL, NULL),
(215, 'Thailand', 'TH', '+66', 'Thai baht', NULL, 0, 0, NULL, NULL),
(216, 'Timor-Leste', 'TL', '+670', '', NULL, 0, 0, NULL, NULL),
(217, 'Togo', 'TG', '+228', 'West African CFA fra', NULL, 0, 0, NULL, NULL),
(218, 'Tokelau', 'TK', '+690', '', NULL, 0, 0, NULL, NULL),
(219, 'Tonga', 'TO', '+676', 'Tongan pa?anga', NULL, 0, 0, NULL, NULL),
(220, 'Trinidad and Tobago', 'TT', '+1868', 'Trinidad and Tobago ', NULL, 0, 0, NULL, NULL),
(221, 'Tunisia', 'TN', '+216', 'Tunisian dinar', NULL, 0, 0, NULL, NULL),
(222, 'Turkey', 'TR', '+90', 'Turkish lira', NULL, 0, 0, NULL, NULL),
(223, 'Turkmenistan', 'TM', '+993', 'Turkmenistan manat', NULL, 0, 0, NULL, NULL),
(224, 'Turks and Caicos Isl', 'TC', '+1649', '', NULL, 0, 0, NULL, NULL),
(225, 'Tuvalu', 'TV', '+688', 'Australian dollar', NULL, 0, 0, NULL, NULL),
(226, 'Uganda', 'UG', '+256', 'Ugandan shilling', NULL, 0, 0, NULL, NULL),
(227, 'Ukraine', 'UA', '+380', 'Ukrainian hryvnia', NULL, 0, 0, NULL, NULL),
(228, 'United Arab Emirates', 'AE', '+971', 'United Arab Emirates', NULL, 0, 0, NULL, NULL),
(229, 'United Kingdom', 'GB', '+44', 'British pound', NULL, 0, 0, NULL, NULL),
(230, 'United States', 'US', '+1', 'United States dollar', NULL, 0, 0, NULL, NULL),
(231, 'Uruguay', 'UY', '+598', 'Uruguayan peso', NULL, 0, 0, NULL, NULL),
(232, 'Uzbekistan', 'UZ', '+998', 'Uzbekistani som', NULL, 0, 0, NULL, NULL),
(233, 'Vanuatu', 'VU', '+678', 'Vanuatu vatu', NULL, 0, 0, NULL, NULL),
(234, 'Venezuela, Bolivaria', 'VE', '+58', '', NULL, 0, 0, NULL, NULL),
(235, 'Vietnam', 'VN', '+84', 'Vietnamese ??ng', NULL, 0, 0, NULL, NULL),
(236, 'Virgin Islands, Brit', 'VG', '+1284', '', NULL, 0, 0, NULL, NULL),
(237, 'Virgin Islands, U.S.', 'VI', '+1340', '', NULL, 0, 0, NULL, NULL),
(238, 'Wallis and Futuna', 'WF', '+681', 'CFP franc', NULL, 0, 0, NULL, NULL),
(239, 'Yemen', 'YE', '+967', 'Yemeni rial', NULL, 0, 0, NULL, NULL),
(240, 'Zambia', 'ZM', '+260', 'Zambian kwacha', NULL, 0, 0, NULL, NULL),
(241, 'Zimbabwe', 'ZW', '+263', 'Botswana pula', NULL, 0, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `code` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `symbol` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `paypal_supported` int NOT NULL DEFAULT '0',
  `stripe_supported` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `name`, `code`, `symbol`, `paypal_supported`, `stripe_supported`) VALUES
(1, 'Leke', 'ALL', 'Lek', 0, 1),
(2, 'Dollars', 'USD', '$', 1, 1),
(3, 'Afghanis', 'AFN', '؋', 0, 1),
(4, 'Pesos', 'ARS', '$', 0, 1),
(5, 'Guilders', 'AWG', 'ƒ', 0, 1),
(6, 'Dollars', 'AUD', '$', 1, 1),
(7, 'New Manats', 'AZN', 'ман', 0, 1),
(8, 'Dollars', 'BSD', '$', 0, 1),
(9, 'Dollars', 'BBD', '$', 0, 1),
(10, 'Rubles', 'BYR', 'p.', 0, 0),
(11, 'Euro', 'EUR', '€', 1, 1),
(12, 'Dollars', 'BZD', 'BZ$', 0, 1),
(13, 'Dollars', 'BMD', '$', 0, 1),
(14, 'Bolivianos', 'BOB', '$b', 0, 1),
(15, 'Convertible Marka', 'BAM', 'KM', 0, 1),
(16, 'Pula', 'BWP', 'P', 0, 1),
(17, 'Leva', 'BGN', 'лв', 0, 1),
(18, 'Reais', 'BRL', 'R$', 1, 1),
(19, 'Pounds', 'GBP', '£', 1, 1),
(20, 'Dollars', 'BND', '$', 0, 1),
(21, 'Riels', 'KHR', '៛', 0, 1),
(22, 'Dollars', 'CAD', '$', 1, 1),
(23, 'Dollars', 'KYD', '$', 0, 1),
(24, 'Pesos', 'CLP', '$', 0, 1),
(25, 'Yuan Renminbi', 'CNY', '¥', 0, 1),
(26, 'Pesos', 'COP', '$', 0, 1),
(27, 'Colón', 'CRC', '₡', 0, 1),
(28, 'Kuna', 'HRK', 'kn', 0, 1),
(29, 'Pesos', 'CUP', '₱', 0, 0),
(30, 'Koruny', 'CZK', 'Kč', 1, 1),
(31, 'Kroner', 'DKK', 'kr', 1, 1),
(32, 'Pesos', 'DOP ', 'RD$', 0, 1),
(33, 'Dollars', 'XCD', '$', 0, 1),
(34, 'Pounds', 'EGP', '£', 0, 1),
(35, 'Colones', 'SVC', '$', 0, 0),
(36, 'Pounds', 'FKP', '£', 0, 1),
(37, 'Dollars', 'FJD', '$', 0, 1),
(38, 'Cedis', 'GHC', '¢', 0, 0),
(39, 'Pounds', 'GIP', '£', 0, 1),
(40, 'Quetzales', 'GTQ', 'Q', 0, 1),
(41, 'Pounds', 'GGP', '£', 0, 0),
(42, 'Dollars', 'GYD', '$', 0, 1),
(43, 'Lempiras', 'HNL', 'L', 0, 1),
(44, 'Dollars', 'HKD', '$', 1, 1),
(45, 'Forint', 'HUF', 'Ft', 1, 1),
(46, 'Kronur', 'ISK', 'kr', 0, 1),
(47, 'Rupees', 'INR', '₹', 1, 1),
(48, 'Rupiahs', 'IDR', 'Rp', 0, 1),
(49, 'Rials', 'IRR', '﷼', 0, 0),
(50, 'Pounds', 'IMP', '£', 0, 0),
(51, 'New Shekels', 'ILS', '₪', 1, 1),
(52, 'Dollars', 'JMD', 'J$', 0, 1),
(53, 'Yen', 'JPY', '¥', 1, 1),
(54, 'Pounds', 'JEP', '£', 0, 0),
(55, 'Tenge', 'KZT', 'лв', 0, 1),
(56, 'Won', 'KPW', '₩', 0, 0),
(57, 'Won', 'KRW', '₩', 0, 1),
(58, 'Soms', 'KGS', 'лв', 0, 1),
(59, 'Kips', 'LAK', '₭', 0, 1),
(60, 'Lati', 'LVL', 'Ls', 0, 0),
(61, 'Pounds', 'LBP', '£', 0, 1),
(62, 'Dollars', 'LRD', '$', 0, 1),
(63, 'Switzerland Francs', 'CHF', 'CHF', 1, 1),
(64, 'Litai', 'LTL', 'Lt', 0, 0),
(65, 'Denars', 'MKD', 'ден', 0, 1),
(66, 'Ringgits', 'MYR', 'RM', 1, 1),
(67, 'Rupees', 'MUR', '₨', 0, 1),
(68, 'Pesos', 'MXN', '$', 1, 1),
(69, 'Tugriks', 'MNT', '₮', 0, 1),
(70, 'Meticais', 'MZN', 'MT', 0, 1),
(71, 'Dollars', 'NAD', '$', 0, 1),
(72, 'Rupees', 'NPR', '₨', 0, 1),
(73, 'Guilders', 'ANG', 'ƒ', 0, 1),
(74, 'Dollars', 'NZD', '$', 1, 1),
(75, 'Cordobas', 'NIO', 'C$', 0, 1),
(76, 'Nairas', 'NGN', '₦', 0, 1),
(77, 'Krone', 'NOK', 'kr', 1, 1),
(78, 'Rials', 'OMR', '﷼', 0, 0),
(79, 'Rupees', 'PKR', '₨', 0, 1),
(80, 'Balboa', 'PAB', 'B/.', 0, 1),
(81, 'Guarani', 'PYG', 'Gs', 0, 1),
(82, 'Nuevos Soles', 'PEN', 'S/.', 0, 1),
(83, 'Pesos', 'PHP', 'Php', 1, 1),
(84, 'Zlotych', 'PLN', 'zł', 1, 1),
(85, 'Rials', 'QAR', '﷼', 0, 1),
(86, 'New Lei', 'RON', 'lei', 0, 1),
(87, 'Rubles', 'RUB', 'руб', 0, 1),
(88, 'Pounds', 'SHP', '£', 0, 1),
(89, 'Riyals', 'SAR', '﷼', 0, 1),
(90, 'Dinars', 'RSD', 'Дин.', 0, 1),
(91, 'Rupees', 'SCR', '₨', 0, 1),
(92, 'Dollars', 'SGD', '$', 1, 1),
(93, 'Dollars', 'SBD', '$', 0, 1),
(94, 'Shillings', 'SOS', 'S', 0, 1),
(95, 'Rand', 'ZAR', 'R', 0, 1),
(96, 'Rupees', 'LKR', '₹', 0, 1),
(97, 'Kronor', 'SEK', 'kr', 1, 1),
(98, 'Dollars', 'SRD', '$', 0, 1),
(99, 'Pounds', 'SYP', '£', 0, 0),
(100, 'New Dollars', 'TWD', 'NT$', 1, 1),
(101, 'Baht', 'THB', '฿', 1, 1),
(102, 'Dollars', 'TTD', 'TT$', 0, 1),
(103, 'Lira', 'TRY', 'TL', 0, 1),
(104, 'Liras', 'TRL', '£', 0, 0),
(105, 'Dollars', 'TVD', '$', 0, 0),
(106, 'Hryvnia', 'UAH', '₴', 0, 1),
(107, 'Pesos', 'UYU', '$U', 0, 1),
(108, 'Sums', 'UZS', 'лв', 0, 1),
(109, 'Bolivares Fuertes', 'VEF', 'Bs', 0, 0),
(110, 'Dong', 'VND', '₫', 0, 1),
(111, 'Rials', 'YER', '﷼', 0, 1),
(112, 'Zimbabwe Dollars', 'ZWD', 'Z$', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `customlisting_setting`
--

CREATE TABLE `customlisting_setting` (
  `id` int NOT NULL,
  `listing_type` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_title` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `banner_bg_image` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_tab_name` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner_tab_link` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cta_bg_image` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cta_bg_title` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cta_bg_description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cta_tab_name` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cta_tab_link` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customlisting_setting`
--

INSERT INTO `customlisting_setting` (`id`, `listing_type`, `slug`, `banner_title`, `banner_description`, `banner_bg_image`, `banner_tab_name`, `banner_tab_link`, `cta_bg_image`, `cta_bg_title`, `cta_bg_description`, `cta_tab_name`, `cta_tab_link`, `created_at`, `updated_at`) VALUES
(1, 'Automobiles', 'automobiles', 'Browse.Compare.Connect.Drive.', 'Discover dealers, services, and automotive experts.', 'uploads/customlisting-banner/1756713906_banner.jpg', 'Learn More', '#', 'uploads/customlisting-banner/1756713906_cta.jpg', 'Find Your Perfect Drive', 'Find trusted automotive businesses near you.', 'Contact us', 'https://www.listify.asia/contact-us', '2025-09-01 08:05:06', '2026-06-15 09:56:37'),
(2, 'Fitness', 'fitness', 'Achieve Your Fitness Goals', 'Connect with trusted fitness professionals.', 'uploads/customlisting-banner/1783920907_banner.png', 'Contact Us', 'https://www.listify.asia/contact-us', 'uploads/customlisting-banner/1756722580_cta.webp', 'Train. Transform. Thrive.', 'Find trusted gyms and fitness experts.', 'Connect Us', 'https://www.listify.asia/contact-us', '2025-09-01 10:15:24', '2026-06-13 15:34:29'),
(6, 'Manufacturing', 'manufacturing', 'Powering Industrial Growth', 'Connect with trusted manufacturers and suppliers.', 'uploads/customlisting-banner/1783921221_banner.png', '', '', 'uploads/customlisting-banner/1760770221_cta.jpg', 'Built for Excellence', 'Find reliable manufacturing solutions.', 'Contact Us', 'https://www.listify.asia/contact-us', '2025-10-18 06:50:21', '2026-06-13 15:36:53'),
(7, 'Industrial', 'industrial', 'Built for Performance', 'Discover quality industrial products and services.', 'uploads/customlisting-banner/1783921897_banner.png', '', '', 'uploads/customlisting-banner/1761118290_cta.jpg', 'Powering Industry Forward', 'Find reliable industrial businesses near you.', 'Contact Us', 'https://www.listify.asia/contact-us', '2025-10-18 07:43:27', '2026-06-13 15:39:57'),
(8, 'Corporate Gifting and Printing Services', 'corporate-gifting-and-printing-services', 'Make Every Impression Count', 'Find trusted gifting and printing solutions.', 'uploads/customlisting-banner/1783922572_banner.png', '', '', 'uploads/customlisting-banner/1761120036_cta.jpeg', 'Elevate Your Brand Presence', '\"Order Your Corporate Gift\" | \"Book a Painting Service\" | \"Transform Your Office Today\"', 'Contact Us', 'https://www.listify.asia/contact-us', '2025-10-18 08:02:57', '2026-06-13 15:43:46'),
(9, 'Recreation', 'recreation', 'Discover New Adventures', 'Find exciting activities and experiences near you.', 'uploads/customlisting-banner/1783923136_banner.png', '', '', 'uploads/customlisting-banner/1760777798_cta.jpg', 'Make Every Moment Count', '\"Don’t wait — Recharge your mind and body with our exciting recreation options today!\"', 'Contact Us', 'https://www.listify.asia/contact-us', '2025-10-18 08:56:38', '2026-06-13 15:42:07'),
(11, 'Trading', 'trading', 'Trade with Confidence', 'Connect with trusted trading professionals.3', 'uploads/customlisting-banner/1783923019_banner.png', '', '', 'uploads/customlisting-banner/1760780542_cta.jpg', 'Your Gateway to Trading Success', '\"Start trading today and maximize your profits with expert guidance instantly!\"', 'Contact Us', 'https://www.listify.asia/contact-us', '2025-10-18 09:42:22', '2026-06-13 15:45:52'),
(12, 'IT Services', 'it-services', 'Your Technology Partner', 'From cloud computing to cybersecurity, our IT services ensure your business runs smoothly, securely, and efficiently.', 'uploads/customlisting-banner/1783923323_banner.png', '', '', 'uploads/customlisting-banner/1761113721_cta.jpg', 'Innovate. Connect. Grow.', 'Upgrade Your IT Infrastructure with Expert Assistance.', 'Contact Us', 'https://www.listify.asia/contact-us', '2025-10-22 06:15:21', '2026-06-13 15:47:13'),
(13, 'Agencies', 'agencies', 'Your Success Starts Here', 'Explore top-rated agencies and solutions.', 'uploads/customlisting-banner/1783926926_banner.png', '', '', 'uploads/customlisting-banner/1783928637_cta.png', 'Trusted Agencies, Better Outcomes', 'Find experts to grow your business.', 'Contact Us', 'https://www.listify.asia/contact-us', '2025-10-22 10:01:07', '2026-06-13 15:50:15'),
(14, 'Academies', 'academies', 'Learn, Grow, Succeed', 'Discover trusted academies and learning centers.', 'uploads/customlisting-banner/1761128455_banner.jpg', NULL, NULL, 'uploads/customlisting-banner/1761128455_cta.jpg', 'Where Learning Begins', 'Find the right path to knowledge and growth.', 'Contact Us', 'https://www.listify.asia/contact-us', '2025-10-22 10:20:00', '2026-06-13 15:51:58'),
(16, 'food', 'food', 'Hungry? Start Here', 'From breakfast to dinner, find the perfect place for every craving.', 'uploads/customlisting-banner/1783673755_banner.png', '', '', 'uploads/customlisting-banner/1783673755_cta.png', 'Eat. Drink. Enjoy.', 'Discover restaurants, cafés, bars, juice shops, and dessert destinations for every occasion.', '', '', '2026-07-10 08:55:55', NULL),
(17, 'Travel Tourism', 'travel-tourism', 'Your Journey Starts Here', 'From relaxing vacations to corporate travel arrangements, we provide reliable travel and tourism services that ensure comfort, convenience, and memorable experiences.', 'uploads/customlisting-banner/1783938223_banner.png', '', '', 'uploads/customlisting-banner/1783938223_cta.png', 'Travel Smarter, Explore Further', 'Whether you\'re planning a holiday or a business trip, our travel solutions offer hassle-free bookings, guided tours, and exceptional customer support every step of the way.', 'Contact us', 'https://www.listify.asia/contact-us', '2026-07-13 10:23:43', NULL),
(18, 'healthcare Services', 'healthcare-services', 'Advancing Healthcare with Trusted Solutions', 'Delivering reliable medical products, healthcare services, and innovative solutions that support hospitals, clinics, laboratories, and healthcare professionals with quality and care.', 'uploads/customlisting-banner/1783938572_banner.png', '', '', 'uploads/customlisting-banner/1783938572_cta.png', 'Empowering Modern Healthcare', 'Supporting the healthcare industry with dependable medical equipment, pharmaceuticals, diagnostic solutions, and professional services designed for excellence.', '', '', '2026-07-13 10:29:32', NULL),
(19, 'popular services', 'popular-services', 'Solutions That Drive Success', 'Explore our most trusted services, carefully designed to deliver quality, efficiency, and value while meeting the unique needs of businesses across various industries.', 'uploads/customlisting-banner/1783940344_banner.png', '', '', 'uploads/customlisting-banner/1783940344_cta.png', 'Expert Solutions for Every Need', 'Discover our range of professional services, delivered with expertise, innovation, and a commitment to helping businesses succeed in today\'s competitive marketplace.', '', '', '2026-07-13 10:59:04', NULL),
(20, 'grooming', 'grooming', 'Enhance Your Style & Confidence', 'Discover premium grooming services designed to help you look your best, with expert care, modern techniques, and personalized solutions for every lifestyle.', 'uploads/customlisting-banner/1783941671_banner.png', '', '', 'uploads/customlisting-banner/1783941671_cta.png', 'Look Good, Feel Great', 'Experience professional grooming services that combine quality, precision, and care to enhance your appearance and boost your confidence every day.', '', '', '2026-07-13 11:21:11', NULL),
(21, 'business services', 'business-services', 'Smart Solutions for Modern Businesses', 'From consulting and financial support to operational and administrative services, we help businesses streamline processes and achieve long-term success.', 'uploads/customlisting-banner/1783942807_banner.png', '', '', 'uploads/customlisting-banner/1783942807_cta.png', 'Driving Business Success with Expertise', 'We offer a wide range of business services, combining industry knowledge, innovation, and personalized support to help organizations thrive in a competitive marketplace.', '', '', '2026-07-13 11:40:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `listing_id` int DEFAULT NULL,
  `listing_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_field` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `sorting` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_fields`
--

INSERT INTO `custom_fields` (`id`, `listing_id`, `listing_type`, `custom_type`, `custom_title`, `custom_field`, `sorting`, `created_at`, `updated_at`) VALUES
(2, 1, 'it-services', 'text', 'Web Expertise', '{\"data\":[{\"id\":1,\"content\":\"<p>We have 19 years of expertise in Custom Web Application Development, E-Commerce Development, CRM Development, Mobile Application Development, Microsoft Application Development and API Integration of all kinds.<\\/p>\"}]}', 1, '2025-08-06 13:24:37', '2025-08-17 14:41:21'),
(3, 1, 'it-services', 'image', 'About us', '{\"data\":[{\"id\":1,\"title\":\"Changing Digital Growth with Knowledge\",\"description\":\"The team at Corp Marvel Infotech is dedicated to providing clients with the greatest outcomes in a timely and cost-effective manner. Corp Marvel is enthusiastic about promoting digital growth and assisting companies in thriving in the ever-changing online environment of today. Utilizing a group of committed professionals and a growth-oriented approach to innovation, we provide customized digital marketing solutions that enhance companies, captivate audiences, and yield quantifiable outcomes.\",\"file\":\"1782980890_ChatGPT Image Jul 2, 2026, 01_57_57 PM.png\"},{\"id\":2,\"title\":\"Strategic Approach:\",\"description\":\"Our strategic process begins with understanding your vision, business objectives, and market landscape. Through in-depth research and careful planning, we develop innovative digital strategies that strengthen your brand, engage your audience, and generate meaningful business outcomes.\",\"file\":\"1782980770_ChatGPT Image Jul 2, 2026, 01_55_59 PM.png\"},{\"id\":3,\"title\":\"Data-Based Perspectives:\",\"description\":\"In the data-driven world of today, insights are critical. To guide our initiatives, enhance our campaigns, and improve return on investment for our clients, we therefore rely on data analytics, market research, and performance tracking.\",\"file\":\"1782979988_ChatGPT Image Jul 2, 2026, 01_42_55 PM.png\"}]}', 2, '2025-08-06 13:28:18', '2026-07-02 08:28:10'),
(4, 3, 'agencies', 'image', 'what we do', '{\"data\":[{\"id\":1,\"title\":\"Media Strategy, Planning & Buying\",\"description\":\"Has experience of working with Brands for over last 20 years. Has hands on knowledge of all the medium, conventional as well as emerging\",\"file\":\"1755442296_conversation.png\"},{\"id\":2,\"title\":\"Creative Strategy\",\"description\":\"Developing Creative for Television, Print, Radio and Digital.\",\"file\":\"1755442434_download-150x150.jpg\"},{\"id\":3,\"title\":\"Content Production\",\"description\":\"Have produced over 1000 hours of TV content, over 50 Advertising films and over 15 films for digital medium.\",\"file\":\"1755442506_factory-150x150.png\"},{\"id\":4,\"title\":\"Digital Advertising\",\"description\":\"Have an In-House team to manage the Digital advertising.\",\"file\":\"1755442543_social-media.png\"},{\"id\":5,\"title\":\"BTL\",\"description\":\"Retail Activation.\",\"file\":\"1755442577_bright-icon.png\"},{\"id\":6,\"title\":\"Syndication of Outdoor Media\",\"description\":\"billboards, bus advertisement, last end connectivity advertising we do it all\",\"file\":\"1755442680_outdoor-icon.png\"},{\"id\":7,\"title\":\"Syndication of Outdoor Media\",\"description\":\"billboards, bus advertisement, last end connectivity advertising we do it all\",\"file\":\"1755442683_outdoor-icon.png\"}]}', NULL, '2025-08-17 14:51:36', '2025-08-17 14:58:03'),
(5, 3, 'agencies', 'video', 'Our Recent Work', '{\"data\":[{\"id\":1,\"url\":\"https:\\/\\/www.youtube.com\\/watch?v=r6q4bnm0QYI\"}]}', NULL, '2025-08-17 15:20:43', '2025-08-18 08:43:44'),
(8, 8, 'automobiles', 'video', 'Videos', '{\"data\":[{\"id\":1,\"url\":\"https://youtu.be/-YlmnPh-6rE?si=8NWj2DH6cqUWpO25\"}]}', NULL, '2025-10-06 10:07:19', '2025-10-06 10:15:41'),
(9, 8, 'automobiles', 'faq', 'FAQ\'S', '{\"data\":[{\"id\":1,\"question\":\"Question 1\",\"answer\":\"Ans\"},{\"id\":2,\"question\":\"Question 2\",\"answer\":\"Ans\"}]}', NULL, '2025-10-06 10:12:58', '2025-10-06 10:12:58'),
(10, 8, 'automobiles', 'image', 'Images', '{\"data\":[{\"id\":1,\"title\":\"Image\",\"description\":\"Lorem ispum\",\"file\":\"1759745662_automobile-bg.jpg\"}]}', NULL, '2025-10-06 10:14:22', '2025-10-06 10:14:22'),
(11, 10, 'agencies', 'faq', 'FAQ', '{\"data\":[{\"id\":1,\"question\":\"Questions 1\",\"answer\":\"Ans\"}]}', NULL, '2025-10-06 11:01:47', '2025-10-06 11:01:47'),
(12, 2, 'hotel', 'faq', 'FAQ\'S', '{\"data\":[{\"id\":1,\"question\":\"Question 1\",\"answer\":\"Ans\"}]}', NULL, '2025-10-06 11:03:33', '2025-10-06 11:03:33'),
(17, 3, 'hotel', 'faq', 'Hotel Questions', '{\"data\":[{\"id\":1,\"question\":\"Hotel Question 1\",\"answer\":\"Hotel Answer 1\"},{\"id\":2,\"question\":\"Hotel Question 2\",\"answer\":\"Hotel Answer 2\"}]}', 5, '2026-05-19 04:53:52', '2026-05-19 05:40:34'),
(19, 3, 'hotel', 'gallery', 'Hotel Gallery', '{\"data\":[{\"id\":1,\"file\":\"1779167024_Brass-Antique-Gold-With-Clear-Crystal-Chandelier (1).jpeg\"},{\"id\":2,\"file\":\"1779167024_Brass-Antique-Gold-With-Clear-Crystal-Chandelier.jpeg\"}]}', 4, '2026-05-19 05:03:44', '2026-05-19 05:40:34'),
(20, 3, 'hotel', 'image', 'Hotel Images', '{\"data\":[{\"id\":1,\"title\":\"Front View\",\"description\":\"Luxury hotel front area\",\"file\":\"1779947309_3987.png\"}]}', 3, '2026-05-19 05:04:22', '2026-05-28 05:48:29'),
(21, 3, 'hotel', 'text', 'Hotel Title', '{\"data\":[{\"id\":1,\"content\":\"<h2 style=\\\"margin: 0px 0px 10px; font-family: DauphinPlain; font-size: 24px; line-height: 24px; text-align: left; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin: 0px 0px 15px; text-align: justify; font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px;\\\"><strong>Lorem Ipsum<\\/strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\"}]}', 2, '2026-05-19 05:05:20', '2026-05-19 05:40:34'),
(22, 3, 'hotel', 'slider', 'Hotel slides', '{\"data\":[{\"id\":1,\"file\":\"1779167169_porche_taycan_1 - Copy.jpg\",\"title\":\"Hotel Car\",\"description\":\"lorem ipsum\"},{\"id\":2,\"file\":\"1779167169_porche_taycan_1.jpg\",\"title\":\"\",\"description\":\"\"},{\"id\":3,\"file\":\"1779167169_porche_taycan_2.jpg\",\"title\":\"\",\"description\":\"\"},{\"id\":4,\"file\":\"1779167169_porche_taycan_3.jpg\",\"title\":\"\",\"description\":\"\"},{\"id\":5,\"file\":\"1779167169_porche_taycan_4.jpg\",\"title\":\"\",\"description\":\"\"},{\"id\":6,\"file\":\"1779167169_porche_taycan_5.jpg\",\"title\":\"\",\"description\":\"\"}]}', 1, '2026-05-19 05:06:09', '2026-05-19 05:40:34'),
(23, 3, 'hotel', 'video', 'Hotel Video', '{\"data\":[{\"id\":1,\"url\":\"\"}]}', 6, '2026-05-19 05:08:04', '2026-05-21 12:33:25'),
(30, 11, 'it-services', 'faq', 'Updated FAQ', '{\"data\":[{\"id\":1,\"question\":\"What services do you provide? 1\",\"answer\":\"We provide web development and mobile app development services. 1\"},{\"id\":2,\"question\":\"Do you provide support?\",\"answer\":\"Yes, we provide 24x7 support.\"}]}', NULL, '2026-05-28 07:38:23', '2026-07-02 08:30:01'),
(31, 20, 'hotel', 'image', 'Listing Featured Image', '{\"data\":[{\"id\":1,\"title\":[\"Listing Front View Updated\"],\"description\":[\"Listing front area updated\"],\"file\":\"1780041391_5899.png\"}]}', NULL, '2026-05-29 07:56:25', '2026-05-29 07:56:31'),
(32, 20, 'hotel', 'slider', 'Listing slides', '{\"data\":[{\"id\":1,\"file\":\"1780041432_8586.png\",\"title\":\"Updated Slider Title\",\"description\":\"Updated luxury slider description\",\"file_url\":\"https:\\/\\/www.listify.asia\\/public\\/uploads\\/custom-fields\\/1780041432_8586.png\"},{\"id\":2,\"file\":\"1780041397_6211.png\",\"title\":\"Listing Front View 1\",\"description\":\"Listing IT front area 1\"}]}', NULL, '2026-05-29 07:56:37', '2026-05-29 07:57:12'),
(33, 20, 'hotel', 'gallery', 'Listing gallery', '{\"data\":[{\"id\":1,\"file\":\"1780041444_7314.png\"},{\"id\":2,\"file\":\"1780041440_2862.png\"}]}', NULL, '2026-05-29 07:57:20', '2026-05-29 07:57:24'),
(34, 20, 'hotel', 'faq', 'FAQ\'S', '{\"data\":[{\"id\":1,\"question\":\"What services do you provide updated?\",\"answer\":\"We provide web and app development updated.\"},{\"id\":2,\"question\":\"Do you provide support?\",\"answer\":\"Yes, we provide 24x7 support.\"}]}', NULL, '2026-05-29 07:57:27', '2026-05-29 07:57:32'),
(35, 18, 'hotel', 'faq', 'Faqs', '{\"data\":[{\"id\":1,\"question\":\"Is it Good\",\"answer\":\"Yes\"},{\"id\":2,\"question\":\"Is separate Bike and Car Parking Available?\",\"answer\":\"No, separate car and bike parking are not available, it is included in same parking\"}]}', NULL, '2026-05-30 06:29:07', '2026-05-30 06:29:07'),
(36, 21, 'hotel', 'faq', 'Faq QNA', '{\"data\":[{\"id\":1,\"question\":\"is parking availbale?\",\"answer\":\"yes\"},{\"id\":2,\"question\":\"is space availbale?\",\"answer\":\"yes\"}]}', NULL, '2026-05-30 07:25:44', '2026-05-30 07:25:44'),
(37, 63, 'automobiles', 'faq', 'FAQ\'S', '{\"data\":[{\"id\":1,\"question\":\"what are you doing\",\"answer\":\"everything\"}]}', NULL, '2026-07-07 10:21:05', '2026-07-10 11:06:13'),
(38, 1, 'restaurant', 'faq', 'FAQ\'S', '{\"data\":[{\"id\":1,\"question\":\"Is our food fresh\",\"answer\":\"yes, we don\'t use expired products !\"}]}', NULL, '2026-07-13 09:44:42', '2026-07-13 09:44:42'),
(39, 70, 'food', 'faq', 'FAQ\'S', '{\"data\":[{\"id\":1,\"question\":\"123\",\"answer\":\"567\"}]}', NULL, '2026-07-13 09:53:21', '2026-07-13 09:53:21'),
(40, 71, 'agencies', 'faq', 'FAQ\'S', '{\"data\":[{\"id\":1,\"question\":\"567\",\"answer\":\"789\"}]}', NULL, '2026-07-13 10:01:15', '2026-07-13 10:01:15'),
(41, 2, 'restaurant', 'faq', 'FAQ\'S', '{\"data\":[{\"id\":1,\"question\":\"Do you use expired products\",\"answer\":\"No we use only fresh products!!\"}]}', NULL, '2026-07-13 10:10:38', '2026-07-13 10:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `custom_listings`
--

CREATE TABLE `custom_listings` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `type_id` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `visibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_hours` json DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `feature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `is_claimed` int DEFAULT NULL,
  `is_popular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listing_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_base_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `custom_listings`
--

INSERT INTO `custom_listings` (`id`, `type`, `data_type`, `type_id`, `title`, `price`, `description`, `visibility`, `meta_title`, `meta_keyword`, `meta_description`, `og_title`, `og_description`, `og_image`, `canonical_url`, `json_id`, `country`, `city`, `area`, `address`, `postal_code`, `Latitude`, `Longitude`, `image`, `opening_hours`, `category`, `feature`, `user_id`, `is_claimed`, `is_popular`, `listing_type`, `img_base_url`, `image_url`, `vendor_id`, `created_at`, `updated_at`) VALUES
(1, 'it-services', 'web', 28, 'Corp marvel Infotech', NULL, 'Looking to elevate your digital presence or streamline your business operations? Our expert team in Sonipat specializes in custom website development, software solutions, and mobile app creation tailored to your unique needs.\n\nWhether you\'re a startup, SME, or enterprise, we deliver scalable and secure digital products that drive growth. From intuitive websites and e-commerce platforms to robust ERP systems and mobile apps for Android & iOS, we combine creativity with cutting-edge technology to bring your ideas to life.', 'visible', 'Website Design & Development – Responsive, SEO-optimized, and user-friendly websites', 'Custom Software Solutions, Mobile App Development, UI/UX Design, Website Design & Development', '', '', '', NULL, '', '<link rel=\"canonical\" href=\"https://www.corpmarvel.com/\" />', '98', '1', '98:@:1:@:SCO No - 44, 2nd Floor, Club Road, TDI Kingsbury, (Near TDI Club), Kundli, Sonipat, Haryana-131023', 'SCO No - 44, 2nd Floor, Club Road, TDI Kingsbury, (Near TDI Club), Kundli, Sonipat, Haryana-131023', '131023', '28.897698618031', '77.117522473778', '[\"0-1781680567.png\"]', NULL, '12', '[\"1\",\"2\",\"3\"]', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2025-08-06 09:13:09', '2026-06-26 06:02:59'),
(3, 'agencies', 'web', 29, 'Primetime Communications Pvt. Ltd.', NULL, 'Brands need due nurturing, care and love. The love we put in our brands reflect in the relationship it forms with the consumers. Nobody understands it better than us and nobody does it better than Primetime. Our deep understanding of Brand Promotion, Brand Communication and Media and commitment to excellence, gives us an edge over others. Each assignment, big or small, is handled with same competence, sincerity and passion.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '2', '98:@:2:@:A-4, (COMMERCIAL), 2ND FlOOR, INDERPURI, NEW DELHI.', 'A-4, (COMMERCIAL), 2ND FlOOR, INDERPURI, NEW DELHI.', '110012', '28.6286841', '77.1470979', '[\"0-1782369975.png\"]', NULL, '15', '[\"61\"]', 22, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2025-08-17 14:15:30', '2026-06-26 06:01:05'),
(9, 'corporate-gifting-and-printing-services', 'web', 26, 'Ashna Priniters', NULL, 'Ashna Printer in Near Makhan Bhog Restaurant, Sonepat is known to satisfactorily cater to the demands of its customer base. The business came into existence in 2001 and has, since then, been a known name in its field. It stands located at Shop No. 2, Near Makhan Bhog Restaurant-131028. Near Makhan Bhog Restaurant is a prominent landmark in the area and this establishment is in close proximity to the same. It has earned stamps like Jd Verified, Jd Pay substantiating the credentials of the business. The business strives to make for a positive experience through its offerings. The accepted modes of payment such as UPI, Cash make every business transaction easy and seamless, contributing to making the entire process even more effective.\nCustomer centricity is at the core of Ashna Printer in Near Makhan Bhog Restaurant, Sonepat and it is this belief that has led the business to build long-term relationships. Ensuring a positive customer experience, making available goods and/or services that are of top-notch quality is given prime importance.\nIndia\'s leading B2B market place, Jd Mart ensures engaging in business activities is a seamless process for small and medium enterprises as well as large businesses. In a wake to enable these businesses to reach their audience, this portal lets them showcase their offerings in terms of the products and/or services through a digital catalogue', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '1', '98:@:1:@:Main G.T Road , Near Makhan Bhog , kundli, Sonipat (HR)', 'Main G.T Road , Near Makhan Bhog , kundli, Sonipat (HR)', '131001', '28.89081', '77.11562', '[\"0-1782981240.png\"]', NULL, '54', 'null', 32, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2025-10-01 11:31:14', '2026-07-02 08:34:00'),
(11, 'it-services', 'web', 28, 'Cognixis Minds Consulting', NULL, 'Cognixis Minds Consulting is a forward-thinking IT consulting company delivering innovative, reliable, and scalable technology solutions. We specialize in helping businesses streamline operations, enhance digital presence, and drive growth through tailored IT services. With a focus on quality, efficiency, and client success, we empower organizations to stay competitive in an evolving digital landscape', 'visible', 'Cognixis Minds – Expert IT Consulting & Technology Solutions', 'IT Consulting Company; Web Development ; Technology Solutions', 'Looking for reliable IT consulting? Cognixis Minds delivers tailored IT services, software solutions, and digital transformation for modern businesses.', 'Transform Your Business with Cognixis Minds IT Solutions', 'Cognixis Minds delivers expert IT consulting and innovative technology solutions to help businesses grow, optimize operations, and stay ahead digitally.', NULL, 'cognixisminds.com', 'CM-2026-01', '98', '1', '98:@:1:@:SCO No.44, 2nd Floor, Club Road, TDI Kingsbury, (Near TDI Club), Kundli, Sonipat, Haryana,India', 'SCO No.44, 2nd Floor, Club Road, TDI Kingsbury, (Near TDI Club), Kundli, Sonipat, Haryana,India', '131023', '28.897838333333326', '-282.58594', '[\"0-1781681126.png\"]', NULL, '12', '[\"1\",\"2\",\"3\",\"65\"]', 43, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-20 10:34:35', '2026-06-26 06:02:59'),
(18, 'manufacturing', 'web', 22, 'Shri Khatu Shyam Engineering Company', NULL, 'We specialize in manufacturing and repairing high-quality goods handling equipment for industrial and factory use. Our products are designed for durability, efficiency, and safety in material movement. We also offer reliable maintenance and repair services to ensure smooth operations. Committed to quality and timely service, we support businesses in optimizing their workflow.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '2', '98:@:2:@:Killa No. 40//5, Near Behind Saroha Properties, Rai, Sonipat, Haryana', 'Killa No. 40//5, Near Behind Saroha Properties, Rai, Sonipat, Haryana', '110028', '28.944720762158', '77.096341084657', '[\"0-1782982193.png\"]', NULL, '80', 'null', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-27 08:07:51', '2026-07-02 08:49:53'),
(21, 'manufacturing', 'web', 22, 'Ankom Enterprises', NULL, 'Incorporated in 1983, (earlier known as Anureet Plastics India), our company is a trusted and experienced name in the field of plastic injection moulding. With more than 40 years of experience Ankom Enterprises is built on a strong foundation of technical expertise, quality commitment, and customer trust, we have grown steadily to become a reliable manufacturing partner for a wide range of industries.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '2', '98:@:2:@:C-35, DDA Sheds, Pocket A, Okhla Phase I, Okhla Industrial Estate, New Delhi, Delhi', 'C-35, DDA Sheds, Pocket A, Okhla Phase I, Okhla Industrial Estate, New Delhi, Delhi', '110020', '28.527935919106', '77.275173628836', '[\"0-1782982549.png\"]', NULL, '43', 'null', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-27 08:20:53', '2026-07-02 08:55:49'),
(24, 'healthcare-services', 'web', 34, 'Labcorp Diagnostics', NULL, 'Labcorp Diagnostics is your trusted healthcare partner providing quality diagnostic services with timely report delivery. Our NABL-accredited laboratories contain state-of-the-art and technically advanced equipment that delivers precise results to boost disease or condition diagnosis.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '2', '98:@:2:@:B/101, Pushpanjli Enclave, Outer Ring Road, Opposite Piller No/39 Pitampura,New Delhi,India', 'B/101, Pushpanjli Enclave, Outer Ring Road, Opposite Piller No/39 Pitampura,New Delhi,India', '110034', '28.696550336341', '77.112277521655', '[\"0-1782370378.png\"]', NULL, '72', 'null', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-27 11:08:01', '2026-06-29 11:49:46'),
(25, 'healthcare-services', 'web', 34, 'Indo Chem Laboratories', NULL, 'At Indo Chem Laboratories, we specialize in manufacturing premium wet and dry wipes tailored to meet diverse hygiene and personal care needs. Our product range includes baby wipes, makeup removal wipes, bed bath wipes, feminine hygiene wipes, and intimate wipes, all crafted with precision and care.\nWith a commitment to quality, innovation, and ethical business practices, we’ve built a reputation as one of India’s leading wipe manufacturers. Explore our offerings and discover why clients across industries trust us for superior hygiene solutions.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '5', '98:@:5:@:A-2/2, Industrial Area, Gorwa Industrial Area, Vadodara, Gujarat, India', 'A-2/2, Industrial Area, Gorwa Industrial Area, Vadodara, Gujarat, India', '390016', '22.332073143686', '73.166868632945', '[\"0-1782370205.png\"]', NULL, '71', 'null', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-27 11:15:06', '2026-06-29 11:49:46'),
(29, 'business-services', 'web', 36, 'Anan Enterprises', NULL, 'We understand the unique challenges that companies face when it comes to communicating with non-native consumers and clients, and the difficulties of running a business in a foreign country. That’s why we offer innovative translation solutions that are tailored to each client’s specific needs.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '2', '98:@:2:@:504, 5th floor, Padma Tower 2, Rajendra Palace, Central Delhi, Delhi', '504, 5th floor, Padma Tower 2, Rajendra Palace, Central Delhi, Delhi', '110008', '28.645342035115', '77.178571251583', '[\"0-1782978782.png\"]', NULL, '77', 'null', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-27 11:29:01', '2026-07-02 07:53:02'),
(31, 'travel-tourism', 'web', 35, 'Kailash Mansarovar Yatra', NULL, 'Experience the divine journey of Kailash Mansarovar Yatra, a once-in-a-lifetime spiritual adventure. This pilgrimage takes you through scenic mountains, serene lakes, and sacred sites. Pilgrims undertake the holy parikrama of Mount Kailash and visit Mansarovar Lake. It offers a perfect blend of spirituality, adventure, and natural beauty.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '2', '98:@:2:@:301, HB Twin Tower,Netaji Subhash Place,Pitam Pura,Delhi 110034', '301, HB Twin Tower,Netaji Subhash Place,Pitam Pura,Delhi 110034', '110034', '28.693248751361', '77.152267098332', '[\"0-1782371541.png\"]', NULL, '74', 'null', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-27 11:32:03', '2026-06-29 06:20:46'),
(32, 'business-services', 'web', 36, 'Corporate Barter', NULL, 'We offer advertising options in multiple media spectrums like Print, Electronic, OOH, Cinema etc. Our clients exchange their goods / services to save the marketing / promotional costs. We rope in the below listed options for our network clients.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '2', '98:@:2:@:271, CM – I, Opposite Videocon Towers Jhandelwalan, New Delhi.', '271, CM – I, Opposite Videocon Towers Jhandelwalan, New Delhi.', '110055', '28.645252654871', '77.202747193254', '[\"0-1782979161.png\"]', NULL, '79', 'null', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-27 11:33:41', '2026-07-02 07:59:21'),
(33, 'travel-tourism', 'web', 35, 'Woo Adventure', NULL, 'Welcome to the world of overlanding. WOO Adventures takes you to over 52 countries across 06 continents on wheels, that too in your own favourite car. Curious to know how? Contact to explore more.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '2', '98:@:2:@:502, GD ITL Northex Tower A09, Netaji Subhash Place, Pitam Pura New Delhi -  INDIA', '502, GD ITL Northex Tower A09, Netaji Subhash Place, Pitam Pura New Delhi -  INDIA', '110034', '28.691895826396', '77.152626510034', '[\"0-1782371395.png\"]', NULL, '75', 'null', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-27 11:37:24', '2026-06-29 06:20:46'),
(34, 'travel-tourism', 'web', 35, 'Max Holidays', NULL, 'We know it is not an easy task for you to plan a perfect holiday. At Max Holidays we bring for you hundreds of handcrafted pre-designed private tours to India & its neighbouring countries. These tours are only some of the example of travel options available with us for India & Sub Continent but the variety of tour packages available with us will amaze you. Select a tour package from the list & write to us for price quotations, bookings or any alterations. We love to work for you.', 'visible', '', '', '', '', '', NULL, '', NULL, '98', '2', '98:@:2:@:301, HB Twin Tower, Netaji Subhash Place, Pitam Pura, New Delhi', '301, HB Twin Tower, Netaji Subhash Place, Pitam Pura, New Delhi', '110034', '28.693519178082', '77.151822257672', '[\"0-1782370726.png\"]', NULL, '76', 'null', 1, NULL, 'top', 'premium', 'https://www.listify.asia/', NULL, NULL, '2026-03-27 11:39:03', '2026-06-29 06:20:46'),
(41, 'corporate-gifting-and-printing-services', 'web', NULL, 'Sukhmani Enterprises HUF', NULL, 'Sukhmani Enterprises HUF is a trusted gift shop offering a wide range of unique, stylish, and affordable gifting solutions for all occasions. From personalized items to festive gifts, we ensure quality, creativity, and customer satisfaction in every product.\n\nSukhmani Enterprises HUF is your one-stop destination for fancy stationery, novelties, and gift items. Our collection includes:\n\nStationery: fancy notebooks, pens, and premium stationery items\nGift Items: photo frames, ceramic coffee mugs, fancy wooden trays\nCustom Products: custom mugs, personalized bottles\nDecor & Spiritual: god figures\nFun & Collectibles: anime action figures, unique novelties\n\nPerfect for every occasion, we combine quality, creativity, and style to make your gifting experience truly special.', 'visible', 'Sukhmani Enterprises HUF', 'listing', 'Sukhmani Enterprises HUF is a trusted gift shop offering a wide range of unique, stylish, and affordable gifting solutions for all occasions. From personalized', 'Sukhmani Enterprises HUF', 'Sukhmani Enterprises HUF is a trusted gift shop offering a wide range of unique, stylish, and affordable gifting solutions for all occasions. From personalized', NULL, 'https://example.com', '123', '98', '1', '98:@:1:@:Tdi city, SCO No-32, 2nd Floor, Emperor Square, Kundli, Sonipat, Haryana 131029', 'Tdi city, SCO No-32, 2nd Floor, Emperor Square, Kundli, Sonipat, Haryana 131029', '131029', '28.898551218355', '77.114263736948', '[\"0-1778064780.png\",\"0-1778909684.png\"]', NULL, '56', '[\"79\",\"80\"]', 50, NULL, 'top', NULL, NULL, NULL, NULL, '2026-05-06 08:15:38', '2026-07-10 06:11:28'),
(61, 'food', 'web', NULL, 'silver Spoon', NULL, 'silver Spoon Café is a cozy and welcoming destination where great coffee meets delicious food. We serve freshly brewed coffee, handcrafted beverages, sandwiches, pastries, desserts, and light meals made with quality ingredients. Whether you\'re looking for a quick coffee break, a casual meeting spot, or a relaxing place to spend time with friends and family, our warm atmosphere and friendly service make every visit memorable.', 'visible', 'silver Spoon', 'listing', 'Golden Spoon Café is a cozy and welcoming destination where great coffee meets delicious food. We serve freshly brewed coffee, handcrafted beverages, sandwiches', 'Golden Spoon', 'Golden Spoon Café is a cozy and welcoming destination where great coffee meets delicious food. We serve freshly brewed coffee, handcrafted beverages, sandwiches', NULL, 'https://example.com', '123', '98', '1', '98:@:1:@:Mall Rd, Banarsi Das Estate, Timarpur, New Delhi, Delhi, 110007', 'Mall Rd, Banarsi Das Estate, Timarpur, New Delhi, Delhi, 110007', '110007', '28.695406432770085', '77.21452072498688', '[\"0-1780384587.png\",\"0-1780384612.png\"]', NULL, '4', '[\"200\",\"202\",\"204\",\"206\",\"207\"]', 50, NULL, 'features', NULL, NULL, NULL, NULL, '2026-06-02 07:16:27', '2026-07-10 06:06:32'),
(69, 'automobiles', 'app', NULL, 'hello', NULL, 'hh', 'visible', '', '', NULL, '', NULL, NULL, '', NULL, '98', '9', '98:@:9:@:', '', '', '', '', '[]', NULL, '47', NULL, 50, NULL, 'top', NULL, NULL, NULL, NULL, '2026-07-13 09:47:59', '2026-07-13 09:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `custom_types`
--

CREATE TABLE `custom_types` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `sorting` int DEFAULT NULL,
  `featured` enum('0','1') CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT '0',
  `logo` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `custom_types`
--

INSERT INTO `custom_types` (`id`, `name`, `slug`, `status`, `sorting`, `featured`, `logo`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Car', 'car', 1, 21, '0', '1782734532_logo_AIsDoVLFvM.png', '1752132100_image_iRKhp5gT49.jpg', NULL, '2026-06-29 12:02:12'),
(2, 'Hotel', 'hotel', 1, 17, '0', '1782734495_logo_rHLKkJIG1G.png', '1752042552_image_s33K8Tmufw.jpg', NULL, '2026-06-29 12:01:35'),
(3, 'Beauty', 'beauty', 1, 20, '0', '1782734322_logo_7epEMVsPlP.png', '1752057464_image_NpWcHdFiGt.jpg', NULL, '2026-06-29 11:58:42'),
(4, 'Restaurant', 'restaurant', 1, 19, '0', '1782734240_logo_YBBG7PSdMR.png', '1752131989_image_AAdh8Mm0ru.jpg', NULL, '2026-06-29 11:57:20'),
(5, 'Real-Estate', 'real-estate', 1, 18, '0', '1782712317_logo_TREuP2CxNV.png', '1752057375_image_B91JNVKSS1.jpg', NULL, '2026-06-29 05:51:57'),
(19, 'Food', 'food', 1, 16, '0', '1782711519_logo_6SMMVEiFD4.png', NULL, '2025-08-05 11:08:49', '2026-06-29 05:38:39'),
(20, 'Fitness', 'fitness', 1, 15, '0', '1782458339_logo_rOe2z5uT2Y.png', NULL, '2025-08-05 11:09:41', '2026-06-26 07:18:59'),
(21, 'Grooming', 'grooming', 1, 14, '0', '1782455511_logo_w1wP95EPD5.png', NULL, '2025-08-05 11:09:52', '2026-06-26 06:31:51'),
(22, 'Manufacturing', 'manufacturing', 1, 13, '0', '1782455330_logo_5PFOQ5eKMs.png', NULL, '2025-08-05 11:10:07', '2026-06-26 06:28:50'),
(23, 'Trading', 'trading', 1, 12, '0', '1782454797_logo_7m3CV8K898.png', NULL, '2025-08-05 11:10:17', '2026-06-26 06:19:57'),
(24, 'Automobiles', 'automobiles', 1, 1, '0', '1782734042_logo_F7jsS7u480.png', '1783682177_image_rNrY89hMiL.png', '2025-08-05 11:10:26', '2026-07-10 11:16:17'),
(25, 'Recreation', 'recreation', 1, 11, '0', '1782454282_logo_wPh0KXuKR4.png', NULL, '2025-08-05 11:10:40', '2026-06-26 06:11:22'),
(26, 'Corporate Gifting and Printing Services', 'corporate-gifting-and-printing-services', 1, 10, '0', '1782454120_logo_gj8ycapvWQ.png', NULL, '2025-08-05 11:10:50', '2026-06-26 06:08:40'),
(27, 'Industrial', 'industrial', 1, 9, '0', '1782453967_logo_sDpHgMJirR.png', NULL, '2025-08-05 11:11:00', '2026-06-26 06:06:07'),
(28, 'IT Services', 'it-services', 1, 8, '1', '1782453779_logo_d0aETUBl9p.png', '1754492277_image_1prMpIQDpO.jpeg', '2025-08-05 11:11:11', '2026-06-26 06:02:59'),
(29, 'Agencies', 'agencies', 1, 7, '1', '1782453665_logo_KxqbeJ41F2.png', NULL, '2025-08-05 11:11:22', '2026-06-26 06:01:05'),
(30, 'Popular Services', 'popular-services', 1, 6, '0', '1782734013_logo_neZ4OE528l.png', NULL, '2025-08-05 11:11:28', '2026-06-29 11:53:33'),
(31, 'Academies', 'academies', 1, 5, '0', '1782454012_logo_oCFgRu02hO.png', NULL, '2025-08-05 14:04:36', '2026-06-26 06:06:52'),
(34, 'Healthcare Services', 'healthcare-services', 1, 4, '1', '1782733786_logo_uDMt9JPvFX.png', '1774593825_image_iTjBE5nlTU.jpeg', '2026-03-27 06:43:45', '2026-06-29 11:49:46'),
(35, 'Travel & Tourism', 'travel-tourism', 1, 3, '1', '1782714046_logo_b4vjQzP5b4.png', '1782369211_image_nzaAbSiFBc.png', '2026-03-27 07:04:11', '2026-06-29 06:20:46'),
(36, 'Business Services', 'business-services', 1, 2, '1', '1782714701_logo_QEndEdcOdj.png', '1774595681_image_vKp3QN0YZu.png', '2026-03-27 07:14:41', '2026-06-29 06:31:41');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int NOT NULL,
  `listing_id` int NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'hotel, car, beauty, restaurant, real_estate, custom',
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `order` int DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `listing_id`, `type`, `question`, `answer`, `order`, `created_at`, `updated_at`) VALUES
(1, 3, 'hotel', 'What are the check-in and check-out times?', 'Check-in is from 2:00 PM and check-out is until 11:00 AM.', 1, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(2, 3, 'hotel', 'Does the hotel have parking facility?', 'Yes, we have complimentary valet parking for all guests.', 2, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(3, 3, 'hotel', 'Is breakfast included in the room rate?', 'Breakfast is included in premium room bookings only. For standard rooms, breakfast can be added at $15 per person.', 3, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(4, 3, 'hotel', 'Do you allow pets?', 'Yes, we are pet-friendly. Additional charges of $25 per night apply.', 4, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(5, 3, 'hotel', 'Is there a swimming pool?', 'Yes, we have an outdoor heated swimming pool open from 7 AM to 10 PM.', 5, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(6, 39, 'custom', 'Do you provide test drive facility?', 'Yes, we provide free test drive at your preferred location. Just schedule an appointment.', 1, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(7, 39, 'custom', 'What is the warranty period?', 'We provide 3 years/1,00,000 km standard warranty on all new vehicles.', 2, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(8, 39, 'custom', 'Do you offer financing options?', 'Yes, we have tie-ups with leading banks offering loans up to 90% of the car value.', 3, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(9, 39, 'custom', 'Can I exchange my old car?', 'Yes, we accept exchange of old cars. Our team will evaluate your car and give you the best price.', 4, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(10, 39, 'custom', 'What documents are required for purchase?', 'You need to submit ID proof, address proof, PAN card, and passport size photographs.', 5, '2026-05-05 10:54:27', '2026-05-05 10:54:27'),
(11, 39, 'custom', 'Is insurance included?', 'Basic insurance is included for the first year. You can opt for extended coverage at additional cost.', 6, '2026-05-05 10:54:27', '2026-05-05 10:54:27');

-- --------------------------------------------------------

--
-- Table structure for table `form_builders`
--

CREATE TABLE `form_builders` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `form_builder` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `form_builders`
--

INSERT INTO `form_builders` (`id`, `user_id`, `type`, `form_builder`, `created_at`, `updated_at`) VALUES
(1, 1, 'hotel', '[{\"type\":\"text\",\"required\":false,\"label\":\"Name\",\"className\":\"form-control\",\"name\":\"text-1756464128722-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"number\",\"required\":true,\"label\":\"Mobile\",\"className\":\"form-control\",\"name\":\"number-1756464179041-0\",\"access\":false,\"subtype\":\"number\",\"min\":10,\"max\":13},{\"type\":\"text\",\"subtype\":\"email\",\"required\":true,\"label\":\"Email ID\",\"className\":\"form-control\",\"name\":\"text-1756464145325-0\",\"access\":false,\"maxlength\":40},{\"type\":\"date\",\"required\":true,\"label\":\"Date of Arrival\",\"className\":\"form-control\",\"name\":\"date-1756464197981-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"date\",\"required\":true,\"label\":\"Date of Departure\",\"className\":\"form-control\",\"name\":\"date-1756795942397-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"checkbox-group\",\"required\":true,\"label\":\"Requirements After Checkin\",\"toggle\":false,\"inline\":false,\"name\":\"checkbox-group-1756464206746-0\",\"access\":false,\"other\":false,\"values\":[{\"label\":\"Sightseen\",\"value\":\"Sightseen\",\"selected\":false},{\"label\":\"Breakfast\",\"value\":\"Breakfast\",\"selected\":false},{\"label\":\"Lunch\",\"value\":\"Lunch\",\"selected\":false},{\"label\":\"Dinner\",\"value\":\"Dinner\",\"selected\":false},{\"label\":\"CAB\",\"value\":\"CAB\",\"selected\":false},{\"label\":\"Guide\",\"value\":\"Guide\",\"selected\":false}]},{\"type\":\"textarea\",\"required\":false,\"label\":\"Special Note\",\"className\":\"form-control\",\"name\":\"textarea-1756796172011-0\",\"access\":false,\"subtype\":\"textarea\",\"maxlength\":50,\"rows\":3}]', '2025-08-14 10:04:30', '2025-09-02 06:56:29'),
(3, 1, 'real-estate', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1756458414045-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"number\",\"required\":true,\"label\":\"Mobile No.\",\"className\":\"form-control\",\"name\":\"number-1756459104905-0\",\"access\":false,\"subtype\":\"number\"},{\"type\":\"text\",\"required\":false,\"label\":\"Email<br>\",\"className\":\"form-control\",\"name\":\"text-1774431134547-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"date\",\"subtype\":\"time\",\"required\":true,\"label\":\"Best Time to Call\",\"className\":\"form-control\",\"name\":\"date-1756797546979-0\",\"access\":false},{\"type\":\"textarea\",\"required\":false,\"label\":\"Special Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1756797631151-0\",\"access\":false,\"subtype\":\"textarea\"},{\"type\":\"select\",\"required\":false,\"label\":\"Property Type\",\"className\":\"form-control\",\"name\":\"select-1774431158290-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Apartment\",\"value\":\"Apartment\",\"selected\":true},{\"label\":\"Villa\",\"value\":\"Villa\",\"selected\":false},{\"label\":\"Plot\",\"value\":\"Plot\",\"selected\":false},{\"label\":\"Commercial\",\"value\":\"Commercial\",\"selected\":false}]},{\"type\":\"select\",\"required\":false,\"label\":\"Purpose\",\"className\":\"form-control\",\"name\":\"select-1774431209981-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Buy\",\"value\":\"Buy\",\"selected\":true},{\"label\":\"Sell\",\"value\":\"Sell\",\"selected\":false},{\"label\":\"Rent\",\"value\":\"Rent\",\"selected\":false}]}]', '2025-08-29 09:07:05', '2026-03-25 09:34:11'),
(4, 1, 'beauty', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1756459639582-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"number\",\"required\":true,\"label\":\"Your Number\",\"className\":\"form-control\",\"name\":\"number-1756459640790-0\",\"access\":false,\"subtype\":\"number\"},{\"type\":\"number\",\"required\":true,\"label\":\"Mobile No.\",\"className\":\"form-control\",\"name\":\"number-1774430893423-0\",\"access\":false,\"subtype\":\"number\",\"min\":10,\"max\":10},{\"type\":\"date\",\"required\":true,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774431060610-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"text\",\"subtype\":\"email\",\"required\":false,\"label\":\"Email id\",\"className\":\"form-control\",\"name\":\"text-1756796304125-0\",\"access\":false,\"maxlength\":30},{\"type\":\"textarea\",\"required\":false,\"label\":\"Personal Note\",\"className\":\"form-control\",\"name\":\"textarea-1756796414159-0\",\"access\":false,\"subtype\":\"textarea\",\"maxlength\":100,\"rows\":3},{\"type\":\"select\",\"required\":false,\"label\":\"Service Type\",\"className\":\"form-control\",\"name\":\"select-1774430981998-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Hair\",\"value\":\"Hair\",\"selected\":true},{\"label\":\"Makeup\",\"value\":\"Makeup\",\"selected\":false},{\"label\":\"Skincare\",\"value\":\"Skincare\",\"selected\":false},{\"label\":\"Nails\",\"value\":\"Nails\",\"selected\":false}]}]', '2025-08-29 09:27:22', '2026-03-25 09:31:23'),
(5, 1, 'automobiles', '[{\"type\":\"text\",\"required\":true,\"label\":\"Name\",\"className\":\"form-control\",\"name\":\"text-1756464759029-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"number\",\"required\":true,\"label\":\"Phone no\",\"className\":\"form-control\",\"name\":\"number-1756464786361-0\",\"access\":false,\"subtype\":\"number\"},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1756464771479-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"date\",\"required\":false,\"label\":\"Date\",\"className\":\"form-control\",\"name\":\"date-1756464803984-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":true,\"label\":\"Purpose of Meeting\",\"className\":\"form-control\",\"name\":\"select-1774439607498-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Buy\",\"value\":\"Buy\",\"selected\":true},{\"label\":\"Sell\",\"value\":\"Sell\",\"selected\":false},{\"label\":\"Test Drive\",\"value\":\"Test Drive\",\"selected\":false},{\"label\":\"Service\",\"value\":\"Service\",\"selected\":false}]},{\"type\":\"textarea\",\"required\":false,\"label\":\"Remark\",\"className\":\"form-control\",\"name\":\"textarea-1774439657458-0\",\"access\":false,\"subtype\":\"textarea\"}]', '2025-08-29 10:53:34', '2026-03-25 11:54:29'),
(6, 1, 'car', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"description\":\"Your Name\",\"placeholder\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1756794757505-0\",\"access\":false,\"value\":\"Your Name\",\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"number\",\"required\":true,\"label\":\"Mobile Number\",\"description\":\"Mobile Number\",\"placeholder\":\"Mobile Number\",\"className\":\"form-control\",\"name\":\"number-1756794882050-0\",\"access\":false,\"value\":\"Number\",\"subtype\":\"number\",\"min\":10,\"max\":13},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774430198051-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"select\",\"required\":true,\"label\":\"Select\",\"description\":\"Looking This Car For\",\"placeholder\":\"Looking This Car For\",\"className\":\"form-control\",\"name\":\"select-1756795098795-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Myself\",\"value\":\"Myself\",\"selected\":true},{\"label\":\"Family\",\"value\":\"Family\",\"selected\":false},{\"label\":\"Spouse\",\"value\":\"Spouse\",\"selected\":false},{\"label\":\"Friend\\/Relatives\",\"value\":\"Friend\\/Relatives\",\"selected\":false}]},{\"type\":\"date\",\"required\":true,\"label\":\"When You Are Planning to Buy\",\"description\":\"When You Are Planning to Buy\",\"className\":\"form-control\",\"name\":\"date-1756795221646-0\",\"access\":false,\"subtype\":\"date\",\"min\":\"1\",\"max\":\"31\",\"step\":\"1\"},{\"type\":\"textarea\",\"required\":false,\"label\":\"Any Specific Notes\\/Remarks\",\"description\":\"Any Specific Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1756795304793-0\",\"access\":false,\"subtype\":\"textarea\",\"maxlength\":30,\"rows\":2}]', '2025-09-02 06:42:24', '2026-03-25 09:17:21'),
(7, 1, 'academies', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your name\",\"className\":\"form-control\",\"name\":\"text-1756796522842-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"text\",\"subtype\":\"tel\",\"required\":true,\"label\":\"Mobile No.\",\"className\":\"form-control\",\"name\":\"text-1756796624027-0\",\"access\":false},{\"type\":\"select\",\"required\":true,\"label\":\"Looking Admission For\",\"className\":\"form-control\",\"name\":\"select-1756796543425-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Myself\",\"value\":\"Myself\",\"selected\":true},{\"label\":\"My Family/Family Member\",\"value\":\"My Family/Family Member\",\"selected\":false},{\"label\":\"My Friend/Relative\",\"value\":\"option-3\",\"selected\":false}]},{\"type\":\"date\",\"required\":true,\"label\":\"Want To Start On or Before\",\"className\":\"form-control\",\"name\":\"date-1756796655905-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"textarea\",\"required\":false,\"label\":\"Special Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1756796740808-0\",\"access\":false,\"subtype\":\"textarea\"}]', '2025-09-02 07:05:58', '2025-09-02 07:05:58'),
(8, 1, 'restaurant', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1756796967008-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"textarea\",\"required\":false,\"label\":\"Mobile No.\",\"className\":\"form-control\",\"name\":\"textarea-1756796983217-0\",\"access\":false,\"subtype\":\"textarea\"},{\"type\":\"date\",\"subtype\":\"datetime-local\",\"required\":true,\"label\":\"Booking For\",\"className\":\"form-control\",\"name\":\"date-1756796999235-0\",\"access\":false},{\"type\":\"select\",\"required\":true,\"label\":\"Service Requirement For\",\"className\":\"form-control\",\"name\":\"select-1756797075933-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Table On Site in Restaurant\",\"value\":\"Table On Site in Restaurant\",\"selected\":true},{\"label\":\"Catering for Function at Home/Office\",\"value\":\"Catering for Function at Home/Office\",\"selected\":false},{\"label\":\"Any Special Occasion\",\"value\":\"Any Special Occasion\",\"selected\":false},{\"label\":\"Tiffin Service\",\"value\":\"Tiffin Service\",\"selected\":false}]},{\"type\":\"number\",\"subtype\":\"range\",\"required\":true,\"label\":\"Number of Guests\",\"className\":\"form-control\",\"name\":\"number-1756797336883-0\",\"access\":false,\"min\":2,\"max\":200,\"step\":1},{\"type\":\"textarea\",\"required\":false,\"label\":\"Special Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1756797398014-0\",\"access\":false,\"subtype\":\"textarea\",\"maxlength\":30,\"rows\":2}]', '2025-09-02 07:17:04', '2026-03-25 09:31:52'),
(9, 1, 'fitness', '[{\"type\":\"text\",\"required\":false,\"label\":\"Your Name&nbsp;\",\"className\":\"form-control\",\"name\":\"text-1762149998903-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"select\",\"required\":false,\"label\":\"Gender\",\"placeholder\":\"Select Gender\",\"className\":\"form-control\",\"name\":\"select-1762149420883-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Male \",\"value\":\"Male \",\"selected\":true},{\"label\":\"Female \",\"value\":\"Female \",\"selected\":false}]},{\"type\":\"date\",\"required\":false,\"label\":\"Date Of Birth\",\"className\":\"form-control\",\"name\":\"date-1762149800295-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"number\",\"required\":false,\"label\":\"Mobile Number\",\"className\":\"form-control\",\"name\":\"number-1762149918274-0\",\"access\":false,\"subtype\":\"number\",\"min\":10,\"max\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Enter your Email\",\"className\":\"form-control\",\"name\":\"text-1762149548795-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"checkbox-group\",\"required\":false,\"label\":\"Application Fee\",\"toggle\":false,\"inline\":false,\"name\":\"checkbox-group-1762149573955-0\",\"access\":false,\"other\":false,\"values\":[{\"label\":\"12 Months ₹ 26000\",\"value\":\"option-1\",\"selected\":false},{\"label\":\"24 Months ₹50000\",\"value\":\"\",\"selected\":false}]},{\"type\":\"select\",\"required\":false,\"label\":\"Fitness Goal\",\"className\":\"form-control\",\"name\":\"select-1774431557593-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Weight Loss\",\"value\":\"Weight Loss\",\"selected\":true},{\"label\":\"Muscle Gain\",\"value\":\"Muscle Gain\",\"selected\":false},{\"label\":\"General Fitness\",\"value\":\"General Fitness\",\"selected\":false}]}]', '2025-11-03 06:07:10', '2026-03-25 09:39:51'),
(10, 1, 'food', '[{\"type\":\"text\",\"required\":false,\"label\":\"Enter Your Full Name\",\"className\":\"form-control\",\"name\":\"text-1762150106932-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"text\",\"required\":false,\"label\":\"Address\",\"className\":\"form-control\",\"name\":\"text-1762150137191-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"text\",\"required\":false,\"label\":\"City Name\",\"className\":\"form-control\",\"name\":\"text-1762150164059-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"number\",\"required\":false,\"label\":\"Postal / Zip Code\",\"className\":\"form-control\",\"name\":\"number-1762150415295-0\",\"access\":false,\"subtype\":\"number\",\"min\":6,\"max\":6},{\"type\":\"number\",\"required\":false,\"label\":\"Enter your Mobile Number\",\"placeholder\":\"123456789\",\"className\":\"form-control\",\"name\":\"number-1762150180597-0\",\"access\":false,\"subtype\":\"number\",\"min\":10,\"max\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Enter Your Email\",\"placeholder\":\"yourname@gmail.com\",\"className\":\"form-control\",\"name\":\"text-1762150265874-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"select\",\"required\":false,\"label\":\"Service Type\",\"className\":\"form-control\",\"name\":\"select-1774431362751-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Dine-in\",\"value\":\"Dine-in\",\"selected\":true},{\"label\":\"Catering\",\"value\":\"Catering\",\"selected\":false},{\"label\":\"Home Delivery\",\"value\":\"Home Delivery\",\"selected\":false}]},{\"type\":\"select\",\"required\":false,\"label\":\"Cuisine Preference\",\"className\":\"form-control\",\"name\":\"select-1774431412095-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Indian\",\"value\":\"Indian\",\"selected\":true},{\"label\":\"Chinese\",\"value\":\"Chinese\",\"selected\":false},{\"label\":\"Italian\",\"value\":\"Italian\",\"selected\":false},{\"label\":\"Continetal\",\"value\":\"Continental\",\"selected\":false}]}]', '2025-11-03 06:18:44', '2026-03-25 09:38:04'),
(11, 1, 'it-services', '[{\"type\":\"text\",\"required\":false,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1774423012800-0\",\"access\":false,\"value\":\"Name Here\",\"subtype\":\"text\"},{\"type\":\"text\",\"required\":false,\"label\":\"Mobile No.\",\"className\":\"form-control\",\"name\":\"text-1774423021882-0\",\"access\":false,\"value\":\"Mobile No.\",\"subtype\":\"text\"},{\"type\":\"text\",\"required\":false,\"label\":\"Email id\",\"className\":\"form-control\",\"name\":\"text-1774423041816-0\",\"access\":false,\"value\":\"Email id\",\"subtype\":\"text\"},{\"type\":\"text\",\"required\":false,\"label\":\"Your Location\",\"className\":\"form-control\",\"name\":\"text-1774423050816-0\",\"access\":false,\"value\":\"Location\",\"subtype\":\"text\"},{\"type\":\"textarea\",\"required\":false,\"label\":\"Service Required\",\"className\":\"form-control\",\"name\":\"textarea-1774423086299-0\",\"access\":false,\"value\":\"Service you are Looking for\",\"subtype\":\"textarea\",\"maxlength\":50},{\"type\":\"select\",\"required\":false,\"label\":\"Best Time to Call\",\"className\":\"form-control\",\"name\":\"select-1774423161953-0\",\"access\":false,\"multiple\":true,\"values\":[{\"label\":\"Morning\",\"value\":\"10AM-12PM\",\"selected\":true},{\"label\":\"Afternoon\",\"value\":\"12PM-4PM\",\"selected\":false},{\"label\":\"Evening \",\"value\":\"4PM-8PM\",\"selected\":false}]},{\"type\":\"textarea\",\"required\":false,\"label\":\"Any Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1774423273539-0\",\"access\":false,\"value\":\"Particular Remarks\",\"subtype\":\"textarea\"}]', '2026-03-25 07:20:47', '2026-05-05 10:04:25'),
(12, 1, 'grooming', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1774431631217-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":20},{\"type\":\"text\",\"required\":true,\"label\":\"Mobile No.\",\"className\":\"form-control\",\"name\":\"text-1774431633716-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774431666194-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"date\",\"required\":false,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774431684772-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":false,\"label\":\"Service Type\",\"className\":\"form-control\",\"name\":\"select-1774438592319-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Haircut\",\"value\":\"Haircut\",\"selected\":true},{\"label\":\"Beard\",\"value\":\"Beard\",\"selected\":false},{\"label\":\"Facial\",\"value\":\"Facial\",\"selected\":false}]},{\"type\":\"textarea\",\"required\":false,\"label\":\"Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1774438570164-0\",\"access\":false,\"subtype\":\"textarea\",\"maxlength\":50}]', '2026-03-25 11:37:52', '2026-03-25 11:38:09'),
(13, 1, 'manufacturing', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1774438719022-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"number\",\"required\":true,\"label\":\"Mobile Number\",\"className\":\"form-control\",\"name\":\"number-1774438752337-0\",\"access\":false,\"subtype\":\"number\",\"max\":11},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774438737059-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":35},{\"type\":\"date\",\"required\":true,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774438773509-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":false,\"label\":\"Requirement Type\",\"className\":\"form-control\",\"name\":\"select-1774438802341-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Bulk Production\",\"value\":\"Bulk Production\",\"selected\":true},{\"label\":\"Custom Manufacturing\",\"value\":\"Custom Manufacturing\",\"selected\":false},{\"label\":\"Prototype\",\"value\":\"Prototype\",\"selected\":false}]},{\"type\":\"textarea\",\"required\":false,\"label\":\"Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1774438889314-0\",\"access\":false,\"subtype\":\"textarea\"}]', '2026-03-25 11:41:38', '2026-03-25 11:41:38'),
(14, 1, 'trading', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"placeholder\":\"John Doe\",\"className\":\"form-control\",\"name\":\"text-1774438928689-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"number\",\"required\":true,\"label\":\"Mobile Number\",\"placeholder\":\"Mobile Number\",\"className\":\"form-control\",\"name\":\"number-1774438940128-0\",\"access\":false,\"subtype\":\"number\",\"max\":8},{\"type\":\"text\",\"required\":true,\"label\":\"Email\",\"placeholder\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774438956035-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"date\",\"required\":true,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774438985766-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":false,\"label\":\"Trading Type\",\"className\":\"form-control\",\"name\":\"select-1774439005470-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Wholesale\",\"value\":\"Wholesale\",\"selected\":true},{\"label\":\"Retail\",\"value\":\"Retail\",\"selected\":false},{\"label\":\"Distribution\",\"value\":\"Distribution\",\"selected\":false}]},{\"type\":\"select\",\"required\":false,\"label\":\"Order Volume\",\"placeholder\":\"Order Volume\",\"className\":\"form-control\",\"name\":\"select-1774439058361-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Small\",\"value\":\"Small\",\"selected\":true},{\"label\":\"Medium\",\"value\":\"Medium\",\"selected\":false},{\"label\":\"Bulk\",\"value\":\"Bulk\",\"selected\":false}]}]', '2026-03-25 11:45:10', '2026-03-25 11:45:10'),
(15, 1, 'recreation', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1774439749073-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"number\",\"required\":true,\"label\":\"Phone Number\",\"className\":\"form-control\",\"name\":\"number-1774439763382-0\",\"access\":false,\"subtype\":\"number\",\"max\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"placeholder\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774439784008-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"date\",\"required\":true,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774439816424-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":false,\"label\":\"Activity Tyoe\",\"className\":\"form-control\",\"name\":\"select-1774439836450-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Gaming\",\"value\":\"Gaming\",\"selected\":true},{\"label\":\"Adventure\",\"value\":\"Adventure\",\"selected\":false},{\"label\":\"Sports\",\"value\":\"Sports\",\"selected\":false},{\"label\":\"Indoor\",\"value\":\"Indoor\",\"selected\":false}]},{\"type\":\"select\",\"required\":true,\"label\":\"Group Size\",\"className\":\"form-control\",\"name\":\"select-1774439881848-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"1-2\",\"value\":\"1-2\",\"selected\":true},{\"label\":\"2-5\",\"value\":\"2-5\",\"selected\":false},{\"label\":\"6-10\",\"value\":\"6-10\",\"selected\":false},{\"label\":\"10+\",\"value\":\"10+\",\"selected\":false}]}]', '2026-03-25 11:58:58', '2026-03-25 11:58:58'),
(16, 1, 'corporate-gifting-and-printing-services', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"placeholder\":\"John Doe\",\"className\":\"form-control\",\"name\":\"text-1774440159347-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"number\",\"required\":true,\"label\":\"Phone Number\",\"className\":\"form-control\",\"name\":\"number-1774440178281-0\",\"access\":false,\"subtype\":\"number\",\"max\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"placeholder\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774440176098-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"date\",\"required\":false,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774440210906-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":false,\"label\":\"Service Type\",\"className\":\"form-control\",\"name\":\"select-1774440229447-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Corporate Gifts\",\"value\":\"Corporate Gifts\",\"selected\":true},{\"label\":\"Printing Services\",\"value\":\"Printing Services\",\"selected\":false}]},{\"type\":\"select\",\"required\":false,\"label\":\"Quantity Required\",\"className\":\"form-control\",\"name\":\"select-1774440275304-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"50-100\",\"value\":\"50-100\",\"selected\":true},{\"label\":\"100-500\",\"value\":\"100-500\",\"selected\":false},{\"label\":\"500+\",\"value\":\"500+\",\"selected\":false}]}]', '2026-03-25 12:05:24', '2026-03-25 12:05:24'),
(17, 1, 'industrial', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1774440341290-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"number\",\"required\":true,\"label\":\"Phone Number\",\"className\":\"form-control\",\"name\":\"number-1774440363956-0\",\"access\":false,\"subtype\":\"number\",\"max\":10},{\"type\":\"date\",\"required\":false,\"label\":\"Preferred Date&nbsp;\",\"className\":\"form-control\",\"name\":\"date-1774440523030-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":false,\"label\":\"Requirement Type\",\"className\":\"form-control\",\"name\":\"select-1774440544299-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Machinery\",\"value\":\"Machinery\",\"selected\":true},{\"label\":\"Equipment\",\"value\":\"Equipment\",\"selected\":false},{\"label\":\"Maintenance\",\"value\":\"Maintenance\",\"selected\":false}]},{\"type\":\"textarea\",\"required\":false,\"label\":\"Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1774440598527-0\",\"access\":false,\"subtype\":\"textarea\"}]', '2026-03-25 12:10:13', '2026-03-25 12:10:13'),
(18, 1, 'agencies', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"placeholder\":\"John Doe\",\"className\":\"form-control\",\"name\":\"text-1774590909095-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"number\",\"required\":true,\"label\":\"Phone Number\",\"className\":\"form-control\",\"name\":\"number-1774590925648-0\",\"access\":false,\"subtype\":\"number\",\"max\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774590944240-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"date\",\"required\":true,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774590970063-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":false,\"label\":\"Service Type\",\"className\":\"form-control\",\"name\":\"select-1774590988978-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Marketing\",\"value\":\"Marketing\",\"selected\":true},{\"label\":\"Advertising\",\"value\":\"Advertising\",\"selected\":false},{\"label\":\"Digital\",\"value\":\"Digital\",\"selected\":false}]}]', '2026-03-27 05:57:19', '2026-03-27 05:57:19'),
(19, 1, 'popular-services', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name&nbsp;\",\"className\":\"form-control\",\"name\":\"text-1774591054667-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":23},{\"type\":\"number\",\"required\":true,\"label\":\"Phone Number&nbsp;\",\"className\":\"form-control\",\"name\":\"number-1774591069330-0\",\"access\":false,\"subtype\":\"number\",\"max\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774591091710-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"date\",\"required\":false,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774591111683-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"textarea\",\"required\":false,\"label\":\"Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1774591129382-0\",\"access\":false,\"subtype\":\"textarea\",\"maxlength\":50}]', '2026-03-27 05:59:07', '2026-03-27 05:59:07'),
(20, 1, 'healthcare-services', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1774611795662-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"number\",\"required\":true,\"label\":\"Phone Number\",\"className\":\"form-control\",\"name\":\"number-1774611815853-0\",\"access\":false,\"subtype\":\"number\",\"max\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774611833921-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"date\",\"required\":true,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774611846461-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"textarea\",\"required\":false,\"label\":\"Remarks\",\"className\":\"form-control\",\"name\":\"textarea-1774611866689-0\",\"access\":false,\"subtype\":\"textarea\",\"maxlength\":50}]', '2026-03-27 11:44:43', '2026-03-27 11:44:43'),
(21, 1, 'travel-tourism', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"className\":\"form-control\",\"name\":\"text-1774611906896-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"number\",\"required\":true,\"label\":\"Phone Number\",\"className\":\"form-control\",\"name\":\"number-1774611926923-0\",\"access\":false,\"subtype\":\"number\",\"max\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774611945074-0\",\"access\":false,\"subtype\":\"text\"},{\"type\":\"date\",\"required\":true,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774611958993-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":true,\"label\":\"Package Type\",\"className\":\"form-control\",\"name\":\"select-1774611983277-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Solo\",\"value\":\"Solo\",\"selected\":true},{\"label\":\"Couple\",\"value\":\"Couple\",\"selected\":false},{\"label\":\"Family\",\"value\":\"Family\",\"selected\":false},{\"label\":\"Group\",\"value\":\"Group\",\"selected\":false}]}]', '2026-03-27 11:47:08', '2026-03-27 11:47:08'),
(22, 1, 'business-services', '[{\"type\":\"text\",\"required\":true,\"label\":\"Your Name\",\"placeholder\":\"John Doe\",\"className\":\"form-control\",\"name\":\"text-1774612045905-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":25},{\"type\":\"number\",\"required\":true,\"label\":\"Phone Number\",\"className\":\"form-control\",\"name\":\"number-1774612062444-0\",\"access\":false,\"subtype\":\"number\",\"max\":10},{\"type\":\"text\",\"required\":false,\"label\":\"Email\",\"className\":\"form-control\",\"name\":\"text-1774612060277-0\",\"access\":false,\"subtype\":\"text\",\"maxlength\":30},{\"type\":\"date\",\"required\":true,\"label\":\"Preferred Date\",\"className\":\"form-control\",\"name\":\"date-1774612092819-0\",\"access\":false,\"subtype\":\"date\"},{\"type\":\"select\",\"required\":false,\"label\":\"Business Size\",\"className\":\"form-control\",\"name\":\"select-1774612113129-0\",\"access\":false,\"multiple\":false,\"values\":[{\"label\":\"Startup\",\"value\":\"Startup\",\"selected\":true},{\"label\":\"SME\",\"value\":\"SME\",\"selected\":false},{\"label\":\"Enterprises\",\"value\":\"Enterprises\",\"selected\":false}]}]', '2026-03-27 11:49:15', '2026-03-27 11:49:15');

-- --------------------------------------------------------

--
-- Table structure for table `frontend_settings`
--

CREATE TABLE `frontend_settings` (
  `id` bigint UNSIGNED NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontend_settings`
--

INSERT INTO `frontend_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'map_position', 'top', '2024-07-16 04:41:17', '2026-05-11 07:46:15'),
(2, 'mother_homepage_banner', '[{\"id\":2,\"title\":\"List your Hotel, Motel, Restaurant and Cafe.\",\"description\":\"Put your Hotel, Motel, Restaurant, caf\\u00e9 on the map\\u2014our listings help food lovers discover and reach you in just a few clicks.\",\"image\":\"1730781682_6729a1f2cb312.webp\"},{\"id\":3,\"title\":\"Compassionate Healthcare You Can Trust\",\"description\":\"On the top advertising a Courses available business to online includes assembling  site on top advertising Courses includes\",\"image\":\"1730781703_6729a207eaf8e.webp\"},{\"id\":4,\"title\":\"Top Cars. Trusted Dealers. Premium Spares\",\"description\":\"Whether you\'re buying, upgrading, or maintaining\\u2014our Car Listings connect you with the best dealers, spares, and more.\",\"image\":\"1730781727_6729a21fe80ce.webp\"},{\"id\":5,\"title\":\"List your property and Get discovered to Connect instantly.\",\"description\":\"Our Real Estate Category Listings empower property owners to showcase their listings with ease, enabling customers to connect directly and effortlessly.\",\"image\":\"1730781745_6729a231c6aba.webp\"}]', '2024-07-16 04:41:17', '2025-08-19 07:06:06'),
(3, 'light_logo', '1756207443_listify_png_logo-removebg-preview.png', '2024-07-16 04:41:17', '2025-08-26 11:24:03'),
(4, 'favicon_logo', '1782379313_new one logo .png', '2024-07-16 04:41:17', '2026-06-25 09:21:53'),
(5, 'dark_logo', '1756119489_listify_white_logo-removebg-preview.png', '2024-07-16 04:41:17', '2025-08-25 10:58:09'),
(6, 'hotel', '1730786984_mh-category-banner1.webp', '2024-07-16 04:41:17', '2024-11-05 00:09:44'),
(7, 'doctors', '1730788214_mh-category-banner4.webp', '2024-07-16 04:41:17', '2024-11-05 00:30:14'),
(8, 'car', '1735639516_at-blog-banner2.webp', '2024-07-16 04:41:17', '2024-12-31 04:05:16'),
(9, 'beauty', '1730788243_mh-category-banner6.webp', '2024-07-16 04:41:17', '2024-11-05 00:30:43'),
(10, 'real_estate', '1730788041_mh-category-banner5.webp', '2024-07-16 04:41:17', '2024-11-05 00:27:21'),
(11, 'restaurent', '1730787972_mh-category-banner2.webp', '2024-07-16 04:41:17', '2024-11-05 00:26:12'),
(12, 'company_images', '[{\"id\":2,\"image\":\"1730792894_6729cdbec33e3.svg\"},{\"id\":3,\"image\":\"1730792906_6729cdcabbd6c.svg\"},{\"id\":4,\"image\":\"1730792918_6729cdd6675fb.svg\"},{\"id\":5,\"image\":\"1730792928_6729cde093d49.svg\"},{\"id\":6,\"image\":\"1730792937_6729cde981ba1.svg\"},{\"id\":7,\"image\":\"1730792947_6729cdf31cbc8.svg\"}]', '2024-07-16 04:41:17', '2025-08-06 08:55:44'),
(13, 'menu', '[\"Real-Estate\",\"Hotel\",\"Beauty\",\"Restaurant\",\"Car\"]', '2024-07-16 04:41:17', '2024-12-26 05:49:34'),
(14, 'website_faqs', '{\"0\":{\"question\":\"What is Listify.asia?\",\"answer\":\"Listify.asia is a business listing portal that helps companies, professionals, and service providers showcase their offerings, improve online visibility, and connect with potential customers across Asia.\"},\"1\":{\"question\":\"Who can list their business on Listify.asia?\",\"answer\":\"Any business\\u2014whether a startup, SME, or large enterprise\\u2014can create a listing. We welcome service providers, retailers, manufacturers, consultants, and more from diverse industries.\"},\"3\":{\"question\":\"Is there a cost to list my business?\",\"answer\":\"We offer both free and premium listing options. Free listings provide basic visibility, while premium plans offer enhanced features like priority placement, multimedia uploads, and analytics.\"},\"4\":{\"question\":\"How do I create a listing on Listify.asia?\",\"answer\":\"Simply sign up, choose your listing category, fill in your business details, and submit. Our intuitive dashboard makes it easy to manage and update your profile anytime.\"},\"5\":{\"question\":\"Can I edit my listing after it\'s published?\",\"answer\":\"Yes, you can log in to your account and update your business information, images, contact details, and more at any time.\"},\"6\":{\"question\":\"How does Listify.asia help improve my business visibility?\",\"answer\":\"We optimize listings for search engines, offer smart categorization, and provide tools to help your business stand out\\u2014making it easier for customers to find and engage with you.\"},\"7\":{\"question\":\"Is Listify.asia available in multiple languages or regions?\",\"answer\":\"Currently, we focus on listings across Asia, with support for English. Regional expansion and multilingual support are part of our roadmap.\"},\"8\":{\"question\":\"Can I track how many people view my listing?\",\"answer\":\"Yes, premium users have access to analytics that show views, clicks, and engagement metrics to help you measure performance.\"},\"9\":{\"question\":\"Is my business data secure on Listify.asia?\",\"answer\":\"Absolutely. We follow strict data protection protocols and are backed by the technical expertise of our parent company, Corp Marvel Infotech, ensuring your information is safe and confidential.\"},\"10\":{\"question\":\"How can I contact support if I need help?\",\"answer\":\"You can reach our support team via the Contact Us page or email us at [support@listify.asia]. We\\u2019re here to assist with onboarding, troubleshooting, and optimisation.\"}}', '2024-07-16 04:41:17', '2025-08-06 09:01:14'),
(15, 'about_us', '<p><b>Listify.asia</b> is your gateway to visibility in the digital age. Founded by <strong>Punita Rajpal</strong> and headquartered in <strong>Sonipat, Haryana</strong>, we are a dynamic platform designed to help businesses, professionals, and service providers get seen, get listed, and get ahead.</p><p><br></p><p>As a proud venture of <b>Punita Rajpal </b>the Listify.asia  combines cutting-edge technology with strategic insight to deliver a seamless listing experience. Whether you\'re a local entrepreneur or a global brand, our platform empowers you to showcase your offerings, connect with your audience, and grow your presence across Asia and beyond.</p><p>We believe that discoverability is the first step toward opportunity. That’s why we’ve built Listify.asia  to be intuitive, inclusive, and impactful—making it easier than ever to list your business, enhance your visibility, and unlock new growth.</p><p><br></p><ul><li><strong>What We Offer</strong></li><li>A user-friendly platform for business listings and service discovery</li><li>Smart categorization and search features for better reach</li><li>Scalable solutions for startups, SMEs, and enterprises</li></ul><ul><li><p>Backed by the tech expertise of Listify.asia</p></li></ul><p><br></p><p>At Listify.asia, we don’t just list businesses—we amplify them to Get Seen. Get Listed. Get Ahead</p><p></p>', '2024-07-16 04:41:17', '2026-05-11 07:46:15'),
(16, 'terms_and_condition', '<div><p style=\"background-color:transparent;\"><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"><span>For the purpose of</span><span> these Terms and Conditions, </span><span>The</span><span> term \"we\", \"us\", \"our\" used anywhere on this page shall mean </span><span style=\"background-color:rgb(220,233,248);\">Listify.asia</span><span>, whose registered/operational office is RODEO DRIVE MALL, SONIPAT 131023 Nangal Kalan BO HARYANA </span><span>131023 .</span><span> \"you\", “your</span><span>”,</span><span> \"user\", “visitor” shall mean any natural or legal person who is visiting our website and/or agreed to </span><span>purchase</span><span> from us. </span></span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p style=\"background-color:transparent;\"><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;font-weight:bold;\">Your use of the website and/or purchase from us are governed by following Terms and Conditions:</span><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p style=\"background-color:transparent;\"><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"><span></span></span><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></div><div><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;font-weight:bold;\">The content of the pages of this website is subject to change without notice.</span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></div><div><p style=\"background-color:transparent;\"><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></div><div><ul><li><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"><span>Neither we nor any third parties provide any warranty or guarantee as to the accuracy, timeliness, performance, completeness or suitability of the information and materials found or offered on this website for any particular purpose. You acknowledge that such information and materials may </span><span>contain</span><span> inaccuracies or errors, and we expressly fully exclude liability for any such inaccuracies or errors </span><span>permitted</span><span> by law. </span></span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></li></ul></div><div><ul><li><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"><span>Your use of any information or materials on our website and/or product pages is entirely at your own risk, for which we shall not be liable. It shall be your own responsibility to ensure that any products, </span><span>services</span><span> or information available through our website and/or product pages meet your specific requirements. </span></span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></li></ul></div><div><ul><li><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"><span>Our website </span><span>contains</span><span> material which is owned by or licensed to us. This material includes, but are not limited to, the design, layout, look, </span><span>appearance</span><span> and graphics. Reproduction is prohibited other than </span><span>in accordance with</span><span> the copyright notice, which forms part of these terms and conditions. </span></span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></li></ul></div><div><ul><li><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\">All trademarks reproduced in our website which are not the property of, or licensed to, the operator are acknowledged on the website. </span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></li></ul></div><div><ul><li><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\">Unauthorized use of information provided by us shall give rise to a claim for damages and/or be a criminal offense. </span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></li></ul></div><div><ul><li><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\">From time to time our website may also include links to other websites. These links are provided for your convenience to provide further information. </span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></li></ul></div><div><ul><li><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"><span>You may not create a link to our website from another website or document without </span><span style=\"background-color:rgb(220,233,248);\">Listify.asia</span><span>’s</span><span> prior written consent. </span></span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></li></ul></div><div><ul><li><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\">Any dispute arising out of use of our website and/or purchase with us and/or any engagement with us is subject to the laws of India. </span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></li></ul></div><div><p style=\"background-color:transparent;\"><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\">We, shall be under no liability whatsoever in respect of any loss or damage arising directly or indirectly out of the decline of authorization for any Transaction, on Account of the Cardholder having exceeded the preset limit mutually agreed by us with our acquiring bank from time to time </span><span style=\"font-size:10.5pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></div><div><p style=\"background-color:transparent;\"><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"><span></span></span><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></div><div><p style=\"background-color:transparent;\"><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"><span></span></span><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></div>', '2024-07-16 04:41:17', '2026-05-11 07:46:15'),
(17, 'privacy_policy', '<div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>This privacy policy sets out how </span><span style=\"background-color:rgb(220,233,248);\">Listify.asia</span><span> uses and protects any information that you give </span><span style=\"background-color:rgb(220,233,248);\">Listify.asia</span><span> when you visit their website and/or agree to </span><span>purchase</span><span> from them. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span style=\"background-color:rgb(220,233,248);\">Listify.asia</span><span> is committed to ensuring that your privacy is protected. Should we ask you to provide certain information by which you can be </span><span>identified</span><span> when using this website, and then you can be assured that it will only be used </span><span>in accordance with</span><span> this privacy statement. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span style=\"background-color:rgb(220,233,248);\">Listify.asia</span><span> may change this policy from time to time by updating this page. You should check this page from time to time to ensure that you adhere to these changes. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;font-weight:bold;\">We may collect the following information:</span><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"> </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">Name </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">Contact information including email address </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>Demographic information such as postcode, </span><span>preferences</span><span> and interests, if </span><span>required</span><span> </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">Other information relevant to customer surveys and/or offers </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"> </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;font-weight:bold;\">What we do with the information we gather</span><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"> </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span></span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">We require this information to understand your needs and provide you with a better service, and for the following reasons: </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">Internal record keeping. </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">We may use the information to improve our products and services. </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>We may periodically send promotional emails about new products, </span><span>special offers</span><span> or other information which we think you may find interesting using the email address which you have provided. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>From time to time, we may also use your information to contact you for market research purposes. We may contact you by email, phone, </span><span>fax</span><span> or mail. We may use the information to customise the website according to your interests. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>We are committed to ensuring that your information is secure. </span><span>In order to</span><span> prevent unauthorised access or disclosure we have put in suitable measures. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span></span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;font-weight:bold;\"><span>How we use cookies</span><span> </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">A cookie is a small file which asks permission to be placed on your computer\'s hard drive. Once you agree, the file is added, and the cookie helps analysed web traffic or lets you know when you visit a particular site. Cookies allow web applications to respond to you as an individual. The web application can tailor its operations to your needs, likes and dislikes by gathering and remembering information about your preferences. </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>We use traffic log cookies to </span><span>identify</span><span> which pages are being used. This helps us </span><span>analyze</span><span> data about webpage traffic and improve our website to tailor it to customer needs. We only use this information for statistical analysis purposes and then the data is removed from the system. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>Overall, cookies help us provide you with a better website, by enabling us to </span><span>monitor</span><span> which pages you find useful and which you do not. A cookie in no way gives us access to your computer or any information about you, other than the data you choose to share with us. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>You can choose to accept or decline cookies. Most web browsers automatically accept cookies, but you can usually </span><span>modify</span><span> your browser setting to decline cookies if you prefer. This may prevent you from taking full advantage of the website. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;font-weight:bold;\">Controlling your personal information</span><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"> </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">You may choose to restrict the collection or use of your personal information in the following ways: </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>whenever you are asked to fill in a form on the website, look for the box that you can click to </span><span>indicate</span><span> that you do not want the information to be used by anybody for direct marketing purposes </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">if you have previously agreed to us using your personal information for direct marketing purposes, you may change your mind at any time by writing to or emailing us at </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\"><span>We will not sell, </span><span>distribute</span><span> or lease your personal information to third parties unless we have your permission or are required by law to do so. We may use your personal information to send you promotional information about third parties which we think you may find interesting if you tell us that you wish this to happen. </span></span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"color:rgb(81,89,120);font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;\">If you believe that any information we are holding on you is incorrect or incomplete, please write to RODEO DRIVE MALL, SONIPAT 131023 Nangal Kalan BO HARYANA 131023. or contact us at or as soon as possible. We will promptly correct any information found to be incorrect. </span><span style=\"font-size:10.5pt;font-family:Lato, \'Lato_EmbeddedFont\', \'Lato_MSFontService\', sans-serif;color:rgb(81,89,120);\"> </span></p></div><div><p><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"><span></span></span><span style=\"font-size:12pt;font-family:Aptos, \'Aptos_EmbeddedFont\', \'Aptos_MSFontService\', sans-serif;\"> </span></p></div></div><p></p>', '2024-07-16 04:41:17', '2026-05-11 07:46:15'),
(18, 'refund_policy', '<div><p>If a refund is approved, the refunded amount will be credited to the customer’s account within 5–7 business days.</p></div><p></p>', '2024-07-16 04:41:17', '2026-05-11 07:46:15');

-- --------------------------------------------------------

--
-- Table structure for table `home_page_settings`
--

CREATE TABLE `home_page_settings` (
  `id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `home_page_settings`
--

INSERT INTO `home_page_settings` (`id`, `type`, `key`, `value`, `created_at`, `updated_at`) VALUES
(9, 'BeautyFacial', 'BeautyFacial', '{\"title\":\"Exclusive Facial Deals\",\"description\":\"20% OFF\",\"image\":\"1731153406_bt-banner-card-bg1.webp\"}', '2024-11-09 05:56:46', '2024-11-09 06:05:57'),
(10, 'BeautyMassage', 'BeautyMassage', '{\"title\":\"Relax & Save\",\"description\":\"30% Off All PARLOUR\",\"image\":\"1731154110_bt-banner-card-bg2.webp\"}', '2024-11-09 06:08:30', '2024-11-09 06:10:05'),
(11, 'BeautyMotion', 'BeautyMotion', '{\"title\":\"Book Your Visit Online\",\"description\":\"SAVE UP TO 30 % OFF\",\"image\":\"1731155250_bt-discount-banner.webp\"}', '2024-11-09 06:27:30', '2024-11-10 06:04:29'),
(12, 'BeautyBanner', 'BeautyBanner', '{\"title\":\"The Power Of Healthy Skin\",\"description\":\"On the top advertising a Courses available business online includes assembling site on top advertising.\",\"video_url\":\"\",\"image\":\"1731159740_beauty-hero-banner.webp\"}', '2024-11-09 07:42:20', '2024-12-26 04:54:29'),
(13, 'CarBanner', 'CarBanner', '{\"title\":\"FIND YOUR CAR\",\"description\":\"On the top advertising a Courses available business to online includes assembling site on top advertising Courses includes .\",\"image\":\"1733034680_car-hero-car.webp\"}', '2024-12-01 00:31:20', '2024-12-01 00:31:20'),
(14, 'CarMotion', 'CarMotion', '{\"title\":\"EXCLUSIVE CARS FOR SELL\",\"description\":\"UP TO 30% OFF\",\"image\":\"1733035325_car-discount-banner.webp\"}', '2024-12-01 00:42:05', '2024-12-01 00:42:05'),
(15, 'HotelBanner', 'HotelBanner', '{\"title\":\"Stay with us feel like home\",\"description\":\"Awesome site. on the top advertising a Courses available business online includes assembling site on the advertising.\",\"video_url\":\"\",\"image\":\"1733381111_hotel-hero-banner.svg\"}', '2024-12-05 00:45:11', '2024-12-05 00:47:34'),
(16, 'HotelBooking', 'HotelBooking', '{\"title\":\"Book a room today\",\"image\":\"1733382195_book-room-banner.webp\"}', '2024-12-05 01:03:15', '2024-12-05 01:03:15'),
(17, 'HotelExclusive', 'HotelExclusive', '{\"title\":\"Exclusive Hotel Deals\",\"description\":\"Just For You -70%\",\"image\":\"1733383432_bg-card-banner1.webp\"}', '2024-12-05 01:23:52', '2024-12-05 01:24:42'),
(18, 'HotelSize', 'HotelSize', '{\"title\":\"Size the moment\",\"description\":\"Save 15% or more when you book and stay before 1 October 2024\",\"image\":\"1733383510_bg-card-banner2.webp\"}', '2024-12-05 01:25:10', '2024-12-05 01:25:10'),
(19, 'RealEstateBanner', 'RealEstateBanner', '{\"title\":\"Modern Living For Everyone\",\"description\":\"On the top advertising a Courses available business to online includes assembling site on top advertising includes .\",\"image\":\"1733810127_real-estate-banner.webp\"}', '2024-12-09 23:52:41', '2024-12-09 23:55:27'),
(20, 'RealEstateDiscount', 'RealEstateDiscount', '{\"title\":\"Save Up To 30%\",\"description\":\"Offer Ends On 24 June, 2024\",\"image\":\"1733810717_re-discount-banner.webp\"}', '2024-12-10 00:05:17', '2024-12-10 00:05:17'),
(21, 'RestaurantBanner', 'RestaurantBanner', '{\"title\":\"Be The Fastest In Delivering Your Food\",\"description\":\"Awesome site. on the top advertising a Courses available business online includes assembling site on the site on the top advertising\",\"image1\":\"1734850174_1_restaurant-banner-shape1.webp\",\"image2\":\"1734850164_2_restaurant-banner-shape2.webp\"}', '2024-12-22 00:49:24', '2024-12-22 00:49:34'),
(22, 'RestaurantExclusive', 'RestaurantExclusive', '{\"title\":\"Exclusive Restaurant Deals\",\"description\":\"Just For You -70%\",\"image\":\"1734850976_rt-deal-bg.webp\"}', '2024-12-22 01:02:29', '2024-12-22 01:02:56'),
(23, 'RestaurantDiscount', 'RestaurantDiscount', '{\"title\":\"Get up to\",\"description\":\"20% OFF\",\"image\":\"1734852834_dark-card-img.svg\"}', '2024-12-22 01:33:54', '2024-12-22 01:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `hotels`
--

CREATE TABLE `hotels` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hotel_listings`
--

CREATE TABLE `hotel_listings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `room` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double DEFAULT NULL,
  `discount_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country` bigint NOT NULL,
  `city` bigint NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dimension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_base_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listing_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_hours` json DEFAULT NULL,
  `data_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `is_popular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hotel_listings`
--

INSERT INTO `hotel_listings` (`id`, `title`, `room`, `bed`, `bath`, `size`, `price`, `discount_price`, `visibility`, `feature`, `image`, `category`, `description`, `meta_title`, `meta_keyword`, `meta_description`, `og_title`, `og_description`, `canonical_url`, `json_id`, `country`, `city`, `area`, `address`, `postal_code`, `Latitude`, `Longitude`, `dimension`, `user_id`, `type`, `img_base_url`, `listing_type`, `opening_hours`, `data_type`, `is_popular`, `status`, `created_at`, `updated_at`) VALUES
(23, 'Abhishek hotel', NULL, '4', '4', '200', 2000, NULL, 'visible', NULL, '[\"1-1783662063.png\"]', '21', 'lorem ipsum', 'Abhishek hotel', 'listing', 'lorem ipsum', 'Abhishek hotel', 'lorem ipsum', 'https://example.com', '123', 98, 1, '98:@:1:@:Rohini sec-24', 'Rohini sec-24', '110086', '123456', '123456', '500', 33, 'hotel', NULL, NULL, NULL, 'app', '1', NULL, '2026-07-10 05:41:03', '2026-07-10 05:43:19');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint UNSIGNED NOT NULL,
  `listing_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discount_price` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale_price` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `additional_info` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `availability` int DEFAULT NULL,
  `icon_data` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `listing_id`, `category_id`, `type`, `name`, `price`, `discount_price`, `sale_price`, `description`, `additional_info`, `availability`, `icon_data`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'hotel', 'Hotel Soap', '300', '', NULL, 'test', NULL, 1, NULL, '1755166908.png', '2025-08-14 10:21:48', '2025-08-14 10:21:48'),
(2, 4, 2, 'hotel', 'SEO', '100', '', NULL, 'lorem ispum lorem ipsum', NULL, 1, NULL, '1755847529.jpg', '2025-08-22 07:25:29', '2025-08-22 07:25:29'),
(3, 4, 2, 'hotel', 'SEO', '100', '', NULL, 'lorem ispm', NULL, 1, NULL, '1755847658.jpg', '2025-08-22 07:27:38', '2025-08-22 07:27:38'),
(4, 5, 4, 'hotel', '0909090', '12345', '', NULL, 'ncdkqsmndksmvkcj sdhjfv kdafmjdef ahdnef vdjeq', NULL, 1, NULL, '1755847893.png', '2025-08-22 07:31:33', '2025-08-22 07:31:33'),
(5, 6, 5, 'agencies', 'My Agency Shop', '300', '', NULL, 'lorem ipsum', NULL, 1, NULL, '1756102480.jpg', '2025-08-25 06:14:40', '2025-08-25 06:14:40'),
(6, 3, 6, 'hotel', 'Listify Agency', '100', '', NULL, 'lorem ipsum', NULL, 1, NULL, '1756103736.jpg', '2025-08-25 06:35:36', '2025-08-25 06:35:36'),
(7, 3, 7, 'hotel', 'Banner', '2', '', NULL, 'Test banner Product', NULL, 1, NULL, '1756116556.png', '2025-08-25 10:09:16', '2025-08-25 10:09:16'),
(12, 8, 17, 'automobiles', 'Abhishek Tata Showroom', '500', '5', '475', 'lorem ipsum', NULL, 1, NULL, '1756361939.png', '2025-08-28 06:18:59', '2025-08-28 10:05:23'),
(13, 3, 18, 'agencies', 'Bus Advertising', '1000', '10', '900', 'Get Advertising on Buses Back', NULL, 1, NULL, '1756368299.webp', '2025-08-28 08:04:59', '2025-08-30 10:59:10'),
(14, 8, 17, 'automobiles', 'Abhishek automobile discount Testing', '1000', '10', '900', 'lorem ipsum', NULL, 1, NULL, '1756375681.png', '2025-08-28 10:08:01', '2025-08-28 10:08:01'),
(15, 5, 19, 'automobiles', 'Test Product 1', '100', '90', '10', 'This is a Test Product for testing purpose only', NULL, 1, NULL, '1756451033.png', '2025-08-29 07:03:53', '2025-08-29 07:03:53'),
(16, 4, 20, 'it-services', 'SEO Acnosoft', '1000', '10', '900', 'lorem ispum lorem ipsum', NULL, 1, NULL, '1756470400.jpg', '2025-08-29 12:26:40', '2025-08-29 12:26:40'),
(17, 8, 17, 'automobiles', 'Automobile testing product', '1000', '20', '800', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, NULL, '1757585849.jpg', '2025-09-11 10:17:29', '2025-09-11 10:17:29'),
(18, 8, 17, 'automobiles', 'Abhishek automobile icon testing', '800', '3', '776', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries,', 1, '[{\"icon\":\"fas fa-archive\",\"title\":\"10 days Returnable\"},{\"icon\":\"fas fa-bus\",\"title\":\"Free Delivery\"},{\"icon\":\"fas fa-trophy\",\"title\":\"Top Brand\"},{\"icon\":\"fas fa-lock\",\"title\":\"Secure transaction\"}]', '1757657685.png', '2025-09-12 06:14:45', '2025-09-12 06:37:28'),
(20, 2, 25, 'hotel', 'Hand Wash', '300', '10', '270', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 1, '[{\"icon\":\"fab fa-accessible-icon\",\"title\":\"yes\"},{\"icon\":\"fas fa-archive\",\"title\":\"yes\"}]', '1758361388.jpg', '2025-09-20 09:43:08', '2025-09-20 09:43:08'),
(21, 2, 25, 'hotel', 'Abhishek Cab Service', '800', '10', '720', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 1, '[{\"icon\":\"fab fa-accessible-icon\",\"title\":\"Pick And Drop\"}]', '1758361818.jpg', '2025-09-20 09:50:18', '2025-09-20 09:50:18'),
(22, 10, 26, 'agencies', 'Package Testing Agency product', '1000', '10', '900', 'Lorem ipsum', 'Lorem IPSUM', 1, '[{\"icon\":\"fab fa-accessible-icon\",\"title\":\"test\"},{\"icon\":\"fas fa-address-book\",\"title\":\"test\"}]', '1759752950.avif', '2025-10-06 12:15:50', '2025-10-06 12:15:50'),
(23, 11, 27, 'it-services', 'Software Development Consultancy', '5000', '0', '5000', 'We provide professional software consultancy to our clients at rate of Rs.5000/- per hour.', 'We provide expert IT consulting services to help businesses improve efficiency, security, and growth. Our solutions include cloud services, software development, and digital transformation, all tailored to meet your business needs.', 1, '[{\"icon\":\"fab fa-500px\",\"title\":\"Websites\"},{\"icon\":\"far fa-address-card\",\"title\":\"CRM\"},{\"icon\":\"fas fa-industry\",\"title\":\"ERP\"}]', '1774005401.jpg', '2026-03-20 11:16:41', '2026-03-20 11:16:41'),
(24, 12, 30, 'it-services', 'webiste', '10000', NULL, NULL, 'website', NULL, 1, NULL, '1774248690.png', '2026-03-23 06:51:30', '2026-03-23 06:51:30'),
(28, 40, 32, 'it-services', 'App development', '13000', NULL, NULL, 'Custom app development for Android & iOS to grow your business fast.', NULL, 1, NULL, '1778054261.png', '2026-05-06 07:57:41', '2026-05-06 07:57:41'),
(29, 3, 6, 'hotel', 'Updated Room Service update', '2000', '5', '1900', 'Updated premium service', 'Available 24/7', 1, '[{\"icon\":\"fab fa-500px\",\"title\":\"Free WiFi\"},{\"icon\":\"ac\",\"title\":\"Air Conditioning\"}]', '1780038259_4907.jpeg', '2026-05-29 06:49:22', '2026-05-29 07:04:19'),
(30, 41, 33, 'corporate-gifting-and-printing-services', 'wooden photo frame', '500', '12', '440', '✨ Durable wooden construction\r\n✨ Elegant and timeless design\r\n✨ Suitable for home and office décor\r\n✨ Ideal gift for friends and family', 'Showcase your cherished memories with this elegant wooden photo frame. Crafted from quality wood with a timeless design, it complements any home, office, or gifting occasion. Perfect for displaying family photos, artwork, certificates, or special moments while adding a warm and stylish touch to your space.', 1, '[{\"icon\":\"gift\",\"title\":\"gift\"}]', '1780041438.jpeg', '2026-05-29 07:57:18', '2026-05-29 10:46:46'),
(31, 20, 6, 'hotel', 'Updated Room Service update', '2000', '5', '1900', 'Updated premium service', 'Available 24/7', 1, '[{\"icon\":\"wifi\",\"title\":\"Free WiFi\"},{\"icon\":\"ac\",\"title\":\"Air Conditioning\"}]', '1780041460_8524.png', '2026-05-29 07:57:35', '2026-05-29 07:57:40'),
(33, 41, 34, 'corporate-gifting-and-printing-services', 'DIARY', '199', '10', '179.1', 'Premium diary for notes, planning, journaling, and daily organization.', '✨ Premium-quality pages\r\n✨ Durable and stylish cover\r\n✨ Perfect for notes, journaling, and planning\r\n✨ Ideal for students, professionals, and personal use\r\n✨ Great gift for any occasion', 1, '[{\"icon\":\"custom\",\"title\":\"custom\"}]', '1780052067.jpeg', '2026-05-29 10:54:27', '2026-07-02 09:26:09'),
(34, 18, 6, 'hotel', 'Premium Room 2BHK', '2000', '1800', '-34000', '2BHK Room', 'separate restroom available', 1, '[{\"icon\":\"wifi\",\"title\":\"Free WiFi\"}]', '1780120499_4930.jpg', '2026-05-30 05:54:59', '2026-05-30 05:54:59'),
(35, 61, 35, 'food', 'Cappuccino', '180', '15', '153', 'Rich espresso blended with steamed milk and topped with velvety milk foam for a smooth and satisfying coffee experience.', 'Brand: Golden Spoon Café\r\nAvailability: In Stock\r\nServing Size: 250 ml\r\nPreparation Time: 5–7 Minutes\r\nType: Hot Beverage\r\nCoffee Beans: Premium Arabica Blend\r\nMilk Options: Regular Milk, Almond Milk, Oat Milk, Soy Milk\r\nSugar Options: Regular, Brown Sugar, Sugar-Free\r\nBest Served With: Croissants, Brownies, Cheesecake, Sandwiches', 1, '[]', '1780385167.png', '2026-06-02 07:26:07', '2026-06-02 07:26:07'),
(36, 61, 39, 'food', 'Chocolate Brownie', '150', '12', '132', 'Freshly baked chocolate brownie with a rich, fudgy center and premium cocoa flavor.', 'Brand: Golden Spoon Café\r\nAvailability: In Stock\r\nServing Size: 120g\r\nPreparation: Freshly Baked Daily\r\nType: Dessert\r\nFlavor: Rich Chocolate', 1, '[{\"icon\":\"fas fa-coffee\",\"title\":\"Perfect with Coffee\"}]', '1780385440.png', '2026-06-02 07:30:40', '2026-06-02 07:30:40'),
(37, 61, 38, 'food', 'Veg Club Sandwich', '240', '12', '211.2', 'A delicious triple-layer sandwich packed with fresh vegetables, premium cheese, crunchy lettuce, and signature café sauce, grilled to perfection.\r\n\r\nNutritional Highlights\r\n🥬 Fresh Vegetables\r\n🧀 Rich & Creamy Cheese\r\n💪 Good Source of Energy\r\n🌱 100% Vegetarian', 'Brand: Golden Spoon Café\r\nAvailability: In Stock\r\nServing Size: 320g\r\nPreparation Time: 8–10 Minutes\r\nType: Vegetarian Sandwich', 1, '[]', '1780385676.png', '2026-06-02 07:34:36', '2026-06-02 07:34:36'),
(38, 41, 40, 'corporate-gifting-and-printing-services', 'Pen', '1', '0', '1', 'It has nice flow !', 'Looking to buy the best pens for writing online in India, Here it is !', 1, '[]', '1783922472.jpeg', '2026-07-13 06:01:12', '2026-07-13 06:04:44');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_categories`
--

CREATE TABLE `inventory_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listing_id` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_categories`
--

INSERT INTO `inventory_categories` (`id`, `type`, `listing_id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'hotel', 1, 'Hotel Helps', '2025-08-14 10:21:29', '2025-08-14 10:21:29'),
(2, 'hotel', 4, 'Testing Category 1', '2025-08-22 07:22:45', '2025-08-22 07:22:45'),
(3, 'hotel', 4, 'second testing category', '2025-08-22 07:23:10', '2025-08-22 07:23:10'),
(4, 'hotel', 5, '123456', '2025-08-22 07:30:58', '2025-08-22 07:30:58'),
(5, 'agencies', 6, 'My agency Category', '2025-08-25 06:13:52', '2025-08-25 06:13:52'),
(6, 'hotel', 3, 'add istify agency', '2025-08-25 06:34:52', '2025-08-25 06:34:52'),
(7, 'hotel', 3, 'Outdoor', '2025-08-25 10:08:36', '2025-08-25 10:08:36'),
(10, 'hotel', 5, 'ds,ldf,', '2025-08-27 11:32:49', '2025-08-27 11:32:49'),
(17, 'automobiles', 8, 'Abhishek automobile Tata spare parts', '2025-08-28 06:17:15', '2025-08-28 06:17:15'),
(18, 'agencies', 3, 'Advertising', '2025-08-28 08:03:03', '2025-08-28 08:03:03'),
(19, 'automobiles', 5, 'Test Category 1', '2025-08-29 07:02:57', '2025-08-29 07:02:57'),
(20, 'it-services', 4, 'SEO', '2025-08-29 12:25:53', '2025-08-29 12:25:53'),
(21, 'automobiles', 8, 'Abhishek automobile Tata spare parts one', '2025-09-19 12:26:06', '2025-09-19 12:26:06'),
(22, 'automobiles', 8, 'Abhishek automobile  parts', '2025-09-19 12:26:17', '2025-09-19 12:26:17'),
(23, 'automobiles', 8, 'Abhishek automobile', '2025-09-19 12:26:25', '2025-09-19 12:26:25'),
(24, 'automobiles', 8, 'Automobile Tata spare parts', '2025-09-19 12:26:39', '2025-09-19 12:26:39'),
(25, 'hotel', 2, 'Abhishek Hotel Product', '2025-09-20 09:42:12', '2025-09-20 09:42:12'),
(26, 'agencies', 10, 'Package Testing category', '2025-10-06 12:14:59', '2025-10-06 12:14:59'),
(27, 'it-services', 11, 'IT Consultancy', '2026-03-20 11:10:27', '2026-03-20 11:10:27'),
(28, 'it-services', 11, 'Web Development', '2026-03-20 11:10:43', '2026-03-20 11:10:43'),
(29, 'it-services', 11, 'Search Engine Optimization (SEO)', '2026-03-20 11:11:09', '2026-03-20 11:11:09'),
(30, 'it-services', 12, 'website', '2026-03-23 06:50:59', '2026-03-23 06:50:59'),
(32, 'it-services', 40, 'Development', '2026-05-06 07:40:03', '2026-05-06 07:40:03'),
(33, 'corporate-gifting-and-printing-services', 41, 'photoframe', '2026-05-29 07:54:56', '2026-05-29 07:54:56'),
(34, 'corporate-gifting-and-printing-services', 41, 'stationary', '2026-05-29 10:50:14', '2026-05-29 10:50:14'),
(35, 'food', 61, '☕ Coffee', '2026-06-02 07:20:14', '2026-06-02 07:20:14'),
(36, 'food', 61, '🧋 Specialty Drinks', '2026-06-02 07:20:48', '2026-06-02 07:20:48'),
(37, 'food', 61, '🥐 Bakery & Pastries', '2026-06-02 07:20:59', '2026-06-02 07:20:59'),
(38, 'food', 61, '🥪 Snacks & Light Meals', '2026-06-02 07:21:10', '2026-06-02 07:21:10'),
(39, 'food', 61, '🍰 Desserts', '2026-06-02 07:21:20', '2026-06-02 07:21:20'),
(40, 'corporate-gifting-and-printing-services', 41, 'Stationary', '2026-07-13 05:54:35', '2026-07-13 05:54:35');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_purchases`
--

CREATE TABLE `inventory_purchases` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` int DEFAULT NULL,
  `listing_creator_id` int DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listing_id` int DEFAULT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customer_message` longtext COLLATE utf8mb4_unicode_ci,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_method` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `txn_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_image` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_purchases`
--

INSERT INTO `inventory_purchases` (`id`, `user_id`, `listing_creator_id`, `type`, `listing_id`, `product`, `customer_name`, `customer_email`, `customer_phone`, `customer_address`, `customer_message`, `amount`, `payment_status`, `payment_method`, `txn_id`, `payment_image`, `delivery_status`, `created_at`, `updated_at`) VALUES
(2, 4, 1, 'hotel', 1, '[{\"product_id\":1,\"quantity\":1,\"price\":300}]', 'Kapil Chhabra', 'kc@corpmarvel.com', '9599917988', '12345', '1234567890', '300.00', 'pending', NULL, NULL, NULL, 'pending', '2025-08-14 13:15:38', '2025-08-14 13:15:38'),
(3, 22, 1, 'hotel', 1, '[{\"product_id\":1,\"quantity\":1,\"price\":300}]', 'Abhishek', 'davilsharma1999@gmail.com', '9717161203', 'A-57 Phase-4 Budhvihar', 'Testing online payment for hotel listings', '300.00', 'paid', NULL, NULL, NULL, 'delivered', '2025-08-21 10:36:35', '2025-08-21 10:38:12'),
(5, 5, NULL, 'automobiles', 8, '[{\"product_id\":12,\"quantity\":1,\"price\":475}]', 'Manoj kumar sharma', 'dev.acnosoft@gmail.com', '09716522169', 'A-57 Phase-4 Budhvihar', 'testing abhishek automobile testing cod', '475.00', 'pending', NULL, NULL, NULL, 'pending', '2025-08-28 10:46:23', '2025-08-28 10:46:23'),
(7, 5, NULL, 'automobiles', 8, '[{\"product_id\":14,\"quantity\":1,\"price\":900}]', 'abhishek sharma automobile txn', 'davilsharma1999@gmail.com', '9717161203', 'Rohini Delhi', 'Testing payment with UPI', '900.00', 'pending', 'upi', 'QRSO20250411145379112294', '1756533106.jpg', 'pending', '2025-08-30 05:51:46', '2025-08-30 05:51:46'),
(8, 5, NULL, 'automobiles', 8, '[{\"product_id\":14,\"quantity\":1,\"price\":900}]', 'abhishek sharma automobile Cod', 'davilsharma1999@gmail.com', '9717161203', 'Rohini Delhi', 'Testing Message With Cod', '900.00', 'pending', 'cod', NULL, NULL, 'pending', '2025-08-30 05:57:47', '2025-08-30 05:57:47'),
(9, 5, 5, 'automobiles', 8, '[{\"product_id\":14,\"quantity\":1,\"price\":900}]', 'abhishek sharma automobile UPI', 'davilsharma1999@gmail.com', '9717161203', 'Rohini Delhi', 'Testing Message With UPI', '900.00', 'pending', 'upi', 'QRSO20250411145379112294', '1756533537.png', 'pending', '2025-08-30 05:58:57', '2025-08-30 06:07:04'),
(10, 1, 5, 'automobiles', 8, '[{\"product_id\":12,\"quantity\":1,\"price\":475},{\"product_id\":14,\"quantity\":1,\"price\":900}]', 'Abhishek sharma', 'abhisheksharma@gmail.com', '09898989808', '252 Prem Plaza Subash Nagar Rohtak Pin code: 124001', 'testing order', '1375.00', 'pending', 'cod', NULL, NULL, 'pending', '2025-08-30 07:06:25', '2025-08-30 07:06:25'),
(11, 4, 5, 'automobiles', 8, '[{\"product_id\":12,\"quantity\":1,\"price\":475}]', 'Kapil', 'kapilchhabra1980@gmail.com', '9599917988', 'Sonipat', 'yes', '475.00', 'paid', 'upi', '1234567', '1756555689.png', 'delivered', '2025-08-30 12:08:09', '2025-09-06 10:05:21'),
(12, 16, 5, 'automobiles', 8, '[{\"product_id\":12,\"quantity\":1,\"price\":475}]', 'Abhishek sharma', 'davilsharma1999@gmail.com', '09717161203', 'D-3,12/4 Ramavihar mohd pur majri', 'xyz', '475.00', 'paid', 'upi', NULL, NULL, 'delivered', '2025-09-06 10:23:07', '2025-09-06 10:23:32'),
(13, 16, 5, 'automobiles', 8, '[{\"product_id\":12,\"quantity\":1,\"price\":475},{\"product_id\":14,\"quantity\":1,\"price\":900},{\"product_id\":17,\"quantity\":1,\"price\":800}]', 'Abhishek sharma', 'davilsharma1999@gmail.com', '09717161203', 'D-3,12/4 Ramavihar mohd pur majri', 'testing product', '2175.00', 'pending', 'cod', NULL, NULL, 'pending', '2025-09-11 11:17:50', '2025-09-11 11:17:50'),
(14, 16, 5, 'automobiles', 8, '[{\"product_id\":12,\"quantity\":1,\"price\":475},{\"product_id\":14,\"quantity\":1,\"price\":900},{\"product_id\":17,\"quantity\":1,\"price\":800}]', 'Abhishek sharma', 'davilsharma1999@gmail.com', '09717161203', 'D-3,12/4 Ramavihar mohd pur majri', 'testing product with upi payment', '2175.00', 'pending', 'upi', '123456789012345', '1757589586.png', 'pending', '2025-09-11 11:19:46', '2025-09-11 11:19:46'),
(16, 43, 22, 'agencies', 3, '[{\"product_id\":13,\"quantity\":1,\"price\":900}]', 'Harmanpreet Singh', 'singhharmanpreet646@gmail.com', '8818059914', 'Sonipat Haryana India', 'Test order', '900.00', 'pending', 'cod', NULL, NULL, 'pending', '2026-05-16 10:44:03', '2026-05-16 10:44:03'),
(17, 1, 43, 'hotel', 3, '[{\"product_id\":6,\"quantity\":1,\"price\":100}]', 'listify.asia', 'thecorpmarvel@gmail.com', '9599917988', 'TDI', 'test', '100.00', 'pending', 'cod', NULL, NULL, 'pending', '2026-05-16 10:58:59', '2026-05-16 10:58:59'),
(18, 4, 43, 'it-services', 11, '[{\"product_id\":23,\"quantity\":1,\"price\":5000}]', 'kapil chhabra', 'kc@corpmarvel.com', '9898878776', 'TDI City', 'Testing Payment', '5000.00', 'pending', 'upi', 'QRSO20250411145379112294', '1780738907.png', 'pending', '2026-06-06 09:41:47', '2026-06-06 09:41:47'),
(21, 4, 43, 'it-services', 11, '[{\"product_id\":23,\"quantity\":1,\"price\":5000}]', 'kapil chhabra', 'kc@corpmarvel.com', '9898878776', 'TDI City', 'New Testing Payment With API', '5000.00', 'pending', 'upi', 'QRSO20250411145379112294', '1781005192.jpg', 'pending', '2026-06-09 11:39:52', '2026-06-09 11:39:52'),
(22, 38, 43, 'it-services', 11, '[{\"product_id\":23,\"quantity\":1,\"price\":5000}]', 'kapil chhabra', 'kc@corpmarvel.com', '9898878776', 'TDI City', 'Testing Payment With API', '5000.00', 'pending', 'upi', 'QRSO20250411145379112294', '1781005255.png', 'pending', '2026-06-09 11:40:55', '2026-07-13 11:06:23'),
(26, 47, 50, 'custom', 41, '[{\"product_id\":38,\"quantity\":1,\"price\":1.0}]', 'Ravit Chhabra', 'chhabraravit@gmail.com', '7419287536', 'TDI KINGSBURY APPARTMENT, KUNDLI', 'I want this as soon as possible', '1.0', 'paid', 'cod', 'TXN1783922719272', NULL, 'delivered', '2026-07-13 06:05:20', '2026-07-14 07:32:22'),
(27, 43, 50, 'corporate-gifting-and-printing-services', 41, '[{\"product_id\":38,\"quantity\":1,\"price\":1}]', 'Harmanpreet Singh', 'singhharmanpreet646@gmail.com', '8818059914', 'Sonipat Haryana India', 'Testing order by Harman', '1.00', 'paid', 'cod', NULL, NULL, 'delivered', '2026-07-13 08:54:42', '2026-07-13 11:36:08'),
(29, 47, 50, 'custom', 41, '[{\"product_id\":38,\"quantity\":1,\"price\":1.0}]', 'Ravit Chhabra', 'chhabraravit@gmail.com', '7419287536', 'Tdi Kingsbury appartment', 'I want this as soon as possible', '1.0', 'paid', 'cod', 'TXN1784006983094', NULL, 'delivered', '2026-07-14 05:29:44', '2026-07-14 07:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `note` text COLLATE utf8mb4_general_ci,
  `terms_condition` text COLLATE utf8mb4_general_ci,
  `shipping` text COLLATE utf8mb4_general_ci,
  `disclaimer` text COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `user_id`, `note`, `terms_condition`, `shipping`, `disclaimer`, `created_at`, `updated_at`) VALUES
(1, 5, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.m cm', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'abcd', '2025-09-06 05:59:56', '2025-09-10 10:05:58'),
(3, 16, NULL, NULL, NULL, NULL, '2025-09-06 10:29:04', '2025-10-06 05:49:02'),
(4, 50, 'Thank you for choosing Sukhmani Enterprises HUF. We appreciate your business and look forward to serving you again.', '-Goods once sold will not be taken back or exchanged unless defective.\r\n-Payment is due as per the agreed terms.\r\n-Any disputes shall be subject to Sonipat, Haryana jurisdiction.\r\n-Prices are subject to change without prior notice.', '-Orders are processed within 1–3 business days.\r\n-Delivery timelines may vary depending on location and courier services.\r\n-Customers will be notified in case of any shipping delays.', 'Sukhmani Enterprises HUF strives to ensure accurate product descriptions and pricing. However, inadvertent errors may occur and are subject to correction without prior notice. Product images are for illustration purposes only and actual products may vary.\r\n\r\nThese will look professional and suitable for a gift, stationery, novelty, and personalized products business.', '2026-06-04 10:28:14', '2026-07-07 09:27:57'),
(6, 43, NULL, NULL, NULL, NULL, '2026-06-06 09:10:57', '2026-06-06 11:18:44'),
(7, 4, 'this is the nots of my listing.', 'this is the terms and conditions of my listing.', 'this is the shipping policy of my listing.', 'this is the diclaimer.', '2026-06-08 05:49:27', '2026-06-08 05:50:54');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `phrase` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `translated` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(61, 'english', 'Gibson', 'Gibson 1254', '2024-07-10 04:59:40', '2024-07-11 05:30:32'),
(63, 'english', 'Language Created Successfully', 'Language Created Successfully', '2024-07-10 10:59:40', '2024-07-11 05:30:31'),
(65, 'english', 'Success', 'Success', '2024-07-10 10:59:40', '2024-07-11 01:28:17'),
(67, 'english', 'System name', 'System name', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(69, 'english', 'System Email', 'System Email', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(71, 'english', 'System Currency', 'System Currency', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(73, 'english', 'Currency Position', 'Currency Position', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(75, 'english', 'Left', 'Left', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(77, 'english', 'Right', 'Right', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(79, 'english', 'Office \r\n                    Address', 'Office \r\n                    Address', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(81, 'english', 'Phone Number', 'Phone Number', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(83, 'english', 'System Language', 'System Language', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(85, 'english', 'Select a system language', 'Select a system language', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(87, 'english', 'English', 'English', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(90, 'english', 'Country', 'Country', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(92, 'english', 'Select a Country', 'Select a Country', '2024-07-10 11:02:34', '2024-07-11 01:28:17'),
(94, 'english', 'Afghanistan', 'Afghanistan', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(96, 'english', 'Aland Islands', 'Aland Islands', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(98, 'english', 'Albania', 'Albania', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(100, 'english', 'Algeria', 'Algeria', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(102, 'english', 'AmericanSamoa', 'AmericanSamoa', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(104, 'english', 'Andorra', 'Andorra', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(106, 'english', 'Angola', 'Angola', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(108, 'english', 'Anguilla', 'Anguilla', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(110, 'english', 'Antarctica', 'Antarctica', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(112, 'english', 'Antigua and Barbuda', 'Antigua and Barbuda', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(114, 'english', 'Argentina', 'Argentina', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(116, 'english', 'Armenia', 'Armenia', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(118, 'english', 'Aruba', 'Aruba', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(120, 'english', 'Australia', 'Australia', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(122, 'english', 'Austria', 'Austria', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(124, 'english', 'Azerbaijan', 'Azerbaijan', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(126, 'english', 'Bahamas', 'Bahamas', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(128, 'english', 'Bahrain', 'Bahrain', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(130, 'english', 'Bangladesh', 'Bangladesh', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(132, 'english', 'Barbados', 'Barbados', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(134, 'english', 'Belarus', 'Belarus', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(136, 'english', 'Belgium', 'Belgium', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(138, 'english', 'Belize', 'Belize', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(140, 'english', 'Benin', 'Benin', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(142, 'english', 'Bermuda', 'Bermuda', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(144, 'english', 'Bhutan', 'Bhutan', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(146, 'english', 'Bolivia, Plurination', 'Bolivia, Plurination', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(148, 'english', 'Bosnia and Herzegovi', 'Bosnia and Herzegovi', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(150, 'english', 'Botswana', 'Botswana', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(152, 'english', 'Brazil', 'Brazil', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(154, 'english', 'British Indian Ocean', 'British Indian Ocean', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(156, 'english', 'Brunei Darussalam', 'Brunei Darussalam', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(158, 'english', 'Bulgaria', 'Bulgaria', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(160, 'english', 'Burkina Faso', 'Burkina Faso', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(162, 'english', 'Burundi', 'Burundi', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(164, 'english', 'Cambodia', 'Cambodia', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(166, 'english', 'Cameroon', 'Cameroon', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(168, 'english', 'Canada', 'Canada', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(170, 'english', 'Cape Verde', 'Cape Verde', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(172, 'english', 'Cayman Islands', 'Cayman Islands', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(174, 'english', 'Central African Repu', 'Central African Repu', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(176, 'english', 'Chad', 'Chad', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(178, 'english', 'Chile', 'Chile', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(180, 'english', 'China', 'China', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(182, 'english', 'Christmas Island', 'Christmas Island', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(184, 'english', 'Cocos (Keeling) Isla', 'Cocos (Keeling) Isla', '2024-07-10 11:02:35', '2024-07-11 01:28:17'),
(186, 'english', 'Colombia', 'Colombia', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(188, 'english', 'Comoros', 'Comoros', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(190, 'english', 'Congo', 'Congo', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(192, 'english', 'Congo, The Democrati', 'Congo, The Democrati', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(194, 'english', 'Cook Islands', 'Cook Islands', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(196, 'english', 'Costa Rica', 'Costa Rica', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(198, 'english', 'Cote d\'Ivoire', 'Cote d\'Ivoire', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(200, 'english', 'Croatia', 'Croatia', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(202, 'english', 'Cuba', 'Cuba', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(204, 'english', 'Cyprus', 'Cyprus', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(206, 'english', 'Czech Republic', 'Czech Republic', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(208, 'english', 'Denmark', 'Denmark', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(210, 'english', 'Djibouti', 'Djibouti', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(212, 'english', 'Dominica', 'Dominica', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(214, 'english', 'Dominican Republic', 'Dominican Republic', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(216, 'english', 'Ecuador', 'Ecuador', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(218, 'english', 'Egypt', 'Egypt', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(220, 'english', 'El Salvador', 'El Salvador', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(222, 'english', 'Equatorial Guinea', 'Equatorial Guinea', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(224, 'english', 'Eritrea', 'Eritrea', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(226, 'english', 'Estonia', 'Estonia', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(228, 'english', 'Ethiopia', 'Ethiopia', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(230, 'english', 'Falkland Islands (Ma', 'Falkland Islands (Ma', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(232, 'english', 'Faroe Islands', 'Faroe Islands', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(234, 'english', 'Fiji', 'Fiji', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(236, 'english', 'Finland', 'Finland', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(238, 'english', 'France', 'France', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(240, 'english', 'French Guiana', 'French Guiana', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(242, 'english', 'French Polynesia', 'French Polynesia', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(244, 'english', 'Gabon', 'Gabon', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(246, 'english', 'Gambia', 'Gambia', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(248, 'english', 'Georgia', 'Georgia', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(250, 'english', 'Germany', 'Germany', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(252, 'english', 'Ghana', 'Ghana', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(254, 'english', 'Gibraltar', 'Gibraltar', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(256, 'english', 'Greece', 'Greece', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(258, 'english', 'Greenland', 'Greenland', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(260, 'english', 'Grenada', 'Grenada', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(262, 'english', 'Guadeloupe', 'Guadeloupe', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(264, 'english', 'Guam', 'Guam', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(266, 'english', 'Guatemala', 'Guatemala', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(268, 'english', 'Guernsey', 'Guernsey', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(270, 'english', 'Guinea', 'Guinea', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(272, 'english', 'Guinea-Bissau', 'Guinea-Bissau', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(274, 'english', 'Guyana', 'Guyana', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(276, 'english', 'Haiti', 'Haiti', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(278, 'english', 'Holy See (Vatican Ci', 'Holy See (Vatican Ci', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(280, 'english', 'Honduras', 'Honduras', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(282, 'english', 'Hong Kong', 'Hong Kong', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(284, 'english', 'Hungary', 'Hungary', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(286, 'english', 'Iceland', 'Iceland', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(288, 'english', 'India', 'India', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(290, 'english', 'Indonesia', 'Indonesia', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(292, 'english', 'Iran, Islamic Republ', 'Iran, Islamic Republ', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(294, 'english', 'Iraq', 'Iraq', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(296, 'english', 'Ireland', 'Ireland', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(298, 'english', 'Isle of Man', 'Isle of Man', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(300, 'english', 'Israel', 'Israel', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(302, 'english', 'Italy', 'Italy', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(304, 'english', 'Jamaica', 'Jamaica', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(306, 'english', 'Japan', 'Japan', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(308, 'english', 'Jersey', 'Jersey', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(310, 'english', 'Jordan', 'Jordan', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(312, 'english', 'Kazakhstan', 'Kazakhstan', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(314, 'english', 'Kenya', 'Kenya', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(316, 'english', 'Kiribati', 'Kiribati', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(318, 'english', 'Korea, Democratic Pe', 'Korea, Democratic Pe', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(320, 'english', 'Korea, Republic of S', 'Korea, Republic of S', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(322, 'english', 'Kuwait', 'Kuwait', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(324, 'english', 'Kyrgyzstan', 'Kyrgyzstan', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(326, 'english', 'Laos', 'Laos', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(328, 'english', 'Latvia', 'Latvia', '2024-07-10 11:02:36', '2024-07-11 01:28:17'),
(330, 'english', 'Lebanon', 'Lebanon', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(332, 'english', 'Lesotho', 'Lesotho', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(334, 'english', 'Liberia', 'Liberia', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(336, 'english', 'Libyan Arab Jamahiri', 'Libyan Arab Jamahiri', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(338, 'english', 'Liechtenstein', 'Liechtenstein', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(340, 'english', 'Lithuania', 'Lithuania', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(342, 'english', 'Luxembourg', 'Luxembourg', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(344, 'english', 'Macao', 'Macao', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(346, 'english', 'Macedonia', 'Macedonia', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(348, 'english', 'Madagascar', 'Madagascar', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(350, 'english', 'Malawi', 'Malawi', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(352, 'english', 'Malaysia', 'Malaysia', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(354, 'english', 'Maldives', 'Maldives', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(356, 'english', 'Mali', 'Mali', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(358, 'english', 'Malta', 'Malta', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(360, 'english', 'Marshall Islands', 'Marshall Islands', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(362, 'english', 'Martinique', 'Martinique', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(364, 'english', 'Mauritania', 'Mauritania', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(366, 'english', 'Mauritius', 'Mauritius', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(368, 'english', 'Mayotte', 'Mayotte', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(370, 'english', 'Mexico', 'Mexico', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(372, 'english', 'Micronesia, Federate', 'Micronesia, Federate', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(374, 'english', 'Moldova', 'Moldova', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(376, 'english', 'Monaco', 'Monaco', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(378, 'english', 'Mongolia', 'Mongolia', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(380, 'english', 'Montenegro', 'Montenegro', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(382, 'english', 'Montserrat', 'Montserrat', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(384, 'english', 'Morocco', 'Morocco', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(386, 'english', 'Mozambique', 'Mozambique', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(388, 'english', 'Myanmar', 'Myanmar', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(390, 'english', 'Namibia', 'Namibia', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(392, 'english', 'Nauru', 'Nauru', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(394, 'english', 'Nepal', 'Nepal', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(396, 'english', 'Netherlands', 'Netherlands', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(398, 'english', 'Netherlands Antilles', 'Netherlands Antilles', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(400, 'english', 'New Caledonia', 'New Caledonia', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(402, 'english', 'New Zealand', 'New Zealand', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(404, 'english', 'Nicaragua', 'Nicaragua', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(406, 'english', 'Niger', 'Niger', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(408, 'english', 'Nigeria', 'Nigeria', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(410, 'english', 'Niue', 'Niue', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(412, 'english', 'Norfolk Island', 'Norfolk Island', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(414, 'english', 'Northern Mariana Isl', 'Northern Mariana Isl', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(416, 'english', 'Norway', 'Norway', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(418, 'english', 'Oman', 'Oman', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(420, 'english', 'Pakistan', 'Pakistan', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(422, 'english', 'Palau', 'Palau', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(424, 'english', 'Palestinian Territor', 'Palestinian Territor', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(426, 'english', 'Panama', 'Panama', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(428, 'english', 'Papua New Guinea', 'Papua New Guinea', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(430, 'english', 'Paraguay', 'Paraguay', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(432, 'english', 'Peru', 'Peru', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(434, 'english', 'Philippines', 'Philippines', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(436, 'english', 'Pitcairn', 'Pitcairn', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(438, 'english', 'Poland', 'Poland', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(440, 'english', 'Portugal', 'Portugal', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(442, 'english', 'Puerto Rico', 'Puerto Rico', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(444, 'english', 'Qatar', 'Qatar', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(446, 'english', 'Romania', 'Romania', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(448, 'english', 'Russia', 'Russia', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(450, 'english', 'Rwanda', 'Rwanda', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(452, 'english', 'Reunion', 'Reunion', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(454, 'english', 'Saint Barthelemy', 'Saint Barthelemy', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(456, 'english', 'Saint Helena, Ascens', 'Saint Helena, Ascens', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(458, 'english', 'Saint Kitts and Nevi', 'Saint Kitts and Nevi', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(460, 'english', 'Saint Lucia', 'Saint Lucia', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(462, 'english', 'Saint Martin', 'Saint Martin', '2024-07-10 11:02:37', '2024-07-11 01:28:17'),
(464, 'english', 'Saint Pierre and Miq', 'Saint Pierre and Miq', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(466, 'english', 'Saint Vincent and th', 'Saint Vincent and th', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(468, 'english', 'Samoa', 'Samoa', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(470, 'english', 'San Marino', 'San Marino', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(472, 'english', 'Sao Tome and Princip', 'Sao Tome and Princip', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(474, 'english', 'Saudi Arabia', 'Saudi Arabia', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(476, 'english', 'Senegal', 'Senegal', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(478, 'english', 'Serbia', 'Serbia', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(480, 'english', 'Seychelles', 'Seychelles', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(482, 'english', 'Sierra Leone', 'Sierra Leone', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(484, 'english', 'Singapore', 'Singapore', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(486, 'english', 'Slovakia', 'Slovakia', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(488, 'english', 'Slovenia', 'Slovenia', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(490, 'english', 'Solomon Islands', 'Solomon Islands', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(492, 'english', 'Somalia', 'Somalia', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(494, 'english', 'South Africa', 'South Africa', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(496, 'english', 'South Georgia and th', 'South Georgia and th', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(498, 'english', 'Spain', 'Spain', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(500, 'english', 'Sri Lanka', 'Sri Lanka', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(502, 'english', 'Sudan', 'Sudan', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(504, 'english', 'Suriname', 'Suriname', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(506, 'english', 'Svalbard and Jan May', 'Svalbard and Jan May', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(508, 'english', 'Swaziland', 'Swaziland', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(510, 'english', 'Sweden', 'Sweden', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(512, 'english', 'Switzerland', 'Switzerland', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(514, 'english', 'Syrian Arab Republic', 'Syrian Arab Republic', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(516, 'english', 'Taiwan', 'Taiwan', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(518, 'english', 'Tajikistan', 'Tajikistan', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(520, 'english', 'Tanzania, United Rep', 'Tanzania, United Rep', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(522, 'english', 'Thailand', 'Thailand', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(524, 'english', 'Timor-Leste', 'Timor-Leste', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(526, 'english', 'Togo', 'Togo', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(528, 'english', 'Tokelau', 'Tokelau', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(530, 'english', 'Tonga', 'Tonga', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(532, 'english', 'Trinidad and Tobago', 'Trinidad and Tobago', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(534, 'english', 'Tunisia', 'Tunisia', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(536, 'english', 'Turkey', 'Turkey', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(538, 'english', 'Turkmenistan', 'Turkmenistan', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(540, 'english', 'Turks and Caicos Isl', 'Turks and Caicos Isl', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(542, 'english', 'Tuvalu', 'Tuvalu', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(544, 'english', 'Uganda', 'Uganda', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(546, 'english', 'Ukraine', 'Ukraine', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(548, 'english', 'United Arab Emirates', 'United Arab Emirates', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(550, 'english', 'United Kingdom', 'United Kingdom', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(552, 'english', 'United States', 'United States', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(554, 'english', 'Uruguay', 'Uruguay', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(556, 'english', 'Uzbekistan', 'Uzbekistan', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(558, 'english', 'Vanuatu', 'Vanuatu', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(560, 'english', 'Venezuela, Bolivaria', 'Venezuela, Bolivaria', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(562, 'english', 'Vietnam', 'Vietnam', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(564, 'english', 'Virgin Islands, Brit', 'Virgin Islands, Brit', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(566, 'english', 'Virgin Islands, U.S.', 'Virgin Islands, U.S.', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(568, 'english', 'Wallis and Futuna', 'Wallis and Futuna', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(570, 'english', 'Yemen', 'Yemen', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(572, 'english', 'Zambia', 'Zambia', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(574, 'english', 'Zimbabwe', 'Zimbabwe', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(576, 'english', 'Purchase Code', 'Purchase Code', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(578, 'english', 'Email Verification', 'Email Verification', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(580, 'english', 'Select email verification', 'Select email verification', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(582, 'english', 'Enable', 'Enable', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(584, 'english', 'Disable', 'Disable', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(586, 'english', 'Map access token', 'Map access token', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(588, 'english', 'Max zoom level', 'Max zoom level', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(590, 'english', 'Default location', 'Default location', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(592, 'english', 'Update', 'Update', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(594, 'english', 'Facebook Link', 'Facebook Link', '2024-07-10 11:02:38', '2024-07-11 01:28:17'),
(596, 'english', 'Twitter Link', 'Twitter Link', '2024-07-10 11:02:39', '2024-07-11 01:28:17'),
(598, 'english', 'Linkedin Link', 'Linkedin Link', '2024-07-10 11:02:39', '2024-07-11 01:28:17'),
(600, 'english', 'Update File', 'Update File', '2024-07-10 11:02:39', '2024-07-11 01:28:17'),
(602, 'english', 'Setting update successfully!', 'Setting update successfully!', '2024-07-10 11:02:48', '2024-07-11 01:28:17'),
(603, 'english', 'System Settings', 'System Settings', '2024-07-10 11:02:48', '2024-07-11 01:28:17'),
(604, 'english', 'Dashboard', 'Dashboard', '2024-07-10 11:02:49', '2024-07-11 03:28:40'),
(605, 'english', 'Listing Categories', 'Listing Categories', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(606, 'english', 'Doctor', 'Doctor', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(607, 'english', 'Beauty', 'Beauty', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(608, 'english', 'Car', 'Car', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(609, 'english', 'Real Estate', 'Real Estate', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(610, 'english', 'Hotel', 'Hotel', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(611, 'english', 'Restaurant', 'Restaurant', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(612, 'english', 'Cities', 'Cities', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(613, 'english', 'Listing Amenities', 'Listing Amenities', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(614, 'english', 'Directory Listings', 'Directory Listings', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(615, 'english', 'All Listings', 'All Listings', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(616, 'english', 'Add Listing', 'Add Listing', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(617, 'english', 'Claimed Listings', 'Claimed Listings', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(618, 'english', 'Reported Listing', 'Reported Listing', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(619, 'english', 'Subscription History', 'Subscription History', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(620, 'english', 'Pricing', 'Pricing', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(621, 'english', 'Users', 'Users', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(622, 'english', 'Add New', 'Add New', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(623, 'english', 'All Doctors', 'All Doctors', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(624, 'english', 'Agent', 'Agent', '2024-07-10 11:02:49', '2024-07-11 01:28:17'),
(625, 'english', 'All Agents', 'All Agents', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(626, 'english', 'Customer', 'Customer', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(627, 'english', 'All Customers', 'All Customers', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(628, 'english', 'Newsletter', 'Newsletter', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(629, 'english', 'Manage Newsletter', 'Manage Newsletter', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(630, 'english', 'Subscribed User', 'Subscribed User', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(631, 'english', 'Contacts', 'Contacts', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(632, 'english', 'Blogs', 'Blogs', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(633, 'english', 'All Blogs', 'All Blogs', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(634, 'english', 'Pending Blogs', 'Pending Blogs', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(635, 'english', 'Add Blogs', 'Add Blogs', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(636, 'english', 'Blog Category', 'Blog Category', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(637, 'english', 'Settings', 'Settings', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(638, 'english', 'Website Settings', 'Website Settings', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(639, 'english', 'Payment Settings', 'Payment Settings', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(640, 'english', 'Language Settings', 'Language Settings', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(641, 'english', 'Email Settings', 'Email Settings', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(642, 'english', 'Manage Profile', 'Manage Profile', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(643, 'english', 'Atlas Admin Panel', 'Atlas Admin Panel', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(644, 'english', 'View site', 'View site', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(645, 'english', 'Language', 'Language', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(646, 'english', 'Admin', 'Admin', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(647, 'english', 'My Profile', 'My Profile', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(648, 'english', 'Sign Out', 'Sign Out', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(649, 'english', 'Modal title', 'Modal title', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(650, 'english', 'Are you sure!', 'Are you sure!', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(651, 'english', 'If you this data then can\'t be undo', 'If you this data then can\'t be undo', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(652, 'english', 'Close', 'Close', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(653, 'english', 'Delete', 'Delete', '2024-07-10 11:02:50', '2024-07-11 01:28:17'),
(654, 'english', 'Add New Language', 'Add New Language', '2024-07-10 11:02:58', '2024-07-11 01:28:17'),
(655, 'english', 'ID', 'ID', '2024-07-10 11:02:58', '2024-07-11 01:28:17'),
(656, 'english', 'Language Name', 'Language Name', '2024-07-10 11:02:58', '2024-07-11 01:28:17'),
(657, 'english', 'Action', 'Action', '2024-07-10 11:02:58', '2024-07-11 01:28:17'),
(658, 'english', 'Update language', 'Update language', '2024-07-10 11:02:59', '2024-07-11 01:28:17'),
(659, 'english', 'Edit', 'Edit', '2024-07-10 11:02:59', '2024-07-11 01:28:17'),
(660, 'english', 'Language Deleted Successfully', 'Language Deleted Successfully', '2024-07-10 11:03:37', '2024-07-11 01:28:17'),
(661, 'english', 'Edit Phrase', 'Edit Phrase', '2024-07-10 11:33:03', '2024-07-11 01:28:17'),
(662, 'english', 'Enter language name', 'Enter language name', '2024-07-10 11:34:19', '2024-07-11 01:28:17'),
(663, 'english', 'Create', 'Create', '2024-07-10 11:34:19', '2024-07-11 01:28:17'),
(664, 'english', 'System settings updated successfully.', 'System settings updated successfully.', '2024-07-10 11:42:24', '2024-07-11 01:28:17'),
(665, 'english', 'Language updated successfully.', 'Language updated successfully.', '2024-07-10 11:43:25', '2024-07-11 01:28:17'),
(666, 'english', 'Gib124', 'Gib124', '2024-07-10 11:43:31', '2024-07-11 01:28:17'),
(667, 'english', 'Home Page', 'Home Page', '2024-07-11 06:40:02', '2024-07-11 01:28:17'),
(668, 'english', 'Admin Dashboard', 'Admin Dashboard', '2024-07-11 07:26:03', '2024-07-11 01:28:17'),
(669, 'english', 'Change Phrase', 'Change Phrase', '2024-07-11 07:31:20', '2024-07-11 07:31:20'),
(670, 'english', 'Language Phrase', 'Language Phrase', '2024-07-11 07:31:20', '2024-07-11 07:31:20'),
(671, 'english', 'Save', 'Save', '2024-07-11 07:37:18', '2024-07-11 07:37:18'),
(673, 'english', 'Bangla', 'Bangla', '2024-07-11 09:29:45', '2024-07-11 09:29:45'),
(1006, 'english', 'Protocol (smtp or ssmtp or mail)', 'Protocol (smtp or ssmtp or mail)', '2024-07-11 09:43:03', '2024-07-11 09:43:03'),
(1008, 'english', 'Protocol (smtp)', 'Protocol (smtp)', '2024-07-11 09:43:03', '2024-07-11 09:43:03'),
(1010, 'english', 'Smtp crypto (ssl or tls)', 'Smtp crypto (ssl or tls)', '2024-07-11 09:43:03', '2024-07-11 09:43:03'),
(1012, 'english', 'Crypto (ssl or tls)', 'Crypto (ssl or tls)', '2024-07-11 09:43:03', '2024-07-11 09:43:03'),
(1014, 'english', 'Smtp host', 'Smtp host', '2024-07-11 09:43:03', '2024-07-11 09:43:03'),
(1016, 'english', 'Smtp port', 'Smtp port', '2024-07-11 09:43:03', '2024-07-11 09:43:03'),
(1018, 'english', 'Smtp username', 'Smtp username', '2024-07-11 09:43:03', '2024-07-11 09:43:03'),
(1020, 'english', 'Smtp password', 'Smtp password', '2024-07-11 09:43:03', '2024-07-11 09:43:03'),
(1022, 'english', 'Add New Blog', 'Add New Blog', '2024-07-11 09:52:43', '2024-07-11 09:52:43'),
(1024, 'english', 'Image', 'Image', '2024-07-11 09:52:43', '2024-07-11 09:52:43'),
(1026, 'english', 'Title', 'Title', '2024-07-11 09:52:43', '2024-07-11 09:52:43'),
(1028, 'english', 'Category', 'Category', '2024-07-11 09:52:43', '2024-07-11 09:52:43'),
(1030, 'english', 'Status', 'Status', '2024-07-11 09:52:43', '2024-07-11 09:52:43'),
(1032, 'english', 'Active', 'Active', '2024-07-11 09:52:43', '2024-07-11 09:52:43'),
(1034, 'english', 'Change Status', 'Change Status', '2024-07-11 09:52:43', '2024-07-11 09:52:43'),
(1036, 'english', 'Profile', 'Profile', '2024-07-11 09:52:54', '2024-07-11 09:52:54'),
(1038, 'english', 'Profile Settings', 'Profile Settings', '2024-07-11 09:52:54', '2024-07-11 09:52:54'),
(1040, 'english', 'Profile Information', 'Profile Information', '2024-07-11 09:52:54', '2024-07-11 09:52:54'),
(1042, 'english', 'User Name', 'User Name', '2024-07-11 09:52:54', '2024-07-11 09:52:54'),
(1044, 'english', 'Enter user name', 'Enter user name', '2024-07-11 09:52:54', '2024-07-11 09:52:54'),
(1046, 'english', 'User Email', 'User Email', '2024-07-11 09:52:54', '2024-07-11 09:52:54'),
(1048, 'english', 'Enter user email', 'Enter user email', '2024-07-11 09:52:54', '2024-07-11 09:52:54'),
(1050, 'english', 'User Image', 'User Image', '2024-07-11 09:52:54', '2024-07-11 09:52:54'),
(1052, 'english', 'Password Update', 'Password Update', '2024-07-11 09:52:55', '2024-07-11 09:52:55'),
(1054, 'english', 'Current Password', 'Current Password', '2024-07-11 09:52:55', '2024-07-11 09:52:55'),
(1056, 'english', 'New Password', 'New Password', '2024-07-11 09:52:55', '2024-07-11 09:52:55'),
(1058, 'english', 'Confirm Password', 'Confirm Password', '2024-07-11 09:52:55', '2024-07-11 09:52:55'),
(1060, 'english', 'Info', 'Info', '2024-07-11 09:54:24', '2024-07-11 09:54:24'),
(1063, 'english', 'User Full Name *', 'User Full Name *', '2024-07-11 09:54:24', '2024-07-11 09:54:24'),
(1065, 'english', 'Enter name', 'Enter name', '2024-07-11 09:54:24', '2024-07-11 09:54:24'),
(1067, 'english', 'Email Address *', 'Email Address *', '2024-07-11 09:54:24', '2024-07-11 09:54:24'),
(1069, 'english', 'Enter email', 'Enter email', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1071, 'english', 'Phone Number *', 'Phone Number *', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1073, 'english', 'Enter phone', 'Enter phone', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1075, 'english', 'Gender *', 'Gender *', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1077, 'english', 'Select Gender', 'Select Gender', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1079, 'english', 'Male', 'Male', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1081, 'english', 'Female', 'Female', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1083, 'english', 'Country *', 'Country *', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1085, 'english', 'Select Country', 'Select Country', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1087, 'english', 'Enter facebook link', 'Enter facebook link', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1089, 'english', 'City *', 'City *', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1091, 'english', 'Select City', 'Select City', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1093, 'english', 'Enter linkedin link', 'Enter linkedin link', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1095, 'english', 'Enter twitter link', 'Enter twitter link', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1097, 'english', 'Password *', 'Password *', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1099, 'english', 'Enter password', 'Enter password', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1101, 'english', 'Confirm Password *', 'Confirm Password *', '2024-07-11 09:54:25', '2024-07-11 09:54:25'),
(1103, 'english', 'Appointments', 'Appointments', '2024-07-11 10:28:57', '2024-07-11 10:28:57'),
(1105, 'english', 'Manage Appointment', 'Manage Appointment', '2024-07-11 10:29:03', '2024-07-11 10:29:03'),
(1108, 'english', 'Create Listing', 'Create Listing', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1110, 'english', 'Listing Type', 'Listing Type', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1112, 'english', 'Select listing type', 'Select listing type', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1114, 'english', 'Beauty Listing', 'Beauty Listing', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1116, 'english', 'Car Listing', 'Car Listing', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1118, 'english', 'Real Estate Listing', 'Real Estate Listing', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1120, 'english', 'Hotel Listing', 'Hotel Listing', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1122, 'english', 'Restaurant Listing', 'Restaurant Listing', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1124, 'english', 'Listing Category', 'Listing Category', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1126, 'english', 'Select listing type first', 'Select listing type first', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1128, 'english', 'Select Listing type from dropdown.', 'Select Listing type from dropdown.', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1130, 'english', 'Select listing category', 'Select listing category', '2024-07-12 13:08:04', '2024-07-12 13:08:04'),
(1132, 'english', 'Basic Info', 'Basic Info', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1134, 'english', 'Address', 'Address', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1136, 'english', 'Seo', 'Seo', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1138, 'english', 'Media', 'Media', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1140, 'english', 'Listing title', 'Listing title', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1142, 'english', 'Enter listing title', 'Enter listing title', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1144, 'english', 'Brand', 'Brand', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1146, 'english', 'Select listing brand', 'Select listing brand', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1148, 'english', 'Model', 'Model', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1150, 'english', 'Select listing model', 'Select listing model', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1152, 'english', 'Year', 'Year', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1154, 'english', 'Select listing year', 'Select listing year', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1156, 'english', 'Car Type', 'Car Type', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1158, 'english', 'Select listing car type', 'Select listing car type', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1160, 'english', 'Transmission', 'Transmission', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1162, 'english', 'Select listing transmission', 'Select listing transmission', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1164, 'english', 'Fuel Type', 'Fuel Type', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1166, 'english', 'Select listing fuel_type', 'Select listing fuel_type', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1168, 'english', 'Cylinder', 'Cylinder', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1170, 'english', 'Select listing Cylinder', 'Select listing Cylinder', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1172, 'english', 'Interior Color', 'Interior Color', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1174, 'english', 'Select listing interior color', 'Select listing interior color', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1176, 'english', 'Exterior Color', 'Exterior Color', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1178, 'english', 'Select listing exterior color', 'Select listing exterior color', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1180, 'english', 'Drive Train', 'Drive Train', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1182, 'english', 'Select listing drive train', 'Select listing drive train', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1184, 'english', 'Trim', 'Trim', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1186, 'english', 'Select listing trim', 'Select listing trim', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1188, 'english', 'Engin_size', 'Engin_size', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1190, 'english', 'Mileage', 'Mileage', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1192, 'english', '00', '00', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1194, 'english', 'vin', 'vin', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1196, 'english', '4jh45ed4', '4jh45ed4', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1198, 'english', 'price', 'price', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1200, 'english', '00.00', '00.00', '2024-07-12 13:08:12', '2024-07-12 13:08:12'),
(1202, 'english', 'discount_price', 'discount_price', '2024-07-12 13:08:13', '2024-07-12 13:08:13'),
(1204, 'english', 'Visibility', 'Visibility', '2024-07-12 13:08:13', '2024-07-12 13:08:13'),
(1206, 'english', 'Select listing visibility', 'Select listing visibility', '2024-07-12 13:08:13', '2024-07-12 13:08:13'),
(1208, 'english', 'Visible', 'Visible', '2024-07-12 13:08:13', '2024-07-12 13:08:13'),
(1210, 'english', 'Hidden', 'Hidden', '2024-07-12 13:08:13', '2024-07-12 13:08:13'),
(1212, 'english', 'Description', 'Description', '2024-07-12 13:08:13', '2024-07-12 13:08:13'),
(1214, 'english', 'Enter listing description', 'Enter listing description', '2024-07-12 13:08:13', '2024-07-12 13:08:13'),
(1216, 'english', 'Select listing country', 'Select listing country', '2024-07-12 13:08:13', '2024-07-12 13:08:13'),
(1218, 'english', 'City', 'City', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1220, 'english', 'Select listing city', 'Select listing city', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1222, 'english', 'Address', 'Address', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1224, 'english', 'Enter listing address', 'Enter listing address', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1226, 'english', 'Post Code', 'Post Code', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1228, 'english', 'Enter post code', 'Enter post code', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1230, 'english', 'Latitude', 'Latitude', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1232, 'english', 'Enter Latitude code', 'Enter Latitude code', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1234, 'english', 'Longitude', 'Longitude', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1236, 'english', 'Enter longitude code', 'Enter longitude code', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1238, 'english', 'Meta Title', 'Meta Title', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1240, 'english', 'Enter meta title', 'Enter meta title', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1242, 'english', 'Meta keywords', 'Meta keywords', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1244, 'english', 'Keyword1; keyword2; keyword3;', 'Keyword1; keyword2; keyword3;', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1246, 'english', 'Meta Description', 'Meta Description', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1248, 'english', 'Enter meta description', 'Enter meta description', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1250, 'english', 'OG title', 'OG title', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1252, 'english', 'Enter og title', 'Enter og title', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1254, 'english', 'Canonical URL', 'Canonical URL', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1256, 'english', 'Enter canonical URL', 'Enter canonical URL', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1258, 'english', 'OG Description', 'OG Description', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1260, 'english', 'Json ID', 'Json ID', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1262, 'english', 'Enter json ID', 'Enter json ID', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1264, 'english', 'OG Image', 'OG Image', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1266, 'english', 'Listing Images', 'Listing Images', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1268, 'english', 'Click to upload SVG, PNG, JPG, or GIF', 'Click to upload SVG, PNG, JPG, or GIF', '2024-07-12 13:08:14', '2024-07-12 13:08:14'),
(1270, 'english', 'Visible', 'Visible', '2024-07-14 07:03:19', '2024-07-14 07:03:19'),
(1272, 'english', 'Preview Video', 'Preview Video', '2024-07-14 07:03:21', '2024-07-14 07:03:21'),
(1274, 'english', 'Enter youtube link', 'Enter youtube link', '2024-07-14 07:03:21', '2024-07-14 07:03:21'),
(1276, 'english', 'Beauty Listings', 'Beauty Listings', '2024-07-14 10:38:12', '2024-07-14 10:38:12'),
(1278, 'english', 'Listing', 'Listing', '2024-07-14 10:40:23', '2024-07-14 10:40:23'),
(1280, 'english', 'Car Listings', 'Car Listings', '2024-07-14 10:43:35', '2024-07-14 10:43:35'),
(1282, 'english', 'Hotel Listings', 'Hotel Listings', '2024-07-14 10:43:38', '2024-07-14 10:43:38'),
(1284, 'english', 'Real Estate Listings', 'Real Estate Listings', '2024-07-14 10:43:44', '2024-07-14 10:43:44'),
(1286, 'english', 'Restaurant Listings', 'Restaurant Listings', '2024-07-14 10:43:48', '2024-07-14 10:43:48'),
(1288, 'english', 'Listing List', 'Listing List', '2024-07-14 10:57:32', '2024-07-14 10:57:32'),
(1290, 'english', 'Lists', 'Lists', '2024-07-14 10:57:32', '2024-07-14 10:57:32'),
(1292, 'english', 'Add New Listing', 'Add New Listing', '2024-07-14 10:57:32', '2024-07-14 10:57:32'),
(1294, 'english', 'Change visibility', 'Change visibility', '2024-07-14 10:57:32', '2024-07-14 10:57:32'),
(1296, 'english', 'Update Listing', 'Update Listing', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1298, 'english', 'Listing Update', 'Listing Update', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1300, 'english', 'Services', 'Services', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1302, 'english', 'Opening Time', 'Opening Time', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1304, 'english', 'Team Members', 'Team Members', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1306, 'english', 'Add some listing service', 'Add some listing service', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1308, 'english', 'Add New Service', 'Add New Service', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1310, 'english', 'Add Service', 'Add Service', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1312, 'english', 'From', 'From', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1314, 'english', 'Opening', 'Opening', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1316, 'english', 'Closed', 'Closed', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1318, 'english', 'Select some team members', 'Select some team members', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1320, 'english', 'Add Team Member', 'Add Team Member', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1322, 'english', 'Add Team', 'Add Team', '2024-07-14 11:00:10', '2024-07-14 11:00:10'),
(1324, 'english', 'Amenities', 'Amenities', '2024-07-14 11:32:56', '2024-07-14 11:32:56'),
(1326, 'english', 'Add', 'Add', '2024-07-14 11:32:56', '2024-07-14 11:32:56'),
(1328, 'english', 'Cylinder', 'Cylinder', '2024-07-14 11:32:56', '2024-07-14 11:32:56'),
(1330, 'english', 'Engine Size', 'Engine Size', '2024-07-14 11:32:56', '2024-07-14 11:32:56'),
(1332, 'english', 'Amenities List', 'Amenities List', '2024-07-14 11:32:56', '2024-07-14 11:32:56'),
(1334, 'english', 'Name', 'Name', '2024-07-14 11:32:56', '2024-07-14 11:32:56'),
(1336, 'english', 'Icon', 'Icon', '2024-07-14 11:32:56', '2024-07-14 11:32:56'),
(1338, 'english', 'Update Amenities', 'Update Amenities', '2024-07-14 11:32:56', '2024-07-14 11:32:56'),
(1340, 'english', 'Location', 'Location', '2024-07-15 09:48:10', '2024-07-15 09:48:10'),
(1342, 'english', 'Map Position', 'Map Position', '2024-07-16 10:38:48', '2024-07-16 10:38:48'),
(1344, 'english', 'Right Sidebar', 'Right Sidebar', '2024-07-16 10:38:48', '2024-07-16 10:38:48'),
(1346, 'english', 'Top Header', 'Top Header', '2024-07-16 10:38:48', '2024-07-16 10:38:48'),
(1348, 'english', 'Showing', 'Showing', '2024-07-16 10:53:11', '2024-07-16 10:53:11'),
(1350, 'english', 'of', 'of', '2024-07-16 10:53:11', '2024-07-16 10:53:11'),
(1352, 'english', 'results', 'results', '2024-07-16 10:53:25', '2024-07-16 10:53:25'),
(1354, 'english', 'Map', 'Map', '2024-07-16 12:31:57', '2024-07-16 12:31:57'),
(1356, 'english', 'Features', 'Features', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1358, 'english', 'Specification', 'Specification', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1360, 'english', 'Add some listing features', 'Add some listing features', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1362, 'english', 'Add New Feature', 'Add New Feature', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1364, 'english', 'Add Feature', 'Add Feature', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1366, 'english', 'Update Feature', 'Update Feature', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1368, 'english', 'Add New Sub Feature', 'Add New Sub Feature', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1370, 'english', 'Add some listing specification', 'Add some listing specification', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1372, 'english', 'Add New Specification', 'Add New Specification', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1374, 'english', 'Add Specification', 'Add Specification', '2024-07-17 08:30:30', '2024-07-17 08:30:30'),
(1376, 'english', 'Enter listing sub title', 'Enter listing sub title', '2024-07-17 08:33:52', '2024-07-17 08:33:52'),
(1378, 'english', 'Listing Update successfully!', 'Listing Update successfully!', '2024-07-17 08:34:21', '2024-07-17 08:34:21'),
(1380, 'english', 'Update Specification', 'Update Specification', '2024-07-17 08:34:42', '2024-07-17 08:34:42'),
(1382, 'english', 'Add New Sub Specification', 'Add New Sub Specification', '2024-07-17 08:34:42', '2024-07-17 08:34:42'),
(1384, 'english', 'City Lists', 'City Lists', '2024-07-17 08:36:01', '2024-07-17 08:36:01'),
(1386, 'english', 'Add New City', 'Add New City', '2024-07-17 08:36:01', '2024-07-17 08:36:01'),
(1388, 'english', 'City Name', 'City Name', '2024-07-17 08:36:01', '2024-07-17 08:36:01'),
(1390, 'english', 'Edit City', 'Edit City', '2024-07-17 08:36:01', '2024-07-17 08:36:01');
INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(1392, 'english', 'Listing price', 'Listing price', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1394, 'english', 'Enter listing price', 'Enter listing price', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1396, 'english', 'Bed number', 'Bed number', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1398, 'english', 'Enter bed number', 'Enter bed number', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1400, 'english', 'bath number', 'bath number', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1402, 'english', 'Enter bath number', 'Enter bath number', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1404, 'english', 'Floor Size', 'Floor Size', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1406, 'english', 'Enter floor size', 'Enter floor size', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1408, 'english', 'Dimension', 'Dimension', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1410, 'english', 'Enter property dimension', 'Enter property dimension', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1412, 'english', 'Write your description', 'Write your description', '2024-07-18 05:34:24', '2024-07-18 05:34:24'),
(1414, 'english', 'Listing Created successfully!', 'Listing Created successfully!', '2024-07-18 05:35:28', '2024-07-18 05:35:28'),
(1416, 'english', 'Rooms', 'Rooms', '2024-07-18 05:53:09', '2024-07-18 05:53:09'),
(1418, 'english', 'Garage', 'Garage', '2024-07-18 05:53:09', '2024-07-18 05:53:09'),
(1420, 'english', 'Add some listing feature', 'Add some listing feature', '2024-07-18 05:53:09', '2024-07-18 05:53:09'),
(1422, 'english', 'Add some room', 'Add some room', '2024-07-18 05:53:10', '2024-07-18 05:53:10'),
(1424, 'english', 'Add New Room', 'Add New Room', '2024-07-18 05:53:10', '2024-07-18 05:53:10'),
(1426, 'english', 'Add Room', 'Add Room', '2024-07-18 05:53:10', '2024-07-18 05:53:10'),
(1428, 'english', 'More', 'More', '2024-07-18 06:23:17', '2024-07-18 06:23:17'),
(1430, 'english', 'See Details', 'See Details', '2024-07-18 06:34:13', '2024-07-18 06:34:13'),
(1432, 'english', 'night', 'night', '2024-07-18 06:34:13', '2024-07-18 06:34:13'),
(1434, 'english', 'Listings on Map', 'Listings on Map', '2024-07-18 06:35:16', '2024-07-18 06:35:16'),
(1436, 'english', 'Bed', 'Bed', '2024-07-18 07:50:23', '2024-07-18 07:50:23'),
(1438, 'english', 'Bath', 'Bath', '2024-07-18 07:50:23', '2024-07-18 07:50:23'),
(1440, 'english', 'sqft', 'sqft', '2024-07-18 07:50:23', '2024-07-18 07:50:23'),
(1442, 'english', 'Restaurant Listings', 'Restaurant Listings', '2024-07-25 11:18:26', '2024-07-25 11:18:26'),
(1444, 'english', 'Add New Package', 'Add New Package', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1446, 'english', 'Period', 'Period', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1448, 'english', 'listing Amount', 'listing Amount', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1450, 'english', 'Category Amount', 'Category Amount', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1452, 'english', 'Feature', 'Feature', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1454, 'english', 'Contact', 'Contact', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1456, 'english', 'Video', 'Video', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1458, 'english', 'Choice', 'Choice', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1460, 'english', 'Update Package', 'Update Package', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1462, 'english', 'Best Choice', 'Best Choice', '2024-07-29 07:02:10', '2024-07-29 07:02:10'),
(1464, 'english', 'Menu', 'Menu', '2024-07-29 10:20:08', '2024-07-29 10:20:08'),
(1466, 'english', 'Add some menu for restaurant', 'Add some menu for restaurant', '2024-07-29 10:20:08', '2024-07-29 10:20:08'),
(1468, 'english', 'Add New Menu', 'Add New Menu', '2024-07-29 10:20:08', '2024-07-29 10:20:08'),
(1470, 'english', 'Add menu', 'Add menu', '2024-07-29 10:20:08', '2024-07-29 10:20:08'),
(1472, 'english', 'Update Menu', 'Update Menu', '2024-07-29 10:20:08', '2024-07-29 10:20:08'),
(1474, 'english', 'Menu title', 'Menu title', '2024-07-29 10:20:16', '2024-07-29 10:20:16'),
(1476, 'english', 'Enter menu title', 'Enter menu title', '2024-07-29 10:20:16', '2024-07-29 10:20:16'),
(1478, 'english', 'Menu Sub title', 'Menu Sub title', '2024-07-29 10:20:16', '2024-07-29 10:20:16'),
(1480, 'english', 'Enter sub title', 'Enter sub title', '2024-07-29 10:20:16', '2024-07-29 10:20:16'),
(1482, 'english', 'Menu price', 'Menu price', '2024-07-29 10:20:16', '2024-07-29 10:20:16'),
(1484, 'english', 'Enter menu price', 'Enter menu price', '2024-07-29 10:20:16', '2024-07-29 10:20:16'),
(1486, 'english', 'Menu discount price', 'Menu discount price', '2024-07-29 10:20:17', '2024-07-29 10:20:17'),
(1488, 'english', 'Enter menu discount price', 'Enter menu discount price', '2024-07-29 10:20:17', '2024-07-29 10:20:17'),
(1490, 'english', 'Specification value', 'Specification value', '2024-07-29 10:20:17', '2024-07-29 10:20:17'),
(1492, 'english', 'Listing menu create successful!', 'Listing menu create successful!', '2024-07-29 10:20:40', '2024-07-29 10:20:40'),
(1494, 'english', 'Amenities Create', 'Amenities Create', '2024-07-29 10:25:59', '2024-07-29 10:25:59'),
(1496, 'english', 'Amenities Name', 'Amenities Name', '2024-07-29 10:26:15', '2024-07-29 10:26:15'),
(1498, 'english', 'Amenities icon', 'Amenities icon', '2024-07-29 10:26:15', '2024-07-29 10:26:15'),
(1500, 'english', 'Pick an Icon', 'Pick an Icon', '2024-07-29 10:26:15', '2024-07-29 10:26:15'),
(1502, 'english', 'Amenities Created Successful!', 'Amenities Created Successful!', '2024-07-29 10:26:25', '2024-07-29 10:26:25'),
(1504, 'english', 'Add some feature for restaurant', 'Add some feature for restaurant', '2024-07-29 10:32:38', '2024-07-29 10:32:38'),
(1506, 'english', 'Sub Dimension', 'Sub Dimension', '2024-07-29 10:33:54', '2024-07-29 10:33:54'),
(1508, 'english', 'Enter property sub dimension', 'Enter property sub dimension', '2024-07-29 10:33:54', '2024-07-29 10:33:54'),
(1510, 'english', 'Add some feature', 'Add some feature', '2024-07-29 10:33:56', '2024-07-29 10:33:56'),
(1512, 'english', 'Floor Plan', 'Floor Plan', '2024-07-29 10:33:56', '2024-07-29 10:33:56'),
(1514, 'english', 'Listing feature create successful!', 'Listing feature create successful!', '2024-07-29 10:36:29', '2024-07-29 10:36:29'),
(1516, 'english', 'Categories', 'Categories', '2024-07-30 08:06:19', '2024-07-30 08:06:19'),
(1518, 'english', 'Category Create', 'Category Create', '2024-07-30 08:06:19', '2024-07-30 08:06:19'),
(1520, 'english', 'Add New Category', 'Add New Category', '2024-07-30 08:06:19', '2024-07-30 08:06:19'),
(1522, 'english', 'Parent', 'Parent', '2024-07-30 08:06:19', '2024-07-30 08:06:19'),
(1524, 'english', 'Type', 'Type', '2024-07-30 08:06:19', '2024-07-30 08:06:19'),
(1526, 'english', 'Edit Category', 'Edit Category', '2024-07-30 08:06:19', '2024-07-30 08:06:19'),
(1528, 'english', 'Add New agent', 'Add New agent', '2024-07-30 08:16:42', '2024-07-30 08:16:42'),
(1530, 'english', 'No data found', 'No data found', '2024-07-30 08:16:42', '2024-07-30 08:16:42'),
(1532, 'english', 'Pending', 'Pending', '2024-07-30 08:17:50', '2024-07-30 08:17:50'),
(1534, 'english', 'Add Blog', 'Add Blog', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1536, 'english', 'back', 'back', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1538, 'english', 'Blog Title', 'Blog Title', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1540, 'english', 'Enter blog title', 'Enter blog title', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1542, 'english', 'Select blog category', 'Select blog category', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1544, 'english', 'Blog Description', 'Blog Description', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1546, 'english', 'Blog Keyword', 'Blog Keyword', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1548, 'english', 'Keyword will be:- keyword1; keyword2; keyword3', 'Keyword will be:- keyword1; keyword2; keyword3', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1550, 'english', 'Blog Banner', 'Blog Banner', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1552, 'english', 'Write Blog description', 'Write Blog description', '2024-07-30 08:17:53', '2024-07-30 08:17:53'),
(1554, 'english', 'Doctor Listings', 'Doctor Listings', '2024-07-30 10:51:51', '2024-07-30 10:51:51'),
(1556, 'english', 'Categories par listing', 'Categories par listing', '2024-07-31 13:00:25', '2024-07-31 13:00:25'),
(1558, 'english', 'Contact Form', 'Contact Form', '2024-07-31 13:02:52', '2024-07-31 13:02:52'),
(1560, 'english', 'Listing Video', 'Listing Video', '2024-07-31 13:03:55', '2024-07-31 13:03:55'),
(1562, 'english', 'Blog Details', 'Blog Details', '2024-08-01 07:55:55', '2024-08-01 07:55:55'),
(1564, 'english', 'Update Blog', 'Update Blog', '2024-08-04 04:39:28', '2024-08-04 04:39:28'),
(1566, 'english', 'Blog Create successfully!', 'Blog Create successfully!', '2024-08-04 04:39:31', '2024-08-04 04:39:31'),
(1568, 'english', 'Status successful!', 'Status successful!', '2024-08-04 04:39:44', '2024-08-04 04:39:44'),
(1570, 'english', 'Read More', 'Read More', '2024-08-04 04:51:14', '2024-08-04 04:51:14'),
(1572, 'english', 'Search', 'Search', '2024-08-04 05:06:01', '2024-08-04 05:06:01'),
(1574, 'english', 'Resent Post', 'Resent Post', '2024-08-04 14:20:47', '2024-08-04 14:20:47'),
(1576, 'english', 'Listing Details', 'Listing Details', '2024-08-06 07:35:49', '2024-08-06 07:35:49'),
(1578, 'english', 'Related Property', 'Related Property', '2024-08-06 09:50:35', '2024-08-06 09:50:35'),
(1580, 'english', 'Hotel Home Page', 'Hotel Home Page', '2024-09-15 10:35:16', '2024-09-15 10:35:16'),
(1582, 'english', 'Home', 'Home', '2024-09-17 06:42:10', '2024-09-17 06:42:10'),
(1584, 'english', 'Office \n                    Address', 'Office \n                    Address', '2024-09-17 07:24:39', '2024-09-17 07:24:39'),
(1586, 'english', 'Category name', 'Category name', '2024-09-17 09:23:30', '2024-09-17 09:23:30'),
(1588, 'english', 'Category parent', 'Category parent', '2024-09-17 09:23:30', '2024-09-17 09:23:30'),
(1590, 'english', 'Select Category parent', 'Select Category parent', '2024-09-17 09:23:30', '2024-09-17 09:23:30'),
(1592, 'english', 'Enter City Name', 'Enter City Name', '2024-09-17 12:16:28', '2024-09-17 12:16:28'),
(1594, 'english', 'Country Name', 'Country Name', '2024-09-17 12:16:28', '2024-09-17 12:16:28'),
(1596, 'english', 'Select Country Name', 'Select Country Name', '2024-09-17 12:16:28', '2024-09-17 12:16:28'),
(1598, 'english', 'Customer Wishlist', 'Customer Wishlist', '2024-09-18 11:48:25', '2024-09-18 11:48:25'),
(1600, 'english', 'Add New customer', 'Add New customer', '2024-09-21 11:12:57', '2024-09-21 11:12:57'),
(1602, 'english', 'User Created successfully!', 'User Created successfully!', '2024-09-21 11:14:03', '2024-09-21 11:14:03'),
(1604, 'english', 'Email', 'Email', '2024-09-21 11:14:03', '2024-09-21 11:14:03'),
(1606, 'english', 'Edit User', 'Edit User', '2024-09-21 11:14:03', '2024-09-21 11:14:03'),
(1608, 'english', 'Inactive', 'Inactive', '2024-09-21 11:14:03', '2024-09-21 11:14:03'),
(1610, 'english', 'Blocked', 'Blocked', '2024-09-21 11:14:03', '2024-09-21 11:14:03'),
(1612, 'english', 'Enter Category Name', 'Enter Category Name', '2024-09-22 10:56:03', '2024-09-22 10:56:03'),
(1614, 'english', 'Category added successfully!', 'Category added successfully!', '2024-09-22 10:56:15', '2024-09-22 10:56:15'),
(1616, 'english', 'All Category', 'All Category', '2024-09-23 09:55:56', '2024-09-23 09:55:56'),
(1618, 'english', 'Atlas Login', 'Atlas Login', '2024-09-23 10:38:10', '2024-09-23 10:38:10'),
(1620, 'english', 'Password', 'Password', '2024-09-23 10:48:53', '2024-09-23 10:48:53'),
(1622, 'english', 'Forget your password', 'Forget your password', '2024-09-23 10:48:53', '2024-09-23 10:48:53'),
(1624, 'english', 'I agree to the', 'I agree to the', '2024-09-23 10:52:50', '2024-09-23 10:52:50'),
(1626, 'english', 'Terms & Policy', 'Terms & Policy', '2024-09-23 10:52:50', '2024-09-23 10:52:50'),
(1628, 'english', 'Login', 'Login', '2024-09-23 10:55:50', '2024-09-23 10:55:50'),
(1630, 'english', 'Don\'t an account', 'Don\'t an account', '2024-09-23 10:55:50', '2024-09-23 10:55:50'),
(1632, 'english', 'Sign up', 'Sign up', '2024-09-23 10:55:50', '2024-09-23 10:55:50'),
(1634, 'english', 'Get Started Now', 'Get Started Now', '2024-09-23 11:19:16', '2024-09-23 11:19:16'),
(1636, 'english', 'Enter your credentials to access your account', 'Enter your credentials to access your account', '2024-09-23 11:19:16', '2024-09-23 11:19:16'),
(1638, 'english', 'Register', 'Register', '2024-09-23 11:22:39', '2024-09-23 11:22:39'),
(1640, 'english', 'Logout', 'Logout', '2024-09-23 11:51:20', '2024-09-23 11:51:20'),
(1642, 'english', 'Forget Password', 'Forget Password', '2024-09-23 12:13:10', '2024-09-23 12:13:10'),
(1644, 'english', 'Enter your email address to receive a verification  code', 'Enter your email address to receive a verification  code', '2024-09-23 12:13:10', '2024-09-23 12:13:10'),
(1646, 'english', 'Send', 'Send', '2024-09-23 12:13:10', '2024-09-23 12:13:10'),
(1648, 'english', 'Member', 'Member', '2024-09-24 06:35:25', '2024-09-24 06:35:25'),
(1650, 'english', 'Team Member', 'Team Member', '2024-09-24 06:35:25', '2024-09-24 06:35:25'),
(1652, 'english', 'Service', 'Service', '2024-09-24 06:35:25', '2024-09-24 06:35:25'),
(1654, 'english', 'Designation', 'Designation', '2024-09-24 06:35:25', '2024-09-24 06:35:25'),
(1656, 'english', 'Rating', 'Rating', '2024-09-24 06:35:25', '2024-09-24 06:35:25'),
(1658, 'english', 'Enter team member name', 'Enter team member name', '2024-09-24 06:35:28', '2024-09-24 06:35:28'),
(1660, 'english', 'Enter team member designation', 'Enter team member designation', '2024-09-24 06:35:28', '2024-09-24 06:35:28'),
(1662, 'english', 'Select rating', 'Select rating', '2024-09-24 06:35:28', '2024-09-24 06:35:28'),
(1664, 'english', '1.0', '1.0', '2024-09-24 06:35:28', '2024-09-24 06:35:28'),
(1666, 'english', '2.0', '2.0', '2024-09-24 06:35:28', '2024-09-24 06:35:28'),
(1668, 'english', '3.0', '3.0', '2024-09-24 06:35:28', '2024-09-24 06:35:28'),
(1670, 'english', '4.0', '4.0', '2024-09-24 06:35:28', '2024-09-24 06:35:28'),
(1672, 'english', '5.0', '5.0', '2024-09-24 06:35:28', '2024-09-24 06:35:28'),
(1674, 'english', 'Price List', 'Price List', '2024-09-24 07:12:36', '2024-09-24 07:12:36'),
(1676, 'english', 'Package name', 'Package name', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1678, 'english', 'Enter package name', 'Enter package name', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1680, 'english', 'Package sub title', 'Package sub title', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1682, 'english', 'Package Price', 'Package Price', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1684, 'english', 'Enter price', 'Enter price', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1686, 'english', 'Package Period', 'Package Period', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1688, 'english', 'Monthly', 'Monthly', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1690, 'english', 'Semi Annually', 'Semi Annually', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1692, 'english', 'Annually', 'Annually', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1694, 'english', 'Listing Number', 'Listing Number', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1696, 'english', 'Enter listing number', 'Enter listing number', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1698, 'english', 'Category Number', 'Category Number', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1700, 'english', 'Enter category number', 'Enter category number', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1702, 'english', 'Featured Listings', 'Featured Listings', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1704, 'english', 'Unavailable', 'Unavailable', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1706, 'english', 'Available', 'Available', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1708, 'english', 'Listings Video', 'Listings Video', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1710, 'english', 'No', 'No', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1712, 'english', 'Yes', 'Yes', '2024-09-24 07:12:40', '2024-09-24 07:12:40'),
(1714, 'english', 'Package List', 'Package List', '2024-09-24 07:13:07', '2024-09-24 07:13:07'),
(1716, 'english', 'Add New doctor', 'Add New doctor', '2024-09-24 07:14:00', '2024-09-24 07:14:00'),
(1718, 'english', 'Blog Categories', 'Blog Categories', '2024-09-24 07:28:44', '2024-09-24 07:28:44'),
(1720, 'english', 'Blog Category Create', 'Blog Category Create', '2024-09-24 07:28:44', '2024-09-24 07:28:44'),
(1722, 'english', 'Number Blogs', 'Number Blogs', '2024-09-24 07:28:44', '2024-09-24 07:28:44'),
(1724, 'english', 'Total number of blogs : 0', 'Total number of blogs : 0', '2024-09-24 07:28:44', '2024-09-24 07:28:44'),
(1726, 'english', 'Profile Update successfully!', 'Profile Update successfully!', '2024-09-24 07:52:16', '2024-09-24 07:52:16'),
(1728, 'english', 'Customer Booking', 'Customer Booking', '2024-09-24 09:46:38', '2024-09-24 09:46:38'),
(1730, 'english', 'Agent Bookings', 'Agent Bookings', '2024-09-24 10:26:34', '2024-09-24 10:26:34'),
(1732, 'english', 'Agent Listings', 'Agent Listings', '2024-09-24 10:39:20', '2024-09-24 10:39:20'),
(1734, 'english', 'Subscriptions', 'Subscriptions', '2024-09-26 12:34:52', '2024-09-26 12:34:52'),
(1736, 'english', 'List of subscriptions', 'List of subscriptions', '2024-09-26 12:35:00', '2024-09-26 12:35:00'),
(1738, 'english', 'Buyer', 'Buyer', '2024-09-28 11:19:38', '2024-09-28 11:19:38'),
(1740, 'english', 'Package', 'Package', '2024-09-28 11:19:38', '2024-09-28 11:19:38'),
(1742, 'english', 'Amount Paid', 'Amount Paid', '2024-09-28 11:19:38', '2024-09-28 11:19:38'),
(1744, 'english', 'Reported Listings', 'Reported Listings', '2024-09-29 12:40:49', '2024-09-29 12:40:49'),
(1746, 'english', 'City Update successfully!', 'City Update successfully!', '2024-10-02 07:14:40', '2024-10-02 07:14:40'),
(1748, 'english', 'Edit Country', 'Edit Country', '2024-10-02 07:52:28', '2024-10-02 07:52:28'),
(1750, 'english', 'Choose country thumbnail', 'Choose country thumbnail', '2024-10-02 07:53:55', '2024-10-02 07:53:55'),
(1752, 'english', 'optional', 'optional', '2024-10-02 07:53:55', '2024-10-02 07:53:55'),
(1754, 'english', 'Country thumbnail update successfully!', 'Country thumbnail update successfully!', '2024-10-02 08:03:48', '2024-10-02 08:03:48'),
(1756, 'english', 'About', 'About', '2024-10-02 11:17:34', '2024-10-02 11:17:34'),
(1758, 'english', 'Not found', 'Not found', '2024-10-02 11:17:38', '2024-10-02 11:17:38'),
(1760, 'english', 'About This Application', 'About This Application', '2024-10-02 11:17:38', '2024-10-02 11:17:38'),
(1762, 'english', 'Software version', 'Software version', '2024-10-02 11:17:38', '2024-10-02 11:17:38'),
(1764, 'english', 'Laravel version', 'Laravel version', '2024-10-02 11:17:38', '2024-10-02 11:17:38'),
(1766, 'english', 'Check update', 'Check update', '2024-10-02 11:17:38', '2024-10-02 11:17:38'),
(1768, 'english', 'Php version', 'Php version', '2024-10-02 11:17:38', '2024-10-02 11:17:38'),
(1770, 'english', 'Curl enable', 'Curl enable', '2024-10-02 11:17:38', '2024-10-02 11:17:38'),
(1772, 'english', 'enabled', 'enabled', '2024-10-02 11:17:38', '2024-10-02 11:17:38'),
(1774, 'english', 'Product license', 'Product license', '2024-10-02 11:17:38', '2024-10-02 11:17:38'),
(1776, 'english', 'Enter valid purchase code', 'Enter valid purchase code', '2024-10-02 11:18:53', '2024-10-02 11:18:53'),
(1778, 'english', 'Customer support status', 'Customer support status', '2024-10-02 11:18:53', '2024-10-02 11:18:53'),
(1780, 'english', 'Support expiry date', 'Support expiry date', '2024-10-02 11:18:53', '2024-10-02 11:18:53'),
(1782, 'english', 'Customer name', 'Customer name', '2024-10-02 11:18:53', '2024-10-02 11:18:53'),
(1784, 'english', 'Get customer support', 'Get customer support', '2024-10-02 11:18:53', '2024-10-02 11:18:53'),
(1786, 'english', 'Customer support', 'Customer support', '2024-10-02 11:18:53', '2024-10-02 11:18:53'),
(1788, 'english', 'SEO Settings', 'SEO Settings', '2024-10-02 11:51:51', '2024-10-02 11:51:51'),
(1790, 'english', 'Manage SEO Settings', 'Manage SEO Settings', '2024-10-02 11:51:56', '2024-10-02 11:51:56'),
(1792, 'english', 'Writing your keyword and hit the enter', 'Writing your keyword and hit the enter', '2024-10-02 11:51:56', '2024-10-02 11:51:56'),
(1794, 'english', 'Meta Robot', 'Meta Robot', '2024-10-02 11:51:56', '2024-10-02 11:51:56'),
(1796, 'english', ' Canonical Url', ' Canonical Url', '2024-10-02 11:51:56', '2024-10-02 11:51:56'),
(1798, 'english', ' Custom Url', ' Custom Url', '2024-10-02 11:51:56', '2024-10-02 11:51:56'),
(1800, 'english', 'Submit', 'Submit', '2024-10-02 11:51:56', '2024-10-02 11:51:56'),
(1802, 'english', 'Enter your keywords', 'Enter your keywords', '2024-10-02 12:15:47', '2024-10-02 12:15:47'),
(1804, 'english', 'Amenities Updated Successful!', 'Amenities Updated Successful!', '2024-10-14 08:06:53', '2024-10-14 08:06:53'),
(1806, 'english', 'Listing sub title', 'Listing sub title', '2024-10-14 08:09:25', '2024-10-14 08:09:25'),
(1808, 'english', 'Payment', 'Payment', '2024-10-14 11:11:17', '2024-10-14 11:11:17'),
(1810, 'english', 'Payment Gateways List', 'Payment Gateways List', '2024-10-14 11:11:17', '2024-10-14 11:11:17'),
(1812, 'english', 'Currency', 'Currency', '2024-10-14 11:13:49', '2024-10-14 11:13:49'),
(1814, 'english', 'Change Status', 'Change Status', '2024-10-14 11:34:27', '2024-10-14 11:34:27'),
(1816, 'english', 'Status Changed successfully!', 'Status Changed successfully!', '2024-10-14 11:35:35', '2024-10-14 11:35:35'),
(1818, 'english', 'Credentials Update', 'Credentials Update', '2024-10-14 11:49:38', '2024-10-14 11:49:38'),
(1820, 'english', 'Payment currency', 'Payment currency', '2024-10-14 12:33:28', '2024-10-14 12:33:28'),
(1822, 'english', 'Public Key', 'Public Key', '2024-10-14 12:33:28', '2024-10-14 12:33:28'),
(1824, 'english', 'Secret Key', 'Secret Key', '2024-10-14 12:36:13', '2024-10-14 12:36:13'),
(1826, 'english', 'Public Live Key', 'Public Live Key', '2024-10-14 12:36:13', '2024-10-14 12:36:13'),
(1828, 'english', 'Package create successfully!', 'Package create successfully!', '2024-10-15 05:53:30', '2024-10-15 05:53:30'),
(1830, 'english', 'Listing Feature', 'Listing Feature', '2024-10-15 05:55:20', '2024-10-15 05:55:20'),
(1832, 'english', 'Package delete successfully!', 'Package delete successfully!', '2024-10-15 05:56:09', '2024-10-15 05:56:09'),
(1834, 'english', 'Payment credentials update successfully!', 'Payment credentials update successfully!', '2024-10-15 06:17:12', '2024-10-15 06:17:12'),
(1836, 'english', 'Try Now', 'Try Now', '2024-10-15 06:24:01', '2024-10-15 06:24:01'),
(1838, 'english', 'Order summary', 'Order summary', '2024-10-15 06:58:21', '2024-10-15 06:58:21'),
(1840, 'english', 'Cancel Payment', 'Cancel Payment', '2024-10-15 07:14:30', '2024-10-15 07:14:30'),
(1842, 'english', 'Select payment gateway', 'Select payment gateway', '2024-10-15 07:14:30', '2024-10-15 07:14:30'),
(1844, 'english', 'Item List', 'Item List', '2024-10-15 07:15:12', '2024-10-15 07:15:12'),
(1846, 'english', 'Total', 'Total', '2024-10-15 07:20:36', '2024-10-15 07:20:36'),
(1848, 'english', 'Grand Total', 'Grand Total', '2024-10-15 07:20:36', '2024-10-15 07:20:36'),
(1850, 'english', 'Package Details', 'Package Details', '2024-10-15 07:27:03', '2024-10-15 07:27:03'),
(1852, 'english', 'Subscription successfully!', 'Subscription successfully!', '2024-10-15 09:25:27', '2024-10-15 09:25:27'),
(1854, 'english', 'Current Package', 'Current Package', '2024-10-15 09:31:14', '2024-10-15 09:31:14'),
(1856, 'english', 'Become an agent', 'Become an agent', '2024-10-15 11:10:46', '2024-10-15 11:10:46'),
(1858, 'english', 'My Agent Panel', 'My Agent Panel', '2024-10-16 07:46:01', '2024-10-16 07:46:01'),
(1860, 'english', 'My Listing', 'My Listing', '2024-10-16 07:46:01', '2024-10-16 07:46:01'),
(1862, 'english', 'Listing Create Form', 'Listing Create Form', '2024-10-16 09:46:51', '2024-10-16 09:46:51'),
(1864, 'english', 'Hide', 'Hide', '2024-10-17 10:52:24', '2024-10-17 10:52:24'),
(1866, 'english', 'Edit Listing', 'Edit Listing', '2024-10-17 10:53:16', '2024-10-17 10:53:16'),
(1868, 'english', 'Remove Listing', 'Remove Listing', '2024-10-17 10:53:16', '2024-10-17 10:53:16'),
(1870, 'english', 'Upload Product Image', 'Upload Product Image', '2024-10-20 04:45:59', '2024-10-20 04:45:59'),
(1872, 'english', 'Listing deleted successfully!', 'Listing deleted successfully!', '2024-10-20 10:11:22', '2024-10-20 10:11:22'),
(1874, 'english', 'Open Time', 'Open Time', '2024-10-21 06:28:50', '2024-10-21 06:28:50'),
(1876, 'english', 'Feature title', 'Feature title', '2024-10-21 11:33:45', '2024-10-21 11:33:45'),
(1878, 'english', 'Enter title', 'Enter title', '2024-10-21 11:33:45', '2024-10-21 11:33:45'),
(1880, 'english', 'Listing feature add successful!', 'Listing feature add successful!', '2024-10-21 11:33:58', '2024-10-21 11:33:58'),
(1882, 'english', 'Specification title', 'Specification title', '2024-10-21 11:34:19', '2024-10-21 11:34:19'),
(1884, 'english', 'Listing specification add successful!', 'Listing specification add successful!', '2024-10-21 11:34:22', '2024-10-21 11:34:22'),
(1886, 'english', 'Listing sub feature add successful!', 'Listing sub feature add successful!', '2024-10-21 11:34:33', '2024-10-21 11:34:33'),
(1888, 'english', 'Enter specification title', 'Enter specification title', '2024-10-21 11:37:41', '2024-10-21 11:37:41'),
(1890, 'english', 'Enter specification value', 'Enter specification value', '2024-10-21 11:37:41', '2024-10-21 11:37:41'),
(1892, 'english', 'Listing feature delete successful!', 'Listing feature delete successful!', '2024-10-22 11:40:17', '2024-10-22 11:40:17'),
(1894, 'english', 'Listing feature update successful!', 'Listing feature update successful!', '2024-10-22 12:14:41', '2024-10-22 12:14:41'),
(1896, 'english', 'Listing specification update successful!', 'Listing specification update successful!', '2024-10-23 06:07:45', '2024-10-23 06:07:45'),
(1898, 'english', 'Listing specification delete successful!', 'Listing specification delete successful!', '2024-10-23 06:07:55', '2024-10-23 06:07:55'),
(1900, 'english', 'Update Sub Specification', 'Update Sub Specification', '2024-10-23 07:21:54', '2024-10-23 07:21:54'),
(1902, 'english', 'Room Title', 'Room Title', '2024-10-27 05:55:09', '2024-10-27 05:55:09'),
(1904, 'english', 'Enter room title', 'Enter room title', '2024-10-27 05:55:09', '2024-10-27 05:55:09'),
(1906, 'english', 'Number of persons', 'Number of persons', '2024-10-27 05:55:09', '2024-10-27 05:55:09'),
(1908, 'english', 'Enter number of person (2 adult, 1 Child)', 'Enter number of person (2 adult, 1 Child)', '2024-10-27 05:55:09', '2024-10-27 05:55:09'),
(1910, 'english', 'Room Price', 'Room Price', '2024-10-27 05:55:09', '2024-10-27 05:55:09'),
(1912, 'english', 'Enter room price', 'Enter room price', '2024-10-27 05:55:09', '2024-10-27 05:55:09'),
(1914, 'english', 'Room Images', 'Room Images', '2024-10-27 05:55:09', '2024-10-27 05:55:09'),
(1916, 'english', 'Hotel room create successful!', 'Hotel room create successful!', '2024-10-27 05:56:26', '2024-10-27 05:56:26'),
(1918, 'english', 'Update Room', 'Update Room', '2024-10-27 07:37:52', '2024-10-27 07:37:52'),
(1920, 'english', 'Listing room delete successful!', 'Listing room delete successful!', '2024-10-27 07:43:32', '2024-10-27 07:43:32'),
(1922, 'english', 'Subscription', 'Subscription', '2024-10-27 12:02:39', '2024-10-27 12:02:39'),
(1924, 'english', 'Listing menu delete successful!', 'Listing menu delete successful!', '2024-10-28 06:26:24', '2024-10-28 06:26:24'),
(1926, 'english', 'Listing menu update successful!', 'Listing menu update successful!', '2024-10-28 06:27:11', '2024-10-28 06:27:11'),
(1928, 'english', 'Expired Subscription', 'Expired Subscription', '2024-10-28 07:16:45', '2024-10-28 07:16:45'),
(1930, 'english', 'Your subscription has expired', 'Your subscription has expired', '2024-10-28 07:16:45', '2024-10-28 07:16:45'),
(1932, 'english', 'Your package has expired, please renew your package', 'Your package has expired, please renew your package', '2024-10-28 07:16:45', '2024-10-28 07:16:45'),
(1934, 'english', 'Renew Subscription', 'Renew Subscription', '2024-10-28 07:16:45', '2024-10-28 07:16:45'),
(1936, 'english', 'Payment Method', 'Payment Method', '2024-10-28 07:16:45', '2024-10-28 07:16:45'),
(1938, 'english', 'Invoicing', 'Invoicing', '2024-10-28 07:19:01', '2024-10-28 07:19:01'),
(1940, 'english', 'Last payment:', 'Last payment:', '2024-10-28 07:19:01', '2024-10-28 07:19:01'),
(1942, 'english', 'Modify Billing Information', 'Modify Billing Information', '2024-10-28 07:20:27', '2024-10-28 07:20:27'),
(1944, 'english', 'Billing History', 'Billing History', '2024-10-28 07:20:27', '2024-10-28 07:20:27'),
(1946, 'english', 'Reference', 'Reference', '2024-10-28 07:20:27', '2024-10-28 07:20:27'),
(1948, 'english', 'Date', 'Date', '2024-10-28 07:20:27', '2024-10-28 07:20:27'),
(1950, 'english', 'Download', 'Download', '2024-10-28 07:20:27', '2024-10-28 07:20:27'),
(1952, 'english', '6', '6', '2024-10-28 07:31:40', '2024-10-28 07:31:40'),
(1954, 'english', 'Naomi Black', 'Naomi Black', '2024-10-28 07:33:15', '2024-10-28 07:33:15'),
(1956, 'english', 'Account', 'Account', '2024-10-28 07:33:15', '2024-10-28 07:33:15'),
(1958, 'english', NULL, NULL, '2024-10-28 07:33:15', '2024-10-28 07:33:15'),
(1960, 'english', 'Plan', 'Plan', '2024-10-28 07:33:15', '2024-10-28 07:33:15'),
(1962, 'english', 'Your current package price is', 'Your current package price is', '2024-10-28 07:33:15', '2024-10-28 07:33:15'),
(1964, 'english', 'It will expired on ', 'It will expired on ', '2024-10-28 07:33:15', '2024-10-28 07:33:15'),
(1970, 'english', 'Agent Subscription', 'Agent Subscription', '2024-10-28 08:04:28', '2024-10-28 08:04:28'),
(1974, 'english', 'semiannually', 'semiannually', '2024-10-28 08:07:23', '2024-10-28 08:07:23'),
(1976, 'english', 'Subscription Renew', 'Subscription Renew', '2024-10-28 09:22:40', '2024-10-28 09:22:40'),
(1978, 'english', 'Billing Information', 'Billing Information', '2024-10-28 09:23:09', '2024-10-28 09:23:09'),
(1980, 'english', 'Lorem Ipsum available but the majority have suffered\r\n                              alteration', 'Lorem Ipsum available but the majority have suffered\r\n                              alteration', '2024-10-28 09:23:09', '2024-10-28 09:23:09'),
(1982, 'english', 'Billing Email', 'Billing Email', '2024-10-28 09:24:09', '2024-10-28 09:24:09'),
(1984, 'english', 'State', 'State', '2024-10-28 09:32:48', '2024-10-28 09:32:48'),
(1986, 'english', 'Save Changes', 'Save Changes', '2024-10-28 09:33:34', '2024-10-28 09:33:34'),
(1988, 'english', 'Panel', 'Panel', '2024-10-28 10:21:38', '2024-10-28 10:21:38'),
(1990, 'english', 'INVOICE', 'INVOICE', '2024-10-28 10:21:38', '2024-10-28 10:21:38'),
(1992, 'english', 'Dear', 'Dear', '2024-10-28 10:21:38', '2024-10-28 10:21:38'),
(1994, 'english', 'Please find below the invoice', 'Please find below the invoice', '2024-10-28 10:21:38', '2024-10-28 10:21:38'),
(1996, 'english', 'Billing Address', 'Billing Address', '2024-10-28 10:21:38', '2024-10-28 10:21:38'),
(1998, 'english', 'Address line', 'Address line', '2024-10-28 10:23:41', '2024-10-28 10:23:41'),
(2000, 'english', 'Paid', 'Paid', '2024-10-28 10:23:41', '2024-10-28 10:23:41'),
(2002, 'english', 'Invoice no', 'Invoice no', '2024-10-28 10:23:41', '2024-10-28 10:23:41'),
(2004, 'english', 'Total Amount', 'Total Amount', '2024-10-28 10:23:41', '2024-10-28 10:23:41'),
(2006, 'english', 'Paid Amount', 'Paid Amount', '2024-10-28 10:23:41', '2024-10-28 10:23:41'),
(2008, 'english', 'Subtotal', 'Subtotal', '2024-10-28 10:27:39', '2024-10-28 10:27:39'),
(2010, 'english', 'Lorem Ipsum available but the majority have suffered\r\n                                alteration', 'Lorem Ipsum available but the majority have suffered\r\n                                alteration', '2024-10-28 10:58:16', '2024-10-28 10:58:16'),
(2012, 'english', 'Profile update', 'Profile update', '2024-10-29 05:30:36', '2024-10-29 05:30:36'),
(2014, 'english', 'Full name', 'Full name', '2024-10-29 05:52:02', '2024-10-29 05:52:02'),
(2016, 'english', 'Phone', 'Phone', '2024-10-29 05:52:53', '2024-10-29 05:52:53'),
(2018, 'english', 'Facebook', 'Facebook', '2024-10-29 05:52:54', '2024-10-29 05:52:54'),
(2020, 'english', 'Twitter', 'Twitter', '2024-10-29 05:52:54', '2024-10-29 05:52:54'),
(2022, 'english', 'Linkedin', 'Linkedin', '2024-10-29 05:52:54', '2024-10-29 05:52:54'),
(2024, 'english', 'Website', 'Website', '2024-10-29 05:52:54', '2024-10-29 05:52:54'),
(2026, 'english', 'Gender', 'Gender', '2024-10-29 05:52:54', '2024-10-29 05:52:54'),
(2028, 'english', 'Other', 'Other', '2024-10-29 05:52:54', '2024-10-29 05:52:54'),
(2030, 'english', 'Bio', 'Bio', '2024-10-29 05:52:54', '2024-10-29 05:52:54'),
(2032, 'english', 'Profile Photo', 'Profile Photo', '2024-10-29 05:52:54', '2024-10-29 05:52:54'),
(2034, 'english', 'Company Logo (160 X 160)', 'Company Logo (160 X 160)', '2024-10-29 05:52:54', '2024-10-29 05:52:54'),
(2036, 'english', 'Old Password', 'Old Password', '2024-10-29 09:19:56', '2024-10-29 09:19:56'),
(2038, 'english', 'Appointment', 'Appointment', '2024-10-29 09:35:35', '2024-10-29 09:35:35'),
(2040, 'english', 'Agent Appontment', 'Agent Appontment', '2024-10-29 09:36:19', '2024-10-29 09:36:19'),
(2042, 'english', 'Agent Appointment', 'Agent Appointment', '2024-10-29 09:36:31', '2024-10-29 09:36:31'),
(2044, 'english', 'Not start yet', 'Not start yet', '2024-10-29 10:32:32', '2024-10-29 10:32:32'),
(2046, 'english', 'View Listing', 'View Listing', '2024-10-29 10:45:41', '2024-10-29 10:45:41'),
(2048, 'english', 'Email Address', 'Email Address', '2024-10-29 10:45:41', '2024-10-29 10:45:41'),
(2050, 'english', 'Remove', 'Remove', '2024-10-29 10:45:41', '2024-10-29 10:45:41'),
(2052, 'english', 'Successfully Ended', 'Successfully Ended', '2024-10-29 10:53:06', '2024-10-29 10:53:06'),
(2054, 'english', 'Number', 'Number', '2024-10-29 11:10:14', '2024-10-29 11:10:14'),
(2056, 'english', 'Customer Phone Number', 'Customer Phone Number', '2024-10-29 11:14:00', '2024-10-29 11:14:00'),
(2058, 'english', 'Customer Email Address', 'Customer Email Address', '2024-10-29 11:14:00', '2024-10-29 11:14:00'),
(2060, 'english', 'Meeting Link', 'Meeting Link', '2024-10-29 11:35:16', '2024-10-29 11:35:16'),
(2062, 'english', 'Enter Meeting link', 'Enter Meeting link', '2024-10-29 11:35:20', '2024-10-29 11:35:20'),
(2064, 'english', 'Blog', 'Blog', '2024-10-30 05:47:23', '2024-10-30 05:47:23'),
(2066, 'english', 'Booking', 'Booking', '2024-10-30 05:49:14', '2024-10-30 05:49:14'),
(2068, 'english', 'Create blog', 'Create blog', '2024-10-30 06:05:15', '2024-10-30 06:05:15'),
(2070, 'english', 'Create Blogs', 'Create Blogs', '2024-10-30 06:07:20', '2024-10-30 06:07:20'),
(2072, 'english', 'On Review', 'On Review', '2024-10-30 07:00:44', '2024-10-30 07:00:44'),
(2074, 'english', 'Keywords', 'Keywords', '2024-10-30 07:01:14', '2024-10-30 07:01:14'),
(2076, 'english', 'Remove blog', 'Remove blog', '2024-10-30 07:07:23', '2024-10-30 07:07:23'),
(2078, 'english', 'Blog deleted successfully!', 'Blog deleted successfully!', '2024-10-30 07:07:27', '2024-10-30 07:07:27'),
(2080, 'english', 'Update Blogs', 'Update Blogs', '2024-10-30 07:23:18', '2024-10-30 07:23:18'),
(2082, 'english', 'Customer Appointment', 'Customer Appointment', '2024-10-30 07:41:44', '2024-10-30 07:41:44'),
(2084, 'english', 'Details', 'Details', '2024-10-30 07:46:23', '2024-10-30 07:46:23'),
(2086, 'english', 'Link Update successfully!', 'Link Update successfully!', '2024-10-30 11:21:56', '2024-10-30 11:21:56'),
(2088, 'english', 'Message', 'Message', '2024-10-31 07:31:54', '2024-10-31 07:31:54'),
(2090, 'english', 'Messages', 'Messages', '2024-10-31 07:33:57', '2024-10-31 07:33:57'),
(2092, 'english', 'Frontend Settings', 'Frontend Settings', '2024-11-03 07:24:52', '2024-11-03 07:24:52'),
(2094, 'english', 'Motivational Speech', 'Motivational Speech', '2024-11-03 07:24:52', '2024-11-03 07:24:52'),
(2096, 'english', 'Website FAQS', 'Website FAQS', '2024-11-03 07:24:52', '2024-11-03 07:24:52'),
(2098, 'english', 'Contact Information', 'Contact Information', '2024-11-03 07:24:52', '2024-11-03 07:24:52'),
(2100, 'english', 'Logo & Images', 'Logo & Images', '2024-11-03 07:24:52', '2024-11-03 07:24:52'),
(2102, 'english', 'User Reviews', 'User Reviews', '2024-11-03 07:24:52', '2024-11-03 07:24:52'),
(2104, 'english', 'Update Settings', 'Update Settings', '2024-11-03 07:30:41', '2024-11-03 07:30:41'),
(2106, 'english', 'Restaurant', 'Restaurant', '2024-11-03 07:47:41', '2024-11-03 07:47:41'),
(2108, 'english', 'Mother Home Banner', 'Mother Home Banner', '2024-11-03 08:11:11', '2024-11-03 08:11:11'),
(2110, 'english', 'Mother Homepage Banner', 'Mother Homepage Banner', '2024-11-03 08:12:48', '2024-11-03 08:12:48'),
(2112, 'english', 'photo', 'photo', '2024-11-03 09:16:55', '2024-11-03 09:16:55'),
(2114, 'english', 'Setting updated successfully!', 'Setting updated successfully!', '2024-11-03 09:48:17', '2024-11-03 09:48:17'),
(2116, 'english', 'Add New Banner', 'Add New Banner', '2024-11-03 10:57:33', '2024-11-03 10:57:33'),
(2118, 'english', 'Update Banner', 'Update Banner', '2024-11-03 11:49:07', '2024-11-03 11:49:07'),
(2120, 'english', 'Banner updated successfully!', 'Banner updated successfully!', '2024-11-03 12:06:02', '2024-11-03 12:06:02'),
(2122, 'english', 'Banner deleted successfully!', 'Banner deleted successfully!', '2024-11-03 12:19:26', '2024-11-03 12:19:26'),
(2124, 'english', 'Upload light logo', 'Upload light logo', '2024-11-04 05:12:20', '2024-11-04 05:12:20'),
(2126, 'english', 'Save Change', 'Save Change', '2024-11-04 05:17:25', '2024-11-04 05:17:25'),
(2128, 'english', 'Upload Dark logo', 'Upload Dark logo', '2024-11-04 05:18:10', '2024-11-04 05:18:10'),
(2130, 'english', 'Upload favicon', 'Upload favicon', '2024-11-04 05:18:10', '2024-11-04 05:18:10'),
(2132, 'english', 'Lite Logo updated successfully!', 'Lite Logo updated successfully!', '2024-11-04 06:32:33', '2024-11-04 06:32:33'),
(2134, 'english', 'Light Logo updated successfully!', 'Light Logo updated successfully!', '2024-11-04 06:45:52', '2024-11-04 06:45:52'),
(2136, 'english', 'No file uploaded for Dark Logo!', 'No file uploaded for Dark Logo!', '2024-11-04 07:13:18', '2024-11-04 07:13:18'),
(2138, 'english', 'Error', 'Error', '2024-11-04 07:13:18', '2024-11-04 07:13:18'),
(2140, 'english', 'Dark Logo updated successfully!', 'Dark Logo updated successfully!', '2024-11-04 07:16:39', '2024-11-04 07:16:39'),
(2142, 'english', 'Favicon updated successfully!', 'Favicon updated successfully!', '2024-11-04 07:19:59', '2024-11-04 07:19:59'),
(2144, 'english', 'Review', 'Review', '2024-11-04 08:09:06', '2024-11-04 08:09:06'),
(2146, 'english', 'Add new Review', 'Add new Review', '2024-11-04 08:14:13', '2024-11-04 08:14:13'),
(2148, 'english', 'Add Review', 'Add Review', '2024-11-04 08:15:30', '2024-11-04 08:15:30'),
(2150, 'english', 'Select User', 'Select User', '2024-11-04 08:15:30', '2024-11-04 08:15:30'),
(2152, 'english', 'Select a category', 'Select a category', '2024-11-04 08:15:30', '2024-11-04 08:15:30'),
(2154, 'english', 'Select a Rating', 'Select a Rating', '2024-11-04 08:15:30', '2024-11-04 08:15:30'),
(2156, 'english', 'Review Add', 'Review Add', '2024-11-04 08:21:49', '2024-11-04 08:21:49'),
(2158, 'english', 'Select a User', 'Select a User', '2024-11-04 09:02:00', '2024-11-04 09:02:00'),
(2160, 'english', 'Review added successful!', 'Review added successful!', '2024-11-04 09:03:39', '2024-11-04 09:03:39'),
(2162, 'english', 'Options', 'Options', '2024-11-04 09:03:39', '2024-11-04 09:03:39'),
(2164, 'english', 'Edit Review', 'Edit Review', '2024-11-04 09:04:35', '2024-11-04 09:04:35'),
(2166, 'english', 'Update Review', 'Update Review', '2024-11-04 09:04:35', '2024-11-04 09:04:35'),
(2168, 'english', 'Review Update successful!', 'Review Update successful!', '2024-11-04 09:10:45', '2024-11-04 09:10:45'),
(2170, 'english', 'Review Delete successful!', 'Review Delete successful!', '2024-11-04 09:13:25', '2024-11-04 09:13:25'),
(2172, 'english', 'Browse Top Categories', 'Browse Top Categories', '2024-11-04 10:16:39', '2024-11-04 10:16:39'),
(2174, 'english', 'Large Image', 'Large Image', '2024-11-05 04:59:43', '2024-11-05 04:59:43'),
(2176, 'english', 'Small Image', 'Small Image', '2024-11-05 04:59:43', '2024-11-05 04:59:43'),
(2178, 'english', 'Add Type Image', 'Add Type Image', '2024-11-05 05:33:42', '2024-11-05 05:33:42'),
(2180, 'english', 'Category Type Image', 'Category Type Image', '2024-11-05 05:41:20', '2024-11-05 05:41:20'),
(2182, 'english', 'Upload Hotel type Image', 'Upload Hotel type Image', '2024-11-05 05:53:03', '2024-11-05 05:53:03'),
(2184, 'english', 'Hotel image updated successfully!', 'Hotel image updated successfully!', '2024-11-05 06:07:46', '2024-11-05 06:07:46'),
(2186, 'english', 'Upload doctors type Image', 'Upload doctors type Image', '2024-11-05 06:12:39', '2024-11-05 06:12:39'),
(2188, 'english', 'Upload Car type Image', 'Upload Car type Image', '2024-11-05 06:17:26', '2024-11-05 06:17:26'),
(2190, 'english', 'Upload beauty type Image', 'Upload beauty type Image', '2024-11-05 06:17:26', '2024-11-05 06:17:26'),
(2192, 'english', 'Upload Real Estate type Image', 'Upload Real Estate type Image', '2024-11-05 06:17:26', '2024-11-05 06:17:26'),
(2194, 'english', 'Upload Restaurant type Image', 'Upload Restaurant type Image', '2024-11-05 06:17:26', '2024-11-05 06:17:26'),
(2196, 'english', 'Upload Cars type Image', 'Upload Cars type Image', '2024-11-05 06:18:19', '2024-11-05 06:18:19'),
(2198, 'english', 'Restaurant image updated successfully!', 'Restaurant image updated successfully!', '2024-11-05 06:26:12', '2024-11-05 06:26:12'),
(2200, 'english', 'Real Estate image updated successfully!', 'Real Estate image updated successfully!', '2024-11-05 06:27:21', '2024-11-05 06:27:21'),
(2202, 'english', 'Doctors image updated successfully!', 'Doctors image updated successfully!', '2024-11-05 06:30:14', '2024-11-05 06:30:14'),
(2204, 'english', 'Car image updated successfully!', 'Car image updated successfully!', '2024-11-05 06:30:28', '2024-11-05 06:30:28'),
(2206, 'english', 'Beauty image updated successfully!', 'Beauty image updated successfully!', '2024-11-05 06:30:43', '2024-11-05 06:30:43'),
(2208, 'english', 'Restaurant', 'Restaurant', '2024-11-05 06:43:44', '2024-11-05 06:43:44'),
(2210, 'english', 'Doctors', 'Doctors', '2024-11-05 06:43:44', '2024-11-05 06:43:44'),
(2212, 'english', 'We Have Worked with ', 'We Have Worked with ', '2024-11-05 07:05:02', '2024-11-05 07:05:02'),
(2214, 'english', '10,000', '10,000', '2024-11-05 07:05:02', '2024-11-05 07:05:02'),
(2216, 'english', ' Trusted Companies', ' Trusted Companies', '2024-11-05 07:05:02', '2024-11-05 07:05:02'),
(2218, 'english', 'What the people Thinks About Us', 'What the people Thinks About Us', '2024-11-05 07:05:02', '2024-11-05 07:05:02'),
(2220, 'english', 'Trusted Companies', 'Trusted Companies', '2024-11-05 07:17:45', '2024-11-05 07:17:45'),
(2222, 'english', 'Add New Company Logo', 'Add New Company Logo', '2024-11-05 07:21:15', '2024-11-05 07:21:15'),
(2224, 'english', 'Company Logos updated successfully!', 'Company Logos updated successfully!', '2024-11-05 07:30:17', '2024-11-05 07:30:17'),
(2226, 'english', 'Update Company Logo', 'Update Company Logo', '2024-11-05 07:32:04', '2024-11-05 07:32:04'),
(2228, 'english', 'Logo', 'Logo', '2024-11-05 07:39:29', '2024-11-05 07:39:29'),
(2230, 'english', 'Company logo updated successfully!', 'Company logo updated successfully!', '2024-11-05 07:40:26', '2024-11-05 07:40:26'),
(2232, 'english', 'Company Logo Delete successfully!', 'Company Logo Delete successfully!', '2024-11-05 07:43:20', '2024-11-05 07:43:20'),
(2234, 'english', 'Trusted Company', 'Trusted Company', '2024-11-05 08:01:09', '2024-11-05 08:01:09'),
(2236, 'english', 'Pickup New Updates', 'Pickup New Updates', '2024-11-05 09:20:49', '2024-11-05 09:20:49'),
(2238, 'english', 'Info Update', 'Info Update', '2024-11-05 09:27:57', '2024-11-05 09:27:57'),
(2240, 'english', 'User updated successfully!', 'User updated successfully!', '2024-11-05 09:28:22', '2024-11-05 09:28:22'),
(2242, 'english', 'Do you want to mark it as popular', 'Do you want to mark it as popular', '2024-11-05 09:40:25', '2024-11-05 09:40:25'),
(2244, 'english', 'Mark as popular', 'Mark as popular', '2024-11-05 09:40:25', '2024-11-05 09:40:25'),
(2246, 'english', 'Blog deleted successful!', 'Blog deleted successful!', '2024-11-05 09:49:18', '2024-11-05 09:49:18'),
(2248, 'english', 'Blog Update successfully!', 'Blog Update successfully!', '2024-11-05 09:49:56', '2024-11-05 09:49:56'),
(2250, 'english', 'Category update successful!', 'Category update successful!', '2024-11-05 09:52:55', '2024-11-05 09:52:55'),
(2252, 'english', 'Sign up to our newsletter', 'Sign up to our newsletter', '2024-11-05 11:01:55', '2024-11-05 11:01:55'),
(2254, 'english', 'Stay up to date with the latest news, announcements, and articles.', 'Stay up to date with the latest news, announcements, and articles.', '2024-11-05 11:01:55', '2024-11-05 11:01:55'),
(2256, 'english', 'Enter your email Address', 'Enter your email Address', '2024-11-05 11:01:55', '2024-11-05 11:01:55'),
(2258, 'english', 'Subscribe', 'Subscribe', '2024-11-05 11:01:55', '2024-11-05 11:01:55'),
(2260, 'english', 'Footer Text', 'Footer Text', '2024-11-05 11:36:56', '2024-11-05 11:36:56'),
(2262, 'english', 'Lorem ipsum dolor sit amet, consectetur they adipiscing elit ut aliquam, purus sit amet luctus venenatis.', 'Lorem ipsum dolor sit amet, consectetur they adipiscing elit ut aliquam, purus sit amet luctus venenatis.', '2024-11-05 11:41:09', '2024-11-05 11:41:09'),
(2264, 'english', 'Our Latest Blog', 'Our Latest Blog', '2024-11-05 11:51:16', '2024-11-05 11:51:16'),
(2266, 'english', 'Browse Top Categories.', 'Browse Top Categories.', '2024-11-06 05:52:44', '2024-11-06 05:52:44'),
(2268, 'english', 'All', 'All', '2024-11-06 06:56:10', '2024-11-06 06:56:10'),
(2270, 'english', 'Sft', 'Sft', '2024-11-06 07:56:58', '2024-11-06 07:56:58'),
(2272, 'english', 'Massage', 'Massage', '2024-11-06 10:19:00', '2024-11-06 10:19:00'),
(2274, 'english', 'Open', 'Open', '2024-11-06 10:37:15', '2024-11-06 10:37:15'),
(2276, 'english', 'View More', 'View More', '2024-11-06 11:19:25', '2024-11-06 11:19:25'),
(2278, 'english', 'View details', 'View details', '2024-11-06 11:29:21', '2024-11-06 11:29:21'),
(2280, 'english', 'Dine in', 'Dine in', '2024-11-06 12:32:57', '2024-11-06 12:32:57'),
(2282, 'english', 'Takeaway', 'Takeaway', '2024-11-06 12:32:57', '2024-11-06 12:32:57'),
(2284, 'english', 'Delivery', 'Delivery', '2024-11-06 12:32:57', '2024-11-06 12:32:57'),
(2286, 'english', 'Our Happy Customer', 'Our Happy Customer', '2024-11-07 08:13:26', '2024-11-07 08:13:26'),
(2288, 'english', 'Latest Vehicles on Sale', 'Latest Vehicles on Sale', '2024-11-07 08:13:26', '2024-11-07 08:13:26'),
(2290, 'english', 'Beauty Banner Title', 'Beauty Banner Title', '2024-11-07 10:23:37', '2024-11-07 10:23:37'),
(2292, 'english', 'Beauty frontend Settings', 'Beauty frontend Settings', '2024-11-07 10:25:33', '2024-11-07 10:25:33'),
(2294, 'english', 'Beauty Title', 'Beauty Title', '2024-11-07 10:31:36', '2024-11-07 10:31:36'),
(2296, 'english', 'Beauty Description', 'Beauty Description', '2024-11-07 10:31:36', '2024-11-07 10:31:36'),
(2298, 'english', 'Upload Beauty Banner Image', 'Upload Beauty Banner Image', '2024-11-07 10:40:00', '2024-11-07 10:40:00'),
(2300, 'english', 'Beauty Banner', 'Beauty Banner', '2024-11-07 10:44:37', '2024-11-07 10:44:37'),
(2302, 'english', 'No file uploaded for Beauty!', 'No file uploaded for Beauty!', '2024-11-07 11:24:03', '2024-11-07 11:24:03'),
(2304, 'english', 'No image uploaded', 'No image uploaded', '2024-11-07 12:10:34', '2024-11-07 12:10:34'),
(2306, 'english', 'Beauty Video Url', 'Beauty Video Url', '2024-11-07 12:17:52', '2024-11-07 12:17:52'),
(2308, 'english', 'Beauty Facial Title', 'Beauty Facial Title', '2024-11-07 12:41:03', '2024-11-07 12:41:03'),
(2310, 'english', 'Beauty Discount', 'Beauty Discount', '2024-11-07 12:41:03', '2024-11-07 12:41:03'),
(2312, 'english', 'Beauty Facial Image', 'Beauty Facial Image', '2024-11-07 12:44:01', '2024-11-07 12:44:01'),
(2314, 'english', 'Beauty Massage Photo', 'Beauty Massage Photo', '2024-11-07 12:44:01', '2024-11-07 12:44:01'),
(2316, 'english', 'Beauty Banner Image', 'Beauty Banner Image', '2024-11-07 12:44:22', '2024-11-07 12:44:22'),
(2318, 'english', 'Beauty Facial Discount', 'Beauty Facial Discount', '2024-11-07 12:48:58', '2024-11-07 12:48:58'),
(2320, 'english', 'Beauty Massage Title', 'Beauty Massage Title', '2024-11-07 12:50:24', '2024-11-07 12:50:24'),
(2322, 'english', 'Beauty Massage Discount ', 'Beauty Massage Discount ', '2024-11-07 12:50:24', '2024-11-07 12:50:24'),
(2324, 'english', 'Beauty Massage Image', 'Beauty Massage Image', '2024-11-07 12:50:24', '2024-11-07 12:50:24'),
(2326, 'english', '10 word', '10 word', '2024-11-09 11:51:42', '2024-11-09 11:51:42'),
(2328, 'english', 'Upload Beauty Facial Image', 'Upload Beauty Facial Image', '2024-11-09 11:51:42', '2024-11-09 11:51:42'),
(2330, 'english', '10 words', '10 words', '2024-11-09 11:54:57', '2024-11-09 11:54:57'),
(2332, 'english', 'Upload Beauty Massage Image', 'Upload Beauty Massage Image', '2024-11-09 12:04:11', '2024-11-09 12:04:11'),
(2334, 'english', '2 words', '2 words', '2024-11-09 12:11:17', '2024-11-09 12:11:17'),
(2336, 'english', 'Beauty Another Image  Settings', 'Beauty Another Image  Settings', '2024-11-09 12:24:57', '2024-11-09 12:24:57'),
(2338, 'english', 'Beauty Motion Title', 'Beauty Motion Title', '2024-11-09 12:24:57', '2024-11-09 12:24:57'),
(2340, 'english', 'Beauty Motion Description', 'Beauty Motion Description', '2024-11-09 12:24:57', '2024-11-09 12:24:57'),
(2342, 'english', 'Beauty Motion Image', 'Beauty Motion Image', '2024-11-09 12:24:57', '2024-11-09 12:24:57'),
(2344, 'english', 'Book Now', 'Book Now', '2024-11-09 13:36:28', '2024-11-09 13:36:28'),
(2346, 'english', 'Explore Our Products', 'Explore Our Products', '2024-11-09 13:36:28', '2024-11-09 13:36:28'),
(2348, 'english', 'Organic Product', 'Organic Product', '2024-11-09 14:37:52', '2024-11-09 14:37:52'),
(2350, 'english', 'Product Preview', 'Product Preview', '2024-11-09 14:37:53', '2024-11-09 14:37:53'),
(2352, 'english', 'Market Experience', 'Market Experience', '2024-11-09 14:37:53', '2024-11-09 14:37:53'),
(2354, 'english', 'Hair Treatment', 'Hair Treatment', '2024-11-10 09:57:34', '2024-11-10 09:57:34');
INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(2356, 'english', '&', '&', '2024-11-10 09:57:34', '2024-11-10 09:57:34'),
(2358, 'english', 'Repair', 'Repair', '2024-11-10 09:57:34', '2024-11-10 09:57:34'),
(2360, 'english', 'Get Discount Up To 20', 'Get Discount Up To 20', '2024-11-10 09:57:34', '2024-11-10 09:57:34'),
(2362, 'english', '%', '%', '2024-11-10 09:57:34', '2024-11-10 09:57:34'),
(2364, 'english', 'Best Massage', 'Best Massage', '2024-11-10 09:57:34', '2024-11-10 09:57:34'),
(2366, 'english', 'Explore More', 'Explore More', '2024-11-10 10:04:33', '2024-11-10 10:04:33'),
(2368, 'english', 'Popular', 'Popular', '2024-11-10 10:13:34', '2024-11-10 10:13:34'),
(2370, 'english', 'Best', 'Best', '2024-11-10 10:13:34', '2024-11-10 10:13:34'),
(2372, 'english', 'Wellness', 'Wellness', '2024-11-10 10:13:34', '2024-11-10 10:13:34'),
(2374, 'english', 'Select  type', 'Select  type', '2024-11-10 10:14:01', '2024-11-10 10:14:01'),
(2376, 'english', 'Select Type', 'Select Type', '2024-11-10 10:17:55', '2024-11-10 10:17:55'),
(2378, 'english', 'City added successfully!', 'City added successfully!', '2024-11-10 10:24:56', '2024-11-10 10:24:56'),
(2380, 'english', 'is_popular', 'is_popular', '2024-11-10 10:26:51', '2024-11-10 10:26:51'),
(2382, 'english', 'Popular Beauty Parlors', 'Popular Beauty Parlors', '2024-11-10 10:41:30', '2024-11-10 10:41:30'),
(2384, 'english', 'Beauty Salon', 'Beauty Salon', '2024-11-10 10:51:37', '2024-11-10 10:51:37'),
(2386, 'english', 'Find The Best Spa Here', 'Find The Best Spa Here', '2024-11-10 11:52:49', '2024-11-10 11:52:49'),
(2388, 'english', 'Complete wellness with massage', 'Complete wellness with massage', '2024-11-10 11:52:49', '2024-11-10 11:52:49'),
(2390, 'english', 'Booking Online', 'Booking Online', '2024-11-10 11:52:49', '2024-11-10 11:52:49'),
(2392, 'english', 'Beauty Details', 'Beauty Details', '2024-11-12 09:36:15', '2024-11-12 09:36:15'),
(2394, 'english', 'Back to listing', 'Back to listing', '2024-11-12 10:15:41', '2024-11-12 10:15:41'),
(2396, 'english', 'Time', 'Time', '2024-11-12 11:36:44', '2024-11-12 11:36:44'),
(2398, 'english', 'Edit Your Review', 'Edit Your Review', '2024-11-17 05:09:53', '2024-11-17 05:09:53'),
(2400, 'english', 'Select Rating', 'Select Rating', '2024-11-17 05:09:53', '2024-11-17 05:09:53'),
(2402, 'english', '1', '1', '2024-11-17 05:09:53', '2024-11-17 05:09:53'),
(2404, 'english', '2', '2', '2024-11-17 05:09:53', '2024-11-17 05:09:53'),
(2406, 'english', '3', '3', '2024-11-17 05:09:53', '2024-11-17 05:09:53'),
(2408, 'english', '4', '4', '2024-11-17 05:09:53', '2024-11-17 05:09:53'),
(2410, 'english', '5', '5', '2024-11-17 05:09:53', '2024-11-17 05:09:53'),
(2412, 'english', 'You have successfully Review Done!', 'You have successfully Review Done!', '2024-11-17 06:55:28', '2024-11-17 06:55:28'),
(2414, 'english', 'Your review was successfully submitted!', 'Your review was successfully submitted!', '2024-11-17 07:02:47', '2024-11-17 07:02:47'),
(2416, 'english', 'Please Login First!', 'Please Login First!', '2024-11-17 07:05:11', '2024-11-17 07:05:11'),
(2418, 'english', 'Add  Your Review', 'Add  Your Review', '2024-11-17 07:30:52', '2024-11-17 07:30:52'),
(2420, 'english', 'Add Your Review', 'Add Your Review', '2024-11-17 07:59:01', '2024-11-17 07:59:01'),
(2422, 'english', 'Your review was update successfully!', 'Your review was update successfully!', '2024-11-17 08:10:44', '2024-11-17 08:10:44'),
(2424, 'english', 'Update Reviews', 'Update Reviews', '2024-11-17 09:25:23', '2024-11-17 09:25:23'),
(2426, 'english', 'Add Reviews', 'Add Reviews', '2024-11-17 09:58:00', '2024-11-17 09:58:00'),
(2428, 'english', 'Reply', 'Reply', '2024-11-17 09:58:47', '2024-11-17 09:58:47'),
(2430, 'english', 'Log Out', 'Log Out', '2024-11-17 10:02:20', '2024-11-17 10:02:20'),
(2432, 'english', 'Review*', 'Review*', '2024-11-17 10:24:58', '2024-11-17 10:24:58'),
(2434, 'english', 'Reviews', 'Reviews', '2024-11-17 10:40:11', '2024-11-17 10:40:11'),
(2436, 'english', 'Reply Review', 'Reply Review', '2024-11-17 11:16:11', '2024-11-17 11:16:11'),
(2438, 'english', 'Your review was successfully updated!', 'Your review was successfully updated!', '2024-11-17 11:25:53', '2024-11-17 11:25:53'),
(2440, 'english', 'Review deleted successfully!', 'Review deleted successfully!', '2024-11-17 11:37:17', '2024-11-17 11:37:17'),
(2442, 'english', 'Empty Message', 'Empty Message', '2024-11-18 05:58:20', '2024-11-18 05:58:20'),
(2444, 'english', 'No Message Found', 'No Message Found', '2024-11-18 05:58:24', '2024-11-18 05:58:24'),
(2446, 'english', 'Write your message', 'Write your message', '2024-11-18 05:58:24', '2024-11-18 05:58:24'),
(2448, 'english', 'My Customer Panel', 'My Customer Panel', '2024-11-18 06:00:22', '2024-11-18 06:00:22'),
(2450, 'english', 'Wishlist', 'Wishlist', '2024-11-18 06:00:22', '2024-11-18 06:00:22'),
(2452, 'english', 'Following agent', 'Following agent', '2024-11-18 06:00:22', '2024-11-18 06:00:22'),
(2454, 'english', 'Wishlist added!', 'Wishlist added!', '2024-11-18 06:58:58', '2024-11-18 06:58:58'),
(2456, 'english', 'Wishlist removed', 'Wishlist removed', '2024-11-18 07:01:25', '2024-11-18 07:01:25'),
(2458, 'english', 'Agent Contact Details', 'Agent Contact Details', '2024-11-19 17:01:31', '2024-11-19 17:01:31'),
(2460, 'english', 'Follow', 'Follow', '2024-11-19 17:01:31', '2024-11-19 17:01:31'),
(2462, 'english', 'Listing by', 'Listing by', '2024-11-20 06:59:05', '2024-11-20 06:59:05'),
(2464, 'english', 'Phone:', 'Phone:', '2024-11-20 06:59:05', '2024-11-20 06:59:05'),
(2466, 'english', 'Email:', 'Email:', '2024-11-20 06:59:05', '2024-11-20 06:59:05'),
(2468, 'english', 'following', 'following', '2024-11-20 07:05:09', '2024-11-20 07:05:09'),
(2470, 'english', 'Unfollow', 'Unfollow', '2024-11-20 07:20:08', '2024-11-20 07:20:08'),
(2472, 'english', 'Message*', 'Message*', '2024-11-20 08:57:34', '2024-11-20 08:57:34'),
(2474, 'english', 'Book a Meeting', 'Book a Meeting', '2024-11-20 09:45:54', '2024-11-20 09:45:54'),
(2476, 'english', 'Select Date and Time', 'Select Date and Time', '2024-11-20 09:45:54', '2024-11-20 09:45:54'),
(2478, 'english', 'Submit Now', 'Submit Now', '2024-11-20 09:45:55', '2024-11-20 09:45:55'),
(2480, 'english', 'Service Title', 'Service Title', '2024-11-20 14:40:15', '2024-11-20 14:40:15'),
(2482, 'english', 'Enter service title', 'Enter service title', '2024-11-20 14:40:15', '2024-11-20 14:40:15'),
(2484, 'english', 'Service Time', 'Service Time', '2024-11-20 14:40:15', '2024-11-20 14:40:15'),
(2486, 'english', 'Enter service time', 'Enter service time', '2024-11-20 14:40:15', '2024-11-20 14:40:15'),
(2488, 'english', 'Service Price', 'Service Price', '2024-11-20 14:40:15', '2024-11-20 14:40:15'),
(2490, 'english', 'Enter service price', 'Enter service price', '2024-11-20 14:40:15', '2024-11-20 14:40:15'),
(2492, 'english', 'Show More', 'Show More', '2024-11-30 10:46:03', '2024-11-30 10:46:03'),
(2494, 'english', 'Filters', 'Filters', '2024-11-30 15:42:01', '2024-11-30 15:42:01'),
(2496, 'english', 'Clear', 'Clear', '2024-11-30 15:42:01', '2024-11-30 15:42:01'),
(2498, 'english', 'Car Frontend Settings', 'Car Frontend Settings', '2024-12-01 06:12:31', '2024-12-01 06:12:31'),
(2500, 'english', 'Banner', 'Banner', '2024-12-01 06:22:45', '2024-12-01 06:22:45'),
(2502, 'english', 'Upload  Banner Image', 'Upload  Banner Image', '2024-12-01 06:22:45', '2024-12-01 06:22:45'),
(2504, 'english', 'Motion Description', 'Motion Description', '2024-12-01 06:40:52', '2024-12-01 06:40:52'),
(2506, 'english', ' Motion Image', ' Motion Image', '2024-12-01 06:40:52', '2024-12-01 06:40:52'),
(2508, 'english', 'Car Title', 'Car Title', '2024-12-01 06:45:10', '2024-12-01 06:45:10'),
(2510, 'english', 'Car Description', 'Car Description', '2024-12-01 06:45:10', '2024-12-01 06:45:10'),
(2512, 'english', 'Car Banner', 'Car Banner', '2024-12-01 06:45:10', '2024-12-01 06:45:10'),
(2514, 'english', 'Car Motion Title', 'Car Motion Title', '2024-12-01 06:45:10', '2024-12-01 06:45:10'),
(2516, 'english', 'Car Motion Description', 'Car Motion Description', '2024-12-01 06:45:10', '2024-12-01 06:45:10'),
(2518, 'english', 'Car Motion Image', 'Car Motion Image', '2024-12-01 06:45:10', '2024-12-01 06:45:10'),
(2520, 'english', 'Car Banner Title', 'Car Banner Title', '2024-12-01 06:46:17', '2024-12-01 06:46:17'),
(2522, 'english', 'Car Banner Description', 'Car Banner Description', '2024-12-01 06:46:17', '2024-12-01 06:46:17'),
(2524, 'english', 'Car Banner Banner', 'Car Banner Banner', '2024-12-01 06:46:17', '2024-12-01 06:46:17'),
(2526, 'english', 'Upload  Image', 'Upload  Image', '2024-12-01 06:47:09', '2024-12-01 06:47:09'),
(2528, 'english', 'Upload Image', 'Upload Image', '2024-12-01 06:47:09', '2024-12-01 06:47:09'),
(2530, 'english', 'Car Home ', 'Car Home ', '2024-12-01 06:54:25', '2024-12-01 06:54:25'),
(2532, 'english', 'Beauty Home', 'Beauty Home', '2024-12-01 06:55:45', '2024-12-01 06:55:45'),
(2534, 'english', 'Featured', 'Featured', '2024-12-01 07:12:35', '2024-12-01 07:12:35'),
(2536, 'english', 'Top', 'Top', '2024-12-01 07:12:35', '2024-12-01 07:12:35'),
(2538, 'english', 'FEATURED VEHICLES', 'FEATURED VEHICLES', '2024-12-01 09:24:20', '2024-12-01 09:24:20'),
(2540, 'english', 'Top Cars', 'Top Cars', '2024-12-01 09:34:25', '2024-12-01 09:34:25'),
(2542, 'english', 'Category Updated successfully!', 'Category Updated successfully!', '2024-12-01 09:40:39', '2024-12-01 09:40:39'),
(2544, 'english', 'Car Listing Details', 'Car Listing Details', '2024-12-01 12:44:27', '2024-12-01 12:44:27'),
(2546, 'english', 'Car Details', 'Car Details', '2024-12-02 06:30:53', '2024-12-02 06:30:53'),
(2548, 'english', 'Beauty Listing Details', 'Beauty Listing Details', '2024-12-02 06:36:27', '2024-12-02 06:36:27'),
(2550, 'english', 'Overview', 'Overview', '2024-12-02 06:51:25', '2024-12-02 06:51:25'),
(2552, 'english', 'Information', 'Information', '2024-12-02 06:51:25', '2024-12-02 06:51:25'),
(2554, 'english', 'Condition', 'Condition', '2024-12-02 07:07:38', '2024-12-02 07:07:38'),
(2556, 'english', 'Fuel', 'Fuel', '2024-12-02 07:16:35', '2024-12-02 07:16:35'),
(2558, 'english', 'Seller information', 'Seller information', '2024-12-02 10:00:02', '2024-12-02 10:00:02'),
(2560, 'english', 'Phone :', 'Phone :', '2024-12-02 10:45:38', '2024-12-02 10:45:38'),
(2562, 'english', 'mail :', 'mail :', '2024-12-02 10:45:38', '2024-12-02 10:45:38'),
(2564, 'english', 'Address :', 'Address :', '2024-12-02 10:45:38', '2024-12-02 10:45:38'),
(2566, 'english', 'Update Your Review', 'Update Your Review', '2024-12-02 11:59:24', '2024-12-02 11:59:24'),
(2568, 'english', 'View all photos', 'View all photos', '2024-12-03 07:03:44', '2024-12-03 07:03:44'),
(2570, 'english', 'More cars from this seller', 'More cars from this seller', '2024-12-03 09:32:34', '2024-12-03 09:32:34'),
(2572, 'english', 'View all', 'View all', '2024-12-03 09:32:34', '2024-12-03 09:32:34'),
(2574, 'english', 'REVIEWS)', 'REVIEWS)', '2024-12-03 10:02:00', '2024-12-03 10:02:00'),
(2576, 'english', 'Stock', 'Stock', '2024-12-03 10:28:36', '2024-12-03 10:28:36'),
(2578, 'english', 'Book inspection', 'Book inspection', '2024-12-03 10:36:00', '2024-12-03 10:36:00'),
(2580, 'english', 'Select date & time', 'Select date & time', '2024-12-03 10:36:00', '2024-12-03 10:36:00'),
(2582, 'english', 'Your information', 'Your information', '2024-12-03 10:36:00', '2024-12-03 10:36:00'),
(2584, 'english', 'Replys', 'Replys', '2024-12-03 11:14:59', '2024-12-03 11:14:59'),
(2586, 'english', 'Contact Dealer', 'Contact Dealer', '2024-12-03 11:45:07', '2024-12-03 11:45:07'),
(2588, 'english', 'Car Dealer', 'Car Dealer', '2024-12-03 11:45:07', '2024-12-03 11:45:07'),
(2590, 'english', 'Message dealer', 'Message dealer', '2024-12-03 11:45:07', '2024-12-03 11:45:07'),
(2592, 'english', 'Years', 'Years', '2024-12-04 09:30:25', '2024-12-04 09:30:25'),
(2594, 'english', 'Colors', 'Colors', '2024-12-04 09:39:05', '2024-12-04 09:39:05'),
(2596, 'english', 'Brands', 'Brands', '2024-12-04 15:24:40', '2024-12-04 15:24:40'),
(2598, 'english', 'Search Cars', 'Search Cars', '2024-12-04 16:15:53', '2024-12-04 16:15:53'),
(2600, 'english', 'Hotel Frontend Settings', 'Hotel Frontend Settings', '2024-12-05 05:45:51', '2024-12-05 05:45:51'),
(2602, 'english', 'Hotel Banner Title', 'Hotel Banner Title', '2024-12-05 06:24:48', '2024-12-05 06:24:48'),
(2604, 'english', 'Hotel Banner Description', 'Hotel Banner Description', '2024-12-05 06:24:48', '2024-12-05 06:24:48'),
(2606, 'english', 'Hotel Video Url', 'Hotel Video Url', '2024-12-05 06:24:48', '2024-12-05 06:24:48'),
(2608, 'english', 'Hotel Banner Banner', 'Hotel Banner Banner', '2024-12-05 06:24:48', '2024-12-05 06:24:48'),
(2610, 'english', 'Booking Title', 'Booking Title', '2024-12-05 07:00:12', '2024-12-05 07:00:12'),
(2612, 'english', 'Booking Image', 'Booking Image', '2024-12-05 07:00:12', '2024-12-05 07:00:12'),
(2614, 'english', 'Hotel Banner', 'Hotel Banner', '2024-12-05 07:12:35', '2024-12-05 07:12:35'),
(2616, 'english', 'Exclusive Deals', 'Exclusive Deals', '2024-12-05 07:12:35', '2024-12-05 07:12:35'),
(2618, 'english', 'Exclusive Deals Discount', 'Exclusive Deals Discount', '2024-12-05 07:12:35', '2024-12-05 07:12:35'),
(2620, 'english', 'Exclusive Banner', 'Exclusive Banner', '2024-12-05 07:12:35', '2024-12-05 07:12:35'),
(2622, 'english', 'Size the moment', 'Size the moment', '2024-12-05 07:23:52', '2024-12-05 07:23:52'),
(2624, 'english', 'Size  Discount', 'Size  Discount', '2024-12-05 07:23:52', '2024-12-05 07:23:52'),
(2626, 'english', 'Size Banner', 'Size Banner', '2024-12-05 07:23:53', '2024-12-05 07:23:53'),
(2628, 'english', 'Learn More', 'Learn More', '2024-12-05 07:31:07', '2024-12-05 07:31:07'),
(2630, 'english', 'Take A Tour', 'Take A Tour', '2024-12-05 07:31:07', '2024-12-05 07:31:07'),
(2632, 'english', 'Find Gateway Deals', 'Find Gateway Deals', '2024-12-05 07:51:04', '2024-12-05 07:51:04'),
(2634, 'english', 'Explore Hotel', 'Explore Hotel', '2024-12-05 07:51:04', '2024-12-05 07:51:04'),
(2636, 'english', 'City deleted successfully!', 'City deleted successfully!', '2024-12-05 09:50:24', '2024-12-05 09:50:24'),
(2638, 'english', 'Top Hotels', 'Top Hotels', '2024-12-05 10:27:11', '2024-12-05 10:27:11'),
(2640, 'english', 'See all', 'See all', '2024-12-05 10:27:11', '2024-12-05 10:27:11'),
(2642, 'english', 'Popular Hotel', 'Popular Hotel', '2024-12-05 12:20:09', '2024-12-05 12:20:09'),
(2644, 'english', 'Flexible budget', 'Flexible budget', '2024-12-05 12:20:29', '2024-12-05 12:20:29'),
(2646, 'english', 'Peaceful place', 'Peaceful place', '2024-12-05 12:20:29', '2024-12-05 12:20:29'),
(2648, 'english', 'Well decorated', 'Well decorated', '2024-12-05 12:20:29', '2024-12-05 12:20:29'),
(2650, 'english', 'Get Started', 'Get Started', '2024-12-05 12:20:29', '2024-12-05 12:20:29'),
(2652, 'english', 'Contact Us', 'Contact Us', '2024-12-05 12:20:29', '2024-12-05 12:20:29'),
(2654, 'english', 'City Image', 'City Image', '2024-12-05 12:34:22', '2024-12-05 12:34:22'),
(2656, 'english', 'Hotel Listing Details', 'Hotel Listing Details', '2024-12-08 06:28:53', '2024-12-08 06:28:53'),
(2658, 'english', 'Hotel details', 'Hotel details', '2024-12-08 06:41:05', '2024-12-08 06:41:05'),
(2660, 'english', 'Total Price : ', 'Total Price : ', '2024-12-08 06:42:35', '2024-12-08 06:42:35'),
(2662, 'english', 'Select Status', 'Select Status', '2024-12-08 07:20:18', '2024-12-08 07:20:18'),
(2664, 'english', 'Rent', 'Rent', '2024-12-08 07:20:18', '2024-12-08 07:20:18'),
(2666, 'english', 'Sell', 'Sell', '2024-12-08 07:20:18', '2024-12-08 07:20:18'),
(2668, 'english', 'Published:', 'Published:', '2024-12-08 07:45:16', '2024-12-08 07:45:16'),
(2670, 'english', 'For', 'For', '2024-12-08 07:46:26', '2024-12-08 07:46:26'),
(2672, 'english', 'Room', 'Room', '2024-12-08 07:52:45', '2024-12-08 07:52:45'),
(2674, 'english', 'Number of Child', 'Number of Child', '2024-12-08 09:39:41', '2024-12-08 09:39:41'),
(2676, 'english', 'Persons', 'Persons', '2024-12-08 09:45:50', '2024-12-08 09:45:50'),
(2678, 'english', 'Child', 'Child', '2024-12-08 09:45:50', '2024-12-08 09:45:50'),
(2680, 'english', 'For 1 Night 1 Room', 'For 1 Night 1 Room', '2024-12-08 09:48:58', '2024-12-08 09:48:58'),
(2682, 'english', 'Select Room', 'Select Room', '2024-12-08 09:48:58', '2024-12-08 09:48:58'),
(2684, 'english', 'Refundable', 'Refundable', '2024-12-08 09:48:58', '2024-12-08 09:48:58'),
(2686, 'english', 'See all Amenities', 'See all Amenities', '2024-12-08 09:52:06', '2024-12-08 09:52:06'),
(2688, 'english', 'Get Direction', 'Get Direction', '2024-12-08 10:01:52', '2024-12-08 10:01:52'),
(2690, 'english', 'Related Hotels', 'Related Hotels', '2024-12-08 11:23:11', '2024-12-08 11:23:11'),
(2692, 'english', 'Proceed Booking', 'Proceed Booking', '2024-12-09 05:19:16', '2024-12-09 05:19:16'),
(2694, 'english', 'No Result Found', 'No Result Found', '2024-12-09 06:18:09', '2024-12-09 06:18:09'),
(2696, 'english', 'No products were found matching your selection.', 'No products were found matching your selection.', '2024-12-09 06:18:09', '2024-12-09 06:18:09'),
(2698, 'english', 'Go Back', 'Go Back', '2024-12-09 06:18:09', '2024-12-09 06:18:09'),
(2700, 'english', 'Bathroom', 'Bathroom', '2024-12-09 07:47:36', '2024-12-09 07:47:36'),
(2702, 'english', 'Bedroom', 'Bedroom', '2024-12-09 08:06:33', '2024-12-09 08:06:33'),
(2704, 'english', 'Select Category', 'Select Category', '2024-12-09 09:46:20', '2024-12-09 09:46:20'),
(2706, 'english', '', '', '2024-12-09 09:58:22', '2024-12-09 09:58:22'),
(2708, 'english', 'Real-Estate Home', 'Real-Estate Home', '2024-12-09 12:06:07', '2024-12-09 12:06:07'),
(2710, 'english', 'Real  Estate Frontend Settings', 'Real  Estate Frontend Settings', '2024-12-10 05:46:12', '2024-12-10 05:46:12'),
(2712, 'english', 'Real Estate Frontend Settings', 'Real Estate Frontend Settings', '2024-12-10 05:49:28', '2024-12-10 05:49:28'),
(2714, 'english', 'Real Estate  Title', 'Real Estate  Title', '2024-12-10 05:49:28', '2024-12-10 05:49:28'),
(2716, 'english', 'Real Estate Banner Description', 'Real Estate Banner Description', '2024-12-10 05:49:28', '2024-12-10 05:49:28'),
(2718, 'english', 'Real Estate Banner', 'Real Estate Banner', '2024-12-10 05:49:28', '2024-12-10 05:49:28'),
(2720, 'english', 'Real Estate Discount Title', 'Real Estate Discount Title', '2024-12-10 06:04:44', '2024-12-10 06:04:44'),
(2722, 'english', 'Real Estate Short Description', 'Real Estate Short Description', '2024-12-10 06:04:44', '2024-12-10 06:04:44'),
(2724, 'english', 'Discount Image', 'Discount Image', '2024-12-10 06:04:44', '2024-12-10 06:04:44'),
(2726, 'english', 'Discount', 'Discount', '2024-12-10 06:08:43', '2024-12-10 06:08:43'),
(2728, 'english', 'Listing Discount price', 'Listing Discount price', '2024-12-10 08:21:36', '2024-12-10 08:21:36'),
(2730, 'english', 'Enter discount price', 'Enter discount price', '2024-12-10 08:23:53', '2024-12-10 08:23:53'),
(2732, 'english', 'Real Estate Listing Details', 'Real Estate Listing Details', '2024-12-10 09:41:29', '2024-12-10 09:41:29'),
(2734, 'english', 'Real-Estate', 'Real-Estate', '2024-12-10 09:50:42', '2024-12-10 09:50:42'),
(2736, 'english', 'Property ID', 'Property ID', '2024-12-10 10:27:50', '2024-12-10 10:27:50'),
(2738, 'english', 'Apartment', 'Apartment', '2024-12-10 10:32:20', '2024-12-10 10:32:20'),
(2740, 'english', 'ID :', 'ID :', '2024-12-10 10:32:20', '2024-12-10 10:32:20'),
(2742, 'english', 'Property', 'Property', '2024-12-10 10:51:19', '2024-12-10 10:51:19'),
(2744, 'english', 'Property Size', 'Property Size', '2024-12-10 10:51:19', '2024-12-10 10:51:19'),
(2746, 'english', 'Bedrooms', 'Bedrooms', '2024-12-10 10:51:19', '2024-12-10 10:51:19'),
(2748, 'english', 'Bathrooms', 'Bathrooms', '2024-12-10 10:51:19', '2024-12-10 10:51:19'),
(2750, 'english', 'Year Build', 'Year Build', '2024-12-10 10:51:19', '2024-12-10 10:51:19'),
(2752, 'english', 'Property Agent', 'Property Agent', '2024-12-10 10:51:19', '2024-12-10 10:51:19'),
(2754, 'english', 'Floor Plans', 'Floor Plans', '2024-12-10 11:47:17', '2024-12-10 11:47:17'),
(2756, 'english', 'Choose Category', 'Choose Category', '2024-12-11 07:54:11', '2024-12-11 07:54:11'),
(2758, 'english', 'Choose City', 'Choose City', '2024-12-11 08:01:54', '2024-12-11 08:01:54'),
(2760, 'english', 'Choose your budget', 'Choose your budget', '2024-12-11 08:10:24', '2024-12-11 08:10:24'),
(2762, 'english', 'Tour Type', 'Tour Type', '2024-12-18 11:10:52', '2024-12-18 11:10:52'),
(2764, 'english', 'In Progress', 'In Progress', '2024-12-18 11:10:52', '2024-12-18 11:10:52'),
(2766, 'english', 'In Person', 'In Person', '2024-12-18 11:23:40', '2024-12-18 11:23:40'),
(2768, 'english', 'Nearby', 'Nearby', '2024-12-18 11:33:25', '2024-12-18 11:33:25'),
(2770, 'english', 'Nearby Location', 'Nearby Location', '2024-12-18 11:33:25', '2024-12-18 11:33:25'),
(2772, 'english', 'Add Nearby Location', 'Add Nearby Location', '2024-12-18 11:36:59', '2024-12-18 11:36:59'),
(2774, 'english', 'School', 'School', '2024-12-18 12:33:09', '2024-12-18 12:33:09'),
(2776, 'english', 'Hospital', 'Hospital', '2024-12-18 12:33:09', '2024-12-18 12:33:09'),
(2778, 'english', 'Shopping Center', 'Shopping Center', '2024-12-18 12:33:09', '2024-12-18 12:33:09'),
(2780, 'english', 'Enter discount price', 'Enter discount price', '2024-12-19 05:02:59', '2024-12-19 05:02:59'),
(2782, 'english', 'Save Nearby', 'Save Nearby', '2024-12-19 06:32:59', '2024-12-19 06:32:59'),
(2784, 'english', 'Add a Nearby Location', 'Add a Nearby Location', '2024-12-19 06:34:00', '2024-12-19 06:34:00'),
(2786, 'english', 'Select Location', 'Select Location', '2024-12-19 06:53:18', '2024-12-19 06:53:18'),
(2788, 'english', 'Your selected', 'Your selected', '2024-12-19 06:53:18', '2024-12-19 06:53:18'),
(2790, 'english', 'NearBy Location Add successful!', 'NearBy Location Add successful!', '2024-12-19 07:19:32', '2024-12-19 07:19:32'),
(2792, 'english', 'NearBy Location Update successful!', 'NearBy Location Update successful!', '2024-12-19 09:22:08', '2024-12-19 09:22:08'),
(2794, 'english', 'Location has been deleted', 'Location has been deleted', '2024-12-19 09:30:00', '2024-12-19 09:30:00'),
(2796, 'english', '3D Model', '3D Model', '2024-12-19 10:44:50', '2024-12-19 10:44:50'),
(2798, 'english', 'Upload 3D Model: ', 'Upload 3D Model: ', '2024-12-19 10:51:38', '2024-12-19 10:51:38'),
(2800, 'english', 'Upload A 3D Model', 'Upload A 3D Model', '2024-12-19 10:54:54', '2024-12-19 10:54:54'),
(2802, 'english', 'Upload 3D Model', 'Upload 3D Model', '2024-12-19 11:08:22', '2024-12-19 11:08:22'),
(2804, 'english', 'Choose Type', 'Choose Type', '2024-12-21 06:56:57', '2024-12-21 06:56:57'),
(2806, 'english', 'Choose Model', 'Choose Model', '2024-12-21 07:02:37', '2024-12-21 07:02:37'),
(2808, 'english', 'Choose Brand', 'Choose Brand', '2024-12-21 07:02:37', '2024-12-21 07:02:37'),
(2810, 'english', 'Choose Year', 'Choose Year', '2024-12-21 07:02:37', '2024-12-21 07:02:37'),
(2812, 'english', 'Best Properties', 'Best Properties', '2024-12-21 07:08:31', '2024-12-21 07:08:31'),
(2814, 'english', 'Explore All Properties', 'Explore All Properties', '2024-12-21 07:08:31', '2024-12-21 07:08:31'),
(2816, 'english', 'For Sell', 'For Sell', '2024-12-21 07:40:38', '2024-12-21 07:40:38'),
(2818, 'english', 'For Rent', 'For Rent', '2024-12-21 07:55:45', '2024-12-21 07:55:45'),
(2820, 'english', 'All Listing', 'All Listing', '2024-12-21 08:00:40', '2024-12-21 08:00:40'),
(2822, 'english', 'Footer Copyright Text', 'Footer Copyright Text', '2024-12-21 08:22:54', '2024-12-21 08:22:54'),
(2824, 'english', 'Restaurant Home', 'Restaurant Home', '2024-12-22 06:01:38', '2024-12-22 06:01:38'),
(2826, 'english', 'Restaurant Frontend Settings', 'Restaurant Frontend Settings', '2024-12-22 06:33:48', '2024-12-22 06:33:48'),
(2828, 'english', 'Restaurant Banner Title', 'Restaurant Banner Title', '2024-12-22 06:33:48', '2024-12-22 06:33:48'),
(2830, 'english', 'Restaurant Banner 1', 'Restaurant Banner 1', '2024-12-22 06:33:48', '2024-12-22 06:33:48'),
(2832, 'english', 'Restaurant Banner', 'Restaurant Banner', '2024-12-22 06:38:56', '2024-12-22 06:38:56'),
(2834, 'english', 'Discount Banner', 'Discount Banner', '2024-12-22 07:30:34', '2024-12-22 07:30:34'),
(2836, 'english', 'View Menu', 'View Menu', '2024-12-22 07:42:52', '2024-12-22 07:42:52'),
(2838, 'english', 'Book A Table', 'Book A Table', '2024-12-22 07:42:52', '2024-12-22 07:42:52'),
(2840, 'english', 'Trending', 'Trending', '2024-12-22 08:14:43', '2024-12-22 08:14:43'),
(2842, 'english', 'Popular Restaurant', 'Popular Restaurant', '2024-12-22 09:27:02', '2024-12-22 09:27:02'),
(2844, 'english', 'Trending Restaurant', 'Trending Restaurant', '2024-12-22 09:46:09', '2024-12-22 09:46:09'),
(2846, 'english', 'Explore Restaurant', 'Explore Restaurant', '2024-12-22 10:03:54', '2024-12-22 10:03:54'),
(2848, 'english', 'Restaurants', 'Restaurants', '2024-12-22 10:03:55', '2024-12-22 10:03:55'),
(2850, 'english', 'Restaurant details', 'Restaurant details', '2024-12-22 11:13:38', '2024-12-22 11:13:38'),
(2852, 'english', 'closing', 'closing', '2024-12-22 12:03:08', '2024-12-22 12:03:08'),
(2854, 'english', 'Remove Wishlist', 'Remove Wishlist', '2024-12-23 07:18:45', '2024-12-23 07:18:45'),
(2856, 'english', 'Discount Price', 'Discount Price', '2024-12-23 10:27:53', '2024-12-23 10:27:53'),
(2858, 'english', 'New', 'New', '2024-12-23 10:27:53', '2024-12-23 10:27:53'),
(2860, 'english', 'Used', 'Used', '2024-12-23 10:27:53', '2024-12-23 10:27:53'),
(2862, 'english', '0', '0', '2024-12-23 10:46:11', '2024-12-23 10:46:11'),
(2864, 'english', 'All Restaurant', 'All Restaurant', '2024-12-23 11:53:10', '2024-12-23 11:53:10'),
(2866, 'english', 'Guests', 'Guests', '2024-12-24 04:55:44', '2024-12-24 04:55:44'),
(2868, 'english', 'Adults', 'Adults', '2024-12-24 04:55:44', '2024-12-24 04:55:44'),
(2870, 'english', 'Children', 'Children', '2024-12-24 04:55:44', '2024-12-24 04:55:44'),
(2872, 'english', 'Lunch', 'Lunch', '2024-12-24 04:55:44', '2024-12-24 04:55:44'),
(2874, 'english', 'Dinner', 'Dinner', '2024-12-24 04:55:44', '2024-12-24 04:55:44'),
(2876, 'english', ' Adult Guests:', ' Adult Guests:', '2024-12-24 07:11:34', '2024-12-24 07:11:34'),
(2878, 'english', 'Child Guests:', 'Child Guests:', '2024-12-24 07:11:34', '2024-12-24 07:11:34'),
(2880, 'english', 'Time: ', 'Time: ', '2024-12-24 07:11:34', '2024-12-24 07:11:34'),
(2882, 'english', 'Select Time', 'Select Time', '2024-12-24 07:18:19', '2024-12-24 07:18:19'),
(2884, 'english', 'Quick links', 'Quick links', '2024-12-24 09:29:59', '2024-12-24 09:29:59'),
(2886, 'english', 'About Us', 'About Us', '2024-12-24 09:29:59', '2024-12-24 09:29:59'),
(2888, 'english', 'Privacy policy', 'Privacy policy', '2024-12-24 09:29:59', '2024-12-24 09:29:59'),
(2890, 'english', 'Terms and Condition', 'Terms and Condition', '2024-12-24 09:29:59', '2024-12-24 09:29:59'),
(2892, 'english', 'Links', 'Links', '2024-12-24 09:32:31', '2024-12-24 09:32:31'),
(2894, 'english', 'Popular Product', 'Popular Product', '2024-12-24 11:28:14', '2024-12-24 11:28:14'),
(2896, 'english', 'Best Product', 'Best Product', '2024-12-24 11:28:14', '2024-12-24 11:28:14'),
(2898, 'english', 'Wellness Product', 'Wellness Product', '2024-12-24 11:28:14', '2024-12-24 11:28:14'),
(2900, 'english', 'Agent Details', 'Agent Details', '2024-12-25 05:45:25', '2024-12-25 05:45:25'),
(2902, 'english', 'Facebook.com', 'Facebook.com', '2024-12-25 06:02:08', '2024-12-25 06:02:08'),
(2904, 'english', 'Twitter.com', 'Twitter.com', '2024-12-25 06:05:37', '2024-12-25 06:05:37'),
(2906, 'english', 'linkedin.com', 'linkedin.com', '2024-12-25 06:05:37', '2024-12-25 06:05:37'),
(2908, 'english', 'Listings', 'Listings', '2024-12-25 06:29:54', '2024-12-25 06:29:54'),
(2910, 'english', 'Send Email', 'Send Email', '2024-12-25 06:29:54', '2024-12-25 06:29:54'),
(2912, 'english', 'Call', 'Call', '2024-12-25 06:29:54', '2024-12-25 06:29:54'),
(2914, 'english', 'Our Happy Customers', 'Our Happy Customers', '2024-12-25 07:26:24', '2024-12-25 07:26:24'),
(2916, 'english', 'Hotels', 'Hotels', '2024-12-25 07:40:44', '2024-12-25 07:40:44'),
(2918, 'english', 'No Data were found matching your selection.', 'No Data were found matching your selection.', '2024-12-25 07:50:05', '2024-12-25 07:50:05'),
(2920, 'english', 'Share On :', 'Share On :', '2024-12-25 08:12:13', '2024-12-25 08:12:13'),
(2922, 'english', 'Tags :', 'Tags :', '2024-12-25 08:17:53', '2024-12-25 08:17:53'),
(2924, 'english', 'Related Blogs', 'Related Blogs', '2024-12-25 09:17:48', '2024-12-25 09:17:48'),
(2926, 'english', 'Newsletter Subscribe successfully', 'Newsletter Subscribe successfully', '2024-12-25 10:15:38', '2024-12-25 10:15:38'),
(2928, 'english', 'Subscribe User', 'Subscribe User', '2024-12-25 10:48:35', '2024-12-25 10:48:35'),
(2930, 'english', 'Add Newsletter', 'Add Newsletter', '2024-12-25 10:48:55', '2024-12-25 10:48:55'),
(2932, 'english', 'Newsletter', 'Newsletter', '2024-12-25 10:53:14', '2024-12-25 10:53:14'),
(2934, 'english', 'Subscribers', 'Subscribers', '2024-12-25 10:54:15', '2024-12-25 10:54:15'),
(2936, 'english', 'Export', 'Export', '2024-12-25 10:54:15', '2024-12-25 10:54:15'),
(2938, 'english', 'PDF', 'PDF', '2024-12-25 10:54:15', '2024-12-25 10:54:15'),
(2940, 'english', 'Print', 'Print', '2024-12-25 10:54:15', '2024-12-25 10:54:15'),
(2942, 'english', 'Search Email', 'Search Email', '2024-12-25 10:54:54', '2024-12-25 10:54:54'),
(2944, 'english', 'User status', 'User status', '2024-12-25 10:54:54', '2024-12-25 10:54:54'),
(2946, 'english', 'Actions', 'Actions', '2024-12-25 10:54:54', '2024-12-25 10:54:54'),
(2948, 'english', 'Not Registered', 'Not Registered', '2024-12-25 10:54:54', '2024-12-25 10:54:54'),
(2950, 'english', 'data', 'data', '2024-12-25 10:54:54', '2024-12-25 10:54:54'),
(2952, 'english', 'Subscriber', 'Subscriber', '2024-12-25 10:56:59', '2024-12-25 10:56:59'),
(2954, 'english', 'Registered User', 'Registered User', '2024-12-25 11:05:59', '2024-12-25 11:05:59'),
(2956, 'english', 'Data not found.', 'Data not found.', '2024-12-25 11:07:49', '2024-12-25 11:07:49'),
(2958, 'english', 'subscriber delete successfully!', 'subscriber delete successfully!', '2024-12-25 11:09:38', '2024-12-25 11:09:38'),
(2960, 'english', 'You are already subscribed', 'You are already subscribed', '2024-12-25 11:11:42', '2024-12-25 11:11:42'),
(2962, 'english', 'Warning', 'Warning', '2024-12-25 11:11:42', '2024-12-25 11:11:42'),
(2964, 'english', 'Newsletter Subscriber', 'Newsletter Subscriber', '2024-12-25 11:12:43', '2024-12-25 11:12:43'),
(2966, 'english', 'Subscription delete successfully!', 'Subscription delete successfully!', '2024-12-25 11:20:28', '2024-12-25 11:20:28'),
(2968, 'english', 'Subject', 'Subject', '2024-12-25 11:31:12', '2024-12-25 11:31:12'),
(2970, 'english', 'Write  description', 'Write  description', '2024-12-25 11:33:44', '2024-12-25 11:33:44'),
(2972, 'english', 'Newsletter created successfully!', 'Newsletter created successfully!', '2024-12-25 11:37:48', '2024-12-25 11:37:48'),
(2974, 'english', 'Send Newsletter', 'Send Newsletter', '2024-12-25 11:43:09', '2024-12-25 11:43:09'),
(2976, 'english', 'Newsletter deleted successfully.', 'Newsletter deleted successfully.', '2024-12-25 11:53:14', '2024-12-25 11:53:14'),
(2978, 'english', 'Update Newsletter', 'Update Newsletter', '2024-12-25 12:00:26', '2024-12-25 12:00:26'),
(2980, 'english', 'Newsletter updated successfully.', 'Newsletter updated successfully.', '2024-12-25 12:21:38', '2024-12-25 12:21:38'),
(2982, 'english', 'Send To', 'Send To', '2024-12-25 12:30:51', '2024-12-25 12:30:51'),
(2984, 'english', 'Selected user', 'Selected user', '2024-12-25 12:30:51', '2024-12-25 12:30:51'),
(2986, 'english', 'All user', 'All user', '2024-12-25 12:30:51', '2024-12-25 12:30:51'),
(2988, 'english', 'All student', 'All student', '2024-12-25 12:30:51', '2024-12-25 12:30:51'),
(2990, 'english', 'All instructor', 'All instructor', '2024-12-25 12:30:51', '2024-12-25 12:30:51'),
(2992, 'english', 'All subscriber', 'All subscriber', '2024-12-25 12:30:51', '2024-12-25 12:30:51'),
(2994, 'english', 'Non registered user', 'Non registered user', '2024-12-25 12:30:51', '2024-12-25 12:30:51'),
(2996, 'english', 'Email sent successfully', 'Email sent successfully', '2024-12-26 07:13:54', '2024-12-26 07:13:54'),
(2998, 'english', 'Please select a user', 'Please select a user', '2024-12-26 07:21:40', '2024-12-26 07:21:40'),
(3000, 'english', 'SMTP Settings', 'SMTP Settings', '2024-12-26 09:36:42', '2024-12-26 09:36:42'),
(3002, 'english', 'Menu Settings', 'Menu Settings', '2024-12-26 09:39:42', '2024-12-26 09:39:42'),
(3004, 'english', 'You can re-order the Menu by dragging and dropping each of the Menu!', 'You can re-order the Menu by dragging and dropping each of the Menu!', '2024-12-26 11:05:45', '2024-12-26 11:05:45'),
(3006, 'english', 'You can reorder the menu by dragging and dropping each item! The way you arrange them here will be reflected on the frontend as well.', 'You can reorder the menu by dragging and dropping each item! The way you arrange them here will be reflected on the frontend as well.', '2024-12-26 11:17:10', '2024-12-26 11:17:10'),
(3008, 'english', 'MAIN MENU', 'MAIN MENU', '2024-12-27 14:39:14', '2024-12-27 14:39:14'),
(3010, 'english', 'All Customer', 'All Customer', '2024-12-27 14:40:29', '2024-12-27 14:40:29'),
(3012, 'english', 'Website FAQ', 'Website FAQ', '2024-12-27 14:58:10', '2024-12-27 14:58:10'),
(3014, 'english', 'Question', 'Question', '2024-12-27 15:01:19', '2024-12-27 15:01:19'),
(3016, 'english', 'Write a question', 'Write a question', '2024-12-27 15:01:19', '2024-12-27 15:01:19'),
(3018, 'english', 'Answer', 'Answer', '2024-12-27 15:01:19', '2024-12-27 15:01:19'),
(3020, 'english', 'Write a question answer', 'Write a question answer', '2024-12-27 15:01:19', '2024-12-27 15:01:19'),
(3022, 'english', 'Website Faqs update successfully', 'Website Faqs update successfully', '2024-12-27 15:05:39', '2024-12-27 15:05:39'),
(3024, 'english', 'Frequently Asked Questions', 'Frequently Asked Questions', '2024-12-27 15:10:51', '2024-12-27 15:10:51'),
(3026, 'english', 'Privacy policy', 'Privacy policy', '2024-12-27 15:18:28', '2024-12-27 15:18:28'),
(3028, 'english', 'Refund policy', 'Refund policy', '2024-12-27 15:18:28', '2024-12-27 15:18:28'),
(3030, 'english', 'Write description', 'Write description', '2024-12-27 15:24:26', '2024-12-27 15:24:26'),
(3032, 'english', 'Privacy-policy', 'Privacy-policy', '2024-12-27 15:46:44', '2024-12-27 15:46:44'),
(3034, 'english', 'Another Links', 'Another Links', '2024-12-27 15:58:00', '2024-12-27 15:58:00'),
(3036, 'english', 'Pricing Plan for Becoming Agent', 'Pricing Plan for Becoming Agent', '2024-12-27 15:58:03', '2024-12-27 15:58:03'),
(3038, 'english', 'Get In Touch', 'Get In Touch', '2024-12-27 16:27:19', '2024-12-27 16:27:19'),
(3040, 'english', 'Awesome  site. on the top advertising a Courses available business online includes assembling  site on the site.', 'Awesome  site. on the top advertising a Courses available business online includes assembling  site on the site.', '2024-12-27 16:27:19', '2024-12-27 16:27:19'),
(3042, 'english', 'Company', 'Company', '2024-12-27 16:48:31', '2024-12-27 16:48:31'),
(3044, 'english', 'I am bound by the terms of the service I accept Privacy Policy', 'I am bound by the terms of the service I accept Privacy Policy', '2024-12-27 16:48:31', '2024-12-27 16:48:31'),
(3046, 'english', 'Send Message', 'Send Message', '2024-12-27 16:48:31', '2024-12-27 16:48:31'),
(3048, 'english', 'Contact successfully', 'Contact successfully', '2024-12-27 17:09:42', '2024-12-27 17:09:42'),
(3050, 'english', 'Search Contact', 'Search Contact', '2024-12-27 17:29:52', '2024-12-27 17:29:52'),
(3052, 'english', 'Contact delete successfully!', 'Contact delete successfully!', '2024-12-27 17:44:20', '2024-12-27 17:44:20'),
(3055, 'english', 'Tamil', 'Tamil', '2024-12-27 18:11:36', '2024-12-27 18:11:36'),
(3057, 'english', 'Send reply', 'Send reply', '2024-12-27 18:16:59', '2024-12-27 18:16:59'),
(3060, 'english', 'Atlas Sign Up', 'Atlas Sign Up', '2024-12-27 19:04:35', '2024-12-27 19:04:35'),
(3063, 'english', 'Atlas Forgot Password', 'Atlas Forgot Password', '2024-12-27 19:12:23', '2024-12-27 19:12:23'),
(3066, 'english', 'Forgot Password', 'Forgot Password', '2024-12-27 19:17:54', '2024-12-27 19:17:54'),
(3069, 'english', 'Email :', 'Email :', '2024-12-28 05:28:59', '2024-12-28 05:28:59'),
(3072, 'english', 'User Full Name *', 'User Full Name *', '2024-12-28 06:52:50', '2024-12-28 06:52:50'),
(3075, 'english', 'Engine size', 'Engine size', '2024-12-28 07:50:20', '2024-12-28 07:50:20'),
(3078, 'english', 'Filter', 'Filter', '2024-12-28 08:38:18', '2024-12-28 08:38:18'),
(3081, 'english', '404 not found', '404 not found', '2024-12-29 04:55:43', '2024-12-29 04:55:43'),
(3084, 'english', 'The page you requested could not be found', 'The page you requested could not be found', '2024-12-29 04:55:43', '2024-12-29 04:55:43'),
(3087, 'english', 'Please try the following', 'Please try the following', '2024-12-29 04:55:43', '2024-12-29 04:55:43'),
(3090, 'english', 'Check the spelling of the url', 'Check the spelling of the url', '2024-12-29 04:55:43', '2024-12-29 04:55:43'),
(3093, 'english', 'If you are still puzzled, click on the home link below', 'If you are still puzzled, click on the home link below', '2024-12-29 04:55:43', '2024-12-29 04:55:43'),
(3096, 'english', 'Back to home', 'Back to home', '2024-12-29 04:55:43', '2024-12-29 04:55:43'),
(3099, 'english', '500 not found', '500 not found', '2024-12-29 05:05:15', '2024-12-29 05:05:15'),
(3102, 'english', '500 error found', '500 error found', '2024-12-29 05:05:15', '2024-12-29 05:05:15'),
(3105, 'english', 'A technical error has occurred', 'A technical error has occurred', '2024-12-29 05:05:15', '2024-12-29 05:05:15'),
(3108, 'english', 'Please contact with site administrator', 'Please contact with site administrator', '2024-12-29 05:05:15', '2024-12-29 05:05:15'),
(3111, 'english', 'Contact Email', 'Contact Email', '2024-12-29 05:05:15', '2024-12-29 05:05:15'),
(3114, 'english', 'Atlas Reset Password', 'Atlas Reset Password', '2024-12-29 05:45:26', '2024-12-29 05:45:26'),
(3117, 'english', 'Reset Password', 'Reset Password', '2024-12-29 05:45:26', '2024-12-29 05:45:26'),
(3120, 'english', 'Submit your account email address.', 'Submit your account email address.', '2024-12-29 05:45:26', '2024-12-29 05:45:26'),
(3123, 'english', 'Your Email', 'Your Email', '2024-12-29 05:45:26', '2024-12-29 05:45:26'),
(3126, 'english', 'A confirmation email has been sent. Please check your inbox to confirm access to this account from this device.', 'A confirmation email has been sent. Please check your inbox to confirm access to this account from this device.', '2024-12-29 06:32:46', '2024-12-29 06:32:46'),
(3129, 'english', 'A confirmation email has been sent. Please check your inbox.', 'A confirmation email has been sent. Please check your inbox.', '2024-12-29 06:35:10', '2024-12-29 06:35:10'),
(3132, 'english', 'Password Reset Successfully', 'Password Reset Successfully', '2024-12-29 06:37:04', '2024-12-29 06:37:04'),
(3135, 'english', 'Login Successfully', 'Login Successfully', '2024-12-29 06:39:27', '2024-12-29 06:39:27'),
(3147, 'english', 'Back to login Page.', 'Back to login Page.', '2024-12-29 07:08:36', '2024-12-29 07:08:36'),
(3150, 'english', 'Back to login.', 'Back to login.', '2024-12-29 07:09:49', '2024-12-29 07:09:49'),
(3153, 'english', 'A verification link has been sent to your email address.', 'A verification link has been sent to your email address.', '2024-12-29 08:13:45', '2024-12-29 08:13:45'),
(3156, 'english', 'Registered successfully!', 'Registered successfully!', '2024-12-29 08:15:16', '2024-12-29 08:15:16'),
(3162, 'english', 'Atlas Verify  Email', 'Atlas Verify  Email', '2024-12-29 09:00:07', '2024-12-29 09:00:07'),
(3165, 'english', 'Enter Verification COde', 'Enter Verification COde', '2024-12-29 09:00:07', '2024-12-29 09:00:07'),
(3168, 'english', 'Thanks for signing up! Before getting started, could you verify your email address by clicking on the link we just emailed to you? If you didn\'t receive the email, we will gladly send you another.', 'Thanks for signing up! Before getting started, could you verify your email address by clicking on the link we just emailed to you? If you didn\'t receive the email, we will gladly send you another.', '2024-12-29 09:00:07', '2024-12-29 09:00:07'),
(3171, 'english', 'Resend Verification Email', 'Resend Verification Email', '2024-12-29 09:00:07', '2024-12-29 09:00:07'),
(3174, 'english', 'A new verification link has been sent to the email address you provided during registration.', 'A new verification link has been sent to the email address you provided during registration.', '2024-12-29 09:00:18', '2024-12-29 09:00:18'),
(3183, 'english', 'Send Verification Email', 'Send Verification Email', '2024-12-29 10:29:51', '2024-12-29 10:29:51'),
(3192, 'english', 'Click Verify Email', 'Click Verify Email', '2024-12-29 10:49:09', '2024-12-29 10:49:09'),
(3195, 'english', 'Package update successfully!', 'Package update successfully!', '2024-12-29 12:35:41', '2024-12-29 12:35:41'),
(3204, 'english', 'Pay by Stripe', 'Pay by Stripe', '2024-12-30 05:36:59', '2024-12-30 05:36:59'),
(3207, 'english', 'Purchasing', 'Purchasing', '2024-12-30 06:48:46', '2024-12-30 06:48:46'),
(3210, 'english', 'Payment not configured yet', 'Payment not configured yet', '2024-12-30 07:12:31', '2024-12-30 07:12:31'),
(3213, 'english', 'Payment not configured yet!', 'Payment not configured yet!', '2024-12-30 07:26:11', '2024-12-30 07:26:11'),
(3222, 'english', 'Melanie Vasquez 124', 'Melanie Vasquez 124', '2024-12-30 10:02:17', '2024-12-30 10:02:17'),
(3225, 'english', 'Aliquid sit maxime a', 'Aliquid sit maxime a', '2024-12-30 10:02:17', '2024-12-30 10:02:17'),
(3228, 'english', 'Pay by Razorpay', 'Pay by Razorpay', '2024-12-30 10:19:04', '2024-12-30 10:19:04'),
(3231, 'english', 'Pay', 'Pay', '2024-12-30 10:32:38', '2024-12-30 10:32:38'),
(3234, 'english', 'Payment failed! Please try again.', 'Payment failed! Please try again.', '2024-12-30 10:58:20', '2024-12-30 10:58:20'),
(3237, 'english', 'User information updated!', 'User information updated!', '2024-12-30 12:18:41', '2024-12-30 12:18:41'),
(3243, 'english', 'pay by paystack', 'pay by paystack', '2024-12-31 04:52:58', '2024-12-31 04:52:58'),
(3246, 'english', 'Total Listing', 'Total Listing', '2024-12-31 05:50:55', '2024-12-31 05:50:55'),
(3249, 'english', 'Real-Estate Listing', 'Real-Estate Listing', '2024-12-31 05:56:25', '2024-12-31 05:56:25'),
(3252, 'english', 'Total Subscription', 'Total Subscription', '2024-12-31 06:05:18', '2024-12-31 06:05:18'),
(3255, 'english', 'Monthly Earnings for', 'Monthly Earnings for', '2024-12-31 09:19:21', '2024-12-31 09:19:21'),
(3258, 'english', 'Visible Listings as Percentages', 'Visible Listings as Percentages', '2024-12-31 09:51:45', '2024-12-31 09:51:45'),
(3261, 'english', 'Language updated successfully!', 'Language updated successfully!', '2024-12-31 10:00:45', '2024-12-31 10:00:45'),
(3339, 'english', 'Cars', 'Cars', '2024-12-31 11:01:05', '2024-12-31 11:01:05'),
(3342, 'english', 'Terms-and-condition', 'Terms-and-condition', '2024-12-31 11:25:45', '2024-12-31 11:25:45'),
(3348, 'english', 'Video Chat', 'Video Chat', '2025-01-02 07:46:10', '2025-01-02 07:46:10'),
(3351, 'english', 'Website name', 'Website name', '2025-01-02 09:57:02', '2025-01-02 09:57:02'),
(3354, 'english', 'Website Email', 'Website Email', '2025-01-02 09:57:02', '2025-01-02 09:57:02'),
(3357, 'english', 'Website keywords', 'Website keywords', '2025-01-02 09:57:02', '2025-01-02 09:57:02'),
(3360, 'english', 'Website Description', 'Website Description', '2025-01-02 09:57:02', '2025-01-02 09:57:02'),
(3363, 'english', 'Author', 'Author', '2025-01-02 09:57:02', '2025-01-02 09:57:02'),
(3366, 'english', 'Install successfully!', 'Install successfully!', '2025-01-02 10:52:56', '2025-01-02 10:52:56'),
(3372, 'english', 'Are you sure?', 'Are you sure?', '2025-03-11 09:34:42', '2025-03-11 09:34:42'),
(3373, 'english', 'You can\'t bring it back!', 'You can\'t bring it back!', '2025-03-11 09:34:42', '2025-03-11 09:34:42'),
(3374, 'english', 'Cancel', 'Cancel', '2025-03-11 09:34:42', '2025-03-11 09:34:42'),
(3375, 'english', 'Confirm', 'Confirm', '2025-03-11 09:34:42', '2025-03-11 09:34:42'),
(3376, 'english', 'Just Now', 'Just Now', '2025-03-11 09:34:42', '2025-03-11 09:34:42'),
(3377, 'english', 'Success !', 'Success !', '2025-03-11 09:34:42', '2025-03-11 09:34:42'),
(3378, 'english', 'Attention !', 'Attention !', '2025-03-11 09:34:42', '2025-03-11 09:34:42'),
(3379, 'english', 'An Error Occurred !', 'An Error Occurred !', '2025-03-11 09:34:42', '2025-03-11 09:34:42'),
(3380, 'english', 'Real-Estate Directory Listing', 'Real-Estate Directory Listing', '2025-03-11 09:34:52', '2025-03-11 09:34:52'),
(3381, 'english', 'Budget', 'Budget', '2025-03-11 09:34:52', '2025-03-11 09:34:52'),
(3382, 'english', 'New Properties', 'New Properties', '2025-03-11 09:34:52', '2025-03-11 09:34:52'),
(3383, 'english', 'Home | Atlas Directory Listing', 'Home | Atlas Directory Listing', '2025-03-11 09:35:37', '2025-03-11 09:35:37'),
(3384, 'english', 'Car Grid', 'Car Grid', '2025-03-11 09:35:47', '2025-03-11 09:35:47'),
(3386, 'english', 'Listing Cities', 'Listing Cities', '2025-03-11 09:36:11', '2025-03-11 09:36:11'),
(3387, 'english', 'Agent Packages', 'Agent Packages', '2025-03-11 09:36:11', '2025-03-11 09:36:11'),
(3388, 'english', 'Admin Panel', 'Admin Panel', '2025-03-11 09:36:11', '2025-03-11 09:36:11'),
(3389, 'english', 'Tags:', 'Tags:', '2025-03-11 09:50:29', '2025-03-11 09:50:29'),
(3390, 'english', 'Recent Post', 'Recent Post', '2025-03-11 09:51:40', '2025-03-11 09:51:40'),
(3391, 'english', 'Hotel Directory Listing', 'Hotel Directory Listing', '2025-03-11 10:17:17', '2025-03-11 10:17:17'),
(3392, 'english', 'Beauty Directory Listings', 'Beauty Directory Listings', '2025-03-11 10:18:32', '2025-03-11 10:18:32'),
(3393, 'english', '11.10.0', '11.10.0', '2025-03-11 10:47:33', '2025-03-11 10:47:33'),
(3394, 'english', 'Hotel Grid', 'Hotel Grid', '2025-03-11 10:55:59', '2025-03-11 10:55:59'),
(3395, 'english', 'Beauty Grid', 'Beauty Grid', '2025-03-11 10:56:05', '2025-03-11 10:56:05'),
(3396, 'english', 'Restaurant Grid', 'Restaurant Grid', '2025-03-11 10:56:10', '2025-03-11 10:56:10'),
(3397, 'english', 'Car Directory Listing', 'Car Directory Listing', '2025-03-11 10:56:14', '2025-03-11 10:56:14'),
(3398, 'english', 'User deleted successfully!', 'User deleted successfully!', '2025-03-11 11:13:42', '2025-03-11 11:13:42'),
(3399, 'english', 'Amenities Image', 'Amenities Image', '2025-03-11 11:24:35', '2025-03-11 11:24:35'),
(3400, 'english', 'upload a image', 'upload a image', '2025-03-11 11:24:35', '2025-03-11 11:24:35'),
(3401, 'english', 'Category added successful!', 'Category added successful!', '2025-03-11 12:02:09', '2025-03-11 12:02:09'),
(3402, 'english', 'max 500 x 700px', 'max 500 x 700px', '2025-03-11 12:04:43', '2025-03-11 12:04:43'),
(3404, 'english', 'Back to login', 'Back to login', '2025-03-12 05:04:41', '2025-03-12 05:04:41'),
(3406, 'english', 'Footer  Text', 'Footer  Text', '2025-03-12 05:11:59', '2025-03-12 05:11:59'),
(3407, 'english', 'Timezone', 'Timezone', '2025-03-12 05:11:59', '2025-03-12 05:11:59'),
(3408, 'english', 'Update Service', 'Update Service', '2025-03-12 07:12:30', '2025-03-12 07:12:30'),
(3409, 'english', 'Listing team create successful!', 'Listing team create successful!', '2025-03-12 07:30:44', '2025-03-12 07:30:44'),
(3410, 'english', 'Listing service create successful!', 'Listing service create successful!', '2025-03-12 07:32:03', '2025-03-12 07:32:03'),
(3411, 'english', 'Add to Wishlist', 'Add to Wishlist', '2025-03-12 07:32:13', '2025-03-12 07:32:13'),
(3412, 'english', 'Copy link to share', 'Copy link to share', '2025-03-12 07:32:22', '2025-03-12 07:32:22'),
(3413, 'english', 'Select date', 'Select date', '2025-03-12 07:32:22', '2025-03-12 07:32:22'),
(3414, 'english', 'Remove from Wishlist', 'Remove from Wishlist', '2025-03-12 07:37:54', '2025-03-12 07:37:54'),
(3415, 'english', 'Beauty List', 'Beauty List', '2025-03-12 07:42:08', '2025-03-12 07:42:08'),
(3416, 'english', 'Inbox is Empty', 'Inbox is Empty', '2025-03-12 08:10:06', '2025-03-12 08:10:06'),
(3417, 'english', 'No Messages Yet.', 'No Messages Yet.', '2025-03-12 08:10:06', '2025-03-12 08:10:06'),
(3418, 'english', 'It seems you haven\'t start conversion', 'It seems you haven\'t start conversion', '2025-03-12 08:10:06', '2025-03-12 08:10:06'),
(3419, 'english', ' with any of our professionals yet!', ' with any of our professionals yet!', '2025-03-12 08:10:06', '2025-03-12 08:10:06'),
(3420, 'english', 'Chat', 'Chat', '2025-03-12 08:10:21', '2025-03-12 08:10:21'),
(3421, 'english', 'All Listing Type', 'All Listing Type', '2025-03-12 09:28:32', '2025-03-12 09:28:32'),
(3422, 'english', 'View Frontend', 'View Frontend', '2025-03-12 09:41:36', '2025-03-12 09:41:36'),
(3423, 'english', 'Select  City', 'Select  City', '2025-03-12 09:46:45', '2025-03-12 09:46:45'),
(3424, 'english', 'You can\'t book your own business!', 'You can\'t book your own business!', '2025-03-12 10:04:54', '2025-03-12 10:04:54'),
(3425, 'english', 'Approve', 'Approve', '2025-03-12 10:18:52', '2025-03-12 10:18:52'),
(3426, 'english', 'Claim Listing', 'Claim Listing', '2025-03-12 11:46:54', '2025-03-12 11:46:54'),
(3427, 'english', 'Claim this listing', 'Claim this listing', '2025-03-12 11:56:49', '2025-03-12 11:56:49'),
(3428, 'english', 'Additional Proof', 'Additional Proof', '2025-03-12 12:03:49', '2025-03-12 12:03:49'),
(3429, 'english', 'Additional Info', 'Additional Info', '2025-03-12 12:05:08', '2025-03-12 12:05:08'),
(3430, 'english', 'Appointment placed successfully!', 'Appointment placed successfully!', '2025-03-12 12:33:52', '2025-03-12 12:33:52'),
(3431, 'english', 'Already Claimed', 'Already Claimed', '2025-03-13 07:07:25', '2025-03-13 07:07:25'),
(3432, 'english', 'Report Listing', 'Report Listing', '2025-03-13 07:41:19', '2025-03-13 07:41:19'),
(3433, 'english', 'Listing Owener', 'Listing Owener', '2025-03-13 10:05:03', '2025-03-13 10:05:03'),
(3434, 'english', 'Additional information', 'Additional information', '2025-03-13 10:05:03', '2025-03-13 10:05:03'),
(3435, 'english', 'Listing Owner', 'Listing Owner', '2025-03-13 10:34:14', '2025-03-13 10:34:14'),
(3436, 'english', 'Listings Type', 'Listings Type', '2025-03-13 10:34:14', '2025-03-13 10:34:14'),
(3437, 'english', 'Claimed listing has been deleted successfully!', 'Claimed listing has been deleted successfully!', '2025-03-13 10:53:05', '2025-03-13 10:53:05'),
(3438, 'english', 'You can it back!', 'You can it back!', '2025-03-13 11:18:24', '2025-03-13 11:18:24');
INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(3439, 'english', 'Once approved, this action cannot be reversed and will be finalized.', 'Once approved, this action cannot be reversed and will be finalized.', '2025-03-13 11:25:40', '2025-03-13 11:25:40'),
(3440, 'english', 'Listing not found.', 'Listing not found.', '2025-03-13 11:59:00', '2025-03-13 11:59:00'),
(3441, 'english', 'Listing has been approved successfully.', 'Listing has been approved successfully.', '2025-03-13 12:05:45', '2025-03-13 12:05:45'),
(3448, 'english', 'Hotel Category', 'Hotel Category', '2025-03-15 11:08:30', '2025-03-15 11:08:30'),
(3449, 'english', 'Hotels Category', 'Hotels Category', '2025-03-15 11:08:38', '2025-03-15 11:08:38'),
(3450, 'english', 'Real Estate Grid', 'Real Estate Grid', '2025-03-15 11:11:40', '2025-03-15 11:11:40'),
(3451, 'english', 'Restaurant Category', 'Restaurant Category', '2025-03-15 11:17:14', '2025-03-15 11:17:14'),
(3452, 'english', 'Real-estate Category', 'Real-estate Category', '2025-03-15 11:17:21', '2025-03-15 11:17:21'),
(3453, 'english', 'Claim', 'Claim', '2025-03-15 11:29:24', '2025-03-15 11:29:24'),
(3454, 'english', 'Claim Title', 'Claim Title', '2025-03-15 11:29:25', '2025-03-15 11:29:25'),
(3455, 'english', 'This directory is not yet verified !', 'This directory is not yet verified !', '2025-03-15 11:32:47', '2025-03-15 11:32:47'),
(3456, 'english', 'Provide Validity', 'Provide Validity', '2025-03-15 11:32:47', '2025-03-15 11:32:47'),
(3457, 'english', 'Enter Full Name', 'Enter Full Name', '2025-03-15 11:54:53', '2025-03-15 11:54:53'),
(3458, 'english', 'Enter Phonr Number', 'Enter Phonr Number', '2025-03-15 11:54:53', '2025-03-15 11:54:53'),
(3459, 'english', 'Enter Additional Info', 'Enter Additional Info', '2025-03-15 11:54:53', '2025-03-15 11:54:53'),
(3460, 'english', 'Enter Phone Number', 'Enter Phone Number', '2025-03-15 11:55:10', '2025-03-15 11:55:10'),
(3461, 'english', 'Listing has been Claimed successfully.', 'Listing has been Claimed successfully.', '2025-03-15 12:28:06', '2025-03-15 12:28:06'),
(3462, 'english', 'Remove verification Status', 'Remove verification Status', '2025-03-15 12:45:09', '2025-03-15 12:45:09'),
(3463, 'english', 'Claimed listing has been remove successfully!', 'Claimed listing has been remove successfully!', '2025-03-16 06:34:45', '2025-03-16 06:34:45'),
(3464, 'english', 'The claimed listing has been approved successfully!', 'The claimed listing has been approved successfully!', '2025-03-16 06:52:24', '2025-03-16 06:52:24'),
(3465, 'english', 'Engin Size', 'Engin Size', '2025-03-16 07:37:29', '2025-03-16 07:37:29'),
(3466, 'english', 'Welcome back ____', 'Welcome back ____', '2025-03-16 07:42:59', '2025-03-16 07:42:59'),
(3467, 'english', 'Car Category', 'Car Category', '2025-03-16 09:34:30', '2025-03-16 09:34:30'),
(3468, 'english', 'Beauty Category', 'Beauty Category', '2025-03-16 10:04:12', '2025-03-16 10:04:12'),
(3469, 'english', 'This listing is verified', 'This listing is verified', '2025-03-16 10:22:16', '2025-03-16 10:22:16'),
(3470, 'english', 'Car list', 'Car list', '2025-03-16 11:26:32', '2025-03-16 11:26:32'),
(3471, 'english', 'Enter number of person', 'Enter number of person', '2025-03-16 12:09:19', '2025-03-16 12:09:19'),
(3472, 'english', 'Enter number of child', 'Enter number of child', '2025-03-16 12:09:19', '2025-03-16 12:09:19'),
(3473, 'english', 'Update New Room', 'Update New Room', '2025-03-16 12:09:38', '2025-03-16 12:09:38'),
(3474, 'english', 'Hotel list', 'Hotel list', '2025-03-16 12:23:26', '2025-03-16 12:23:26'),
(3475, 'english', 'Restaurant Listing Details', 'Restaurant Listing Details', '2025-03-17 06:43:26', '2025-03-17 06:43:26'),
(3476, 'english', 'Enter year', 'Enter year', '2025-03-17 07:03:24', '2025-03-17 07:03:24'),
(3477, 'english', '3D Link', '3D Link', '2025-03-17 07:05:30', '2025-03-17 07:05:30'),
(3478, 'english', 'Report this listing', 'Report this listing', '2025-03-17 10:25:06', '2025-03-17 10:25:06'),
(3479, 'english', 'Report Type', 'Report Type', '2025-03-17 12:01:08', '2025-03-17 12:01:08'),
(3480, 'english', 'False Information', 'False Information', '2025-03-17 12:01:08', '2025-03-17 12:01:08'),
(3481, 'english', 'Spam / Fraud', 'Spam / Fraud', '2025-03-17 12:01:08', '2025-03-17 12:01:08'),
(3482, 'english', 'Inappropriate Content', 'Inappropriate Content', '2025-03-17 12:01:08', '2025-03-17 12:01:08'),
(3483, 'english', 'Others', 'Others', '2025-03-17 12:01:08', '2025-03-17 12:01:08'),
(3484, 'english', 'Already Reported', 'Already Reported', '2025-03-18 06:17:46', '2025-03-18 06:17:46'),
(3485, 'english', 'Report', 'Report', '2025-03-18 07:03:12', '2025-03-18 07:03:12'),
(3486, 'english', 'Owner:', 'Owner:', '2025-03-18 07:12:21', '2025-03-18 07:12:21'),
(3487, 'english', 'Listing Owner:', 'Listing Owner:', '2025-03-18 07:12:35', '2025-03-18 07:12:35'),
(3488, 'english', 'View Listing Frontend', 'View Listing Frontend', '2025-03-18 07:14:48', '2025-03-18 07:14:48'),
(3489, 'english', 'Report listing has been remove successfully!', 'Report listing has been remove successfully!', '2025-03-18 07:26:46', '2025-03-18 07:26:46'),
(3490, 'english', 'The Report listing has been approved successfully!', 'The Report listing has been approved successfully!', '2025-03-18 08:07:51', '2025-03-18 08:07:51'),
(3491, 'english', 'Reason', 'Reason', '2025-03-18 09:33:40', '2025-03-18 09:33:40'),
(3492, 'english', 'Reported by', 'Reported by', '2025-03-18 09:34:07', '2025-03-18 09:34:07'),
(3493, 'english', 'Report Delete', 'Report Delete', '2025-03-18 09:34:36', '2025-03-18 09:34:36'),
(3494, 'english', 'Listing Delete', 'Listing Delete', '2025-03-18 09:39:29', '2025-03-18 09:39:29'),
(3495, 'english', 'Listings Delete', 'Listings Delete', '2025-03-18 09:39:38', '2025-03-18 09:39:38'),
(3496, 'english', 'Select Report Type', 'Select Report Type', '2025-03-18 10:01:51', '2025-03-18 10:01:51'),
(3497, 'english', 'Report Type : ', 'Report Type : ', '2025-03-18 10:45:11', '2025-03-18 10:45:11'),
(3498, 'english', '360 X 360', '360 X 360', '2025-03-18 11:13:45', '2025-03-18 11:13:45'),
(3499, 'english', 'Addons', 'Addons', '2025-04-10 07:04:25', '2025-04-10 07:04:25'),
(3500, 'english', 'Renew support', 'Renew support', '2025-04-10 07:06:03', '2025-04-10 07:06:03'),
(3501, 'english', 'Update Product', 'Update Product', '2025-04-10 07:06:08', '2025-04-10 07:06:08'),
(3502, 'english', 'Version updated successfully!', 'Version updated successfully!', '2025-04-10 07:06:24', '2025-04-10 07:06:24'),
(3503, 'english', 'Directory Type', 'Directory Type', '2025-07-10 11:36:04', '2025-07-10 11:36:04'),
(3504, 'english', 'Manage Directory', 'Manage Directory', '2025-07-10 11:36:04', '2025-07-10 11:36:04'),
(3505, 'english', 'Admin Addon List', 'Admin Addon List', '2025-08-05 07:45:48', '2025-08-05 07:45:48'),
(3506, 'english', 'Addon Manager', 'Addon Manager', '2025-08-05 07:45:48', '2025-08-05 07:45:48'),
(3507, 'english', 'Add New Addon', 'Add New Addon', '2025-08-05 07:45:48', '2025-08-05 07:45:48'),
(3508, 'english', 'Select a valid zip file', 'Select a valid zip file', '2025-08-05 07:57:21', '2025-08-05 07:57:21'),
(3509, 'english', 'Refund-policy', 'Refund-policy', '2025-08-05 08:04:25', '2025-08-05 08:04:25'),
(3510, 'english', 'About-Us', 'About-Us', '2025-08-05 08:04:28', '2025-08-05 08:04:28'),
(3511, 'english', 'Promote your business and get discovered with ease — List your services on Listing Atlas, the smart directory solution.', 'Promote your business and get discovered with ease — List your services on Listing Atlas, the smart directory solution.', '2025-08-05 08:05:00', '2025-08-05 08:05:00'),
(3512, 'english', ' Update Sorting', ' Update Sorting', '2025-08-05 09:09:13', '2025-08-05 09:09:13'),
(3513, 'english', 'Sorting', 'Sorting', '2025-08-05 09:09:13', '2025-08-05 09:09:13'),
(3514, 'english', 'Add New Type', 'Add New Type', '2025-08-05 09:09:13', '2025-08-05 09:09:13'),
(3515, 'english', 'Add new Directory', 'Add new Directory', '2025-08-05 09:09:13', '2025-08-05 09:09:13'),
(3516, 'english', 'Deactive', 'Deactive', '2025-08-05 09:09:13', '2025-08-05 09:09:13'),
(3517, 'english', 'Update Type', 'Update Type', '2025-08-05 09:09:13', '2025-08-05 09:09:13'),
(3518, 'english', 'Enter Type Name', 'Enter Type Name', '2025-08-05 09:09:18', '2025-08-05 09:09:18'),
(3519, 'english', 'Enter addon purchase code', 'Enter addon purchase code', '2025-08-05 09:10:38', '2025-08-05 09:10:38'),
(3520, 'english', 'Zip file', 'Zip file', '2025-08-05 09:10:38', '2025-08-05 09:10:38'),
(3521, 'english', 'Upload addon file', 'Upload addon file', '2025-08-05 09:10:38', '2025-08-05 09:10:38'),
(3522, 'english', 'Install Addon', 'Install Addon', '2025-08-05 09:10:38', '2025-08-05 09:10:38'),
(3523, 'hindi', 'Hindi', 'Hindi', '2025-08-05 10:56:29', '2025-08-05 10:57:32'),
(3524, 'hindi', 'Language updated successfully!', 'Language updated successfully!', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3525, 'hindi', 'Language Settings', 'Language Settings', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3526, 'hindi', 'Add New Language', 'Add New Language', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3527, 'hindi', 'ID', 'ID', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3528, 'hindi', 'Language Name', 'Language Name', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3529, 'hindi', 'Action', 'Action', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3530, 'hindi', 'Edit Phrase', 'Edit Phrase', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3531, 'hindi', 'Update language', 'Update language', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3532, 'hindi', 'Edit', 'Edit', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3533, 'hindi', 'Delete', 'Delete', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3534, 'hindi', 'MAIN MENU', 'MAIN MENU', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3535, 'hindi', 'Dashboard', 'Dashboard', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3536, 'hindi', 'Directory Listings', 'Directory Listings', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3537, 'hindi', 'All Listings', 'All Listings', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3538, 'hindi', 'Hotel', 'होटल', '2025-08-05 10:56:37', '2026-06-17 08:18:42'),
(3539, 'hindi', 'Real-Estate', 'Real-Estate', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3540, 'hindi', 'Restaurant', 'Restaurant', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3541, 'hindi', 'Beauty', 'Beauty', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3542, 'hindi', 'Car', 'Car', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3543, 'hindi', 'Add Listing', 'Add Listing', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3544, 'hindi', 'Claim Listing', 'Claim Listing', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3545, 'hindi', 'Report Listing', 'Report Listing', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3546, 'hindi', 'Directory Type', 'Directory Type', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3547, 'hindi', 'Manage Directory', 'Manage Directory', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3548, 'hindi', 'Subscription History', 'Subscription History', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3549, 'hindi', 'Listing Categories', 'Listing Categories', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3550, 'hindi', 'Listing Amenities', 'Listing Amenities', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3551, 'hindi', 'Listing Cities', 'Listing Cities', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3552, 'hindi', 'Users', 'Users', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3553, 'hindi', 'Agent', 'Agent', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3554, 'hindi', 'Add New', 'Add New', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3555, 'hindi', 'All Agents', 'All Agents', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3556, 'hindi', 'Customer', 'Customer', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3557, 'hindi', 'All Customers', 'All Customers', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3558, 'hindi', 'Contacts', 'Contacts', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3559, 'hindi', 'Agent Packages', 'Agent Packages', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3560, 'hindi', 'Blogs', 'Blogs', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3561, 'hindi', 'All Blogs', 'All Blogs', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3562, 'hindi', 'Pending Blogs', 'Pending Blogs', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3563, 'hindi', 'Add Blogs', 'Add Blogs', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3564, 'hindi', 'Blog Category', 'Blog Category', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3565, 'hindi', 'Newsletter', 'Newsletter', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3566, 'hindi', 'Manage Newsletter', 'Manage Newsletter', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3567, 'hindi', 'Subscribed User', 'Subscribed User', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3568, 'hindi', 'Addons', 'Addons', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3569, 'hindi', 'Settings', 'Settings', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3570, 'hindi', 'System Settings', 'System Settings', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3571, 'hindi', 'Website Settings', 'Website Settings', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3572, 'hindi', 'Payment Settings', 'Payment Settings', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3573, 'hindi', 'SMTP Settings', 'SMTP Settings', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3574, 'hindi', 'SEO Settings', 'SEO Settings', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3575, 'hindi', 'About', 'About', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3576, 'hindi', 'My Profile', 'My Profile', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3577, 'hindi', 'Admin Panel', 'Admin Panel', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3578, 'hindi', 'View site', 'View site', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3579, 'hindi', 'Language', 'Language', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3580, 'hindi', 'Admin', 'Admin', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3581, 'hindi', 'Sign Out', 'Sign Out', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3582, 'hindi', 'Modal title', 'Modal title', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3583, 'hindi', 'Are you sure?', 'Are you sure?', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3584, 'hindi', 'You can\'t bring it back!', 'You can\'t bring it back!', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3585, 'hindi', 'Cancel', 'Cancel', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3586, 'hindi', 'Confirm', 'Confirm', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3587, 'hindi', 'Once approved, this action cannot be reversed and will be finalized.', 'Once approved, this action cannot be reversed and will be finalized.', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3588, 'hindi', 'Just Now', 'Just Now', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3589, 'hindi', 'Success !', 'Success !', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3590, 'hindi', 'Attention !', 'Attention !', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3591, 'hindi', 'An Error Occurred !', 'An Error Occurred !', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3592, 'hindi', 'Enter your keywords', 'Enter your keywords', '2025-08-05 10:56:37', '2025-08-05 10:57:32'),
(3593, 'hindi', 'Home | Atlas Directory Listing', 'Home | Atlas Directory Listing', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3594, 'hindi', 'Category', 'Category', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3595, 'hindi', 'Select Category', 'Select Category', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3596, 'hindi', 'Type', 'Type', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3597, 'hindi', 'Select Type', 'Select Type', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3598, 'hindi', 'Top', 'Top', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3599, 'hindi', 'Popular', 'Popular', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3600, 'hindi', 'City', 'City', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3601, 'hindi', 'Select City', 'Select City', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3602, 'hindi', 'Search', 'Search', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3603, 'hindi', 'Choose Category', 'Choose Category', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3604, 'hindi', 'Choose Type', 'Choose Type', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3605, 'hindi', 'Rent', 'Rent', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3606, 'hindi', 'sell', 'sell', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3607, 'hindi', 'Budget', 'Budget', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3608, 'hindi', 'Choose your budget', 'Choose your budget', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3609, 'hindi', 'Country', 'Country', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3610, 'hindi', 'Select Country', 'Select Country', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3611, 'hindi', 'Model', 'Model', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3612, 'hindi', 'Choose Model', 'Choose Model', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3613, 'hindi', 'Brand', 'Brand', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3614, 'hindi', 'Choose Brand', 'Choose Brand', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3615, 'hindi', 'Year', 'Year', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3616, 'hindi', 'Choose Year', 'Choose Year', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3617, 'hindi', 'Browse Top Categories.', 'Browse Top Categories.', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3618, 'hindi', 'Featured Listings', 'Featured Listings', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3619, 'hindi', 'We Have Worked with ', 'We Have Worked with ', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3620, 'hindi', '10,000', '10,000', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3621, 'hindi', ' Trusted Companies', ' Trusted Companies', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3622, 'hindi', 'What the people Thinks About Us', 'What the people Thinks About Us', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3623, 'hindi', 'Pickup New Updates', 'Pickup New Updates', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3624, 'hindi', 'More', 'More', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3625, 'hindi', 'Contact', 'Contact', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3626, 'hindi', 'Pricing', 'Pricing', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3627, 'hindi', 'Log Out', 'Log Out', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3628, 'hindi', 'Sign up to our newsletter', 'Sign up to our newsletter', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3629, 'hindi', 'Stay up to date with the latest news, announcements, and articles.', 'Stay up to date with the latest news, announcements, and articles.', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3630, 'hindi', 'Enter your email Address', 'Enter your email Address', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3631, 'hindi', 'Subscribe', 'Subscribe', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3632, 'hindi', 'Quick links', 'Quick links', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3633, 'hindi', 'About Us', 'About Us', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3634, 'hindi', 'Privacy Policy', 'Privacy Policy', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3635, 'hindi', 'Terms and Condition', 'Terms and Condition', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3636, 'hindi', 'Refund Policy', 'Refund Policy', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3637, 'hindi', 'Categories', 'Categories', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3638, 'hindi', 'Another Links', 'Another Links', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3639, 'hindi', 'Blog', 'Blog', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3640, 'hindi', 'Contact Us', 'Contact Us', '2025-08-05 10:56:45', '2025-08-05 10:57:32'),
(3641, 'hindi', 'Change Phrase', 'Change Phrase', '2025-08-05 10:56:55', '2025-08-05 10:57:32'),
(3642, 'hindi', 'Language Phrase', 'Language Phrase', '2025-08-05 10:56:55', '2025-08-05 10:57:32'),
(3643, 'hindi', 'Back', 'Back', '2025-08-05 10:56:55', '2025-08-05 10:57:32'),
(3644, 'hindi', 'Save', 'Save', '2025-08-05 10:56:55', '2025-08-05 10:57:32'),
(3645, 'hindi', 'Enter language name', 'Enter language name', '2025-08-05 10:57:25', '2025-08-05 10:57:32'),
(3646, 'hindi', 'Update', 'Update', '2025-08-05 10:57:25', '2025-08-05 10:57:32'),
(3647, 'hindi', 'Login', 'Login', '2025-08-05 10:57:34', '2025-08-05 10:57:34'),
(3648, 'hindi', 'Payment', 'Payment', '2025-08-05 10:57:38', '2025-08-05 10:57:38'),
(3649, 'hindi', 'Payment Gateways List', 'Payment Gateways List', '2025-08-05 10:57:38', '2025-08-05 10:57:38'),
(3650, 'hindi', 'Title', 'Title', '2025-08-05 10:57:38', '2025-08-05 10:57:38'),
(3651, 'hindi', 'Currency', 'Currency', '2025-08-05 10:57:38', '2025-08-05 10:57:38'),
(3652, 'hindi', 'Status', 'Status', '2025-08-05 10:57:38', '2025-08-05 10:57:38'),
(3653, 'hindi', 'Inactive', 'Inactive', '2025-08-05 10:57:38', '2025-08-05 10:57:38'),
(3654, 'hindi', 'Change Status', 'Change Status', '2025-08-05 10:57:38', '2025-08-05 10:57:38'),
(3655, 'hindi', 'Credentials Update', 'Credentials Update', '2025-08-05 10:57:43', '2025-08-05 10:57:43'),
(3656, 'hindi', 'Payment currency', 'Payment currency', '2025-08-05 10:57:43', '2025-08-05 10:57:43'),
(3657, 'hindi', 'Email Settings', 'Email Settings', '2025-08-05 10:57:51', '2025-08-05 10:57:51'),
(3658, 'hindi', 'Protocol (smtp or ssmtp or mail)', 'Protocol (smtp or ssmtp or mail)', '2025-08-05 10:57:51', '2025-08-05 10:57:51'),
(3659, 'hindi', 'Smtp crypto (ssl or tls)', 'Smtp crypto (ssl or tls)', '2025-08-05 10:57:51', '2025-08-05 10:57:51'),
(3660, 'hindi', 'Crypto (ssl or tls)', 'Crypto (ssl or tls)', '2025-08-05 10:57:51', '2025-08-05 10:57:51'),
(3661, 'hindi', 'Smtp host', 'Smtp host', '2025-08-05 10:57:51', '2025-08-05 10:57:51'),
(3662, 'hindi', 'Smtp port', 'Smtp port', '2025-08-05 10:57:51', '2025-08-05 10:57:51'),
(3663, 'hindi', 'Smtp username', 'Smtp username', '2025-08-05 10:57:51', '2025-08-05 10:57:51'),
(3664, 'hindi', 'Smtp password', 'Smtp password', '2025-08-05 10:57:51', '2025-08-05 10:57:51'),
(3665, 'hindi', 'Manage SEO Settings', 'Manage SEO Settings', '2025-08-05 10:57:55', '2025-08-05 10:57:55'),
(3666, 'hindi', 'Meta Title', 'Meta Title', '2025-08-05 10:57:55', '2025-08-05 10:57:55'),
(3667, 'hindi', 'Meta Keywords', 'Meta Keywords', '2025-08-05 10:57:55', '2025-08-05 10:57:55'),
(3668, 'hindi', 'Writing your keyword and hit the enter', 'Writing your keyword and hit the enter', '2025-08-05 10:57:55', '2025-08-05 10:57:55'),
(3669, 'hindi', 'Meta Description', 'Meta Description', '2025-08-05 10:57:55', '2025-08-05 10:57:55'),
(3670, 'hindi', 'Meta Robot', 'Meta Robot', '2025-08-05 10:57:55', '2025-08-05 10:57:55'),
(3671, 'hindi', ' Canonical Url', ' Canonical Url', '2025-08-05 10:57:55', '2025-08-05 10:57:55'),
(3672, 'hindi', ' Custom Url', ' Custom Url', '2025-08-05 10:57:55', '2025-08-05 10:57:55'),
(3673, 'hindi', 'Og Title', 'Og Title', '2025-08-05 10:57:55', '2025-08-05 10:57:55'),
(3674, 'hindi', 'Og Description', 'Og Description', '2025-08-05 10:57:56', '2025-08-05 10:57:56'),
(3675, 'hindi', 'Og Image', 'Og Image', '2025-08-05 10:57:56', '2025-08-05 10:57:56'),
(3676, 'hindi', 'Json Id', 'Json Id', '2025-08-05 10:57:56', '2025-08-05 10:57:56'),
(3677, 'hindi', 'Submit', 'Submit', '2025-08-05 10:57:56', '2025-08-05 10:57:56'),
(3678, 'hindi', 'Not found', 'Not found', '2025-08-05 10:59:41', '2025-08-05 10:59:41'),
(3679, 'hindi', 'About This Application', 'About This Application', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3680, 'hindi', 'Software version', 'Software version', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3681, 'hindi', 'Laravel version', 'Laravel version', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3682, 'hindi', '11.10.0', '11.10.0', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3683, 'hindi', 'Check update', 'Check update', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3684, 'hindi', 'Php version', 'Php version', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3685, 'hindi', 'Curl enable', 'Curl enable', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3686, 'hindi', 'enabled', 'enabled', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3687, 'hindi', 'Purchase code', 'Purchase code', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3688, 'hindi', 'Product license', 'Product license', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3689, 'hindi', 'Customer support status', 'Customer support status', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3690, 'hindi', 'Support expiry date', 'Support expiry date', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3691, 'hindi', 'Customer name', 'Customer name', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3692, 'hindi', 'Get customer support', 'Get customer support', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3693, 'hindi', 'Customer support', 'Customer support', '2025-08-05 10:59:43', '2025-08-05 10:59:43'),
(3694, 'hindi', 'Profile', 'Profile', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3695, 'hindi', 'Profile Settings', 'Profile Settings', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3696, 'hindi', 'Profile Information', 'Profile Information', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3697, 'hindi', 'User Name', 'User Name', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3698, 'hindi', 'Enter user name', 'Enter user name', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3699, 'hindi', 'User Email', 'User Email', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3700, 'hindi', 'Enter user email', 'Enter user email', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3701, 'hindi', 'User Image', 'User Image', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3702, 'hindi', 'Password Update', 'Password Update', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3703, 'hindi', 'Current Password', 'Current Password', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3704, 'hindi', 'New Password', 'New Password', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3705, 'hindi', 'Confirm Password', 'Confirm Password', '2025-08-05 10:59:59', '2025-08-05 10:59:59'),
(3706, 'hindi', 'Admin Dashboard', 'Admin Dashboard', '2025-08-05 11:00:06', '2025-08-05 11:00:06'),
(3707, 'hindi', 'All User', 'All User', '2025-08-05 11:00:06', '2025-08-05 11:00:06'),
(3708, 'hindi', 'Subscriber', 'Subscriber', '2025-08-05 11:00:06', '2025-08-05 11:00:06'),
(3709, 'hindi', 'Total Subscription', 'Total Subscription', '2025-08-05 11:00:06', '2025-08-05 11:00:06'),
(3710, 'hindi', 'Total Listing', 'Total Listing', '2025-08-05 11:00:06', '2025-08-05 11:00:06'),
(3711, 'hindi', 'Real estate', 'Real estate', '2025-08-05 11:00:07', '2025-08-05 11:00:07'),
(3712, 'hindi', 'Visible Listings as Percentages', 'Visible Listings as Percentages', '2025-08-05 11:00:07', '2025-08-05 11:00:07'),
(3713, 'hindi', 'Monthly Earnings for', 'Monthly Earnings for', '2025-08-05 11:00:07', '2025-08-05 11:00:07'),
(3714, 'hindi', ' Update Sorting', ' Update Sorting', '2025-08-05 11:00:25', '2025-08-05 11:00:25'),
(3715, 'hindi', 'Sorting', 'Sorting', '2025-08-05 11:00:25', '2025-08-05 11:00:25'),
(3716, 'hindi', 'Add New Type', 'Add New Type', '2025-08-05 11:00:25', '2025-08-05 11:00:25'),
(3717, 'hindi', 'Add new Directory', 'Add new Directory', '2025-08-05 11:00:25', '2025-08-05 11:00:25'),
(3718, 'hindi', 'Name', 'Name', '2025-08-05 11:00:25', '2025-08-05 11:00:25'),
(3719, 'hindi', 'Active', 'Active', '2025-08-05 11:00:25', '2025-08-05 11:00:25'),
(3720, 'hindi', 'Deactive', 'Deactive', '2025-08-05 11:00:25', '2025-08-05 11:00:25'),
(3721, 'hindi', 'Update Type', 'Update Type', '2025-08-05 11:00:25', '2025-08-05 11:00:25'),
(3722, 'hindi', 'Enter Type Name', 'Enter Type Name', '2025-08-05 11:00:29', '2025-08-05 11:00:29'),
(3723, 'hindi', 'Logo', 'Logo', '2025-08-05 11:00:29', '2025-08-05 11:00:29'),
(3724, 'hindi', 'Image', 'Image', '2025-08-05 11:00:29', '2025-08-05 11:00:29'),
(3725, 'hindi', 'Save Changes', 'Save Changes', '2025-08-05 11:00:34', '2025-08-05 11:00:34'),
(3726, 'hindi', 'Category Create', 'Category Create', '2025-08-05 11:00:48', '2025-08-05 11:00:48'),
(3727, 'hindi', 'Add new category', 'Add new category', '2025-08-05 11:00:48', '2025-08-05 11:00:48'),
(3728, 'hindi', 'No data found', 'No data found', '2025-08-05 11:00:48', '2025-08-05 11:00:48'),
(3729, 'hindi', '404 not found', '404 not found', '2025-08-05 11:00:59', '2025-08-05 11:00:59'),
(3730, 'hindi', 'The page you requested could not be found', 'The page you requested could not be found', '2025-08-05 11:00:59', '2025-08-05 11:00:59'),
(3731, 'hindi', 'Please try the following', 'Please try the following', '2025-08-05 11:00:59', '2025-08-05 11:00:59'),
(3732, 'hindi', 'Check the spelling of the url', 'Check the spelling of the url', '2025-08-05 11:00:59', '2025-08-05 11:00:59'),
(3733, 'hindi', 'If you are still puzzled, click on the home link below', 'If you are still puzzled, click on the home link below', '2025-08-05 11:00:59', '2025-08-05 11:00:59'),
(3734, 'hindi', 'Back to home', 'Back to home', '2025-08-05 11:00:59', '2025-08-05 11:00:59'),
(3735, 'hindi', 'Back to home', 'Back to home', '2025-08-05 11:00:59', '2025-08-05 11:00:59'),
(3736, 'hindi', 'Category name', 'Category name', '2025-08-05 11:01:03', '2025-08-05 11:01:03'),
(3737, 'hindi', 'Enter Category Name', 'Enter Category Name', '2025-08-05 11:01:03', '2025-08-05 11:01:03'),
(3738, 'hindi', 'Category parent', 'Category parent', '2025-08-05 11:01:03', '2025-08-05 11:01:03'),
(3739, 'hindi', 'Select Category parent', 'Select Category parent', '2025-08-05 11:01:03', '2025-08-05 11:01:03'),
(3740, 'hindi', 'Amenities', 'Amenities', '2025-08-05 11:01:44', '2025-08-05 11:01:44'),
(3741, 'hindi', 'Amenities Create', 'Amenities Create', '2025-08-05 11:01:44', '2025-08-05 11:01:44'),
(3742, 'hindi', 'Add', 'Add', '2025-08-05 11:01:44', '2025-08-05 11:01:44'),
(3743, 'hindi', 'Features', 'Features', '2025-08-05 11:01:44', '2025-08-05 11:01:44'),
(3744, 'hindi', 'Amenities List', 'Amenities List', '2025-08-05 11:01:44', '2025-08-05 11:01:44'),
(3745, 'hindi', 'Amenities Name', 'Amenities Name', '2025-08-05 11:01:49', '2025-08-05 11:01:49'),
(3746, 'hindi', 'Enter name', 'Enter name', '2025-08-05 11:01:49', '2025-08-05 11:01:49'),
(3747, 'hindi', 'Amenities Image', 'Amenities Image', '2025-08-05 11:01:49', '2025-08-05 11:01:49'),
(3748, 'hindi', 'upload a image', 'upload a image', '2025-08-05 11:01:49', '2025-08-05 11:01:49'),
(3749, 'hindi', 'Create', 'Create', '2025-08-05 11:01:49', '2025-08-05 11:01:49'),
(3750, 'hindi', 'Cities', 'Cities', '2025-08-05 11:01:55', '2025-08-05 11:01:55'),
(3751, 'hindi', 'City Lists', 'City Lists', '2025-08-05 11:01:55', '2025-08-05 11:01:55'),
(3752, 'hindi', 'Add New City', 'Add New City', '2025-08-05 11:01:55', '2025-08-05 11:01:55'),
(3753, 'hindi', 'City name', 'City name', '2025-08-05 11:02:00', '2025-08-05 11:02:00'),
(3754, 'hindi', 'Enter City Name', 'Enter City Name', '2025-08-05 11:02:00', '2025-08-05 11:02:00'),
(3755, 'hindi', 'Country Name', 'Country Name', '2025-08-05 11:02:00', '2025-08-05 11:02:00'),
(3756, 'hindi', 'Select Country Name', 'Select Country Name', '2025-08-05 11:02:00', '2025-08-05 11:02:00'),
(3757, 'hindi', 'City Image', 'City Image', '2025-08-05 11:02:00', '2025-08-05 11:02:00'),
(3758, 'hindi', 'City added successfully!', 'City added successfully!', '2025-08-05 11:03:11', '2025-08-05 11:03:11'),
(3759, 'hindi', 'Edit City', 'Edit City', '2025-08-05 11:03:11', '2025-08-05 11:03:11'),
(3760, 'hindi', 'Edit Country', 'Edit Country', '2025-08-05 11:03:11', '2025-08-05 11:03:11'),
(3761, 'hindi', 'Choose country thumbnail', 'Choose country thumbnail', '2025-08-05 11:03:15', '2025-08-05 11:03:15'),
(3762, 'hindi', 'optional', 'optional', '2025-08-05 11:03:15', '2025-08-05 11:03:15'),
(3763, 'hindi', 'Country thumbnail update successfully!', 'Country thumbnail update successfully!', '2025-08-05 11:04:26', '2025-08-05 11:04:26'),
(3764, 'hindi', 'Search Contact', 'Search Contact', '2025-08-05 11:05:01', '2025-08-05 11:05:01'),
(3765, 'english', 'Directory Deactive successfully!', 'Directory Deactive successfully!', '2025-08-05 11:07:43', '2025-08-05 11:07:43'),
(3766, 'hindi', 'Directory Deactive successfully!', 'Directory Deactive successfully!', '2025-08-05 11:07:43', '2025-08-05 11:07:43'),
(3767, 'english', 'Directory Create successfully!', 'Directory Create successfully!', '2025-08-05 11:08:49', '2025-08-05 11:08:49'),
(3768, 'hindi', 'Directory Create successfully!', 'Directory Create successfully!', '2025-08-05 11:08:49', '2025-08-05 11:08:49'),
(3769, 'english', 'Food', 'Food', '2025-08-05 11:08:49', '2025-08-05 11:08:49'),
(3770, 'hindi', 'Food', 'Food', '2025-08-05 11:08:49', '2025-08-05 11:08:49'),
(3771, 'english', 'Fitness', 'Fitness', '2025-08-05 11:09:41', '2025-08-05 11:09:41'),
(3772, 'hindi', 'Fitness', 'Fitness', '2025-08-05 11:09:41', '2025-08-05 11:09:41'),
(3773, 'english', 'Grooming', 'Grooming', '2025-08-05 11:09:52', '2025-08-05 11:09:52'),
(3774, 'hindi', 'Grooming', 'Grooming', '2025-08-05 11:09:52', '2025-08-05 11:09:52'),
(3775, 'english', 'Manufacturing', 'Manufacturing', '2025-08-05 11:10:07', '2025-08-05 11:10:07'),
(3776, 'hindi', 'Manufacturing', 'Manufacturing', '2025-08-05 11:10:07', '2025-08-05 11:10:07'),
(3777, 'english', 'Trading', 'Trading', '2025-08-05 11:10:17', '2025-08-05 11:10:17'),
(3778, 'hindi', 'Trading', 'Trading', '2025-08-05 11:10:17', '2025-08-05 11:10:17'),
(3779, 'english', 'Automobiles', 'Automobiles', '2025-08-05 11:10:27', '2025-08-05 11:10:27'),
(3780, 'hindi', 'Automobiles', 'Automobiles', '2025-08-05 11:10:27', '2025-08-05 11:10:27'),
(3781, 'english', 'Recreation', 'Recreation', '2025-08-05 11:10:40', '2025-08-05 11:10:40'),
(3782, 'hindi', 'Recreation', 'Recreation', '2025-08-05 11:10:40', '2025-08-05 11:10:40'),
(3783, 'english', 'Printing Services', 'Printing Services', '2025-08-05 11:10:50', '2025-08-05 11:10:50'),
(3784, 'hindi', 'Printing Services', 'Printing Services', '2025-08-05 11:10:50', '2025-08-05 11:10:50'),
(3785, 'english', 'Industrial', 'Industrial', '2025-08-05 11:11:01', '2025-08-05 11:11:01'),
(3786, 'hindi', 'Industrial', 'Industrial', '2025-08-05 11:11:01', '2025-08-05 11:11:01'),
(3787, 'english', 'IT Services', 'IT Services', '2025-08-05 11:11:12', '2025-08-05 11:11:12'),
(3788, 'hindi', 'IT Services', 'IT Services', '2025-08-05 11:11:12', '2025-08-05 11:11:12'),
(3789, 'english', 'Agencies', 'Agencies', '2025-08-05 11:11:22', '2025-08-05 11:11:22'),
(3790, 'hindi', 'Agencies', 'Agencies', '2025-08-05 11:11:22', '2025-08-05 11:11:22'),
(3791, 'english', 'Popular Services', 'Popular Services', '2025-08-05 11:11:29', '2025-08-05 11:11:29'),
(3792, 'hindi', 'Popular Services', 'Popular Services', '2025-08-05 11:11:29', '2025-08-05 11:11:29'),
(3793, 'hindi', 'Filters', 'Filters', '2025-08-05 11:12:41', '2025-08-05 11:12:41'),
(3794, 'hindi', 'Clear', 'Clear', '2025-08-05 11:12:41', '2025-08-05 11:12:41'),
(3795, 'hindi', 'Showing', 'Showing', '2025-08-05 11:12:41', '2025-08-05 11:12:41'),
(3796, 'hindi', 'of', 'of', '2025-08-05 11:12:41', '2025-08-05 11:12:41'),
(3797, 'hindi', 'results', 'results', '2025-08-05 11:12:41', '2025-08-05 11:12:41'),
(3798, 'hindi', 'No Result Found', 'No Result Found', '2025-08-05 11:12:41', '2025-08-05 11:12:41'),
(3799, 'hindi', 'No Data were found matching your selection.', 'No Data were found matching your selection.', '2025-08-05 11:12:41', '2025-08-05 11:12:41'),
(3800, 'hindi', 'Go Back', 'Go Back', '2025-08-05 11:12:41', '2025-08-05 11:12:41'),
(3801, 'hindi', 'Category added successful!', 'Category added successful!', '2025-08-05 11:14:31', '2025-08-05 11:14:31'),
(3802, 'hindi', 'Parent', 'Parent', '2025-08-05 11:14:31', '2025-08-05 11:14:31'),
(3803, 'hindi', 'Edit Category', 'Edit Category', '2025-08-05 11:14:31', '2025-08-05 11:14:31'),
(3804, 'hindi', 'Category update successful!', 'Category update successful!', '2025-08-05 11:22:44', '2025-08-05 11:22:44'),
(3805, 'hindi', 'Get Started Now', 'Get Started Now', '2025-08-05 12:57:41', '2025-08-05 12:57:41'),
(3806, 'hindi', 'Enter your credentials to access your account', 'Enter your credentials to access your account', '2025-08-05 12:57:41', '2025-08-05 12:57:41'),
(3807, 'hindi', 'Email', 'Email', '2025-08-05 12:57:41', '2025-08-05 12:57:41'),
(3808, 'hindi', 'Password', 'Password', '2025-08-05 12:57:41', '2025-08-05 12:57:41'),
(3809, 'hindi', 'Forget your password', 'Forget your password', '2025-08-05 12:57:41', '2025-08-05 12:57:41'),
(3810, 'hindi', 'Don\'t an account', 'Don\'t an account', '2025-08-05 12:57:41', '2025-08-05 12:57:41'),
(3811, 'hindi', 'Sign up', 'Sign up', '2025-08-05 12:57:41', '2025-08-05 12:57:41'),
(3812, 'hindi', 'Welcome back ____', 'Welcome back ____', '2025-08-05 13:36:36', '2025-08-05 13:36:36'),
(3813, 'hindi', 'Create Listing', 'Create Listing', '2025-08-05 13:36:46', '2025-08-05 13:36:46'),
(3814, 'hindi', 'Listing Type', 'Listing Type', '2025-08-05 13:36:46', '2025-08-05 13:36:46'),
(3815, 'hindi', 'Select listing type', 'Select listing type', '2025-08-05 13:36:46', '2025-08-05 13:36:46'),
(3816, 'hindi', 'Listing Category', 'Listing Category', '2025-08-05 13:36:46', '2025-08-05 13:36:46'),
(3817, 'hindi', 'Select listing type first', 'Select listing type first', '2025-08-05 13:36:46', '2025-08-05 13:36:46'),
(3818, 'hindi', 'Select Listing type from dropdown.', 'Select Listing type from dropdown.', '2025-08-05 13:36:46', '2025-08-05 13:36:46'),
(3819, 'hindi', 'Select listing category', 'Select listing category', '2025-08-05 13:36:46', '2025-08-05 13:36:46'),
(3820, 'hindi', 'Basic Info', 'Basic Info', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3821, 'hindi', 'Address', 'Address', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3822, 'hindi', 'Seo', 'Seo', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3823, 'hindi', 'Media', 'Media', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3824, 'hindi', 'Listing title', 'Listing title', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3825, 'hindi', 'Enter listing title', 'Enter listing title', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3826, 'hindi', 'Description', 'Description', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3827, 'hindi', 'Enter listing description', 'Enter listing description', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3828, 'hindi', 'Visibility', 'Visibility', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3829, 'hindi', 'Select listing visibility', 'Select listing visibility', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3830, 'hindi', 'Visible', 'Visible', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3831, 'hindi', 'Hidden', 'Hidden', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3832, 'hindi', 'Feature', 'Feature', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3833, 'hindi', 'Latitude', 'Latitude', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3834, 'hindi', 'Enter Latitude code', 'Enter Latitude code', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3835, 'hindi', 'Longitude', 'Longitude', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3836, 'hindi', 'Enter longitude code', 'Enter longitude code', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3837, 'hindi', 'Select listing country', 'Select listing country', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3838, 'hindi', 'Afghanistan', 'Afghanistan', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3839, 'hindi', 'Aland Islands', 'Aland Islands', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3840, 'hindi', 'Albania', 'Albania', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3841, 'hindi', 'Algeria', 'Algeria', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3842, 'hindi', 'AmericanSamoa', 'AmericanSamoa', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3843, 'hindi', 'Andorra', 'Andorra', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3844, 'hindi', 'Angola', 'Angola', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3845, 'hindi', 'Anguilla', 'Anguilla', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3846, 'hindi', 'Antarctica', 'Antarctica', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3847, 'hindi', 'Antigua and Barbuda', 'Antigua and Barbuda', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3848, 'hindi', 'Argentina', 'Argentina', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3849, 'hindi', 'Armenia', 'Armenia', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3850, 'hindi', 'Aruba', 'Aruba', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3851, 'hindi', 'Australia', 'Australia', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3852, 'hindi', 'Austria', 'Austria', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3853, 'hindi', 'Azerbaijan', 'Azerbaijan', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3854, 'hindi', 'Bahamas', 'Bahamas', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3855, 'hindi', 'Bahrain', 'Bahrain', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3856, 'hindi', 'Bangladesh', 'Bangladesh', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3857, 'hindi', 'Barbados', 'Barbados', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3858, 'hindi', 'Belarus', 'Belarus', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3859, 'hindi', 'Belgium', 'Belgium', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3860, 'hindi', 'Belize', 'Belize', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3861, 'hindi', 'Benin', 'Benin', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3862, 'hindi', 'Bermuda', 'Bermuda', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3863, 'hindi', 'Bhutan', 'Bhutan', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3864, 'hindi', 'Bolivia, Plurination', 'Bolivia, Plurination', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3865, 'hindi', 'Bosnia and Herzegovi', 'Bosnia and Herzegovi', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3866, 'hindi', 'Botswana', 'Botswana', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3867, 'hindi', 'Brazil', 'Brazil', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3868, 'hindi', 'British Indian Ocean', 'British Indian Ocean', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3869, 'hindi', 'Brunei Darussalam', 'Brunei Darussalam', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3870, 'hindi', 'Bulgaria', 'Bulgaria', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3871, 'hindi', 'Burkina Faso', 'Burkina Faso', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3872, 'hindi', 'Burundi', 'Burundi', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3873, 'hindi', 'Cambodia', 'Cambodia', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3874, 'hindi', 'Cameroon', 'Cameroon', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3875, 'hindi', 'Canada', 'Canada', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3876, 'hindi', 'Cape Verde', 'Cape Verde', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3877, 'hindi', 'Cayman Islands', 'Cayman Islands', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3878, 'hindi', 'Central African Repu', 'Central African Repu', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3879, 'hindi', 'Chad', 'Chad', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3880, 'hindi', 'Chile', 'Chile', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3881, 'hindi', 'China', 'China', '2025-08-05 13:36:56', '2025-08-05 13:36:56'),
(3882, 'hindi', 'Christmas Island', 'Christmas Island', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3883, 'hindi', 'Cocos (Keeling) Isla', 'Cocos (Keeling) Isla', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3884, 'hindi', 'Colombia', 'Colombia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3885, 'hindi', 'Comoros', 'Comoros', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3886, 'hindi', 'Congo', 'Congo', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3887, 'hindi', 'Congo, The Democrati', 'Congo, The Democrati', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3888, 'hindi', 'Cook Islands', 'Cook Islands', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3889, 'hindi', 'Costa Rica', 'Costa Rica', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3890, 'hindi', 'Cote d\'Ivoire', 'Cote d\'Ivoire', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3891, 'hindi', 'Croatia', 'Croatia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3892, 'hindi', 'Cuba', 'Cuba', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3893, 'hindi', 'Cyprus', 'Cyprus', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3894, 'hindi', 'Czech Republic', 'Czech Republic', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3895, 'hindi', 'Denmark', 'Denmark', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3896, 'hindi', 'Djibouti', 'Djibouti', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3897, 'hindi', 'Dominica', 'Dominica', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3898, 'hindi', 'Dominican Republic', 'Dominican Republic', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3899, 'hindi', 'Ecuador', 'Ecuador', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3900, 'hindi', 'Egypt', 'Egypt', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3901, 'hindi', 'El Salvador', 'El Salvador', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3902, 'hindi', 'Equatorial Guinea', 'Equatorial Guinea', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3903, 'hindi', 'Eritrea', 'Eritrea', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3904, 'hindi', 'Estonia', 'Estonia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3905, 'hindi', 'Ethiopia', 'Ethiopia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3906, 'hindi', 'Falkland Islands (Ma', 'Falkland Islands (Ma', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3907, 'hindi', 'Faroe Islands', 'Faroe Islands', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3908, 'hindi', 'Fiji', 'Fiji', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3909, 'hindi', 'Finland', 'Finland', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3910, 'hindi', 'France', 'France', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3911, 'hindi', 'French Guiana', 'French Guiana', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3912, 'hindi', 'French Polynesia', 'French Polynesia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3913, 'hindi', 'Gabon', 'Gabon', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3914, 'hindi', 'Gambia', 'Gambia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3915, 'hindi', 'Georgia', 'Georgia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3916, 'hindi', 'Germany', 'Germany', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3917, 'hindi', 'Ghana', 'Ghana', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3918, 'hindi', 'Gibraltar', 'Gibraltar', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3919, 'hindi', 'Greece', 'Greece', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3920, 'hindi', 'Greenland', 'Greenland', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3921, 'hindi', 'Grenada', 'Grenada', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3922, 'hindi', 'Guadeloupe', 'Guadeloupe', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3923, 'hindi', 'Guam', 'Guam', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3924, 'hindi', 'Guatemala', 'Guatemala', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3925, 'hindi', 'Guernsey', 'Guernsey', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3926, 'hindi', 'Guinea', 'Guinea', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3927, 'hindi', 'Guinea-Bissau', 'Guinea-Bissau', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3928, 'hindi', 'Guyana', 'Guyana', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3929, 'hindi', 'Haiti', 'Haiti', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3930, 'hindi', 'Holy See (Vatican Ci', 'Holy See (Vatican Ci', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3931, 'hindi', 'Honduras', 'Honduras', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3932, 'hindi', 'Hong Kong', 'Hong Kong', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3933, 'hindi', 'Hungary', 'Hungary', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3934, 'hindi', 'Iceland', 'Iceland', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3935, 'hindi', 'India', 'India', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3936, 'hindi', 'Indonesia', 'Indonesia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3937, 'hindi', 'Iran, Islamic Republ', 'Iran, Islamic Republ', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3938, 'hindi', 'Iraq', 'Iraq', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3939, 'hindi', 'Ireland', 'Ireland', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3940, 'hindi', 'Isle of Man', 'Isle of Man', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3941, 'hindi', 'Israel', 'Israel', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3942, 'hindi', 'Italy', 'Italy', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3943, 'hindi', 'Jamaica', 'Jamaica', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3944, 'hindi', 'Japan', 'Japan', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3945, 'hindi', 'Jersey', 'Jersey', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3946, 'hindi', 'Jordan', 'Jordan', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3947, 'hindi', 'Kazakhstan', 'Kazakhstan', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3948, 'hindi', 'Kenya', 'Kenya', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3949, 'hindi', 'Kiribati', 'Kiribati', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3950, 'hindi', 'Korea, Democratic Pe', 'Korea, Democratic Pe', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3951, 'hindi', 'Korea, Republic of S', 'Korea, Republic of S', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3952, 'hindi', 'Kuwait', 'Kuwait', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3953, 'hindi', 'Kyrgyzstan', 'Kyrgyzstan', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3954, 'hindi', 'Laos', 'Laos', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3955, 'hindi', 'Latvia', 'Latvia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3956, 'hindi', 'Lebanon', 'Lebanon', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3957, 'hindi', 'Lesotho', 'Lesotho', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3958, 'hindi', 'Liberia', 'Liberia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3959, 'hindi', 'Libyan Arab Jamahiri', 'Libyan Arab Jamahiri', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3960, 'hindi', 'Liechtenstein', 'Liechtenstein', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3961, 'hindi', 'Lithuania', 'Lithuania', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3962, 'hindi', 'Luxembourg', 'Luxembourg', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3963, 'hindi', 'Macao', 'Macao', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3964, 'hindi', 'Macedonia', 'Macedonia', '2025-08-05 13:36:57', '2025-08-05 13:36:57');
INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(3965, 'hindi', 'Madagascar', 'Madagascar', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3966, 'hindi', 'Malawi', 'Malawi', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3967, 'hindi', 'Malaysia', 'Malaysia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3968, 'hindi', 'Maldives', 'Maldives', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3969, 'hindi', 'Mali', 'Mali', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3970, 'hindi', 'Malta', 'Malta', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3971, 'hindi', 'Marshall Islands', 'Marshall Islands', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3972, 'hindi', 'Martinique', 'Martinique', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3973, 'hindi', 'Mauritania', 'Mauritania', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3974, 'hindi', 'Mauritius', 'Mauritius', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3975, 'hindi', 'Mayotte', 'Mayotte', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3976, 'hindi', 'Mexico', 'Mexico', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3977, 'hindi', 'Micronesia, Federate', 'Micronesia, Federate', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3978, 'hindi', 'Moldova', 'Moldova', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3979, 'hindi', 'Monaco', 'Monaco', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3980, 'hindi', 'Mongolia', 'Mongolia', '2025-08-05 13:36:57', '2025-08-05 13:36:57'),
(3981, 'hindi', 'Montenegro', 'Montenegro', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3982, 'hindi', 'Montserrat', 'Montserrat', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3983, 'hindi', 'Morocco', 'Morocco', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3984, 'hindi', 'Mozambique', 'Mozambique', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3985, 'hindi', 'Myanmar', 'Myanmar', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3986, 'hindi', 'Namibia', 'Namibia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3987, 'hindi', 'Nauru', 'Nauru', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3988, 'hindi', 'Nepal', 'Nepal', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3989, 'hindi', 'Netherlands', 'Netherlands', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3990, 'hindi', 'Netherlands Antilles', 'Netherlands Antilles', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3991, 'hindi', 'New Caledonia', 'New Caledonia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3992, 'hindi', 'New Zealand', 'New Zealand', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3993, 'hindi', 'Nicaragua', 'Nicaragua', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3994, 'hindi', 'Niger', 'Niger', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3995, 'hindi', 'Nigeria', 'Nigeria', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3996, 'hindi', 'Niue', 'Niue', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3997, 'hindi', 'Norfolk Island', 'Norfolk Island', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3998, 'hindi', 'Northern Mariana Isl', 'Northern Mariana Isl', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(3999, 'hindi', 'Norway', 'Norway', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4000, 'hindi', 'Oman', 'Oman', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4001, 'hindi', 'Pakistan', 'Pakistan', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4002, 'hindi', 'Palau', 'Palau', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4003, 'hindi', 'Palestinian Territor', 'Palestinian Territor', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4004, 'hindi', 'Panama', 'Panama', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4005, 'hindi', 'Papua New Guinea', 'Papua New Guinea', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4006, 'hindi', 'Paraguay', 'Paraguay', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4007, 'hindi', 'Peru', 'Peru', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4008, 'hindi', 'Philippines', 'Philippines', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4009, 'hindi', 'Pitcairn', 'Pitcairn', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4010, 'hindi', 'Poland', 'Poland', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4011, 'hindi', 'Portugal', 'Portugal', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4012, 'hindi', 'Puerto Rico', 'Puerto Rico', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4013, 'hindi', 'Qatar', 'Qatar', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4014, 'hindi', 'Romania', 'Romania', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4015, 'hindi', 'Russia', 'Russia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4016, 'hindi', 'Rwanda', 'Rwanda', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4017, 'hindi', 'Reunion', 'Reunion', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4018, 'hindi', 'Saint Barthelemy', 'Saint Barthelemy', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4019, 'hindi', 'Saint Helena, Ascens', 'Saint Helena, Ascens', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4020, 'hindi', 'Saint Kitts and Nevi', 'Saint Kitts and Nevi', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4021, 'hindi', 'Saint Lucia', 'Saint Lucia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4022, 'hindi', 'Saint Martin', 'Saint Martin', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4023, 'hindi', 'Saint Pierre and Miq', 'Saint Pierre and Miq', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4024, 'hindi', 'Saint Vincent and th', 'Saint Vincent and th', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4025, 'hindi', 'Samoa', 'Samoa', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4026, 'hindi', 'San Marino', 'San Marino', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4027, 'hindi', 'Sao Tome and Princip', 'Sao Tome and Princip', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4028, 'hindi', 'Saudi Arabia', 'Saudi Arabia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4029, 'hindi', 'Senegal', 'Senegal', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4030, 'hindi', 'Serbia', 'Serbia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4031, 'hindi', 'Seychelles', 'Seychelles', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4032, 'hindi', 'Sierra Leone', 'Sierra Leone', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4033, 'hindi', 'Singapore', 'Singapore', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4034, 'hindi', 'Slovakia', 'Slovakia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4035, 'hindi', 'Slovenia', 'Slovenia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4036, 'hindi', 'Solomon Islands', 'Solomon Islands', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4037, 'hindi', 'Somalia', 'Somalia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4038, 'hindi', 'South Africa', 'South Africa', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4039, 'hindi', 'South Georgia and th', 'South Georgia and th', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4040, 'hindi', 'Spain', 'Spain', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4041, 'hindi', 'Sri Lanka', 'Sri Lanka', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4042, 'hindi', 'Sudan', 'Sudan', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4043, 'hindi', 'Suriname', 'Suriname', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4044, 'hindi', 'Svalbard and Jan May', 'Svalbard and Jan May', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4045, 'hindi', 'Swaziland', 'Swaziland', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4046, 'hindi', 'Sweden', 'Sweden', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4047, 'hindi', 'Switzerland', 'Switzerland', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4048, 'hindi', 'Syrian Arab Republic', 'Syrian Arab Republic', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4049, 'hindi', 'Taiwan', 'Taiwan', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4050, 'hindi', 'Tajikistan', 'Tajikistan', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4051, 'hindi', 'Tanzania, United Rep', 'Tanzania, United Rep', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4052, 'hindi', 'Thailand', 'Thailand', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4053, 'hindi', 'Timor-Leste', 'Timor-Leste', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4054, 'hindi', 'Togo', 'Togo', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4055, 'hindi', 'Tokelau', 'Tokelau', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4056, 'hindi', 'Tonga', 'Tonga', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4057, 'hindi', 'Trinidad and Tobago', 'Trinidad and Tobago', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4058, 'hindi', 'Tunisia', 'Tunisia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4059, 'hindi', 'Turkey', 'Turkey', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4060, 'hindi', 'Turkmenistan', 'Turkmenistan', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4061, 'hindi', 'Turks and Caicos Isl', 'Turks and Caicos Isl', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4062, 'hindi', 'Tuvalu', 'Tuvalu', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4063, 'hindi', 'Uganda', 'Uganda', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4064, 'hindi', 'Ukraine', 'Ukraine', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4065, 'hindi', 'United Arab Emirates', 'United Arab Emirates', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4066, 'hindi', 'United Kingdom', 'United Kingdom', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4067, 'hindi', 'United States', 'United States', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4068, 'hindi', 'Uruguay', 'Uruguay', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4069, 'hindi', 'Uzbekistan', 'Uzbekistan', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4070, 'hindi', 'Vanuatu', 'Vanuatu', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4071, 'hindi', 'Venezuela, Bolivaria', 'Venezuela, Bolivaria', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4072, 'hindi', 'Vietnam', 'Vietnam', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4073, 'hindi', 'Virgin Islands, Brit', 'Virgin Islands, Brit', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4074, 'hindi', 'Virgin Islands, U.S.', 'Virgin Islands, U.S.', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4075, 'hindi', 'Wallis and Futuna', 'Wallis and Futuna', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4076, 'hindi', 'Yemen', 'Yemen', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4077, 'hindi', 'Zambia', 'Zambia', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4078, 'hindi', 'Zimbabwe', 'Zimbabwe', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4079, 'hindi', 'Select listing city', 'Select listing city', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4080, 'hindi', 'Enter listing address', 'Enter listing address', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4081, 'hindi', 'Post Code', 'Post Code', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4082, 'hindi', 'Enter post code', 'Enter post code', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4083, 'hindi', 'Enter meta title', 'Enter meta title', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4084, 'hindi', 'Keyword1; keyword2; keyword3;', 'Keyword1; keyword2; keyword3;', '2025-08-05 13:36:58', '2025-08-05 13:36:58'),
(4085, 'hindi', 'Enter meta description', 'Enter meta description', '2025-08-05 13:36:59', '2025-08-05 13:36:59'),
(4086, 'hindi', 'Enter og title', 'Enter og title', '2025-08-05 13:36:59', '2025-08-05 13:36:59'),
(4087, 'hindi', 'Canonical URL', 'Canonical URL', '2025-08-05 13:36:59', '2025-08-05 13:36:59'),
(4088, 'hindi', 'Enter canonical URL', 'Enter canonical URL', '2025-08-05 13:36:59', '2025-08-05 13:36:59'),
(4089, 'hindi', 'Enter json ID', 'Enter json ID', '2025-08-05 13:36:59', '2025-08-05 13:36:59'),
(4090, 'hindi', 'Listing Images', 'Listing Images', '2025-08-05 13:36:59', '2025-08-05 13:36:59'),
(4091, 'hindi', 'Click to upload SVG, PNG, JPG, or GIF', 'Click to upload SVG, PNG, JPG, or GIF', '2025-08-05 13:36:59', '2025-08-05 13:36:59'),
(4092, 'hindi', 'max 500 x 700px', 'max 500 x 700px', '2025-08-05 13:36:59', '2025-08-05 13:36:59'),
(4093, 'english', 'Directory updated successfully!', 'Directory updated successfully!', '2025-08-05 14:02:41', '2025-08-05 14:02:41'),
(4094, 'hindi', 'Directory updated successfully!', 'Directory updated successfully!', '2025-08-05 14:02:41', '2025-08-05 14:02:41'),
(4095, 'english', 'Corporate Gifting and Printing Services', 'Corporate Gifting and Printing Services', '2025-08-05 14:02:42', '2025-08-05 14:02:42'),
(4096, 'hindi', 'Corporate Gifting and Printing Services', 'Corporate Gifting and Printing Services', '2025-08-05 14:02:42', '2025-08-05 14:02:42'),
(4097, 'hindi', 'Subscriptions', 'Subscriptions', '2025-08-05 14:03:24', '2025-08-05 14:03:24'),
(4098, 'hindi', 'List of subscriptions', 'List of subscriptions', '2025-08-05 14:03:24', '2025-08-05 14:03:24'),
(4099, 'english', 'Academies', 'Academies', '2025-08-05 14:04:36', '2025-08-05 14:04:36'),
(4100, 'hindi', 'Academies', 'Academies', '2025-08-05 14:04:36', '2025-08-05 14:04:36'),
(4101, 'hindi', 'Show More', 'Show More', '2025-08-05 14:07:54', '2025-08-05 14:07:54'),
(4102, 'hindi', 'Package List', 'Package List', '2025-08-05 14:10:27', '2025-08-05 14:10:27'),
(4103, 'hindi', 'Add New Package', 'Add New Package', '2025-08-05 14:10:27', '2025-08-05 14:10:27'),
(4104, 'hindi', 'Package name', 'Package name', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4105, 'hindi', 'Enter package name', 'Enter package name', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4106, 'hindi', 'Amenities icon', 'Amenities icon', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4107, 'hindi', 'Pick an Icon', 'Pick an Icon', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4108, 'hindi', 'Package sub title', 'Package sub title', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4109, 'hindi', 'Enter sub title', 'Enter sub title', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4110, 'hindi', 'Package Price', 'Package Price', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4111, 'hindi', 'Enter price', 'Enter price', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4112, 'hindi', 'Package Period', 'Package Period', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4113, 'hindi', 'Monthly', 'Monthly', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4114, 'hindi', 'Semi Annually', 'Semi Annually', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4115, 'hindi', 'Annually', 'Annually', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4116, 'hindi', 'Listing Number', 'Listing Number', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4117, 'hindi', 'Enter listing number', 'Enter listing number', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4118, 'hindi', 'Category Number', 'Category Number', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4119, 'hindi', 'Enter category number', 'Enter category number', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4120, 'hindi', 'Unavailable', 'Unavailable', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4121, 'hindi', 'Available', 'Available', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4122, 'hindi', 'Contact Form', 'Contact Form', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4123, 'hindi', 'Listings Video', 'Listings Video', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4124, 'hindi', 'Best Choice', 'Best Choice', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4125, 'hindi', 'No', 'No', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4126, 'hindi', 'Yes', 'Yes', '2025-08-05 14:10:29', '2025-08-05 14:10:29'),
(4127, 'hindi', 'Package create successfully!', 'Package create successfully!', '2025-08-05 14:17:27', '2025-08-05 14:17:27'),
(4128, 'hindi', 'Icon', 'Icon', '2025-08-05 14:17:27', '2025-08-05 14:17:27'),
(4129, 'hindi', 'Period', 'Period', '2025-08-05 14:17:27', '2025-08-05 14:17:27'),
(4130, 'hindi', 'listing Amount', 'listing Amount', '2025-08-05 14:17:27', '2025-08-05 14:17:27'),
(4131, 'hindi', 'Category Amount', 'Category Amount', '2025-08-05 14:17:27', '2025-08-05 14:17:27'),
(4132, 'hindi', 'Choice', 'Choice', '2025-08-05 14:17:27', '2025-08-05 14:17:27'),
(4133, 'hindi', 'Price', 'Price', '2025-08-05 14:17:27', '2025-08-05 14:17:27'),
(4134, 'hindi', 'Update Package', 'Update Package', '2025-08-05 14:17:27', '2025-08-05 14:17:27'),
(4135, 'hindi', 'Package update successfully!', 'Package update successfully!', '2025-08-05 14:28:31', '2025-08-05 14:28:31'),
(4136, 'hindi', 'Info', 'Info', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4137, 'hindi', 'User Full Name *', 'User Full Name *', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4138, 'hindi', 'Email Address *', 'Email Address *', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4139, 'hindi', 'Enter email', 'Enter email', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4140, 'hindi', 'Phone Number *', 'Phone Number *', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4141, 'hindi', 'Enter phone', 'Enter phone', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4142, 'hindi', 'Gender *', 'Gender *', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4143, 'hindi', 'Select Gender', 'Select Gender', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4144, 'hindi', 'Male', 'Male', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4145, 'hindi', 'Female', 'Female', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4146, 'hindi', 'Country *', 'Country *', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4147, 'hindi', 'Facebook link', 'Facebook link', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4148, 'hindi', 'Enter facebook link', 'Enter facebook link', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4149, 'hindi', 'City *', 'City *', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4150, 'hindi', 'Linkedin link', 'Linkedin link', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4151, 'hindi', 'Enter linkedin link', 'Enter linkedin link', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4152, 'hindi', 'Twitter link', 'Twitter link', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4153, 'hindi', 'Enter twitter link', 'Enter twitter link', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4154, 'hindi', 'Password *', 'Password *', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4155, 'hindi', 'Enter password', 'Enter password', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4156, 'hindi', 'Confirm Password *', 'Confirm Password *', '2025-08-05 14:29:44', '2025-08-05 14:29:44'),
(4157, 'hindi', 'lists', 'lists', '2025-08-05 14:29:47', '2025-08-05 14:29:47'),
(4158, 'hindi', 'Add New agent', 'Add New agent', '2025-08-05 14:29:47', '2025-08-05 14:29:47'),
(4159, 'hindi', 'I agree to the', 'I agree to the', '2025-08-05 14:30:29', '2025-08-05 14:30:29'),
(4160, 'hindi', 'Terms & Policy', 'Terms & Policy', '2025-08-05 14:30:29', '2025-08-05 14:30:29'),
(4161, 'hindi', 'Register', 'Register', '2025-08-05 14:30:29', '2025-08-05 14:30:29'),
(4162, 'hindi', 'Back to login', 'Back to login', '2025-08-05 14:30:29', '2025-08-05 14:30:29'),
(4163, 'hindi', 'Registered successfully!', 'Registered successfully!', '2025-08-05 14:31:17', '2025-08-05 14:31:17'),
(4164, 'hindi', 'Wishlist', 'Wishlist', '2025-08-05 14:31:36', '2025-08-05 14:31:36'),
(4165, 'hindi', 'My Customer Panel', 'My Customer Panel', '2025-08-05 14:31:36', '2025-08-05 14:31:36'),
(4166, 'hindi', 'Appointment', 'Appointment', '2025-08-05 14:31:36', '2025-08-05 14:31:36'),
(4167, 'hindi', 'Following agent', 'Following agent', '2025-08-05 14:31:36', '2025-08-05 14:31:36'),
(4168, 'hindi', 'Message', 'Message', '2025-08-05 14:31:36', '2025-08-05 14:31:36'),
(4169, 'hindi', 'Account', 'Account', '2025-08-05 14:31:36', '2025-08-05 14:31:36'),
(4170, 'hindi', 'Become an agent', 'Become an agent', '2025-08-05 14:31:36', '2025-08-05 14:31:36'),
(4171, 'hindi', 'Logout', 'Logout', '2025-08-05 14:31:36', '2025-08-05 14:31:36'),
(4172, 'hindi', 'Home', 'Home', '2025-08-05 14:31:36', '2025-08-05 14:31:36'),
(4173, 'hindi', 'Pricing Plan for Becoming Agent', 'Pricing Plan for Becoming Agent', '2025-08-05 14:31:50', '2025-08-05 14:31:50'),
(4174, 'hindi', 'Listing Feature', 'Listing Feature', '2025-08-05 14:31:50', '2025-08-05 14:31:50'),
(4175, 'hindi', 'Categories par listing', 'Categories par listing', '2025-08-05 14:31:50', '2025-08-05 14:31:50'),
(4176, 'hindi', 'Listing Video', 'Listing Video', '2025-08-05 14:31:50', '2025-08-05 14:31:50'),
(4177, 'hindi', 'Try Now', 'Try Now', '2025-08-05 14:31:50', '2025-08-05 14:31:50'),
(4178, 'hindi', 'Frequently Asked Questions', 'Frequently Asked Questions', '2025-08-05 14:31:51', '2025-08-05 14:31:51'),
(4179, 'hindi', 'Order summary', 'Order summary', '2025-08-05 14:32:11', '2025-08-05 14:32:11'),
(4180, 'hindi', 'Cancel Payment', 'Cancel Payment', '2025-08-05 14:32:11', '2025-08-05 14:32:11'),
(4181, 'hindi', 'Select payment gateway', 'Select payment gateway', '2025-08-05 14:32:11', '2025-08-05 14:32:11'),
(4182, 'hindi', 'Package Details', 'Package Details', '2025-08-05 14:32:11', '2025-08-05 14:32:11'),
(4183, 'hindi', 'Total', 'Total', '2025-08-05 14:32:11', '2025-08-05 14:32:11'),
(4184, 'hindi', 'Grand Total', 'Grand Total', '2025-08-05 14:32:11', '2025-08-05 14:32:11'),
(4185, 'hindi', 'Website name', 'Website name', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4186, 'hindi', 'Website Email', 'Website Email', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4187, 'hindi', 'Website keywords', 'Website keywords', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4188, 'hindi', 'Website Description', 'Website Description', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4189, 'hindi', 'Author', 'Author', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4190, 'hindi', 'System Currency', 'System Currency', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4191, 'hindi', 'Currency Position', 'Currency Position', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4192, 'hindi', 'Left', 'Left', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4193, 'hindi', 'Right', 'Right', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4194, 'hindi', 'Phone Number', 'Phone Number', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4195, 'hindi', 'System Language', 'System Language', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4196, 'hindi', 'Select a system language', 'Select a system language', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4197, 'hindi', 'English', 'English', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4198, 'hindi', 'Select a Country', 'Select a Country', '2025-08-05 14:32:34', '2025-08-05 14:32:34'),
(4199, 'hindi', 'Email Verification', 'Email Verification', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4200, 'hindi', 'Select email verification', 'Select email verification', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4201, 'hindi', 'Enable', 'Enable', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4202, 'hindi', 'Disable', 'Disable', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4203, 'hindi', 'Map access token', 'Map access token', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4204, 'hindi', 'Max zoom level', 'Max zoom level', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4205, 'hindi', 'Default location', 'Default location', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4206, 'hindi', 'Footer Copyright Text', 'Footer Copyright Text', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4207, 'hindi', 'Footer  Text', 'Footer  Text', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4208, 'hindi', 'Timezone', 'Timezone', '2025-08-05 14:32:35', '2025-08-05 14:32:35'),
(4209, 'hindi', 'Update Product', 'Update Product', '2025-08-05 14:32:36', '2025-08-05 14:32:36'),
(4210, 'english', 'Hindi', 'Hindi', '2025-08-06 07:03:15', '2025-08-06 07:03:15'),
(4211, 'english', 'Website Faqs update successfully!', 'Website Faqs update successfully!', '2025-08-06 09:01:14', '2025-08-06 09:01:14'),
(4212, 'hindi', 'Website Faqs update successfully!', 'Website Faqs update successfully!', '2025-08-06 09:01:14', '2025-08-06 09:01:14'),
(4213, 'english', 'Show All', 'Show All', '2025-08-06 09:13:18', '2025-08-06 09:13:18'),
(4214, 'hindi', 'Show All', 'Show All', '2025-08-06 09:13:18', '2025-08-06 09:13:18'),
(4215, 'english', 'Custom Field', 'Custom Field', '2025-08-06 09:18:36', '2025-08-06 09:18:36'),
(4216, 'hindi', 'Custom Field', 'Custom Field', '2025-08-06 09:18:36', '2025-08-06 09:18:36'),
(4217, 'english', 'Add Custom Field', 'Add Custom Field', '2025-08-06 09:18:37', '2025-08-06 09:18:37'),
(4218, 'hindi', 'Add Custom Field', 'Add Custom Field', '2025-08-06 09:18:37', '2025-08-06 09:18:37'),
(4219, 'english', 'Add New Field', 'Add New Field', '2025-08-06 09:18:37', '2025-08-06 09:18:37'),
(4220, 'hindi', 'Add New Field', 'Add New Field', '2025-08-06 09:18:37', '2025-08-06 09:18:37'),
(4221, 'english', 'Text', 'Text', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4222, 'hindi', 'Text', 'Text', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4223, 'english', 'Slider', 'Slider', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4224, 'hindi', 'Slider', 'Slider', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4225, 'english', 'FAQ', 'FAQ', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4226, 'hindi', 'FAQ', 'FAQ', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4227, 'english', 'Gallery', 'Gallery', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4228, 'hindi', 'Gallery', 'Gallery', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4229, 'english', 'Section Title', 'Section Title', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4230, 'hindi', 'Section Title', 'Section Title', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4231, 'english', 'Text Content', 'Text Content', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4232, 'hindi', 'Text Content', 'Text Content', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4233, 'english', 'Images', 'Images', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4234, 'hindi', 'Images', 'Images', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4235, 'english', 'Video URL', 'Video URL', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4236, 'hindi', 'Video URL', 'Video URL', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4237, 'english', 'FAQ Question', 'FAQ Question', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4238, 'hindi', 'FAQ Question', 'FAQ Question', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4239, 'english', 'FAQ Answer', 'FAQ Answer', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4240, 'hindi', 'FAQ Answer', 'FAQ Answer', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4241, 'english', 'Gallery Image', 'Gallery Image', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4242, 'hindi', 'Gallery Image', 'Gallery Image', '2025-08-06 09:21:34', '2025-08-06 09:21:34'),
(4243, 'english', 'Data Added successfully!', 'Data Added successfully!', '2025-08-06 09:23:50', '2025-08-06 09:23:50'),
(4244, 'hindi', 'Data Added successfully!', 'Data Added successfully!', '2025-08-06 09:23:50', '2025-08-06 09:23:50'),
(4245, 'english', ' Sort Section', ' Sort Section', '2025-08-06 09:23:51', '2025-08-06 09:23:51'),
(4246, 'hindi', ' Sort Section', ' Sort Section', '2025-08-06 09:23:51', '2025-08-06 09:23:51'),
(4247, 'english', 'Edit Section', 'Edit Section', '2025-08-06 09:23:51', '2025-08-06 09:23:51'),
(4248, 'hindi', 'Edit Section', 'Edit Section', '2025-08-06 09:23:51', '2025-08-06 09:23:51'),
(4249, 'english', 'Edit Field', 'Edit Field', '2025-08-06 09:23:51', '2025-08-06 09:23:51'),
(4250, 'hindi', 'Edit Field', 'Edit Field', '2025-08-06 09:23:51', '2025-08-06 09:23:51'),
(4251, 'english', 'See more', 'See more', '2025-08-06 09:24:10', '2025-08-06 09:24:10'),
(4252, 'hindi', 'See more', 'See more', '2025-08-06 09:24:10', '2025-08-06 09:24:10'),
(4253, 'english', 'See less', 'See less', '2025-08-06 09:24:10', '2025-08-06 09:24:10'),
(4254, 'hindi', 'See less', 'See less', '2025-08-06 09:24:10', '2025-08-06 09:24:10'),
(4255, 'english', 'Show Less', 'Show Less', '2025-08-06 12:38:10', '2025-08-06 12:38:10'),
(4256, 'hindi', 'Show Less', 'Show Less', '2025-08-06 12:38:10', '2025-08-06 12:38:10'),
(4257, 'english', 'Agent : ', 'Agent : ', '2025-08-06 14:00:52', '2025-08-06 14:00:52'),
(4258, 'hindi', 'Agent : ', 'Agent : ', '2025-08-06 14:00:52', '2025-08-06 14:00:52'),
(4259, 'english', 'Directory Active successfully!', 'Directory Active successfully!', '2025-08-06 14:09:13', '2025-08-06 14:09:13'),
(4260, 'hindi', 'Directory Active successfully!', 'Directory Active successfully!', '2025-08-06 14:09:13', '2025-08-06 14:09:13'),
(4261, 'english', 'Email Send successfully', 'Email Send successfully', '2025-08-07 08:12:00', '2025-08-07 08:12:00'),
(4262, 'hindi', 'Email Send successfully', 'Email Send successfully', '2025-08-07 08:12:00', '2025-08-07 08:12:00'),
(4263, 'english', 'Category deleted successful!', 'Category deleted successful!', '2025-08-08 11:47:52', '2025-08-08 11:47:52'),
(4264, 'hindi', 'Category deleted successful!', 'Category deleted successful!', '2025-08-08 11:47:52', '2025-08-08 11:47:52'),
(4265, 'english', 'Admin denied transaction through this gateway.', 'Admin denied transaction through this gateway.', '2025-08-13 10:29:31', '2025-08-13 10:29:31'),
(4266, 'hindi', 'Admin denied transaction through this gateway.', 'Admin denied transaction through this gateway.', '2025-08-13 10:29:31', '2025-08-13 10:29:31'),
(4267, 'english', 'Opps!', 'Opps!', '2025-08-13 10:29:31', '2025-08-13 10:29:31'),
(4268, 'hindi', 'Opps!', 'Opps!', '2025-08-13 10:29:31', '2025-08-13 10:29:31'),
(4269, 'english', 'Try another gateway.', 'Try another gateway.', '2025-08-13 10:29:31', '2025-08-13 10:29:31'),
(4270, 'hindi', 'Try another gateway.', 'Try another gateway.', '2025-08-13 10:29:31', '2025-08-13 10:29:31'),
(4271, 'english', 'My CRM', 'My CRM', '2025-08-14 04:54:01', '2025-08-14 04:54:01'),
(4272, 'hindi', 'My CRM', 'My CRM', '2025-08-14 04:54:01', '2025-08-14 04:54:01'),
(4273, 'english', 'All Notifications', 'All Notifications', '2025-08-14 04:55:49', '2025-08-14 04:55:49'),
(4274, 'hindi', 'All Notifications', 'All Notifications', '2025-08-14 04:55:49', '2025-08-14 04:55:49'),
(4275, 'english', 'My Esheps', 'My Esheps', '2025-08-14 04:58:07', '2025-08-14 04:58:07'),
(4276, 'hindi', 'My Esheps', 'My Esheps', '2025-08-14 04:58:07', '2025-08-14 04:58:07'),
(4277, 'english', 'My Dashboard', 'My Dashboard', '2025-08-14 05:22:36', '2025-08-14 05:22:36'),
(4278, 'hindi', 'My Dashboard', 'My Dashboard', '2025-08-14 05:22:36', '2025-08-14 05:22:36'),
(4279, 'english', 'My Shop', 'My Shop', '2025-08-14 06:04:00', '2025-08-14 06:04:00'),
(4280, 'hindi', 'My Shop', 'My Shop', '2025-08-14 06:04:00', '2025-08-14 06:04:00'),
(4281, 'english', 'Logged in successfully!', 'Logged in successfully!', '2025-08-14 09:39:44', '2025-08-14 09:39:44'),
(4282, 'hindi', 'Logged in successfully!', 'Logged in successfully!', '2025-08-14 09:39:44', '2025-08-14 09:39:44'),
(4283, 'english', 'Addon installed successfully', 'Addon installed successfully', '2025-08-14 09:53:37', '2025-08-14 09:53:37'),
(4284, 'hindi', 'Addon installed successfully', 'Addon installed successfully', '2025-08-14 09:53:37', '2025-08-14 09:53:37'),
(4285, 'english', 'version', 'version', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4286, 'hindi', 'version', 'version', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4287, 'english', 'Deactivate', 'Deactivate', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4288, 'hindi', 'Deactivate', 'Deactivate', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4289, 'english', 'My Shops', 'My Shops', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4290, 'hindi', 'My Shops', 'My Shops', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4291, 'english', 'Order Manager', 'Order Manager', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4292, 'hindi', 'Order Manager', 'Order Manager', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4293, 'english', 'My Order', 'My Order', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4294, 'hindi', 'My Order', 'My Order', '2025-08-14 09:53:38', '2025-08-14 09:53:38'),
(4295, 'english', 'Addon successfully deactivated!', 'Addon successfully deactivated!', '2025-08-14 09:53:50', '2025-08-14 09:53:50'),
(4296, 'hindi', 'Addon successfully deactivated!', 'Addon successfully deactivated!', '2025-08-14 09:53:50', '2025-08-14 09:53:50'),
(4297, 'english', 'Activate', 'Activate', '2025-08-14 09:53:51', '2025-08-14 09:53:51'),
(4298, 'hindi', 'Activate', 'Activate', '2025-08-14 09:53:51', '2025-08-14 09:53:51'),
(4299, 'english', 'Addon successfully activated!', 'Addon successfully activated!', '2025-08-14 09:53:56', '2025-08-14 09:53:56'),
(4300, 'hindi', 'Addon successfully activated!', 'Addon successfully activated!', '2025-08-14 09:53:56', '2025-08-14 09:53:56'),
(4301, 'english', 'List of Order Manager', 'List of Order Manager', '2025-08-14 09:53:59', '2025-08-14 09:53:59'),
(4302, 'hindi', 'List of Order Manager', 'List of Order Manager', '2025-08-14 09:53:59', '2025-08-14 09:53:59'),
(4303, 'english', 'Pending Orders', 'Pending Orders', '2025-08-14 09:53:59', '2025-08-14 09:53:59'),
(4304, 'hindi', 'Pending Orders', 'Pending Orders', '2025-08-14 09:54:00', '2025-08-14 09:54:00'),
(4305, 'english', 'Delivered orders', 'Delivered orders', '2025-08-14 09:54:00', '2025-08-14 09:54:00'),
(4306, 'hindi', 'Delivered orders', 'Delivered orders', '2025-08-14 09:54:00', '2025-08-14 09:54:00'),
(4307, 'english', 'Form Builder', 'Form Builder', '2025-08-14 09:58:16', '2025-08-14 09:58:16'),
(4308, 'hindi', 'Form Builder', 'Form Builder', '2025-08-14 09:58:16', '2025-08-14 09:58:16'),
(4309, 'english', 'Create Form', 'Create Form', '2025-08-14 10:01:01', '2025-08-14 10:01:01'),
(4310, 'hindi', 'Create Form', 'Create Form', '2025-08-14 10:01:01', '2025-08-14 10:01:01'),
(4311, 'english', 'Field saved successfully!', 'Field saved successfully!', '2025-08-14 10:04:30', '2025-08-14 10:04:30'),
(4312, 'hindi', 'Field saved successfully!', 'Field saved successfully!', '2025-08-14 10:04:30', '2025-08-14 10:04:30'),
(4313, 'english', 'You can reorder the fields by dragging and dropping each item. The order you set here will be reflected on the frontend.', 'You can reorder the fields by dragging and dropping each item. The order you set here will be reflected on the frontend.', '2025-08-14 10:04:30', '2025-08-14 10:04:30'),
(4314, 'hindi', 'You can reorder the fields by dragging and dropping each item. The order you set here will be reflected on the frontend.', 'You can reorder the fields by dragging and dropping each item. The order you set here will be reflected on the frontend.', '2025-08-14 10:04:30', '2025-08-14 10:04:30'),
(4315, 'english', 'Save Field Order', 'Save Field Order', '2025-08-14 10:04:30', '2025-08-14 10:04:30'),
(4316, 'hindi', 'Save Field Order', 'Save Field Order', '2025-08-14 10:04:30', '2025-08-14 10:04:30'),
(4317, 'english', 'My Orders', 'My Orders', '2025-08-14 10:12:52', '2025-08-14 10:12:52'),
(4318, 'hindi', 'My Orders', 'My Orders', '2025-08-14 10:12:52', '2025-08-14 10:12:52'),
(4319, 'english', 'Shop', 'Shop', '2025-08-14 10:19:48', '2025-08-14 10:19:48'),
(4320, 'hindi', 'Shop', 'Shop', '2025-08-14 10:19:48', '2025-08-14 10:19:48'),
(4321, 'english', 'Your  Shop Inventory', 'Your  Shop Inventory', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4322, 'hindi', 'Your  Shop Inventory', 'Your  Shop Inventory', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4323, 'english', 'Add Product', 'Add Product', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4324, 'hindi', 'Add Product', 'Add Product', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4325, 'english', 'Add New Product', 'Add New Product', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4326, 'hindi', 'Add New Product', 'Add New Product', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4327, 'english', 'Add Category', 'Add Category', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4328, 'hindi', 'Add Category', 'Add Category', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4329, 'english', 'Add Product Category', 'Add Product Category', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4330, 'hindi', 'Add Product Category', 'Add Product Category', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4331, 'english', 'Add Type', 'Add Type', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4332, 'hindi', 'Add Type', 'Add Type', '2025-08-14 10:19:49', '2025-08-14 10:19:49'),
(4333, 'english', 'Product Name', 'Product Name', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4334, 'hindi', 'Product Name', 'Product Name', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4335, 'english', 'Enter product name', 'Enter product name', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4336, 'hindi', 'Enter product name', 'Enter product name', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4337, 'english', 'Description must not exceed 73 characters.', 'Description must not exceed 73 characters.', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4338, 'hindi', 'Description must not exceed 73 characters.', 'Description must not exceed 73 characters.', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4339, 'english', 'Availability', 'Availability', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4340, 'hindi', 'Availability', 'Availability', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4341, 'english', 'Not available ', 'Not available ', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4342, 'hindi', 'Not available ', 'Not available ', '2025-08-14 10:20:08', '2025-08-14 10:20:08'),
(4343, 'english', 'Category Title', 'Category Title', '2025-08-14 10:21:10', '2025-08-14 10:21:10'),
(4344, 'hindi', 'Category Title', 'Category Title', '2025-08-14 10:21:10', '2025-08-14 10:21:10'),
(4345, 'english', 'provide category name', 'provide category name', '2025-08-14 10:21:10', '2025-08-14 10:21:10'),
(4346, 'hindi', 'provide category name', 'provide category name', '2025-08-14 10:21:10', '2025-08-14 10:21:10'),
(4347, 'english', 'Inventory Category Created Successful!', 'Inventory Category Created Successful!', '2025-08-14 10:21:29', '2025-08-14 10:21:29'),
(4348, 'hindi', 'Inventory Category Created Successful!', 'Inventory Category Created Successful!', '2025-08-14 10:21:29', '2025-08-14 10:21:29'),
(4349, 'english', 'Category List', 'Category List', '2025-08-14 10:21:30', '2025-08-14 10:21:30'),
(4350, 'hindi', 'Category List', 'Category List', '2025-08-14 10:21:30', '2025-08-14 10:21:30'),
(4351, 'english', 'Update Category', 'Update Category', '2025-08-14 10:21:30', '2025-08-14 10:21:30'),
(4352, 'hindi', 'Update Category', 'Update Category', '2025-08-14 10:21:30', '2025-08-14 10:21:30'),
(4353, 'english', 'Inventory Created Successful!', 'Inventory Created Successful!', '2025-08-14 10:21:48', '2025-08-14 10:21:48'),
(4354, 'hindi', 'Inventory Created Successful!', 'Inventory Created Successful!', '2025-08-14 10:21:48', '2025-08-14 10:21:48'),
(4355, 'english', 'Product List', 'Product List', '2025-08-14 10:21:49', '2025-08-14 10:21:49'),
(4356, 'hindi', 'Product List', 'Product List', '2025-08-14 10:21:49', '2025-08-14 10:21:49'),
(4357, 'english', 'Update Inventory', 'Update Inventory', '2025-08-14 10:21:49', '2025-08-14 10:21:49'),
(4358, 'hindi', 'Update Inventory', 'Update Inventory', '2025-08-14 10:21:49', '2025-08-14 10:21:49'),
(4359, 'english', 'Shop products', 'Shop products', '2025-08-14 10:22:12', '2025-08-14 10:22:12'),
(4360, 'hindi', 'Shop products', 'Shop products', '2025-08-14 10:22:12', '2025-08-14 10:22:12'),
(4361, 'english', 'Reset', 'Reset', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4362, 'hindi', 'Reset', 'Reset', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4363, 'english', 'Order', 'Order', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4364, 'hindi', 'Order', 'Order', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4365, 'english', 'Confirm Order', 'Confirm Order', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4366, 'hindi', 'Confirm Order', 'Confirm Order', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4367, 'english', 'Please select at least one product and quantity!', 'Please select at least one product and quantity!', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4368, 'hindi', 'Please select at least one product and quantity!', 'Please select at least one product and quantity!', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4369, 'english', 'Order Confirmation', 'Order Confirmation', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4370, 'hindi', 'Order Confirmation', 'Order Confirmation', '2025-08-14 10:22:13', '2025-08-14 10:22:13'),
(4371, 'english', 'Your Order', 'Your Order', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4372, 'hindi', 'Your Order', 'Your Order', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4373, 'english', 'Delivery details', 'Delivery details', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4374, 'hindi', 'Delivery details', 'Delivery details', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4375, 'english', 'Any Note', 'Any Note', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4376, 'hindi', 'Any Note', 'Any Note', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4377, 'english', 'Confirm This Order', 'Confirm This Order', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4378, 'hindi', 'Confirm This Order', 'Confirm This Order', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4379, 'english', 'Payment Method : Cash on Delivery', 'Payment Method : Cash on Delivery', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4380, 'hindi', 'Payment Method : Cash on Delivery', 'Payment Method : Cash on Delivery', '2025-08-14 10:22:18', '2025-08-14 10:22:18'),
(4381, 'english', 'Product Details', 'Product Details', '2025-08-14 11:15:29', '2025-08-14 11:15:29'),
(4382, 'hindi', 'Product Details', 'Product Details', '2025-08-14 11:15:29', '2025-08-14 11:15:29'),
(4383, 'english', 'Amount to Pay', 'Amount to Pay', '2025-08-14 11:15:29', '2025-08-14 11:15:29'),
(4384, 'hindi', 'Amount to Pay', 'Amount to Pay', '2025-08-14 11:15:29', '2025-08-14 11:15:29'),
(4385, 'english', 'Delivered Details', 'Delivered Details', '2025-08-14 11:15:29', '2025-08-14 11:15:29'),
(4386, 'hindi', 'Delivered Details', 'Delivered Details', '2025-08-14 11:15:29', '2025-08-14 11:15:29'),
(4387, 'english', 'You can\'t Order your own product!', 'You can\'t Order your own product!', '2025-08-14 11:54:24', '2025-08-14 11:54:24'),
(4388, 'hindi', 'You can\'t Order your own product!', 'You can\'t Order your own product!', '2025-08-14 11:54:24', '2025-08-14 11:54:24'),
(4389, 'english', 'Order placed At', 'Order placed At', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4390, 'hindi', 'Order placed At', 'Order placed At', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4391, 'english', 'Product Type : ', 'Product Type : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4392, 'hindi', 'Product Type : ', 'Product Type : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4393, 'english', 'Amount : ', 'Amount : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4394, 'hindi', 'Amount : ', 'Amount : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4395, 'english', 'Status : ', 'Status : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4396, 'hindi', 'Status : ', 'Status : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4397, 'english', 'Contact : ', 'Contact : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4398, 'hindi', 'Contact : ', 'Contact : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4399, 'english', ' Status : ', ' Status : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4400, 'hindi', ' Status : ', ' Status : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4401, 'english', 'Note : ', 'Note : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4402, 'hindi', 'Note : ', 'Note : ', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4403, 'english', 'Mark as Paid', 'Mark as Paid', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4404, 'hindi', 'Mark as Paid', 'Mark as Paid', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4405, 'english', 'Mark as Delivered', 'Mark as Delivered', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4406, 'hindi', 'Mark as Delivered', 'Mark as Delivered', '2025-08-14 11:57:06', '2025-08-14 11:57:06'),
(4407, 'english', 'Order has been marked as paid.', 'Order has been marked as paid.', '2025-08-14 11:57:34', '2025-08-14 11:57:34'),
(4408, 'hindi', 'Order has been marked as paid.', 'Order has been marked as paid.', '2025-08-14 11:57:34', '2025-08-14 11:57:34'),
(4409, 'english', 'Type : ', 'Type : ', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4410, 'hindi', 'Type : ', 'Type : ', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4411, 'english', 'Amount Pay : ', 'Amount Pay : ', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4412, 'hindi', 'Amount Pay : ', 'Amount Pay : ', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4413, 'english', 'Unpaid', 'Unpaid', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4414, 'hindi', 'Unpaid', 'Unpaid', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4415, 'english', 'Not Delivered', 'Not Delivered', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4416, 'hindi', 'Not Delivered', 'Not Delivered', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4417, 'english', 'Order placed at : ', 'Order placed at : ', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4418, 'hindi', 'Order placed at : ', 'Order placed at : ', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4419, 'english', 'Download Invoice', 'Download Invoice', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4420, 'hindi', 'Download Invoice', 'Download Invoice', '2025-08-14 13:17:05', '2025-08-14 13:17:05'),
(4421, 'english', 'Order Invoice', 'Order Invoice', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4422, 'hindi', 'Order Invoice', 'Order Invoice', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4423, 'english', 'Printed on:', 'Printed on:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4424, 'hindi', 'Printed on:', 'Printed on:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4425, 'english', 'Order status:', 'Order status:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4426, 'hindi', 'Order status:', 'Order status:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4427, 'english', 'Shipping Address', 'Shipping Address', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4428, 'hindi', 'Shipping Address', 'Shipping Address', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4429, 'english', 'Payment Details', 'Payment Details', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4430, 'hindi', 'Payment Details', 'Payment Details', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4431, 'english', 'Payment Status:', 'Payment Status:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4432, 'hindi', 'Payment Status:', 'Payment Status:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4433, 'english', 'Order Placed At:', 'Order Placed At:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4434, 'hindi', 'Order Placed At:', 'Order Placed At:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4435, 'english', 'Order Delivered At:', 'Order Delivered At:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4436, 'hindi', 'Order Delivered At:', 'Order Delivered At:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4437, 'english', 'No delivered yet.', 'No delivered yet.', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4438, 'hindi', 'No delivered yet.', 'No delivered yet.', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4439, 'english', 'Products', 'Products', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4440, 'hindi', 'Products', 'Products', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4441, 'english', 'Unit Price', 'Unit Price', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4442, 'hindi', 'Unit Price', 'Unit Price', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4443, 'english', 'Quantity', 'Quantity', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4444, 'hindi', 'Quantity', 'Quantity', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4445, 'english', 'Sub Total Amount:', 'Sub Total Amount:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4446, 'hindi', 'Sub Total Amount:', 'Sub Total Amount:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4447, 'english', 'Grand Total:', 'Grand Total:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4448, 'hindi', 'Grand Total:', 'Grand Total:', '2025-08-14 13:17:09', '2025-08-14 13:17:09'),
(4449, 'english', 'acnosoft_listing', 'acnosoft_listing', '2025-08-16 05:24:09', '2025-08-16 05:24:09'),
(4450, 'hindi', 'acnosoft_listing', 'acnosoft_listing', '2025-08-16 05:24:09', '2025-08-16 05:24:09'),
(4451, 'english', 'Acnosoft listing', 'Acnosoft listing', '2025-08-16 05:40:27', '2025-08-16 05:40:27'),
(4452, 'hindi', 'Acnosoft listing', 'Acnosoft listing', '2025-08-16 05:40:27', '2025-08-16 05:40:27'),
(4453, 'english', 'Notifications', 'Notifications', '2025-08-16 05:55:59', '2025-08-16 05:55:59'),
(4454, 'hindi', 'Notifications', 'Notifications', '2025-08-16 05:55:59', '2025-08-16 05:55:59'),
(4455, 'english', 'Pay by PhonePe', 'Pay by PhonePe', '2025-08-16 06:08:31', '2025-08-16 06:08:31'),
(4456, 'hindi', 'Pay by PhonePe', 'Pay by PhonePe', '2025-08-16 06:08:31', '2025-08-16 06:08:31'),
(4457, 'english', 'Notification', 'Notification', '2025-08-16 06:24:49', '2025-08-16 06:24:49'),
(4458, 'hindi', 'Notification', 'Notification', '2025-08-16 06:24:49', '2025-08-16 06:24:49'),
(4459, 'english', 'Pay with PhonePe', 'Pay with PhonePe', '2025-08-16 06:26:36', '2025-08-16 06:26:36'),
(4460, 'hindi', 'Pay with PhonePe', 'Pay with PhonePe', '2025-08-16 06:26:36', '2025-08-16 06:26:36'),
(4461, 'english', 'Initiating PhonePe payment...', 'Initiating PhonePe payment...', '2025-08-16 06:26:36', '2025-08-16 06:26:36'),
(4462, 'hindi', 'Initiating PhonePe payment...', 'Initiating PhonePe payment...', '2025-08-16 06:26:36', '2025-08-16 06:26:36'),
(4463, 'english', 'Create Notification', 'Create Notification', '2025-08-16 06:26:39', '2025-08-16 06:26:39'),
(4464, 'hindi', 'Create Notification', 'Create Notification', '2025-08-16 06:26:39', '2025-08-16 06:26:39'),
(4465, 'english', 'Create Notifications', 'Create Notifications', '2025-08-16 06:32:22', '2025-08-16 06:32:22'),
(4466, 'hindi', 'Create Notifications', 'Create Notifications', '2025-08-16 06:32:22', '2025-08-16 06:32:22'),
(4467, 'english', 'Listify Free', 'Listify Free', '2025-08-16 08:04:18', '2025-08-16 08:04:18'),
(4468, 'hindi', 'Listify Free', 'Listify Free', '2025-08-16 08:04:18', '2025-08-16 08:04:18'),
(4469, 'english', 'Free', 'Free', '2025-08-16 08:04:18', '2025-08-16 08:04:18'),
(4470, 'hindi', 'Free', 'Free', '2025-08-16 08:04:18', '2025-08-16 08:04:18'),
(4471, 'english', 'Start Date', 'Start Date', '2025-08-16 08:04:18', '2025-08-16 08:04:18'),
(4472, 'hindi', 'Start Date', 'Start Date', '2025-08-16 08:04:18', '2025-08-16 08:04:18'),
(4473, 'english', 'End Date', 'End Date', '2025-08-16 08:04:18', '2025-08-16 08:04:18'),
(4474, 'hindi', 'End Date', 'End Date', '2025-08-16 08:04:18', '2025-08-16 08:04:18');
INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(4475, 'english', 'Amount', 'Amount', '2025-08-16 08:04:18', '2025-08-16 08:04:18'),
(4476, 'hindi', 'Amount', 'Amount', '2025-08-16 08:04:18', '2025-08-16 08:04:18'),
(4477, 'english', 'Subscribe Now', 'Subscribe Now', '2025-08-16 09:24:10', '2025-08-16 09:24:10'),
(4478, 'hindi', 'Subscribe Now', 'Subscribe Now', '2025-08-16 09:24:10', '2025-08-16 09:24:10'),
(4479, 'english', 'Subscription activated successfully!', 'Subscription activated successfully!', '2025-08-16 09:32:42', '2025-08-16 09:32:42'),
(4480, 'hindi', 'Subscription activated successfully!', 'Subscription activated successfully!', '2025-08-16 09:32:42', '2025-08-16 09:32:42'),
(4481, 'english', 'Free Listify Package', 'Free Listify Package', '2025-08-16 09:32:46', '2025-08-16 09:32:46'),
(4482, 'hindi', 'Free Listify Package', 'Free Listify Package', '2025-08-16 09:32:46', '2025-08-16 09:32:46'),
(4483, 'english', 'Subscription Invoice', 'Subscription Invoice', '2025-08-16 09:50:01', '2025-08-16 09:50:01'),
(4484, 'hindi', 'Subscription Invoice', 'Subscription Invoice', '2025-08-16 09:50:01', '2025-08-16 09:50:01'),
(4485, 'english', 'Agent Panel', 'Agent Panel', '2025-08-16 09:50:01', '2025-08-16 09:50:01'),
(4486, 'hindi', 'Agent Panel', 'Agent Panel', '2025-08-16 09:50:01', '2025-08-16 09:50:01'),
(4487, 'english', 'Billing Address :', 'Billing Address :', '2025-08-16 09:50:01', '2025-08-16 09:50:01'),
(4488, 'hindi', 'Billing Address :', 'Billing Address :', '2025-08-16 09:50:01', '2025-08-16 09:50:01'),
(4489, 'english', 'It Services Listing', 'It Services Listing', '2025-08-16 09:54:10', '2025-08-16 09:54:10'),
(4490, 'hindi', 'It Services Listing', 'It Services Listing', '2025-08-16 09:54:10', '2025-08-16 09:54:10'),
(4491, 'english', 'Acnosoft Listing Listing', 'Acnosoft Listing Listing', '2025-08-16 09:54:10', '2025-08-16 09:54:10'),
(4492, 'hindi', 'Acnosoft Listing Listing', 'Acnosoft Listing Listing', '2025-08-16 09:54:10', '2025-08-16 09:54:10'),
(4493, 'english', 'Abhisek Package', 'Abhisek Package', '2025-08-16 09:54:19', '2025-08-16 09:54:19'),
(4494, 'hindi', 'Abhisek Package', 'Abhisek Package', '2025-08-16 09:54:19', '2025-08-16 09:54:19'),
(4495, 'english', 'Lorem Ipsum available but the majority have suffered alteration', 'Lorem Ipsum available but the majority have suffered alteration', '2025-08-16 09:54:23', '2025-08-16 09:54:23'),
(4496, 'hindi', 'Lorem Ipsum available but the majority have suffered alteration', 'Lorem Ipsum available but the majority have suffered alteration', '2025-08-16 09:54:23', '2025-08-16 09:54:23'),
(4497, 'english', 'Order Delivery', 'Order Delivery', '2025-08-16 09:57:14', '2025-08-16 09:57:14'),
(4498, 'hindi', 'Order Delivery', 'Order Delivery', '2025-08-16 09:57:14', '2025-08-16 09:57:14'),
(4499, 'english', 'Delivered At', 'Delivered At', '2025-08-16 09:57:14', '2025-08-16 09:57:14'),
(4500, 'hindi', 'Delivered At', 'Delivered At', '2025-08-16 09:57:14', '2025-08-16 09:57:14'),
(4501, 'english', 'Food Listing', 'Food Listing', '2025-08-16 14:18:26', '2025-08-16 14:18:26'),
(4502, 'hindi', 'Food Listing', 'Food Listing', '2025-08-16 14:18:26', '2025-08-16 14:18:26'),
(4503, 'english', 'Fitness Listing', 'Fitness Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4504, 'hindi', 'Fitness Listing', 'Fitness Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4505, 'english', 'Grooming Listing', 'Grooming Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4506, 'hindi', 'Grooming Listing', 'Grooming Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4507, 'english', 'Manufacturing Listing', 'Manufacturing Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4508, 'hindi', 'Manufacturing Listing', 'Manufacturing Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4509, 'english', 'Trading Listing', 'Trading Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4510, 'hindi', 'Trading Listing', 'Trading Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4511, 'english', 'Automobiles Listing', 'Automobiles Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4512, 'hindi', 'Automobiles Listing', 'Automobiles Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4513, 'english', 'Recreation Listing', 'Recreation Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4514, 'hindi', 'Recreation Listing', 'Recreation Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4515, 'english', 'Corporate Gifting And Printing Services Listing', 'Corporate Gifting And Printing Services Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4516, 'hindi', 'Corporate Gifting And Printing Services Listing', 'Corporate Gifting And Printing Services Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4517, 'english', 'Industrial Listing', 'Industrial Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4518, 'hindi', 'Industrial Listing', 'Industrial Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4519, 'english', 'Agencies Listing', 'Agencies Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4520, 'hindi', 'Agencies Listing', 'Agencies Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4521, 'english', 'Popular Services Listing', 'Popular Services Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4522, 'hindi', 'Popular Services Listing', 'Popular Services Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4523, 'english', 'Academies Listing', 'Academies Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4524, 'hindi', 'Academies Listing', 'Academies Listing', '2025-08-16 14:18:27', '2025-08-16 14:18:27'),
(4525, 'english', ' Order Manager', ' Order Manager', '2025-08-16 14:39:58', '2025-08-16 14:39:58'),
(4526, 'hindi', ' Order Manager', ' Order Manager', '2025-08-16 14:39:58', '2025-08-16 14:39:58'),
(4527, 'english', 'Choose Status', 'Choose Status', '2025-08-16 14:39:58', '2025-08-16 14:39:58'),
(4528, 'hindi', 'Choose Status', 'Choose Status', '2025-08-16 14:39:58', '2025-08-16 14:39:58'),
(4529, 'english', 'Restaurant List', 'Restaurant List', '2025-08-16 21:11:03', '2025-08-16 21:11:03'),
(4530, 'hindi', 'Restaurant List', 'Restaurant List', '2025-08-16 21:11:03', '2025-08-16 21:11:03'),
(4531, 'english', 'Real-estate list', 'Real-estate list', '2025-08-16 21:13:29', '2025-08-16 21:13:29'),
(4532, 'hindi', 'Real-estate list', 'Real-estate list', '2025-08-16 21:13:29', '2025-08-16 21:13:29'),
(4533, 'english', 'Add Custom Section', 'Add Custom Section', '2025-08-17 14:15:36', '2025-08-17 14:15:36'),
(4534, 'hindi', 'Add Custom Section', 'Add Custom Section', '2025-08-17 14:15:36', '2025-08-17 14:15:36'),
(4535, 'english', 'Edit Notifications', 'Edit Notifications', '2025-08-18 05:27:50', '2025-08-18 05:27:50'),
(4536, 'hindi', 'Edit Notifications', 'Edit Notifications', '2025-08-18 05:27:50', '2025-08-18 05:27:50'),
(4537, 'english', 'Order Delete Successful!', 'Order Delete Successful!', '2025-08-18 07:06:45', '2025-08-18 07:06:45'),
(4538, 'hindi', 'Order Delete Successful!', 'Order Delete Successful!', '2025-08-18 07:06:45', '2025-08-18 07:06:45'),
(4539, 'english', 'My Account', 'My Account', '2025-08-18 07:50:21', '2025-08-18 07:50:21'),
(4540, 'hindi', 'My Account', 'My Account', '2025-08-18 07:50:21', '2025-08-18 07:50:21'),
(4541, 'english', 'my-notifications', 'my-notifications', '2025-08-18 09:54:29', '2025-08-18 09:54:29'),
(4542, 'hindi', 'my-notifications', 'my-notifications', '2025-08-18 09:54:29', '2025-08-18 09:54:29'),
(4543, 'english', 'Your package listing limit has been reached. Please purchase a new package to create more listings', 'Your package listing limit has been reached. Please purchase a new package to create more listings', '2025-08-19 05:36:04', '2025-08-19 05:36:04'),
(4544, 'hindi', 'Your package listing limit has been reached. Please purchase a new package to create more listings', 'Your package listing limit has been reached. Please purchase a new package to create more listings', '2025-08-19 05:36:04', '2025-08-19 05:36:04'),
(4545, 'english', 'Pincode', 'Pincode', '2025-08-19 05:47:40', '2025-08-19 05:47:40'),
(4546, 'hindi', 'Pincode', 'Pincode', '2025-08-19 05:47:40', '2025-08-19 05:47:40'),
(4547, 'english', 'Enter Pincode', 'Enter Pincode', '2025-08-19 05:48:00', '2025-08-19 05:48:00'),
(4548, 'hindi', 'Enter Pincode', 'Enter Pincode', '2025-08-19 05:48:00', '2025-08-19 05:48:00'),
(4549, 'english', 'State/City', 'State/City', '2025-08-19 05:48:31', '2025-08-19 05:48:31'),
(4550, 'hindi', 'State/City', 'State/City', '2025-08-19 05:48:31', '2025-08-19 05:48:31'),
(4551, 'english', 'Select listing State/city', 'Select listing State/city', '2025-08-19 05:48:54', '2025-08-19 05:48:54'),
(4552, 'hindi', 'Select listing State/city', 'Select listing State/city', '2025-08-19 05:48:54', '2025-08-19 05:48:54'),
(4553, 'english', 'My Panel', 'My Panel', '2025-08-19 05:53:54', '2025-08-19 05:53:54'),
(4554, 'hindi', 'My Panel', 'My Panel', '2025-08-19 05:53:54', '2025-08-19 05:53:54'),
(4555, 'english', 'mycrm', 'mycrm', '2025-08-19 06:33:51', '2025-08-19 06:33:51'),
(4556, 'hindi', 'mycrm', 'mycrm', '2025-08-19 06:33:51', '2025-08-19 06:33:51'),
(4557, 'english', 'Activate Package', 'Activate Package', '2025-08-19 06:51:13', '2025-08-19 06:51:13'),
(4558, 'hindi', 'Activate Package', 'Activate Package', '2025-08-19 06:51:13', '2025-08-19 06:51:13'),
(4559, 'english', 'Activated Package', 'Activated Package', '2025-08-19 06:51:31', '2025-08-19 06:51:31'),
(4560, 'hindi', 'Activated Package', 'Activated Package', '2025-08-19 06:51:31', '2025-08-19 06:51:31'),
(4561, 'english', 'Activated', 'Activated', '2025-08-19 06:55:49', '2025-08-19 06:55:49'),
(4562, 'hindi', 'Activated', 'Activated', '2025-08-19 06:55:49', '2025-08-19 06:55:49'),
(4563, 'english', 'Field deleted successfully!', 'Field deleted successfully!', '2025-08-19 07:39:11', '2025-08-19 07:39:11'),
(4564, 'hindi', 'Field deleted successfully!', 'Field deleted successfully!', '2025-08-19 07:39:11', '2025-08-19 07:39:11'),
(4565, 'english', 'Directory deleted successfully!', 'Directory deleted successfully!', '2025-08-19 07:40:54', '2025-08-19 07:40:54'),
(4566, 'hindi', 'Directory deleted successfully!', 'Directory deleted successfully!', '2025-08-19 07:40:54', '2025-08-19 07:40:54'),
(4567, 'english', 'Whatsapp No', 'Whatsapp No', '2025-08-20 06:51:49', '2025-08-20 06:51:49'),
(4568, 'hindi', 'Whatsapp No', 'Whatsapp No', '2025-08-20 06:51:49', '2025-08-20 06:51:49'),
(4569, 'english', 'Add Qrcode', 'Add Qrcode', '2025-08-21 05:56:29', '2025-08-21 05:56:29'),
(4570, 'hindi', 'Add Qrcode', 'Add Qrcode', '2025-08-21 05:56:29', '2025-08-21 05:56:29'),
(4571, 'english', 'Qrcode', 'Qrcode', '2025-08-21 06:06:46', '2025-08-21 06:06:46'),
(4572, 'hindi', 'Qrcode', 'Qrcode', '2025-08-21 06:06:46', '2025-08-21 06:06:46'),
(4573, 'english', 'Qrcodes', 'Qrcodes', '2025-08-21 06:36:32', '2025-08-21 06:36:32'),
(4574, 'hindi', 'Qrcodes', 'Qrcodes', '2025-08-21 06:36:32', '2025-08-21 06:36:32'),
(4575, 'english', 'Add Qrcodes', 'Add Qrcodes', '2025-08-21 06:51:26', '2025-08-21 06:51:26'),
(4576, 'hindi', 'Add Qrcodes', 'Add Qrcodes', '2025-08-21 06:51:26', '2025-08-21 06:51:26'),
(4577, 'english', 'addqr', 'addqr', '2025-08-21 07:14:48', '2025-08-21 07:14:48'),
(4578, 'hindi', 'addqr', 'addqr', '2025-08-21 07:14:48', '2025-08-21 07:14:48'),
(4579, 'english', 'Categories per listing', 'Categories per listing', '2025-08-21 09:05:43', '2025-08-21 09:05:43'),
(4580, 'hindi', 'Categories per listing', 'Categories per listing', '2025-08-21 09:05:43', '2025-08-21 09:05:43'),
(4581, 'english', 'Order has been marked as Delivered.', 'Order has been marked as Delivered.', '2025-08-21 10:38:12', '2025-08-21 10:38:12'),
(4582, 'hindi', 'Order has been marked as Delivered.', 'Order has been marked as Delivered.', '2025-08-21 10:38:12', '2025-08-21 10:38:12'),
(4583, 'english', 'Order Delivered At', 'Order Delivered At', '2025-08-21 10:38:12', '2025-08-21 10:38:12'),
(4584, 'hindi', 'Order Delivered At', 'Order Delivered At', '2025-08-21 10:38:12', '2025-08-21 10:38:12'),
(4585, 'english', 'Delivered', 'Delivered', '2025-08-21 10:38:12', '2025-08-21 10:38:12'),
(4586, 'hindi', 'Delivered', 'Delivered', '2025-08-21 10:38:12', '2025-08-21 10:38:12'),
(4587, 'english', 'Delivered at  : ', 'Delivered at  : ', '2025-08-21 10:38:16', '2025-08-21 10:38:16'),
(4588, 'hindi', 'Delivered at  : ', 'Delivered at  : ', '2025-08-21 10:38:16', '2025-08-21 10:38:16'),
(4589, 'english', 'Get lat & Long', 'Get lat & Long', '2025-08-22 12:09:13', '2025-08-22 12:09:13'),
(4590, 'hindi', 'Get lat & Long', 'Get lat & Long', '2025-08-22 12:09:13', '2025-08-22 12:09:13'),
(4591, 'english', 'Cash on Delivery', 'Cash on Delivery', '2025-08-25 05:47:37', '2025-08-25 05:47:37'),
(4592, 'hindi', 'Cash on Delivery', 'Cash on Delivery', '2025-08-25 05:47:37', '2025-08-25 05:47:37'),
(4593, 'english', 'Pay on UPI', 'Pay on UPI', '2025-08-25 05:47:37', '2025-08-25 05:47:37'),
(4594, 'hindi', 'Pay on UPI', 'Pay on UPI', '2025-08-25 05:47:37', '2025-08-25 05:47:37'),
(4595, 'english', 'Amenities Deleted Successfully!', 'Amenities Deleted Successfully!', '2025-08-27 10:21:00', '2025-08-27 10:21:00'),
(4596, 'hindi', 'Amenities Deleted Successfully!', 'Amenities Deleted Successfully!', '2025-08-27 10:21:00', '2025-08-27 10:21:00'),
(4597, 'english', 'Inventory  Updated Successful!', 'Inventory  Updated Successful!', '2025-08-27 11:47:56', '2025-08-27 11:47:56'),
(4598, 'hindi', 'Inventory  Updated Successful!', 'Inventory  Updated Successful!', '2025-08-27 11:47:56', '2025-08-27 11:47:56'),
(4599, 'english', 'Out of stock', 'Out of stock', '2025-08-27 11:47:57', '2025-08-27 11:47:57'),
(4600, 'hindi', 'Out of stock', 'Out of stock', '2025-08-27 11:47:57', '2025-08-27 11:47:57'),
(4601, 'english', 'Product Category', 'Product Category', '2025-08-27 11:50:48', '2025-08-27 11:50:48'),
(4602, 'hindi', 'Product Category', 'Product Category', '2025-08-27 11:50:48', '2025-08-27 11:50:48'),
(4603, 'english', 'Inventory  Delete Successful!', 'Inventory  Delete Successful!', '2025-08-27 11:51:55', '2025-08-27 11:51:55'),
(4604, 'hindi', 'Inventory  Delete Successful!', 'Inventory  Delete Successful!', '2025-08-27 11:51:55', '2025-08-27 11:51:55'),
(4605, 'english', 'Inventory Category  Delete Successful!', 'Inventory Category  Delete Successful!', '2025-08-27 11:52:01', '2025-08-27 11:52:01'),
(4606, 'hindi', 'Inventory Category  Delete Successful!', 'Inventory Category  Delete Successful!', '2025-08-27 11:52:01', '2025-08-27 11:52:01'),
(4607, 'english', 'Inventory Category  Updated Successful!', 'Inventory Category  Updated Successful!', '2025-08-28 06:19:38', '2025-08-28 06:19:38'),
(4608, 'hindi', 'Inventory Category  Updated Successful!', 'Inventory Category  Updated Successful!', '2025-08-28 06:19:38', '2025-08-28 06:19:38'),
(4609, 'english', 'Enter Discount price in %', 'Enter Discount price in %', '2025-08-28 07:04:17', '2025-08-28 07:04:17'),
(4610, 'hindi', 'Enter Discount price in %', 'Enter Discount price in %', '2025-08-28 07:04:17', '2025-08-28 07:04:17'),
(4611, 'english', 'Discount %', 'Discount %', '2025-08-28 07:04:37', '2025-08-28 07:04:37'),
(4612, 'hindi', 'Discount %', 'Discount %', '2025-08-28 07:04:37', '2025-08-28 07:04:37'),
(4613, 'english', 'Inventory Updated Successful!', 'Inventory Updated Successful!', '2025-08-28 09:59:28', '2025-08-28 09:59:28'),
(4614, 'hindi', 'Inventory Updated Successful!', 'Inventory Updated Successful!', '2025-08-28 09:59:28', '2025-08-28 09:59:28'),
(4615, 'english', 'Please complete payment using UPI', 'Please complete payment using UPI', '2025-08-28 11:16:14', '2025-08-28 11:16:14'),
(4616, 'hindi', 'Please complete payment using UPI', 'Please complete payment using UPI', '2025-08-28 11:16:14', '2025-08-28 11:16:14'),
(4617, 'english', 'Scan the QR code or use the provided UPI ID to pay', 'Scan the QR code or use the provided UPI ID to pay', '2025-08-28 11:16:14', '2025-08-28 11:16:14'),
(4618, 'hindi', 'Scan the QR code or use the provided UPI ID to pay', 'Scan the QR code or use the provided UPI ID to pay', '2025-08-28 11:16:14', '2025-08-28 11:16:14'),
(4619, 'english', 'Listify 500', 'Listify 500', '2025-08-29 07:07:15', '2025-08-29 07:07:15'),
(4620, 'hindi', 'Listify 500', 'Listify 500', '2025-08-29 07:07:15', '2025-08-29 07:07:15'),
(4621, 'english', '500', '500', '2025-08-29 07:07:15', '2025-08-29 07:07:15'),
(4622, 'hindi', '500', '500', '2025-08-29 07:07:15', '2025-08-29 07:07:15'),
(4623, 'english', 'Transaction ID', 'Transaction ID', '2025-08-30 05:18:09', '2025-08-30 05:18:09'),
(4624, 'hindi', 'Transaction ID', 'Transaction ID', '2025-08-30 05:18:09', '2025-08-30 05:18:09'),
(4625, 'english', 'Upload Payment Screenshort', 'Upload Payment Screenshort', '2025-08-30 05:18:09', '2025-08-30 05:18:09'),
(4626, 'hindi', 'Upload Payment Screenshort', 'Upload Payment Screenshort', '2025-08-30 05:18:09', '2025-08-30 05:18:09'),
(4627, 'english', 'Upload ', 'Upload ', '2025-08-30 05:22:02', '2025-08-30 05:22:02'),
(4628, 'hindi', 'Upload ', 'Upload ', '2025-08-30 05:22:02', '2025-08-30 05:22:02'),
(4629, 'english', 'Payment Screenshort', 'Payment Screenshort', '2025-08-30 05:43:25', '2025-08-30 05:43:25'),
(4630, 'hindi', 'Payment Screenshort', 'Payment Screenshort', '2025-08-30 05:43:26', '2025-08-30 05:43:26'),
(4631, 'english', 'Please mark the payment as Paid before delivering.', 'Please mark the payment as Paid before delivering.', '2025-08-30 06:05:58', '2025-08-30 06:05:58'),
(4632, 'hindi', 'Please mark the payment as Paid before delivering.', 'Please mark the payment as Paid before delivering.', '2025-08-30 06:05:58', '2025-08-30 06:05:58'),
(4633, 'english', 'Custom Listing Settings', 'Custom Listing Settings', '2025-09-01 05:27:39', '2025-09-01 05:27:39'),
(4634, 'hindi', 'Custom Listing Settings', 'Custom Listing Settings', '2025-09-01 05:27:39', '2025-09-01 05:27:39'),
(4635, 'english', 'Hotel Banner updated successfully!', 'Hotel Banner updated successfully!', '2025-09-01 05:41:19', '2025-09-01 05:41:19'),
(4636, 'hindi', 'Hotel Banner updated successfully!', 'Hotel Banner updated successfully!', '2025-09-01 05:41:19', '2025-09-01 05:41:19'),
(4637, 'english', 'Customlisting Settings', 'Customlisting Settings', '2025-09-01 06:01:39', '2025-09-01 06:01:39'),
(4638, 'hindi', 'Customlisting Settings', 'Customlisting Settings', '2025-09-01 06:01:39', '2025-09-01 06:01:39'),
(4639, 'english', 'Custom Listing Frontend Settings', 'Custom Listing Frontend Settings', '2025-09-01 07:01:12', '2025-09-01 07:01:12'),
(4640, 'hindi', 'Custom Listing Frontend Settings', 'Custom Listing Frontend Settings', '2025-09-01 07:01:12', '2025-09-01 07:01:12'),
(4641, 'english', 'Banner Title', 'Banner Title', '2025-09-01 07:22:20', '2025-09-01 07:22:20'),
(4642, 'hindi', 'Banner Title', 'Banner Title', '2025-09-01 07:22:20', '2025-09-01 07:22:20'),
(4643, 'english', 'Banner Description', 'Banner Description', '2025-09-01 07:22:20', '2025-09-01 07:22:20'),
(4644, 'hindi', 'Banner Description', 'Banner Description', '2025-09-01 07:22:20', '2025-09-01 07:22:20'),
(4645, 'english', 'Banner Tab Name', 'Banner Tab Name', '2025-09-01 07:25:21', '2025-09-01 07:25:21'),
(4646, 'hindi', 'Banner Tab Name', 'Banner Tab Name', '2025-09-01 07:25:21', '2025-09-01 07:25:21'),
(4647, 'english', 'Banner Tab Link', 'Banner Tab Link', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4648, 'hindi', 'Banner Tab Link', 'Banner Tab Link', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4649, 'english', 'CTA', 'CTA', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4650, 'hindi', 'CTA', 'CTA', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4651, 'english', 'CTA Title', 'CTA Title', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4652, 'hindi', 'CTA Title', 'CTA Title', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4653, 'english', 'CTA Description', 'CTA Description', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4654, 'hindi', 'CTA Description', 'CTA Description', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4655, 'english', 'CTA Tab Name', 'CTA Tab Name', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4656, 'hindi', 'CTA Tab Name', 'CTA Tab Name', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4657, 'english', 'CTA Tab Link', 'CTA Tab Link', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4658, 'hindi', 'CTA Tab Link', 'CTA Tab Link', '2025-09-01 07:28:23', '2025-09-01 07:28:23'),
(4659, 'english', 'Edit Automobiles Listing Frontend Settings', 'Edit Automobiles Listing Frontend Settings', '2025-09-01 09:57:50', '2025-09-01 09:57:50'),
(4660, 'hindi', 'Edit Automobiles Listing Frontend Settings', 'Edit Automobiles Listing Frontend Settings', '2025-09-01 09:57:50', '2025-09-01 09:57:50'),
(4661, 'english', 'Edit Fitness Listing Frontend Settings', 'Edit Fitness Listing Frontend Settings', '2025-09-01 10:15:31', '2025-09-01 10:15:31'),
(4662, 'hindi', 'Edit Fitness Listing Frontend Settings', 'Edit Fitness Listing Frontend Settings', '2025-09-01 10:15:31', '2025-09-01 10:15:31'),
(4663, 'english', 'Custom Listing Details', 'Custom Listing Details', '2025-09-01 11:33:00', '2025-09-01 11:33:00'),
(4664, 'hindi', 'Custom Listing Details', 'Custom Listing Details', '2025-09-01 11:33:00', '2025-09-01 11:33:00'),
(4665, 'english', 'Invoices', 'Invoices', '2025-09-06 05:11:09', '2025-09-06 05:11:09'),
(4666, 'hindi', 'Invoices', 'Invoices', '2025-09-06 05:11:09', '2025-09-06 05:11:09'),
(4667, 'english', 'Add Invoice', 'Add Invoice', '2025-09-06 05:16:55', '2025-09-06 05:16:55'),
(4668, 'hindi', 'Add Invoice', 'Add Invoice', '2025-09-06 05:16:55', '2025-09-06 05:16:55'),
(4669, 'english', 'No invoice found. Please create one.', 'No invoice found. Please create one.', '2025-09-06 05:16:55', '2025-09-06 05:16:55'),
(4670, 'hindi', 'No invoice found. Please create one.', 'No invoice found. Please create one.', '2025-09-06 05:16:55', '2025-09-06 05:16:55'),
(4671, 'english', 'Create Invoice', 'Create Invoice', '2025-09-06 05:34:14', '2025-09-06 05:34:14'),
(4672, 'hindi', 'Create Invoice', 'Create Invoice', '2025-09-06 05:34:14', '2025-09-06 05:34:14'),
(4673, 'english', 'Note', 'Note', '2025-09-06 05:43:37', '2025-09-06 05:43:37'),
(4674, 'hindi', 'Note', 'Note', '2025-09-06 05:43:37', '2025-09-06 05:43:37'),
(4675, 'english', 'Terms & Condition', 'Terms & Condition', '2025-09-06 05:43:37', '2025-09-06 05:43:37'),
(4676, 'hindi', 'Terms & Condition', 'Terms & Condition', '2025-09-06 05:43:37', '2025-09-06 05:43:37'),
(4677, 'english', 'Shipping', 'Shipping', '2025-09-06 05:43:37', '2025-09-06 05:43:37'),
(4678, 'hindi', 'Shipping', 'Shipping', '2025-09-06 05:43:37', '2025-09-06 05:43:37'),
(4679, 'english', 'Disclaimer', 'Disclaimer', '2025-09-06 05:43:37', '2025-09-06 05:43:37'),
(4680, 'hindi', 'Disclaimer', 'Disclaimer', '2025-09-06 05:43:37', '2025-09-06 05:43:37'),
(4681, 'english', 'Edit Invoice', 'Edit Invoice', '2025-09-06 05:59:57', '2025-09-06 05:59:57'),
(4682, 'hindi', 'Edit Invoice', 'Edit Invoice', '2025-09-06 05:59:57', '2025-09-06 05:59:57'),
(4683, 'english', 'Mark as Unpaid', 'Mark as Unpaid', '2025-09-06 10:05:12', '2025-09-06 10:05:12'),
(4684, 'hindi', 'Mark as Unpaid', 'Mark as Unpaid', '2025-09-06 10:05:12', '2025-09-06 10:05:12'),
(4685, 'english', 'Invoice Policy', 'Invoice Policy', '2025-09-06 10:33:00', '2025-09-06 10:33:00'),
(4686, 'hindi', 'Invoice Policy', 'Invoice Policy', '2025-09-06 10:33:00', '2025-09-06 10:33:00'),
(4687, 'english', 'Terms & Conditions', 'Terms & Conditions', '2025-09-08 12:45:17', '2025-09-08 12:45:17'),
(4688, 'hindi', 'Terms & Conditions', 'Terms & Conditions', '2025-09-08 12:45:17', '2025-09-08 12:45:17'),
(4689, 'english', 'Shipping Policy', 'Shipping Policy', '2025-09-08 12:45:17', '2025-09-08 12:45:17'),
(4690, 'hindi', 'Shipping Policy', 'Shipping Policy', '2025-09-08 12:45:17', '2025-09-08 12:45:17'),
(4691, 'english', 'Additional Information must not exceed 73 characters.', 'Additional Information must not exceed 73 characters.', '2025-09-11 10:11:37', '2025-09-11 10:11:37'),
(4692, 'hindi', 'Additional Information must not exceed 73 characters.', 'Additional Information must not exceed 73 characters.', '2025-09-11 10:11:37', '2025-09-11 10:11:37'),
(4693, 'english', 'Additional Infomation', 'Additional Infomation', '2025-09-11 10:18:54', '2025-09-11 10:18:54'),
(4694, 'hindi', 'Additional Infomation', 'Additional Infomation', '2025-09-11 10:18:54', '2025-09-11 10:18:54'),
(4695, 'english', 'Special Features', 'Special Features', '2025-09-12 05:14:57', '2025-09-12 05:14:57'),
(4696, 'hindi', 'Special Features', 'Special Features', '2025-09-12 05:14:57', '2025-09-12 05:14:57'),
(4697, 'english', 'Enter Icon Name', 'Enter Icon Name', '2025-09-12 05:50:10', '2025-09-12 05:50:10'),
(4698, 'hindi', 'Enter Icon Name', 'Enter Icon Name', '2025-09-12 05:50:10', '2025-09-12 05:50:10'),
(4699, 'english', 'Pick an Feature ', 'Pick an Feature ', '2025-09-19 12:12:33', '2025-09-19 12:12:33'),
(4700, 'hindi', 'Pick an Feature ', 'Pick an Feature ', '2025-09-19 12:12:33', '2025-09-19 12:12:33'),
(4701, 'english', 'Enter Feature  Name', 'Enter Feature  Name', '2025-09-19 12:12:33', '2025-09-19 12:12:33'),
(4702, 'hindi', 'Enter Feature  Name', 'Enter Feature  Name', '2025-09-19 12:12:33', '2025-09-19 12:12:33'),
(4703, 'english', 'Enter Feature Name', 'Enter Feature Name', '2025-09-19 12:13:41', '2025-09-19 12:13:41'),
(4704, 'hindi', 'Enter Feature Name', 'Enter Feature Name', '2025-09-19 12:13:41', '2025-09-19 12:13:41'),
(4705, 'english', 'Enter garage', 'Enter garage', '2025-09-20 10:00:42', '2025-09-20 10:00:42'),
(4706, 'hindi', 'Enter garage', 'Enter garage', '2025-09-20 10:00:42', '2025-09-20 10:00:42'),
(4707, 'english', 'Payment Screenshot', 'Payment Screenshot', '2025-09-24 07:46:47', '2025-09-24 07:46:47'),
(4708, 'hindi', 'Payment Screenshot', 'Payment Screenshot', '2025-09-24 07:46:47', '2025-09-24 07:46:47'),
(4709, 'english', 'View Profile', 'View Profile', '2025-09-25 09:17:17', '2025-09-25 09:17:17'),
(4710, 'hindi', 'View Profile', 'View Profile', '2025-09-25 09:17:17', '2025-09-25 09:17:17'),
(4711, 'english', 'User Profile', 'User Profile', '2025-09-25 09:53:30', '2025-09-25 09:53:30'),
(4712, 'hindi', 'User Profile', 'User Profile', '2025-09-25 09:53:30', '2025-09-25 09:53:30'),
(4713, 'english', 'Pay Via UPI', 'Pay Via UPI', '2025-09-26 08:00:14', '2025-09-26 08:00:14'),
(4714, 'hindi', 'Pay Via UPI', 'Pay Via UPI', '2025-09-26 08:00:14', '2025-09-26 08:00:14'),
(4715, 'english', 'Featured Listing', 'Featured Listing', '2025-09-30 10:27:59', '2025-09-30 10:27:59'),
(4716, 'hindi', 'Featured Listing', 'Featured Listing', '2025-09-30 10:27:59', '2025-09-30 10:27:59'),
(4717, 'hindi', 'Update Amenities', 'Update Amenities', '2025-10-01 09:12:17', '2025-10-01 09:12:17'),
(4718, 'hindi', 'Profile Update', 'Profile Update', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4719, 'hindi', 'My Listing', 'My Listing', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4720, 'hindi', 'Subscription', 'Subscription', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4721, 'hindi', 'Full name', 'Full name', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4722, 'hindi', 'Phone', 'Phone', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4723, 'hindi', 'Facebook', 'Facebook', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4724, 'hindi', 'Twitter', 'Twitter', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4725, 'hindi', 'Linkedin', 'Linkedin', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4726, 'hindi', 'Gender', 'Gender', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4727, 'hindi', 'Other', 'Other', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4728, 'hindi', 'Bio', 'Bio', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4729, 'hindi', 'Profile Photo', 'Profile Photo', '2025-10-01 09:12:59', '2025-10-01 09:12:59'),
(4730, 'hindi', 'State', 'State', '2025-10-01 09:13:01', '2025-10-01 09:13:01'),
(4731, 'hindi', 'Address line', 'Address line', '2025-10-01 09:13:01', '2025-10-01 09:13:01'),
(4732, 'hindi', 'Old Password', 'Old Password', '2025-10-01 09:13:01', '2025-10-01 09:13:01'),
(4733, 'hindi', 'Select  City', 'Select  City', '2025-10-01 09:13:01', '2025-10-01 09:13:01'),
(4734, 'hindi', 'Hotel Listing Details', 'Hotel Listing Details', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4735, 'hindi', 'Hotel details', 'Hotel details', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4736, 'hindi', 'Total Price : ', 'Total Price : ', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4737, 'hindi', 'Add to Wishlist', 'Add to Wishlist', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4738, 'hindi', 'Copy link to share', 'Copy link to share', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4739, 'hindi', 'Back to listing', 'Back to listing', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4740, 'hindi', 'Published:', 'Published:', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4741, 'hindi', 'Room', 'Room', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4742, 'hindi', 'Bed', 'Bed', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4743, 'hindi', 'Bath', 'Bath', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4744, 'hindi', 'sft', 'sft', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4745, 'hindi', 'All', 'All', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4746, 'hindi', 'Please login first!', 'Please login first!', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4747, 'hindi', 'Location', 'Location', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4748, 'hindi', 'Get Direction', 'Get Direction', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4749, 'hindi', 'Agent Contact Details', 'Agent Contact Details', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4750, 'hindi', 'View Details', 'View Details', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4751, 'hindi', 'Listing by', 'Listing by', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4752, 'hindi', 'Phone:', 'Phone:', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4753, 'hindi', 'Email:', 'Email:', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4754, 'hindi', 'Message*', 'Message*', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4755, 'hindi', 'Reviews', 'Reviews', '2025-10-01 09:25:05', '2025-10-01 09:25:05'),
(4756, 'hindi', 'Book a Meeting', 'Book a Meeting', '2025-10-01 09:25:06', '2025-10-01 09:25:06'),
(4757, 'hindi', 'Submit Now', 'Submit Now', '2025-10-01 09:25:06', '2025-10-01 09:25:06'),
(4758, 'hindi', 'Related Hotels', 'Related Hotels', '2025-10-01 09:25:06', '2025-10-01 09:25:06'),
(4759, 'hindi', 'See Details', 'See Details', '2025-10-01 09:25:06', '2025-10-01 09:25:06'),
(4760, 'hindi', 'night', 'night', '2025-10-01 09:25:06', '2025-10-01 09:25:06'),
(4761, 'hindi', 'Listing', 'Listing', '2025-10-01 09:25:06', '2025-10-01 09:25:06'),
(4762, 'hindi', 'Report this listing', 'Report this listing', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4763, 'hindi', 'Add Reviews', 'Add Reviews', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4764, 'hindi', 'Add Your Review', 'Add Your Review', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4765, 'hindi', 'Rating', 'Rating', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4766, 'hindi', 'Select Rating', 'Select Rating', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4767, 'hindi', '1', '1', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4768, 'hindi', '2', '2', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4769, 'hindi', '3', '3', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4770, 'hindi', '4', '4', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4771, 'hindi', '5', '5', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4772, 'hindi', 'Review', 'Review', '2025-10-01 09:25:14', '2025-10-01 09:25:14'),
(4773, 'hindi', 'Add New customer', 'Add New customer', '2025-10-01 09:30:39', '2025-10-01 09:30:39'),
(4774, 'hindi', 'Edit User', 'Edit User', '2025-10-01 09:30:39', '2025-10-01 09:30:39'),
(4775, 'hindi', 'Info Update', 'Info Update', '2025-10-01 09:31:00', '2025-10-01 09:31:00'),
(4776, 'hindi', 'Real-Estate Directory Listing', 'Real-Estate Directory Listing', '2025-10-01 09:31:28', '2025-10-01 09:31:28'),
(4777, 'hindi', 'Discount', 'Discount', '2025-10-01 09:31:28', '2025-10-01 09:31:28'),
(4778, 'hindi', 'Learn More', 'Learn More', '2025-10-01 09:31:28', '2025-10-01 09:31:28'),
(4779, 'hindi', 'New Properties', 'New Properties', '2025-10-01 09:31:28', '2025-10-01 09:31:28'),
(4780, 'hindi', 'Explore All Properties', 'Explore All Properties', '2025-10-01 09:31:28', '2025-10-01 09:31:28'),
(4781, 'hindi', 'For Sell', 'For Sell', '2025-10-01 09:31:28', '2025-10-01 09:31:28'),
(4782, 'hindi', 'For Rent', 'For Rent', '2025-10-01 09:31:28', '2025-10-01 09:31:28'),
(4783, 'hindi', 'All Listing', 'All Listing', '2025-10-01 09:31:28', '2025-10-01 09:31:28'),
(4784, 'hindi', 'Choose City', 'Choose City', '2025-10-01 09:31:28', '2025-10-01 09:31:28'),
(4785, 'hindi', 'Agent Listings', 'Agent Listings', '2025-10-01 09:32:02', '2025-10-01 09:32:02'),
(4786, 'hindi', 'Filter', 'Filter', '2025-10-01 09:32:02', '2025-10-01 09:32:02'),
(4787, 'hindi', 'All Listing Type', 'All Listing Type', '2025-10-01 09:32:06', '2025-10-01 09:32:06'),
(4788, 'hindi', 'Hotel Listing', 'Hotel Listing', '2025-10-01 09:32:06', '2025-10-01 09:32:06'),
(4789, 'hindi', 'Real Estate Listing', 'Real Estate Listing', '2025-10-01 09:32:06', '2025-10-01 09:32:06'),
(4790, 'hindi', 'Restaurant Listing', 'Restaurant Listing', '2025-10-01 09:32:06', '2025-10-01 09:32:06'),
(4791, 'hindi', 'Beauty Listing', 'Beauty Listing', '2025-10-01 09:32:06', '2025-10-01 09:32:06'),
(4792, 'hindi', 'Car Listing', 'Car Listing', '2025-10-01 09:32:06', '2025-10-01 09:32:06'),
(4793, 'hindi', 'Listing Create Form', 'Listing Create Form', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4794, 'hindi', 'Property ID', 'Property ID', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4795, 'hindi', 'Listing price', 'Listing price', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4796, 'hindi', 'Enter listing price', 'Enter listing price', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4797, 'hindi', 'Listing Discount price', 'Listing Discount price', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4798, 'hindi', 'Enter discount price', 'Enter discount price', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4799, 'hindi', 'Bed number', 'Bed number', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4800, 'hindi', 'Enter bed number', 'Enter bed number', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4801, 'hindi', 'Bath number', 'Bath number', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4802, 'hindi', 'Enter bath number', 'Enter bath number', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4803, 'hindi', 'Floor Size', 'Floor Size', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4804, 'hindi', 'Enter floor size', 'Enter floor size', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4805, 'hindi', 'Garage', 'Garage', '2025-10-01 09:32:11', '2025-10-01 09:32:11'),
(4806, 'hindi', 'Enter year', 'Enter year', '2025-10-01 09:32:12', '2025-10-01 09:32:12'),
(4807, 'hindi', 'Select Status', 'Select Status', '2025-10-01 09:32:12', '2025-10-01 09:32:12'),
(4808, 'hindi', 'Dimension', 'Dimension', '2025-10-01 09:32:12', '2025-10-01 09:32:12'),
(4809, 'hindi', 'Enter property dimension', 'Enter property dimension', '2025-10-01 09:32:12', '2025-10-01 09:32:12'),
(4810, 'hindi', 'Sub Dimension', 'Sub Dimension', '2025-10-01 09:32:12', '2025-10-01 09:32:12'),
(4811, 'hindi', 'Enter property sub dimension', 'Enter property sub dimension', '2025-10-01 09:32:12', '2025-10-01 09:32:12'),
(4812, 'hindi', 'Write your description', 'Write your description', '2025-10-01 09:32:12', '2025-10-01 09:32:12'),
(4813, 'hindi', 'Upload Product Image', 'Upload Product Image', '2025-10-01 09:32:13', '2025-10-01 09:32:13'),
(4814, 'hindi', 'Forgot Password', 'Forgot Password', '2025-10-01 10:03:39', '2025-10-01 10:03:39'),
(4815, 'hindi', 'Enter your email address to receive a verification  code', 'Enter your email address to receive a verification  code', '2025-10-01 10:03:39', '2025-10-01 10:03:39'),
(4816, 'hindi', 'Send', 'Send', '2025-10-01 10:03:39', '2025-10-01 10:03:39'),
(4817, 'hindi', 'About-Us', 'About-Us', '2025-10-01 10:13:50', '2025-10-01 10:13:50'),
(4818, 'hindi', 'Hotel Grid', 'Hotel Grid', '2025-10-01 10:13:56', '2025-10-01 10:13:56'),
(4819, 'hindi', 'Hotel Category', 'Hotel Category', '2025-10-01 10:13:56', '2025-10-01 10:13:56'),
(4820, 'hindi', 'Bedroom', 'Bedroom', '2025-10-01 10:13:56', '2025-10-01 10:13:56'),
(4821, 'hindi', 'Bathroom', 'Bathroom', '2025-10-01 10:13:56', '2025-10-01 10:13:56'),
(4822, 'hindi', 'Listing Created successfully!', 'Listing Created successfully!', '2025-10-01 10:35:08', '2025-10-01 10:35:08'),
(4823, 'hindi', 'View Frontend', 'View Frontend', '2025-10-01 10:35:09', '2025-10-01 10:35:09'),
(4824, 'hindi', 'Edit Listing', 'Edit Listing', '2025-10-01 10:35:09', '2025-10-01 10:35:09'),
(4825, 'hindi', 'Hide', 'Hide', '2025-10-01 10:35:09', '2025-10-01 10:35:09'),
(4826, 'hindi', 'Remove Listing', 'Remove Listing', '2025-10-01 10:35:09', '2025-10-01 10:35:09'),
(4827, 'hindi', 'sqft', 'sqft', '2025-10-01 10:35:21', '2025-10-01 10:35:21'),
(4828, 'hindi', 'Property', 'Property', '2025-10-01 10:35:21', '2025-10-01 10:35:21'),
(4829, 'hindi', 'Real Estate Listing Details', 'Real Estate Listing Details', '2025-10-01 10:35:27', '2025-10-01 10:35:27'),
(4830, 'hindi', 'Details', 'Details', '2025-10-01 10:35:27', '2025-10-01 10:35:27'),
(4831, 'hindi', 'ID :', 'ID :', '2025-10-01 10:35:27', '2025-10-01 10:35:27'),
(4832, 'hindi', 'Read More', 'Read More', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4833, 'hindi', 'Property Size', 'Property Size', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4834, 'hindi', 'Bedrooms', 'Bedrooms', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4835, 'hindi', 'Bathrooms', 'Bathrooms', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4836, 'hindi', 'Year Build', 'Year Build', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4837, 'hindi', 'Property Agent', 'Property Agent', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4838, 'hindi', 'Floor Plans', 'Floor Plans', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4839, 'hindi', 'Video', 'Video', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4840, 'hindi', 'Nearby', 'Nearby', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4841, 'hindi', '3D Model', '3D Model', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4842, 'hindi', 'Related Property', 'Related Property', '2025-10-01 10:35:28', '2025-10-01 10:35:28'),
(4843, 'hindi', 'Update Listing', 'Update Listing', '2025-10-01 10:36:12', '2025-10-01 10:36:12'),
(4844, 'hindi', 'Booking', 'Booking', '2025-10-01 10:36:12', '2025-10-01 10:36:12'),
(4845, 'hindi', 'Preview Video', 'Preview Video', '2025-10-01 10:36:13', '2025-10-01 10:36:13'),
(4846, 'hindi', 'Floor Plan', 'Floor Plan', '2025-10-01 10:36:13', '2025-10-01 10:36:13'),
(4847, 'hindi', 'Nearby Location', 'Nearby Location', '2025-10-01 10:36:13', '2025-10-01 10:36:13'),
(4848, 'hindi', 'Add NearBy Location', 'Add NearBy Location', '2025-10-01 10:36:13', '2025-10-01 10:36:13'),
(4849, 'hindi', 'School', 'School', '2025-10-01 10:36:13', '2025-10-01 10:36:13'),
(4850, 'hindi', 'Hospital', 'Hospital', '2025-10-01 10:36:13', '2025-10-01 10:36:13'),
(4851, 'hindi', 'Shopping Center', 'Shopping Center', '2025-10-01 10:36:13', '2025-10-01 10:36:13'),
(4852, 'hindi', 'Upload 3D Model', 'Upload 3D Model', '2025-10-01 10:36:13', '2025-10-01 10:36:13'),
(4853, 'hindi', 'Upload A 3D Model', 'Upload A 3D Model', '2025-10-01 10:36:13', '2025-10-01 10:36:13'),
(4854, 'hindi', 'Add a Nearby Location', 'Add a Nearby Location', '2025-10-01 10:37:18', '2025-10-01 10:37:18'),
(4855, 'hindi', 'Select Location', 'Select Location', '2025-10-01 10:37:19', '2025-10-01 10:37:19'),
(4856, 'hindi', 'Save Nearby', 'Save Nearby', '2025-10-01 10:37:19', '2025-10-01 10:37:19'),
(4857, 'hindi', 'Your selected', 'Your selected', '2025-10-01 10:37:19', '2025-10-01 10:37:19'),
(4858, 'hindi', 'NearBy Location Add successful!', 'NearBy Location Add successful!', '2025-10-01 10:39:12', '2025-10-01 10:39:12'),
(4859, 'hindi', 'Listing Update successfully!', 'Listing Update successfully!', '2025-10-01 10:43:37', '2025-10-01 10:43:37'),
(4860, 'hindi', 'Current Package', 'Current Package', '2025-10-01 10:44:52', '2025-10-01 10:44:52'),
(4861, 'english', 'Update Nearby', 'Update Nearby', '2025-10-01 10:48:17', '2025-10-01 10:48:17'),
(4862, 'hindi', 'Update Nearby', 'Update Nearby', '2025-10-01 10:48:17', '2025-10-01 10:48:17'),
(4863, 'hindi', 'View More', 'View More', '2025-10-01 10:55:37', '2025-10-01 10:55:37'),
(4864, 'hindi', 'Frontend Settings', 'Frontend Settings', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4865, 'hindi', 'Logo & Images', 'Logo & Images', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4866, 'hindi', 'Website FAQ', 'Website FAQ', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4867, 'hindi', 'Map Position', 'Map Position', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4868, 'hindi', 'Right Sidebar', 'Right Sidebar', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4869, 'hindi', 'Top Header', 'Top Header', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4870, 'hindi', 'Update Settings', 'Update Settings', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4871, 'hindi', 'Beauty Frontend Settings', 'Beauty Frontend Settings', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4872, 'hindi', 'Beauty Title', 'Beauty Title', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4873, 'hindi', 'Beauty Description', 'Beauty Description', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4874, 'hindi', 'Beauty Video Url', 'Beauty Video Url', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4875, 'hindi', 'Beauty Banner', 'Beauty Banner', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4876, 'hindi', 'Upload Beauty Banner Image', 'Upload Beauty Banner Image', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4877, 'hindi', 'Beauty Facial Title', 'Beauty Facial Title', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4878, 'hindi', 'Beauty Facial Discount', 'Beauty Facial Discount', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4879, 'hindi', '2 words', '2 words', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4880, 'hindi', 'Beauty Facial Image', 'Beauty Facial Image', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4881, 'hindi', 'Upload Beauty Facial Image', 'Upload Beauty Facial Image', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4882, 'hindi', 'Beauty Massage Title', 'Beauty Massage Title', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4883, 'hindi', 'Beauty Massage Discount ', 'Beauty Massage Discount ', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4884, 'hindi', 'Beauty Massage Image', 'Beauty Massage Image', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4885, 'hindi', 'Upload Beauty Massage Image', 'Upload Beauty Massage Image', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4886, 'hindi', 'Beauty Motion Title', 'Beauty Motion Title', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4887, 'hindi', 'Beauty Motion Description', 'Beauty Motion Description', '2025-10-01 11:17:04', '2025-10-01 11:17:04'),
(4888, 'hindi', 'Beauty Motion Image', 'Beauty Motion Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4889, 'hindi', 'Car Frontend Settings', 'Car Frontend Settings', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4890, 'hindi', 'Car Banner Title', 'Car Banner Title', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4891, 'hindi', 'Car Banner Description', 'Car Banner Description', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4892, 'hindi', 'Car Banner Banner', 'Car Banner Banner', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4893, 'hindi', 'Upload  Image', 'Upload  Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4894, 'hindi', 'Car Motion Title', 'Car Motion Title', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4895, 'hindi', 'Car Motion Description', 'Car Motion Description', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4896, 'hindi', 'Car Motion Image', 'Car Motion Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4897, 'hindi', 'Upload Image', 'Upload Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4898, 'hindi', 'Real Estate Frontend Settings', 'Real Estate Frontend Settings', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4899, 'hindi', 'Real Estate  Title', 'Real Estate  Title', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4900, 'hindi', 'Real Estate Banner Description', 'Real Estate Banner Description', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4901, 'hindi', 'Real Estate Banner', 'Real Estate Banner', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4902, 'hindi', 'Real Estate Discount Title', 'Real Estate Discount Title', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4903, 'hindi', 'Real Estate Short Description', 'Real Estate Short Description', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4904, 'hindi', 'Discount Image', 'Discount Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4905, 'hindi', 'Hotel Frontend Settings', 'Hotel Frontend Settings', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4906, 'hindi', 'Hotel Banner Title', 'Hotel Banner Title', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4907, 'hindi', 'Hotel Banner Description', 'Hotel Banner Description', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4908, 'hindi', 'Hotel Video Url', 'Hotel Video Url', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4909, 'hindi', 'Hotel Banner', 'Hotel Banner', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4910, 'hindi', 'Booking Title', 'Booking Title', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4911, 'hindi', 'Booking Image', 'Booking Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4912, 'hindi', 'Exclusive Deals', 'Exclusive Deals', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4913, 'hindi', 'Exclusive Deals Discount', 'Exclusive Deals Discount', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4914, 'hindi', 'Exclusive Banner', 'Exclusive Banner', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4915, 'hindi', 'Size the moment', 'Size the moment', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4916, 'hindi', 'Size  Discount', 'Size  Discount', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4917, 'hindi', 'Size Banner', 'Size Banner', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4918, 'hindi', 'Restaurant Frontend Settings', 'Restaurant Frontend Settings', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4919, 'hindi', 'Restaurant Banner Title', 'Restaurant Banner Title', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4920, 'hindi', 'Restaurant Banner', 'Restaurant Banner', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4921, 'hindi', 'Discount Banner', 'Discount Banner', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4922, 'hindi', 'Upload light logo', 'Upload light logo', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4923, 'hindi', 'Upload Dark logo', 'Upload Dark logo', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4924, 'hindi', 'Upload favicon', 'Upload favicon', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4925, 'hindi', 'Upload Hotel type Image', 'Upload Hotel type Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4926, 'hindi', 'Upload Doctors type Image', 'Upload Doctors type Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4927, 'hindi', '360 X 360', '360 X 360', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4928, 'hindi', 'Upload Cars type Image', 'Upload Cars type Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4929, 'hindi', 'Upload Beauty type Image', 'Upload Beauty type Image', '2025-10-01 11:17:05', '2025-10-01 11:17:05'),
(4930, 'hindi', 'Upload Real Estate type Image', 'Upload Real Estate type Image', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4931, 'hindi', 'Upload Restaurant type Image', 'Upload Restaurant type Image', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4932, 'hindi', 'Mother Homepage Banner', 'Mother Homepage Banner', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4933, 'hindi', 'Update Banner', 'Update Banner', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4934, 'hindi', 'Add New Banner', 'Add New Banner', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4935, 'hindi', 'Trusted Company', 'Trusted Company', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4936, 'hindi', 'Update Company Logo', 'Update Company Logo', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4937, 'hindi', 'Add New Company Logo', 'Add New Company Logo', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4938, 'hindi', 'Website FAQS', 'Website FAQS', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4939, 'hindi', 'Question', 'Question', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4940, 'hindi', 'Write a question', 'Write a question', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4941, 'hindi', 'Answer', 'Answer', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4942, 'hindi', 'Write a question answer', 'Write a question answer', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4943, 'hindi', 'Remove', 'Remove', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4944, 'hindi', 'Write description', 'Write description', '2025-10-01 11:17:06', '2025-10-01 11:17:06'),
(4945, 'hindi', 'Banner', 'Banner', '2025-10-01 11:17:47', '2025-10-01 11:17:47'),
(4946, 'hindi', 'Hotel Directory Listing', 'Hotel Directory Listing', '2025-10-01 11:20:04', '2025-10-01 11:20:04'),
(4947, 'hindi', 'Find Gateway Deals', 'Find Gateway Deals', '2025-10-01 11:20:04', '2025-10-01 11:20:04'),
(4948, 'hindi', 'Explore Hotel', 'Explore Hotel', '2025-10-01 11:20:04', '2025-10-01 11:20:04'),
(4949, 'hindi', 'Top Hotels', 'Top Hotels', '2025-10-01 11:20:04', '2025-10-01 11:20:04'),
(4950, 'hindi', 'See all', 'See all', '2025-10-01 11:20:05', '2025-10-01 11:20:05'),
(4951, 'hindi', 'Hotels', 'Hotels', '2025-10-01 11:20:05', '2025-10-01 11:20:05'),
(4952, 'hindi', 'Popular Hotel', 'Popular Hotel', '2025-10-01 11:20:05', '2025-10-01 11:20:05'),
(4953, 'hindi', 'Flexible budget', 'Flexible budget', '2025-10-01 11:20:05', '2025-10-01 11:20:05'),
(4954, 'hindi', 'Peaceful place', 'Peaceful place', '2025-10-01 11:20:05', '2025-10-01 11:20:05'),
(4955, 'hindi', 'Well decorated', 'Well decorated', '2025-10-01 11:20:05', '2025-10-01 11:20:05'),
(4956, 'hindi', 'Take A Tour', 'Take A Tour', '2025-10-01 11:20:05', '2025-10-01 11:20:05'),
(4957, 'hindi', 'Listing Details', 'Listing Details', '2025-10-01 11:31:42', '2025-10-01 11:31:42'),
(4958, 'hindi', 'Get In Touch', 'Get In Touch', '2025-10-01 11:50:49', '2025-10-01 11:50:49');
INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(4959, 'hindi', 'Promote your business and get discovered with ease — List your services on Listing Atlas, the smart directory solution.', 'Promote your business and get discovered with ease — List your services on Listing Atlas, the smart directory solution.', '2025-10-01 11:50:49', '2025-10-01 11:50:49'),
(4960, 'hindi', 'Send Message', 'Send Message', '2025-10-01 11:50:49', '2025-10-01 11:50:49'),
(4961, 'hindi', 'Agent Details', 'Agent Details', '2025-10-01 11:52:46', '2025-10-01 11:52:46'),
(4962, 'hindi', 'Facebook.com', 'Facebook.com', '2025-10-01 11:52:46', '2025-10-01 11:52:46'),
(4963, 'hindi', 'Twitter.com', 'Twitter.com', '2025-10-01 11:52:46', '2025-10-01 11:52:46'),
(4964, 'hindi', 'linkedin.com', 'linkedin.com', '2025-10-01 11:52:47', '2025-10-01 11:52:47'),
(4965, 'hindi', 'Listings', 'Listings', '2025-10-01 11:52:47', '2025-10-01 11:52:47'),
(4966, 'hindi', 'Send Email', 'Send Email', '2025-10-01 11:52:47', '2025-10-01 11:52:47'),
(4967, 'hindi', 'Call', 'Call', '2025-10-01 11:52:47', '2025-10-01 11:52:47'),
(4968, 'hindi', 'Real Estate Grid', 'Real Estate Grid', '2025-10-01 15:13:46', '2025-10-01 15:13:46'),
(4969, 'hindi', 'Real-estate Category', 'Real-estate Category', '2025-10-01 15:13:46', '2025-10-01 15:13:46'),
(4970, 'hindi', 'Hotel list', 'Hotel list', '2025-10-01 17:29:47', '2025-10-01 17:29:47'),
(4971, 'hindi', 'Our Latest Blog', 'Our Latest Blog', '2025-10-01 18:26:05', '2025-10-01 18:26:05'),
(4972, 'hindi', 'Recent Post', 'Recent Post', '2025-10-01 18:26:05', '2025-10-01 18:26:05'),
(4973, 'hindi', 'Blog Details', 'Blog Details', '2025-10-01 18:26:07', '2025-10-01 18:26:07'),
(4974, 'hindi', 'Share On :', 'Share On :', '2025-10-01 18:26:07', '2025-10-01 18:26:07'),
(4975, 'hindi', 'Tags:', 'Tags:', '2025-10-01 18:26:07', '2025-10-01 18:26:07'),
(4976, 'hindi', 'Related Blogs', 'Related Blogs', '2025-10-01 18:26:07', '2025-10-01 18:26:07'),
(4977, 'hindi', 'Privacy-policy', 'Privacy-policy', '2025-10-02 05:16:31', '2025-10-02 05:16:31'),
(4978, 'hindi', 'Beauty Directory Listings', 'Beauty Directory Listings', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4979, 'hindi', 'Book Now', 'Book Now', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4980, 'hindi', 'Explore Our Products', 'Explore Our Products', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4981, 'hindi', 'Popular Product', 'Popular Product', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4982, 'hindi', 'Best Product', 'Best Product', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4983, 'hindi', 'Wellness Product', 'Wellness Product', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4984, 'hindi', 'Hair Treatment', 'Hair Treatment', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4985, 'hindi', '&', '&', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4986, 'hindi', 'Repair', 'Repair', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4987, 'hindi', 'Get Discount Up To 20', 'Get Discount Up To 20', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4988, 'hindi', '%', '%', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4989, 'hindi', 'Best Massage', 'Best Massage', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4990, 'hindi', 'Explore More', 'Explore More', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4991, 'hindi', 'Popular Beauty Parlors', 'Popular Beauty Parlors', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4992, 'hindi', 'Find The Best Spa Here', 'Find The Best Spa Here', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4993, 'hindi', 'Complete wellness with massage', 'Complete wellness with massage', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4994, 'hindi', 'Booking Online', 'Booking Online', '2025-10-02 05:37:59', '2025-10-02 05:37:59'),
(4995, 'hindi', 'Terms-and-condition', 'Terms-and-condition', '2025-10-02 06:17:37', '2025-10-02 06:17:37'),
(4996, 'hindi', 'Car Directory Listing', 'Car Directory Listing', '2025-10-02 14:07:52', '2025-10-02 14:07:52'),
(4997, 'hindi', 'Brands', 'Brands', '2025-10-02 14:07:52', '2025-10-02 14:07:52'),
(4998, 'hindi', 'Search Cars', 'Search Cars', '2025-10-02 14:07:52', '2025-10-02 14:07:52'),
(4999, 'hindi', 'Our Happy Customers', 'Our Happy Customers', '2025-10-02 14:07:52', '2025-10-02 14:07:52'),
(5000, 'hindi', 'Latest Vehicles on Sale', 'Latest Vehicles on Sale', '2025-10-02 14:07:52', '2025-10-02 14:07:52'),
(5001, 'hindi', 'FEATURED VEHICLES', 'FEATURED VEHICLES', '2025-10-02 14:07:52', '2025-10-02 14:07:52'),
(5002, 'hindi', 'Top Cars', 'Top Cars', '2025-10-02 14:07:52', '2025-10-02 14:07:52'),
(5003, 'hindi', 'Listing List', 'Listing List', '2025-10-03 05:19:23', '2025-10-03 05:19:23'),
(5004, 'hindi', 'Add New Listing', 'Add New Listing', '2025-10-03 05:19:23', '2025-10-03 05:19:23'),
(5005, 'hindi', 'Change visibility', 'Change visibility', '2025-10-03 05:19:28', '2025-10-03 05:19:28'),
(5006, 'hindi', 'Reply', 'Reply', '2025-10-03 05:54:55', '2025-10-03 05:54:55'),
(5007, 'hindi', 'Options', 'Options', '2025-10-03 05:54:55', '2025-10-03 05:54:55'),
(5008, 'hindi', 'Not Registered', 'Not Registered', '2025-10-03 05:54:55', '2025-10-03 05:54:55'),
(5009, 'hindi', 'Registered User', 'Registered User', '2025-10-03 05:54:55', '2025-10-03 05:54:55'),
(5010, 'hindi', 'data', 'data', '2025-10-03 05:54:56', '2025-10-03 05:54:56'),
(5011, 'english', 'SEO On Page', 'SEO On Page', '2025-10-03 12:32:06', '2025-10-03 12:32:06'),
(5012, 'hindi', 'SEO On Page', 'SEO On Page', '2025-10-03 12:32:06', '2025-10-03 12:32:06'),
(5013, 'english', 'Edit Academies Listing Frontend Settings', 'Edit Academies Listing Frontend Settings', '2025-10-03 12:42:56', '2025-10-03 12:42:56'),
(5014, 'hindi', 'Edit Academies Listing Frontend Settings', 'Edit Academies Listing Frontend Settings', '2025-10-03 12:42:56', '2025-10-03 12:42:56'),
(5015, 'hindi', 'Agent Appointment', 'Agent Appointment', '2025-10-04 04:52:32', '2025-10-04 04:52:32'),
(5016, 'hindi', 'Paid', 'Paid', '2025-10-04 04:52:36', '2025-10-04 04:52:36'),
(5017, 'hindi', 'Buyer', 'Buyer', '2025-10-04 05:54:09', '2025-10-04 05:54:09'),
(5018, 'hindi', 'Package', 'Package', '2025-10-04 05:54:09', '2025-10-04 05:54:09'),
(5019, 'hindi', 'Amount Paid', 'Amount Paid', '2025-10-04 05:54:09', '2025-10-04 05:54:09'),
(5020, 'hindi', 'Payment Method', 'Payment Method', '2025-10-04 05:54:09', '2025-10-04 05:54:09'),
(5021, 'hindi', 'View Menu', 'View Menu', '2025-10-04 07:32:52', '2025-10-04 07:32:52'),
(5022, 'hindi', 'Book A Table', 'Book A Table', '2025-10-04 07:32:52', '2025-10-04 07:32:52'),
(5023, 'hindi', 'Popular Restaurant', 'Popular Restaurant', '2025-10-04 07:32:52', '2025-10-04 07:32:52'),
(5024, 'hindi', 'Explore Restaurant', 'Explore Restaurant', '2025-10-04 07:32:52', '2025-10-04 07:32:52'),
(5025, 'hindi', 'Trending Restaurant', 'Trending Restaurant', '2025-10-04 07:32:52', '2025-10-04 07:32:52'),
(5026, 'hindi', 'Date', 'Date', '2025-10-06 05:48:26', '2025-10-06 05:48:26'),
(5027, 'hindi', 'Address : ', 'Address : ', '2025-10-06 05:48:26', '2025-10-06 05:48:26'),
(5028, 'hindi', 'following', 'following', '2025-10-06 05:48:39', '2025-10-06 05:48:39'),
(5029, 'hindi', 'Customer Appointment', 'Customer Appointment', '2025-10-06 05:48:41', '2025-10-06 05:48:41'),
(5030, 'hindi', 'Invoice', 'Invoice', '2025-10-06 05:48:43', '2025-10-06 05:48:43'),
(5031, 'hindi', 'Refund-policy', 'Refund-policy', '2025-10-06 06:03:01', '2025-10-06 06:03:01'),
(5032, 'hindi', 'Add some listing feature', 'Add some listing feature', '2025-10-06 06:09:56', '2025-10-06 06:09:56'),
(5033, 'hindi', 'Car Grid', 'Car Grid', '2025-10-06 07:39:15', '2025-10-06 07:39:15'),
(5034, 'hindi', 'Car Category', 'Car Category', '2025-10-06 07:39:15', '2025-10-06 07:39:15'),
(5035, 'hindi', 'Car type', 'Car type', '2025-10-06 07:39:15', '2025-10-06 07:39:15'),
(5036, 'hindi', 'Years', 'Years', '2025-10-06 07:39:15', '2025-10-06 07:39:15'),
(5037, 'hindi', 'Colors', 'Colors', '2025-10-06 07:39:15', '2025-10-06 07:39:15'),
(5038, 'english', 'Your package listing limit has been reached. Please upgrade your package to add more listings.', 'Your package listing limit has been reached. Please upgrade your package to add more listings.', '2025-10-06 07:45:26', '2025-10-06 07:45:26'),
(5039, 'hindi', 'Your package listing limit has been reached. Please upgrade your package to add more listings.', 'Your package listing limit has been reached. Please upgrade your package to add more listings.', '2025-10-06 07:45:26', '2025-10-06 07:45:26'),
(5040, 'hindi', 'Beauty Grid', 'Beauty Grid', '2025-10-06 08:04:21', '2025-10-06 08:04:21'),
(5041, 'hindi', 'Beauty Category', 'Beauty Category', '2025-10-06 08:04:21', '2025-10-06 08:04:21'),
(5042, 'hindi', 'Restaurant Grid', 'Restaurant Grid', '2025-10-06 08:04:22', '2025-10-06 08:04:22'),
(5043, 'hindi', 'Restaurant Category', 'Restaurant Category', '2025-10-06 08:04:22', '2025-10-06 08:04:22'),
(5044, 'hindi', 'Car list', 'Car list', '2025-10-06 09:20:37', '2025-10-06 09:20:37'),
(5045, 'hindi', 'Beauty List', 'Beauty List', '2025-10-06 09:57:03', '2025-10-06 09:57:03'),
(5046, 'hindi', 'stock', 'stock', '2025-10-06 10:02:10', '2025-10-06 10:02:10'),
(5047, 'english', 'Custom Field Type : ', 'Custom Field Type : ', '2025-10-06 10:15:33', '2025-10-06 10:15:33'),
(5048, 'hindi', 'Custom Field Type : ', 'Custom Field Type : ', '2025-10-06 10:15:33', '2025-10-06 10:15:33'),
(5049, 'hindi', 'Rooms', 'Rooms', '2025-10-06 10:44:33', '2025-10-06 10:44:33'),
(5050, 'hindi', 'Add some Room', 'Add some Room', '2025-10-06 10:44:34', '2025-10-06 10:44:34'),
(5051, 'hindi', 'Add New Room', 'Add New Room', '2025-10-06 10:44:34', '2025-10-06 10:44:34'),
(5052, 'hindi', 'Add Room', 'Add Room', '2025-10-06 10:44:34', '2025-10-06 10:44:34'),
(5053, 'hindi', 'Additional Information', 'Additional Information', '2025-10-06 12:06:15', '2025-10-06 12:06:15'),
(5054, 'hindi', 'User information updated!', 'User information updated!', '2025-10-06 12:34:40', '2025-10-06 12:34:40'),
(5055, 'hindi', 'Messages', 'Messages', '2025-10-13 08:44:09', '2025-10-13 08:44:09'),
(5056, 'hindi', 'Inbox is Empty', 'Inbox is Empty', '2025-10-13 08:44:09', '2025-10-13 08:44:09'),
(5057, 'hindi', 'No Messages Yet.', 'No Messages Yet.', '2025-10-13 08:44:09', '2025-10-13 08:44:09'),
(5058, 'hindi', 'It seems you haven\'t start conversion', 'It seems you haven\'t start conversion', '2025-10-13 08:44:09', '2025-10-13 08:44:09'),
(5059, 'hindi', ' with any of our professionals yet!', ' with any of our professionals yet!', '2025-10-13 08:44:09', '2025-10-13 08:44:09'),
(5060, 'hindi', 'Create blog', 'Create blog', '2025-10-13 12:26:45', '2025-10-13 12:26:45'),
(5061, 'hindi', 'Keywords', 'Keywords', '2025-10-13 12:26:45', '2025-10-13 12:26:45'),
(5062, 'hindi', 'Create Blogs', 'Create Blogs', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5063, 'hindi', 'Blog Title', 'Blog Title', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5064, 'hindi', 'Enter blog title', 'Enter blog title', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5065, 'hindi', 'Select blog category', 'Select blog category', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5066, 'hindi', 'Blog Description', 'Blog Description', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5067, 'hindi', 'Blog Keyword', 'Blog Keyword', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5068, 'hindi', 'Keyword will be:- keyword1; keyword2; keyword3', 'Keyword will be:- keyword1; keyword2; keyword3', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5069, 'hindi', 'Blog Banner', 'Blog Banner', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5070, 'hindi', 'Do you want to mark it as popular', 'Do you want to mark it as popular', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5071, 'hindi', 'Mark as popular', 'Mark as popular', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5072, 'hindi', 'Write Blog description', 'Write Blog description', '2025-10-13 12:26:49', '2025-10-13 12:26:49'),
(5073, 'hindi', 'Admin Addon List', 'Admin Addon List', '2025-10-15 14:06:57', '2025-10-15 14:06:57'),
(5074, 'hindi', 'Addon Manager', 'Addon Manager', '2025-10-15 14:06:57', '2025-10-15 14:06:57'),
(5075, 'hindi', 'Add New Addon', 'Add New Addon', '2025-10-15 14:06:57', '2025-10-15 14:06:57'),
(5076, 'hindi', 'Pending', 'Pending', '2025-10-17 09:49:15', '2025-10-17 09:49:15'),
(5077, 'hindi', 'Add New Blog', 'Add New Blog', '2025-10-17 09:49:31', '2025-10-17 09:49:31'),
(5078, 'hindi', 'Add Newsletter', 'Add Newsletter', '2025-10-17 09:49:42', '2025-10-17 09:49:42'),
(5079, 'hindi', 'Claimed Listings', 'Claimed Listings', '2025-10-17 11:09:42', '2025-10-17 11:09:42'),
(5080, 'hindi', 'Featured', 'Featured', '2025-10-17 11:10:22', '2025-10-17 11:10:22'),
(5081, 'hindi', 'Trending', 'Trending', '2025-10-17 11:10:22', '2025-10-17 11:10:22'),
(5082, 'hindi', 'Reported Listings', 'Reported Listings', '2025-10-17 11:14:07', '2025-10-17 11:14:07'),
(5083, 'hindi', 'Add Blog', 'Add Blog', '2025-10-17 11:17:53', '2025-10-17 11:17:53'),
(5084, 'hindi', 'Blog Categories', 'Blog Categories', '2025-10-17 11:18:11', '2025-10-17 11:18:11'),
(5085, 'hindi', 'Blog Category Create', 'Blog Category Create', '2025-10-17 11:18:11', '2025-10-17 11:18:11'),
(5086, 'hindi', 'Number Blogs', 'Number Blogs', '2025-10-17 11:18:11', '2025-10-17 11:18:11'),
(5087, 'hindi', 'Newsletter Subscriber', 'Newsletter Subscriber', '2025-10-17 11:18:22', '2025-10-17 11:18:22'),
(5088, 'hindi', 'Subscribers', 'Subscribers', '2025-10-17 11:18:22', '2025-10-17 11:18:22'),
(5089, 'hindi', 'Search Email', 'Search Email', '2025-10-17 11:18:22', '2025-10-17 11:18:22'),
(5090, 'hindi', 'Newsletter Subscribe successfully', 'Newsletter Subscribe successfully', '2025-10-17 11:18:29', '2025-10-17 11:18:29'),
(5091, 'hindi', 'User status', 'User status', '2025-10-17 11:18:41', '2025-10-17 11:18:41'),
(5092, 'hindi', 'Actions', 'Actions', '2025-10-17 11:18:41', '2025-10-17 11:18:41'),
(5093, 'hindi', 'Remove Wishlist', 'Remove Wishlist', '2025-10-17 11:24:16', '2025-10-17 11:24:16'),
(5094, 'hindi', 'Unfollow', 'Unfollow', '2025-10-17 11:24:53', '2025-10-17 11:24:53'),
(5095, 'hindi', 'Select listing brand', 'Select listing brand', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5096, 'hindi', 'Select listing model', 'Select listing model', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5097, 'hindi', 'Select listing year', 'Select listing year', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5098, 'hindi', 'Select listing car type', 'Select listing car type', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5099, 'hindi', 'Transmission', 'Transmission', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5100, 'hindi', 'Select listing transmission', 'Select listing transmission', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5101, 'hindi', 'Fuel Type', 'Fuel Type', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5102, 'hindi', 'Select listing fuel_type', 'Select listing fuel_type', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5103, 'hindi', 'Cylinder', 'Cylinder', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5104, 'hindi', 'Select listing cylinder', 'Select listing cylinder', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5105, 'hindi', 'Interior Color', 'Interior Color', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5106, 'hindi', 'Select listing interior color', 'Select listing interior color', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5107, 'hindi', 'Exterior Color', 'Exterior Color', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5108, 'hindi', 'Select listing exterior color', 'Select listing exterior color', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5109, 'hindi', 'Drive Train', 'Drive Train', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5110, 'hindi', 'Select listing drive train', 'Select listing drive train', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5111, 'hindi', 'Trim', 'Trim', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5112, 'hindi', 'Select listing trim', 'Select listing trim', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5113, 'hindi', 'Engine size', 'Engine size', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5114, 'hindi', 'Mileage', 'Mileage', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5115, 'hindi', '00', '00', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5116, 'hindi', 'Vin', 'Vin', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5117, 'hindi', '4jh45ed4', '4jh45ed4', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5118, 'hindi', '00.00', '00.00', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5119, 'hindi', 'Discount Price', 'Discount Price', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5120, 'hindi', 'New', 'New', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5121, 'hindi', 'Used', 'Used', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5122, 'hindi', '0', '0', '2025-10-17 11:26:36', '2025-10-17 11:26:36'),
(5123, 'hindi', 'Agent Subscription', 'Agent Subscription', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5124, 'english', 'Listify 2500', 'Listify 2500', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5125, 'hindi', 'Listify 2500', 'Listify 2500', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5126, 'english', '2500', '2500', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5127, 'hindi', '2500', '2500', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5128, 'hindi', 'plan', 'plan', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5129, 'hindi', 'Your current package price is', 'Your current package price is', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5130, 'hindi', 'It will expired on ', 'It will expired on ', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5131, 'hindi', 'Invoicing', 'Invoicing', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5132, 'hindi', 'Last payment:', 'Last payment:', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5133, 'hindi', 'Modify Billing Information', 'Modify Billing Information', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5134, 'hindi', 'Billing History', 'Billing History', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5135, 'hindi', 'Download', 'Download', '2025-10-17 11:29:13', '2025-10-17 11:29:13'),
(5136, 'english', 'Edit Manufacturing Listing Frontend Settings', 'Edit Manufacturing Listing Frontend Settings', '2025-10-18 06:50:50', '2025-10-18 06:50:50'),
(5137, 'hindi', 'Edit Manufacturing Listing Frontend Settings', 'Edit Manufacturing Listing Frontend Settings', '2025-10-18 06:50:50', '2025-10-18 06:50:50'),
(5138, 'hindi', 'Update Blog', 'Update Blog', '2025-10-18 07:13:10', '2025-10-18 07:13:10'),
(5139, 'hindi', 'Enter valid purchase code', 'Enter valid purchase code', '2025-10-18 07:33:10', '2025-10-18 07:33:10'),
(5140, 'english', 'Edit Industrial Listing Frontend Settings', 'Edit Industrial Listing Frontend Settings', '2025-10-18 08:03:00', '2025-10-18 08:03:00'),
(5141, 'hindi', 'Edit Industrial Listing Frontend Settings', 'Edit Industrial Listing Frontend Settings', '2025-10-18 08:03:00', '2025-10-18 08:03:00'),
(5142, 'english', 'Edit Corporate Gifting and Printing Services Listing Frontend Settings', 'Edit Corporate Gifting and Printing Services Listing Frontend Settings', '2025-10-18 08:56:47', '2025-10-18 08:56:47'),
(5143, 'hindi', 'Edit Corporate Gifting and Printing Services Listing Frontend Settings', 'Edit Corporate Gifting and Printing Services Listing Frontend Settings', '2025-10-18 08:56:47', '2025-10-18 08:56:47'),
(5144, 'hindi', 'A confirmation email has been sent. Please check your inbox.', 'A confirmation email has been sent. Please check your inbox.', '2025-10-18 09:17:23', '2025-10-18 09:17:23'),
(5145, 'hindi', 'Reset Password', 'Reset Password', '2025-10-18 09:17:58', '2025-10-18 09:17:58'),
(5146, 'hindi', 'Submit your account email address.', 'Submit your account email address.', '2025-10-18 09:17:58', '2025-10-18 09:17:58'),
(5147, 'hindi', 'Pay by Razorpay', 'Pay by Razorpay', '2025-10-18 09:47:06', '2025-10-18 09:47:06'),
(5148, 'hindi', 'Pay', 'Pay', '2025-10-18 09:47:12', '2025-10-18 09:47:12'),
(5149, 'hindi', 'Remove from Wishlist', 'Remove from Wishlist', '2025-10-22 08:41:39', '2025-10-22 08:41:39'),
(5150, 'english', 'Edit Food Listing Frontend Settings', 'Edit Food Listing Frontend Settings', '2025-10-22 08:48:46', '2025-10-22 08:48:46'),
(5151, 'hindi', 'Edit Food Listing Frontend Settings', 'Edit Food Listing Frontend Settings', '2025-10-22 08:48:46', '2025-10-22 08:48:46'),
(5152, 'english', 'Edit IT Services Listing Frontend Settings', 'Edit IT Services Listing Frontend Settings', '2025-10-22 08:52:23', '2025-10-22 08:52:23'),
(5153, 'hindi', 'Edit IT Services Listing Frontend Settings', 'Edit IT Services Listing Frontend Settings', '2025-10-22 08:52:23', '2025-10-22 08:52:23'),
(5154, 'english', 'Edit Trading Listing Frontend Settings', 'Edit Trading Listing Frontend Settings', '2025-10-22 08:52:50', '2025-10-22 08:52:50'),
(5155, 'hindi', 'Edit Trading Listing Frontend Settings', 'Edit Trading Listing Frontend Settings', '2025-10-22 08:52:50', '2025-10-22 08:52:50'),
(5156, 'english', 'Edit Recreation Listing Frontend Settings', 'Edit Recreation Listing Frontend Settings', '2025-10-22 12:29:36', '2025-10-22 12:29:36'),
(5157, 'hindi', 'Edit Recreation Listing Frontend Settings', 'Edit Recreation Listing Frontend Settings', '2025-10-22 12:29:36', '2025-10-22 12:29:36'),
(5158, 'hindi', 'Password Reset Successfully ', 'Password Reset Successfully ', '2025-10-24 10:28:12', '2025-10-24 10:28:12'),
(5159, 'spanish', 'Spanish', 'Spanish', '2025-12-01 08:10:54', '2025-12-01 08:10:54'),
(5160, 'hindi', 'Language Created Successfully', 'Language Created Successfully', '2025-12-01 08:10:54', '2025-12-01 08:10:54'),
(5161, 'spanish', 'Language Created Successfully', 'Language Created Successfully', '2025-12-01 08:10:54', '2025-12-01 08:10:54'),
(5162, 'spanish', 'Language updated successfully!', 'Language updated successfully!', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5163, 'spanish', 'Listing List', 'Listing List', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5164, 'spanish', 'Lists', 'Lists', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5165, 'spanish', 'Add New Listing', 'Add New Listing', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5166, 'spanish', 'ID', 'ID', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5167, 'spanish', 'Image', 'Image', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5168, 'spanish', 'Title', 'Title', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5169, 'spanish', 'Category', 'Category', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5170, 'spanish', 'Visibility', 'Visibility', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5171, 'spanish', 'Action', 'Action', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5172, 'spanish', 'View frontend', 'View frontend', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5173, 'spanish', 'Change visibility', 'Change visibility', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5174, 'spanish', 'Edit', 'Edit', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5175, 'spanish', 'Delete', 'Delete', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5176, 'spanish', 'MAIN MENU', 'MAIN MENU', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5177, 'spanish', 'Dashboard', 'Dashboard', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5178, 'spanish', 'Directory Listings', 'Directory Listings', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5179, 'spanish', 'All Listings', 'All Listings', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5180, 'spanish', 'Trading', 'Trading', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5181, 'spanish', 'Academies', 'Academies', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5182, 'spanish', 'Popular Services', 'Popular Services', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5183, 'spanish', 'Agencies', 'Agencies', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5184, 'spanish', 'IT Services', 'IT Services', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5185, 'spanish', 'Industrial', 'Industrial', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5186, 'spanish', 'Corporate Gifting and Printing Services', 'Corporate Gifting and Printing Services', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5187, 'spanish', 'Recreation', 'Recreation', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5188, 'spanish', 'Automobiles', 'Automobiles', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5189, 'spanish', 'Manufacturing', 'Manufacturing', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5190, 'spanish', 'Grooming', 'Grooming', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5191, 'spanish', 'Fitness', 'Fitness', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5192, 'spanish', 'Food', 'Food', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5193, 'spanish', 'Hotel', 'Hotel', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5194, 'spanish', 'Real-Estate', 'Real-Estate', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5195, 'spanish', 'Restaurant', 'Restaurant', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5196, 'spanish', 'Beauty', 'Beauty', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5197, 'spanish', 'Car', 'Car', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5198, 'spanish', 'Add Listing', 'Add Listing', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5199, 'spanish', 'Claim Listing', 'Claim Listing', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5200, 'spanish', 'Report Listing', 'Report Listing', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5201, 'spanish', 'Directory Type', 'Directory Type', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5202, 'spanish', 'Manage Directory', 'Manage Directory', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5203, 'spanish', 'Subscription History', 'Subscription History', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5204, 'spanish', 'Listing Categories', 'Listing Categories', '2025-12-30 11:22:28', '2025-12-30 11:22:28'),
(5205, 'spanish', 'Listing Amenities', 'Listing Amenities', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5206, 'spanish', 'Listing Cities', 'Listing Cities', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5207, 'spanish', 'Users', 'Users', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5208, 'spanish', 'Agent', 'Agent', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5209, 'spanish', 'Add New', 'Add New', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5210, 'spanish', 'All Agents', 'All Agents', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5211, 'spanish', 'Customer', 'Customer', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5212, 'spanish', 'All Customers', 'All Customers', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5213, 'spanish', 'Contacts', 'Contacts', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5214, 'spanish', 'My Shops', 'My Shops', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5215, 'spanish', 'Order Manager', 'Order Manager', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5216, 'spanish', 'My Order', 'My Order', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5217, 'spanish', 'Agent Packages', 'Agent Packages', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5218, 'spanish', 'Blogs', 'Blogs', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5219, 'spanish', 'All Blogs', 'All Blogs', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5220, 'spanish', 'Pending Blogs', 'Pending Blogs', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5221, 'spanish', 'Add Blogs', 'Add Blogs', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5222, 'spanish', 'Blog Category', 'Blog Category', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5223, 'spanish', 'Newsletter', 'Newsletter', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5224, 'spanish', 'Manage Newsletter', 'Manage Newsletter', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5225, 'spanish', 'Subscribed User', 'Subscribed User', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5226, 'spanish', 'Addons', 'Addons', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5227, 'spanish', 'Settings', 'Settings', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5228, 'spanish', 'System Settings', 'System Settings', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5229, 'spanish', 'Website Settings', 'Website Settings', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5230, 'spanish', 'Custom Listing Settings', 'Custom Listing Settings', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5231, 'spanish', 'Payment Settings', 'Payment Settings', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5232, 'spanish', 'Form Builder', 'Form Builder', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5233, 'spanish', 'Language Settings', 'Language Settings', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5234, 'spanish', 'SMTP Settings', 'SMTP Settings', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5235, 'spanish', 'SEO Settings', 'SEO Settings', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5236, 'spanish', 'About', 'About', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5237, 'spanish', 'Notifications', 'Notifications', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5238, 'spanish', 'My Profile', 'My Profile', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5239, 'spanish', 'Admin Panel', 'Admin Panel', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5240, 'spanish', 'View site', 'View site', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5241, 'spanish', 'Language', 'Language', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5242, 'spanish', 'Admin', 'Admin', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5243, 'spanish', 'Sign Out', 'Sign Out', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5244, 'spanish', 'Modal title', 'Modal title', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5245, 'spanish', 'Are you sure?', 'Are you sure?', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5246, 'spanish', 'You can\'t bring it back!', 'You can\'t bring it back!', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5247, 'spanish', 'Cancel', 'Cancel', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5248, 'spanish', 'Confirm', 'Confirm', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5249, 'spanish', 'Once approved, this action cannot be reversed and will be finalized.', 'Once approved, this action cannot be reversed and will be finalized.', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5250, 'spanish', 'Just Now', 'Just Now', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5251, 'spanish', 'Success !', 'Success !', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5252, 'spanish', 'Attention !', 'Attention !', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5253, 'spanish', 'An Error Occurred !', 'An Error Occurred !', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5254, 'spanish', 'Enter your keywords', 'Enter your keywords', '2025-12-30 11:22:29', '2025-12-30 11:22:29'),
(5255, 'spanish', 'Germany', 'Germany', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5256, 'spanish', 'Ghana', 'Ghana', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5257, 'spanish', 'Gibraltar', 'Gibraltar', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5258, 'spanish', 'Greece', 'Greece', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5259, 'spanish', 'Greenland', 'Greenland', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5260, 'spanish', 'Grenada', 'Grenada', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5261, 'spanish', 'Guadeloupe', 'Guadeloupe', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5262, 'spanish', 'Guam', 'Guam', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5263, 'spanish', 'Guatemala', 'Guatemala', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5264, 'spanish', 'Guernsey', 'Guernsey', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5265, 'spanish', 'Admin Dashboard', 'Admin Dashboard', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5266, 'spanish', 'Guinea', 'Guinea', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5267, 'spanish', 'Guinea-Bissau', 'Guinea-Bissau', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5268, 'spanish', 'All User', 'All User', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5269, 'spanish', 'Guyana', 'Guyana', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5270, 'spanish', 'Haiti', 'Haiti', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5271, 'spanish', 'Holy See (Vatican Ci', 'Holy See (Vatican Ci', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5272, 'spanish', 'Subscriber', 'Subscriber', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5273, 'spanish', 'Honduras', 'Honduras', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5274, 'spanish', 'Hong Kong', 'Hong Kong', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5275, 'spanish', 'Total Subscription', 'Total Subscription', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5276, 'spanish', 'Hungary', 'Hungary', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5277, 'spanish', 'Iceland', 'Iceland', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5278, 'spanish', 'Total Listing', 'Total Listing', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5279, 'spanish', 'India', 'India', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5280, 'spanish', 'Indonesia', 'Indonesia', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5281, 'spanish', 'Iran, Islamic Republ', 'Iran, Islamic Republ', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5282, 'spanish', 'Iraq', 'Iraq', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5283, 'spanish', 'Ireland', 'Ireland', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5284, 'spanish', 'Isle of Man', 'Isle of Man', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5285, 'spanish', 'Israel', 'Israel', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5286, 'spanish', 'Real estate', 'Real estate', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5287, 'spanish', 'Italy', 'Italy', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5288, 'spanish', 'Jamaica', 'Jamaica', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5289, 'spanish', 'Japan', 'Japan', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5290, 'spanish', 'Jersey', 'Jersey', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5291, 'spanish', 'Visible Listings as Percentages', 'Visible Listings as Percentages', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5292, 'spanish', 'Jordan', 'Jordan', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5293, 'spanish', 'Monthly Earnings for', 'Monthly Earnings for', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5294, 'spanish', 'Kazakhstan', 'Kazakhstan', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5295, 'spanish', 'Kenya', 'Kenya', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5296, 'spanish', 'Kiribati', 'Kiribati', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5297, 'spanish', 'Korea, Democratic Pe', 'Korea, Democratic Pe', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5298, 'spanish', 'Korea, Republic of S', 'Korea, Republic of S', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5299, 'spanish', 'Kuwait', 'Kuwait', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5300, 'spanish', 'Kyrgyzstan', 'Kyrgyzstan', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5301, 'spanish', 'Laos', 'Laos', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5302, 'spanish', 'Latvia', 'Latvia', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5303, 'spanish', 'Lebanon', 'Lebanon', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5304, 'spanish', 'Lesotho', 'Lesotho', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5305, 'spanish', 'Liberia', 'Liberia', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5306, 'spanish', 'Libyan Arab Jamahiri', 'Libyan Arab Jamahiri', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5307, 'spanish', 'Liechtenstein', 'Liechtenstein', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5308, 'spanish', 'Lithuania', 'Lithuania', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5309, 'spanish', 'Luxembourg', 'Luxembourg', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5310, 'spanish', 'Macao', 'Macao', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5311, 'spanish', 'Macedonia', 'Macedonia', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5312, 'spanish', 'Madagascar', 'Madagascar', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5313, 'spanish', 'Malawi', 'Malawi', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5314, 'spanish', 'Malaysia', 'Malaysia', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5315, 'spanish', 'Maldives', 'Maldives', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5316, 'spanish', 'Mali', 'Mali', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5317, 'spanish', 'Malta', 'Malta', '2026-03-20 11:24:38', '2026-03-20 11:24:38'),
(5318, 'spanish', 'Marshall Islands', 'Marshall Islands', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5319, 'spanish', 'Martinique', 'Martinique', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5320, 'spanish', 'Mauritania', 'Mauritania', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5321, 'spanish', 'Mauritius', 'Mauritius', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5322, 'spanish', 'Mayotte', 'Mayotte', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5323, 'spanish', 'Mexico', 'Mexico', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5324, 'spanish', 'Micronesia, Federate', 'Micronesia, Federate', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5325, 'spanish', 'Moldova', 'Moldova', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5326, 'spanish', 'Monaco', 'Monaco', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5327, 'spanish', 'Mongolia', 'Mongolia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5328, 'spanish', 'Montenegro', 'Montenegro', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5329, 'spanish', 'Montserrat', 'Montserrat', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5330, 'spanish', 'Morocco', 'Morocco', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5331, 'spanish', 'Mozambique', 'Mozambique', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5332, 'spanish', 'Myanmar', 'Myanmar', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5333, 'spanish', 'Namibia', 'Namibia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5334, 'spanish', 'Nauru', 'Nauru', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5335, 'spanish', 'Nepal', 'Nepal', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5336, 'spanish', 'Netherlands', 'Netherlands', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5337, 'spanish', 'Netherlands Antilles', 'Netherlands Antilles', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5338, 'spanish', 'New Caledonia', 'New Caledonia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5339, 'spanish', 'New Zealand', 'New Zealand', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5340, 'spanish', 'Nicaragua', 'Nicaragua', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5341, 'spanish', 'Niger', 'Niger', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5342, 'spanish', 'Nigeria', 'Nigeria', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5343, 'spanish', 'Niue', 'Niue', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5344, 'spanish', 'Norfolk Island', 'Norfolk Island', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5345, 'spanish', 'Northern Mariana Isl', 'Northern Mariana Isl', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5346, 'spanish', 'Norway', 'Norway', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5347, 'spanish', 'Oman', 'Oman', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5348, 'spanish', 'Pakistan', 'Pakistan', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5349, 'spanish', 'Palau', 'Palau', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5350, 'spanish', 'Palestinian Territor', 'Palestinian Territor', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5351, 'spanish', 'Panama', 'Panama', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5352, 'spanish', 'Papua New Guinea', 'Papua New Guinea', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5353, 'spanish', 'Paraguay', 'Paraguay', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5354, 'spanish', 'Peru', 'Peru', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5355, 'spanish', 'Philippines', 'Philippines', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5356, 'spanish', 'Pitcairn', 'Pitcairn', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5357, 'spanish', 'Poland', 'Poland', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5358, 'spanish', 'Portugal', 'Portugal', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5359, 'spanish', 'Puerto Rico', 'Puerto Rico', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5360, 'spanish', 'Qatar', 'Qatar', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5361, 'spanish', 'Romania', 'Romania', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5362, 'spanish', 'Russia', 'Russia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5363, 'spanish', 'Rwanda', 'Rwanda', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5364, 'spanish', 'Reunion', 'Reunion', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5365, 'spanish', 'Saint Barthelemy', 'Saint Barthelemy', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5366, 'spanish', 'Saint Helena, Ascens', 'Saint Helena, Ascens', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5367, 'spanish', 'Saint Kitts and Nevi', 'Saint Kitts and Nevi', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5368, 'spanish', 'Saint Lucia', 'Saint Lucia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5369, 'spanish', 'Saint Martin', 'Saint Martin', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5370, 'spanish', 'Saint Pierre and Miq', 'Saint Pierre and Miq', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5371, 'spanish', 'Saint Vincent and th', 'Saint Vincent and th', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5372, 'spanish', 'Samoa', 'Samoa', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5373, 'spanish', 'San Marino', 'San Marino', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5374, 'spanish', 'Sao Tome and Princip', 'Sao Tome and Princip', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5375, 'spanish', 'Saudi Arabia', 'Saudi Arabia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5376, 'spanish', 'Senegal', 'Senegal', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5377, 'spanish', 'Serbia', 'Serbia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5378, 'spanish', 'Seychelles', 'Seychelles', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5379, 'spanish', 'Sierra Leone', 'Sierra Leone', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5380, 'spanish', 'Singapore', 'Singapore', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5381, 'spanish', 'Slovakia', 'Slovakia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5382, 'spanish', 'Slovenia', 'Slovenia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5383, 'spanish', 'Solomon Islands', 'Solomon Islands', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5384, 'spanish', 'Somalia', 'Somalia', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5385, 'spanish', 'South Africa', 'South Africa', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5386, 'spanish', 'South Georgia and th', 'South Georgia and th', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5387, 'spanish', 'Spain', 'Spain', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5388, 'spanish', 'Sri Lanka', 'Sri Lanka', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5389, 'spanish', 'Sudan', 'Sudan', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5390, 'spanish', 'Suriname', 'Suriname', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5391, 'spanish', 'Svalbard and Jan May', 'Svalbard and Jan May', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5392, 'spanish', 'Swaziland', 'Swaziland', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5393, 'spanish', 'Sweden', 'Sweden', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5394, 'spanish', 'Switzerland', 'Switzerland', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5395, 'spanish', 'Syrian Arab Republic', 'Syrian Arab Republic', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5396, 'spanish', 'Taiwan', 'Taiwan', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5397, 'spanish', 'Tajikistan', 'Tajikistan', '2026-03-20 11:24:39', '2026-03-20 11:24:39'),
(5398, 'spanish', 'Tanzania, United Rep', 'Tanzania, United Rep', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5399, 'spanish', 'Thailand', 'Thailand', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5400, 'spanish', 'Timor-Leste', 'Timor-Leste', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5401, 'spanish', 'Togo', 'Togo', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5402, 'spanish', 'Tokelau', 'Tokelau', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5403, 'spanish', 'Tonga', 'Tonga', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5404, 'spanish', 'Trinidad and Tobago', 'Trinidad and Tobago', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5405, 'spanish', 'Tunisia', 'Tunisia', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5406, 'spanish', 'Turkey', 'Turkey', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5407, 'spanish', 'Turkmenistan', 'Turkmenistan', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5408, 'spanish', 'Turks and Caicos Isl', 'Turks and Caicos Isl', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5409, 'spanish', 'Tuvalu', 'Tuvalu', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5410, 'spanish', 'Uganda', 'Uganda', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5411, 'spanish', 'Ukraine', 'Ukraine', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5412, 'spanish', 'United Arab Emirates', 'United Arab Emirates', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5413, 'spanish', 'United Kingdom', 'United Kingdom', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5414, 'spanish', 'United States', 'United States', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5415, 'spanish', 'Uruguay', 'Uruguay', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5416, 'spanish', 'Uzbekistan', 'Uzbekistan', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5417, 'spanish', 'Vanuatu', 'Vanuatu', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5418, 'spanish', 'Venezuela, Bolivaria', 'Venezuela, Bolivaria', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5419, 'spanish', 'Vietnam', 'Vietnam', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5420, 'spanish', 'Virgin Islands, Brit', 'Virgin Islands, Brit', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5421, 'spanish', 'Virgin Islands, U.S.', 'Virgin Islands, U.S.', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5422, 'spanish', 'Wallis and Futuna', 'Wallis and Futuna', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5423, 'spanish', 'Yemen', 'Yemen', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5424, 'spanish', 'Zambia', 'Zambia', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5425, 'spanish', 'Zimbabwe', 'Zimbabwe', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5426, 'spanish', 'State', 'State', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5427, 'spanish', 'Address line', 'Address line', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5428, 'spanish', 'Save Changes', 'Save Changes', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5429, 'spanish', 'Password', 'Password', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5430, 'spanish', 'Old Password', 'Old Password', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5431, 'spanish', 'New Password', 'New Password', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5432, 'spanish', 'Select listing City', 'Select listing City', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5433, 'spanish', 'Select  City', 'Select  City', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5434, 'spanish', 'Choose Type', 'Choose Type', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5435, 'spanish', 'More', 'More', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5436, 'spanish', 'Contact', 'Contact', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5437, 'spanish', 'Pricing', 'Pricing', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5438, 'spanish', 'My Dashboard', 'My Dashboard', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5439, 'spanish', 'Wishlist', 'Wishlist', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5440, 'spanish', 'Appointment', 'Appointment', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5441, 'spanish', 'Message', 'Message', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5442, 'spanish', 'Following agent', 'Following agent', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5443, 'spanish', 'My Account', 'My Account', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5444, 'spanish', 'Log Out', 'Log Out', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5445, 'spanish', 'Sign up to our newsletter', 'Sign up to our newsletter', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5446, 'spanish', 'Stay up to date with the latest news, announcements, and articles.', 'Stay up to date with the latest news, announcements, and articles.', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5447, 'spanish', 'Enter your email Address', 'Enter your email Address', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5448, 'spanish', 'Subscribe', 'Subscribe', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5449, 'spanish', 'Quick links', 'Quick links', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5450, 'spanish', 'About Us', 'About Us', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5451, 'spanish', 'Blog', 'Blog', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5452, 'spanish', 'Contact Us', 'Contact Us', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5453, 'spanish', 'Privacy Policy', 'Privacy Policy', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5454, 'spanish', 'Terms and Condition', 'Terms and Condition', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5455, 'spanish', 'Refund Policy', 'Refund Policy', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5456, 'spanish', 'Categories', 'Categories', '2026-03-20 11:24:40', '2026-03-20 11:24:40'),
(5457, 'spanish', 'User information updated!', 'User information updated!', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5458, 'spanish', 'Profile Update', 'Profile Update', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5459, 'spanish', 'My Customer Panel', 'My Customer Panel', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5460, 'spanish', 'My Orders', 'My Orders', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5461, 'spanish', 'Invoice Policy', 'Invoice Policy', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5462, 'spanish', 'Account', 'Account', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5463, 'spanish', 'My Panel', 'My Panel', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5464, 'spanish', 'My Listing', 'My Listing', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5465, 'spanish', 'Subscription', 'Subscription', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5466, 'spanish', 'Qrcode', 'Qrcode', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5467, 'spanish', 'My CRM', 'My CRM', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5468, 'spanish', 'My Shop', 'My Shop', '2026-03-20 11:24:51', '2026-03-20 11:24:51');
INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(5469, 'spanish', 'All Notifications', 'All Notifications', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5470, 'spanish', 'Logout', 'Logout', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5471, 'spanish', 'Home', 'Home', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5472, 'spanish', 'Full name', 'Full name', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5473, 'spanish', 'Email', 'Email', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5474, 'spanish', 'Phone', 'Phone', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5475, 'spanish', 'Whatsapp No', 'Whatsapp No', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5476, 'spanish', 'Facebook', 'Facebook', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5477, 'spanish', 'Twitter', 'Twitter', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5478, 'spanish', 'Linkedin', 'Linkedin', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5479, 'spanish', 'Gender', 'Gender', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5480, 'spanish', 'Male', 'Male', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5481, 'spanish', 'Female', 'Female', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5482, 'spanish', 'Other', 'Other', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5483, 'spanish', 'Bio', 'Bio', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5484, 'spanish', 'Profile Photo', 'Profile Photo', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5485, 'spanish', 'Address', 'Address', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5486, 'spanish', 'Country', 'Country', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5487, 'spanish', 'Select listing country', 'Select listing country', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5488, 'spanish', 'Afghanistan', 'Afghanistan', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5489, 'spanish', 'Aland Islands', 'Aland Islands', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5490, 'spanish', 'Albania', 'Albania', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5491, 'spanish', 'Algeria', 'Algeria', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5492, 'spanish', 'AmericanSamoa', 'AmericanSamoa', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5493, 'spanish', 'Andorra', 'Andorra', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5494, 'spanish', 'Angola', 'Angola', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5495, 'spanish', 'Anguilla', 'Anguilla', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5496, 'spanish', 'Antarctica', 'Antarctica', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5497, 'spanish', 'Antigua and Barbuda', 'Antigua and Barbuda', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5498, 'spanish', 'Argentina', 'Argentina', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5499, 'spanish', 'Armenia', 'Armenia', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5500, 'spanish', 'Aruba', 'Aruba', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5501, 'spanish', 'Australia', 'Australia', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5502, 'spanish', 'Austria', 'Austria', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5503, 'spanish', 'Azerbaijan', 'Azerbaijan', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5504, 'spanish', 'Bahamas', 'Bahamas', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5505, 'spanish', 'Bahrain', 'Bahrain', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5506, 'spanish', 'Bangladesh', 'Bangladesh', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5507, 'spanish', 'Barbados', 'Barbados', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5508, 'spanish', 'Belarus', 'Belarus', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5509, 'spanish', 'Belgium', 'Belgium', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5510, 'spanish', 'Belize', 'Belize', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5511, 'spanish', 'Benin', 'Benin', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5512, 'spanish', 'Bermuda', 'Bermuda', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5513, 'spanish', 'Bhutan', 'Bhutan', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5514, 'spanish', 'Bolivia, Plurination', 'Bolivia, Plurination', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5515, 'spanish', 'Bosnia and Herzegovi', 'Bosnia and Herzegovi', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5516, 'spanish', 'Botswana', 'Botswana', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5517, 'spanish', 'Brazil', 'Brazil', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5518, 'spanish', 'British Indian Ocean', 'British Indian Ocean', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5519, 'spanish', 'Brunei Darussalam', 'Brunei Darussalam', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5520, 'spanish', 'Bulgaria', 'Bulgaria', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5521, 'spanish', 'Burkina Faso', 'Burkina Faso', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5522, 'spanish', 'Burundi', 'Burundi', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5523, 'spanish', 'Cambodia', 'Cambodia', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5524, 'spanish', 'Cameroon', 'Cameroon', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5525, 'spanish', 'Canada', 'Canada', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5526, 'spanish', 'Cape Verde', 'Cape Verde', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5527, 'spanish', 'Cayman Islands', 'Cayman Islands', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5528, 'spanish', 'Central African Repu', 'Central African Repu', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5529, 'spanish', 'Chad', 'Chad', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5530, 'spanish', 'Chile', 'Chile', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5531, 'spanish', 'China', 'China', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5532, 'spanish', 'Christmas Island', 'Christmas Island', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5533, 'spanish', 'Cocos (Keeling) Isla', 'Cocos (Keeling) Isla', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5534, 'spanish', 'Colombia', 'Colombia', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5535, 'spanish', 'Comoros', 'Comoros', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5536, 'spanish', 'Congo', 'Congo', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5537, 'spanish', 'Congo, The Democrati', 'Congo, The Democrati', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5538, 'spanish', 'Cook Islands', 'Cook Islands', '2026-03-20 11:24:51', '2026-03-20 11:24:51'),
(5539, 'spanish', 'Costa Rica', 'Costa Rica', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5540, 'spanish', 'Cote d\'Ivoire', 'Cote d\'Ivoire', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5541, 'spanish', 'Croatia', 'Croatia', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5542, 'spanish', 'Cuba', 'Cuba', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5543, 'spanish', 'Cyprus', 'Cyprus', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5544, 'spanish', 'Czech Republic', 'Czech Republic', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5545, 'spanish', 'Denmark', 'Denmark', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5546, 'spanish', 'Djibouti', 'Djibouti', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5547, 'spanish', 'Dominica', 'Dominica', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5548, 'spanish', 'Dominican Republic', 'Dominican Republic', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5549, 'spanish', 'Ecuador', 'Ecuador', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5550, 'spanish', 'Egypt', 'Egypt', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5551, 'spanish', 'El Salvador', 'El Salvador', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5552, 'spanish', 'Equatorial Guinea', 'Equatorial Guinea', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5553, 'spanish', 'Eritrea', 'Eritrea', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5554, 'spanish', 'Estonia', 'Estonia', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5555, 'spanish', 'Ethiopia', 'Ethiopia', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5556, 'spanish', 'Falkland Islands (Ma', 'Falkland Islands (Ma', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5557, 'spanish', 'Faroe Islands', 'Faroe Islands', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5558, 'spanish', 'Fiji', 'Fiji', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5559, 'spanish', 'Finland', 'Finland', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5560, 'spanish', 'France', 'France', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5561, 'spanish', 'French Guiana', 'French Guiana', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5562, 'spanish', 'French Polynesia', 'French Polynesia', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5563, 'spanish', 'Gabon', 'Gabon', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5564, 'spanish', 'Gambia', 'Gambia', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5565, 'spanish', 'Georgia', 'Georgia', '2026-03-20 11:24:52', '2026-03-20 11:24:52'),
(5566, 'spanish', 'User Profile', 'User Profile', '2026-03-20 11:24:54', '2026-03-20 11:24:54'),
(5567, 'spanish', 'Add to Wishlist', 'Add to Wishlist', '2026-03-20 11:24:54', '2026-03-20 11:24:54'),
(5568, 'spanish', 'See Details', 'See Details', '2026-03-20 11:24:54', '2026-03-20 11:24:54'),
(5569, 'spanish', 'Login', 'Login', '2026-03-20 11:24:54', '2026-03-20 11:24:54'),
(5570, 'spanish', 'Listing Details', 'Listing Details', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5571, 'spanish', 'Details', 'Details', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5572, 'spanish', 'Copy link to share', 'Copy link to share', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5573, 'spanish', 'Back to listing', 'Back to listing', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5574, 'spanish', 'Description', 'Description', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5575, 'spanish', 'Read More', 'Read More', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5576, 'spanish', 'Amenities', 'Amenities', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5577, 'spanish', 'Agent Contact Details', 'Agent Contact Details', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5578, 'spanish', 'View Details', 'View Details', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5579, 'spanish', 'View Profile', 'View Profile', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5580, 'spanish', 'Listing by', 'Listing by', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5581, 'spanish', 'Phone:', 'Phone:', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5582, 'spanish', 'Email:', 'Email:', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5583, 'spanish', 'Message*', 'Message*', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5584, 'spanish', 'Submit', 'Submit', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5585, 'spanish', 'Reviews', 'Reviews', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5586, 'spanish', 'Book a Meeting', 'Book a Meeting', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5587, 'spanish', 'Related Property', 'Related Property', '2026-03-20 11:25:01', '2026-03-20 11:25:01'),
(5588, 'spanish', 'Filters', 'Filters', '2026-03-20 11:25:19', '2026-03-20 11:25:19'),
(5589, 'spanish', 'Clear', 'Clear', '2026-03-20 11:25:19', '2026-03-20 11:25:19'),
(5590, 'spanish', 'Cities', 'Cities', '2026-03-20 11:25:19', '2026-03-20 11:25:19'),
(5591, 'spanish', 'Showing', 'Showing', '2026-03-20 11:25:19', '2026-03-20 11:25:19'),
(5592, 'spanish', 'of', 'of', '2026-03-20 11:25:19', '2026-03-20 11:25:19'),
(5593, 'spanish', 'results', 'results', '2026-03-20 11:25:19', '2026-03-20 11:25:19'),
(5594, 'spanish', 'Customer Appointment', 'Customer Appointment', '2026-03-20 11:27:38', '2026-03-20 11:27:38'),
(5595, 'spanish', 'Listing', 'Listing', '2026-03-20 11:27:38', '2026-03-20 11:27:38'),
(5596, 'spanish', 'Status', 'Status', '2026-03-20 11:27:38', '2026-03-20 11:27:38'),
(5597, 'spanish', 'Show Less', 'Show Less', '2026-03-20 11:27:38', '2026-03-20 11:27:38'),
(5598, 'spanish', 'Agent Details', 'Agent Details', '2026-03-20 11:27:55', '2026-03-20 11:27:55'),
(5599, 'spanish', 'Facebook.com', 'Facebook.com', '2026-03-20 11:27:55', '2026-03-20 11:27:55'),
(5600, 'spanish', 'Twitter.com', 'Twitter.com', '2026-03-20 11:27:55', '2026-03-20 11:27:55'),
(5601, 'spanish', 'linkedin.com', 'linkedin.com', '2026-03-20 11:27:55', '2026-03-20 11:27:55'),
(5602, 'spanish', 'Listings', 'Listings', '2026-03-20 11:27:55', '2026-03-20 11:27:55'),
(5603, 'spanish', 'Send Email', 'Send Email', '2026-03-20 11:27:55', '2026-03-20 11:27:55'),
(5604, 'spanish', 'Call', 'Call', '2026-03-20 11:27:55', '2026-03-20 11:27:55'),
(5605, 'spanish', 'Agent Listings', 'Agent Listings', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5606, 'spanish', 'Visible', 'Visible', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5607, 'spanish', 'Hidden', 'Hidden', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5608, 'spanish', 'Filter', 'Filter', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5609, 'spanish', 'Name', 'Name', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5610, 'spanish', 'Type', 'Type', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5611, 'spanish', 'Location', 'Location', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5612, 'spanish', 'Edit Listing', 'Edit Listing', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5613, 'spanish', 'Hide', 'Hide', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5614, 'spanish', 'Remove Listing', 'Remove Listing', '2026-03-20 11:29:14', '2026-03-20 11:29:14'),
(5615, 'spanish', 'Update Listing', 'Update Listing', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5616, 'spanish', 'Update', 'Update', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5617, 'spanish', 'Booking', 'Booking', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5618, 'spanish', 'Basic Info', 'Basic Info', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5619, 'spanish', 'Features', 'Features', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5620, 'spanish', 'Seo', 'Seo', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5621, 'spanish', 'Media', 'Media', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5622, 'spanish', 'Shop', 'Shop', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5623, 'spanish', 'Custom Field', 'Custom Field', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5624, 'spanish', 'Listing title', 'Listing title', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5625, 'spanish', 'Enter listing title', 'Enter listing title', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5626, 'spanish', 'Select listing category', 'Select listing category', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5627, 'spanish', 'Select listing visibility', 'Select listing visibility', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5628, 'spanish', 'Select type', 'Select type', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5629, 'spanish', 'Top', 'Top', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5630, 'spanish', 'Popular', 'Popular', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5631, 'spanish', 'Write your description', 'Write your description', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5632, 'spanish', 'Latitude', 'Latitude', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5633, 'spanish', 'Enter Latitude code', 'Enter Latitude code', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5634, 'spanish', 'Longitude', 'Longitude', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5635, 'spanish', 'Enter longitude code', 'Enter longitude code', '2026-03-20 11:29:18', '2026-03-20 11:29:18'),
(5636, 'spanish', 'City', 'City', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5637, 'spanish', 'Enter listing address', 'Enter listing address', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5638, 'spanish', 'Post Code', 'Post Code', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5639, 'spanish', 'Enter post code', 'Enter post code', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5640, 'spanish', 'Add some listing feature', 'Add some listing feature', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5641, 'spanish', 'Meta Title', 'Meta Title', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5642, 'spanish', 'Enter meta title', 'Enter meta title', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5643, 'spanish', 'Meta keywords', 'Meta keywords', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5644, 'spanish', 'Keyword1; keyword2; keyword3;', 'Keyword1; keyword2; keyword3;', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5645, 'spanish', 'Meta Description', 'Meta Description', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5646, 'spanish', 'Enter meta description', 'Enter meta description', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5647, 'spanish', 'OG title', 'OG title', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5648, 'spanish', 'Enter og title', 'Enter og title', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5649, 'spanish', 'Canonical URL', 'Canonical URL', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5650, 'spanish', 'Enter canonical URL', 'Enter canonical URL', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5651, 'spanish', 'OG Description', 'OG Description', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5652, 'spanish', 'Json ID', 'Json ID', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5653, 'spanish', 'Enter json ID', 'Enter json ID', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5654, 'spanish', 'OG Image', 'OG Image', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5655, 'spanish', 'Listing Images', 'Listing Images', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5656, 'spanish', 'Upload Product Image', 'Upload Product Image', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5657, 'spanish', 'Your  Shop Inventory', 'Your  Shop Inventory', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5658, 'spanish', 'Add Product', 'Add Product', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5659, 'spanish', 'Add New Product', 'Add New Product', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5660, 'spanish', 'Add Category', 'Add Category', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5661, 'spanish', 'Add Product Category', 'Add Product Category', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5662, 'spanish', 'Product List', 'Product List', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5663, 'spanish', 'Product Name', 'Product Name', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5664, 'spanish', 'Price', 'Price', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5665, 'spanish', 'Availability', 'Availability', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5666, 'spanish', 'stock', 'stock', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5667, 'spanish', 'Update Inventory', 'Update Inventory', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5668, 'spanish', 'Product Category', 'Product Category', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5669, 'spanish', 'Update Category', 'Update Category', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5670, 'spanish', ' Sort Section', ' Sort Section', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5671, 'spanish', 'Sorting', 'Sorting', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5672, 'spanish', 'Add Custom Section', 'Add Custom Section', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5673, 'spanish', 'Add Type', 'Add Type', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5674, 'spanish', 'Edit Section', 'Edit Section', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5675, 'spanish', 'Edit Field', 'Edit Field', '2026-03-20 11:29:19', '2026-03-20 11:29:19'),
(5676, 'spanish', 'Report this listing', 'Report this listing', '2026-03-20 11:29:36', '2026-03-20 11:29:36'),
(5677, 'spanish', 'Add Reviews', 'Add Reviews', '2026-03-20 11:29:36', '2026-03-20 11:29:36'),
(5678, 'spanish', 'Add Your Review', 'Add Your Review', '2026-03-20 11:29:36', '2026-03-20 11:29:36'),
(5679, 'spanish', 'Rating', 'Rating', '2026-03-20 11:29:36', '2026-03-20 11:29:36'),
(5680, 'spanish', 'Select Rating', 'Select Rating', '2026-03-20 11:29:36', '2026-03-20 11:29:36'),
(5681, 'spanish', '1', '1', '2026-03-20 11:29:36', '2026-03-20 11:29:36'),
(5682, 'spanish', '2', '2', '2026-03-20 11:29:37', '2026-03-20 11:29:37'),
(5683, 'spanish', '3', '3', '2026-03-20 11:29:37', '2026-03-20 11:29:37'),
(5684, 'spanish', '4', '4', '2026-03-20 11:29:37', '2026-03-20 11:29:37'),
(5685, 'spanish', '5', '5', '2026-03-20 11:29:37', '2026-03-20 11:29:37'),
(5686, 'spanish', 'Review', 'Review', '2026-03-20 11:29:37', '2026-03-20 11:29:37'),
(5687, 'spanish', 'Show All', 'Show All', '2026-03-20 11:30:19', '2026-03-20 11:30:19'),
(5688, 'spanish', 'See more', 'See more', '2026-03-20 11:30:19', '2026-03-20 11:30:19'),
(5689, 'spanish', 'See less', 'See less', '2026-03-20 11:30:19', '2026-03-20 11:30:19'),
(5690, 'spanish', 'Home | Atlas Directory Listing', 'Home | Atlas Directory Listing', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5691, 'spanish', 'Select Category', 'Select Category', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5692, 'spanish', 'Select City', 'Select City', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5693, 'spanish', 'Search', 'Search', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5694, 'spanish', 'Select Country', 'Select Country', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5695, 'spanish', 'Browse Top Categories.', 'Browse Top Categories.', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5696, 'spanish', 'Featured Listings', 'Featured Listings', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5697, 'spanish', 'night', 'night', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5698, 'spanish', 'Bed', 'Bed', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5699, 'spanish', 'Bath', 'Bath', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5700, 'spanish', 'sqft', 'sqft', '2026-03-20 11:30:39', '2026-03-20 11:30:39'),
(5701, 'spanish', 'We Have Worked with ', 'We Have Worked with ', '2026-03-20 11:30:40', '2026-03-20 11:30:40'),
(5702, 'spanish', '10,000', '10,000', '2026-03-20 11:30:40', '2026-03-20 11:30:40'),
(5703, 'spanish', ' Trusted Companies', ' Trusted Companies', '2026-03-20 11:30:40', '2026-03-20 11:30:40'),
(5704, 'spanish', 'What the people Thinks About Us', 'What the people Thinks About Us', '2026-03-20 11:30:40', '2026-03-20 11:30:40'),
(5705, 'spanish', 'Pickup New Updates', 'Pickup New Updates', '2026-03-20 11:30:40', '2026-03-20 11:30:40'),
(5706, 'spanish', 'Hotel Listing Details', 'Hotel Listing Details', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5707, 'spanish', 'Hotel details', 'Hotel details', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5708, 'spanish', 'Total Price : ', 'Total Price : ', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5709, 'spanish', 'Published:', 'Published:', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5710, 'spanish', 'Room', 'Room', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5711, 'spanish', 'sft', 'sft', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5712, 'spanish', 'Shop products', 'Shop products', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5713, 'spanish', 'All', 'All', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5714, 'spanish', 'Reset', 'Reset', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5715, 'spanish', 'Order', 'Order', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5716, 'spanish', 'Confirm Order', 'Confirm Order', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5717, 'spanish', 'Please login first!', 'Please login first!', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5718, 'spanish', 'Please select at least one product and quantity!', 'Please select at least one product and quantity!', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5719, 'spanish', 'Order Confirmation', 'Order Confirmation', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5720, 'spanish', 'Get Direction', 'Get Direction', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5721, 'spanish', 'Submit Now', 'Submit Now', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5722, 'spanish', 'Related Hotels', 'Related Hotels', '2026-03-20 11:30:44', '2026-03-20 11:30:44'),
(5723, 'spanish', 'Discount %', 'Discount %', '2026-03-20 11:31:05', '2026-03-20 11:31:05'),
(5724, 'spanish', 'Additional Infomation', 'Additional Infomation', '2026-03-20 11:31:05', '2026-03-20 11:31:05'),
(5725, 'spanish', 'Available', 'Available', '2026-03-20 11:31:05', '2026-03-20 11:31:05'),
(5726, 'spanish', 'Not available', 'Not available', '2026-03-20 11:31:05', '2026-03-20 11:31:05'),
(5727, 'spanish', 'Special Features', 'Special Features', '2026-03-20 11:31:05', '2026-03-20 11:31:05'),
(5728, 'spanish', 'Pick an Feature ', 'Pick an Feature ', '2026-03-20 11:31:05', '2026-03-20 11:31:05'),
(5729, 'spanish', 'Enter Feature Name', 'Enter Feature Name', '2026-03-20 11:31:05', '2026-03-20 11:31:05'),
(5730, 'spanish', 'Admin Addon List', 'Admin Addon List', '2026-03-20 11:31:17', '2026-03-20 11:31:17'),
(5731, 'spanish', 'Addon Manager', 'Addon Manager', '2026-03-20 11:31:17', '2026-03-20 11:31:17'),
(5732, 'spanish', 'Add New Addon', 'Add New Addon', '2026-03-20 11:31:17', '2026-03-20 11:31:17'),
(5733, 'spanish', 'version', 'version', '2026-03-20 11:31:17', '2026-03-20 11:31:17'),
(5734, 'spanish', 'Active', 'Active', '2026-03-20 11:31:17', '2026-03-20 11:31:17'),
(5735, 'spanish', 'Deactivate', 'Deactivate', '2026-03-20 11:31:17', '2026-03-20 11:31:17'),
(5736, 'spanish', 'Custom Listing Details', 'Custom Listing Details', '2026-03-20 11:31:40', '2026-03-20 11:31:40'),
(5737, 'spanish', 'Hotel Grid', 'Hotel Grid', '2026-03-20 11:31:52', '2026-03-20 11:31:52'),
(5738, 'spanish', 'Hotel Category', 'Hotel Category', '2026-03-20 11:31:52', '2026-03-20 11:31:52'),
(5739, 'spanish', 'Show More', 'Show More', '2026-03-20 11:31:52', '2026-03-20 11:31:52'),
(5740, 'spanish', 'Bedroom', 'Bedroom', '2026-03-20 11:31:52', '2026-03-20 11:31:52'),
(5741, 'spanish', 'Bathroom', 'Bathroom', '2026-03-20 11:31:52', '2026-03-20 11:31:52'),
(5742, 'spanish', 'Inventory Updated Successful!', 'Inventory Updated Successful!', '2026-03-20 11:34:20', '2026-03-20 11:34:20'),
(5743, 'spanish', 'Category Title', 'Category Title', '2026-03-20 11:34:32', '2026-03-20 11:34:32'),
(5744, 'spanish', '404 not found', '404 not found', '2026-03-20 12:43:17', '2026-03-20 12:43:17'),
(5745, 'spanish', 'The page you requested could not be found', 'The page you requested could not be found', '2026-03-20 12:43:17', '2026-03-20 12:43:17'),
(5746, 'spanish', 'Please try the following', 'Please try the following', '2026-03-20 12:43:17', '2026-03-20 12:43:17'),
(5747, 'spanish', 'Check the spelling of the url', 'Check the spelling of the url', '2026-03-20 12:43:17', '2026-03-20 12:43:17'),
(5748, 'spanish', 'If you are still puzzled, click on the home link below', 'If you are still puzzled, click on the home link below', '2026-03-20 12:43:17', '2026-03-20 12:43:17'),
(5749, 'spanish', 'Back to home', 'Back to home', '2026-03-20 12:43:17', '2026-03-20 12:43:17'),
(5750, 'spanish', 'Blog Details', 'Blog Details', '2026-03-20 13:55:51', '2026-03-20 13:55:51'),
(5751, 'spanish', 'Share On :', 'Share On :', '2026-03-20 13:55:51', '2026-03-20 13:55:51'),
(5752, 'spanish', 'Tags:', 'Tags:', '2026-03-20 13:55:51', '2026-03-20 13:55:51'),
(5753, 'spanish', 'Related Blogs', 'Related Blogs', '2026-03-20 13:55:51', '2026-03-20 13:55:51'),
(5754, 'spanish', 'No Result Found', 'No Result Found', '2026-03-20 18:01:38', '2026-03-20 18:01:38'),
(5755, 'spanish', 'No Data were found matching your selection.', 'No Data were found matching your selection.', '2026-03-20 18:01:38', '2026-03-20 18:01:38'),
(5756, 'spanish', 'Go Back', 'Go Back', '2026-03-20 18:01:38', '2026-03-20 18:01:38'),
(5757, 'spanish', 'Terms-and-condition', 'Terms-and-condition', '2026-03-21 19:34:24', '2026-03-21 19:34:24'),
(5758, 'spanish', 'View Menu', 'View Menu', '2026-03-21 19:34:37', '2026-03-21 19:34:37'),
(5759, 'spanish', 'Book A Table', 'Book A Table', '2026-03-21 19:34:37', '2026-03-21 19:34:37'),
(5760, 'spanish', 'View More', 'View More', '2026-03-21 19:34:37', '2026-03-21 19:34:37'),
(5761, 'spanish', 'Popular Restaurant', 'Popular Restaurant', '2026-03-21 19:34:37', '2026-03-21 19:34:37'),
(5762, 'spanish', 'Explore Restaurant', 'Explore Restaurant', '2026-03-21 19:34:37', '2026-03-21 19:34:37'),
(5763, 'spanish', 'Trending Restaurant', 'Trending Restaurant', '2026-03-21 19:34:37', '2026-03-21 19:34:37'),
(5764, 'spanish', 'Sign Up', 'Sign Up', '2026-03-21 19:34:50', '2026-03-21 19:34:50'),
(5765, 'spanish', 'Get Started Now', 'Get Started Now', '2026-03-21 19:34:50', '2026-03-21 19:34:50'),
(5766, 'spanish', 'Enter your credentials to access your account', 'Enter your credentials to access your account', '2026-03-21 19:34:50', '2026-03-21 19:34:50'),
(5767, 'spanish', 'Confirm Password', 'Confirm Password', '2026-03-21 19:34:50', '2026-03-21 19:34:50'),
(5768, 'spanish', 'I agree to the', 'I agree to the', '2026-03-21 19:34:50', '2026-03-21 19:34:50'),
(5769, 'spanish', 'Terms & Policy', 'Terms & Policy', '2026-03-21 19:34:50', '2026-03-21 19:34:50'),
(5770, 'spanish', 'Register', 'Register', '2026-03-21 19:34:50', '2026-03-21 19:34:50'),
(5771, 'spanish', 'Back to login', 'Back to login', '2026-03-21 19:34:50', '2026-03-21 19:34:50'),
(5772, 'spanish', 'Refund-policy', 'Refund-policy', '2026-03-21 19:35:16', '2026-03-21 19:35:16'),
(5773, 'spanish', 'Real-Estate Directory Listing', 'Real-Estate Directory Listing', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5774, 'spanish', 'Discount', 'Discount', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5775, 'spanish', 'Learn More', 'Learn More', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5776, 'spanish', 'New Properties', 'New Properties', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5777, 'spanish', 'Explore All Properties', 'Explore All Properties', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5778, 'spanish', 'Property', 'Property', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5779, 'spanish', 'For Sell', 'For Sell', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5780, 'spanish', 'For Rent', 'For Rent', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5781, 'spanish', 'All Listing', 'All Listing', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5782, 'spanish', 'Sell', 'Sell', '2026-03-21 19:35:45', '2026-03-21 19:35:45'),
(5783, 'spanish', 'Rent', 'Rent', '2026-03-21 19:35:46', '2026-03-21 19:35:46'),
(5784, 'spanish', 'Choose Category', 'Choose Category', '2026-03-21 19:35:46', '2026-03-21 19:35:46'),
(5785, 'spanish', 'Choose City', 'Choose City', '2026-03-21 19:35:46', '2026-03-21 19:35:46'),
(5786, 'spanish', 'Budget', 'Budget', '2026-03-21 19:35:46', '2026-03-21 19:35:46'),
(5787, 'spanish', 'Choose your budget', 'Choose your budget', '2026-03-21 19:35:46', '2026-03-21 19:35:46'),
(5788, 'spanish', 'Privacy-policy', 'Privacy-policy', '2026-03-21 19:36:17', '2026-03-21 19:36:17'),
(5789, 'spanish', 'Pricing Plan for Becoming Agent', 'Pricing Plan for Becoming Agent', '2026-03-21 19:36:49', '2026-03-21 19:36:49'),
(5790, 'spanish', 'Free', 'Free', '2026-03-21 19:36:50', '2026-03-21 19:36:50'),
(5791, 'spanish', 'Listing Feature', 'Listing Feature', '2026-03-21 19:36:50', '2026-03-21 19:36:50'),
(5792, 'spanish', 'Try Now', 'Try Now', '2026-03-21 19:36:50', '2026-03-21 19:36:50'),
(5793, 'spanish', 'Contact Form', 'Contact Form', '2026-03-21 19:36:50', '2026-03-21 19:36:50'),
(5794, 'spanish', 'Listing Video', 'Listing Video', '2026-03-21 19:36:50', '2026-03-21 19:36:50'),
(5795, 'spanish', 'Frequently Asked Questions', 'Frequently Asked Questions', '2026-03-21 19:36:50', '2026-03-21 19:36:50'),
(5796, 'spanish', 'About-Us', 'About-Us', '2026-03-21 19:37:09', '2026-03-21 19:37:09'),
(5797, 'spanish', 'Forget your password', 'Forget your password', '2026-03-21 19:37:21', '2026-03-21 19:37:21'),
(5798, 'spanish', 'Don\'t an account', 'Don\'t an account', '2026-03-21 19:37:21', '2026-03-21 19:37:21'),
(5799, 'spanish', 'Real Estate Grid', 'Real Estate Grid', '2026-03-21 19:38:04', '2026-03-21 19:38:04'),
(5800, 'spanish', 'Real-estate Category', 'Real-estate Category', '2026-03-21 19:38:04', '2026-03-21 19:38:04'),
(5801, 'spanish', 'Garage', 'Garage', '2026-03-21 19:38:04', '2026-03-21 19:38:04'),
(5802, 'spanish', 'Our Latest Blog', 'Our Latest Blog', '2026-03-21 19:38:18', '2026-03-21 19:38:18'),
(5803, 'spanish', 'Recent Post', 'Recent Post', '2026-03-21 19:38:18', '2026-03-21 19:38:18'),
(5804, 'spanish', 'Get In Touch', 'Get In Touch', '2026-03-21 19:39:03', '2026-03-21 19:39:03'),
(5805, 'spanish', 'Promote your business and get discovered with ease — List your services on Listing Atlas, the smart directory solution.', 'Promote your business and get discovered with ease — List your services on Listing Atlas, the smart directory solution.', '2026-03-21 19:39:03', '2026-03-21 19:39:03'),
(5806, 'spanish', 'Send Message', 'Send Message', '2026-03-21 19:39:03', '2026-03-21 19:39:03'),
(5807, 'spanish', 'Forgot Password', 'Forgot Password', '2026-03-21 19:41:00', '2026-03-21 19:41:00'),
(5808, 'spanish', 'Enter your email address to receive a verification  code', 'Enter your email address to receive a verification  code', '2026-03-21 19:41:00', '2026-03-21 19:41:00'),
(5809, 'spanish', 'Send', 'Send', '2026-03-21 19:41:00', '2026-03-21 19:41:00'),
(5810, 'spanish', 'Hotel Directory Listing', 'Hotel Directory Listing', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5811, 'spanish', 'Find Gateway Deals', 'Find Gateway Deals', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5812, 'spanish', 'Explore Hotel', 'Explore Hotel', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5813, 'spanish', 'Top Hotels', 'Top Hotels', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5814, 'spanish', 'See all', 'See all', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5815, 'spanish', 'Hotels', 'Hotels', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5816, 'spanish', 'Popular Hotel', 'Popular Hotel', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5817, 'spanish', 'Flexible budget', 'Flexible budget', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5818, 'spanish', 'Peaceful place', 'Peaceful place', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5819, 'spanish', 'Well decorated', 'Well decorated', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5820, 'spanish', 'Take A Tour', 'Take A Tour', '2026-03-21 19:42:08', '2026-03-21 19:42:08'),
(5821, 'spanish', 'Hotel list', 'Hotel list', '2026-03-21 19:48:57', '2026-03-21 19:48:57'),
(5822, 'spanish', 'Real-estate list', 'Real-estate list', '2026-03-21 19:53:15', '2026-03-21 19:53:15'),
(5823, 'spanish', 'Restaurant Grid', 'Restaurant Grid', '2026-03-21 19:53:49', '2026-03-21 19:53:49'),
(5824, 'spanish', 'Restaurant Category', 'Restaurant Category', '2026-03-21 19:53:49', '2026-03-21 19:53:49'),
(5825, 'spanish', 'Restaurant List', 'Restaurant List', '2026-03-21 19:54:11', '2026-03-21 19:54:11'),
(5826, 'spanish', 'Car Directory Listing', 'Car Directory Listing', '2026-03-22 07:50:49', '2026-03-22 07:50:49'),
(5827, 'spanish', 'Brands', 'Brands', '2026-03-22 07:50:49', '2026-03-22 07:50:49'),
(5828, 'spanish', 'Model', 'Model', '2026-03-22 07:50:50', '2026-03-22 07:50:50'),
(5829, 'spanish', 'Year', 'Year', '2026-03-22 07:50:50', '2026-03-22 07:50:50'),
(5830, 'spanish', 'Search Cars', 'Search Cars', '2026-03-22 07:50:50', '2026-03-22 07:50:50'),
(5831, 'spanish', 'Our Happy Customers', 'Our Happy Customers', '2026-03-22 07:50:50', '2026-03-22 07:50:50'),
(5832, 'spanish', 'Latest Vehicles on Sale', 'Latest Vehicles on Sale', '2026-03-22 07:50:50', '2026-03-22 07:50:50'),
(5833, 'spanish', 'FEATURED VEHICLES', 'FEATURED VEHICLES', '2026-03-22 07:50:50', '2026-03-22 07:50:50'),
(5834, 'spanish', 'Top Cars', 'Top Cars', '2026-03-22 07:50:50', '2026-03-22 07:50:50'),
(5835, 'spanish', 'Book Now', 'Book Now', '2026-03-22 07:50:50', '2026-03-22 07:50:50'),
(5836, 'spanish', 'Beauty Directory Listings', 'Beauty Directory Listings', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5837, 'spanish', 'Explore Our Products', 'Explore Our Products', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5838, 'spanish', 'Popular Product', 'Popular Product', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5839, 'spanish', 'Best Product', 'Best Product', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5840, 'spanish', 'Wellness Product', 'Wellness Product', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5841, 'spanish', 'Hair Treatment', 'Hair Treatment', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5842, 'spanish', '&', '&', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5843, 'spanish', 'Repair', 'Repair', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5844, 'spanish', 'Get Discount Up To 20', 'Get Discount Up To 20', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5845, 'spanish', '%', '%', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5846, 'spanish', 'Best Massage', 'Best Massage', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5847, 'spanish', 'Explore More', 'Explore More', '2026-03-22 07:51:01', '2026-03-22 07:51:01'),
(5848, 'spanish', 'Popular Beauty Parlors', 'Popular Beauty Parlors', '2026-03-22 07:51:02', '2026-03-22 07:51:02'),
(5849, 'spanish', 'Find The Best Spa Here', 'Find The Best Spa Here', '2026-03-22 07:51:02', '2026-03-22 07:51:02'),
(5850, 'spanish', 'Complete wellness with massage', 'Complete wellness with massage', '2026-03-22 07:51:02', '2026-03-22 07:51:02'),
(5851, 'spanish', 'Booking Online', 'Booking Online', '2026-03-22 07:51:02', '2026-03-22 07:51:02'),
(5852, 'spanish', 'Real Estate Listing Details', 'Real Estate Listing Details', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5853, 'spanish', 'ID :', 'ID :', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5854, 'spanish', 'Property ID', 'Property ID', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5855, 'spanish', 'Property Size', 'Property Size', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5856, 'spanish', 'Bedrooms', 'Bedrooms', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5857, 'spanish', 'Bathrooms', 'Bathrooms', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5858, 'spanish', 'Year Build', 'Year Build', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5859, 'spanish', 'Property Agent', 'Property Agent', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5860, 'spanish', 'Floor Plans', 'Floor Plans', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5861, 'spanish', 'Video', 'Video', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5862, 'spanish', 'Nearby', 'Nearby', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5863, 'spanish', 'Hospital', 'Hospital', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5864, 'spanish', 'Shopping center', 'Shopping center', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5865, 'spanish', '3D Model', '3D Model', '2026-03-22 07:53:19', '2026-03-22 07:53:19'),
(5866, 'spanish', 'Welcome back ____', 'Welcome back ____', '2026-03-23 06:13:25', '2026-03-23 06:13:25'),
(5867, 'spanish', 'No data found', 'No data found', '2026-03-23 06:41:02', '2026-03-23 06:41:02'),
(5868, 'spanish', 'Listing Update successfully!', 'Listing Update successfully!', '2026-03-23 06:41:16', '2026-03-23 06:41:16'),
(5869, 'hindi', 'Listing Update', 'Listing Update', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5870, 'spanish', 'Listing Update', 'Listing Update', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5871, 'hindi', 'Claim', 'Claim', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5872, 'spanish', 'Claim', 'Claim', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5873, 'spanish', 'Enter listing description', 'Enter listing description', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5874, 'hindi', 'Select  type', 'Select  type', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5875, 'spanish', 'Select  type', 'Select  type', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5876, 'spanish', 'Feature', 'Feature', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5877, 'hindi', 'Add New Feature', 'Add New Feature', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5878, 'spanish', 'Add New Feature', 'Add New Feature', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5879, 'hindi', 'Add Feature', 'Add Feature', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5880, 'spanish', 'Add Feature', 'Add Feature', '2026-03-23 06:41:59', '2026-03-23 06:41:59'),
(5881, 'spanish', 'Click to upload SVG, PNG, JPG, or GIF', 'Click to upload SVG, PNG, JPG, or GIF', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5882, 'spanish', 'max 500 x 700px', 'max 500 x 700px', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5883, 'hindi', 'This directory is not yet verified !', 'This directory is not yet verified !', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5884, 'spanish', 'This directory is not yet verified !', 'This directory is not yet verified !', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5885, 'hindi', 'Provide Validity', 'Provide Validity', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5886, 'spanish', 'Provide Validity', 'Provide Validity', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5887, 'spanish', 'Category List', 'Category List', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5888, 'spanish', 'Actions', 'Actions', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5889, 'spanish', 'Add Custom Field', 'Add Custom Field', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5890, 'spanish', 'Add New Field', 'Add New Field', '2026-03-23 06:42:00', '2026-03-23 06:42:00'),
(5891, 'spanish', 'Package List', 'Package List', '2026-03-23 06:44:44', '2026-03-23 06:44:44'),
(5892, 'spanish', 'Add New Package', 'Add New Package', '2026-03-23 06:44:44', '2026-03-23 06:44:44'),
(5893, 'spanish', 'Icon', 'Icon', '2026-03-23 06:44:44', '2026-03-23 06:44:44'),
(5894, 'spanish', 'Period', 'Period', '2026-03-23 06:44:44', '2026-03-23 06:44:44'),
(5895, 'spanish', 'listing Amount', 'listing Amount', '2026-03-23 06:44:44', '2026-03-23 06:44:44'),
(5896, 'spanish', 'Category Amount', 'Category Amount', '2026-03-23 06:44:44', '2026-03-23 06:44:44'),
(5897, 'spanish', 'Choice', 'Choice', '2026-03-23 06:44:44', '2026-03-23 06:44:44'),
(5898, 'spanish', 'Update Package', 'Update Package', '2026-03-23 06:44:44', '2026-03-23 06:44:44'),
(5899, 'spanish', 'Create Listing', 'Create Listing', '2026-03-23 06:48:22', '2026-03-23 06:48:22'),
(5900, 'spanish', 'Listing Type', 'Listing Type', '2026-03-23 06:48:22', '2026-03-23 06:48:22'),
(5901, 'spanish', 'Select listing type', 'Select listing type', '2026-03-23 06:48:22', '2026-03-23 06:48:22'),
(5902, 'spanish', 'Listing Category', 'Listing Category', '2026-03-23 06:48:22', '2026-03-23 06:48:22'),
(5903, 'spanish', 'Select listing type first', 'Select listing type first', '2026-03-23 06:48:22', '2026-03-23 06:48:22'),
(5904, 'spanish', 'Select Listing type from dropdown.', 'Select Listing type from dropdown.', '2026-03-23 06:48:22', '2026-03-23 06:48:22'),
(5905, 'spanish', 'Create', 'Create', '2026-03-23 06:48:29', '2026-03-23 06:48:29'),
(5906, 'spanish', 'Listing Created successfully!', 'Listing Created successfully!', '2026-03-23 06:50:32', '2026-03-23 06:50:32'),
(5907, 'spanish', 'Enter product name', 'Enter product name', '2026-03-23 06:50:45', '2026-03-23 06:50:45'),
(5908, 'spanish', 'Enter price', 'Enter price', '2026-03-23 06:50:45', '2026-03-23 06:50:45'),
(5909, 'spanish', 'Description must not exceed 73 characters.', 'Description must not exceed 73 characters.', '2026-03-23 06:50:45', '2026-03-23 06:50:45'),
(5910, 'spanish', 'provide category name', 'provide category name', '2026-03-23 06:50:53', '2026-03-23 06:50:53'),
(5911, 'spanish', 'Inventory Category Created Successful!', 'Inventory Category Created Successful!', '2026-03-23 06:50:59', '2026-03-23 06:50:59'),
(5912, 'spanish', 'Inventory Created Successful!', 'Inventory Created Successful!', '2026-03-23 06:51:30', '2026-03-23 06:51:30'),
(5913, 'spanish', 'Profile', 'Profile', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5914, 'spanish', 'Profile Settings', 'Profile Settings', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5915, 'spanish', 'Profile Information', 'Profile Information', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5916, 'spanish', 'User Name', 'User Name', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5917, 'spanish', 'Enter user name', 'Enter user name', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5918, 'spanish', 'User Email', 'User Email', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5919, 'spanish', 'Enter user email', 'Enter user email', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5920, 'spanish', 'User Image', 'User Image', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5921, 'spanish', 'Save', 'Save', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5922, 'spanish', 'Password Update', 'Password Update', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5923, 'spanish', 'Current Password', 'Current Password', '2026-03-23 06:52:27', '2026-03-23 06:52:27'),
(5924, 'spanish', 'Agent Subscription', 'Agent Subscription', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5925, 'english', 'Listify 200', 'Listify 200', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5926, 'hindi', 'Listify 200', 'Listify 200', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5927, 'spanish', 'Listify 200', 'Listify 200', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5928, 'spanish', '500', '500', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5929, 'spanish', 'annually', 'annually', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5930, 'spanish', 'plan', 'plan', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5931, 'spanish', 'Your current package price is', 'Your current package price is', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5932, 'spanish', 'It will expired on ', 'It will expired on ', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5933, 'spanish', 'Payment Method', 'Payment Method', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5934, 'spanish', 'Invoicing', 'Invoicing', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5935, 'spanish', 'Last payment:', 'Last payment:', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5936, 'spanish', 'Modify Billing Information', 'Modify Billing Information', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5937, 'spanish', 'Billing History', 'Billing History', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5938, 'spanish', 'Package', 'Package', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5939, 'spanish', 'Start Date', 'Start Date', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5940, 'spanish', 'End Date', 'End Date', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5941, 'spanish', 'Amount', 'Amount', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5942, 'spanish', 'Download', 'Download', '2026-03-23 07:02:16', '2026-03-23 07:02:16'),
(5943, 'spanish', 'Activated', 'Activated', '2026-03-23 07:03:32', '2026-03-23 07:03:32'),
(5944, 'spanish', 'Order summary', 'Order summary', '2026-03-23 07:03:37', '2026-03-23 07:03:37'),
(5945, 'spanish', 'Cancel Payment', 'Cancel Payment', '2026-03-23 07:03:37', '2026-03-23 07:03:37'),
(5946, 'spanish', 'Package Details', 'Package Details', '2026-03-23 07:03:37', '2026-03-23 07:03:37'),
(5947, 'spanish', 'Total', 'Total', '2026-03-23 07:03:37', '2026-03-23 07:03:37'),
(5948, 'spanish', 'Grand Total', 'Grand Total', '2026-03-23 07:03:37', '2026-03-23 07:03:37'),
(5949, 'spanish', 'Subscribe Now', 'Subscribe Now', '2026-03-23 07:03:37', '2026-03-23 07:03:37'),
(5950, 'spanish', 'Subscription activated successfully!', 'Subscription activated successfully!', '2026-03-23 07:03:40', '2026-03-23 07:03:40'),
(5951, 'spanish', 'Delivered Orders', 'Delivered Orders', '2026-03-23 07:15:07', '2026-03-23 07:15:07'),
(5952, 'spanish', 'Your Order', 'Your Order', '2026-03-23 07:24:16', '2026-03-23 07:24:16'),
(5953, 'spanish', 'Delivery details', 'Delivery details', '2026-03-23 07:24:16', '2026-03-23 07:24:16'),
(5954, 'spanish', 'Phone Number', 'Phone Number', '2026-03-23 07:24:16', '2026-03-23 07:24:16'),
(5955, 'spanish', 'Any Note', 'Any Note', '2026-03-23 07:24:16', '2026-03-23 07:24:16'),
(5956, 'spanish', 'Transaction ID', 'Transaction ID', '2026-03-23 07:24:16', '2026-03-23 07:24:16'),
(5957, 'spanish', 'Payment Screenshort', 'Payment Screenshort', '2026-03-23 07:24:17', '2026-03-23 07:24:17'),
(5958, 'spanish', 'Cash on Delivery', 'Cash on Delivery', '2026-03-23 07:24:17', '2026-03-23 07:24:17'),
(5959, 'spanish', 'Confirm This Order', 'Confirm This Order', '2026-03-23 07:24:17', '2026-03-23 07:24:17'),
(5960, 'hindi', 'Additional Info', 'Additional Info', '2026-03-23 07:24:41', '2026-03-23 07:24:41'),
(5961, 'spanish', 'Additional Info', 'Additional Info', '2026-03-23 07:24:41', '2026-03-23 07:24:41'),
(5962, 'spanish', 'Become an agent', 'Become an agent', '2026-03-23 07:42:08', '2026-03-23 07:42:08'),
(5963, 'spanish', 'Notification', 'Notification', '2026-03-23 08:39:15', '2026-03-23 08:39:15'),
(5964, 'spanish', 'All Listing Type', 'All Listing Type', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5965, 'spanish', 'Trading Listing', 'Trading Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5966, 'spanish', 'Academies Listing', 'Academies Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5967, 'spanish', 'Popular Services Listing', 'Popular Services Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5968, 'spanish', 'Agencies Listing', 'Agencies Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5969, 'spanish', 'It Services Listing', 'It Services Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5970, 'spanish', 'Industrial Listing', 'Industrial Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5971, 'spanish', 'Corporate Gifting And Printing Services Listing', 'Corporate Gifting And Printing Services Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5972, 'spanish', 'Recreation Listing', 'Recreation Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5973, 'spanish', 'Automobiles Listing', 'Automobiles Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5974, 'spanish', 'Manufacturing Listing', 'Manufacturing Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5975, 'spanish', 'Grooming Listing', 'Grooming Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5976, 'spanish', 'Fitness Listing', 'Fitness Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5977, 'spanish', 'Food Listing', 'Food Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5978, 'spanish', 'Hotel Listing', 'Hotel Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5979, 'spanish', 'Real Estate Listing', 'Real Estate Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5980, 'spanish', 'Restaurant Listing', 'Restaurant Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5981, 'spanish', 'Beauty Listing', 'Beauty Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38');
INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(5982, 'spanish', 'Car Listing', 'Car Listing', '2026-03-23 08:39:38', '2026-03-23 08:39:38'),
(5983, 'spanish', 'Email Send successfully', 'Email Send successfully', '2026-03-23 18:21:17', '2026-03-23 18:21:17'),
(5984, 'spanish', 'Car Grid', 'Car Grid', '2026-03-23 21:50:19', '2026-03-23 21:50:19'),
(5985, 'spanish', 'Car Category', 'Car Category', '2026-03-23 21:50:20', '2026-03-23 21:50:20'),
(5986, 'spanish', 'Car type', 'Car type', '2026-03-23 21:50:20', '2026-03-23 21:50:20'),
(5987, 'spanish', 'Brand', 'Brand', '2026-03-23 21:50:20', '2026-03-23 21:50:20'),
(5988, 'spanish', 'Years', 'Years', '2026-03-23 21:50:20', '2026-03-23 21:50:20'),
(5989, 'spanish', 'Colors', 'Colors', '2026-03-23 21:50:20', '2026-03-23 21:50:20'),
(5990, 'spanish', 'Beauty Grid', 'Beauty Grid', '2026-03-23 21:50:31', '2026-03-23 21:50:31'),
(5991, 'spanish', 'Beauty Category', 'Beauty Category', '2026-03-23 21:50:31', '2026-03-23 21:50:31'),
(5992, 'spanish', 'Qrcodes', 'Qrcodes', '2026-03-25 06:18:29', '2026-03-25 06:18:29'),
(5993, 'spanish', 'Add Qrcodes', 'Add Qrcodes', '2026-03-25 06:18:29', '2026-03-25 06:18:29'),
(5994, 'spanish', 'addqr', 'addqr', '2026-03-25 06:18:38', '2026-03-25 06:18:38'),
(5995, 'spanish', 'Add Qrcode', 'Add Qrcode', '2026-03-25 06:18:38', '2026-03-25 06:18:38'),
(5996, 'spanish', 'Create blog', 'Create blog', '2026-03-25 06:31:32', '2026-03-25 06:31:32'),
(5997, 'spanish', 'Keywords', 'Keywords', '2026-03-25 06:31:32', '2026-03-25 06:31:32'),
(5998, 'spanish', 'Create Blogs', 'Create Blogs', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(5999, 'spanish', 'Blog Title', 'Blog Title', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6000, 'spanish', 'Enter blog title', 'Enter blog title', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6001, 'spanish', 'Select blog category', 'Select blog category', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6002, 'spanish', 'Blog Description', 'Blog Description', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6003, 'spanish', 'Blog Keyword', 'Blog Keyword', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6004, 'spanish', 'Keyword will be:- keyword1; keyword2; keyword3', 'Keyword will be:- keyword1; keyword2; keyword3', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6005, 'spanish', 'Blog Banner', 'Blog Banner', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6006, 'spanish', 'Do you want to mark it as popular', 'Do you want to mark it as popular', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6007, 'spanish', 'Mark as popular', 'Mark as popular', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6008, 'spanish', 'Back', 'Back', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6009, 'spanish', 'Write Blog description', 'Write Blog description', '2026-03-25 06:31:35', '2026-03-25 06:31:35'),
(6010, 'hindi', 'Blog Create successfully!', 'Blog Create successfully!', '2026-03-25 06:32:55', '2026-03-25 06:32:55'),
(6011, 'spanish', 'Blog Create successfully!', 'Blog Create successfully!', '2026-03-25 06:32:55', '2026-03-25 06:32:55'),
(6012, 'hindi', 'On Review', 'On Review', '2026-03-25 06:32:55', '2026-03-25 06:32:55'),
(6013, 'spanish', 'On Review', 'On Review', '2026-03-25 06:32:55', '2026-03-25 06:32:55'),
(6014, 'hindi', 'Remove blog', 'Remove blog', '2026-03-25 06:32:55', '2026-03-25 06:32:55'),
(6015, 'spanish', 'Remove blog', 'Remove blog', '2026-03-25 06:32:55', '2026-03-25 06:32:55'),
(6016, 'spanish', 'Add New Blog', 'Add New Blog', '2026-03-25 06:34:00', '2026-03-25 06:34:00'),
(6017, 'spanish', 'Pending', 'Pending', '2026-03-25 06:34:00', '2026-03-25 06:34:00'),
(6018, 'hindi', 'Approve', 'Approve', '2026-03-25 06:34:07', '2026-03-25 06:34:07'),
(6019, 'spanish', 'Approve', 'Approve', '2026-03-25 06:34:07', '2026-03-25 06:34:07'),
(6020, 'hindi', 'Status successful!', 'Status successful!', '2026-03-25 06:34:16', '2026-03-25 06:34:16'),
(6021, 'spanish', 'Status successful!', 'Status successful!', '2026-03-25 06:34:16', '2026-03-25 06:34:16'),
(6022, 'english', 'Publish', 'Publish', '2026-03-25 06:34:58', '2026-03-25 06:34:58'),
(6023, 'hindi', 'Publish', 'Publish', '2026-03-25 06:34:58', '2026-03-25 06:34:58'),
(6024, 'spanish', 'Publish', 'Publish', '2026-03-25 06:34:58', '2026-03-25 06:34:58'),
(6025, 'hindi', 'Update Blogs', 'Update Blogs', '2026-03-25 06:35:03', '2026-03-25 06:35:03'),
(6026, 'spanish', 'Update Blogs', 'Update Blogs', '2026-03-25 06:35:03', '2026-03-25 06:35:03'),
(6027, 'spanish', 'Update Blog', 'Update Blog', '2026-03-25 06:35:03', '2026-03-25 06:35:03'),
(6028, 'spanish', 'You can reorder the fields by dragging and dropping each item. The order you set here will be reflected on the frontend.', 'You can reorder the fields by dragging and dropping each item. The order you set here will be reflected on the frontend.', '2026-03-25 07:16:33', '2026-03-25 07:16:33'),
(6029, 'spanish', 'Save Field Order', 'Save Field Order', '2026-03-25 07:16:33', '2026-03-25 07:16:33'),
(6030, 'spanish', 'Create Form', 'Create Form', '2026-03-25 07:16:41', '2026-03-25 07:16:41'),
(6031, 'spanish', 'Field saved successfully!', 'Field saved successfully!', '2026-03-25 07:20:47', '2026-03-25 07:20:47'),
(6032, 'spanish', 'Remove Wishlist', 'Remove Wishlist', '2026-03-25 07:22:11', '2026-03-25 07:22:11'),
(6033, 'spanish', 'Category Create', 'Category Create', '2026-03-25 08:39:59', '2026-03-25 08:39:59'),
(6034, 'spanish', 'Add new category', 'Add new category', '2026-03-25 08:39:59', '2026-03-25 08:39:59'),
(6035, 'spanish', 'Parent', 'Parent', '2026-03-25 08:39:59', '2026-03-25 08:39:59'),
(6036, 'spanish', 'Edit Category', 'Edit Category', '2026-03-25 08:39:59', '2026-03-25 08:39:59'),
(6037, 'spanish', 'Field deleted successfully!', 'Field deleted successfully!', '2026-03-25 09:16:33', '2026-03-25 09:16:33'),
(6038, 'spanish', 'Your package listing limit has been reached. Please purchase a new package to create more listings', 'Your package listing limit has been reached. Please purchase a new package to create more listings', '2026-03-26 05:10:07', '2026-03-26 05:10:07'),
(6039, 'spanish', 'Categories par listing', 'Categories par listing', '2026-03-26 05:10:07', '2026-03-26 05:10:07'),
(6040, 'spanish', 'Current Package', 'Current Package', '2026-03-26 05:10:08', '2026-03-26 05:10:08'),
(6041, 'spanish', 'Remove from Wishlist', 'Remove from Wishlist', '2026-03-26 11:53:41', '2026-03-26 11:53:41'),
(6042, 'spanish', ' Update Sorting', ' Update Sorting', '2026-03-27 06:05:57', '2026-03-27 06:05:57'),
(6043, 'spanish', 'Add New Type', 'Add New Type', '2026-03-27 06:05:57', '2026-03-27 06:05:57'),
(6044, 'spanish', 'Add new Directory', 'Add new Directory', '2026-03-27 06:05:57', '2026-03-27 06:05:57'),
(6045, 'spanish', 'Deactive', 'Deactive', '2026-03-27 06:05:57', '2026-03-27 06:05:57'),
(6046, 'spanish', 'Update Type', 'Update Type', '2026-03-27 06:05:57', '2026-03-27 06:05:57'),
(6047, 'spanish', 'Enter Type Name', 'Enter Type Name', '2026-03-27 06:06:02', '2026-03-27 06:06:02'),
(6048, 'spanish', 'Logo', 'Logo', '2026-03-27 06:06:02', '2026-03-27 06:06:02'),
(6049, 'spanish', 'Featured Listing', 'Featured Listing', '2026-03-27 06:06:02', '2026-03-27 06:06:02'),
(6050, 'spanish', 'Inactive', 'Inactive', '2026-03-27 06:06:02', '2026-03-27 06:06:02'),
(6051, 'spanish', 'Directory Create successfully!', 'Directory Create successfully!', '2026-03-27 06:43:45', '2026-03-27 06:43:45'),
(6052, 'english', 'Healthcare Services', 'Healthcare Services', '2026-03-27 06:43:45', '2026-03-27 06:43:45'),
(6053, 'hindi', 'Healthcare Services', 'Healthcare Services', '2026-03-27 06:43:45', '2026-03-27 06:43:45'),
(6054, 'spanish', 'Healthcare Services', 'Healthcare Services', '2026-03-27 06:43:45', '2026-03-27 06:43:45'),
(6055, 'spanish', 'Category name', 'Category name', '2026-03-27 06:45:04', '2026-03-27 06:45:04'),
(6056, 'spanish', 'Enter Category Name', 'Enter Category Name', '2026-03-27 06:45:05', '2026-03-27 06:45:05'),
(6057, 'spanish', 'Category parent', 'Category parent', '2026-03-27 06:45:05', '2026-03-27 06:45:05'),
(6058, 'spanish', 'Select Category parent', 'Select Category parent', '2026-03-27 06:45:05', '2026-03-27 06:45:05'),
(6059, 'spanish', 'Category added successful!', 'Category added successful!', '2026-03-27 06:45:24', '2026-03-27 06:45:24'),
(6060, 'spanish', 'Subscriptions', 'Subscriptions', '2026-03-27 06:45:54', '2026-03-27 06:45:54'),
(6061, 'spanish', 'List of subscriptions', 'List of subscriptions', '2026-03-27 06:45:54', '2026-03-27 06:45:54'),
(6062, 'spanish', 'Buyer', 'Buyer', '2026-03-27 06:45:54', '2026-03-27 06:45:54'),
(6063, 'spanish', 'Amount Paid', 'Amount Paid', '2026-03-27 06:45:54', '2026-03-27 06:45:54'),
(6064, 'english', 'Travel & Tourism', 'Travel & Tourism', '2026-03-27 07:04:11', '2026-03-27 07:04:11'),
(6065, 'hindi', 'Travel & Tourism', 'Travel & Tourism', '2026-03-27 07:04:11', '2026-03-27 07:04:11'),
(6066, 'spanish', 'Travel & Tourism', 'Travel & Tourism', '2026-03-27 07:04:11', '2026-03-27 07:04:11'),
(6067, 'english', 'Business Services', 'Business Services', '2026-03-27 07:14:42', '2026-03-27 07:14:42'),
(6068, 'hindi', 'Business Services', 'Business Services', '2026-03-27 07:14:42', '2026-03-27 07:14:42'),
(6069, 'spanish', 'Business Services', 'Business Services', '2026-03-27 07:14:42', '2026-03-27 07:14:42'),
(6070, 'english', 'Travel tourism', 'Travel tourism', '2026-03-27 08:27:23', '2026-03-27 08:27:23'),
(6071, 'hindi', 'Travel tourism', 'Travel tourism', '2026-03-27 08:27:23', '2026-03-27 08:27:23'),
(6072, 'spanish', 'Travel tourism', 'Travel tourism', '2026-03-27 08:27:23', '2026-03-27 08:27:23'),
(6073, 'hindi', 'Listing deleted successfully!', 'Listing deleted successfully!', '2026-03-27 08:27:34', '2026-03-27 08:27:34'),
(6074, 'spanish', 'Listing deleted successfully!', 'Listing deleted successfully!', '2026-03-27 08:27:34', '2026-03-27 08:27:34'),
(6075, 'spanish', 'Blog Categories', 'Blog Categories', '2026-03-27 08:49:09', '2026-03-27 08:49:09'),
(6076, 'spanish', 'Blog Category Create', 'Blog Category Create', '2026-03-27 08:49:09', '2026-03-27 08:49:09'),
(6077, 'spanish', 'Number Blogs', 'Number Blogs', '2026-03-27 08:49:09', '2026-03-27 08:49:09'),
(6078, 'spanish', 'Add Blog', 'Add Blog', '2026-03-27 08:49:20', '2026-03-27 08:49:20'),
(6079, 'spanish', 'Website name', 'Website name', '2026-03-27 09:06:18', '2026-03-27 09:06:18'),
(6080, 'spanish', 'Website Email', 'Website Email', '2026-03-27 09:06:18', '2026-03-27 09:06:18'),
(6081, 'spanish', 'Website keywords', 'Website keywords', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6082, 'spanish', 'Website Description', 'Website Description', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6083, 'spanish', 'Author', 'Author', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6084, 'spanish', 'System Currency', 'System Currency', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6085, 'spanish', 'Currency Position', 'Currency Position', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6086, 'spanish', 'Left', 'Left', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6087, 'spanish', 'Right', 'Right', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6088, 'spanish', 'System Language', 'System Language', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6089, 'spanish', 'Select a system language', 'Select a system language', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6090, 'spanish', 'English', 'English', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6091, 'spanish', 'Hindi', 'Hindi', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6092, 'spanish', 'Select a Country', 'Select a Country', '2026-03-27 09:06:19', '2026-03-27 09:06:19'),
(6093, 'spanish', 'Purchase Code', 'Purchase Code', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6094, 'spanish', 'Email Verification', 'Email Verification', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6095, 'spanish', 'Select email verification', 'Select email verification', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6096, 'spanish', 'Enable', 'Enable', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6097, 'spanish', 'Disable', 'Disable', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6098, 'spanish', 'Select Status', 'Select Status', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6099, 'spanish', 'Map access token', 'Map access token', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6100, 'spanish', 'Max zoom level', 'Max zoom level', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6101, 'spanish', 'Default location', 'Default location', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6102, 'spanish', 'Footer Copyright Text', 'Footer Copyright Text', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6103, 'spanish', 'Footer  Text', 'Footer  Text', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6104, 'spanish', 'Timezone', 'Timezone', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6105, 'spanish', 'Update Product', 'Update Product', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6106, 'spanish', 'Facebook Link', 'Facebook Link', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6107, 'spanish', 'Twitter Link', 'Twitter Link', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6108, 'spanish', 'Linkedin Link', 'Linkedin Link', '2026-03-27 09:06:20', '2026-03-27 09:06:20'),
(6109, 'hindi', 'Setting update successfully!', 'Setting update successfully!', '2026-03-27 09:06:44', '2026-03-27 09:06:44'),
(6110, 'spanish', 'Setting update successfully!', 'Setting update successfully!', '2026-03-27 09:06:44', '2026-03-27 09:06:44'),
(6111, 'spanish', 'City Lists', 'City Lists', '2026-03-27 11:09:19', '2026-03-27 11:09:19'),
(6112, 'spanish', 'Add New City', 'Add New City', '2026-03-27 11:09:19', '2026-03-27 11:09:19'),
(6113, 'spanish', 'Edit City', 'Edit City', '2026-03-27 11:09:19', '2026-03-27 11:09:19'),
(6114, 'spanish', 'Edit Country', 'Edit Country', '2026-03-27 11:09:19', '2026-03-27 11:09:19'),
(6115, 'spanish', 'Country name', 'Country name', '2026-03-27 11:09:22', '2026-03-27 11:09:22'),
(6116, 'spanish', 'Choose country thumbnail', 'Choose country thumbnail', '2026-03-27 11:09:22', '2026-03-27 11:09:22'),
(6117, 'spanish', 'optional', 'optional', '2026-03-27 11:09:22', '2026-03-27 11:09:22'),
(6118, 'spanish', 'City name', 'City name', '2026-03-27 11:09:31', '2026-03-27 11:09:31'),
(6119, 'spanish', 'Enter City Name', 'Enter City Name', '2026-03-27 11:09:31', '2026-03-27 11:09:31'),
(6120, 'spanish', 'Select Country Name', 'Select Country Name', '2026-03-27 11:09:31', '2026-03-27 11:09:31'),
(6121, 'spanish', 'City Image', 'City Image', '2026-03-27 11:09:31', '2026-03-27 11:09:31'),
(6122, 'spanish', 'City added successfully!', 'City added successfully!', '2026-03-27 11:10:27', '2026-03-27 11:10:27'),
(6123, 'spanish', 'Amenities Create', 'Amenities Create', '2026-03-27 12:04:35', '2026-03-27 12:04:35'),
(6124, 'spanish', 'Add', 'Add', '2026-03-27 12:04:35', '2026-03-27 12:04:35'),
(6125, 'spanish', 'Amenities List', 'Amenities List', '2026-03-27 12:04:35', '2026-03-27 12:04:35'),
(6126, 'spanish', 'Update Amenities', 'Update Amenities', '2026-03-27 12:04:35', '2026-03-27 12:04:35'),
(6127, 'spanish', 'Create Notification', 'Create Notification', '2026-03-30 05:04:15', '2026-03-30 05:04:15'),
(6128, 'spanish', 'Edit Notifications', 'Edit Notifications', '2026-03-30 05:04:18', '2026-03-30 05:04:18'),
(6129, 'spanish', 'Create Notifications', 'Create Notifications', '2026-03-30 05:04:55', '2026-03-30 05:04:55'),
(6130, 'spanish', 'mycrm', 'mycrm', '2026-03-30 05:32:56', '2026-03-30 05:32:56'),
(6131, 'spanish', 'Listify Free', 'Listify Free', '2026-03-30 06:48:24', '2026-03-30 06:48:24'),
(6132, 'spanish', 'Listing price', 'Listing price', '2026-03-30 07:12:45', '2026-03-30 07:12:45'),
(6133, 'spanish', 'Enter listing price', 'Enter listing price', '2026-03-30 07:12:45', '2026-03-30 07:12:45'),
(6134, 'spanish', 'Bed number', 'Bed number', '2026-03-30 07:12:45', '2026-03-30 07:12:45'),
(6135, 'spanish', 'Enter bed number', 'Enter bed number', '2026-03-30 07:12:45', '2026-03-30 07:12:45'),
(6136, 'spanish', 'Bath number', 'Bath number', '2026-03-30 07:12:45', '2026-03-30 07:12:45'),
(6137, 'spanish', 'Enter bath number', 'Enter bath number', '2026-03-30 07:12:45', '2026-03-30 07:12:45'),
(6138, 'spanish', 'Floor Size', 'Floor Size', '2026-03-30 07:12:46', '2026-03-30 07:12:46'),
(6139, 'spanish', 'Enter floor size', 'Enter floor size', '2026-03-30 07:12:46', '2026-03-30 07:12:46'),
(6140, 'spanish', 'Dimension', 'Dimension', '2026-03-30 07:12:46', '2026-03-30 07:12:46'),
(6141, 'spanish', 'Enter property dimension', 'Enter property dimension', '2026-03-30 07:12:46', '2026-03-30 07:12:46'),
(6142, 'spanish', 'Payment', 'Payment', '2026-03-30 11:22:01', '2026-03-30 11:22:01'),
(6143, 'spanish', 'Payment Gateways List', 'Payment Gateways List', '2026-03-30 11:22:01', '2026-03-30 11:22:01'),
(6144, 'spanish', 'Currency', 'Currency', '2026-03-30 11:22:01', '2026-03-30 11:22:01'),
(6145, 'spanish', 'Change Status', 'Change Status', '2026-03-30 11:22:01', '2026-03-30 11:22:01'),
(6146, 'spanish', 'Package name', 'Package name', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6147, 'spanish', 'Amenities icon', 'Amenities icon', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6148, 'spanish', 'Package sub title', 'Package sub title', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6149, 'spanish', 'Package Price', 'Package Price', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6150, 'spanish', 'Package Period', 'Package Period', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6151, 'spanish', 'Monthly', 'Monthly', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6152, 'spanish', 'Semi Annually', 'Semi Annually', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6153, 'spanish', 'Listing Number', 'Listing Number', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6154, 'spanish', 'Category Number', 'Category Number', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6155, 'spanish', 'Unavailable', 'Unavailable', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6156, 'spanish', 'Listings Video', 'Listings Video', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6157, 'spanish', 'Best Choice', 'Best Choice', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6158, 'spanish', 'No', 'No', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6159, 'spanish', 'Yes', 'Yes', '2026-03-30 11:22:24', '2026-03-30 11:22:24'),
(6160, 'hindi', 'Package delete successfully!', 'Package delete successfully!', '2026-03-30 11:22:49', '2026-03-30 11:22:49'),
(6161, 'spanish', 'Package delete successfully!', 'Package delete successfully!', '2026-03-30 11:22:49', '2026-03-30 11:22:49'),
(6162, 'spanish', 'Enter package name', 'Enter package name', '2026-03-30 11:31:36', '2026-03-30 11:31:36'),
(6163, 'spanish', 'Pick an Icon', 'Pick an Icon', '2026-03-30 11:31:36', '2026-03-30 11:31:36'),
(6164, 'spanish', 'Enter sub title', 'Enter sub title', '2026-03-30 11:31:36', '2026-03-30 11:31:36'),
(6165, 'spanish', 'Enter listing number', 'Enter listing number', '2026-03-30 11:31:36', '2026-03-30 11:31:36'),
(6166, 'spanish', 'Enter category number', 'Enter category number', '2026-03-30 11:31:36', '2026-03-30 11:31:36'),
(6167, 'english', 'Business Services Listing', 'Business Services Listing', '2026-04-02 09:01:21', '2026-04-02 09:01:21'),
(6168, 'hindi', 'Business Services Listing', 'Business Services Listing', '2026-04-02 09:01:21', '2026-04-02 09:01:21'),
(6169, 'spanish', 'Business Services Listing', 'Business Services Listing', '2026-04-02 09:01:21', '2026-04-02 09:01:21'),
(6170, 'english', 'Travel Tourism Listing', 'Travel Tourism Listing', '2026-04-02 09:01:21', '2026-04-02 09:01:21'),
(6171, 'hindi', 'Travel Tourism Listing', 'Travel Tourism Listing', '2026-04-02 09:01:21', '2026-04-02 09:01:21'),
(6172, 'spanish', 'Travel Tourism Listing', 'Travel Tourism Listing', '2026-04-02 09:01:21', '2026-04-02 09:01:21'),
(6173, 'english', 'Healthcare Services Listing', 'Healthcare Services Listing', '2026-04-02 09:01:21', '2026-04-02 09:01:21'),
(6174, 'hindi', 'Healthcare Services Listing', 'Healthcare Services Listing', '2026-04-02 09:01:21', '2026-04-02 09:01:21'),
(6175, 'spanish', 'Healthcare Services Listing', 'Healthcare Services Listing', '2026-04-02 09:01:21', '2026-04-02 09:01:21'),
(6176, 'spanish', 'Listing Create Form', 'Listing Create Form', '2026-04-02 09:01:27', '2026-04-02 09:01:27'),
(6177, 'spanish', 'Get lat & Long', 'Get lat & Long', '2026-04-02 09:01:28', '2026-04-02 09:01:28'),
(6178, 'spanish', 'State/City', 'State/City', '2026-04-02 09:01:29', '2026-04-02 09:01:29'),
(6179, 'spanish', 'Select listing state/city', 'Select listing state/city', '2026-04-02 09:01:29', '2026-04-02 09:01:29'),
(6180, 'spanish', 'Pincode', 'Pincode', '2026-04-02 09:01:29', '2026-04-02 09:01:29'),
(6181, 'spanish', 'Enter Pincode', 'Enter Pincode', '2026-04-02 09:01:29', '2026-04-02 09:01:29'),
(6182, 'spanish', 'Select listing brand', 'Select listing brand', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6183, 'spanish', 'Select listing model', 'Select listing model', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6184, 'spanish', 'Select listing year', 'Select listing year', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6185, 'spanish', 'Select listing car type', 'Select listing car type', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6186, 'spanish', 'Transmission', 'Transmission', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6187, 'spanish', 'Select listing transmission', 'Select listing transmission', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6188, 'spanish', 'Fuel Type', 'Fuel Type', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6189, 'spanish', 'Select listing fuel_type', 'Select listing fuel_type', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6190, 'spanish', 'Cylinder', 'Cylinder', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6191, 'spanish', 'Select listing cylinder', 'Select listing cylinder', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6192, 'spanish', 'Interior Color', 'Interior Color', '2026-04-02 09:06:25', '2026-04-02 09:06:25'),
(6193, 'spanish', 'Select listing interior color', 'Select listing interior color', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6194, 'spanish', 'Exterior Color', 'Exterior Color', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6195, 'spanish', 'Select listing exterior color', 'Select listing exterior color', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6196, 'spanish', 'Drive Train', 'Drive Train', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6197, 'spanish', 'Select listing drive train', 'Select listing drive train', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6198, 'spanish', 'Trim', 'Trim', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6199, 'spanish', 'Select listing trim', 'Select listing trim', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6200, 'spanish', 'Engine size', 'Engine size', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6201, 'spanish', 'Mileage', 'Mileage', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6202, 'spanish', '00', '00', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6203, 'spanish', 'Vin', 'Vin', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6204, 'spanish', '4jh45ed4', '4jh45ed4', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6205, 'spanish', '00.00', '00.00', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6206, 'spanish', 'Discount Price', 'Discount Price', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6207, 'spanish', 'New', 'New', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6208, 'spanish', 'Used', 'Used', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6209, 'spanish', '0', '0', '2026-04-02 09:06:26', '2026-04-02 09:06:26'),
(6210, 'spanish', 'Category update successful!', 'Category update successful!', '2026-04-03 06:31:51', '2026-04-03 06:31:51'),
(6211, 'spanish', 'Select payment gateway', 'Select payment gateway', '2026-04-03 08:37:13', '2026-04-03 08:37:13'),
(6212, 'spanish', 'Pay by Razorpay', 'Pay by Razorpay', '2026-04-03 08:37:23', '2026-04-03 08:37:23'),
(6213, 'hindi', 'Specification', 'Specification', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6214, 'spanish', 'Specification', 'Specification', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6215, 'hindi', 'Listing sub title', 'Listing sub title', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6216, 'spanish', 'Listing sub title', 'Listing sub title', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6217, 'hindi', 'Enter listing sub title', 'Enter listing sub title', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6218, 'spanish', 'Enter listing sub title', 'Enter listing sub title', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6219, 'hindi', 'Engin_size', 'Engin_size', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6220, 'spanish', 'Engin_size', 'Engin_size', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6221, 'spanish', 'Featured', 'Featured', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6222, 'hindi', 'Add some listing specification', 'Add some listing specification', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6223, 'spanish', 'Add some listing specification', 'Add some listing specification', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6224, 'hindi', 'Add New Specification', 'Add New Specification', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6225, 'spanish', 'Add New Specification', 'Add New Specification', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6226, 'hindi', 'Add Specification', 'Add Specification', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6227, 'spanish', 'Add Specification', 'Add Specification', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6228, 'hindi', 'Add some listing features', 'Add some listing features', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6229, 'spanish', 'Add some listing features', 'Add some listing features', '2026-04-03 10:10:52', '2026-04-03 10:10:52'),
(6230, 'spanish', 'Credentials Update', 'Credentials Update', '2026-04-04 07:13:50', '2026-04-04 07:13:50'),
(6231, 'spanish', 'Rooms', 'Rooms', '2026-04-04 11:16:02', '2026-04-04 11:16:02'),
(6232, 'spanish', 'Add some Room', 'Add some Room', '2026-04-04 11:16:04', '2026-04-04 11:16:04'),
(6233, 'spanish', 'Add New Room', 'Add New Room', '2026-04-04 11:16:04', '2026-04-04 11:16:04'),
(6234, 'spanish', 'Add Room', 'Add Room', '2026-04-04 11:16:04', '2026-04-04 11:16:04'),
(6235, 'english', 'Automobile', 'Automobile', '2026-04-06 05:21:52', '2026-04-06 05:21:52'),
(6236, 'hindi', 'Automobile', 'Automobile', '2026-04-06 05:21:52', '2026-04-06 05:21:52'),
(6237, 'spanish', 'Automobile', 'Automobile', '2026-04-06 05:21:52', '2026-04-06 05:21:52'),
(6238, 'spanish', 'Directory updated successfully!', 'Directory updated successfully!', '2026-04-06 05:26:53', '2026-04-06 05:26:53'),
(6239, 'english', 'Automobile Listing', 'Automobile Listing', '2026-04-06 05:27:02', '2026-04-06 05:27:02'),
(6240, 'hindi', 'Automobile Listing', 'Automobile Listing', '2026-04-06 05:27:02', '2026-04-06 05:27:02'),
(6241, 'spanish', 'Automobile Listing', 'Automobile Listing', '2026-04-06 05:27:02', '2026-04-06 05:27:02'),
(6242, 'hindi', 'Feature title', 'Feature title', '2026-04-07 04:21:46', '2026-04-07 04:21:46'),
(6243, 'spanish', 'Feature title', 'Feature title', '2026-04-07 04:21:46', '2026-04-07 04:21:46'),
(6244, 'hindi', 'Enter title', 'Enter title', '2026-04-07 04:21:46', '2026-04-07 04:21:46'),
(6245, 'spanish', 'Enter title', 'Enter title', '2026-04-07 04:21:46', '2026-04-07 04:21:46'),
(6246, 'hindi', 'Room Title', 'Room Title', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6247, 'spanish', 'Room Title', 'Room Title', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6248, 'hindi', 'Enter room title', 'Enter room title', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6249, 'spanish', 'Enter room title', 'Enter room title', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6250, 'hindi', 'Number of persons', 'Number of persons', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6251, 'spanish', 'Number of persons', 'Number of persons', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6252, 'hindi', 'Enter number of person', 'Enter number of person', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6253, 'spanish', 'Enter number of person', 'Enter number of person', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6254, 'hindi', 'Number of Child', 'Number of Child', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6255, 'spanish', 'Number of Child', 'Number of Child', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6256, 'hindi', 'Enter number of child', 'Enter number of child', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6257, 'spanish', 'Enter number of child', 'Enter number of child', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6258, 'hindi', 'Room Price', 'Room Price', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6259, 'spanish', 'Room Price', 'Room Price', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6260, 'hindi', 'Enter room price', 'Enter room price', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6261, 'spanish', 'Enter room price', 'Enter room price', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6262, 'hindi', 'Room Images', 'Room Images', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6263, 'spanish', 'Room Images', 'Room Images', '2026-04-07 04:22:34', '2026-04-07 04:22:34'),
(6264, 'spanish', 'Text', 'Text', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6265, 'spanish', 'Slider', 'Slider', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6266, 'spanish', 'FAQ', 'FAQ', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6267, 'spanish', 'Gallery', 'Gallery', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6268, 'spanish', 'Section Title', 'Section Title', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6269, 'spanish', 'Text Content', 'Text Content', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6270, 'spanish', 'Images', 'Images', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6271, 'spanish', 'Video URL', 'Video URL', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6272, 'spanish', 'FAQ Question', 'FAQ Question', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6273, 'spanish', 'FAQ Answer', 'FAQ Answer', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6274, 'spanish', 'Gallery Image', 'Gallery Image', '2026-04-07 04:22:59', '2026-04-07 04:22:59'),
(6275, 'spanish', 'Amenities Name', 'Amenities Name', '2026-04-07 04:31:59', '2026-04-07 04:31:59'),
(6276, 'spanish', 'Enter name', 'Enter name', '2026-04-07 04:31:59', '2026-04-07 04:31:59'),
(6277, 'spanish', 'Amenities Image', 'Amenities Image', '2026-04-07 04:31:59', '2026-04-07 04:31:59'),
(6278, 'spanish', 'upload a image', 'upload a image', '2026-04-07 04:31:59', '2026-04-07 04:31:59'),
(6279, 'spanish', 'Enter Discount price in %', 'Enter Discount price in %', '2026-04-07 05:23:16', '2026-04-07 05:23:16'),
(6280, 'spanish', 'Additional Information', 'Additional Information', '2026-04-07 05:23:16', '2026-04-07 05:23:16'),
(6281, 'spanish', 'Additional Information must not exceed 73 characters.', 'Additional Information must not exceed 73 characters.', '2026-04-07 05:23:16', '2026-04-07 05:23:16'),
(6282, 'spanish', 'Enter Feature  Name', 'Enter Feature  Name', '2026-04-07 05:23:16', '2026-04-07 05:23:16'),
(6283, 'spanish', 'Listing Discount price', 'Listing Discount price', '2026-04-07 07:42:50', '2026-04-07 07:42:50'),
(6284, 'spanish', 'Enter discount price', 'Enter discount price', '2026-04-07 07:42:50', '2026-04-07 07:42:50'),
(6285, 'spanish', 'Enter garage', 'Enter garage', '2026-04-07 07:42:50', '2026-04-07 07:42:50'),
(6286, 'spanish', 'Enter year', 'Enter year', '2026-04-07 07:42:50', '2026-04-07 07:42:50'),
(6287, 'spanish', 'Sub Dimension', 'Sub Dimension', '2026-04-07 07:42:50', '2026-04-07 07:42:50'),
(6288, 'spanish', 'Enter property sub dimension', 'Enter property sub dimension', '2026-04-07 07:42:50', '2026-04-07 07:42:50'),
(6289, 'spanish', 'Data Added successfully!', 'Data Added successfully!', '2026-04-07 09:41:39', '2026-04-07 09:41:39'),
(6290, 'spanish', 'Pay', 'Pay', '2026-04-07 11:27:15', '2026-04-07 11:27:15'),
(6291, 'spanish', 'Product Details', 'Product Details', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6292, 'spanish', 'Amount to Pay', 'Amount to Pay', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6293, 'spanish', 'Delivered Details', 'Delivered Details', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6294, 'spanish', 'Date', 'Date', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6295, 'spanish', 'Type : ', 'Type : ', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6296, 'spanish', 'Amount Pay : ', 'Amount Pay : ', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6297, 'spanish', 'Status : ', 'Status : ', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6298, 'spanish', 'Paid', 'Paid', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6299, 'spanish', 'Contact : ', 'Contact : ', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6300, 'spanish', 'Address : ', 'Address : ', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6301, 'spanish', 'Delivered', 'Delivered', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6302, 'spanish', 'Delivered at  : ', 'Delivered at  : ', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6303, 'spanish', 'Download Invoice', 'Download Invoice', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6304, 'spanish', 'Unpaid', 'Unpaid', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6305, 'spanish', 'Not Delivered', 'Not Delivered', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6306, 'spanish', 'Order placed at : ', 'Order placed at : ', '2026-04-08 05:59:07', '2026-04-08 05:59:07'),
(6307, 'hindi', 'Car Listing Details', 'Car Listing Details', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6308, 'spanish', 'Car Listing Details', 'Car Listing Details', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6309, 'hindi', 'Cars', 'Cars', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6310, 'spanish', 'Cars', 'Cars', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6311, 'hindi', 'Car Details', 'Car Details', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6312, 'spanish', 'Car Details', 'Car Details', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6313, 'hindi', 'View all photos', 'View all photos', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6314, 'spanish', 'View all photos', 'View all photos', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6315, 'hindi', 'Overview', 'Overview', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6316, 'spanish', 'Overview', 'Overview', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6317, 'hindi', 'Condition', 'Condition', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6318, 'spanish', 'Condition', 'Condition', '2026-04-08 06:49:14', '2026-04-08 06:49:14'),
(6319, 'hindi', 'Amenities Created Successful!', 'Amenities Created Successful!', '2026-04-08 06:58:17', '2026-04-08 06:58:17'),
(6320, 'spanish', 'Amenities Created Successful!', 'Amenities Created Successful!', '2026-04-08 06:58:17', '2026-04-08 06:58:17'),
(6321, 'hindi', 'Your review was successfully submitted!', 'Your review was successfully submitted!', '2026-04-20 05:27:22', '2026-04-20 05:27:22'),
(6322, 'spanish', 'Your review was successfully submitted!', 'Your review was successfully submitted!', '2026-04-20 05:27:22', '2026-04-20 05:27:22'),
(6323, 'hindi', 'Update Reviews', 'Update Reviews', '2026-04-20 05:27:22', '2026-04-20 05:27:22'),
(6324, 'spanish', 'Update Reviews', 'Update Reviews', '2026-04-20 05:27:22', '2026-04-20 05:27:22'),
(6325, 'hindi', 'Reply Review', 'Reply Review', '2026-04-20 05:27:22', '2026-04-20 05:27:22'),
(6326, 'spanish', 'Reply Review', 'Reply Review', '2026-04-20 05:27:22', '2026-04-20 05:27:22'),
(6327, 'hindi', 'Review*', 'Review*', '2026-04-20 05:27:22', '2026-04-20 05:27:22'),
(6328, 'spanish', 'Review*', 'Review*', '2026-04-20 05:27:22', '2026-04-20 05:27:22'),
(6329, 'hindi', 'Close', 'Close', '2026-04-20 05:27:22', '2026-04-20 05:27:22'),
(6330, 'spanish', 'Close', 'Close', '2026-04-20 05:27:23', '2026-04-20 05:27:23'),
(6331, 'hindi', 'Update Your Review', 'Update Your Review', '2026-04-20 05:27:23', '2026-04-20 05:27:23'),
(6332, 'spanish', 'Update Your Review', 'Update Your Review', '2026-04-20 05:27:23', '2026-04-20 05:27:23'),
(6333, 'hindi', 'Your review was update successfully!', 'Your review was update successfully!', '2026-04-20 05:27:58', '2026-04-20 05:27:58'),
(6334, 'spanish', 'Your review was update successfully!', 'Your review was update successfully!', '2026-04-20 05:27:58', '2026-04-20 05:27:58'),
(6335, 'spanish', 'Beauty List', 'Beauty List', '2026-04-29 10:49:35', '2026-04-29 10:49:35'),
(6336, 'spanish', 'Add New agent', 'Add New agent', '2026-05-05 07:39:50', '2026-05-05 07:39:50'),
(6337, 'spanish', 'Edit User', 'Edit User', '2026-05-05 07:39:50', '2026-05-05 07:39:50'),
(6338, 'spanish', 'Agent Appointment', 'Agent Appointment', '2026-05-05 07:50:13', '2026-05-05 07:50:13'),
(6339, 'english', 'Listify Package', 'Listify Package', '2026-05-05 07:52:50', '2026-05-05 07:52:50'),
(6340, 'hindi', 'Listify Package', 'Listify Package', '2026-05-05 07:52:50', '2026-05-05 07:52:50'),
(6341, 'spanish', 'Listify Package', 'Listify Package', '2026-05-05 07:52:50', '2026-05-05 07:52:50'),
(6342, 'english', 'Free 2 Months when you paid Yearly', 'Free 2 Months when you paid Yearly', '2026-05-05 07:52:50', '2026-05-05 07:52:50'),
(6343, 'hindi', 'Free 2 Months when you paid Yearly', 'Free 2 Months when you paid Yearly', '2026-05-05 07:52:50', '2026-05-05 07:52:50'),
(6344, 'spanish', 'Free 2 Months when you paid Yearly', 'Free 2 Months when you paid Yearly', '2026-05-05 07:52:50', '2026-05-05 07:52:50'),
(6345, 'spanish', 'Claimed Listings', 'Claimed Listings', '2026-05-05 07:56:01', '2026-05-05 07:56:01'),
(6346, 'spanish', 'List of Order Manager', 'List of Order Manager', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6347, 'spanish', 'Pending Orders', 'Pending Orders', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6348, 'spanish', 'Customer name', 'Customer name', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6349, 'spanish', 'Order placed At', 'Order placed At', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6350, 'spanish', 'Product Type : ', 'Product Type : ', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6351, 'spanish', 'Amount : ', 'Amount : ', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6352, 'spanish', ' Status : ', ' Status : ', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6353, 'spanish', 'Note : ', 'Note : ', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6354, 'spanish', 'Mark as Paid', 'Mark as Paid', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6355, 'spanish', 'Mark as Delivered', 'Mark as Delivered', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6356, 'spanish', 'Order Delivered At', 'Order Delivered At', '2026-05-05 07:56:26', '2026-05-05 07:56:26'),
(6357, 'spanish', 'Registered successfully!', 'Registered successfully!', '2026-05-05 08:01:25', '2026-05-05 08:01:25'),
(6358, 'hindi', '', '', '2026-05-05 09:23:54', '2026-05-05 09:23:54'),
(6359, 'spanish', '', '', '2026-05-05 09:23:54', '2026-05-05 09:23:54'),
(6360, 'hindi', 'Enter Full Name', 'Enter Full Name', '2026-05-05 09:50:58', '2026-05-05 09:50:58'),
(6361, 'spanish', 'Enter Full Name', 'Enter Full Name', '2026-05-05 09:50:58', '2026-05-05 09:50:58'),
(6362, 'hindi', 'Enter Phone Number', 'Enter Phone Number', '2026-05-05 09:50:58', '2026-05-05 09:50:58'),
(6363, 'spanish', 'Enter Phone Number', 'Enter Phone Number', '2026-05-05 09:50:58', '2026-05-05 09:50:58'),
(6364, 'hindi', 'Enter Additional Info', 'Enter Additional Info', '2026-05-05 09:50:58', '2026-05-05 09:50:58'),
(6365, 'spanish', 'Enter Additional Info', 'Enter Additional Info', '2026-05-05 09:50:58', '2026-05-05 09:50:58'),
(6366, 'spanish', 'Info Update', 'Info Update', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6367, 'spanish', 'User Full Name *', 'User Full Name *', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6368, 'spanish', 'Email Address *', 'Email Address *', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6369, 'spanish', 'Enter email', 'Enter email', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6370, 'spanish', 'Phone Number *', 'Phone Number *', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6371, 'spanish', 'Enter phone', 'Enter phone', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6372, 'spanish', 'Gender *', 'Gender *', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6373, 'spanish', 'Select Gender', 'Select Gender', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6374, 'spanish', 'Country *', 'Country *', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6375, 'spanish', 'Enter facebook link', 'Enter facebook link', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6376, 'spanish', 'City *', 'City *', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6377, 'spanish', 'Enter linkedin link', 'Enter linkedin link', '2026-05-05 09:51:42', '2026-05-05 09:51:42'),
(6378, 'spanish', 'Enter twitter link', 'Enter twitter link', '2026-05-05 09:51:43', '2026-05-05 09:51:43'),
(6379, 'spanish', 'Info', 'Info', '2026-05-05 09:51:57', '2026-05-05 09:51:57'),
(6380, 'spanish', 'Password *', 'Password *', '2026-05-05 09:51:57', '2026-05-05 09:51:57'),
(6381, 'spanish', 'Enter password', 'Enter password', '2026-05-05 09:51:57', '2026-05-05 09:51:57'),
(6382, 'spanish', 'Confirm Password *', 'Confirm Password *', '2026-05-05 09:51:57', '2026-05-05 09:51:57'),
(6383, 'spanish', 'Search Contact', 'Search Contact', '2026-05-05 09:52:23', '2026-05-05 09:52:23'),
(6384, 'spanish', 'Reply', 'Reply', '2026-05-05 09:52:23', '2026-05-05 09:52:23'),
(6385, 'spanish', 'Options', 'Options', '2026-05-05 09:52:23', '2026-05-05 09:52:23'),
(6386, 'spanish', 'Not Registered', 'Not Registered', '2026-05-05 09:52:23', '2026-05-05 09:52:23'),
(6387, 'spanish', 'Registered User', 'Registered User', '2026-05-05 09:52:23', '2026-05-05 09:52:23'),
(6388, 'spanish', 'data', 'data', '2026-05-05 09:52:24', '2026-05-05 09:52:24'),
(6389, 'english', 'All fields are required!', 'All fields are required!', '2026-05-05 10:08:16', '2026-05-05 10:08:16'),
(6390, 'hindi', 'All fields are required!', 'All fields are required!', '2026-05-05 10:08:16', '2026-05-05 10:08:16'),
(6391, 'spanish', 'All fields are required!', 'All fields are required!', '2026-05-05 10:08:16', '2026-05-05 10:08:16'),
(6392, 'spanish', 'Newsletter Subscribe successfully', 'Newsletter Subscribe successfully', '2026-05-06 05:36:23', '2026-05-06 05:36:23'),
(6393, 'spanish', 'following', 'following', '2026-05-06 06:11:30', '2026-05-06 06:11:30'),
(6394, 'spanish', 'Messages', 'Messages', '2026-05-06 06:11:35', '2026-05-06 06:11:35'),
(6395, 'spanish', 'Inbox is Empty', 'Inbox is Empty', '2026-05-06 06:11:35', '2026-05-06 06:11:35'),
(6396, 'spanish', 'No Messages Yet.', 'No Messages Yet.', '2026-05-06 06:11:35', '2026-05-06 06:11:35'),
(6397, 'spanish', 'It seems you haven\'t start conversion', 'It seems you haven\'t start conversion', '2026-05-06 06:11:35', '2026-05-06 06:11:35'),
(6398, 'spanish', ' with any of our professionals yet!', ' with any of our professionals yet!', '2026-05-06 06:11:35', '2026-05-06 06:11:35'),
(6399, 'spanish', 'Invoice', 'Invoice', '2026-05-06 06:11:39', '2026-05-06 06:11:39'),
(6400, 'spanish', 'Add Invoice', 'Add Invoice', '2026-05-06 06:11:39', '2026-05-06 06:11:39'),
(6401, 'spanish', 'No invoice found. Please create one.', 'No invoice found. Please create one.', '2026-05-06 06:11:39', '2026-05-06 06:11:39'),
(6402, 'hindi', 'Subscription Renew', 'Subscription Renew', '2026-05-06 06:12:54', '2026-05-06 06:12:54'),
(6403, 'spanish', 'Subscription Renew', 'Subscription Renew', '2026-05-06 06:12:54', '2026-05-06 06:12:54'),
(6404, 'hindi', 'Billing Information', 'Billing Information', '2026-05-06 06:12:54', '2026-05-06 06:12:54'),
(6405, 'spanish', 'Billing Information', 'Billing Information', '2026-05-06 06:12:54', '2026-05-06 06:12:54'),
(6406, 'spanish', 'Lorem Ipsum available but the majority have suffered alteration', 'Lorem Ipsum available but the majority have suffered alteration', '2026-05-06 06:12:54', '2026-05-06 06:12:54'),
(6407, 'hindi', 'Billing Email', 'Billing Email', '2026-05-06 06:12:54', '2026-05-06 06:12:54'),
(6408, 'spanish', 'Billing Email', 'Billing Email', '2026-05-06 06:12:54', '2026-05-06 06:12:54'),
(6409, 'english', 'Spanish', 'Spanish', '2026-05-08 06:56:14', '2026-05-08 06:56:14'),
(6410, 'hindi', 'Spanish', 'Spanish', '2026-05-08 06:56:14', '2026-05-08 06:56:14'),
(6411, 'english', 'Customer : ', 'Customer : ', '2026-05-08 10:30:13', '2026-05-08 10:30:13'),
(6412, 'hindi', 'Customer : ', 'Customer : ', '2026-05-08 10:30:13', '2026-05-08 10:30:13'),
(6413, 'spanish', 'Customer : ', 'Customer : ', '2026-05-08 10:30:13', '2026-05-08 10:30:13'),
(6414, 'english', 'Mark as incomplete', 'Mark as incomplete', '2026-05-08 10:30:13', '2026-05-08 10:30:13'),
(6415, 'hindi', 'Mark as incomplete', 'Mark as incomplete', '2026-05-08 10:30:13', '2026-05-08 10:30:13'),
(6416, 'spanish', 'Mark as incomplete', 'Mark as incomplete', '2026-05-08 10:30:13', '2026-05-08 10:30:13'),
(6417, 'english', 'Join Meeting', 'Join Meeting', '2026-05-08 10:30:13', '2026-05-08 10:30:13'),
(6418, 'hindi', 'Join Meeting', 'Join Meeting', '2026-05-08 10:30:13', '2026-05-08 10:30:13'),
(6419, 'spanish', 'Join Meeting', 'Join Meeting', '2026-05-08 10:30:13', '2026-05-08 10:30:13'),
(6420, 'english', 'What people Think About Us', 'What people Think About Us', '2026-05-13 09:04:00', '2026-05-13 09:04:00'),
(6421, 'hindi', 'What people Think About Us', 'What people Think About Us', '2026-05-13 09:04:00', '2026-05-13 09:04:00'),
(6422, 'spanish', 'What people Think About Us', 'What people Think About Us', '2026-05-13 09:04:00', '2026-05-13 09:04:00'),
(6423, 'english', 'Invoice no :', 'Invoice no :', '2026-05-13 12:35:23', '2026-05-13 12:35:23'),
(6424, 'hindi', 'Invoice no :', 'Invoice no :', '2026-05-13 12:35:23', '2026-05-13 12:35:23'),
(6425, 'spanish', 'Invoice no :', 'Invoice no :', '2026-05-13 12:35:23', '2026-05-13 12:35:23'),
(6426, 'english', 'Date :', 'Date :', '2026-05-13 12:35:23', '2026-05-13 12:35:23'),
(6427, 'hindi', 'Date :', 'Date :', '2026-05-13 12:35:23', '2026-05-13 12:35:23'),
(6428, 'spanish', 'Date :', 'Date :', '2026-05-13 12:35:23', '2026-05-13 12:35:23'),
(6429, 'english', 'Browse Top Categories , Featured Listings', 'Browse Top Categories , Featured Listings', '2026-05-15 09:18:26', '2026-05-15 09:18:26'),
(6430, 'hindi', 'Browse Top Categories , Featured Listings', 'Browse Top Categories , Featured Listings', '2026-05-15 09:18:26', '2026-05-15 09:18:26'),
(6431, 'spanish', 'Browse Top Categories , Featured Listings', 'Browse Top Categories , Featured Listings', '2026-05-15 09:18:26', '2026-05-15 09:18:26'),
(6432, 'english', 'You are already subscribed!', 'You are already subscribed!', '2026-05-15 10:13:17', '2026-05-15 10:13:17'),
(6433, 'hindi', 'You are already subscribed!', 'You are already subscribed!', '2026-05-15 10:13:17', '2026-05-15 10:13:17'),
(6434, 'spanish', 'You are already subscribed!', 'You are already subscribed!', '2026-05-15 10:13:17', '2026-05-15 10:13:17'),
(6435, 'english', 'Distance from your location', 'Distance from your location', '2026-06-08 08:23:01', '2026-06-08 08:23:01'),
(6436, 'hindi', 'Distance from your location', 'Distance from your location', '2026-06-08 08:23:01', '2026-06-08 08:23:01'),
(6437, 'spanish', 'Distance from your location', 'Distance from your location', '2026-06-08 08:23:01', '2026-06-08 08:23:01'),
(6438, 'english', 'Promote your business and get discovered with ease, the smart directory solution.', 'Promote your business and get discovered with ease, the smart directory solution.', '2026-06-10 09:06:34', '2026-06-10 09:06:34'),
(6439, 'hindi', 'Promote your business and get discovered with ease, the smart directory solution.', 'Promote your business and get discovered with ease, the smart directory solution.', '2026-06-10 09:06:34', '2026-06-10 09:06:34'),
(6440, 'spanish', 'Promote your business and get discovered with ease, the smart directory solution.', 'Promote your business and get discovered with ease, the smart directory solution.', '2026-06-10 09:06:34', '2026-06-10 09:06:34'),
(6441, 'english', 'Edit Agencies Listing Frontend Settings', 'Edit Agencies Listing Frontend Settings', '2026-06-13 15:47:42', '2026-06-13 15:47:42'),
(6442, 'hindi', 'Edit Agencies Listing Frontend Settings', 'Edit Agencies Listing Frontend Settings', '2026-06-13 15:47:42', '2026-06-13 15:47:42'),
(6443, 'spanish', 'Edit Agencies Listing Frontend Settings', 'Edit Agencies Listing Frontend Settings', '2026-06-13 15:47:42', '2026-06-13 15:47:42'),
(6444, 'english', 'Enable Your Location', 'Enable Your Location', '2026-06-13 17:22:01', '2026-06-13 17:22:01'),
(6445, 'hindi', 'Enable Your Location', 'Enable Your Location', '2026-06-13 17:22:01', '2026-06-13 17:22:01'),
(6446, 'spanish', 'Enable Your Location', 'Enable Your Location', '2026-06-13 17:22:01', '2026-06-13 17:22:01'),
(6447, 'english', 'Allow location access to discover nearby listings, see accurate distances, and get results tailored to your area.', 'Allow location access to discover nearby listings, see accurate distances, and get results tailored to your area.', '2026-06-13 17:22:01', '2026-06-13 17:22:01'),
(6448, 'hindi', 'Allow location access to discover nearby listings, see accurate distances, and get results tailored to your area.', 'Allow location access to discover nearby listings, see accurate distances, and get results tailored to your area.', '2026-06-13 17:22:01', '2026-06-13 17:22:01'),
(6449, 'spanish', 'Allow location access to discover nearby listings, see accurate distances, and get results tailored to your area.', 'Allow location access to discover nearby listings, see accurate distances, and get results tailored to your area.', '2026-06-13 17:22:01', '2026-06-13 17:22:01'),
(6450, 'english', 'Allow Location', 'Allow Location', '2026-06-13 17:22:01', '2026-06-13 17:22:01'),
(6451, 'hindi', 'Allow Location', 'Allow Location', '2026-06-13 17:22:01', '2026-06-13 17:22:01'),
(6452, 'spanish', 'Allow Location', 'Allow Location', '2026-06-13 17:22:01', '2026-06-13 17:22:01'),
(6453, 'english', 'Not Now', 'Not Now', '2026-06-13 17:22:02', '2026-06-13 17:22:02'),
(6454, 'hindi', 'Not Now', 'Not Now', '2026-06-13 17:22:02', '2026-06-13 17:22:02'),
(6455, 'spanish', 'Not Now', 'Not Now', '2026-06-13 17:22:02', '2026-06-13 17:22:02'),
(6456, 'english', 'Add Shop', 'Add Shop', '2026-06-15 09:55:26', '2026-06-15 09:55:26'),
(6457, 'hindi', 'Add Shop', 'Add Shop', '2026-06-15 09:55:26', '2026-06-15 09:55:26'),
(6458, 'spanish', 'Add Shop', 'Add Shop', '2026-06-15 09:55:26', '2026-06-15 09:55:26');
INSERT INTO `languages` (`id`, `name`, `phrase`, `translated`, `created_at`, `updated_at`) VALUES
(6459, 'hindi', 'This listing is verified', 'This listing is verified', '2026-06-15 12:07:28', '2026-06-15 12:07:28'),
(6460, 'spanish', 'This listing is verified', 'This listing is verified', '2026-06-15 12:07:28', '2026-06-15 12:07:28'),
(6461, 'hindi', 'User deleted successfully!', 'User deleted successfully!', '2026-06-19 05:56:58', '2026-06-19 05:56:58'),
(6462, 'spanish', 'User deleted successfully!', 'User deleted successfully!', '2026-06-19 05:56:58', '2026-06-19 05:56:58'),
(6463, 'english', 'Order has been marked as Unpaid.', 'Order has been marked as Unpaid.', '2026-07-13 11:06:23', '2026-07-13 11:06:23'),
(6464, 'hindi', 'Order has been marked as Unpaid.', 'Order has been marked as Unpaid.', '2026-07-13 11:06:23', '2026-07-13 11:06:23'),
(6465, 'spanish', 'Order has been marked as Unpaid.', 'Order has been marked as Unpaid.', '2026-07-13 11:06:23', '2026-07-13 11:06:23'),
(6466, 'english', 'Edit Travel & Tourism Listing Frontend Settings', 'Edit Travel & Tourism Listing Frontend Settings', '2026-07-14 05:38:51', '2026-07-14 05:38:51'),
(6467, 'hindi', 'Edit Travel & Tourism Listing Frontend Settings', 'Edit Travel & Tourism Listing Frontend Settings', '2026-07-14 05:38:51', '2026-07-14 05:38:51'),
(6468, 'spanish', 'Edit Travel & Tourism Listing Frontend Settings', 'Edit Travel & Tourism Listing Frontend Settings', '2026-07-14 05:38:51', '2026-07-14 05:38:51'),
(6469, 'english', 'Edit Healthcare Services Listing Frontend Settings', 'Edit Healthcare Services Listing Frontend Settings', '2026-07-14 05:40:05', '2026-07-14 05:40:05'),
(6470, 'hindi', 'Edit Healthcare Services Listing Frontend Settings', 'Edit Healthcare Services Listing Frontend Settings', '2026-07-14 05:40:05', '2026-07-14 05:40:05'),
(6471, 'spanish', 'Edit Healthcare Services Listing Frontend Settings', 'Edit Healthcare Services Listing Frontend Settings', '2026-07-14 05:40:05', '2026-07-14 05:40:05'),
(6472, 'english', 'Edit Popular Services Listing Frontend Settings', 'Edit Popular Services Listing Frontend Settings', '2026-07-14 06:00:04', '2026-07-14 06:00:04'),
(6473, 'hindi', 'Edit Popular Services Listing Frontend Settings', 'Edit Popular Services Listing Frontend Settings', '2026-07-14 06:00:04', '2026-07-14 06:00:04'),
(6474, 'spanish', 'Edit Popular Services Listing Frontend Settings', 'Edit Popular Services Listing Frontend Settings', '2026-07-14 06:00:04', '2026-07-14 06:00:04'),
(6475, 'english', 'Edit Grooming Listing Frontend Settings', 'Edit Grooming Listing Frontend Settings', '2026-07-14 06:01:21', '2026-07-14 06:01:21'),
(6476, 'hindi', 'Edit Grooming Listing Frontend Settings', 'Edit Grooming Listing Frontend Settings', '2026-07-14 06:01:21', '2026-07-14 06:01:21'),
(6477, 'spanish', 'Edit Grooming Listing Frontend Settings', 'Edit Grooming Listing Frontend Settings', '2026-07-14 06:01:21', '2026-07-14 06:01:21'),
(6478, 'english', 'Edit Business Services Listing Frontend Settings', 'Edit Business Services Listing Frontend Settings', '2026-07-14 06:02:59', '2026-07-14 06:02:59'),
(6479, 'hindi', 'Edit Business Services Listing Frontend Settings', 'Edit Business Services Listing Frontend Settings', '2026-07-14 06:02:59', '2026-07-14 06:02:59'),
(6480, 'spanish', 'Edit Business Services Listing Frontend Settings', 'Edit Business Services Listing Frontend Settings', '2026-07-14 06:02:59', '2026-07-14 06:02:59');

-- --------------------------------------------------------

--
-- Table structure for table `listing__features`
--

CREATE TABLE `listing__features` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `listing_id` int NOT NULL,
  `feature_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `listing__specifications`
--

CREATE TABLE `listing__specifications` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `listing_id` int NOT NULL,
  `specification_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `listing_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dis_price` double DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` int NOT NULL,
  `message_thread_code` longtext,
  `message` longtext,
  `sender` longtext,
  `read_status` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `message_thread_code`, `message`, `sender`, `read_status`, `created_at`, `updated_at`) VALUES
(1, '80e1ac3fe0819df', 'test message', '4', 0, '2026-05-08 11:27:53', '2026-05-08 11:27:53'),
(2, '80e1ac3fe0819df', 'hrllo there', '4', 0, '2026-05-08 11:28:08', '2026-05-08 11:28:08'),
(3, '57943c569a0189c', 'Hello', '4', 1, '2026-05-08 11:33:40', '2026-05-12 09:51:03'),
(4, '57943c569a0189c', 'hello', '43', 1, '2026-05-08 11:33:55', '2026-07-07 09:18:17'),
(7, '5ba136512b7e88a', 'Hello i m Listify Asia', '22', 0, '2026-05-11 06:03:06', '2026-05-11 06:03:06'),
(8, '5ba136512b7e88a', 'Are Your here', '22', 0, '2026-05-11 06:04:08', '2026-05-11 06:04:08'),
(9, '5ba136512b7e88a', 'hii', '43', 0, '2026-05-11 06:15:58', '2026-05-11 06:15:58'),
(10, '5ba136512b7e88a', 'Hello Agent', '22', 0, '2026-05-11 06:22:28', '2026-05-11 06:22:28'),
(11, '5ba136512b7e88a', 'Hello Customer', '43', 0, '2026-05-11 06:23:39', '2026-05-11 06:23:39'),
(12, '57943c569a0189c', 'hello', '4', 1, '2026-05-12 06:43:35', '2026-05-12 09:51:03'),
(13, '57943c569a0189c', 'jello', '4', 1, '2026-05-12 06:51:14', '2026-05-12 09:51:03'),
(14, '80e1ac3fe0819df', 'hello', '4', 0, '2026-05-12 06:52:51', '2026-05-12 06:52:51'),
(15, '80e1ac3fe0819df', 'hello', '4', 0, '2026-05-12 06:52:53', '2026-05-12 06:52:53'),
(16, '80e1ac3fe0819df', '.', '4', 0, '2026-05-12 06:55:12', '2026-05-12 06:55:12'),
(17, '57943c569a0189c', '.', '4', 1, '2026-05-12 06:55:21', '2026-05-12 09:51:03'),
(18, '57943c569a0189c', 'hello', '4', 1, '2026-05-12 06:55:30', '2026-05-12 09:51:03'),
(19, '57943c569a0189c', '.', '4', 1, '2026-05-12 06:59:06', '2026-05-12 09:51:03'),
(20, '80e1ac3fe0819df', 'hlo', '4', 0, '2026-05-12 07:01:58', '2026-05-12 07:01:58'),
(21, '57943c569a0189c', '.', '4', 1, '2026-05-12 07:03:14', '2026-05-12 09:51:03'),
(22, '80e1ac3fe0819df', '.', '4', 0, '2026-05-12 07:05:36', '2026-05-12 07:05:36'),
(23, '57943c569a0189c', '.', '4', 1, '2026-05-12 07:05:53', '2026-05-12 09:51:03'),
(24, '57943c569a0189c', '.', '4', 1, '2026-05-12 07:10:27', '2026-05-12 09:51:03'),
(25, '57943c569a0189c', 'hello', '4', 1, '2026-05-12 07:13:00', '2026-05-12 09:51:03'),
(26, '80e1ac3fe0819df', 'hello', '4', 0, '2026-05-12 10:08:24', '2026-05-12 10:08:24'),
(27, '57943c569a0189c', 'hello', '4', 0, '2026-05-30 07:40:14', '2026-05-30 07:40:14'),
(28, '57943c569a0189c', 'Hello', '4', 0, '2026-06-02 06:26:15', '2026-06-02 06:26:15'),
(29, 'f3b94ed22409328', 'Hi', '50', 0, '2026-06-02 08:08:29', '2026-06-02 08:08:29'),
(30, '769bebded58677e', 'Hey', '4', 1, '2026-06-02 08:09:58', '2026-07-10 08:24:15'),
(31, '5b5333ce6148168', 'Hii', '52', 0, '2026-06-10 05:33:40', '2026-06-10 05:33:40'),
(32, '66475e64bd53bba', 'Hii', '52', 0, '2026-06-15 07:35:27', '2026-06-15 07:35:27'),
(33, '769bebded58677e', 'Checking', '50', 1, '2026-06-23 02:57:44', '2026-07-10 11:53:40'),
(34, '5b5333ce6148168', 'Hii', '52', 0, '2026-06-23 05:57:20', '2026-06-23 05:57:20'),
(35, 'f3b94ed22409328', 'C', '50', 0, '2026-06-23 07:40:45', '2026-06-23 07:40:45'),
(36, '769bebded58677e', 'Hii', '50', 1, '2026-06-23 07:44:40', '2026-07-10 11:53:40'),
(37, '769bebded58677e', 'Hello', '50', 1, '2026-06-23 07:44:45', '2026-07-10 11:53:40'),
(38, '769bebded58677e', 'Hii', '50', 1, '2026-06-23 07:46:33', '2026-07-10 11:53:40'),
(39, '769bebded58677e', 'Hii', '50', 1, '2026-06-23 07:47:53', '2026-07-10 11:53:40'),
(40, 'f3b94ed22409328', 'Hello', '50', 0, '2026-06-23 07:47:59', '2026-06-23 07:47:59'),
(41, 'f3b94ed22409328', 'Hii', '50', 0, '2026-06-23 07:52:45', '2026-06-23 07:52:45'),
(42, '769bebded58677e', 'Hii', '50', 1, '2026-06-23 07:52:52', '2026-07-10 11:53:40'),
(43, '769bebded58677e', 'Hello', '50', 1, '2026-06-23 07:53:05', '2026-07-10 11:53:40'),
(44, '769bebded58677e', 'Hii', '50', 1, '2026-06-23 07:53:10', '2026-07-10 11:53:40'),
(45, 'f3b94ed22409328', 'Hii', '50', 0, '2026-06-23 08:00:47', '2026-06-23 08:00:47'),
(46, '769bebded58677e', 'Hii', '50', 1, '2026-06-23 08:00:53', '2026-07-10 11:53:40'),
(47, '769bebded58677e', 'Testing', '50', 1, '2026-06-23 15:39:40', '2026-07-10 11:53:40'),
(48, '769bebded58677e', 'Hi', '4', 1, '2026-07-07 09:26:54', '2026-07-10 08:24:15'),
(49, '5b5333ce6148168', 'Hii', '52', 0, '2026-07-07 11:05:24', '2026-07-07 11:05:24'),
(50, '3e6fb4243e635ba', 'Hello', '49', 1, '2026-07-10 08:24:59', '2026-07-10 08:25:45'),
(51, '3e6fb4243e635ba', 'Hii', '50', 1, '2026-07-10 08:25:30', '2026-07-10 08:25:45'),
(52, '769bebded58677e', 'Hello', '4', 0, '2026-07-10 11:52:34', '2026-07-10 11:52:34'),
(53, '7d6fe27bc02e4a2', 'test', '43', 0, '2026-07-14 09:57:43', '2026-07-14 09:57:43'),
(54, '7d6fe27bc02e4a2', 'Test', '43', 0, '2026-07-14 09:57:53', '2026-07-14 09:57:53'),
(55, '7d6fe27bc02e4a2', 'hello', '43', 0, '2026-07-14 10:00:17', '2026-07-14 10:00:17');

-- --------------------------------------------------------

--
-- Table structure for table `message_thread`
--

CREATE TABLE `message_thread` (
  `message_thread_id` int NOT NULL,
  `message_thread_code` longtext,
  `sender` bigint UNSIGNED NOT NULL,
  `receiver` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `message_thread`
--

INSERT INTO `message_thread` (`message_thread_id`, `message_thread_code`, `sender`, `receiver`, `created_at`, `updated_at`) VALUES
(1, '80e1ac3fe0819df', 4, 1, '2026-05-08 11:27:53', '2026-05-08 11:27:53'),
(2, '57943c569a0189c', 4, 43, '2026-05-08 11:33:40', '2026-05-08 11:33:40'),
(4, '5ba136512b7e88a', 22, 43, '2026-05-11 06:03:06', '2026-05-11 06:03:06'),
(5, 'f3b94ed22409328', 50, 50, '2026-06-02 08:08:29', '2026-06-02 08:08:29'),
(6, '769bebded58677e', 4, 50, '2026-06-02 08:09:58', '2026-06-02 08:09:58'),
(7, '5b5333ce6148168', 52, 1, '2026-06-10 05:33:40', '2026-06-10 05:33:40'),
(8, '66475e64bd53bba', 52, 43, '2026-06-15 07:35:27', '2026-06-15 07:35:27'),
(9, '3e6fb4243e635ba', 49, 50, '2026-07-10 08:24:59', '2026-07-10 08:24:59'),
(10, '7d6fe27bc02e4a2', 43, 50, '2026-07-14 09:57:43', '2026-07-14 09:57:43');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_05_29_062523_create_categories_table', 1),
(5, '2024_06_03_103706_create_cities_table', 2),
(6, '2024_06_04_060707_create_blogs_table', 3),
(7, '2024_06_04_102457_create_blog_categories_table', 4),
(8, '2024_06_10_055010_create_car_listings_table', 5),
(9, '2024_06_10_061242_create_beauty_listings_table', 5),
(10, '2024_06_10_061308_create_real_estate_listings_table', 5),
(11, '2024_06_10_061343_create_hotel_listings_table', 5),
(12, '2024_06_10_061405_create_restaurant_listings_table', 5),
(13, '2024_06_10_074114_create_hotels_table', 5),
(14, '2024_06_10_074555_create_restaurants_table', 5),
(15, '2024_06_10_080627_create_amenities_table', 6),
(16, '2024_06_25_063412_create_listing__features_table', 7),
(17, '2024_06_25_095021_create_listing__specifications_table', 8),
(18, '2024_07_02_094655_create_rooms_table', 9),
(20, '2024_07_07_112000_create_menus_table', 10),
(21, '2024_07_09_053040_create_pricings_table', 11),
(22, '2024_07_16_103206_create_frontend_settings_table', 12),
(23, '2024_10_29_094121_create_appointments_table', 13);

-- --------------------------------------------------------

--
-- Table structure for table `nearby_location`
--

CREATE TABLE `nearby_location` (
  `id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `nearby_id` int DEFAULT NULL,
  `latitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `longitude` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `listing_id` bigint UNSIGNED NOT NULL,
  `listing_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `nearby_location`
--

INSERT INTO `nearby_location` (`id`, `type`, `name`, `nearby_id`, `latitude`, `longitude`, `listing_id`, `listing_type`, `created_at`, `updated_at`) VALUES
(1, 'hospital', 'Vinay Hospital', 1, '28.85552440072521', '77.09754280939352', 1, 'real-estate', '2025-10-01 10:39:12', '2025-10-01 10:39:12'),
(2, 'shopping_center', 'Tdi mall', 2, '28.6522° N', '77.1228° E', 1, 'real-estate', '2025-10-01 10:49:18', '2025-10-01 10:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` int NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `newsletter_subscribers`
--

CREATE TABLE `newsletter_subscribers` (
  `id` int NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `newsletter_subscribers`
--

INSERT INTO `newsletter_subscribers` (`id`, `email`, `created_at`, `updated_at`) VALUES
(1, 'thecorpmarvel@gmail.com', '2025-10-17 11:18:29', '2025-10-17 11:18:29'),
(2, 'chhabraravit@gmail.com', '2026-05-06 05:36:23', '2026-05-06 05:36:23'),
(3, 'davilsharma1999@gmail.com', '2026-05-15 10:13:15', '2026-05-15 10:13:15');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int NOT NULL,
  `user_id` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `media` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_general_ci,
  `read_on` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `status` enum('0','1') COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `user_id`, `media`, `title`, `description`, `read_on`, `created_at`, `status`, `updated_at`) VALUES
(2, '1', NULL, 'lorem ispum', 'Ullamco mollitia ill', '0', '2025-08-16 09:25:38', '1', '2025-08-18 07:19:46'),
(4, '5', NULL, 'Abhishek Notification', 'Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '0', '2025-08-18 09:15:59', '1', NULL),
(6, '3', NULL, 'abcd', 'test', '0', '2025-08-20 12:23:58', '1', NULL),
(7, '5', '1755694135.png', 'test', 'test', '0', '2025-08-20 12:39:55', '1', '2025-08-20 12:49:19'),
(8, '1', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '0', '2025-08-22 07:09:50', '1', NULL),
(9, '3', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '0', '2025-08-22 07:09:50', '1', NULL),
(10, '4', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '1', '2025-08-22 07:09:50', '1', NULL),
(12, '9', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '0', '2025-08-22 07:09:50', '1', NULL),
(14, '17', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '0', '2025-08-22 07:09:50', '1', NULL),
(15, '18', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '0', '2025-08-22 07:09:50', '1', NULL),
(16, '19', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '0', '2025-08-22 07:09:50', '1', NULL),
(17, '20', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '0', '2025-08-22 07:09:50', '1', NULL),
(18, '21', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '0', '2025-08-22 07:09:50', '1', NULL),
(19, '22', '1755846590.jpg', 'Testing notification 123', 'Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123 Testing notification 123', '1', '2025-08-22 07:09:50', '1', NULL),
(20, '1', '1759300202.png', 'New Notification', 'Hei this is the new 1', '0', '2025-10-01 06:30:02', '1', NULL),
(21, '3', '1759300202.png', 'New Notification', 'Hei this is the new 1', '0', '2025-10-01 06:30:02', '1', NULL),
(22, '4', '1759300202.png', 'New Notification', 'Hei this is the new 1', '1', '2025-10-01 06:30:03', '1', NULL),
(24, '9', '1759300202.png', 'New Notification', 'Hei this is the new 1', '0', '2025-10-01 06:30:03', '1', NULL),
(26, '17', '1759300202.png', 'New Notification', 'Hei this is the new 1', '0', '2025-10-01 06:30:03', '1', NULL),
(27, '18', '1759300202.png', 'New Notification', 'Hei this is the new 1', '0', '2025-10-01 06:30:03', '1', NULL),
(28, '19', '1759300202.png', 'New Notification', 'Hei this is the new 1', '0', '2025-10-01 06:30:03', '1', NULL),
(29, '20', '1759300202.png', 'New Notification', 'Hei this is the new 1', '0', '2025-10-01 06:30:03', '1', NULL),
(30, '21', '1759300202.png', 'New Notification', 'Hei this is the new 1', '0', '2025-10-01 06:30:03', '1', NULL),
(32, '27', '1759553392.png', 'New Notification', 'Hei this is the new', '0', '2025-10-01 06:30:03', '1', '2025-10-04 04:49:52'),
(34, '1', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(35, '3', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(36, '4', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '1', '2026-03-31 07:12:20', '1', NULL),
(37, '5', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(38, '9', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(39, '17', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(40, '18', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(41, '19', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(42, '20', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(43, '21', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(44, '22', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(45, '27', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(46, '28', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(47, '29', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(48, '30', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(49, '31', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(50, '32', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(51, '33', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(52, '34', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(53, '35', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(54, '36', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(55, '37', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(56, '38', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '1', '2026-03-31 07:12:20', '1', NULL),
(57, '39', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(58, '40', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(59, '41', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(60, '42', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL),
(62, '44', '1774941140.png', 'Test Notification 1', 'Hey this is a test notification', '0', '2026-03-31 07:12:20', '1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int NOT NULL,
  `listing_id` int NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'hotel, car, beauty, restaurant, real_estate, custom',
  `title` varchar(255) NOT NULL,
  `reward` text,
  `description` text,
  `expiry_date` date DEFAULT NULL,
  `discount_percentage` decimal(5,2) DEFAULT NULL,
  `coupon_code` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `listing_id`, `type`, `title`, `reward`, `description`, `expiry_date`, `discount_percentage`, `coupon_code`, `created_at`, `updated_at`) VALUES
(1, 3, 'hotel', 'Weekend Special', 'Free Breakfast', 'Book 2 nights and get complimentary breakfast for 2', '2026-12-31', 20.00, 'HOTEL20', '2026-05-05 10:53:05', '2026-05-05 10:53:05'),
(2, 3, 'hotel', 'Early Bird Offer', 'Room Upgrade', 'Book 15 days in advance and get free room upgrade', '2026-12-31', NULL, 'EARLYBIRD', '2026-05-05 10:53:05', '2026-05-05 10:53:05'),
(3, 3, 'hotel', 'Summer Discount', 'Flat 30% Off', 'Summer special discount on all room types', '2026-08-31', 30.00, 'SUMMER30', '2026-05-05 10:53:05', '2026-05-05 10:53:05'),
(4, 39, 'custom', 'First Service Free', 'Free Maintenance', 'Get first car service absolutely free', '2026-12-31', NULL, 'FREESERVICE', '2026-05-05 10:53:05', '2026-05-05 10:53:05'),
(5, 39, 'custom', 'Exchange Offer', 'Up to 50,000 off', 'Exchange your old car and get up to 50,000 discount', '2026-10-31', NULL, 'EXCHANGE50', '2026-05-05 10:53:05', '2026-05-05 10:53:05'),
(6, 39, 'custom', 'Corporate Discount', '15% Off', 'Special discount for corporate employees', '2026-12-31', 15.00, 'CORP15', '2026-05-05 10:53:05', '2026-05-05 10:53:05'),
(7, 39, 'custom', 'Referral Bonus', '5,000 Cashback', 'Refer a friend and get 5,000 cashback on purchase', '2026-12-31', NULL, 'REFER5000', '2026-05-05 10:53:05', '2026-05-05 10:53:05');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('vivekt011817@gmail.com', '$2y$12$exfrFvxssElf1JvrdgpHCePKUhKZMrCjtHcZmLAEWzoNRidPdkd1a', '2025-10-24 10:49:32');

-- --------------------------------------------------------

--
-- Table structure for table `payment_geteways`
--

CREATE TABLE `payment_geteways` (
  `id` bigint UNSIGNED NOT NULL,
  `identifier` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `keys` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_mode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_geteways`
--

INSERT INTO `payment_geteways` (`id`, `identifier`, `currency`, `title`, `keys`, `model_name`, `test_mode`, `status`, `created_at`, `updated_at`) VALUES
(1, 'paypal', 'USD', 'Paypal', '{\"currency\":\"INR\",\"sandbox_client_id\":\"AVBd9J7qrgYLMZXk94jjDa9B56OLX-gRTd86EgAa--4RVtZnReNj9ZZrh3AyO2OsXuoavJFXffavluGt\",\"sandbox_secret_key\":\"EKzwA0-vuDw-9seoXTYhyglY530cUsnziU3eXJn-8EMQFiBb3eVfprKU6XNo13DQXWHFi1biHb8OoT7\",\"production_client_id\":\"AR4CDc_C2eiWGhYnIMj4tMwUVVZI0QS8HCWNFGHRKVvDILqdsdjUHEN7X0y43hv_O9mHVH2QjtOv483u\",\"production_secret_key\":\"EJ3Lm5omPE9IF3lrakqzLC4FAIOmQidoy3Fm27yDdIIeBBz50gbpd7osgqTYFparTxh-JLzG8mBslJFP\"}', 'Paypal', '1', '0', '2023-03-28 00:32:45', '2025-08-16 07:35:44'),
(2, 'stripe', 'USD', 'Stripe', '{\"currency\":\"USD\",\"public_key\":\"pk_test_51MoMWZSDxTnaFTDaxC5wAXM9e0yB0ztZ9lrUZWFa1dHlcnTKs9Pr8n3P0uQqnoadBYuG7RL7qRxgLPkpVgr7ZNCx00Vei4c1LC\",\"secret_key\":\"sk_test_51MoMWZSDxTnaFTDavug9YfQGTryZc0xJ7t4TiJNYRlUwP0RaV1pWLl9mXjH6zWlX26M0XqJOxYtbYTR3y70uA4Bj00qMZ9ugFc\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxx\"}', 'StripePay', '1', '0', '2023-03-28 00:32:45', '2025-08-11 08:55:25'),
(3, 'razorpay', 'INR', 'Razorpay', '{\"public_key\":\"rzp_live_R9srG4dHk0Sebl\",\"secret_key\":\"JrliAvUzVYCuD1Py7upgi90M\"}', 'Razorpay', '1', '1', '2023-03-28 00:32:45', '2025-08-26 07:47:27'),
(4, 'flutterwave', 'USD', 'Flutterwave', '{\"public_key\":\"FLWPUBK_TEST-48dfbeb50344ecd8bc075b4ffe9ba266-X\",\"secret_key\":\"FLWSECK_TEST-1691582e23bd6ee4fb04213ec0b862dd-X\"}', 'Flutterwave', '1', '0', '2023-03-28 00:32:45', '2025-08-05 10:54:26'),
(5, 'paystack', 'NGN', 'Paystack', '{\"secret_test_key\":\"sk_test_c746060e693dd50c6f397dffc6c3b2f655217c94\",\"public_test_key\":\"pk_test_0816abbed3c339b8473ff22f970c7da1c78cbe1b\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxxx\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxxx\"}', 'Paystack', '1', '0', '2023-03-28 00:32:45', '2025-08-05 10:54:28'),
(6, 'phonepe', 'INR', 'Phonepe', '{\n    \"client_id\": \"SU2508082020272972840894\",\n    \"client_secret\": \"a0d4dee5-14d2-4216-8062-8cfb240248d1\",\n    \"client_version\": \"1\",\n    \"env\": \"PRODUCTION\",\n    \"callback_username\": \"test_user\",\n    \"callback_password\": \"test_pass\"\n}', 'Phonepe', '0', '0', '2023-03-28 00:32:45', '2025-08-26 07:47:50');

-- --------------------------------------------------------

--
-- Table structure for table `pricings`
--

CREATE TABLE `pricings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `listing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Shop_feature` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_manage` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_whats` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crm` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chatbot` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oneyerseo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pricings`
--

INSERT INTO `pricings` (`id`, `name`, `sub_title`, `price`, `icon`, `period`, `feature`, `listing`, `category`, `contact`, `video`, `choice`, `Shop_feature`, `order_manage`, `c_whats`, `crm`, `chatbot`, `oneyerseo`, `created_at`, `updated_at`) VALUES
(11, 'Listify Package', '', '0', 'fas fa-battery-empty', 'free', 'available', '1', '1', 'unavailable', 'unavailable', '', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-18 11:15:21', '2025-08-18 11:30:57'),
(12, 'Listify Package', '', '500', 'fas fa-battery-quarter', 'Monthly', 'available', '3', '3', 'available', 'available', '', 'Shop Feature', 'Order Management', 'Custom Whats App Number on Profile', NULL, NULL, NULL, '2025-08-18 11:21:43', '2026-03-20 11:08:11'),
(17, 'Listify Package', 'Free 2 Months when you paid Yearly', '5000', 'fas fa-battery-quarter', 'annually', 'available', '3', '3', 'available', 'available', '', 'Shop Feature', 'Order Management', 'Custom Whats App Number on Profile', NULL, NULL, NULL, '2025-08-18 11:23:07', '2025-08-18 12:22:24');

-- --------------------------------------------------------

--
-- Table structure for table `qrcode`
--

CREATE TABLE `qrcode` (
  `id` int NOT NULL,
  `user_id` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `title` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `upiid` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `qrcode` varchar(250) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` varchar(250) COLLATE utf8mb4_general_ci NOT NULL DEFAULT '1',
  `type` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `qrcode`
--

INSERT INTO `qrcode` (`id`, `user_id`, `title`, `upiid`, `qrcode`, `status`, `type`, `created_at`) VALUES
(1, '22', 'Google UPI', NULL, '1756368457.jpeg', '1', 'web', '2025-08-21 07:32:54'),
(2, '5', 'Phone Pay', NULL, '1756472236.jpg', '1', 'web', '2025-08-29 05:19:47'),
(4, '16', NULL, NULL, '1756449487.png', '1', 'web', '2025-08-29 06:38:07'),
(22, '43', 'Test QR', 'qwertyuio', '1780288207.png', '0', NULL, '2026-06-01 04:30:07'),
(24, '4', 'qr1', '9599917988@pthdfc', '1780293337.jpeg', '1', 'app', '2026-06-01 05:53:59'),
(25, '50', 'QR', 'chhabraravit199-4@oksbi', '1780477458.png', '1', 'app', '2026-06-02 08:07:58'),
(26, '43', 'New Qr', 'EFG1234567890', '1780721063.png', '1', NULL, '2026-06-06 04:44:23'),
(28, '50', 'barcode', 'chhabraravit199-4@oksbi', '1784008076.png', '1', NULL, '2026-06-10 06:25:53'),
(29, '50', 'QR', 'chhabraravit199-4@oksbi', '1783417410.png', '0', NULL, '2026-06-10 06:37:41'),
(30, '47', 'QR', '9599917988@pthdfc', '1783944377.jpg', '1', 'app', '2026-07-13 12:04:06');

-- --------------------------------------------------------

--
-- Table structure for table `real_estate_listings`
--

CREATE TABLE `real_estate_listings` (
  `id` bigint UNSIGNED NOT NULL,
  `property_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `discount` double DEFAULT NULL,
  `bed` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `bath` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dimension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_dimension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `floor_plan` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `garage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_hours` json DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `listing_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'premium',
  `img_base_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT 'https://www.listify.asia/',
  `data_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `near_by` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reported_listings`
--

CREATE TABLE `reported_listings` (
  `id` bigint NOT NULL,
  `listing_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reporter_id` int DEFAULT NULL,
  `report` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `user_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `report_type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Latitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_listings`
--

CREATE TABLE `restaurant_listings` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` int DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_hours` json DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `visibility` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `amenities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `opening_time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_id` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `country` int NOT NULL,
  `city` int NOT NULL,
  `area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Latitude` int NOT NULL,
  `Longitude` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `menu` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `listing_type` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT 'premium',
  `img_base_url` varchar(500) COLLATE utf8mb4_unicode_ci DEFAULT 'https://www.listify.asia/',
  `data_type` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `is_popular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `restaurant_listings`
--

INSERT INTO `restaurant_listings` (`id`, `title`, `category`, `image`, `opening_hours`, `description`, `visibility`, `amenities`, `opening_time`, `meta_title`, `meta_keyword`, `meta_description`, `og_title`, `og_description`, `canonical_url`, `json_id`, `country`, `city`, `area`, `address`, `postal_code`, `Latitude`, `Longitude`, `menu`, `user_id`, `type`, `listing_type`, `img_base_url`, `data_type`, `is_popular`, `created_at`, `updated_at`) VALUES
(2, 'MY SHOP MY TASTE', 83, '[\"2-1783937437.png\",\"8-1783937438.png\"]', NULL, 'My Shop is a cozy snack café serving freshly prepared fast food, light bites, and refreshing beverages in a friendly and comfortable atmosphere. From crispy fries, burgers, sandwiches, wraps, and pizzas to delicious coffee, shakes, and mocktails, we offer something for every craving.\n\nWhether you\'re stopping by for a quick snack, catching up with friends, or enjoying an evening treat, our focus is on great taste, quality ingredients, hygienic preparation, and fast service. We also offer takeaway and online ordering for your convenience.\n\nVisit My Shop for delicious snacks, refreshing drinks, and a relaxing café experience.', 'visible', NULL, NULL, '', '', NULL, '', NULL, '', NULL, 98, 6, '98:@:6:@:shop no-57 Rodeo Mall Kundli, Haryana', 'shop no-57 Rodeo Mall Kundli, Haryana', '131028', 29, '77.1173075', NULL, 47, 'restaurant', 'premium', 'https://www.listify.asia/', 'web', 'top', '2026-07-13 10:10:37', '2026-07-13 10:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `listing_id` int DEFAULT NULL,
  `agent_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `reply_id` int DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `review` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `listing_id`, `agent_id`, `type`, `reply_id`, `rating`, `review`, `created_at`, `updated_at`) VALUES
(20, 53, 1, 1, 'it-services', NULL, 5, 'Very professional and supportive team. They kept me updated throughout the project and were quick to make any changes I requested. Would definitely recommend them.', '2026-06-15 12:15:05', '2026-06-15 12:15:05'),
(21, 54, 31, 1, 'travel-tourism', NULL, 4, 'Excellent service, friendly staff, and a well-planned trip. Will definitely travel with them again!', '2026-06-15 12:25:25', '2026-06-15 12:25:25'),
(22, 54, 32, 1, 'business-services', NULL, 4, 'Quality service with quick response times.', '2026-06-16 04:45:43', '2026-06-16 04:45:43'),
(23, 56, 41, 50, 'corporate-gifting-and-printing-services', NULL, 5, 'Found exactly what I was looking for. Highly recommended.', '2026-06-16 04:53:06', '2026-06-16 04:53:06'),
(25, 50, 61, 50, 'custom', NULL, 3, 'best', '2026-07-13 05:15:53', '2026-07-13 05:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `person` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `child` int DEFAULT NULL,
  `listing_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seo_fields`
--

CREATE TABLE `seo_fields` (
  `id` bigint UNSIGNED NOT NULL,
  `course_id` int DEFAULT NULL,
  `blog_id` int DEFAULT NULL,
  `route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_route` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `meta_robot` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `canonical_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `custom_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `json_ld` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `og_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `og_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `og_image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `seo_fields`
--

INSERT INTO `seo_fields` (`id`, `course_id`, `blog_id`, `route`, `name_route`, `meta_title`, `meta_keywords`, `meta_description`, `meta_robot`, `canonical_url`, `custom_url`, `json_ld`, `og_title`, `og_description`, `og_image`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'Home', 'home', 'Welcome to listify. Your One Stop Search Platform for all Hotel, Food, Fitness, Grooming, Manufacturing, Trading, Automobiles, Real Estates, Recreation, Printing Services, Industrial, IT Services, Popular Services and Much more.', '[{\"value\":\"business directory\"},{\"value\":\"local business listing\"},{\"value\":\"directory services\"},{\"value\":\"business search\"},{\"value\":\"find businesses\"},{\"value\":\"online business directory\"}]', 'Discover a wide range of local businesses in your area with Atlas Business Directory. Easily search, connect, and explore top services and products.', 'index, follow', 'https://yourdomain.com/', 'https://yourdomain.com/home', '<script type=\"application/ld+json\">{   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'Explore Local Businesses | Atlas Business Directory', '', '1-1730781649_6729a1d10cc54.webp', '2025-03-22 16:04:31', '2025-03-22 16:04:31'),
(7, NULL, NULL, 'Beauty', 'beauty.home', 'Discover Your True Beauty Atlas Laravel', '[{\"value\":\"beauty tips\"},{\"value\":\"skincare\"},{\"value\":\"makeup\"},{\"value\":\"beauty products\"},{\"value\":\"beauty routines\"},{\"value\":\"natural beauty\"},{\"value\":\"beauty advice\"},{\"value\":\"self-care\"}]', 'Enhance your beauty with expert tips, top-rated products, and personalized routines. Uncover the secrets to glowing skin and flawless makeup today!', 'index, follow', 'https://yourdomain.com', 'https://yourdomain.com/home', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'Unleash Your Inner Glow with', 'Your one-stop destination for beauty tips, skincare routines, and makeup trends. Join us to look and feel your best every day!', '7-1731159740_beauty-hero-banner.webp', '2025-03-22 16:04:31', '2025-03-22 16:04:31'),
(8, NULL, NULL, 'Real-estate', 'real-estate.home', 'Discover Your Dream Home Atlas Laravel', '[{\"value\":\"real estate\"},{\"value\":\"homes for sale\"},{\"value\":\"property listings\"},{\"value\":\"buy houses\"},{\"value\":\"sell property\"},{\"value\":\"real estate deals\"},{\"value\":\"rental properties\"},{\"value\":\"luxury homes\"}]', 'Find your perfect home with our comprehensive real estate listings. Buy, sell, or rent properties with ease and explore the best deals today!', 'index, follow', 'https://yourdomain.com', 'https://yourdomain.com/home', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'Explore Top Real Estate Listings | Buy, Sell, or Rent', 'Browse our curated real estate listings for the best properties to buy, sell, or rent. Your dream home is just a click away!', '8-1733810127_real-estate-banner.webp', '2025-03-22 16:04:31', '2025-03-22 16:04:31'),
(9, NULL, NULL, 'Car', 'car.home', 'Explore the Best Cars for Sale – Affordable, Reliable, Stylish', '[{\"value\":\"cars for sale\"},{\"value\":\"buy a car\"},{\"value\":\"affordable cars\"},{\"value\":\"reliable cars\"},{\"value\":\"luxury cars\"},{\"value\":\"car deals\"}]', 'Discover a wide range of cars to suit your needs. Explore affordable and stylish options, perfect for any budget. Find your dream car today!', 'index, follow', 'https://yourdomain.com/cars', 'https://yourdomain.com/cars-home', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'Explore the Best Cars for Sale – Affordable, Reliable, Stylish', 'Find your perfect car with our diverse collection of affordable, stylish, and reliable vehicles. Start your journey with us today!', '9-1733034680_car-hero-car.webp', '2025-03-22 16:04:31', '2025-03-22 16:04:31'),
(10, NULL, NULL, 'Hotel', 'hotel.home', 'Luxury Hotels & Resorts – Book Your Stay Today', '[{\"value\":\"luxury hotels\"},{\"value\":\"premium resorts\"},{\"value\":\"hotel booking\"},{\"value\":\"top-rated hotels\"},{\"value\":\"vacation stays\"},{\"value\":\"holiday accommodations\"}]', 'Discover luxury hotels and premium resorts for your next vacation. Book your stay today and experience top-notch hospitality, comfort, and convenience.', 'index, follow', 'https://yourdomain.com', 'https://yourdomain.com/hotel', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'Luxury Hotels & Resorts – Your Ultimate Destination', 'Experience world-class hospitality at our luxury hotels and resorts. Perfect for vacations, business trips, and special occasions.', '10-1733381111_hotel-hero-banner.jpg', '2025-03-22 16:04:31', '2025-03-22 16:04:31'),
(11, NULL, NULL, 'Restaurant', 'restaurant.home', 'Discover the Best Dining Experiences Atlas Laravel', '[{\"value\":\"restaurant\"},{\"value\":\"fine dining\"},{\"value\":\"best restaurants\"},{\"value\":\"local cuisine\"},{\"value\":\"food delivery\"},{\"value\":\"dining near me\"},{\"value\":\"[Your City] restaurants\"}]', 'Experience the finest dining at [Restaurant Name]. Discover a variety of delicious cuisines, cozy ambiance, and top-notch service. Reserve your table today!', 'index, follow', 'https://yourdomain.com', 'https://yourdomain.com/restaurant', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'Welcome to [Restaurant Name] – A Culinary Journey', 'Indulge in a unique dining experience at [Restaurant Name]. From exquisite dishes to unmatched ambiance, we promise a memorable visit.', '11-1734850976_rt-deal-bg.webp', '2025-03-22 16:04:31', '2025-03-22 16:04:31'),
(12, NULL, NULL, 'Pricing', 'pricing', 'Pricing | Atlas Directory Listing', '[{\"value\":\"pricing plans\"},{\"value\":\"affordable pricing\"},{\"value\":\"[Your App Name] pricing\"},{\"value\":\"flexible plans\"},{\"value\":\"cost-effective solutions\"},{\"value\":\"Atlas Laravel pricing\"},{\"value\":\"subscription plans\"}]', 'Discover our affordable and flexible pricing plans designed to meet your needs. Choose the best plan for your business and get started with Atlas Laravel today.', 'index, follow', 'https://yourdomain.com', 'https://yourdomain.com/pricing', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'Affordable Pricing Plans for Atlas Laravel', 'Explore our tailored pricing plans to find the perfect solution for your business. Start your journey with Atlas Laravel at the right price today.', '12-1730781649_6729a1d10cc54.webp', '2025-03-22 16:04:31', '2025-03-22 16:04:31'),
(13, NULL, NULL, 'Blogs', 'blogs', 'Explore Inspiring Blogs and Latest Trends', '[{\"value\":\"blog\"},{\"value\":\"latest blogs\"},{\"value\":\"trending blogs\"},{\"value\":\"lifestyle tips\"},{\"value\":\"blogging ideas\"},{\"value\":\"tutorials\"},{\"value\":\"guides\"},{\"value\":\"inspiration\"}]', 'Discover engaging and informative blogs covering a wide range of topics, from lifestyle tips and tutorials to the latest trends and ideas. Dive into a world of inspiration today!', 'index, follow', 'https://yourdomain.com', 'https://yourdomain.com/blog', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'Discover Inspiring Blogs and Ideas', 'Stay updated with the latest blog posts, lifestyle tips, and trending ideas. Explore content that informs and inspires, all in one place.', '13-1730781649_6729a1d10cc54.webp', '2025-03-22 16:04:31', '2025-03-22 16:04:31'),
(14, NULL, NULL, 'contact-us', 'contact-us', 'Contact Us - Get in Touch with Listify', '[{\"value\":\"contact us\"},{\"value\":\"get in touch\"},{\"value\":\"customer support\"},{\"value\":\"[Your Company Name]\"},{\"value\":\"inquiries\"},{\"value\":\"reach us\"},{\"value\":\"contact form\"}]', 'Have questions or need support? Contact us today at Atlas Laravel. We\'re here to help with any inquiries you may have.', 'index, follow', 'https://www.yourdomain.com/', 'https://www.yourdomain.com/contact-us', '<script type=\"application/ld+json\"> {   \"@context\": \"http://schema.org\",   \"@type\": \"WebSite\",   \"name\": \"CodeCanyon\",   \"url\": \"https://codecanyon.net\" } </script>', 'Contact Us Atlas Laravel', 'Reach out to us today for any questions or support. Our team at [Your Company Name] is ready to assist you.', '14-1730781649_6729a1d10cc54.webp', '2025-03-22 16:04:31', '2025-03-22 16:04:31'),
(17, NULL, NULL, 'Fitness', NULL, NULL, '[{\"value\":\"fitness\"},{\"value\":\"fitness-listings\"}]', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'index, follow', 'https://www.listify.asia/fitness', 'https://www.listify.asia/fitness', NULL, '', '', NULL, NULL, NULL),
(18, NULL, NULL, 'Automobile', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, NULL, NULL, 'Manufacturing', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, NULL, NULL, 'Industrial', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, NULL, NULL, 'Corporate Gifting and Printing Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, NULL, NULL, 'Recreation', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, NULL, NULL, 'Food', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, NULL, NULL, 'Trading', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, NULL, NULL, 'IT Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, NULL, NULL, 'Agencies', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, NULL, NULL, 'Academies', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, NULL, NULL, 'Business Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, NULL, NULL, 'Food', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, NULL, NULL, 'Travel & Tourism', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, NULL, NULL, 'Healthcare Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, NULL, NULL, 'Popular Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, NULL, NULL, 'Grooming', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, NULL, NULL, 'Business Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('W1URiKl68UfUaJOjC41CFm2pDTDaukpjJvgwAL4f', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'YTo3OntzOjY6Il90b2tlbiI7czo0MDoiUnF3QUYwWkJ3akY5NVdRUkZERXkxYlZYYkRLSmtWdFFLSnBqUElLQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly9sb2NhbGhvc3QvYXRsYXNfbGFyYXZlbC9hdGxhcy9hZG1pbi9zeXN0ZW0tc2V0dGluZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MTU6ImFjdGl2ZV9sYW5ndWFnZSI7czo3OiJlbmdsaXNoIjtzOjM6InVybCI7YTowOnt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTtzOjg6Imxhbmd1YWdlIjtzOjc6ImVuZ2xpc2giO30=', 1735812190),
('xmPV3u1Xqqllls9qC0moYUI5TgSrD9XZNzbot1X0', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:133.0) Gecko/20100101 Firefox/133.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiZDR0cmFGUlg0N0JlT1dhTHVwZkhUSnlCWHFjMFUwcGk2dVFYOWJ5UyI7czoxNToiYWN0aXZlX2xhbmd1YWdlIjtzOjc6ImVuZ2xpc2giO3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjM2OiJodHRwOi8vbG9jYWxob3N0L2F0bGFzX2xhcmF2ZWwvYXRsYXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19', 1735809623);

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int NOT NULL,
  `listing_id` int NOT NULL,
  `type` varchar(50) NOT NULL COMMENT 'hotel, car, beauty, restaurant, real_estate, custom',
  `title` varchar(255) DEFAULT NULL,
  `thumbnail` varchar(500) DEFAULT NULL,
  `media_url` varchar(500) NOT NULL,
  `media_type` enum('image','video') DEFAULT 'image',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `listing_id`, `type`, `title`, `thumbnail`, `media_url`, `media_type`, `created_at`, `updated_at`) VALUES
(1, 3, 'hotel', 'Welcome to Grand Hotel', 'https://example.com/stories/thumb/hotel3_thumb.jpg', 'https://example.com/stories/hotel3_intro.mp4', 'video', '2026-05-05 10:52:33', '2026-05-05 10:52:33'),
(2, 3, 'hotel', 'Luxury Suite Tour', 'https://example.com/stories/thumb/hotel3_suite.jpg', 'https://example.com/stories/hotel3_suite.mp4', 'video', '2026-05-05 10:52:33', '2026-05-05 10:52:33'),
(3, 3, 'hotel', 'Swimming Pool', 'https://example.com/stories/thumb/hotel3_pool.jpg', 'https://example.com/stories/hotel3_pool.mp4', 'video', '2026-05-05 10:52:33', '2026-05-05 10:52:33'),
(4, 3, 'hotel', 'Breakfast Buffet', 'https://example.com/stories/thumb/hotel3_breakfast.jpg', 'https://example.com/stories/hotel3_breakfast.jpg', 'image', '2026-05-05 10:52:33', '2026-05-05 10:52:33'),
(5, 39, 'custom', 'New Car Arrival', 'https://example.com/stories/thumb/custom39_thumb.jpg', 'https://example.com/stories/custom39_car.mp4', 'video', '2026-05-05 10:52:33', '2026-05-05 10:52:33'),
(6, 39, 'custom', 'Test Drive Event', 'https://example.com/stories/thumb/custom39_event.jpg', 'https://example.com/stories/custom39_event.jpg', 'image', '2026-05-05 10:52:33', '2026-05-05 10:52:33'),
(7, 39, 'custom', 'Special Discount', 'https://example.com/stories/thumb/custom39_discount.jpg', 'https://example.com/stories/custom39_discount.mp4', 'video', '2026-05-05 10:52:33', '2026-05-05 10:52:33'),
(8, 39, 'custom', 'Customer Review', 'https://example.com/stories/thumb/custom39_review.jpg', 'https://example.com/stories/custom39_review.jpg', 'image', '2026-05-05 10:52:33', '2026-05-05 10:52:33');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `package_id` bigint NOT NULL,
  `paid_amount` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `payment_method` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `transaction_keys` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `auto_subscription` int DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `expire_date` int DEFAULT NULL,
  `date_added` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `user_id`, `package_id`, `paid_amount`, `payment_method`, `transaction_keys`, `auto_subscription`, `status`, `expire_date`, `date_added`, `created_at`, `updated_at`) VALUES
(3, 5, 8, '0', 'cod', NULL, 0, '1', 1757928762, 1755336762, '2025-08-16 09:32:42', '2025-08-16 09:32:42'),
(5, 9, 1, '1', 'phonepe', NULL, 0, '1', 1786873942, 1755337942, '2025-08-16 09:52:22', '2025-08-16 09:52:22'),
(6, 4, 10, '0', 'cod', NULL, 0, '1', 1757930038, 1755338038, '2025-08-16 09:53:58', '2025-08-16 09:53:58'),
(7, 5, 10, '0', 'cod', NULL, 0, '1', 1757930115, 1755338115, '2025-08-16 09:55:15', '2025-08-16 09:55:15'),
(8, 21, 1, '10', 'phonepe', NULL, 0, '1', 1786889895, 1755353895, '2025-08-16 14:18:15', '2025-08-16 14:18:15'),
(9, 22, 1, '10', 'phonepe', NULL, 0, '1', 1786975850, 1755439850, '2025-08-17 14:10:50', '2025-08-17 14:10:50'),
(10, 5, 11, '0', 'cod', NULL, 0, '1', 1787117777, 1755581777, '2025-08-19 05:36:17', '2025-08-19 05:36:17'),
(11, 22, 11, '0', 'cod', NULL, 0, '1', 1787215533, 1755679533, '2025-08-20 08:45:33', '2025-08-20 08:45:33'),
(12, 4, 11, '0', 'cod', NULL, 0, '1', 1787383740, 1755847740, '2025-08-22 07:29:00', '2025-08-22 07:29:00'),
(13, 16, 11, '0', 'cod', NULL, 0, '1', 1787652995, 1756116995, '2025-08-25 10:16:35', '2025-08-25 10:16:35'),
(14, 4, 12, '10', 'razorpay', NULL, 0, '1', 1787986795, 1756450795, '2025-08-29 06:59:55', '2025-08-29 06:59:55'),
(15, 29, 11, '0', 'cod', NULL, 0, '1', 1790847110, 1759311110, '2025-10-01 09:31:50', '2025-10-01 09:31:50'),
(16, 30, 11, '0', 'cod', NULL, 0, '1', 1790847503, 1759311503, '2025-10-01 09:38:23', '2025-10-01 09:38:23'),
(17, 31, 11, '0', 'cod', NULL, 0, '1', 1790848030, 1759312030, '2025-10-01 09:47:10', '2025-10-01 09:47:10'),
(18, 32, 11, '0', 'cod', NULL, 0, '1', 1790853512, 1759317512, '2025-10-01 11:18:32', '2025-10-01 11:18:32'),
(19, 33, 17, '2100', 'razorpay', NULL, 0, '1', 1791266750, 1759730750, '2025-10-06 06:05:50', '2025-10-06 06:05:50'),
(20, 43, 11, '0', 'cod', NULL, 0, '1', 1805533032, 1773997032, '2026-03-20 08:57:12', '2026-03-20 08:57:12'),
(21, 43, 12, '200', 'razorpay', NULL, 0, '1', 1805540853, 1774004853, '2026-03-20 11:07:33', '2026-03-20 11:07:33'),
(22, 43, 17, '2100', 'razorpay', NULL, 0, '1', 1805785420, 1774249420, '2026-03-23 07:03:40', '2026-03-23 07:03:40'),
(24, 47, 11, '0', 'cod', NULL, 0, '1', 1809503060, 1777967060, '2026-05-05 07:44:20', '2026-05-05 07:44:20'),
(25, 50, 11, '0', 'cod', NULL, 0, '1', 1809590910, 1778054910, '2026-05-06 08:08:30', '2026-05-06 08:08:30'),
(26, 50, 12, '500', 'razorpay', NULL, 0, '1', 1811577235, 1780041235, '2026-05-29 07:53:55', '2026-05-29 07:53:55'),
(27, 50, 11, '0', 'cod', NULL, 0, '1', 1815110738, 1783574738, '2026-07-09 05:25:38', '2026-07-09 05:25:38'),
(28, 61, 11, '0', 'cod', NULL, 0, '1', 1815210297, 1783674297, '2026-07-10 09:04:57', '2026-07-10 09:04:57');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int NOT NULL,
  `key` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci,
  `created_at` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `updated_at` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(2, 'system_title', 'Listify.Asia Business Directory Listing', '', '2026-05-15 10:17:38'),
(4, 'system_email', 'listify.asia@gmail.com', '', '2026-05-15 10:17:38'),
(5, 'address', 'SCO No.44, 2nd Floor, Club Road, TDI Kingsbury, (Near TDI Club), Kundli, Sonipat, Haryana-131023 (India)', '', '2026-05-15 10:17:38'),
(6, 'phone', '+91-9810246185', '', '2026-05-15 10:17:38'),
(8, 'country_id', '98', '', '2026-05-15 10:17:38'),
(10, 'currency_position', 'left', '', '2026-05-15 10:17:38'),
(11, 'language', 'english', '', '2026-06-23 06:19:55'),
(12, 'purchase_code', '35e73fe6-9873-4af2-8ca6-14959bd9fecd', '', '2026-05-15 10:17:38'),
(13, 'timezone', 'Asia/Kolkata', '', '2026-05-15 10:17:38'),
(14, 'paypal', '{\"status\":\"0\",\"mode\":\"test\",\"test_client_id\":\"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\",\"test_secret_key\":\"xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\",\"live_client_id\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\",\"live_secret_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\"}', '', ''),
(15, 'stripe', '{\"status\":\"1\",\"mode\":\"test\",\"test_key\":\"pk_test_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\",\"test_secret_key\":\"sk_test_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\",\"public_live_key\":\"pk_live_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\",\"secret_live_key\":\"sk_live_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\"}', '', ''),
(18, 'system_currency', '47', '', '2026-05-15 10:17:38'),
(23, 'smtp_protocol', 'smtp', '', '2025-08-07 11:19:44'),
(24, 'smtp_host', 'smtp.gmail.com', '', '2025-08-07 11:19:44'),
(25, 'smtp_port', '465', '', '2025-08-07 11:19:44'),
(26, 'smtp_user', 'roky.creativeitem@gmail.com', '', ''),
(27, 'smtp_pass', 'wegqskvpctybwvqm', '', ''),
(28, 'facebook', 'https://www.facebook.com/listify.asia', '', '2025-08-18 09:21:00'),
(30, 'term_and_condition', '', '', ''),
(31, 'privacy_policy', '', '', ''),
(35, 'footer_text', '© Copyright by Listify.Asia. All Rights Reserved.', '', '2026-05-15 10:17:38'),
(36, 'footer_link', 'http://creativeitem.com/', '', ''),
(37, 'version', '1.3', '', ''),
(40, 'map_access_token', 'pk.eyJ1IjoicG9sbG9idGVzdGluZ3I3IiwiYSI6ImNrZmwybHFmYjFrdHoyeXMybDdxNjgxaWYifQ.Gp_boLx9d0F6eM4ju6phiQ', '', '2026-05-15 10:17:38'),
(41, 'max_zoom_level', '2', '', '2026-05-15 10:17:38'),
(44, 'default_location', '28.8994938 , 77.1140669', '', '2026-05-15 10:17:38'),
(50, 'smtp_crypto', 'ssl', '', '2025-08-07 11:19:44'),
(52, 'signup_email_verification', '0', '', '2026-05-15 10:17:38'),
(57, 'smtp_from_email', 'smtp from email', '', ''),
(59, 'twitter', 'https://twitter.com', '', '2025-08-18 09:21:00'),
(60, 'linkedin', 'https://linkedin.com', '', '2025-08-18 09:21:00'),
(61, 'smtp_username', 'kc@corpmarvel.com', '2024-07-11 09:52:11', '2025-08-07 11:19:44'),
(62, 'smtp_password', 'cwuadvooyiomsdwp', '2024-07-11 09:52:11', '2025-08-07 11:19:44'),
(63, 'system_currency', '47', '2024-07-11 09:52:11', '2026-05-15 10:17:38'),
(64, 'footer_copyright_text', 'Listify.asia connects businesses across Asia-streamlining discovery, engagement, and growth through curated listings and smart digital tools.', '', '2026-05-15 10:17:38'),
(65, 'keyword', 'Business Directory, Yellow Pages, Online Business Directory', '', '2026-05-15 10:17:38'),
(66, 'website_description', 'Many online platforms or software tools offer directory listings as part of their digital maps or geographic databases. These directories might include information such as addresses, directions, and points of interest, making it easier for users to find specific locations or services in a particular area.', '', '2026-05-15 10:17:38'),
(67, 'author', 'Corp Marvel Infotech', '', '2026-05-15 10:17:38'),
(69, 'timezone', 'Asia/Kolkata', '2025-01-02 10:52:55', '2026-05-15 10:17:38'),
(70, 'system_name', 'Listify.Asia', '2025-01-02 11:18:18', NULL),
(71, 'form_builder', '1', '2025-08-14 10:02:28', '2026-05-15 10:17:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `verification_code` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_agent` int DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_type` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT 'web',
  `phone` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bio` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `linkedin` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int DEFAULT NULL,
  `specialty` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `treatment_areas` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `education` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `experience` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `membership` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addressline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `following_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook_id` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `verification_code`, `password`, `role`, `is_agent`, `image`, `type`, `data_type`, `phone`, `whatsapp`, `address`, `bio`, `linkedin`, `twitter`, `facebook`, `gender`, `status`, `specialty`, `treatment_areas`, `education`, `experience`, `membership`, `remember_token`, `addressline`, `following_agent`, `created_at`, `updated_at`, `google_id`, `avatar`, `facebook_id`) VALUES
(1, 'listify.asia', 'thecorpmarvel@gmail.com', '2025-08-05 07:43:11', NULL, '$2y$12$atBpwBqwKDREcYtoS92SjeZ5c/B/RAi1yr5.FRdX4r/ZkUtk3gyRC', '1', NULL, '1754487053.png', 'admin', 'web', '9599917988', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, 'IXTePD0EhQAL4bEULeW0hPJlPmp3mOLBo5qpGUnsHJfyKPyvmHieia7pSv7k', NULL, NULL, '2025-08-05 07:43:11', '2025-08-21 05:25:07', '', 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=740594365635541&height=50&width=50&ext=1758345907&hash=AT-dasytJHwEMzjxSK7BD6QJ', '740594365635541'),
(3, 'Kapil Chhabra', 'info@corpmarvel.com', NULL, NULL, '$2y$12$6FVWthi9F8r8aClp/zMUSe6zHt6FQs63Ai2HL1RpWfjGJrND6TTuW', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[\"1\"]', '2025-08-06 07:02:14', '2025-08-06 13:25:25', '', '', NULL),
(4, 'kapil chhabra', 'kc@corpmarvel.com', NULL, NULL, '$2y$12$8Bt0EM1.FH.QWhIicjqyE.hx.Yh1H8wZKDrJUZhlwJJJuJ/.2y/Rm', '2', 1, '1783416290_7707.jpg', 'agent', 'app', '9898878776', '8998989898', '{\"country\":\"98\",\"city\":\"1\"}', 'testbio', 'linkedin.com/', 'testwitter.com/', 'tesfacebook.com/', 'male', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'TDI City', '[\"1\"]', NULL, '2026-07-07 09:24:50', '', '', NULL),
(5, 'Abhishek', 'dev.acnosoft@gmail.com', NULL, NULL, '$2y$12$c94hMhxS3zKTFANKDnlpG.4qDn7c861QS1Umr43AZJ4pzrVkaR5eS', '2', 1, '1758796508.jpg', 'agent', 'web', '8285102814', '9717161203', '{\"country\":\"98\",\"city\":\"2\"}', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'https://www.linkedin.com/', 'https://x.com/', 'https://www.facebook.com/', 'male', 1, NULL, NULL, NULL, NULL, NULL, 'tyPPsRgRElyriJ1jFCP7wK6naNvG1F19UHhF5BBttmzuZUmPrDJVmbv8gsdx', 'A-57 Phase-4 Budhvihar phase - 1 Delhi 110086', NULL, '2025-08-11 08:49:53', '2025-09-25 10:35:08', '102878614243418116329', 'https://lh3.googleusercontent.com/a/ACg8ocKI42W970vHSkO9QvsAjJJb3bxphdZJxVNRKlcTDz65kU8nD26A=s96-c', NULL),
(9, 'Manoj Sharma (Acnosoft)', 'info@acnosoft.com', NULL, NULL, '$2y$12$YhGLw11TpKsvb/UeJBWa1eL7qOLE7HuXMMSnnNNNDuT1poFzIewfa', '2', 1, NULL, 'agent', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'j3amWxlReTAeSDHP7ddBq3CZpjokRpaoP5zQLNahuyCuFLYdRWnoXFCIPjgE', NULL, NULL, '2025-08-14 09:53:24', '2025-08-16 09:52:22', '', '', NULL),
(17, 'Vivek Tanwar', 'vt@corpmarvel.com', NULL, NULL, '$2y$12$Wdu/M2238QILlHiB8Rulp.4qu6lbn2TaIWEuYV.fiiAQySIfE5wEe', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'gw6YkisQNTu9yZWW6eCQvID3hbxf7pw6H8tPhHBjaPktdhWQiKnN8gh5KaIj', NULL, NULL, '2025-08-14 11:51:18', '2025-10-24 10:51:37', NULL, NULL, NULL),
(18, 'Arshad', 'info461997@gmail.com', NULL, NULL, '$2y$12$wyWPJBCzMSg77tfEyWPB3uonAWS8oPLOraGF8p80oUntZCXDAxHou', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'a6j37vSXB3F7qOWcsgYrDHHDSYcQFHrMvvxUIjcznM0g4dEk37XiD4tm3PuO', NULL, NULL, '2025-08-16 09:47:56', '2025-08-16 09:47:56', NULL, NULL, NULL),
(19, 'emily hoffman', 'emily.acnosoft@gmail.com', NULL, NULL, '$2y$12$hPh86/SooJ4K3OLfoV5.MOpGVrR1T6mhfnGeq/FYSiJwMAEiSsy1S', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'BZeuhZZMzhfmyxdJHGzFaXgKyZaq0aBo1XoBvTV1z1GocWxB3EFl3EBA071G', NULL, NULL, '2025-08-16 09:59:19', '2025-08-16 09:59:19', NULL, NULL, NULL),
(20, 'Lakshita pal', 'lakshita2004shepherd@gmail.com', NULL, NULL, '$2y$12$kP.hxs1hqH2CRpzsqfES6O0Fem72Zvfoss5e0HBWAFqbZPZHx0w56', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'O3uCxuWReyz4g5BeylBPT1uQNJD2A4dW2FtlBo3o5mtYHQ9lz10ofVFIX1t4', NULL, NULL, '2025-08-16 10:00:43', '2025-08-16 10:01:19', '115604556582256961208', 'https://lh3.googleusercontent.com/a/ACg8ocJMWt8-i_OUamH0_MRJuuIUKxt1oZqJBXNqS3Xr3X1czPVLZq8U=s96-c', NULL),
(21, 'Kapil Chhabra', 'kapilchhabra1980@gmail.com', NULL, NULL, '$2y$12$Ym.7qzFXwxjX6N27ns6zsehyub.vFZmjtiqyPWteC0HygnfO3ZGM2', '2', 1, NULL, 'agent', 'web', NULL, NULL, '{\"country\":\"98\",\"city\":\"1\"}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'lSpMPLnaxTEPUf47glJNYDp469AEjOB9KcO813M73rKWYQ856F6qLQd99yuE', 'Rodeo Drive mall', NULL, '2025-08-16 14:16:06', '2025-08-16 14:37:10', NULL, NULL, NULL),
(22, 'Listify Asia', 'listify.asia@gmail.com', NULL, NULL, '$2y$12$J.sW8LD3H1oV4SObvxKKHu5ZrN6d1kq0NJPzSsx.vZMDahaxs//by', '2', 1, NULL, 'agent', 'web', NULL, '+919810246185', '{\"country\":\"98\",\"city\":\"2\"}', '', '', '', '', 'other', 1, NULL, NULL, NULL, NULL, NULL, 'W2AcItTZEWGYphRvVOLR0O68KAHSjhDvjZSuuONvIo29nNJCyTKTL6TucnTY', 'A-4, (COMMERCIAL), 2ND FlOOR, INDERPURI, NEW DELHI-110012', '[\"1\",5]', '2025-08-17 14:06:41', '2026-05-11 05:33:54', '103972076060131841136', 'https://lh3.googleusercontent.com/a/ACg8ocKJsAoqjEqyJixTMLVgFWN7IOhT62rjaluCIa0AGE0M7vrJfA=s96-c', NULL),
(27, 'Abhishek sharma', 'abhishesharma2000@gmail.com', NULL, NULL, '$2y$12$GjJ7vLzoP0lE/QqQpL9GvOmeQ5/NxK4NZE8BdgscxG240hWN0Nanu', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'AvmHUjJHdpGeG7lmltiVHON96dHRKdxzLBtRCM0BZNVvhQhAewb59H0djmY9', NULL, NULL, '2025-08-29 12:13:15', '2025-11-23 15:10:48', '100507994251940152416', 'https://lh3.googleusercontent.com/a/ACg8ocLSjTWScrVT8ixpYoB1C1lV1rLmNZLnALK-CU6wp7FIMa-6F9zp=s96-c', NULL),
(28, 'Abhishek Sharma', 'dav.acnosoft@gmail.com', NULL, NULL, '$2y$12$aobuz28IMRfZ6fzFRAZYROZ3Rpk0RAzmFoJC33P9Ne9XKXY5Q.3lG', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'Csgfr9UrMbtG6RK2haABoXete7qDj3HxsSs5O1UDWwW20bJhH0Y33gf0gSDS', NULL, NULL, '2025-08-30 10:44:41', '2025-10-24 10:28:12', NULL, NULL, NULL),
(29, 'Sunny Khanna', 'trinetra.propert@gmail.com', NULL, NULL, '$2y$12$3ENAGVF9c9sowAHpmRN5j..1MxKuOvc9wjlRoq2FC6BoaRIHp2tz2', '2', 1, NULL, 'agent', 'web', '9999777747', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-01 09:29:30', '2025-10-01 09:31:50', NULL, NULL, NULL),
(30, 'Akshay', 'sales.mhe2017@gmail.com', NULL, NULL, '$2y$12$dmP9F/O6x2eu8ZKsr9YzKu3YPdu0eFoLIg7lr.7WCjGFHFHeGtK9i', '2', 1, NULL, 'agent', 'web', '9034343595', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-01 09:38:04', '2025-10-01 09:38:23', NULL, NULL, NULL),
(31, 'Sunny Khanna', 'trinetra.property@gmail.com', NULL, NULL, '$2y$12$R2JlZds9dXiUr4mV6hwLM.Nc9dwxYYtd6DriBNIBW1kmqtvaBbdj6', '2', 1, NULL, 'agent', 'web', '9899777747', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-01 09:46:33', '2025-10-01 09:47:10', NULL, NULL, NULL),
(32, 'Akbar Khan', 'ashnaprinter8585@gmail.com', NULL, NULL, '$2y$12$VrwkIa/1dHkQeUUpcgsGQ.3KWuNSh74tOmR6HIPc8IvOVPVc.qGum', '2', 1, NULL, 'agent', 'web', '9215921888', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-01 11:18:13', '2025-10-01 11:18:32', NULL, NULL, NULL),
(33, 'Abhishek sharma', 'davilsharma1999@gmail.com', NULL, NULL, '$2y$12$Ro/AcB/vw0WfpcZync9Gh.Z2EZi370MGmL3aNr8eZqh6Fq3Y22u7K', '2', 1, NULL, 'agent', 'app', NULL, '9717161203', '{\"country\":\"98\",\"city\":\"2\"}', NULL, NULL, NULL, NULL, 'other', 1, NULL, NULL, NULL, NULL, NULL, 'SCxNuZs7EgoB7uIS7WEu2LVFxVw80muMeLUPYtkqKVFuk284CEnact6pCYLl', 'rhoni sec-24', '[\"5\"]', '2025-10-06 05:51:56', '2026-07-10 05:52:49', '113441016711779917044', 'https://lh3.googleusercontent.com/a/ACg8ocIHNpQvgcqwI75Kbqhi7focXlBIqDEuZj7d3rUJ7ojYTllrZj6x1w=s96-c', NULL),
(34, 'Vivek Tanwar', 'vivekt011817@gmail.com', NULL, NULL, '$2y$12$SppFL2GNdu788lagm0klbu2EHu1ALDK3.czAszUaCCH7sZ6wkIWDm', '2', NULL, NULL, 'customer', 'web', '9971345053', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-10-18 09:20:08', '2025-10-18 09:20:08', NULL, NULL, NULL),
(35, 'admin seccurity', 'adm.seccurity@gmail.com', NULL, NULL, '$2y$12$3QkMxMnKRuBHxy3UebWZq.xig4R7rXz.MQtowJRXrzsbTVjt6p9XC', '2', NULL, '1766341013.php', 'customer', 'web', NULL, NULL, NULL, '', '', '', '', 'other', 1, NULL, NULL, NULL, NULL, NULL, 'o2pythnHLY6Rr4T1XBfPezy6z7fEElKSZoRMjXshsDEZqWf2Td2u5QVkhU46', NULL, NULL, '2025-12-21 18:16:28', '2025-12-21 18:16:53', NULL, NULL, NULL),
(36, 'can can Independent', 'rbrindependent@gmail.com', NULL, NULL, '$2y$12$/pKgyYYMzrafp675Sex07u9pmho4uTzolqSeE2r.CwhltihFgvvau', '2', NULL, '1766384637.php', 'customer', 'web', '194575347', NULL, NULL, '', '', '', '', 'other', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-22 06:23:37', '2025-12-22 06:23:57', NULL, NULL, NULL),
(38, 'Rahul Sharma', 'rahul@test.com', NULL, NULL, '$2y$12$9O88anOLHF1A0P6bSZ/0MebpqqOddVqh39eHOSqdgm2GClt355Qyu', '2', NULL, '1779885747_5100.jpg', NULL, 'app', '9876543210', '3211231234', '{\"country\":\"98\",\"city\":\"5\"}', 'test bio', 'linkedin/com321', 'twitter.com/123', 'testurlfacebook.com/123', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 'rohini', NULL, '2026-01-05 06:59:50', '2026-05-27 12:42:27', NULL, NULL, NULL),
(39, 'Rahul Sharma new', 'rahul123@test.com', NULL, NULL, '$2y$12$lfwEJBKooqQy0OtgxYlLxu/uQDwB8uOiFAXsDb0g7RCoj7o9dodGq', '2', NULL, NULL, 'customer', 'web', '9876543260', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05 07:02:03', '2026-01-05 07:02:03', NULL, NULL, NULL),
(40, 'Rahul Sharma', 'rahul12@test.com', NULL, NULL, '$2y$12$ZvZWxL8P1KMbB9ecYMQ4u.URLZMbY/z1qTfT6m3smud4J3vWRVw.S', '2', NULL, NULL, 'customer', 'web', '9876543210', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05 07:07:42', '2026-01-05 07:07:42', NULL, NULL, NULL),
(41, 'AADIL Khan', 'khan.aadil8299@gmail.com', NULL, NULL, '$2y$12$XCS5NNADTQ9Eq7E2kv5/He9ck07PVPhuScYTjt/L5/yfhc.bplRQ.', '2', NULL, NULL, 'customer', 'web', '123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05 07:42:01', '2026-01-05 07:42:01', NULL, NULL, NULL),
(42, 'Aadil Khan', 'ak@corpmarvel.com', NULL, NULL, '$2y$12$MLs.lhbGMi11.bOrE3ltuO925S4K5HuzWHe1UmuXb1naaHu9Ic52W', '2', NULL, NULL, 'customer', 'web', '8924958707', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-05 11:35:10', '2026-01-05 11:35:10', NULL, NULL, NULL),
(43, 'Harmanpreet Singh', 'singhharmanpreet646@gmail.com', NULL, NULL, '$2y$12$JKwtRFPVGc/nZM5RHE0uwOswzEEvS8DWQh22exdHcyo5XplWtJfFK', '2', 1, '1783578173.png', 'agent', 'app', '8818059914', '8818059914', '{\"country\":\"98\",\"city\":\"1\"}', 'Full Stack Developer', 'https://linkedin.com/in/demo', 'https://twitter.com/demo', 'https://facebook.com/demo', 'male', 1, NULL, NULL, NULL, NULL, NULL, NULL, 'Sonipat Haryana India', NULL, '2026-03-20 08:56:05', '2026-07-09 06:22:53', NULL, NULL, NULL),
(44, 'Test Name', 'testmail@test.com', NULL, NULL, '$2y$12$tmdQvGjQzKLgI47qUxeyaOlGsqew0SoHm3fih8PnSMcBmjBhGMF02', '2', NULL, NULL, 'customer', 'web', '9876598765', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-03-24 05:58:05', '2026-03-24 05:58:05', NULL, NULL, NULL),
(45, 'Aryan Khan Singh', 'aryan@test.com', NULL, NULL, '$2y$12$.gs1X2AzA65CzrVY4bixN.SG5I6YKI4u/bUQdiaiGTbW8NIizisnC', '2', NULL, 'https://example.com/uploads/user1.png', 'customer', 'web', '03001234567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-20 04:55:58', '2026-04-20 05:01:41', NULL, NULL, NULL),
(46, 'Ipan Sorrong', 'sorrongipan@gmail.com', NULL, NULL, '$2y$12$G5aUIK7IP5S/LH0A8AGWj.OowsA9nS246cfg2XJE6Rc7vsVdC7Yum', '2', NULL, '1776954162.php', 'customer', 'web', NULL, NULL, NULL, '', '', '', '', 'other', 1, NULL, NULL, NULL, NULL, NULL, '0bCOEQLPgp9U8DErYyO6WZfTBPmiBQ8cU0bIyX2VwuUl1tteS0XxQCOF6FZm', NULL, NULL, '2026-04-23 14:22:26', '2026-04-23 14:22:42', NULL, NULL, NULL),
(47, 'Ravit Chhabra', 'chhabraravit@gmail.com', NULL, NULL, '$2y$12$TfUk5tk3jlReDkLNzsvDb..6xvpa9A/urh6s96LthyHoVVio1R24C', '2', 1, NULL, 'agent', 'web', NULL, NULL, '{\"country\":\"98\",\"city\":\"1\"}', '', '', '', '', 'male', 1, NULL, NULL, NULL, NULL, NULL, '4mUC8fkYPKgq6KXUGLpaeJ40KRMOxqtZt3w3jL7e5fhL5oN8f6eHGuX23CcL', 'kundli', NULL, '2026-05-05 07:38:16', '2026-05-06 06:12:01', '117864699015651379083', 'https://lh3.googleusercontent.com/a/ACg8ocInMuiL7mfnUrdYvZbNjOpS-T5DoHQGfoRowpDjt0D7T7kIdgE=s96-c', NULL),
(48, 'Harmanpreet Singh', 'hps@corpmarvel.com', NULL, NULL, '$2y$12$YaStAZntmYj0d7cVqkxHRudnalPD6v84kh0hWKYav/1D4gubkLMga', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'dlxRAxvvJUbJzokZZn6OAIQppWEoiOzOojdjkdHm5R1c8dXKQYLZp3AOz857', NULL, NULL, '2026-05-05 07:51:23', '2026-05-05 07:51:23', NULL, NULL, NULL),
(49, 'Ravit chhabra', 'chhabraravit199@gmail.com', NULL, NULL, '$2y$12$CNy6NizMwF92OwhxWFkUc.b1NEv6AAZxI5AgsrTAVFjdfDS0vyDnG', '2', NULL, NULL, 'customer', 'web', '7419287535', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '[]', '2026-05-05 08:01:25', '2026-05-07 07:48:02', NULL, NULL, NULL),
(50, 'Sukhmani Enterprises HUF', 'sukhmanienterprises032@gmail.com', NULL, NULL, '$2y$12$dM7d3wYjnnQmevWPRqtkAOJhOyE5p4nv.ixLgQ12GZxPmKMQ1C8we', '2', 1, '1778056778.png', 'agent', 'app', '7419287532', '7419287532', '{\"country\":\"98\",\"city\":\"1\"}', NULL, NULL, NULL, NULL, 'male', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-06 08:08:06', '2026-07-13 09:37:10', NULL, NULL, NULL),
(51, 'Test User Antigravity', 'antigravitytest2@gmail.com', NULL, NULL, '$2y$12$SYHt4clCrztrG5bkpEkGg.vt8LZE8DBTXXW5O4Srr4lmRrWU/0Leq', '2', NULL, NULL, 'customer', 'web', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-05-27 08:22:48', '2026-05-27 08:22:48', NULL, NULL, NULL),
(52, 'karan', 'kk@corpmarvel.com', NULL, NULL, '$2y$12$vaQcwpc2LupmEIJFUx6x5OJzJNJpYNM4Awm8ZaoMq58mRC5wAqhme', '2', NULL, NULL, 'customer', 'web', '9548924034', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-10 05:31:06', '2026-06-10 05:31:06', NULL, NULL, NULL),
(53, 'Rishabh Kumar', 'rishabhkumar55@gmail.com', NULL, NULL, '$2y$12$txQcwKzgp.GSA8EyeeCfpurtgDU.zhdvw8z2veFJW1K15jolAOyXC', '2', NULL, '1781525872.png', 'customer', 'web', '7419264275', NULL, '{\"country\":\"98\",\"city\":\"2\"}', '', '', '', '', 'other', 1, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2026-06-15 12:11:36', '2026-06-15 12:18:18', NULL, NULL, NULL),
(54, 'Sahil Garg', 'gargsahil11@gmail.com', NULL, NULL, '$2y$12$b4UUa.Pxz4NjMjBFFFSuueHHx.ukMwG.R3h/KDTFqIjmIrVHzHE4W', '2', NULL, '1781585176.png', 'customer', 'web', '9210073694', NULL, '{\"country\":\"98\",\"city\":\"4\"}', '', '', '', '', 'male', 1, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2026-06-15 12:23:53', '2026-06-16 04:46:16', NULL, NULL, NULL),
(55, 'Gunjan Sharma', 'gs@gmail.com', NULL, NULL, '$2y$12$Wyyzjy545GYec.KNyPesJeKuHfp4Yrhsq67NcQwgYeTGI38ANL4Hy', '2', NULL, NULL, 'customer', 'web', '7838226438', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-16 04:50:12', '2026-06-16 04:50:12', NULL, NULL, NULL),
(56, 'Gunjan Sharma', 'gunjan12@gmail.com', NULL, NULL, '$2y$12$tCr73sIp0HEBzDVTqFQrc.IVKtB57BKwM28.B.B77VA2WOomWbH5W', '2', NULL, '1781585757.png', 'customer', 'web', '7838018536', NULL, '{\"country\":\"98\",\"city\":\"2\"}', '', '', '', '', 'female', 1, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, '2026-06-16 04:51:12', '2026-06-16 04:55:57', NULL, NULL, NULL),
(57, 'Aadil Khan', 'khanjack4321@gmail.com', NULL, NULL, '$2y$12$M0MI/HJm2Wc8BZJx92kPTeqd3Qf35eCV5HB54ih9Kjh4LmQHTENr6', '2', NULL, '1781848950_3172.jpg', 'customer', 'app', '8924958707', NULL, '{\"country\":null,\"city\":null}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'IhQzloQmHKnj43E0BmzcT7Tv6bXg8GJ3eTVkp7Dnza27jYEon7cvALq9oma1', NULL, NULL, '2026-06-19 06:01:58', '2026-06-20 13:05:10', '114371187806367606779', 'https://lh3.googleusercontent.com/a/ACg8ocKEXIlDmK3mF56VXopkY92g6eAAnvNBKqH2eysdRELCpURVcg=s96-c', NULL),
(58, 'Sumit', 'sumit7532448@gmail.com', NULL, NULL, '$2y$12$EE1nd5rZznVJK08NZ3mrquTcFfbocOrNDhg4OghalzIxGiWJqRFPq', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-23 08:14:07', '2026-06-23 08:14:07', NULL, NULL, NULL),
(59, 'Jessie Ball', 'jessieball.08439@gmail.com', NULL, NULL, '$2y$12$t7bfcVeEqQajHStSotHP3OztWEnEKCE2Fa5zzROrsonITmQE.uO1m', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-06-29 11:02:16', '2026-06-29 11:02:16', NULL, NULL, NULL),
(60, 'Punita Rajpal', 'punitarajpal82@gmail.com', NULL, NULL, '$2y$12$81F7UWAFxP3cRVKsf.A5Qun4vE7nTLRKEBQ/SxVUUm2kzXAppmvI2', '2', NULL, NULL, 'customer', 'web', '9899857971', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-07 14:36:33', '2026-07-07 14:36:33', NULL, NULL, NULL),
(61, 'Anmol Sahni', 'anmolsahni@ymail.com', NULL, NULL, '$2y$12$CWDkX/jS8UBIz1jAevgEBONSVQv4KvPVRglaUnn1rZqAX7n2.r.au', '2', 1, NULL, 'agent', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'ZDTLYGrxVf14obJhBgzJxoiqALdmYU4rzJBtKqMsDLFOmaqx26ZHKjtw9P6p', NULL, NULL, '2026-07-10 08:54:49', '2026-07-10 09:15:42', NULL, 'https://platform-lookaside.fbsbx.com/platform/profilepic/?asid=10243389837791758&height=50&width=50&ext=1786266942&hash=Afuzx302XKZMO_2PYBnxmRSm', '10243389837791758'),
(62, 'Manoj Sharma', 'boxydo2026@gmail.com', NULL, NULL, '$2y$12$ScykCYzai/aj/s9uOHRgUeaFZ9ZIegrDCF2fLsdJqJNWXWAsR5LB.', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, 'ExjDfN3pd28uMpuCQAv9LTcZj3etSDvPUoLoFmFJUVkEPd0QwtcyNsFQDlMI', NULL, NULL, '2026-07-10 08:57:08', '2026-07-10 08:57:08', NULL, NULL, NULL),
(66, 'Vicky Chhabra', 'fb_122107492041377940@listify.asia', NULL, NULL, '$2y$12$4W3lHDEszINDwanLvOh.re/6W6qNtZxjCzIJlsQ.xDr3Wp2nh82u6', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10 11:44:09', '2026-07-10 11:44:09', NULL, NULL, NULL),
(67, 'Strang Person', 'fb_1651897902566642_fFhaW@listify.asia', NULL, NULL, '$2y$12$BZgS2krRJinFGz.bPY/dfOZyNdxVeNy9arrImFw5fg94AYHZBg/ze', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10 11:45:19', '2026-07-10 11:45:19', NULL, NULL, NULL),
(68, 'Sanju Khati', 'sanjukhati9@gmail.com', NULL, NULL, '$2y$12$XQ9Td8CFuzoYRd.MMB/t8u/Y.YiQ4aI1DoofmcHoCZGjhm8m442aC', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10 11:46:20', '2026-07-10 11:46:20', NULL, NULL, NULL),
(71, 'Strang n', 'khatikaran63@gmail.com', NULL, NULL, '$2y$12$KQNA1NouWy3yeZvfNq6M0eNJ3IR1dUEKRK0D8E4.QrsZTxW9Hqmla', '2', NULL, '1783685185_3927.jpg', 'customer', 'app', NULL, NULL, '{\"country\":null,\"city\":null}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10 12:03:10', '2026-07-10 12:06:25', NULL, NULL, NULL),
(72, 'Strang', 'fb_1651897902566642@listify.asia', NULL, NULL, '$2y$12$NejLqe.OAV9F43Jw9KXN7uTsVC3PBpEY9toiSuxHQM7SNE4yGWEPu', '2', NULL, '1783685505_1986.jpg', 'customer', 'app', NULL, NULL, '{\"country\":null,\"city\":null}', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-10 12:11:06', '2026-07-10 12:11:45', NULL, NULL, NULL),
(73, 'Vinay Arya', 'aryavinay810@gmail.com', NULL, NULL, '$2y$12$vPRJFFOxMltoIMcWy5OiC.gX1zoxOxQ9kaERLDvK0FX7jyGmYrTJq', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-12 11:22:31', '2026-07-12 11:22:31', NULL, NULL, NULL),
(74, 'Pranav Kalia', 'pkalia167@gmail.com', NULL, NULL, '$2y$12$jJ9XkicBPjo17KQlFSpoOOPTyDEAzFh17rUvk.dNcZxm1uuk2zJs6', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-13 12:00:19', '2026-07-13 12:00:19', NULL, NULL, NULL),
(75, 'Romi', 'ansariromi4@gmail.com', NULL, NULL, '$2y$12$FyTXFJ7YtZwBiPZ8isij5eSNpbj4fGLft8BQk5IYmo3ChfrS5AvL.', '2', NULL, NULL, 'customer', 'web', '9217148565', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14 06:44:29', '2026-07-14 06:44:29', NULL, NULL, NULL),
(76, 'kanchan singh', 'smntrpriseb2c2015@gmail.com', NULL, NULL, '$2y$12$9Jc4Xy1DCaFD8HWICPegheaGDNnCd5A.q5rd2kBhsO7yBKjIMtmOq', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14 12:08:52', '2026-07-14 12:08:52', NULL, NULL, NULL),
(77, 'NAVEEN KUMAR GOYAL', 'naveenkumargoyal62@gmail.com', NULL, NULL, '$2y$12$pYq38F9bo.STVC5dGKOfye2/SNpYepwSTYRU//UcZKO27olYL41XO', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-14 18:27:36', '2026-07-14 18:27:36', NULL, NULL, NULL),
(78, 'Shraddha Sathe', 'shraddhajsathe4@gmail.com', NULL, NULL, '$2y$12$2kuTm8zJ4B4BKNGqp0ZWT.1c7Q4I7sr8Q.cxh8f8/GdcUjUJSin3q', '2', NULL, NULL, 'customer', 'web', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-07-15 08:29:55', '2026-07-15 08:29:55', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `id` bigint UNSIGNED NOT NULL,
  `listing_id` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`id`, `listing_id`, `type`, `user_id`, `created_at`, `updated_at`) VALUES
(2, 1, 'it-services', 22, '2025-08-17 14:11:21', '2025-08-17 14:11:21'),
(9, 8, 'automobiles', 33, '2025-10-17 11:24:14', '2025-10-17 11:24:14'),
(16, 31, 'travel-tourism', 43, '2026-05-07 09:24:43', '2026-05-07 09:24:43'),
(23, 1, 'car', 38, '2026-05-08 08:59:22', '2026-05-08 08:59:22'),
(45, 8, 'custom', 38, '2026-06-22 20:47:52', '2026-06-22 20:47:52'),
(47, 1, 'general', 59, '2026-06-29 11:04:34', '2026-06-29 11:04:34'),
(58, 41, 'custom', 50, '2026-07-07 11:16:21', '2026-07-07 11:16:21'),
(67, 18, 'premium', 50, '2026-07-14 07:36:38', '2026-07-14 07:36:38'),
(69, 1, 'general', 50, '2026-07-14 10:24:16', '2026-07-14 10:24:16');

-- --------------------------------------------------------

--
-- Table structure for table `_pricings`
--

CREATE TABLE `_pricings` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '0',
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `feature` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `listing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `video` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `choice` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `Shop_feature` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order_manage` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `c_whats` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crm` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chatbot` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `oneyerseo` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `_pricings`
--

INSERT INTO `_pricings` (`id`, `name`, `sub_title`, `price`, `icon`, `period`, `feature`, `listing`, `category`, `contact`, `video`, `choice`, `Shop_feature`, `order_manage`, `c_whats`, `crm`, `chatbot`, `oneyerseo`, `created_at`, `updated_at`) VALUES
(11, 'Listify Free', 'Free', '0', 'fas fa-battery-empty', 'annually', 'available', '1', '1', 'unavailable', 'unavailable', '', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-18 11:15:21', '2025-08-18 11:30:57'),
(12, 'Listify 200', '500', '200', 'fas fa-battery-quarter', 'annually', 'available', '3', '3', 'available', 'available', '', NULL, NULL, NULL, NULL, NULL, NULL, '2025-08-18 11:21:43', '2026-03-20 11:08:11'),
(13, 'Listify 1500', '1500', '1500', 'fas fa-battery-quarter', 'annually', 'available', '5', '5', 'available', 'available', '', 'Shop Feature', 'Order Management', NULL, NULL, NULL, NULL, '2025-08-18 11:23:07', '2025-08-18 12:22:24'),
(14, 'Listify 2500', '2500', '2500', 'fas fa-battery-quarter', 'annually', 'available', 'Unlimited', 'Unlimited', 'available', 'available', '', 'Shop Feature', 'Order Management', 'Custom What App Number on Profile', NULL, NULL, NULL, '2025-08-18 11:39:50', '2025-08-18 11:39:50'),
(15, 'Listify 4500', '4500', '4500', 'fas fa-battery-half', 'annually', 'available', 'Unlimited', 'Unlimited', 'available', 'available', '', 'Shop Feature', 'Order Management', 'Custom What App Number on Profile', 'CRM for User Management and Integrated SSO (Single Sign On)', NULL, NULL, '2025-08-18 11:59:47', '2025-08-18 11:59:47'),
(16, 'Listify 11000', '11000', '11000', 'fas fa-battery-half', 'annually', 'available', 'Unlimited', 'Unlimited', 'available', 'available', '', 'Shop Feature', 'Order Management', 'Custom What App Number on Profile', 'CRM for User Management and Integrated SSO (Single Sign On)', 'Intgrated Chatbot', NULL, '2025-08-18 12:00:45', '2025-08-18 12:00:45'),
(17, 'Listify 21000', '21000', '21000', 'fas fa-battery-full', 'annually', 'available', 'Unlimited', 'Unlimited', 'available', 'available', '', 'Shop Feature', 'Order Management', 'Custom What App Number on Profile', 'CRM for User Management and Integrated SSO (Single Sign On)', 'Intgrated Chatbot', '1 Year SEO of Listing with 25 Leads of your Category in 1 Year ', '2025-08-18 12:01:25', '2025-08-18 12:01:25');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `amenities`
--
ALTER TABLE `amenities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `beauty_listings`
--
ALTER TABLE `beauty_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `car_listings`
--
ALTER TABLE `car_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `claimed_listings`
--
ALTER TABLE `claimed_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_code_unique` (`code`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customlisting_setting`
--
ALTER TABLE `customlisting_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_listings`
--
ALTER TABLE `custom_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `custom_types`
--
ALTER TABLE `custom_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_listing_type` (`listing_id`,`type`);

--
-- Indexes for table `form_builders`
--
ALTER TABLE `form_builders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_page_settings`
--
ALTER TABLE `home_page_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotels`
--
ALTER TABLE `hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hotel_listings`
--
ALTER TABLE `hotel_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_categories`
--
ALTER TABLE `inventory_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory_purchases`
--
ALTER TABLE `inventory_purchases`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing__features`
--
ALTER TABLE `listing__features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `listing__specifications`
--
ALTER TABLE `listing__specifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `message_thread`
--
ALTER TABLE `message_thread`
  ADD PRIMARY KEY (`message_thread_id`),
  ADD KEY `message_thread_sender_foreign` (`sender`),
  ADD KEY `message_thread_receiver_foreign` (`receiver`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nearby_location`
--
ALTER TABLE `nearby_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_listing_type` (`listing_id`,`type`),
  ADD KEY `idx_expiry_date` (`expiry_date`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payment_geteways`
--
ALTER TABLE `payment_geteways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pricings`
--
ALTER TABLE `pricings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `qrcode`
--
ALTER TABLE `qrcode`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `real_estate_listings`
--
ALTER TABLE `real_estate_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reported_listings`
--
ALTER TABLE `reported_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `restaurant_listings`
--
ALTER TABLE `restaurant_listings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo_fields`
--
ALTER TABLE `seo_fields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_listing_type` (`listing_id`,`type`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `facebook_id` (`facebook_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `_pricings`
--
ALTER TABLE `_pricings`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `amenities`
--
ALTER TABLE `amenities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=228;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `beauty_listings`
--
ALTER TABLE `beauty_listings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `car_listings`
--
ALTER TABLE `car_listings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `claimed_listings`
--
ALTER TABLE `claimed_listings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=242;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113;

--
-- AUTO_INCREMENT for table `customlisting_setting`
--
ALTER TABLE `customlisting_setting`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `custom_listings`
--
ALTER TABLE `custom_listings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `custom_types`
--
ALTER TABLE `custom_types`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `form_builders`
--
ALTER TABLE `form_builders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `frontend_settings`
--
ALTER TABLE `frontend_settings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `home_page_settings`
--
ALTER TABLE `home_page_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `hotels`
--
ALTER TABLE `hotels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hotel_listings`
--
ALTER TABLE `hotel_listings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `inventory_categories`
--
ALTER TABLE `inventory_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `inventory_purchases`
--
ALTER TABLE `inventory_purchases`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6481;

--
-- AUTO_INCREMENT for table `listing__features`
--
ALTER TABLE `listing__features`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `listing__specifications`
--
ALTER TABLE `listing__specifications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `message_thread`
--
ALTER TABLE `message_thread`
  MODIFY `message_thread_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `nearby_location`
--
ALTER TABLE `nearby_location`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `newsletter_subscribers`
--
ALTER TABLE `newsletter_subscribers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `payment_geteways`
--
ALTER TABLE `payment_geteways`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `pricings`
--
ALTER TABLE `pricings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `qrcode`
--
ALTER TABLE `qrcode`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `real_estate_listings`
--
ALTER TABLE `real_estate_listings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reported_listings`
--
ALTER TABLE `reported_listings`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `restaurant_listings`
--
ALTER TABLE `restaurant_listings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo_fields`
--
ALTER TABLE `seo_fields`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `_pricings`
--
ALTER TABLE `_pricings`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
