-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 17, 2026 at 07:16 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mcares_db`
--
CREATE DATABASE IF NOT EXISTS `mcares_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `mcares_db`;

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `details` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `activity_logs`
--

INSERT INTO `activity_logs` (`id`, `user_id`, `user_name`, `action`, `details`, `ip_address`, `created_at`) VALUES
(1, 1, 'Prof. Bilal', 'POS Checkout', 'Created Invoice 000000015 for Total: ₦261.5 (cash)', '::1', '2026-08-13 07:42:16'),
(2, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANTI', '::1', '2026-08-13 07:52:40'),
(3, 1, 'Prof. Bilal', 'Edit Category', 'Updated category ID 1: ANTIFUNGAL', '::1', '2026-08-13 07:52:56'),
(4, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANTI HYPERTENSIVE', '::1', '2026-08-13 07:53:21'),
(5, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANTI DIABETES', '::1', '2026-08-13 07:53:39'),
(6, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANTI MALARIAL', '::1', '2026-08-13 07:53:55'),
(7, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANTI HISTIMINE', '::1', '2026-08-13 07:54:32'),
(8, 1, 'Prof. Bilal', 'Add Category', 'Added category: VITAMINS AND MINERALS', '::1', '2026-08-13 07:56:29'),
(9, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANTIBIOTIC', '::1', '2026-08-13 07:56:58'),
(10, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANALGESICS', '::1', '2026-08-13 07:57:16'),
(11, 1, 'Prof. Bilal', 'Add Category', 'Added category: INJECTABLES', '::1', '2026-08-13 07:57:34'),
(12, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANTI ACID', '::1', '2026-08-13 07:58:34'),
(13, 1, 'Prof. Bilal', 'Edit Category', 'Updated category ID 10: ANTI ACID/ANTI ULCER', '::1', '2026-08-13 07:58:46'),
(14, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Flucamed (Barcode: 890410607094)', '::1', '2026-08-13 08:04:35'),
(15, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Cetirizine 10mg Tabs (Barcode: 890134166826)', '::1', '2026-08-13 08:07:20'),
(16, 1, 'Prof. Bilal', 'Add Category', 'Added category: OPTHALMIC AND OPTIC AGENT', '::1', '2026-08-13 08:08:57'),
(17, 1, 'Prof. Bilal', 'Add Category', 'Added category: ORAL CONTRACEPTIVE', '::1', '2026-08-13 08:09:26'),
(18, 1, 'Prof. Bilal', 'Delete Medicine', 'Deleted medicine ID 2', '::1', '2026-08-13 08:09:42'),
(19, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 1: Flucamed cap 50mg by 10', '::1', '2026-08-13 08:10:13'),
(20, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Mycoten tab (Barcode: 890779888492)', '::1', '2026-08-13 08:11:47'),
(21, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Klovinal (Barcode: 890568971520)', '::1', '2026-08-13 08:13:34'),
(22, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Clotrivag 200 (Barcode: 890670674265)', '::1', '2026-08-13 08:14:39'),
(23, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Caps itraconozole 120LE (Barcode: 890457218744)', '::1', '2026-08-13 08:16:07'),
(24, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Caps itratonozole Itacare (Barcode: 890401217815)', '::1', '2026-08-13 08:17:17'),
(25, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Terbinafine TERBIFACE (Barcode: 890787381316)', '::1', '2026-08-13 08:18:38'),
(26, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Terbinafine 250mg (Barcode: 890661596841)', '::1', '2026-08-13 08:19:45'),
(27, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Terbinafine Tabisafe (Barcode: 890682513084)', '::1', '2026-08-13 08:20:36'),
(28, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Canesten (Barcode: 890440970559)', '::1', '2026-08-13 08:21:29'),
(29, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Mycoten Viginal cream (Barcode: 890609571110)', '::1', '2026-08-13 08:22:40'),
(30, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 11: Canesten', '::1', '2026-08-13 08:22:50'),
(31, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 12: Mycoten Viginal cream', '::1', '2026-08-13 08:23:11'),
(32, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Mycoten plus V cream (Barcode: 890639998373)', '::1', '2026-08-13 08:24:11'),
(33, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Nystatin oral tab (Barcode: 890746462857)', '::1', '2026-08-13 08:25:12'),
(34, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Fluconozole 50mg Emzor by 3 (Barcode: 890747231573)', '::1', '2026-08-13 08:26:31'),
(35, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Diflucan 50mg by 3 (Barcode: 890435307413)', '::1', '2026-08-13 08:27:52'),
(36, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Flucamed 200mg (Barcode: 890574074270)', '::1', '2026-08-13 08:28:52'),
(37, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Tinizol (Barcode: 890813606034)', '::1', '2026-08-13 08:29:50'),
(38, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: BERLIN Fluconozole 150mg (Barcode: 890558515891)', '::1', '2026-08-13 08:30:40'),
(39, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: EDEN Fluconozole 200mg (Barcode: 890877809226)', '::1', '2026-08-13 08:31:24'),
(40, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Clotriderm thrush cream (Barcode: 890540720471)', '::1', '2026-08-13 08:32:20'),
(41, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Gynamaed V Cream (Barcode: 890125069704)', '::1', '2026-08-13 08:33:09'),
(42, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Mystatin V tab (Barcode: 890797704008)', '::1', '2026-08-13 08:33:56'),
(43, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Caps Fluconozole 50mg by 10 (Barcode: 890435959670)', '::1', '2026-08-13 08:35:02'),
(44, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Nystatin oral suspension (Barcode: 890485171545)', '::1', '2026-08-13 08:36:02'),
(45, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Barifuluin (Barcode: 890557226279)', '::1', '2026-08-13 08:36:57'),
(46, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Pyrantrin oral suspension (Barcode: 890350895304)', '::1', '2026-08-13 08:38:03'),
(47, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Grisokris oral suspension (Barcode: 890870399093)', '::1', '2026-08-13 08:39:06'),
(48, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Zolat oral suspension (Barcode: 890642086217)', '::1', '2026-08-13 08:39:41'),
(49, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Flucamed oral suspension (Barcode: 890484452608)', '::1', '2026-08-13 08:40:27'),
(50, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Zolat chewable tablet (Barcode: 890407815676)', '::1', '2026-08-13 08:41:41'),
(51, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Zentel Albendazole 200mg (Barcode: 890715376435)', '::1', '2026-08-13 08:43:06'),
(52, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Secnidazole secwid (Barcode: 890207984837)', '::1', '2026-08-13 08:44:08'),
(53, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Prazequentel tab (Barcode: 890719613808)', '::1', '2026-08-13 08:45:17'),
(54, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Pyrantrim (Barcode: 890879463151)', '::1', '2026-08-13 08:45:51'),
(55, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Fluconozole 150mg by 1 (Teva) (Barcode: 890341612097)', '::1', '2026-08-13 08:47:02'),
(56, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Fluconozole 50mg by 10 (Teva) (Barcode: 890784144013)', '::1', '2026-08-13 08:47:43'),
(57, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: The 7 keys Herbal mixture (Barcode: 890227292229)', '::1', '2026-08-13 08:48:59'),
(58, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Teething powder (Barcode: 890210167940)', '::1', '2026-08-13 08:50:38'),
(59, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Kvila matricaria infant powder (Barcode: 890995690552)', '::1', '2026-08-13 08:51:34'),
(60, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Jawalk (Barcode: 890898526533)', '::1', '2026-08-13 08:52:35'),
(61, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Mist potassium citrate (Barcode: 890370996787)', '::1', '2026-08-13 08:53:09'),
(62, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Galway (Barcode: 890662505108)', '::1', '2026-08-13 08:53:40'),
(63, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Wosan Povidon iodine 10% (Barcode: 890934571924)', '::1', '2026-08-13 08:54:50'),
(64, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Wosan Povidon iodine 5% (Barcode: 890764017889)', '::1', '2026-08-13 08:56:08'),
(65, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Gemicide Z (Barcode: 890703224997)', '::1', '2026-08-13 08:56:45'),
(66, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: MOKO Iodine (Barcode: 890553622922)', '::1', '2026-08-13 08:57:27'),
(67, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Hydrogen Peroxide (Barcode: 890158673708)', '::1', '2026-08-13 08:58:12'),
(68, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: MOKO Benzyl Benzoate (Barcode: 890586024366)', '::1', '2026-08-13 09:00:53'),
(69, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Be-Be lotion (Barcode: 890587858099)', '::1', '2026-08-13 09:01:43'),
(70, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Olive oil (Roberts) (Barcode: 890265164695)', '::1', '2026-08-13 09:02:28'),
(71, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Olive oil (Goya) (Barcode: 890316887979)', '::1', '2026-08-13 09:03:06'),
(72, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Castor Oil (Barcode: 890727589670)', '::1', '2026-08-13 09:03:56'),
(73, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 22: Gynamaed V Cream', '::1', '2026-08-13 09:04:30'),
(74, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 10: Terbinafine Tabisafe', '::1', '2026-08-13 09:04:57'),
(75, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Acetylsalicylic acid 75mg (emprim) (Barcode: 890673765971)', '::1', '2026-08-13 09:08:44'),
(76, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Amiloride hydrochlorides\' (normal) (Barcode: 890189620815)', '::1', '2026-08-13 09:11:02'),
(77, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Amiloride (bonduretic) (Barcode: 890746268256)', '::1', '2026-08-13 09:12:16'),
(78, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 56: Amiloride (bonduretic)', '::1', '2026-08-13 09:13:05'),
(79, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Yasoprin (Barcode: 890370095374)', '::1', '2026-08-13 09:14:48'),
(80, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: rivarozaban (xarelto) 10mg (Barcode: 890341718567)', '::1', '2026-08-13 09:17:20'),
(81, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Rivarozaban (ravasmart) 10mg (Barcode: 890686307426)', '::1', '2026-08-13 09:19:54'),
(82, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Propranolol 40mg (eden) (Barcode: 890856422145)', '::1', '2026-08-13 09:22:39'),
(83, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Allopurinol (zyloric) 300mg (Barcode: 890560474867)', '::1', '2026-08-13 09:27:22'),
(84, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Bisaprolol concor 5mg (Barcode: 890933993195)', '::1', '2026-08-13 09:28:52'),
(85, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Bisaprolol B-Cor 5 (Barcode: 890665371445)', '::1', '2026-08-13 09:29:58'),
(86, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Bisaprolol Concor 10mg (Barcode: 890466560165)', '::1', '2026-08-13 09:30:50'),
(87, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Bisaprolol onCor 2.5mg (Barcode: 890642388399)', '::1', '2026-08-13 09:31:50'),
(88, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Losartan potassium 50mg antytex (Barcode: 890640928322)', '::1', '2026-08-13 09:34:15'),
(89, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Losartan potassium 50 zmc (Barcode: 890488765094)', '::1', '2026-08-13 09:35:02'),
(90, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Losartan pocco 100mg (Barcode: 890161837874)', '::1', '2026-08-13 09:36:13'),
(91, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Losartan 50mg TEVA (Barcode: 890765620157)', '::1', '2026-08-13 09:37:10'),
(92, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Losartan 100mg TEVA (Barcode: 890253674668)', '::1', '2026-08-13 09:37:45'),
(93, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Losartan 100mg POM (Barcode: 890693438090)', '::1', '2026-08-13 09:38:33'),
(94, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Amlodipine 10mg EMZOVASE (Barcode: 890675146141)', '::1', '2026-08-13 09:39:35'),
(95, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Amlodipine 10mg TAYVAS (Barcode: 890807240158)', '::1', '2026-08-13 09:40:15'),
(96, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Amlodipine 10mg MECURE (Barcode: 890533625315)', '::1', '2026-08-13 09:41:22'),
(97, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Lisinopril 10mg TEVA (Barcode: 890640554286)', '::1', '2026-08-13 09:42:16'),
(98, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Lisinopril 10mg TAMAPRI (Barcode: 890838071723)', '::1', '2026-08-13 09:43:15'),
(99, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Acetylsalicylic acid 75mg (emprim) (Barcode: 890740129282)', '::1', '2026-08-13 09:44:56'),
(100, 1, 'Prof. Bilal', 'Delete Medicine', 'Deleted medicine ID 77', '::1', '2026-08-13 09:45:09'),
(101, 1, 'Prof. Bilal', 'POS Checkout', 'Created Invoice 000000001 for Total: ₦350 (cash)', '::1', '2026-08-13 09:54:09'),
(102, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 381: Emzifix (Cefixime Susp) 60ml', '::1', '2026-08-13 12:05:36'),
(103, 1, 'Prof. Bilal', 'User Logout', 'User logged out.', '::1', '2026-08-13 12:28:26'),
(104, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-13 12:29:03'),
(105, 1, 'Prof. Bilal', 'User Logout', 'User logged out.', '::1', '2026-08-13 13:27:32'),
(106, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-13 13:35:45'),
(107, 1, 'Prof. Bilal', 'POS Checkout', 'Created Invoice 000000008 for Total: ₦1000 (cash)', '::1', '2026-08-13 14:28:30'),
(108, 1, 'Prof. Bilal', 'POS Checkout', 'Created Invoice 000000009 for Total: ₦7950 (cash)', '::1', '2026-08-13 14:29:54'),
(109, 1, 'Prof. Bilal', 'Add Category', 'Added category: no5', '::1', '2026-08-14 07:57:38'),
(110, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Salbutamol (Barcode: 890459199057)', '::1', '2026-08-14 08:05:34'),
(111, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 730: Salbutamol', '::1', '2026-08-14 08:06:51'),
(112, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Reasulf tablet (Barcode: 890247523941)', '::1', '2026-08-14 08:09:49'),
(113, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 728: Toothbrush medium', '::1', '2026-08-14 08:26:31'),
(114, 1, 'Prof. Bilal', 'POS Checkout', 'Created Invoice 000000010 for Total: ₦5500 (cash)', '::1', '2026-08-14 09:55:27'),
(115, 1, 'Prof. Bilal', 'User Logout', 'User logged out.', '::1', '2026-08-14 10:11:31'),
(116, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-14 10:29:08'),
(117, NULL, 'System / Guest', 'Failed Login Attempt', 'Failed login attempt for username: admin', '::1', '2026-08-17 10:48:42'),
(118, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-17 11:34:00'),
(119, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-17 11:44:15'),
(120, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Aaaaaasssss (Barcode: 890621854197)', '::1', '2026-08-17 11:45:20'),
(121, 1, 'Prof. Bilal', 'Delete Medicine', 'Deleted medicine ID 1033', '::1', '2026-08-17 11:47:47'),
(122, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-17 13:19:29'),
(123, 2, 'Ibrahim Jibril', 'User Login', 'User logged in successfully.', '::1', '2026-08-17 13:22:44'),
(124, 2, 'Ibrahim Jibril', 'User Logout', 'User logged out.', '::1', '2026-08-17 13:23:56'),
(125, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-17 13:24:10'),
(126, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-17 13:30:30'),
(127, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-17 13:44:12'),
(128, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-17 13:48:56'),
(129, 1, 'Prof. Bilal', 'System Settings Update', 'Pharmacy profile and system settings updated by Founder.', '::1', '2026-08-17 13:50:19'),
(130, 1, 'Prof. Bilal', 'System Settings Update', 'Pharmacy profile and system settings updated by Founder.', '::1', '2026-08-17 13:50:20'),
(131, 1, 'Prof. Bilal', 'System Settings Update', 'Pharmacy profile and system settings updated by Founder.', '::1', '2026-08-17 13:50:22'),
(132, 1, 'Prof. Bilal', 'System Settings Update', 'Pharmacy profile and system settings updated by Founder.', '::1', '2026-08-17 13:50:23'),
(133, 1, 'Prof. Bilal', 'System Settings Update', 'Pharmacy profile and system settings updated by Founder.', '::1', '2026-08-17 13:50:23'),
(134, 1, 'Prof. Bilal', 'System Settings Update', 'Pharmacy profile and system settings updated by Founder.', '::1', '2026-08-17 13:50:24'),
(135, 1, 'Prof. Bilal', 'User Login', 'User logged in successfully.', '::1', '2026-08-17 13:53:27'),
(136, 1, 'Prof. Bilal', 'Add Category', 'Added category: Cough suppression/Expectorants', '::1', '2026-08-17 13:57:51'),
(137, 1, 'Prof. Bilal', 'Add Category', 'Added category: Antiseptic and disinfectants', '::1', '2026-08-17 14:00:28'),
(138, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANTI PROTOZOALS', '::1', '2026-08-17 14:01:40'),
(139, 1, 'Prof. Bilal', 'Add Category', 'Added category: INFUSIONS', '::1', '2026-08-17 14:02:30'),
(140, 1, 'Prof. Bilal', 'Add Category', 'Added category: ANTIEMETCS', '::1', '2026-08-17 14:04:35'),
(141, 1, 'Prof. Bilal', 'Add Category', 'Added category: NSAIDs', '::1', '2026-08-17 14:05:17'),
(142, 1, 'Prof. Bilal', 'Add Category', 'Added category: CONSUMABLES', '::1', '2026-08-17 14:05:52'),
(143, 1, 'Prof. Bilal', 'Add Category', 'Added category: Rehydration solution/ laxatives/Antidiarrheal', '::1', '2026-08-17 14:08:07'),
(144, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Familiar tissue (Barcode: 890672885667)', '::1', '2026-08-17 14:16:11'),
(145, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 1034: Familiar tissue', '::1', '2026-08-17 14:17:07'),
(146, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Dynamogen (Barcode: 890551109333)', '::1', '2026-08-17 14:19:40'),
(147, 1, 'Prof. Bilal', 'Update Medicine', 'Updated medicine ID 1035: Dynamogen', '::1', '2026-08-17 14:20:14'),
(148, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: ORS (Barcode: 890233741910)', '::1', '2026-08-17 14:23:03'),
(149, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Emzolyte ORS (Barcode: 890609262933)', '::1', '2026-08-17 14:26:53'),
(150, 1, 'Prof. Bilal', 'Add Medicine', 'Added medicine: Throated sachet (Barcode: 890268401700)', '::1', '2026-08-17 14:32:03');

-- --------------------------------------------------------

--
-- Table structure for table `branches`
--

CREATE TABLE `branches` (
  `id` int(11) NOT NULL,
  `branch_name` varchar(100) NOT NULL,
  `location` varchar(150) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`, `created_at`) VALUES
(1, 'ANTIFUNGAL', '', '2026-08-13 07:52:40'),
(2, 'ANTI HYPERTENSIVE', '', '2026-08-13 07:53:21'),
(3, 'ANTI DIABETES', '', '2026-08-13 07:53:39'),
(4, 'ANTI MALARIAL', '', '2026-08-13 07:53:55'),
(5, 'ANTI HISTIMINE', '', '2026-08-13 07:54:32'),
(6, 'VITAMINS AND MINERALS', '', '2026-08-13 07:56:29'),
(7, 'ANTIBIOTIC', '', '2026-08-13 07:56:58'),
(8, 'ANALGESICS', '', '2026-08-13 07:57:16'),
(9, 'INJECTABLES', '', '2026-08-13 07:57:34'),
(10, 'ANTI ACID / ANTI ULCER', '', '2026-08-13 07:58:34'),
(11, 'OPTHALMIC AND OPTIC AGENT', '', '2026-08-13 08:08:57'),
(12, 'ORAL CONTRACEPTIVE', '', '2026-08-13 08:09:26'),
(13, 'no5', '', '2026-08-14 07:57:38'),
(14, 'Cough suppression/Expectorants', '', '2026-08-17 13:57:51'),
(19, 'Antiseptic and disinfectants', '', '2026-08-17 14:00:28'),
(20, 'ANTI PROTOZOALS', '', '2026-08-17 14:01:40'),
(21, 'INFUSIONS', '', '2026-08-17 14:02:30'),
(22, 'ANTIEMETCS', '', '2026-08-17 14:04:35'),
(23, 'NSAIDs', '', '2026-08-17 14:05:17'),
(24, 'CONSUMABLES', '', '2026-08-17 14:05:52'),
(25, 'Rehydration solution/ laxatives/Antidiarrheal', '', '2026-08-17 14:08:07');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `created_at`) VALUES
(1, 'Walk-in Customer', '0000000000', 'walkin@mcare.com', 'N/A', '2026-08-13 09:53:39');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `generic_name` varchar(150) NOT NULL,
  `brand` varchar(100) DEFAULT NULL,
  `packs_cards` varchar(100) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `batch_number` varchar(50) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `manufacturer` varchar(100) DEFAULT NULL,
  `purchase_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `selling_price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `reorder_level` int(11) NOT NULL DEFAULT 10,
  `expiry_date` date NOT NULL,
  `storage_location` varchar(50) DEFAULT 'Shelf A1',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `name`, `generic_name`, `brand`, `packs_cards`, `category_id`, `batch_number`, `barcode`, `manufacturer`, `purchase_price`, `selling_price`, `quantity`, `reorder_level`, `expiry_date`, `storage_location`, `created_at`, `updated_at`) VALUES
(1, 'Flucamed cap 50mg by 10', 'Flucamed', '', NULL, 1, 'BATCH-6EA5CE37', '890410607094', '', 0.00, 2500.00, 10, 10, '2029-01-01', 'Shelf A-1', '2026-08-13 08:04:35', '2026-08-13 08:10:13'),
(3, 'Mycoten tab', 'Mycoten tab', '', NULL, 1, 'BATCH-E3F246A0', '890779888492', '', 0.00, 2100.00, 21, 10, '2028-11-01', 'Shelf A-1', '2026-08-13 08:11:47', '2026-08-13 08:11:47'),
(4, 'Klovinal', 'klovinal', '', NULL, 1, 'BATCH-1E2AF78E', '890568971520', '', 0.00, 4500.00, 29, 10, '2027-05-01', 'Shelf A-1', '2026-08-13 08:13:34', '2026-08-13 08:13:34'),
(5, 'Clotrivag 200', 'clo', '', NULL, 1, 'BATCH-71912A2F', '890670674265', '', 0.00, 2500.00, 50, 10, '2029-01-01', 'Shelf A-1', '2026-08-13 08:14:39', '2026-08-13 08:14:39'),
(6, 'Caps itraconozole 120LE', 'caps', '', NULL, 1, 'BATCH-5C89D2F7', '890457218744', '', 0.00, 2700.00, 11, 10, '2027-08-01', 'Shelf A-1', '2026-08-13 08:16:07', '2026-08-13 08:16:07'),
(7, 'Caps itratonozole Itacare', 'caps', '', NULL, 1, 'BATCH-1A519C6B', '890401217815', '', 0.00, 8250.00, 5, 10, '2027-03-01', 'Shelf A-1', '2026-08-13 08:17:17', '2026-08-13 08:17:17'),
(8, 'Terbinafine TERBIFACE', 'Ter', '', NULL, 1, 'BATCH-4A882061', '890787381316', '', 0.00, 1500.00, 3, 10, '2027-04-01', 'Shelf A-1', '2026-08-13 08:18:38', '2026-08-13 08:18:38'),
(9, 'Terbinafine 250mg', 'ter', '', NULL, 1, 'BATCH-370B2F5C', '890661596841', '', 0.00, 6000.00, 3, 10, '2028-11-01', 'Shelf A-1', '2026-08-13 08:19:45', '2026-08-13 08:19:45'),
(10, 'Terbinafine Tabisafe', 'ter', '', NULL, 1, 'BATCH-503C85FE', '890682513084', '', 0.00, 2200.00, 2, 10, '2027-08-01', 'Shelf A-1', '2026-08-13 08:20:36', '2026-08-13 09:04:57'),
(11, 'Canesten', 'ca', '', NULL, 1, 'BATCH-E1136A42', '890440970559', '', 0.00, 12000.00, 5, 10, '2027-09-01', 'Shelf A-1', '2026-08-13 08:21:29', '2026-08-13 08:22:50'),
(12, 'Mycoten Viginal cream', 'vg', '', NULL, 1, 'BATCH-71E3A6CE', '890609571110', '', 0.00, 2400.00, 9, 10, '2030-02-01', 'Shelf A-1', '2026-08-13 08:22:40', '2026-08-13 08:23:11'),
(13, 'Mycoten plus V cream', 'v cream', '', NULL, 1, 'BATCH-A65AC637', '890639998373', '', 0.00, 2700.00, 12, 10, '2029-12-13', 'Shelf A-1', '2026-08-13 08:24:11', '2026-08-13 08:24:11'),
(14, 'Nystatin oral tab', 'oral', '', NULL, 1, 'BATCH-D3C8EAC9', '890746462857', '', 0.00, 2200.00, 4, 10, '2027-07-01', 'Shelf A-1', '2026-08-13 08:25:12', '2026-08-13 08:25:12'),
(15, 'Fluconozole 50mg Emzor by 3', '1', '', NULL, 1, 'BATCH-F26F20AE', '890747231573', '', 0.00, 800.00, 56, 10, '2028-04-01', 'Shelf A-1', '2026-08-13 08:26:31', '2026-08-13 08:26:31'),
(16, 'Diflucan 50mg by 3', '3', '', NULL, 1, 'BATCH-A758DA99', '890435307413', '', 0.00, 5700.00, 5, 10, '2028-03-01', 'Shelf A-1', '2026-08-13 08:27:52', '2026-08-13 08:27:52'),
(17, 'Flucamed 200mg', '32', '', NULL, 1, 'BATCH-847FCEFF', '890574074270', '', 0.00, 4800.00, 9, 10, '2030-02-01', 'Shelf A-1', '2026-08-13 08:28:52', '2026-08-13 08:28:52'),
(18, 'Tinizol', 'tin', '', NULL, 1, 'BATCH-105EA5E2', '890813606034', '', 0.00, 400.00, 16, 10, '2027-07-01', 'Shelf A-1', '2026-08-13 08:29:50', '2026-08-13 08:29:50'),
(19, 'BERLIN Fluconozole 150mg', 'fluco', '', NULL, 1, 'BATCH-9B833367', '890558515891', '', 0.00, 800.00, 5, 10, '2027-07-01', 'Shelf A-1', '2026-08-13 08:30:40', '2026-08-13 08:30:40'),
(20, 'EDEN Fluconozole 200mg', 'ter', '', NULL, 1, 'BATCH-2663D623', '890877809226', '', 0.00, 1000.00, 14, 10, '2028-04-01', 'Shelf A-1', '2026-08-13 08:31:24', '2026-08-13 08:31:24'),
(21, 'Clotriderm thrush cream', 'w', '', NULL, 1, 'BATCH-911A37E8', '890540720471', '', 0.00, 1200.00, 3, 10, '2028-07-01', 'Shelf A-1', '2026-08-13 08:32:20', '2026-08-13 08:32:20'),
(22, 'Gynamaed V Cream', 'gy', '', NULL, 1, 'BATCH-D6AA48EA', '890125069704', '', 0.00, 1500.00, 7, 10, '2030-01-01', 'Shelf A-1', '2026-08-13 08:33:09', '2026-08-13 09:04:30'),
(23, 'Mystatin V tab', 'y', '', NULL, 1, 'BATCH-8A13B44A', '890797704008', '', 0.00, 1500.00, 9, 10, '2027-07-01', 'Shelf A-1', '2026-08-13 08:33:56', '2026-08-13 08:33:56'),
(24, 'Caps Fluconozole 50mg by 10', 'u', '', NULL, 1, 'BATCH-0D810FE6', '890435959670', '', 0.00, 1800.00, 29, 10, '2027-05-01', 'Shelf A-1', '2026-08-13 08:35:02', '2026-08-13 08:35:02'),
(25, 'Nystatin oral suspension', 'Nystatin', '', NULL, 1, 'BATCH-97F9CD49', '890485171545', '', 0.00, 1800.00, 13, 10, '2027-11-01', 'Shelf A-1', '2026-08-13 08:36:02', '2026-08-13 08:36:02'),
(26, 'Barifuluin', 'pcm', '', NULL, 1, 'BATCH-04D3BA64', '890557226279', '', 0.00, 2400.00, 5, 10, '2028-09-01', 'Shelf A-1', '2026-08-13 08:36:57', '2026-08-13 08:36:57'),
(27, 'Pyrantrin oral suspension', 'e', '', NULL, 1, 'BATCH-66DFD69C', '890350895304', '', 0.00, 1500.00, 3, 10, '2029-04-01', 'Shelf A-1', '2026-08-13 08:38:03', '2026-08-13 08:38:03'),
(28, 'Grisokris oral suspension', 'pcm', '', NULL, 1, 'BATCH-E807A0BB', '890870399093', '', 0.00, 1300.00, 7, 10, '2028-11-01', 'Shelf A-1', '2026-08-13 08:39:06', '2026-08-13 08:39:06'),
(29, 'Zolat oral suspension', 'e', '', NULL, 1, 'BATCH-2AE100C8', '890642086217', '', 0.00, 1000.00, 9, 10, '2029-01-01', 'Shelf A-1', '2026-08-13 08:39:41', '2026-08-13 08:39:41'),
(30, 'Flucamed oral suspension', 'pcm', '', NULL, 1, 'BATCH-33C3E441', '890484452608', '', 0.00, 1900.00, 1, 10, '2029-09-01', 'Shelf A-1', '2026-08-13 08:40:27', '2026-08-13 08:40:27'),
(31, 'Zolat chewable tablet', 'pcm', '', NULL, 1, 'BATCH-11AC13AD', '890407815676', '', 0.00, 500.00, 78, 10, '2028-03-01', 'Shelf A-1', '2026-08-13 08:41:41', '2026-08-13 08:41:41'),
(32, 'Zentel Albendazole 200mg', 'e', '', NULL, 1, 'BATCH-0382F064', '890715376435', '', 0.00, 1500.00, 17, 10, '2030-03-01', 'Shelf A-1', '2026-08-13 08:43:06', '2026-08-13 08:43:06'),
(33, 'Secnidazole secwid', 'w', '', NULL, 1, 'BATCH-A28E0168', '890207984837', '', 0.00, 1000.00, 19, 10, '2027-10-01', 'Shelf A-1', '2026-08-13 08:44:08', '2026-08-13 08:44:08'),
(34, 'Prazequentel tab', 'u', '', NULL, 1, 'BATCH-EA9E5C2A', '890719613808', '', 0.00, 2000.00, 2, 10, '2028-08-01', 'Shelf A-1', '2026-08-13 08:45:17', '2026-08-13 08:45:17'),
(35, 'Pyrantrim', '3', '', NULL, 1, 'BATCH-E806BC23', '890879463151', '', 0.00, 1300.00, 3, 10, '2029-01-01', 'Shelf A-1', '2026-08-13 08:45:51', '2026-08-13 08:45:51'),
(36, 'Fluconozole 150mg by 1 (Teva)', 'pcm', '', NULL, 1, 'BATCH-351768CB', '890341612097', '', 0.00, 7000.00, 4, 10, '2028-02-01', 'Shelf A-1', '2026-08-13 08:47:02', '2026-08-13 08:47:02'),
(37, 'Fluconozole 50mg by 10 (Teva)', 'w', '', NULL, 1, 'BATCH-F09A558A', '890784144013', '', 0.00, 6600.00, 6, 10, '2028-01-01', 'Shelf A-1', '2026-08-13 08:47:43', '2026-08-13 08:47:43'),
(38, 'The 7 keys Herbal mixture', 'w', '', NULL, 1, 'BATCH-B0B4152D', '890227292229', '', 0.00, 1600.00, 14, 10, '2027-08-13', 'Shelf A-1', '2026-08-13 08:48:59', '2026-08-13 08:48:59'),
(39, 'Teething powder', 'pcm', '', NULL, 1, 'BATCH-7E6D828D', '890210167940', '', 0.00, 150.00, 131, 10, '2028-12-01', 'Shelf A-1', '2026-08-13 08:50:38', '2026-08-13 08:50:38'),
(40, 'Kvila matricaria infant powder', 'j', '', NULL, 1, 'BATCH-ECF036F7', '890995690552', '', 0.00, 150.00, 128, 10, '2027-08-01', 'Shelf A-1', '2026-08-13 08:51:34', '2026-08-13 08:51:34'),
(41, 'Jawalk', 'we', '', NULL, 1, 'BATCH-2A923FF1', '890898526533', '', 0.00, 1700.00, 5, 10, '2028-10-01', 'Shelf A-1', '2026-08-13 08:52:35', '2026-08-13 08:52:35'),
(42, 'Mist potassium citrate', 'gh', '', NULL, 1, 'BATCH-83347054', '890370996787', '', 0.00, 400.00, 31, 10, '2027-08-13', 'Shelf A-1', '2026-08-13 08:53:09', '2026-08-13 08:53:09'),
(43, 'Galway', 'w', '', NULL, 1, 'BATCH-BAB9DA88', '890662505108', '', 0.00, 800.00, 21, 10, '2028-11-01', 'Shelf A-1', '2026-08-13 08:53:40', '2026-08-13 08:53:40'),
(44, 'Wosan Povidon iodine 10%', 'w', '', NULL, 1, 'BATCH-E26C5474', '890934571924', '', 0.00, 2500.00, 5, 10, '2028-02-01', 'Shelf A-1', '2026-08-13 08:54:50', '2026-08-13 08:54:50'),
(45, 'Wosan Povidon iodine 5%', 'q', '', NULL, 1, 'BATCH-0F41AE99', '890764017889', '', 0.00, 1600.00, 11, 10, '2028-03-01', 'Shelf A-1', '2026-08-13 08:56:08', '2026-08-13 08:56:08'),
(46, 'Gemicide Z', 'd', '', NULL, 1, 'BATCH-8B47C428', '890703224997', '', 0.00, 850.00, 2, 10, '2027-08-13', 'Shelf A-1', '2026-08-13 08:56:45', '2026-08-13 08:56:45'),
(47, 'MOKO Iodine', 'y', '', NULL, 1, 'BATCH-939FA19A', '890553622922', '', 0.00, 1500.00, 5, 10, '2028-04-01', 'Shelf A-1', '2026-08-13 08:57:27', '2026-08-13 08:57:27'),
(48, 'Hydrogen Peroxide', 'y', '', NULL, 1, 'BATCH-2CA81719', '890158673708', '', 0.00, 500.00, 12, 10, '2028-12-01', 'Shelf A-1', '2026-08-13 08:58:12', '2026-08-13 08:58:12'),
(49, 'MOKO Benzyl Benzoate', 'y', '', NULL, 1, 'BATCH-AD4A0616', '890586024366', '', 0.00, 1500.00, 2, 10, '2029-01-01', 'Shelf A-1', '2026-08-13 09:00:53', '2026-08-13 09:00:53'),
(50, 'Be-Be lotion', 't', '', NULL, 1, 'BATCH-EF0D0684', '890587858099', '', 0.00, 1200.00, 9, 10, '2029-02-01', 'Shelf A-1', '2026-08-13 09:01:43', '2026-08-13 09:01:43'),
(51, 'Olive oil (Roberts)', '5', '', NULL, 1, 'BATCH-AAEC8A07', '890265164695', '', 0.00, 1200.00, 5, 10, '2027-08-13', 'Shelf A-1', '2026-08-13 09:02:28', '2026-08-13 09:02:28'),
(52, 'Olive oil (Goya)', 't', '', NULL, 1, 'BATCH-A32E1823', '890316887979', '', 0.00, 1700.00, 37, 10, '2027-08-13', 'Shelf A-1', '2026-08-13 09:03:06', '2026-08-13 09:03:06'),
(53, 'Castor Oil', 'y', '', NULL, 1, 'BATCH-FA11DBE0', '890727589670', '', 0.00, 5000.00, 8, 10, '2030-06-01', 'Shelf A-1', '2026-08-13 09:03:56', '2026-08-13 09:03:56'),
(54, 'Acetylsalicylic acid 75mg (emprim)', 'ac', '', NULL, 2, 'BATCH-960A2AA3', '890673765971', '', 0.00, 100.00, 32, 10, '2028-04-01', 'Shelf A-1', '2026-08-13 09:08:44', '2026-08-13 09:08:44'),
(55, 'Amiloride hydrochlorides\' (normal)', 'nml', '', NULL, 2, 'BATCH-289C3101', '890189620815', '', 0.00, 350.00, 1, 10, '2028-07-01', 'Shelf A-1', '2026-08-13 09:11:02', '2026-08-13 09:54:09'),
(56, 'Amiloride (bonduretic)', 'b', '', NULL, 2, 'BATCH-34F553F8', '890746268256', '', 0.00, 200.00, 1, 10, '2028-12-01', 'Shelf A-1', '2026-08-13 09:12:16', '2026-08-13 14:29:54'),
(57, 'Yasoprin', 'y', '', NULL, 2, 'BATCH-DF4FF3EC', '890370095374', '', 0.00, 150.00, 8, 10, '2028-09-01', 'Shelf A-1', '2026-08-13 09:14:48', '2026-08-13 09:14:48'),
(58, 'rivarozaban (xarelto) 10mg', 'xl', '', NULL, 2, 'BATCH-DE643DBD', '890341718567', '', 0.00, 22000.00, 6, 10, '2027-03-01', 'Shelf A-1', '2026-08-13 09:17:20', '2026-08-13 09:17:20'),
(59, 'Rivarozaban (ravasmart) 10mg', 'rv', '', NULL, 2, 'BATCH-FBD88123', '890686307426', '', 0.00, 2700.00, 21, 10, '2027-02-01', 'Shelf A-1', '2026-08-13 09:19:54', '2026-08-13 09:19:54'),
(60, 'Propranolol 40mg (eden)', 'ed', '', NULL, 2, 'BATCH-D334634F', '890856422145', '', 0.00, 600.00, 5, 10, '2026-08-01', 'Shelf A-1', '2026-08-13 09:22:39', '2026-08-13 09:22:39'),
(61, 'Allopurinol (zyloric) 300mg', 'h', '', NULL, 2, 'BATCH-A5E250BF', '890560474867', '', 0.00, 5000.00, 2, 10, '2028-07-01', 'Shelf A-1', '2026-08-13 09:27:22', '2026-08-13 14:29:54'),
(62, 'Bisaprolol concor 5mg', 'i', '', NULL, 2, 'BATCH-9A798478', '890933993195', '', 0.00, 2700.00, 1, 10, '2028-02-01', 'Shelf A-1', '2026-08-13 09:28:52', '2026-08-13 09:28:52'),
(63, 'Bisaprolol B-Cor 5', 'u', '', NULL, 2, 'BATCH-A6DCF9EC', '890665371445', '', 0.00, 1400.00, 4, 10, '2029-01-01', 'Shelf A-1', '2026-08-13 09:29:58', '2026-08-13 09:29:58'),
(64, 'Bisaprolol Concor 10mg', 'h', '', NULL, 2, 'BATCH-383013FB', '890466560165', '', 0.00, 3300.00, 2, 10, '2026-11-01', 'Shelf A-1', '2026-08-13 09:30:50', '2026-08-13 09:30:50'),
(65, 'Bisaprolol onCor 2.5mg', 'sy', '', NULL, 2, 'BATCH-B192CB68', '890642388399', '', 0.00, 2150.00, 6, 10, '2028-04-01', 'Shelf A-1', '2026-08-13 09:31:50', '2026-08-13 09:31:50'),
(66, 'Losartan potassium 50mg antytex', 'k', '', NULL, 2, 'BATCH-280A7CEC', '890640928322', '', 0.00, 700.00, 7, 10, '2027-06-01', 'Shelf A-1', '2026-08-13 09:34:15', '2026-08-13 09:34:15'),
(67, 'Losartan potassium 50 zmc', 'h', '', NULL, 2, 'BATCH-22420ACD', '890488765094', '', 0.00, 700.00, 3, 10, '2028-07-01', 'Shelf A-1', '2026-08-13 09:35:02', '2026-08-13 09:35:02'),
(68, 'Losartan pocco 100mg', 'u', '', NULL, 2, 'BATCH-52DF390D', '890161837874', '', 0.00, 900.00, 6, 10, '2028-09-01', 'Shelf A-1', '2026-08-13 09:36:13', '2026-08-13 09:36:13'),
(69, 'Losartan 50mg TEVA', 'j', '', NULL, 2, 'BATCH-E2B146B3', '890765620157', '', 0.00, 2250.00, 18, 10, '2028-04-01', 'Shelf A-1', '2026-08-13 09:37:10', '2026-08-13 09:37:10'),
(70, 'Losartan 100mg TEVA', 'e', '', NULL, 2, 'BATCH-ADDDA46D', '890253674668', '', 0.00, 2600.00, 8, 10, '2028-04-01', 'Shelf A-1', '2026-08-13 09:37:45', '2026-08-13 09:37:45'),
(71, 'Losartan 100mg POM', 'U', '', NULL, 2, 'BATCH-4F995DDA', '890693438090', '', 0.00, 750.00, 7, 10, '2027-06-01', 'Shelf A-1', '2026-08-13 09:38:33', '2026-08-13 09:38:33'),
(72, 'Amlodipine 10mg EMZOVASE', 'u', '', NULL, 2, 'BATCH-F6B96AB7', '890675146141', '', 0.00, 350.00, 58, 10, '2028-11-01', 'Shelf A-1', '2026-08-13 09:39:35', '2026-08-13 09:39:35'),
(73, 'Amlodipine 10mg TAYVAS', 'iu', '', NULL, 2, 'BATCH-B7317879', '890807240158', '', 0.00, 250.00, 4, 10, '2027-09-01', 'Shelf A-1', '2026-08-13 09:40:15', '2026-08-13 09:40:15'),
(74, 'Amlodipine 10mg MECURE', 'J', '', NULL, 2, 'BATCH-242DA7F9', '890533625315', '', 0.00, 250.00, 6, 10, '2028-10-01', 'Shelf A-1', '2026-08-13 09:41:22', '2026-08-13 14:29:54'),
(75, 'Lisinopril 10mg TEVA', 'h', '', NULL, 2, 'BATCH-AF8718B4', '890640554286', '', 0.00, 1100.00, 6, 10, '2027-04-01', 'Shelf A-1', '2026-08-13 09:42:16', '2026-08-13 09:42:16'),
(76, 'Lisinopril 10mg TAMAPRI', 'W', '', NULL, 2, 'BATCH-CC760255', '890838071723', '', 0.00, 700.00, 9, 10, '2028-06-01', 'Shelf A-1', '2026-08-13 09:43:14', '2026-08-13 09:43:14'),
(77, 'Atorvastatin 10mg (Tonasetin 10)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 600.00, 5, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:19:29', '2026-08-13 10:19:29'),
(78, 'Rosuvastatin 10mg (At... 10)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 1700.00, 5, 10, '2028-04-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(79, 'Rosuvastatin 10mg (Swipha)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 1500.00, 4, 10, '2027-01-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(80, 'Methyldopa 250mg (Aldoxin)', '', NULL, 'card', 3, '', NULL, NULL, 0.00, 800.00, 4, 10, '2028-04-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(81, 'Acetazolamide 250mg (Mantes)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 1050.00, 2, 10, '2027-09-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(82, 'Dutasteride (Alodart)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 15500.00, 5, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(83, 'Acetazolamide 250mg (Klydamox)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 1400.00, 2, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(84, 'Slow K (KCL Retard) 600mg', '', NULL, 'card', 3, '', NULL, NULL, 0.00, 1380.00, 2, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(85, 'Gliclazide (Diamicron) 60mg', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 11600.00, 1, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(86, 'Hydrochlorothiazide 25mg (Hyrex)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 200.00, 5, 10, '2028-03-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(87, 'Metformin (Glucophage) 1000mg', '', NULL, 'card', 3, '', NULL, NULL, 0.00, 4750.00, 2, 10, '2028-12-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(88, 'Sitagliptin 50mg + Metformin', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 3200.00, 2, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(89, 'Glimepiride 4mg (Perglim)', '', NULL, 'card', 3, '', NULL, NULL, 0.00, 2100.00, 1, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(90, 'Glimepiride 4mg (Gyperid)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 750.00, 9, 10, '2028-03-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(91, 'Glimepiride 2mg (Perglim)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 1900.00, 3, 10, '2028-07-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(92, 'Dapagliflozin 10mg (Dapgin 10)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 2450.00, 2, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(93, 'Metformin Hydrochloride 500mg (Emziple?)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 400.00, 19, 10, '2026-12-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(94, 'Glibenclamide 5mg', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 350.00, 10, 10, '2028-02-29', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(95, 'Metformin Hydrochloride 500mg (Dibimet)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 1600.00, 2, 10, '2027-01-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(96, 'Metformin Hydrochloride 1000mg (Dibimet)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 2300.00, 3, 10, '2028-10-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(97, 'Metformin 500mg (Diabetmin)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 500.00, 3, 10, '2027-10-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(98, 'Metformin Hydrochloride (Panfor)', '', NULL, 'pack', 3, '', NULL, NULL, 0.00, 1300.00, 9, 10, '2028-12-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(99, 'Digoxin (C... Digoxin)', '', NULL, 'card', 2, '', NULL, NULL, 0.00, 2400.00, 7, 10, '2028-04-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(100, 'Nifedipine 20mg (Krishnat Nifedipine)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 180.00, 11, 10, '2029-01-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(101, 'Frusemide (Krishnat)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 150.00, 2, 10, '2028-12-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(102, 'Torsemide 10mg (Torsin-EX)', '', NULL, 'card', 2, '', NULL, NULL, 0.00, 1000.00, 3, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(103, 'Methyldopa 250mg (Krishnat)', '', NULL, 'card', 2, '', NULL, NULL, 0.00, 600.00, 2, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(104, 'Bendrofluazide 5mg (Telsa)', '', NULL, 'card', 2, '', NULL, NULL, 0.00, 150.00, 20, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(105, 'Nifedipine (Nifecard XL 30mg)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 2100.00, 3, 10, '2027-10-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(106, 'Methyldopa 250mg', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 1600.00, 4, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(107, 'Amlodipine 10mg (Tamadipine)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 600.00, 6, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(108, 'Amlodipine 5mg (Tamadipine)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 450.00, 8, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(109, 'Lisinopril 10mg (Tamapril)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 700.00, 2, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(110, 'Labetalol (Labset 200mg)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 1600.00, 2, 10, '2029-02-28', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(111, 'Carvedilol (Carveloc 3.125)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 750.00, 5, 10, '2026-10-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(112, 'Carvedilol (Carveloc)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 750.00, 6, 10, '2028-10-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(113, 'Spironolactone 25mg', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 800.00, 3, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(114, 'Atenolol 50mg', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 400.00, 5, 10, '2027-07-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(115, 'Tamsulosin (Contiflo XL)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 900.00, 10, 10, '2028-12-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(116, 'Atenolol 100mg (Tenoric)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 2500.00, 22, 10, '2028-01-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(117, 'Labetalol Hydrochloride 200mg (Zam...)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 150.00, 150, 10, '2027-08-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(118, 'Clopidogrel (Richplavex) 75mg', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 1250.00, 7, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(119, 'Carvedilol 6.25mg (Cresedex)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 950.00, 11, 10, '2028-10-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(120, 'Clopidogrel 75mg (Frosbom)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 450.00, 8, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(121, 'Labetalol 200mg (Eldon)', '', NULL, 'pack', 2, '', NULL, NULL, 0.00, 170.00, 5, 10, '2028-12-31', 'Shelf A1', '2026-08-13 10:21:29', '2026-08-13 10:21:29'),
(122, 'Fly J (Jubel)', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 150.00, 3, 10, '2028-10-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(123, 'Lisinopril 5mg (Teva)', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 2400.00, 5, 10, '2027-09-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(124, 'Lofsinex 20mg (Micro Lab)', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 4200.00, 3, 10, '2028-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(125, 'Tobramycin Ointment', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 3600.00, 3, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(126, 'Inj Pem (Naza Plus)', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 100.00, 1, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(127, 'Clobetasol (GSK)', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 3800.00, 3, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(128, 'Griseofulvin (Baripharm)', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 2400.00, 5, 10, '2028-12-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(129, 'Ciprotal Oint (Cipentra)', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 1100.00, 1, 10, '2027-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(130, 'Torsenex 10mg (Micro Lab)', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 3800.00, 3, 10, '2028-12-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(131, 'Slo-K 600mg (Alliance Biotech)', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 6000.00, 8, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(132, 'Exodryl Cough Syr (Chemicon)', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 600.00, 3, 10, '2029-03-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(133, 'Losartan Potassium 50mg (Losar?)', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 1400.00, 1, 10, '2029-01-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(134, 'Losartan Potassium 25mg (Pocco)', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 1300.00, 1, 10, '2028-03-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(135, 'Chlorphenamine (Phufed)', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 150.00, 10, 10, '2028-11-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(136, 'Extra Care Dettol', '', NULL, 'box', 12, '', NULL, NULL, 0.00, 3300.00, 1, 10, '2029-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(137, 'Extra Free Dettol', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 3200.00, 3, 10, '2029-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(138, 'Dettol', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 1800.00, 1, 10, '2029-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(139, 'Dettol', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1200.00, 3, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(140, 'Cussons Carex', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1200.00, 4, 10, '2029-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(141, 'Mouth Wash', '', NULL, 'bottle', 12, '', NULL, NULL, 0.00, 0.00, 1, 10, '2028-10-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(142, 'Mouth Wash', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1200.00, 3, 10, '2028-10-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(143, 'Hexodent Mouth Wash', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1700.00, 4, 10, '2027-09-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(144, 'Punt Antiseptic Promo Pack', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 2800.00, 1, 10, '2027-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(145, 'Brett Mouthwash', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 1900.00, 1, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(146, 'Brett Mouthwash', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1900.00, 3, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(147, 'Brett Mouthwash', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 3500.00, 1, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(148, 'Liquid Antiseptic NCP Promotes Natural', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1500.00, 10, 10, '2028-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(149, 'Robb Will Being', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 1400.00, 4, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(150, 'Aboniki Balm', '', NULL, 'packs', 12, '', NULL, NULL, 0.00, 1000.00, 7, 10, '2029-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 14:28:30'),
(151, 'Aboniki Balm', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 1400.00, 9, 10, '2027-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(152, 'Mentholatum', '', NULL, 'packs', 12, '', NULL, NULL, 0.00, 1200.00, 3, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(153, 'Benchie Mentholatum', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 850.00, 1, 10, '2028-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(154, 'Extra Menthol Robb', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 600.00, 1, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(155, 'Fine Xtra', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 700.00, 30, 10, '2029-02-28', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(156, 'Gold Circle Assorted', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 700.00, 36, 10, '2026-09-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(157, 'Gold Circle', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 700.00, 1, 10, '2027-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(158, 'Kiss', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 500.00, 36, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(159, 'Peter Kiss', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 500.00, 36, 10, '2027-12-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(160, 'Durex Feels', '', NULL, 'box', 12, '', NULL, NULL, 0.00, 1200.00, 21, 10, '2030-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(161, 'Durex Select', '', NULL, 'box', 12, '', NULL, NULL, 0.00, 3500.00, 7, 10, '2029-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(162, 'Flex Treasure', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 700.00, 12, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(163, 'Fine Xtra', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 700.00, 13, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(164, 'Kiss Lube Gel', '', NULL, 'pcs', 12, '', NULL, NULL, 0.00, 3000.00, 9, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(165, 'Durex Featherlite', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 41500.00, 12, 10, '2029-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(166, 'Back-Up', '', NULL, 'box', 12, '', NULL, NULL, 0.00, 16500.00, 14, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(167, 'Back-Up', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1600.00, 16, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(168, 'Postinor', '', NULL, 'box', 12, '', NULL, NULL, 0.00, 24000.00, 14, 10, '2027-02-28', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(169, 'Post Pill', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 2600.00, 15, 10, '2027-02-28', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(170, 'Postinor 2', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 500.00, 20, 10, '2027-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(171, 'Postinor 2', '', NULL, 'box', 12, '', NULL, NULL, 0.00, 2500.00, 12, 10, '2027-02-28', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(172, 'Postinor 2', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 2500.00, 6, 10, '2027-02-28', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(173, 'Stalong Tadalafil', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1300.00, 4, 10, '2027-02-28', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(174, 'Stalong Tadalafil', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 700.00, 2, 10, '2027-02-28', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(175, 'Kifram Sildenafil Comprimidos', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 500.00, 12, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(176, 'Kifram Sildenafil Comprimidos', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 500.00, 14, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(177, 'Man-Ga Sildenafil Tablet', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 500.00, 12, 10, '2029-09-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(178, 'Man-Ga Sildenafil Tablet', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 500.00, 14, 10, '2029-09-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(179, 'Boxer Insecticide Spray', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1300.00, 6, 10, '2028-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(180, 'Boxer Pro Insecticide Spray', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1700.00, 5, 10, '2029-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(181, 'BNC Mosquito Spray', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 2400.00, 5, 10, '2029-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(182, 'Mortein Insta Kill', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 3600.00, 6, 10, '2029-02-28', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(183, 'Rambo Insecticide', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 2500.00, 6, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(184, 'Rambo Insecticide Masic', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 2600.00, 5, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(185, 'Rambo Insecticide Pro', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 2100.00, 6, 10, '2029-09-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(186, 'Deep Heat', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 6500.00, 3, 10, '2029-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(187, 'Promise Bleach', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1200.00, 7, 10, '2027-07-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(188, 'Jix Multi-Purpose Bleach', '', NULL, 'pack', 12, '', NULL, NULL, 0.00, 2000.00, 5, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(189, 'Pruit Antiseptic', '', NULL, 'box', 12, '', NULL, NULL, 0.00, 1300.00, 3, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(190, 'Pruit Antiseptic', '', NULL, 'pieces', 12, '', NULL, NULL, 0.00, 1200.00, 3, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:28:44', '2026-08-13 10:28:44'),
(191, 'Misoprost (GUT)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 4800.00, 10, 10, '2027-09-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(192, 'Amokclav 625', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 4000.00, 10, 10, '2027-01-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(193, 'Diclofenac Sodium Suppository 100mg', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 500.00, 2, 10, '2028-10-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(194, 'Banfuvin (Griseofulvin)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 2300.00, 10, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(195, 'Spironolactone 25mg', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 1600.00, 10, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(196, 'Neblong (Nebivolol) 5mg', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 4800.00, 5, 10, '2028-02-29', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(197, 'Fluconazole (GUT)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 1800.00, 10, 10, '2029-03-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(198, 'Metrilix 5mg', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 6000.00, 5, 10, '2028-01-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(199, 'Gondu...c', '', NULL, 'packs', 10, '', NULL, NULL, 0.00, 300.00, 10, 10, '2028-12-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(200, 'Carvedilol 3.125mg', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1400.00, 1, 10, '2028-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(201, 'Coartem', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 4200.00, 10, 10, '2029-01-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(202, 'Coartem', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 3000.00, 4, 10, '2029-12-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(203, 'Amoxil 500mg', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 2400.00, 2, 10, '2029-05-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(204, 'Digoxin 0.25mg', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 400.00, 1, 10, '2029-01-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(205, 'Normorth C', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 400.00, 10, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(206, 'Clopidogrel Cegrel', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1600.00, 1, 10, '2028-07-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(207, 'Neurogesic Big', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 2600.00, 1, 10, '2029-12-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(208, 'Neurogesic Extra Small', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1300.00, 2, 10, '2030-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(209, 'Neurogesic Plus Small', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 400.00, 2, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(210, 'Epo-Eja Plus', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 3500.00, 5, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(211, 'Inj Clindamycin 300mg', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1600.00, 1, 10, '2027-07-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(212, 'Amitriptyline Hydrochloride', '', NULL, 'bottle', 10, '', NULL, NULL, 0.00, 9000.00, 1, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(213, 'Rabeprazole (Barole)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 2200.00, 3, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(214, 'Rabeprazole Sodium + Domperidone', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1300.00, 10, 10, '2029-03-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(215, 'Domperidone (30) Tabs', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 4800.00, 4, 10, '2029-05-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(216, 'Cimetidine 400mg', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1000.00, 2, 10, '2029-02-28', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(217, 'Cimetidine 200mg', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 900.00, 4, 10, '2029-02-28', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(218, 'Naproxen + Esomeprazole (Eproxen)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 3200.00, 10, 10, '2029-03-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(219, 'Rabeprazole + Domperidone', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 2300.00, 13, 10, '2029-01-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(220, 'Omeprazole (Fama)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 3500.00, 8, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(221, 'Omeprazole (Meprazole)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1600.00, 6, 10, '2029-01-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(222, 'Omeprazole (Swipha)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 2500.00, 10, 10, '2029-10-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(223, 'Tab Rulox', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 250.00, 26, 10, '2028-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(224, 'Susp Rulox (Small)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 1300.00, 28, 10, '2029-05-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(225, 'Susp Rulox (Big)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 2300.00, 23, 10, '2029-03-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(226, 'Susp Polygel', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 2200.00, 12, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(227, 'Chewable Antacid (Gastal)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 200.00, 28, 10, '2029-02-28', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(228, 'Gaviscon (Double)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 11600.00, 5, 10, '2027-08-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(229, 'Gaviscon', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 8500.00, 5, 10, '2027-05-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(230, 'Relcer Gel (Small)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 1200.00, 6, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(231, 'Relcer Gel (Big)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 2400.00, 6, 10, '2028-02-29', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(232, 'Gaviscon (Sachet)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 800.00, 8, 10, '2028-01-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(233, 'Susp Mar-Ch', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 1800.00, 43, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(234, 'Susp Abloe Bismuth', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 3000.00, 1, 10, '2028-07-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(235, 'Andrews', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 400.00, 89, 10, '2027-06-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(236, 'Susp Nugel-O', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 3500.00, 2, 10, '2028-04-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(237, 'Susp Locro', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 2800.00, 7, 10, '2027-02-28', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(238, 'Susp Gestal (Small)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 1400.00, 45, 10, '2029-04-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(239, 'Susp Gestal (Big)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 2300.00, 21, 10, '2029-05-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(240, 'Dancmed', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 200.00, 18, 10, '2029-03-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(241, 'Entrosil Chewable', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 350.00, 6, 10, '2028-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(242, 'Krisael', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 150.00, 16, 10, '2028-12-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(243, 'Gascol Chewable', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 150.00, 4, 10, '2028-05-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(244, 'Rennie (Peppermint)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 800.00, 4, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(245, 'Magnesium Trisilicate', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 700.00, 39, 10, '2028-04-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(246, 'Magnesium Trisilicate (Small)', '', NULL, 'pcs', 10, '', NULL, NULL, 0.00, 400.00, 59, 10, '2028-04-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(247, 'Rabeprazole (Visprid)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1000.00, 4, 10, '2028-07-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(248, 'Rabeprazole (RB Care)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1000.00, 5, 10, '2028-08-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(249, 'Ranitidine (Ranitas)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1000.00, 10, 10, '2028-03-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(250, 'Ranitidine (Zulace)', '', NULL, 'card', 10, '', NULL, NULL, 0.00, 1000.00, 4, 10, '2028-05-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(251, 'Omeprazole (Omut)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1000.00, 14, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(252, 'Esomeprazole (Nexium)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 10200.00, 2, 10, '2027-08-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(253, 'Esomeprazole (Nexium) by 4 Tabs', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 14000.00, 1, 10, '2027-08-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(254, 'Esomeprazole (P... 20)', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 1000.00, 2, 10, '2028-02-29', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(255, 'Esomeprazole (Esop-40)', '', NULL, 'packs', 10, '', NULL, NULL, 0.00, 4000.00, 2, 10, '2026-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(256, 'Domperidone 10mg Tabs', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 150.00, 3, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(257, 'Esofagy-K', '', NULL, 'card', 10, '', NULL, NULL, 0.00, 12000.00, 6, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(258, 'Esofagy-D', '', NULL, 'pack', 10, '', NULL, NULL, 0.00, 6000.00, 2, 10, '2028-05-31', 'Shelf A1', '2026-08-13 10:50:34', '2026-08-13 10:50:34'),
(259, 'Amatem Softgel 20/120', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 2000.00, 0, 10, '2027-09-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 14:29:54'),
(260, 'Amatem Softgel 80/450', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 2700.00, 9, 10, '2028-05-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(261, 'Malither', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 2000.00, 33, 10, '2027-01-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(262, 'Coartal Forte', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 2100.00, 37, 10, '2028-04-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(263, 'Luter', '', NULL, 'roll', 4, '', NULL, NULL, 0.00, 2000.00, 4, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(264, 'Camosunate', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 2300.00, 2, 10, '2029-06-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(265, 'Bakinul Softgel', '', NULL, 'roll', 4, '', NULL, NULL, 0.00, 2950.00, 4, 10, '2029-01-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(266, 'Artequick', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 3500.00, 2, 10, '2028-05-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(267, 'Quinine Sulphate', '', NULL, 'card', 4, '', NULL, NULL, 0.00, 1000.00, 2, 10, '2028-04-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(268, 'Primena Tablet', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 800.00, 7, 10, '2028-05-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(269, 'Primena QS Tablet', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 700.00, 10, 10, '2029-01-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(270, 'Coartem Dispersible', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 1800.00, 4, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(271, 'Bellartem', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 1400.00, 1, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(272, 'Softem', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 2000.00, 1, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(273, 'Topmal 20/120/6 Tabs', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 1300.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(274, 'Topmal 20/120/24 Tabs', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 2000.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(275, 'Topmal 20/120/18 Tabs', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 1900.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(276, 'Topmal 20/120/12 Tabs', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 1800.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(277, 'Topmal 80/450/6 Tabs', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 0.00, 1, 10, '2028-11-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(278, 'Kesartem', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 800.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(279, 'Arenax Plus 80/450', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 2000.00, 10, 10, '2028-10-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(280, 'Arenax Plus 20/120', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 700.00, 2, 10, '2027-01-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(281, 'Lakmal QS Adult', '', NULL, 'card', 4, '', NULL, NULL, 0.00, 1400.00, 82, 10, '2026-10-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(282, 'Lakmal Dispersible', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 700.00, 3, 10, '2029-03-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(283, 'Konart AS', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 2800.00, 4, 10, '2029-05-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(284, 'P-Alaxin TS 40/320', '', NULL, 'card', 4, '', NULL, NULL, 0.00, 1700.00, 2, 10, '2027-11-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(285, 'P-Alaxin TS 120/960', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 1800.00, 1, 10, '2028-03-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(286, 'Ibasurette 40/320', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 2200.00, 4, 10, '2028-01-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(287, 'Gravillor-Plus 80/450', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 1200.00, 4, 10, '2026-09-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(288, 'Maldox', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 500.00, 17, 10, '2026-11-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(289, 'Diasunate Adult 100/270', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 1900.00, 6, 10, '2027-07-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(290, 'Swidar Sod/25', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 700.00, 3, 10, '2030-09-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(291, 'Saquin', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 300.00, 9, 10, '2028-01-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(292, 'Amalar', '', NULL, 'box', 4, '', NULL, NULL, 0.00, 500.00, 0, 10, '2028-05-31', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 14:29:54'),
(293, 'P-Alaxin', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 2000.00, 9, 10, '2028-09-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(294, 'Chloroquine Syrup', '', NULL, 'pack', 4, '', NULL, NULL, 0.00, 1000.00, 9, 10, '2028-06-30', 'Shelf A1', '2026-08-13 10:53:08', '2026-08-13 10:53:08'),
(295, 'Cof Off Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 500.00, 8, 10, '2028-01-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(296, 'Tuxil-D', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 1000.00, 8, 10, '2027-04-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(297, 'Hofol Syrup', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 2500.00, 3, 10, '2029-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(298, 'Tuxil-N For Adults', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 1600.00, 17, 10, '2027-07-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(299, 'Wipax', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 900.00, 2, 10, '2028-08-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(300, 'Emzoly-N He-Way Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1400.00, 19, 10, '2029-08-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(301, 'Tutolin', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 600.00, 19, 10, '2029-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(302, 'Piscof', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 600.00, 51, 10, '2029-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(303, 'Zymet', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 2800.00, 6, 10, '2028-08-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45');
INSERT INTO `medicines` (`id`, `name`, `generic_name`, `brand`, `packs_cards`, `category_id`, `batch_number`, `barcode`, `manufacturer`, `purchase_price`, `selling_price`, `quantity`, `reorder_level`, `expiry_date`, `storage_location`, `created_at`, `updated_at`) VALUES
(304, 'Nise Plus', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1600.00, 10, 10, '2028-10-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(305, 'Xonadine-120', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 2600.00, 14, 10, '2028-05-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(306, 'Xonadine-180', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 3600.00, 7, 10, '2028-04-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(307, 'Procom Tablets 15mg', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1600.00, 6, 10, '2027-06-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(308, 'Oyzal 5mg', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 2800.00, 2, 10, '2029-02-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(309, 'Clarityne 10mg', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1200.00, 12, 10, '2027-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(310, 'Actifed', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 4000.00, 14, 10, '2028-10-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(311, 'Fexoril 180mg', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 2400.00, 14, 10, '2027-03-17', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(312, 'Emzoly-N Syrup', '', NULL, 'bottle', 5, '', NULL, NULL, 0.00, 1100.00, 10, 10, '2029-05-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(313, 'Emzoly-N Syrup', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 1000.00, 51, 10, '2029-05-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(314, 'Cofex Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 3, 10, '2029-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(315, 'Cof Off', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 500.00, 2, 10, '2027-08-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(316, 'Nae Syrup 20ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 500.00, 2, 10, '2029-05-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(317, 'Noralyn Dry Cough Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 17, 10, '2029-04-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(318, 'Tuxil-N For Adults', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1800.00, 5, 10, '2027-10-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(319, 'Tuxil-N 2-12 Years', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 2, 10, '2027-01-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(320, 'Noralyn For Children', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 14, 10, '2028-06-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(321, 'Emzoly-N Cough Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 1, 10, '2028-05-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(322, 'Tuxil-D For Children', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 3, 10, '2028-04-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(323, 'Tuxil-N For Children', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 4, 10, '2028-12-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(324, 'Liquid Paraffin', '', NULL, 'roll', 5, '', NULL, NULL, 0.00, 1000.00, 5, 10, '2029-02-28', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(325, 'Gripe Water / Bonababe', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 700.00, 3, 10, '2029-01-31', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(326, 'Asplause Gripe Water', '', NULL, 'roll', 5, '', NULL, NULL, 0.00, 1700.00, 4, 10, '2029-04-30', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(327, 'Applause C', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 7500.00, 2, 10, '2027-07-31', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(328, 'Constistop', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 9000.00, 7, 10, '2028-07-31', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(329, 'Paracetamol Syrup Emzol', '', NULL, 'roll', 5, '', NULL, NULL, 0.00, 6800.00, 14, 10, '2028-11-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(330, 'Swifen Suspension', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1800.00, 16, 10, '2027-12-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(331, 'Bruster-M', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1800.00, 12, 10, '2028-05-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(332, 'Nospamin', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 10, 10, '2028-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(333, 'Panadol Cold Drops', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 2300.00, 25, 10, '2028-11-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(334, 'Paracetamol Drops', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 15, 10, '2028-08-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(335, 'Paracetamol 5kg Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 11, 10, '2029-08-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(336, 'NVP-1', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1100.00, 6, 10, '2029-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(337, 'Emcof', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 4000.00, 7, 10, '2028-05-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(338, 'Paracetamol Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 700.00, 6, 10, '2029-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(339, 'Finum Syrup', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 1250.00, 75, 10, '2027-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(340, 'Lixypas', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 1800.00, 17, 10, '2028-11-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(341, 'Bonababe Syrup', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 600.00, 38, 10, '2029-04-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(342, 'Cencold Syrup', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 600.00, 10, 10, '2028-12-10', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(343, 'Bechive Balsam', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 7000.00, 2, 10, '2030-05-31', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(344, 'Manhood', '', NULL, 'pcs', 5, '', NULL, NULL, 0.00, 6500.00, 53, 10, '2028-11-01', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(345, 'Coflin', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 2000.00, 3, 10, '2028-02-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(346, 'Tuxil-N Neoglyn', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1250.00, 3, 10, '2029-01-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(347, 'Tuxil-N', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1600.00, 3, 10, '2028-02-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(348, 'Promethazine Syrup 5mg/5ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 700.00, 17, 10, '2028-07-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(349, 'Tuxil-D', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1500.00, 7, 10, '2028-09-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(350, 'Tuxil-N Cough & Cold', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 29, 10, '2029-02-28', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(351, 'Broncholate 100ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1000.00, 29, 10, '2029-02-28', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(352, 'Chlorpheniramine Syrup 2mg/5ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 750.00, 50, 10, '2028-06-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(353, 'Shallexa 16ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1200.00, 6, 10, '2028-10-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(354, 'Flu-D Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1800.00, 6, 10, '2028-01-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(355, 'Tutolin 100ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 600.00, 26, 10, '2028-06-30', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(356, 'Nise Plus Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 160.00, 1, 10, '2028-10-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(357, 'Priniton Simp 6ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 100.00, 4, 10, '2028-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(358, 'Priniton 100ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1200.00, 1, 10, '2027-03-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(359, 'Zymect Syrup', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 3000.00, 3, 10, '2028-11-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(360, 'Tutolin Syrup 100ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 600.00, 2, 10, '2027-10-29', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(361, 'Honeycal Beclive 200ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 2500.00, 8, 10, '2028-08-26', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(362, 'Cofex Cough 100ml', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1200.00, 5, 10, '2027-02-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(363, 'Loratadine Tablets 10mg', '', NULL, 'card', 5, '', NULL, NULL, 0.00, 0.00, 12, 10, '2027-05-31', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(364, 'Cold-Free Tablets', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 300.00, 26, 10, '2028-11-30', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(365, 'Koldblast', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 3500.00, 5, 10, '2027-10-31', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(366, 'Kold Time Tablets', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 700.00, 1, 10, '2028-08-31', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(367, 'Procol Tablets', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 400.00, 2, 10, '2030-12-31', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(368, 'Cold Caplet', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 400.00, 4, 10, '2030-12-31', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(369, 'Nocim Tablets', '', NULL, 'card', 5, '', NULL, NULL, 0.00, 500.00, 8, 10, '2028-06-30', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(370, 'Betahistine Dihydrochloride', '', NULL, 'pack/card', 5, '', NULL, NULL, 0.00, 1800.00, 1, 10, '2028-11-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(371, 'Cetirizine-L 5mg Caplets', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 300.00, 4, 10, '2029-01-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(372, 'Oyzal 5mg', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 2800.00, 10, 10, '2029-01-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(373, 'Priniton Tablets', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 1400.00, 33, 10, '2028-04-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(374, 'Lomotryn-L', '', NULL, 'card', 5, '', NULL, NULL, 0.00, 900.00, 19, 10, '2027-06-30', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(375, 'Histalot Levocetirizine Tablet 5mg', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 500.00, 1, 10, '2028-11-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(376, 'Phocem Tablets 10mg', '', NULL, 'card', 5, '', NULL, NULL, 0.00, 1600.00, 3, 10, '2028-06-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(377, 'Chlorpheniramine 4mg', '', NULL, 'pack', 5, '', NULL, NULL, 0.00, 150.00, 13, 10, '2027-11-30', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(378, 'Monlix Cough Syrup', '', NULL, 'bottle', 5, '', NULL, NULL, 0.00, 1400.00, 6, 10, '2028-09-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(379, 'Noxa-Crep Tablets', '', NULL, 'half pack', 5, '', NULL, NULL, 0.00, 1400.00, 11, 10, '2028-11-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(380, 'Zyneet 10mg Tablet', '', NULL, 'card', 5, '', NULL, NULL, 0.00, 150.00, 1, 10, '2029-02-20', 'Shelf A1', '2026-08-13 11:42:45', '2026-08-13 11:42:45'),
(466, 'DicloKris 50mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 100.00, 22, 10, '2028-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(467, 'Allyxtra 50mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 150.00, 93, 10, '2028-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(468, 'Syrup Ciprofloxacin', '', NULL, 'bottle', 8, '', NULL, NULL, 0.00, 2800.00, 20, 10, '2027-12-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(469, 'Reds Night Medicine', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 1200.00, 3, 10, '2028-09-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(470, 'Ketofen', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 700.00, 2, 10, '2030-08-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(471, 'Gut Diclofenac', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 1200.00, 10, 10, '2028-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(472, 'Gut Antiallergic', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 1700.00, 2, 10, '2027-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(473, 'Gut Ciprofloxacin', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 800.00, 2, 10, '2029-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(474, 'Tabs Panopraz (Pantoprazole)', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 1500.00, 1, 10, '2027-06-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(475, 'Accu-Chek', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 13000.00, 5, 10, '2027-03-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(476, 'Tabs Tamsulosin', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 8400.00, 5, 10, '2027-09-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(477, 'Tabs Tumboloss-D', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 4000.00, 5, 10, '2026-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(478, 'Tabs Dapa-S', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 10800.00, 5, 10, '2028-08-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(479, 'Tab Cehnu-B', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 15000.00, 2, 10, '2027-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(480, 'Zedmal', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 1700.00, 1, 10, '2028-04-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(481, 'X-Pecter Inhaler', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 1500.00, 1, 10, '2028-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(482, 'Ventolin Inhaler', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 7000.00, 5, 10, '2028-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(483, 'Levolin Cap', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 7000.00, 5, 10, '2027-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(484, 'Aerolife Inhaler', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 3200.00, 3, 10, '2028-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(485, 'Gentamicin Eye/Ear Drops', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 6000.00, 3, 10, '2029-04-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(486, 'Cenax', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 1800.00, 3, 10, '2028-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(487, 'Clotrimazole', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 1800.00, 5, 10, '2029-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(488, 'Escitalopram 10mg', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 0.00, 5, 10, '2028-04-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(489, 'Fanny-Mox Eye Drops', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 1200.00, 10, 10, '2028-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(490, 'Vitamin C 1000mg', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 1700.00, 1000, 10, '2029-06-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(491, 'Phenobarbital Injection', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 3500.00, 10, 10, '2028-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(492, 'Imuran 50mg', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 5500.00, 6, 10, '2029-06-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(493, 'Meloxicam', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 1200.00, 5, 10, '2027-07-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(494, 'Emcap Extra', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 350.00, 346, 10, '2028-03-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(495, 'PCM 500mg', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 250.00, 2, 10, '2031-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(496, 'Symthrotec 75mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1000.00, 14, 10, '2028-09-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(497, 'Baclofen 10mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1300.00, 4, 10, '2027-03-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(498, 'Celoxigen 200mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1500.00, 10, 10, '2028-06-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(499, 'Celecoxib 200mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1200.00, 8, 10, '2028-07-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(500, 'Emzobrex 200mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 2300.00, 1, 10, '2028-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(501, 'Voltfast 50mg Sachet', '', NULL, 'sachet', 8, '', NULL, NULL, 0.00, 500.00, 225, 10, '2028-09-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(502, 'MSB PCM 500mg', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 200.00, 3, 10, '2031-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(503, 'Cetafena Diclofenac + Paracetamol', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 500.00, 18, 10, '2027-04-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(504, 'Panadol Extra', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 500.00, 35, 10, '2026-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(505, 'Celebrex 200mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 9000.00, 40, 10, '2028-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(506, 'Nurofen 200mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 2700.00, 2, 10, '2028-03-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(507, 'Emcap PCM Dispersible', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 600.00, 70, 10, '2028-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(508, 'Cataflam 50mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 3000.00, 8, 10, '2027-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(509, 'Pentax Plus', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 200.00, 20, 10, '2030-04-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(510, 'Panacel', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 500.00, 104, 10, '2027-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(511, 'Zumo Acclofenac 100mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 600.00, 40, 10, '2027-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(512, 'Boska', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 500.00, 3, 10, '2029-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(513, 'Fidson PCM 500mg', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 150.00, 2, 10, '2028-06-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(514, 'Sudrex', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 600.00, 4, 10, '2030-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(515, 'Bonso', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 350.00, 34, 10, '2029-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(516, 'Pulex', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 600.00, 16, 10, '2028-08-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(517, 'Efelon 50mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 2500.00, 5, 10, '2028-07-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(518, 'Biocome 50mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 2100.00, 4, 10, '2029-12-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(519, 'Biocime 50mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 400.00, 9, 10, '2029-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(520, 'Ceflonac-SP', '', NULL, 'pack', 8, '', NULL, NULL, 0.00, 900.00, 5, 10, '2029-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(521, 'Carpfenac 100mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 400.00, 43, 10, '2028-07-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(522, 'Para 1000mg', '', NULL, 'pack', 23, '', NULL, NULL, 0.00, 900.00, 71, 10, '2031-02-01', 'Shelf A', '2026-08-13 13:23:03', '2026-08-17 14:22:45'),
(523, 'Para Night', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 1000.00, 69, 10, '2029-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(524, 'Supergestic', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 700.00, 18, 10, '2027-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(525, 'Genpam Night', '', NULL, 'pcs', 8, '', NULL, NULL, 0.00, 350.00, 14, 10, '2029-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(526, 'Quinso Night', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 400.00, 20, 10, '2028-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(527, 'Similatel 4mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1200.00, 25, 10, '2028-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(528, 'Gingalic 2mg Senior', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1200.00, 30, 10, '2029-04-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(529, 'Flotac 75mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 4250.00, 5, 10, '2028-06-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(530, 'Acycor Plus', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 900.00, 16, 10, '2028-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(531, 'Beclofen 100mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1700.00, 11, 10, '2028-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(532, 'Voltfast Extra', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 500.00, 11, 10, '2027-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(533, 'Methocarbamol 500mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1300.00, 9, 10, '2027-10-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(534, 'Dolo-Meta-B Fort', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 900.00, 20, 10, '2027-04-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(535, 'Dolo-Meta-B', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 550.00, 12, 10, '2028-07-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(536, 'Mefenamic Acid', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 500.00, 20, 10, '2028-03-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(537, 'Ibucap', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 500.00, 31, 10, '2026-09-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(538, 'Ibucap Sachets', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 450.00, 47, 10, '2026-08-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(539, 'Tasyfen 40mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 500.00, 12, 10, '2028-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(540, 'Brustan-N 400mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 650.00, 23, 10, '2029-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(541, 'Myoprocam 20mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 500.00, 32, 10, '2027-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(542, 'Trampro Piraxicam 20mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 100.00, 18, 10, '2028-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(543, 'Bycot Prednisolone 20mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 200.00, 99, 10, '2027-12-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(544, 'Perilon Prednisolone 5mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 500.00, 7, 10, '2027-04-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(545, 'Xaston Dexamethasone 1mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 250.00, 42, 10, '2028-06-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(546, 'Dex-up Dexamethasone 0.5mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 100.00, 45, 10, '2028-12-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(547, 'Stugeron Cinnarizine 25mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 700.00, 45, 10, '2028-09-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(548, 'Clofenac 50/100mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1200.00, 9, 10, '2028-11-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(549, 'Naproxen 500mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1200.00, 16, 10, '2028-07-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(550, 'Adabikun', '', NULL, 'sachet', 8, '', NULL, NULL, 0.00, 400.00, 90, 10, '2029-02-28', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(551, 'Tamafast 50mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 400.00, 24, 10, '2028-05-31', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(552, 'Meloxicam 7.5mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 1200.00, 24, 10, '2026-09-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(553, 'Diclofenac 50mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 500.00, 56, 10, '2028-06-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(554, 'Anacin 300mg', '', NULL, 'sachet', 8, '', NULL, NULL, 0.00, 70.00, 66, 10, '2028-09-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(555, 'Indokas Indomethacin 25mg', '', NULL, 'card', 8, '', NULL, NULL, 0.00, 200.00, 4, 10, '2028-06-30', 'Shelf A1', '2026-08-13 13:23:03', '2026-08-13 13:23:03'),
(556, 'lisinopril 5mg (ecoten)', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 300.00, 14, 10, '2027-12-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(557, 'Telmisartan 40mg (tamisart)', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 1200.00, 10, 10, '2028-03-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(558, 'Telmisartan 40mg (cilzee)', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 1200.00, 2, 10, '2028-01-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(559, 'Telmisartan 80mg/Amlodipine 10mg', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 2300.00, 4, 10, '2028-08-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(560, 'Amlodipine 5mg (Asomex 5)', '', NULL, 'card', 6, '', NULL, NULL, 0.00, 2600.00, 1, 10, '2027-03-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(561, 'Telmisartan 80mg/Amlodipine 10mg', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 1750.00, 5, 10, '2028-10-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(562, 'Telmisartan 80mg (Xelcon)', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 800.00, 3, 10, '2027-03-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(563, 'Telmisartan 40mg 8 hydrochloride', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 2600.00, 3, 10, '2028-08-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(564, 'Telmisartan 40mg (Angitil)', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 900.00, 3, 10, '2027-05-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(565, 'Telmisartan 80mg (Tezartan)', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 1200.00, 5, 10, '2027-01-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(566, 'Telmisartan 40mg (Arbitel)', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 2000.00, 4, 10, '2028-10-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(567, 'Telmisartan 40mg (pocco)', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 600.00, 14, 10, '2028-11-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(568, 'Losartan 25mg (Tala)', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 1700.00, 11, 10, '2027-11-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(569, 'Losartan 100mg (Tala)', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 2800.00, 4, 10, '2028-04-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(570, 'Amlodipine 5mg (Norvasc)', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 2500.00, 2, 10, '2026-10-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(571, 'Amlodipine 10mg (Norvasc)', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 5500.00, 2, 10, '2026-10-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(572, 'Losartan 50mg (Angizaar 50)', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 1800.00, 4, 10, '2027-09-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(573, 'Lisinopril 10mg', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 350.00, 20, 10, '2028-02-29', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(574, 'Lisinopril 5mg', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 250.00, 20, 10, '2027-12-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(575, 'me coneru forte', '', NULL, 'box + sachet', 6, '', NULL, NULL, 0.00, 7800.00, 26, 10, '2027-05-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(576, 'Oxyurea', '', NULL, 'box + sachet', 6, '', NULL, NULL, 0.00, 4800.00, 5, 10, '2028-05-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(577, 'Dynaweel syrup', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 3000.00, 13, 10, '2027-11-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(578, 'Abidec', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 2800.00, 7, 10, '2027-02-28', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(579, 'Slybon-70', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 4000.00, 2, 10, '2026-09-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(580, 'C\'tramin Vtc drops', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 800.00, 9, 10, '2027-10-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(581, 'Nature\'s field', '', NULL, 'sachet', 6, '', NULL, NULL, 0.00, 2300.00, 6, 10, '2028-02-29', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(582, 'Cypri Gold Caplets', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 1600.00, 7, 10, '2028-12-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(583, 'Chemicon', '', NULL, 'pack + sachet', 6, '', NULL, NULL, 0.00, 4500.00, 2, 10, '2029-02-28', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(584, 'Mednoral', '', NULL, 'packs', 6, '', NULL, NULL, 0.00, 0.00, 2, 10, '2027-11-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(585, 'Fratrone', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 1000.00, 4, 10, '2027-03-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(586, 'Manoll', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 4000.00, 5, 10, '2027-09-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(587, 'Omega 3-6-9', '', NULL, 'box + card', 6, '', NULL, NULL, 0.00, 12000.00, 3, 10, '2028-06-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(588, 'Emat 400 Vitamine E', '', NULL, 'box', 6, '', NULL, NULL, 0.00, 18000.00, 2, 10, '2029-09-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(589, 'ASTYfer', '', NULL, 'box', 6, '', NULL, NULL, 0.00, 5000.00, 2, 10, '2027-04-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(590, 'ASTYmin 110ml', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 3200.00, 27, 10, '2027-01-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(591, 'Cypri Gold Syrup', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 1600.00, 6, 10, '2028-12-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(592, 'Em-B-PTX Sirop', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 1000.00, 24, 10, '2028-10-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(593, 'Biomed', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 3500.00, 5, 10, '2028-10-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(594, 'Becombion', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 1000.00, 7, 10, '2028-01-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(595, 'Folmop', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 950.00, 10, 10, '2028-11-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(596, 'Emvite', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 1100.00, 54, 10, '2029-01-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(597, 'Krisuat 30mg', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 1000.00, 21, 10, '2028-12-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(598, 'Cod liver oil Syrup 200ml', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 8000.00, 5, 10, '2027-08-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(599, 'Slybon-140', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 6400.00, 3, 10, '2028-04-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(600, 'Maxiron', '', NULL, 'pack + 2 sachet', 6, '', NULL, NULL, 0.00, 1200.00, 50, 10, '2027-11-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(601, 'Em Vit-C Sirop', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 1000.00, 100, 10, '2028-10-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(602, 'Chymotrypsin', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 1000.00, 3, 10, '2028-08-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(603, 'NAT B (B complex)', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 9000.00, 3, 10, '2027-11-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(604, 'Phatonic plus', '', NULL, 'box', 6, '', NULL, NULL, 0.00, 5500.00, 2, 10, '2027-06-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(605, 'Bunto blood tonic', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 7800.00, 32, 10, '2028-03-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(606, 'Bunto 300ml', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 1300.00, 11, 10, '2028-02-29', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(607, 'Primosa', '', NULL, 'box + 2 card', 6, '', NULL, NULL, 0.00, 2000.00, 9, 10, '2027-12-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(608, 'Marglobin', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 4000.00, 6, 10, '2027-07-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(609, 'Omega H6', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 6000.00, 6, 10, '2028-02-29', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(610, 'Vitamin A 25000IU', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 1600.00, 8, 10, '2028-04-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(611, 'Adoamin syrup', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 4000.00, 9, 10, '2027-04-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(612, 'Emzomon Tonic', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 1800.00, 23, 10, '2028-02-29', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(613, 'Astymin 200ml', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 4500.00, 28, 10, '2027-06-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(614, 'Astyfer', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 4500.00, 18, 10, '2027-11-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(615, 'Hemo force', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 2500.00, 5, 10, '2027-09-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(616, 'Ferobin plus', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 3250.00, 5, 10, '2029-02-28', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(617, 'Mareobrx plus', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 4500.00, 10, 10, '2027-07-31', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(618, 'Mayanoral', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 0.00, 1, 10, '2028-09-30', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(619, 'DHA Plus', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 6800.00, 1, 10, '2028-02-29', 'Shelf A1', '2026-08-14 07:43:51', '2026-08-14 07:43:51'),
(620, 'pre ulam', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 14000.00, 2, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(621, 'NAN 2', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 10050.00, 2, 10, '2028-07-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(622, 'Geracal', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 14500.00, 1, 10, '2027-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(623, 'Viagra 100mg', '', NULL, 'pack', 13, '', NULL, NULL, 0.00, 9000.00, 2, 10, '2029-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(624, 'whitening Gummies', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 18000.00, 1, 10, '2027-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(625, 'Deep heat', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 6500.00, 3, 10, '2027-06-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(626, 'NAN 1', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 10200.00, 1, 10, '2027-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(627, 'Daily probiotic', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 18000.00, 1, 10, '2028-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(628, 'Vit C 500mg nature\'s field', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 150.00, 2, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(629, 'Vitamin D3 1,000 IU nature\'s field', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 150.00, 1, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(630, 'Vit B6 50mg nature\'s field', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 150.00, 1, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(631, 'B-12 50mg', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 180.00, 2, 10, '2029-01-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(632, 'Flex Condom', '', NULL, 'packs', 13, '', NULL, NULL, 0.00, 900.00, 11, 10, '2026-07-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(633, 'Gluta white 150000mg', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 5000.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(634, 'Royal jelly', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 35000.00, 2, 10, '2027-03-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(635, 'Sildenafil 100mg (po?esta)', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 850.00, 9, 10, '2027-06-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(636, 'Tadalafil 10mg (Stalong)', '', NULL, 'pack', 13, '', NULL, NULL, 0.00, 900.00, 21, 10, '2027-02-28', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(637, 'Tadalafil 20mg (Stalong)', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 1800.00, 4, 10, '2027-02-28', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(638, 'Postpill', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2300.00, 16, 10, '2027-06-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(639, 'Backa up', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 13500.00, 9, 10, '2027-06-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(640, 'Aciclovir cream', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 3500.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(641, 'Letrozole 2.5mg', '', NULL, 'card', 13, '', NULL, NULL, 0.00, 1000.00, 2, 10, '2027-06-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(642, 'Abiraterone Acetate 250mg', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 130000.00, 1, 10, '2028-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(643, 'Abiraterone Acetate 250mg', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 130000.00, 1, 10, '2027-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(644, 'Good fly', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 800.00, 8, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(645, 'Silver bird', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 5500.00, 2, 10, '2028-07-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(646, 'Vitamin A 10,000 IU', '', NULL, 'caps', 13, '', NULL, NULL, 0.00, 100.00, 53, 10, '2026-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(647, 'melatonin 10mg', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 350.00, 1, 10, '2028-06-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(648, 'zinc for acne', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 200.00, 2, 10, '2027-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(649, 'super C (immun zinc 1000mg vitamin 50mg)', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 200.00, 1, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(650, 'Breast firms & Enlargement', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 10000.00, 1, 10, '2027-09-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(651, 'Botal jelly 1000mg', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 6200.00, 1, 10, '2027-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(652, 'Mat A 5000IU', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 4000.00, 3, 10, '2027-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(653, 'Cognitol', '', NULL, 'pack', 13, '', NULL, NULL, 0.00, 3200.00, 1, 10, '2026-09-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(654, 'Caps men\'s dilit prostate care', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 26000.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(655, 'men\'s drilt', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 4000.00, 1, 10, '2027-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(656, 'Sudocream big', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 9500.00, 2, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(657, 'Sudocream small', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 5800.00, 2, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(658, 'flora 10m', '', NULL, 'sachet', 13, '', NULL, NULL, 0.00, 1300.00, 1, 10, '2027-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(659, 'xurmajit', '', NULL, 'caps', 13, '', NULL, NULL, 0.00, 950.00, 7, 10, '2028-05-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(660, 'Arlinocart', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 7500.00, 6, 10, '2027-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(661, 'Arthocart fortt 250mg', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 11900.00, 3, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(662, 'Activated Charcoal 250mg', '', NULL, 'packs', 13, '', NULL, NULL, 0.00, 300.00, 2, 10, '2028-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(663, 'B-euvf 400mg', '', NULL, 'packs', 13, '', NULL, NULL, 0.00, 9000.00, 2, 10, '2026-03-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(664, 'Aciclovir cream', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 2800.00, 5, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(665, 'Postinor 2 white', '', NULL, 'packs', 13, '', NULL, NULL, 0.00, 500.00, 21, 10, '2029-02-28', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(666, 'Imipramin HCl (Tofranil)', '', NULL, 'packs', 13, '', NULL, NULL, 0.00, 2000.00, 1, 10, '2028-09-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(667, 'Tas Aciclovir 200mg', '', NULL, 'card', 13, '', NULL, NULL, 0.00, 200.00, 1, 10, '2028-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(668, 'Tas Aciclovir 400mg (Bactnac??)', '', NULL, 'packs', 13, '', NULL, NULL, 0.00, 250.00, 4, 10, '2028-09-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(669, 'Keraten dusting powder', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 900.00, 12, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(670, 'metolac?ol dusting powder', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2000.00, 3, 10, '2028-07-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(671, 'Family Care (mosquito repellent)', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2500.00, 2, 10, '2026-07-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(672, 'Acne wash cleanser (zapz?il)', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 16000.00, 1, 10, '2026-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(673, 'familia (AT-l?itp)', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2500.00, 4, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(674, 'familia (vitamine C)', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2500.00, 3, 10, '2029-01-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(675, 'Madimola Secret lotion', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 9000.00, 1, 10, '2029-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(676, 'Pears baby lotion', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2200.00, 3, 10, '2026-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(677, 'M-Care methylated spirit', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 600.00, 81, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(678, 'Cotton buds (Tingsrui)', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 900.00, 2, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(679, 'Cotton buds (Cesura)', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 200.00, 25, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(680, 'Postinor 2 Green', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2500.00, 17, 10, '2029-02-28', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(681, 'Blood pressure monitor', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 50000.00, 5, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(682, 'Jinja herbal extract', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 15000.00, 5, 10, '2028-03-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(683, 'Treasure herbs', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 6000.00, 2, 10, '2028-03-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(684, 'Dental floss', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 500.00, 4, 10, '2030-02-28', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(685, 'Litamin 15', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 25.00, 4, 10, '2027-05-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(686, 'Kiss lub gel', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 3800.00, 5, 10, '2027-09-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(687, 'Kiss lub gel', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 3000.00, 1, 10, '2028-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(688, 'Tama biotic', '', NULL, 'packs', 13, '', NULL, NULL, 0.00, 2000.00, 2, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(689, 'Lutogate Bust', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 1200.00, 10, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(690, 'Boxi', '', NULL, 'bottle', 13, '', NULL, NULL, 0.00, 900.00, 15, 10, '2028-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(691, 'Atf water', '', NULL, 'carton', 13, '', NULL, NULL, 0.00, 200.00, 5, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(692, 'Liv water', '', NULL, 'carton', 13, '', NULL, NULL, 0.00, 250.00, 4, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(693, 'Rains baby powder', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 700.00, 11, 10, '2028-06-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(694, 'BMC', '', NULL, 'pieces', 13, '', NULL, NULL, 0.00, 2400.00, 4, 10, '2029-04-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(695, 'Rubena Can', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 1200.00, 1, 10, '2026-09-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(696, 'Rubena Bottle', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 1200.00, 1, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(697, 'A S Shine honey small', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 3500.00, 10, 10, '2029-09-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(698, 'A S Shine honey medium', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 5500.00, 0, 10, '2027-07-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 09:55:27'),
(699, 'Honey big', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 4000.00, 9, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(700, 'Honey small', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2800.00, 8, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(701, 'Lucogate energy', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 3000.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(702, 'Pears baby oil', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2200.00, 23, 10, '2028-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(703, 'medicated, methylated dusting', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 1000.00, 9, 10, '2028-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(704, 'methylated dusting powder', '', NULL, NULL, 13, '', NULL, NULL, 0.00, 2000.00, 8, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(705, 'Neurogesic small', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1500.00, 1, 10, '2028-09-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(706, 'Vaseline (blue seal)', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 3300.00, 6, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(707, 'Salicylic acid 15%', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 0.00, 1, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00');
INSERT INTO `medicines` (`id`, `name`, `generic_name`, `brand`, `packs_cards`, `category_id`, `batch_number`, `barcode`, `manufacturer`, `purchase_price`, `selling_price`, `quantity`, `reorder_level`, `expiry_date`, `storage_location`, `created_at`, `updated_at`) VALUES
(708, 'Salicylic acid 20%', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1000.00, 2, 10, '2029-02-28', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(709, 'Salicylic acid 5%', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 900.00, 5, 10, '2028-02-29', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(710, 'Salicylic acid 10%', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1000.00, 8, 10, '2028-02-29', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(711, 'Potassium permanganate', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 0.00, 3, 10, '2027-05-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(712, 'Zinc oxide', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 950.00, 2, 10, '2027-07-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(713, 'Pommade', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1100.00, 4, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(714, 'Camfo', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 700.00, 11, 10, '2027-02-28', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(715, 'Cacatin small', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 350.00, 45, 10, '2025-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(716, 'Cacatin big', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 800.00, 21, 10, '2026-08-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(717, 'milk teeth', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 800.00, 8, 10, '2028-03-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(718, 'close-up', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 800.00, 20, 10, '2028-06-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(719, 'pepsodent', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1600.00, 6, 10, '2027-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(720, 'Sensodyne', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 2400.00, 3, 10, '2027-05-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(721, 'mymy', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1350.00, 10, 10, '2024-12-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(722, 'elixer (ice mint)', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 0.00, 2, 10, '2024-12-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(723, 'Xtreme', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1100.00, 5, 10, '2028-06-30', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(724, 'Orange (Royal ?)', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1100.00, 11, 10, '2028-03-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(725, 'Colgate', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1100.00, 6, 10, '2028-10-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(726, 'Dabur herbal', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 1300.00, 2, 10, '2027-01-31', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(727, 'Toothbrush extra hard', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 250.00, 9, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(728, 'Toothbrush medium', 'h', '', 'pcs', 13, '', '', '', 0.00, 200.00, 18, 10, '3333-01-01', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:26:31'),
(729, 'Toothbrush soft', '', NULL, 'pcs', 13, '', NULL, NULL, 0.00, 100.00, 40, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:04:00', '2026-08-14 08:04:00'),
(730, 'Salbutamol', 'pcm', '', 'robber', 6, 'BATCH-B1D17A62', '890459199057', '', 0.00, 4.00, 1, 10, '2030-11-30', 'Shelf A-1', '2026-08-14 08:05:34', '2026-08-14 08:06:50'),
(731, 'Reasulf tablet', 'pcm', '', 'robber (100 tab each)', 6, 'BATCH-76517554', '890247523941', '', 0.00, 4.00, 3, 10, '2030-02-28', 'Shelf A-1', '2026-08-14 08:09:49', '2026-08-14 08:09:49'),
(732, 'Epicrom (sodium cromoglycate)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2800.00, 15, 10, '2028-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(733, 'Ketotifen fumarate', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2400.00, 15, 10, '2027-03-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(734, 'Aventra (tobramycin & dexamethasone)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2500.00, 16, 10, '2027-05-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(735, 'Aventra (tobramycin)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1500.00, 8, 10, '2027-05-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(736, 'Ciproxamed (ciprofloxacin & dexamethasone)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1200.00, 7, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(737, 'Ocuvid (ofloxacin eye/ear drops)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 600.00, 7, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(738, 'Oxymet (oxymetazoline) adult', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1500.00, 3, 10, '2028-05-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:46:37'),
(739, 'Oxymet (oxymetazoline) paediatrics', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1500.00, 6, 10, '2028-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:46:31'),
(740, 'Maxitrol (steroid ophthalmic suspension)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 6000.00, 4, 10, '2027-12-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(741, 'Stadexolene (dexamethasone sodium)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1700.00, 5, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(742, 'Penicillin ophthalmic ointment', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 700.00, 2, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(743, 'Misopt (dorzolamide, timolol maleate)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 4800.00, 6, 10, '2027-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:46:50'),
(744, 'Misopt (travoprost ophthalmic solution)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 6500.00, 5, 10, '2027-06-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:46:55'),
(745, 'Dexatrol (dexamethasone neomycin)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2800.00, 16, 10, '2028-03-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(746, 'Hydrocortisone methyl cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2500.00, 9, 10, '2027-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(747, 'Ivyflur (flurbiprofen)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 0.00, 2, 10, '2026-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:47:40'),
(748, 'Sterile Ubine extra', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 5000.00, 5, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(749, 'Eyemolol (timolol eye drops)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1000.00, 3, 10, '2029-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(750, 'Floboid (ofloxacin ophthalmic solution)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1800.00, 10, 10, '2027-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(751, 'Floboid-DX solution ophthalmic', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2200.00, 10, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(752, 'Tevanac (nepafenac ophthalmic)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 3200.00, 3, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(753, 'Otrivin (adult)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 3200.00, 1, 10, '2028-03-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(754, 'Otrivin (GSK adult)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 3500.00, 5, 10, '2028-07-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(755, 'Visine (tetrahydrozoline)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 7000.00, 4, 10, '2027-06-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(756, 'Betadrone-N (betamethasone sodium)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1400.00, 5, 10, '2028-12-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(757, 'Avertra (dexamethasone)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 0.00, 1, 10, '2027-06-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(758, 'Flucamed (fluconazole)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1800.00, 3, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(759, 'Kerob (flurbiprofen sodium)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 3500.00, 1, 10, '2027-05-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(760, 'I-Zine (tetrahydrozoline)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 3000.00, 1, 10, '2027-08-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(761, 'Dramewose (hyoscine)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1800.00, 1, 10, '2029-02-28', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(762, 'Ropiron (ropatadine hydrochloride)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 3200.00, 1, 10, '2028-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(763, 'Stadexolene (dexamethasone sodium)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1700.00, 1, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(764, 'Chloramphenicol', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 400.00, 35, 10, '2028-06-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(765, 'Otrivin (children)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 3200.00, 6, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(766, 'Avamys (fluticasone furoate)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 18500.00, 3, 10, '2027-08-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(767, 'Fortide (inhaler)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 9500.00, 4, 10, '2028-08-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(768, 'Neoidrol (methylprednisolone)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2500.00, 5, 10, '2027-12-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(769, 'Veet hair removal cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 4500.00, 6, 10, '2027-02-28', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(770, 'Xtra (multivitamin, minerals)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 3000.00, 1, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(771, 'Deravit Pregmom Plus', '', NULL, 'pack', 11, '', NULL, NULL, 0.00, 9000.00, 1, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(772, 'Oxy benzoyl peroxide 10%', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 5000.00, 1, 10, '2029-10-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(773, 'Deravit Joint Flex', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 6500.00, 5, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(774, 'Deravit Joint Flex', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 7000.00, 1, 10, '2028-08-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(775, 'Vital Woman 65+', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 0.00, 1, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(776, 'Softwoman H3', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 6000.00, 3, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(777, 'Deravit Joint Activoo', '', NULL, 'pack', 11, '', NULL, NULL, 0.00, 9000.00, 4, 10, '2027-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(778, 'Vitabiotics Pregnacare Plus', '', NULL, 'pack', 11, '', NULL, NULL, 0.00, 23000.00, 2, 10, '2028-08-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(779, 'Pregnacare (Vitabiotics)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 12300.00, 2, 10, '2028-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(780, 'Deravit Pregmom', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 7000.00, 2, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(781, 'Vitabiotics Pregnacare Original', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 13500.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(782, 'Telle (Deravit Woman)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 7500.00, 1, 10, '2028-08-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(783, 'A3 Wellness Special Skin Radiance', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 7500.00, 1, 10, '2028-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(784, 'A3 Wellness Vital Man 45+', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 7000.00, 1, 10, '2028-08-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(785, 'Druglied (ketofing)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 6000.00, 2, 10, '2028-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(786, 'Dermalog-GF cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1100.00, 4, 10, '2028-01-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(787, 'Permethrin cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1700.00, 4, 10, '2029-08-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(788, 'Permethrin cream (Permin)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1700.00, 5, 10, '2028-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(789, 'Silver sulphadiazine cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1000.00, 2, 10, '2028-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(790, 'Brocoten cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1200.00, 22, 10, '2029-05-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(791, 'Sinfen ointment (Krishat)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 700.00, 5, 10, '2028-03-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(792, 'DrugMed (hydrocortisone cream)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1300.00, 4, 10, '2029-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(793, 'Burnazin (Fucidin)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 800.00, 9, 10, '2029-07-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(794, 'Burnazin', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1500.00, 1, 10, '2027-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(795, 'Griseof cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1800.00, 9, 10, '2027-10-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(796, 'Reptagel', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1200.00, 3, 10, '2028-10-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(797, 'Micogol cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1000.00, 8, 10, '2030-01-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(798, 'Woisan cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 3000.00, 2, 10, '2027-12-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(799, 'Nizoderm', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1600.00, 4, 10, '2027-02-28', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(800, 'Whitfields ointment', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 850.00, 2, 10, '2029-07-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(801, 'Betamethasone dryield', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1200.00, 3, 10, '2028-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(802, 'Betasil cream (clotrimazole)', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1600.00, 8, 10, '2029-06-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(803, 'Mupirocin cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2000.00, 9, 10, '2027-07-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(804, 'Hydrocortisone cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1050.00, 18, 10, '2027-06-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(805, 'Feurid', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 0.00, 1, 10, '2027-10-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(806, 'Mupirocin combo', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1900.00, 11, 10, '2027-05-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(807, 'Camfo', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 350.00, 6, 10, '2028-11-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(808, 'Vaseline blue seal small', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 800.00, 14, 10, '2026-02-28', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(809, 'Vaseline blue seal medium', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2600.00, 3, 10, '2029-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(810, 'Dettol', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 650.00, 10, 10, '2027-10-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(811, 'Dettol 12hr', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 650.00, 6, 10, '2027-07-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(812, 'Dettol 2X', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 650.00, 6, 10, '2027-02-28', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(813, 'Dermo Pure', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 900.00, 21, 10, '2028-10-31', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(814, 'Viga Essence', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1200.00, 3, 10, '2029-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(815, 'Neoskin soap', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1200.00, 2, 10, '2029-04-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(816, 'Tetmosol', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 600.00, 34, 10, '2029-02-28', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(817, 'Renma cream', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 600.00, 32, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(818, 'Retnina soap', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 250.00, 24, 10, '2029-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(819, 'Dorco', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 450.00, 9, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(820, 'BIC 1', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 0.00, 22, 10, '0000-00-00', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(821, 'Neurogesic', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 1500.00, 12, 10, '2030-02-28', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(822, 'Neurogesic extra 5g', '', NULL, 'pcs', 11, '', NULL, NULL, 0.00, 2700.00, 2, 10, '2029-09-30', 'Shelf A1', '2026-08-14 08:45:58', '2026-08-14 08:45:58'),
(823, 'Bandage small', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 800.00, 3, 10, '2028-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(824, 'fechum tips', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 500.00, 14, 10, '2030-03-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(825, 'Urine bag', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 500.00, 16, 10, '2028-03-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(826, 'Blood bag', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1800.00, 15, 10, '2028-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(827, 'Blood giving set', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 500.00, 22, 10, '2030-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(828, 'Bandage gauze small', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 250.00, 12, 10, '2027-03-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(829, 'Infant mucus extractor', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 700.00, 9, 10, '2023-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(830, 'Suction connecting tube', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 3500.00, 1, 10, '2029-02-28', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(831, 'Fine test', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 12000.00, 1, 10, '2027-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(832, 'Urine sample tube', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 150.00, 17, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(833, 'Cord clamp', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 100.00, 18, 10, '2028-08-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(834, 'Cannular 18G', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 300.00, 2, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(835, 'Face mask black', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 100.00, 4, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(836, 'Face mask blue', '', NULL, 'pack', 9, '', NULL, NULL, 0.00, 2000.00, 1, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(837, 'Face mask green', '', NULL, 'pcs', 9, '', NULL, NULL, 0.00, 50.00, 3, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(838, 'Bandage gauze medium', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 300.00, 3, 10, '2029-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(839, 'H. pylori test strip', '', NULL, 'strips', 9, '', NULL, NULL, 0.00, 800.00, 9, 10, '2027-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(840, 'Syphilis test strip', '', NULL, 'strips', 9, '', NULL, NULL, 0.00, 400.00, 39, 10, '2026-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(841, 'Cannular green', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 300.00, 3, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(842, 'Scalp vein 23G', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 100.00, 49, 10, '2030-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(843, 'Disposable insulin syringe', '', NULL, 'pack', 9, '', NULL, NULL, 0.00, 150.00, 1, 10, '2028-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(844, 'Swab sticks', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 0.00, 1, 10, '2030-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(845, 'Disposable insulin syringe (Apex)', '', NULL, 'pack', 9, '', NULL, NULL, 0.00, 150.00, 1, 10, '2030-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(846, 'Scalp vein set 21G', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 150.00, 53, 10, '2030-02-28', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(847, 'Cannular size 16 (Dawn)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 900.00, 8, 10, '2029-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(848, 'Cannular size 18 (Agangy)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 900.00, 1, 10, '2029-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(849, 'Cannular size 18 (Don)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 0.00, 1, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(850, 'Cannular size 12 (Bencare)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 0.00, 1, 10, '2026-08-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(851, 'Cannular size 16 (Agangy)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 900.00, 7, 10, '2031-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(852, 'Cannular size 20G x 24', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 0.00, 1, 10, '2020-03-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(853, 'Latex examination gloves', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 0.00, 1, 10, '2025-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(854, 'Silicone catheter', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 3600.00, 7, 10, '2028-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(855, 'Giving set', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 250.00, 32, 10, '2028-06-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(856, 'Bandage big', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 600.00, 13, 10, '2030-07-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(857, 'Digital thermometer', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1800.00, 12, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(858, 'Clinical thermometer', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1400.00, 20, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(859, 'Elbow gloves', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1000.00, 6, 10, '2030-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(860, 'Needle 23G', '', NULL, 'pairs', 9, '', NULL, NULL, 0.00, 25.00, 2, 10, '2030-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(861, 'Plaster big (X-ray)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 850.00, 1, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(862, 'Plaster big (Dew-V)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 2800.00, 3, 10, '2029-07-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(863, 'PDS 2', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 4000.00, 1, 10, '2028-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(864, 'PDS 3-0', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 3000.00, 2, 10, '2030-02-28', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(865, 'Surgical blade', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 150.00, 21, 10, '2030-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(866, 'Nylon 1', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 400.00, 12, 10, '2030-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(867, 'Vicryl 2-0 (Chromic)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 800.00, 1, 10, '2029-04-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(868, 'Vicryl 2 (Chromic)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 800.00, 1, 10, '2029-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(869, 'Vicryl 2 (Concry)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1000.00, 12, 10, '2027-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(870, 'Vicryl 2-0 (Agangy)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1200.00, 13, 10, '2029-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(871, 'Vicryl 2 (Agangy)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1200.00, 28, 10, '2030-04-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(872, 'Vicryl 3-0 (Cuticryl)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1200.00, 9, 10, '2030-07-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(873, 'Nylon 2-0 (Bencare)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 400.00, 12, 10, '2030-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(874, 'Syringes 60ml', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 800.00, 16, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(875, 'Syringes 20ml', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 250.00, 4, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(876, 'Cannular blue', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 250.00, 10, 10, '2030-03-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(877, 'Cannular pink', '', NULL, 'pack', 9, '', NULL, NULL, 0.00, 250.00, 1, 10, '2030-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(878, 'Cannular yellow', '', NULL, '1.5 pack', 9, '', NULL, NULL, 0.00, 250.00, 1, 10, '2030-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(879, 'PT strip (Apex)', '', NULL, '2.5 pack', 9, '', NULL, NULL, 0.00, 150.00, 2, 10, '2028-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(880, 'PT strip (Laborex)', '', NULL, 'pcs', 9, '', NULL, NULL, 0.00, 150.00, 3, 10, '2028-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(881, 'Gauze bandage big', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 5000.00, 3, 10, '2030-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(882, 'Syngo 5ml (Coft)', '', NULL, 'pcs', 9, '', NULL, NULL, 0.00, 60.00, 2, 10, '2030-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(883, 'Syngo 2ml (Afryget)', '', NULL, 'pcs', 9, '', NULL, NULL, 0.00, 50.00, 2, 10, '2030-04-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(884, 'Syngo 5ml (Afryset)', '', NULL, 'pack', 9, '', NULL, NULL, 0.00, 60.00, 3, 10, '2030-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(885, 'Syngo 10ml (Afryset)', '', NULL, 'pcs', 9, '', NULL, NULL, 0.00, 100.00, 2, 10, '2030-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(886, 'Needle 21G', '', NULL, 'pack', 9, '', NULL, NULL, 0.00, 25.00, 2, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(887, 'Needle 22G', '', NULL, 'pack', 9, '', NULL, NULL, 0.00, 25.00, 2, 10, '0000-00-00', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(888, 'Surgical gown (Agangy)', '', NULL, '2.5 pack', 9, '', NULL, NULL, 0.00, 350.00, 2, 10, '2030-07-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(889, 'EDTA tube', '', NULL, 'pack', 9, '', NULL, NULL, 0.00, 1000.00, 1, 10, '2030-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(890, 'Gloves blue cross', '', NULL, 'pair', 9, '', NULL, NULL, 0.00, 5000.00, 1, 10, '2030-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(891, 'Gloves Super Care', '', NULL, 'pairs', 9, '', NULL, NULL, 0.00, 5000.00, 7, 10, '2031-02-28', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(892, 'Plaster small (Agangy)', '', NULL, 'pcs', 9, '', NULL, NULL, 0.00, 50.00, 100, 10, '2029-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(893, 'Sterilised water', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 100.00, 130, 10, '2021-06-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(894, 'Osw Antemelar gel', '', NULL, 'box', 9, '', NULL, NULL, 0.00, 1200.00, 25, 10, '2027-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(895, 'Glyto? inj (ZytoCin)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 150.00, 2, 10, '2029-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(896, 'Aminophylline inj (Phylocamin)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 250.00, 10, 10, '2027-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(897, 'Ondansetron injection', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 700.00, 50, 10, '2027-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(898, 'Piroxicam inj (Philorcam)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 100.00, 40, 10, '2028-06-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(899, 'Contralax inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 1000.00, 14, 10, '2029-01-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(900, 'Furosemide inj (FGO7)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 100.00, 3, 10, '2028-04-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(901, 'Diclofenac inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 100.00, 45, 10, '2027-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(902, 'Potasol inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 500.00, 21, 10, '2027-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(903, 'Ranitidine inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 800.00, 56, 10, '2027-04-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(904, 'Rabeprazole inj', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 2400.00, 1, 10, '2029-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(905, 'Lanset', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1250.00, 1, 10, '2029-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(906, 'Rabeprazole inj (Tamarub)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1900.00, 35, 10, '2028-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(907, 'Hydrocortisone injection', '', NULL, 'vials', 9, '', NULL, NULL, 0.00, 500.00, 44, 10, '2027-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(908, 'Vit B-complex inj', '', NULL, 'vials', 9, '', NULL, NULL, 0.00, 250.00, 42, 10, '2027-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(909, 'Ceftriaxone (Truzone)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 850.00, 1, 10, '2026-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(910, 'Omeprazole inj (Fexon)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 750.00, 26, 10, '2027-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(911, 'Hydrocortisone inj (MELB)', '', NULL, 'vials', 9, '', NULL, NULL, 0.00, 500.00, 82, 10, '2027-08-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(912, 'Crystalline penicillin inj', '', NULL, 'units', 9, '', NULL, NULL, 0.00, 300.00, 14, 10, '2027-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(913, 'Fortified procaine inj (Caiman)', '', NULL, 'units', 9, '', NULL, NULL, 0.00, 600.00, 18, 10, '2027-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(914, 'Tramadol Actimole inj', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 900.00, 1, 10, '2027-06-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(915, 'Streptomycin sulphate inj', '', NULL, 'vials', 9, '', NULL, NULL, 0.00, 1500.00, 4, 10, '2027-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(916, 'Fortified procaine inj (Alkapin)', '', NULL, 'vials', 9, '', NULL, NULL, 0.00, 500.00, 28, 10, '2025-06-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(917, 'Chloramphenicol inj (MELB)', '', NULL, 'vials', 9, '', NULL, NULL, 0.00, 600.00, 6, 10, '2027-08-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(918, 'Benalaprin inj', '', NULL, 'vials', 9, '', NULL, NULL, 0.00, 350.00, 9, 10, '2027-06-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(919, 'Amoxil clav inj', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 700.00, 8, 10, '2026-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(920, 'Omeprazole inj (Taluser)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 750.00, 1, 10, '2027-04-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(921, 'Omeprazole inj (MELB)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 0.00, 1, 10, '2027-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(922, 'Sterilised water', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 100.00, 130, 10, '2021-06-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(923, 'Osw Antemelar gel', '', NULL, 'box', 9, '', NULL, NULL, 0.00, 1200.00, 25, 10, '2027-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(924, 'Amoxclav inj 1.2g', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 2300.00, 15, 10, '2027-08-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(925, 'Artesunate 60mg (Relkmal)', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 2600.00, 24, 10, '2028-02-28', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(926, 'Enal 75mg', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 3800.00, 4, 10, '2027-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(927, 'Enal 150mg', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 5500.00, 6, 10, '2028-02-28', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(928, 'Artesunate 1mg', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 800.00, 3, 10, '2028-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(929, 'd-P Artesunate (Fifmal)', '', NULL, 'pcs', 9, '', NULL, NULL, 0.00, 2500.00, 23, 10, '2028-03-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(930, 'Dexamethasone 1mg (Gemada)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 100.00, 146, 10, '2027-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(931, 'Cimetidine inj (Zimet)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 300.00, 22, 10, '2027-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(932, 'Gentamicin inj (Vinca)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 100.00, 23, 10, '2027-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(933, 'Furosemide inj (Frumel)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 100.00, 100, 10, '2027-06-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(934, 'Quinine dihydrochloride inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 600.00, 100, 10, '2027-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(935, 'Labetalol inj (Presolact)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 2800.00, 2, 10, '2027-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(936, 'Promethazine inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 100.00, 146, 10, '2028-08-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(937, 'Hyoscine inj (Atocus)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 200.00, 47, 10, '2028-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(938, 'Vit K3 inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 250.00, 98, 10, '2028-08-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(939, 'Phytomenadione inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 750.00, 5, 10, '2026-12-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(940, 'Paracetamol inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 100.00, 78, 10, '2027-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(941, 'Phytomenadione inj (K10)', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 1000.00, 8, 10, '2026-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(942, 'Atropine inj', '', NULL, 'ampoules', 9, '', NULL, NULL, 0.00, 300.00, 38, 10, '2028-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(943, 'Ceftriaxone inj', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 1500.00, 6, 10, '2027-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(944, 'Cotrimazole inj', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1000.00, 10, 10, '2028-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(945, 'Artesunate 60mg', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 1300.00, 129, 10, '2027-07-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(946, 'Piritram inj', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 2500.00, 1, 10, '2027-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(947, 'Amoxiclav inj 1.2g', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 1900.00, 20, 10, '2028-09-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(948, 'Artesunate 120mg', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 2000.00, 10, 10, '2027-10-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(949, 'Tracm Ceftriaxone 1g', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 1500.00, 4, 10, '2027-11-30', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(950, 'Rocophin', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 10700.00, 2, 10, '2028-05-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(951, 'Artesunate 120mg (Relkmal)', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 4500.00, 6, 10, '2028-02-28', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(952, 'Magnesium sulphate inj', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 800.00, 20, 10, '2028-03-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(953, 'Tandais', '', NULL, 'packs', 9, '', NULL, NULL, 0.00, 3000.00, 13, 10, '2028-07-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(954, 'Nido cream inj', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1500.00, 5, 10, '2028-07-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(955, 'Artesunate inj 60mg', '', NULL, NULL, 9, '', NULL, NULL, 0.00, 1200.00, 2, 10, '2027-08-31', 'Shelf A1', '2026-08-14 09:22:51', '2026-08-14 09:22:51'),
(956, 'Emzifix (Cefixime suspension)', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2400.00, 34, 10, '2027-12-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(957, 'Emgyl 200mg', '', NULL, 'pack', 7, '', NULL, NULL, 0.00, 180.00, 2, 10, '2027-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(958, 'Emgyl 400mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 250.00, 8, 10, '2028-02-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(959, 'Chloramphenicol 250mg (Fidson)', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 500.00, 17, 10, '2027-10-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(960, 'Larnox (Amox...)', '', NULL, 'card', 7, '', NULL, NULL, 0.00, 350.00, 33, 10, '2029-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(961, 'Astraclox (Amoxicillin)', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 500.00, 33, 10, '2028-09-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(962, 'Tetracycline 250mg (Fidson)', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 350.00, 78, 10, '2026-10-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(963, 'Iodium (Loperamide)', '', NULL, 'packs', 7, '', NULL, NULL, 0.00, 350.00, 14, 10, '2028-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(964, 'Savapon', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 700.00, 57, 10, '2028-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(965, 'Cafenicol', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 450.00, 9, 10, '2028-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(966, 'Bisacure (Bisacodyl)', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 200.00, 8, 10, '2028-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(967, 'Emzoclox', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2100.00, 49, 10, '2027-12-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(968, 'Emzoclox (Neonatal oral drops)', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2000.00, 5, 10, '2028-11-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(969, 'Cefuroxime 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1700.00, 9, 10, '2028-10-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(970, 'Erythromycin suspension', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1000.00, 10, 10, '2028-04-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(971, 'Erythromycin 250mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1200.00, 4, 10, '2028-04-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(972, 'Cef... 400mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2000.00, 7, 10, '2028-06-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(973, 'Clarithromycin 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 3500.00, 6, 10, '2028-10-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(974, 'Ciprofloxacin 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 5000.00, 18, 10, '2027-12-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(975, 'Ciprofloxacin 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 4000.00, 6, 10, '2028-03-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(976, 'Ciprofloxacin 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2500.00, 4, 10, '2027-05-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(977, 'Cef... 100mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2800.00, 7, 10, '2027-10-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(978, 'Augmentin 625mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1000.00, 2, 10, '2027-04-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(979, 'Augmentin 1g', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 12500.00, 1, 10, '2027-07-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(980, 'Amox K 625mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 4000.00, 7, 10, '2027-01-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(981, 'Amoxicillin Clavulanate 625mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 6000.00, 4, 10, '2027-05-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(982, 'Cefuroxime 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 3500.00, 8, 10, '2028-03-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(983, 'Ampicillin', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2700.00, 13, 10, '2027-10-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(984, 'Penicillin V 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1300.00, 2, 10, '2028-01-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(985, 'Norfloxacin 375mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 3000.00, 5, 10, '2026-11-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(986, 'Azithromycin 250mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2000.00, 10, 10, '2027-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(987, 'Azithromycin 250mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2700.00, 2, 10, '2027-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(988, 'Ceftriaxone 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2200.00, 47, 10, '2027-05-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(989, 'Azithromycin 250mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 10000.00, 2, 10, '2028-04-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(990, 'Azithromycin 500mg', '', NULL, 'packs', 7, '', NULL, NULL, 0.00, 2800.00, 7, 10, '2026-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(991, 'Azithromycin 500mg', '', NULL, 'packs', 7, '', NULL, NULL, 0.00, 2600.00, 2, 10, '2028-11-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(992, 'Azithromycin 500mg', '', NULL, 'packs', 7, '', NULL, NULL, 0.00, 1700.00, 4, 10, '2027-06-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(993, 'Erythromycin 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1800.00, 3, 10, '2028-03-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(994, 'Ornidazole 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 3400.00, 2, 10, '2028-03-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(995, 'Clindamycin 300mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1500.00, 7, 10, '2027-10-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(996, 'Azithromycin 500mg', '', NULL, 'pack', 7, '', NULL, NULL, 0.00, 3000.00, 1, 10, '2027-10-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(997, 'Dalacin C 300mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 10000.00, 1, 10, '2027-09-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(998, 'Dalacin C', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 4800.00, 2, 10, '2031-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(999, 'Dalacin', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 3500.00, 3, 10, '2028-09-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(1000, 'Dalacin 300mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1700.00, 1, 10, '2029-06-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(1001, 'Levofloxacin 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1600.00, 33, 10, '2027-12-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(1002, 'Amoxicillin & Flucloxacillin', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 7000.00, 6, 10, '2028-05-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(1003, 'Emox...', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1700.00, 9, 10, '2028-06-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(1004, 'Penicillin V 500mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 1300.00, 2, 10, '2028-01-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(1005, 'Norfloxacin 375mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 3000.00, 5, 10, '2026-11-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(1006, 'Azithromycin 250mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2000.00, 10, 10, '2027-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(1007, 'Azithromycin 250mg', '', NULL, 'pcs', 7, '', NULL, NULL, 0.00, 2700.00, 2, 10, '2027-08-01', 'Shelf A1', '2026-08-14 09:38:02', '2026-08-14 09:38:02'),
(1008, 'Emzor PCM Counting', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 12.00, 1, 10, '2028-10-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1009, 'ABcliy B Complex', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 5.00, 2, 10, '2026-03-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1010, 'Yeast', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 8.00, 3, 10, '2028-11-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1011, 'Xential', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 4.00, 3, 10, '2027-05-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1012, 'Zoractone', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 60.00, 3, 10, '2028-12-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1013, 'Archy folic acid', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 4.00, 2, 10, '2027-04-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1014, 'Emvit C', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 8.00, 4, 10, '2028-03-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1015, 'Em-B-Plex', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 0.00, 1, 10, '2028-06-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1016, 'Metronidazole tab', '', NULL, 'rubber (100 tab)', 6, '', NULL, NULL, 0.00, 0.00, 1, 10, '2027-11-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1017, 'Calcitone tab', '', NULL, 'rubber (100 tab)', 6, '', NULL, NULL, 0.00, 30.00, 2, 10, '2028-12-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1018, 'Fidson PCM tabs', '', NULL, 'rubber (100 tab)', 6, '', NULL, NULL, 0.00, 10.00, 1, 10, '2028-01-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1019, 'Jimtrizol', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 10.00, 1, 10, '2027-10-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1020, 'Sodamint tab', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 7.00, 1, 10, '2028-01-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1021, 'Olal', '', NULL, 'rubber', 6, '', NULL, NULL, 0.00, 5.00, 1, 10, '2027-01-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53');
INSERT INTO `medicines` (`id`, `name`, `generic_name`, `brand`, `packs_cards`, `category_id`, `batch_number`, `barcode`, `manufacturer`, `purchase_price`, `selling_price`, `quantity`, `reorder_level`, `expiry_date`, `storage_location`, `created_at`, `updated_at`) VALUES
(1022, 'Nitrofuration', '', NULL, 'rubber (100 tab)', 6, '', NULL, NULL, 0.00, 30.00, 1, 10, '2029-01-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1023, 'Emcap', '', NULL, 'rubber (100 tab)', 6, '', NULL, NULL, 0.00, 10.00, 1, 10, '2030-03-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1024, 'Julisil', '', NULL, NULL, 6, '', NULL, NULL, 0.00, 15.00, 0, 10, '2028-05-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1025, 'Em Vit-C tab', '', NULL, 'box', 6, '', NULL, NULL, 0.00, 150.00, 23, 10, '2027-09-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1026, 'Ce Ce Vit C', '', NULL, 'box (10 card)', 6, '', NULL, NULL, 0.00, 500.00, 3, 10, '2028-08-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1027, 'MIM', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 200.00, 8, 10, '2027-12-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1028, 'Nitrofurantion', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 900.00, 4, 10, '2028-01-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1029, 'Aphamoral', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 1000.00, 5, 10, '2028-08-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1030, 'Neurovit Forte', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 1500.00, 2, 10, '2028-09-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1031, 'B-Complex High Potency', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 1000.00, 2, 10, '2028-04-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1032, 'Paravit Forte', '', NULL, 'pack', 6, '', NULL, NULL, 0.00, 800.00, 5, 10, '2028-11-01', 'Shelf A1', '2026-08-14 09:49:53', '2026-08-14 09:49:53'),
(1034, 'Familiar tissue', 'Tissue', '', 'Units', 25, 'BATCH-A63DA9E6', '890672885667', '', 0.00, 400.00, 40, 10, '2028-02-01', 'Shelf A-1', '2026-08-17 14:16:11', '2026-08-17 14:17:07'),
(1035, 'Dynamogen', 'Oral', '', 'Packs', 6, 'BATCH-84F842A9', '890551109333', '', 0.00, 500.00, 2, 10, '2030-01-01', 'Shelf A-1', '2026-08-17 14:19:40', '2026-08-17 14:20:14'),
(1036, 'ORS', 'ORT', '', 'Units', 25, 'BATCH-DB1378C9', '890233741910', '', 0.00, 200.00, 95, 10, '2029-03-01', 'Shelf A-1', '2026-08-17 14:23:02', '2026-08-17 14:23:02'),
(1037, 'Emzolyte ORS', 'ORT', '', 'Packs', 25, 'BATCH-6F4E4355', '890609262933', '', 0.00, 300.00, 38, 10, '2027-08-17', 'Shelf A-1', '2026-08-17 14:26:53', '2026-08-17 14:26:53'),
(1038, 'Throated sachet', 'Orange flavour', '', 'Sachets', 25, 'BATCH-5FC3CCA2', '890268401700', '', 0.00, 1200.00, 20, 10, '2027-08-31', 'Shelf A-1', '2026-08-17 14:32:02', '2026-08-17 14:32:02');

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `rx_number` varchar(50) NOT NULL,
  `patient_name` varchar(100) NOT NULL,
  `patient_age` int(11) DEFAULT NULL,
  `patient_gender` enum('Male','Female','Other') DEFAULT 'Male',
  `doctor_name` varchar(100) NOT NULL,
  `hospital_clinic` varchar(150) DEFAULT NULL,
  `status` enum('pending','dispensed','cancelled') NOT NULL DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_items`
--

CREATE TABLE `prescription_items` (
  `id` int(11) NOT NULL,
  `prescription_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `dosage` varchar(100) NOT NULL,
  `frequency` varchar(100) NOT NULL,
  `duration` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(11) NOT NULL,
  `purchase_no` varchar(50) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `purchase_date` date NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` enum('paid','partial','due') NOT NULL DEFAULT 'paid',
  `notes` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_items`
--

CREATE TABLE `purchase_items` (
  `id` int(11) NOT NULL,
  `purchase_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `invoice_no` varchar(50) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `sale_date` datetime NOT NULL DEFAULT current_timestamp(),
  `subtotal` decimal(10,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(10,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `change_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_method` enum('cash','card','mobile_money') NOT NULL DEFAULT 'cash',
  `created_by` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `invoice_no`, `customer_id`, `sale_date`, `subtotal`, `grand_total`, `paid_amount`, `change_amount`, `payment_method`, `created_by`, `created_at`) VALUES
(7, '000000001', 1, '2026-08-13 11:54:09', 350.00, 350.00, 350.00, 0.00, 'cash', 1, '2026-08-13 09:54:09'),
(8, '000000008', 1, '2026-08-13 16:28:30', 1000.00, 1000.00, 1000.00, 0.00, 'cash', 1, '2026-08-13 14:28:30'),
(9, '000000009', 1, '2026-08-13 16:29:54', 7950.00, 7950.00, 7950.00, 0.00, 'cash', 1, '2026-08-13 14:29:54'),
(10, '000000010', 1, '2026-08-14 11:55:27', 5500.00, 5500.00, 5500.00, 0.00, 'cash', 1, '2026-08-14 09:55:27');

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

CREATE TABLE `sale_items` (
  `id` int(11) NOT NULL,
  `sale_id` int(11) NOT NULL,
  `medicine_id` int(11) NOT NULL,
  `batch_number` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `unit_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(10,2) NOT NULL,
  `profit` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `medicine_id`, `batch_number`, `quantity`, `unit_price`, `unit_cost`, `subtotal`, `profit`) VALUES
(1, 7, 55, 'BATCH-289C3101', 1, 350.00, 0.00, 350.00, 350.00),
(2, 8, 150, '', 1, 1000.00, 0.00, 1000.00, 1000.00),
(3, 9, 61, 'BATCH-A5E250BF', 1, 5000.00, 0.00, 5000.00, 5000.00),
(4, 9, 56, 'BATCH-34F553F8', 1, 200.00, 0.00, 200.00, 200.00),
(5, 9, 74, 'BATCH-242DA7F9', 1, 250.00, 0.00, 250.00, 250.00),
(6, 9, 259, '', 1, 2000.00, 0.00, 2000.00, 2000.00),
(7, 9, 292, '', 1, 500.00, 0.00, 500.00, 500.00),
(8, 10, 698, '', 1, 5500.00, 0.00, 5500.00, 5500.00);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `setting_key` varchar(50) NOT NULL,
  `setting_value` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_key`, `setting_value`, `updated_at`) VALUES
(1, 'pharmacy_name', 'M - CARE MODERN PHARMACY ', '2026-08-12 11:27:44'),
(2, 'pharmacy_short_name', 'MCPMS', '2026-08-08 13:16:42'),
(3, 'welcome_message', 'Welcome to M - CARE MODERN PHARMACY — Smart, Secure, and Efficient Pharmacy Management', '2026-08-12 11:27:44'),
(4, 'address', 'No: 8, Danraka Street, Opposite ABU North Gate, Samaru, Zaria.', '2026-08-12 11:27:44'),
(5, 'phone', '08033037352', '2026-08-12 11:27:44'),
(6, 'email', 'mcaremodernpharmacy@gmail.com', '2026-08-12 11:27:44'),
(7, 'currency_symbol', 'N', '2026-08-12 11:27:44'),
(9, 'invoice_footer', 'NOREFUND AFTER PAYMENT Thank you for choosing M - CARE! Get well soon.', '2026-08-17 13:50:19'),
(10, 'theme_mode', 'light', '2026-08-08 13:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `role` enum('founder','staff') NOT NULL DEFAULT 'staff',
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `last_login` datetime DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `email`, `phone`, `role`, `status`, `last_login`, `created_at`, `updated_at`) VALUES
(1, 'admin', '$2y$10$7Gz7Cg2dwmzqssoBZr.CiuyrZo4ZS/ucIFY.3tisEtqswikiKvU5i', 'Prof. Bilal', 'founder@mcare.com', '+234 019-2831', 'founder', 'active', '2026-08-17 14:53:27', '2026-08-08 13:16:42', '2026-08-17 13:53:27'),
(2, 'staff', '$2y$10$JS6.bjdKlMWu7vVPyVkqgOXE5EMyC8JF8Ep1kUb8RcYBEioY1fb3m', 'Ibrahim Jibril', 'ibrahim@mcare.com', '+1 (555) 019-9482', 'staff', 'active', '2026-08-17 14:22:44', '2026-08-08 13:16:42', '2026-08-17 13:22:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branches`
--
ALTER TABLE `branches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `barcode` (`barcode`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rx_number` (`rx_number`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `medicine_id` (`medicine_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_no` (`purchase_no`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_id` (`purchase_id`),
  ADD KEY `medicine_id` (`medicine_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `invoice_no` (`invoice_no`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sale_id` (`sale_id`),
  ADD KEY `medicine_id` (`medicine_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `setting_key` (`setting_key`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `branches`
--
ALTER TABLE `branches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1039;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription_items`
--
ALTER TABLE `prescription_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_items`
--
ALTER TABLE `purchase_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sale_items`
--
ALTER TABLE `sale_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `medicines`
--
ALTER TABLE `medicines`
  ADD CONSTRAINT `medicines_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD CONSTRAINT `prescription_items_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `prescription_items_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_items`
--
ALTER TABLE `purchase_items`
  ADD CONSTRAINT `purchase_items_ibfk_1` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_items_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sale_items`
--
ALTER TABLE `sale_items`
  ADD CONSTRAINT `sale_items_ibfk_1` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sale_items_ibfk_2` FOREIGN KEY (`medicine_id`) REFERENCES `medicines` (`id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"mcares_db\",\"table\":\"medicines\"},{\"db\":\"mcares_db\",\"table\":\"categories\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'mcares_db', 'medicines', '{\"CREATE_TIME\":\"2026-08-17 11:47:46\",\"col_order\":[1,0,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16],\"col_visib\":[1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]}', '2026-08-17 14:22:49');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-08-17 17:16:35', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
