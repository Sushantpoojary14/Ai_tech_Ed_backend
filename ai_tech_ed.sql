-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 16, 2023 at 10:20 AM
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
-- Database: `ai_tech_ed`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin', '2023-08-05 02:46:26', '$2y$10$ikFmzjxU4tl2aea94D7gq.xI5yXR0r.Prv7QPbbH7p7W.AZxfxSxi', 'ZiAptO4DdK', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsp_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(121, '01_create_users_table', 1),
(122, '02_create_password_reset_tokens_table', 1),
(123, '03_create_failed_jobs_table', 1),
(124, '05_create_admin_table', 1),
(125, '06_create_test_series_table', 1),
(126, '07_create_test_series_categories_table', 1),
(127, '08_create_test_series_topics_table', 1),
(128, '09_create_test_series_product_table', 1),
(129, '10_create_test_series_purchases_table', 1),
(130, '11_create_cart_table', 1),
(131, '12_create_verbal_question_table', 1),
(132, '13_reading_question_table', 1),
(133, '14_create_non_verbal_question_table', 1),
(134, '15_create_test_status_table', 1),
(135, '16_create_user_test_series_table', 1),
(136, '17_create_user_test_status_table', 1),
(137, '18_create_ts_product_category_table', 1),
(138, '19_create_tspc_set_table', 1),
(140, '20_create_ts_pc_topics_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `non_verbal_question`
--

CREATE TABLE `non_verbal_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `option_1` varchar(40) NOT NULL,
  `option_2` varchar(40) NOT NULL,
  `option_3` varchar(40) NOT NULL,
  `option_4` varchar(40) NOT NULL,
  `option_5` varchar(40) DEFAULT NULL,
  `correct_option` int(11) NOT NULL,
  `explanation` varchar(255) NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reading_question`
--

CREATE TABLE `reading_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` varchar(255) NOT NULL,
  `option_1` varchar(40) NOT NULL,
  `option_2` varchar(40) NOT NULL,
  `option_3` varchar(40) NOT NULL,
  `option_4` varchar(40) NOT NULL,
  `option_5` varchar(40) DEFAULT NULL,
  `correct_option` int(11) NOT NULL,
  `explanation` varchar(255) NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `test_series`
--

CREATE TABLE `test_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `test_type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series`
--

INSERT INTO `test_series` (`id`, `test_type`) VALUES
(1, 'oc'),
(2, 'selective');

-- --------------------------------------------------------

--
-- Table structure for table `test_series_categories`
--

CREATE TABLE `test_series_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsc_type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_categories`
--

INSERT INTO `test_series_categories` (`id`, `tsc_type`) VALUES
(1, 'Maths'),
(2, 'Reading'),
(3, 'Logical');

-- --------------------------------------------------------

--
-- Table structure for table `test_series_product`
--

CREATE TABLE `test_series_product` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `p_name` varchar(40) NOT NULL,
  `p_description` text NOT NULL,
  `p_price` varchar(11) NOT NULL,
  `p_image` varchar(100) DEFAULT NULL,
  `ts_id` bigint(20) UNSIGNED NOT NULL,
  `duration` int(11) NOT NULL,
  `test_month_limit` int(11) NOT NULL,
  `total_question` int(11) NOT NULL,
  `release_date` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_product`
--

INSERT INTO `test_series_product` (`id`, `p_name`, `p_description`, `p_price`, `p_image`, `ts_id`, `duration`, `test_month_limit`, `total_question`, `release_date`, `status`) VALUES
(9, 'OC Test Package - 1', 'It is a logical test only', '29', 'C:\\fakepath\\haztech.png', 1, 30, 3, 35, '223212', 1),
(12, 'selective Test Package - 2', 'it is', '89', '/images/product-1692171774.jpeg', 2, 30, 3, 35, '2023/09/12', 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_series_purchases`
--

CREATE TABLE `test_series_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsp_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `valid_from` varchar(50) NOT NULL,
  `valid_till` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_purchases`
--

INSERT INTO `test_series_purchases` (`id`, `tsp_id`, `user_id`, `valid_from`, `valid_till`) VALUES
(3, 9, 1, '2023-08-11', '2023-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `test_series_topics`
--

CREATE TABLE `test_series_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `t_name` varchar(40) NOT NULL,
  `tsc_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_topics`
--

INSERT INTO `test_series_topics` (`id`, `t_name`, `tsc_id`, `status`) VALUES
(14, 'ratio', 3, 1),
(15, 'Averages', 3, 1),
(16, 'ratio', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_status`
--

CREATE TABLE `test_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_status`
--

INSERT INTO `test_status` (`id`, `type`) VALUES
(1, 'Answered'),
(2, 'Not Answered'),
(3, 'Not Visited'),
(4, 'Marked for Review'),
(5, 'Answered & Marked for\n            Review');

-- --------------------------------------------------------

--
-- Table structure for table `tspc_set`
--

CREATE TABLE `tspc_set` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tspc_id` bigint(20) UNSIGNED NOT NULL,
  `set_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tspc_set`
--

INSERT INTO `tspc_set` (`id`, `tspc_id`, `set_id`, `status`) VALUES
(8, 7, 1, 1),
(9, 7, 2, 1),
(12, 12, 1, 1),
(13, 13, 1, 1),
(14, 12, 2, 1),
(15, 13, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ts_pc_topics`
--

CREATE TABLE `ts_pc_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tspcs_id` bigint(20) UNSIGNED NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ts_pc_topics`
--

INSERT INTO `ts_pc_topics` (`id`, `tspcs_id`, `tst_id`) VALUES
(10, 8, 14),
(11, 8, 15),
(12, 9, 15),
(14, 12, 15),
(15, 12, 14),
(16, 13, 16),
(17, 14, 14),
(18, 15, 16);

-- --------------------------------------------------------

--
-- Table structure for table `ts_product_category`
--

CREATE TABLE `ts_product_category` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsp_id` bigint(20) UNSIGNED NOT NULL,
  `tsc_id` bigint(20) UNSIGNED NOT NULL,
  `total_set` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ts_product_category`
--

INSERT INTO `ts_product_category` (`id`, `tsp_id`, `tsc_id`, `total_set`) VALUES
(7, 9, 3, 2),
(12, 12, 3, 2),
(13, 12, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `DOB` date DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone`, `DOB`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Edison O\'Con', 'abc63@g', '1-220-265-0505', '2023-08-09', '2023-08-05 02:46:26', '$2y$10$P/oYF0xFo1aTT0EHOuIcMeev3EA3JCEXFb7Js3CdZmRRgy8A6ueS6', 'wILBHn4dkG', NULL, NULL),
(2, 'Queenie Maggio', 'abc30@g', '(769) 293-7490', NULL, '2023-08-05 02:46:26', '$2y$10$3q93jog8SwJ3fu8aYxN.5OBje35ZmmShMTTwW6h3ERjgPU2p5YZVa', 'HppbVtZeRk', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_test_series`
--

CREATE TABLE `user_test_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsps_id` bigint(20) UNSIGNED NOT NULL,
  `set_id` int(11) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `complete_status` tinyint(4) NOT NULL DEFAULT 0,
  `start_date` varchar(40) NOT NULL,
  `end_date` varchar(40) DEFAULT NULL,
  `time_taken` varchar(40) DEFAULT NULL,
  `current_timer` varchar(40) DEFAULT NULL,
  `q_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_test_series`
--

INSERT INTO `user_test_series` (`id`, `tsps_id`, `set_id`, `user_id`, `complete_status`, `start_date`, `end_date`, `time_taken`, `current_timer`, `q_id`) VALUES
(15, 3, 8, NULL, 1, '14-08-2023', '14-08-2023', '30', NULL, 491),
(16, 3, 8, NULL, 1, '15-08-2023', '15-08-2023', '30', NULL, 552),
(17, 3, 8, NULL, 1, '15-08-2023', '15-08-2023', '30', NULL, 573),
(18, 3, 9, NULL, 1, '15-08-2023', '15-08-2023', '30', NULL, 599);

-- --------------------------------------------------------

--
-- Table structure for table `user_test_status`
--

CREATE TABLE `user_test_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `q_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `test_answer` varchar(255) DEFAULT NULL,
  `uts_id` bigint(20) UNSIGNED NOT NULL,
  `test_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_test_status`
--

INSERT INTO `user_test_status` (`id`, `q_id`, `status_id`, `test_answer`, `uts_id`, `test_time`) VALUES
(491, 469, 2, NULL, 15, '0'),
(492, 441, 2, NULL, 15, '0'),
(493, 509, 3, NULL, 15, '0'),
(494, 486, 3, NULL, 15, '0'),
(495, 487, 3, NULL, 15, '0'),
(496, 475, 3, NULL, 15, '0'),
(497, 512, 3, NULL, 15, '0'),
(498, 481, 3, NULL, 15, '0'),
(499, 422, 3, NULL, 15, '0'),
(500, 524, 3, NULL, 15, '0'),
(501, 423, 3, NULL, 15, '0'),
(502, 449, 3, NULL, 15, '0'),
(503, 478, 3, NULL, 15, '0'),
(504, 457, 3, NULL, 15, '0'),
(505, 445, 3, NULL, 15, '0'),
(506, 492, 3, NULL, 15, '0'),
(507, 482, 3, NULL, 15, '0'),
(508, 447, 3, NULL, 15, '0'),
(509, 472, 3, NULL, 15, '0'),
(510, 436, 3, NULL, 15, '0'),
(511, 430, 3, NULL, 15, '0'),
(512, 468, 3, NULL, 15, '0'),
(513, 498, 3, NULL, 15, '0'),
(514, 432, 3, NULL, 15, '0'),
(515, 442, 3, NULL, 15, '0'),
(516, 437, 3, NULL, 15, '0'),
(517, 496, 3, NULL, 15, '0'),
(518, 500, 3, NULL, 15, '0'),
(519, 507, 3, NULL, 15, '0'),
(520, 438, 3, NULL, 15, '0'),
(521, 461, 3, NULL, 15, '0'),
(522, 523, 3, NULL, 15, '0'),
(523, 467, 3, NULL, 15, '0'),
(524, 520, 3, NULL, 15, '0'),
(525, 466, 2, NULL, 15, '0'),
(526, 427, 2, NULL, 16, '0'),
(527, 521, 2, NULL, 16, '0'),
(528, 437, 2, NULL, 16, '0'),
(529, 497, 3, NULL, 16, '0'),
(530, 431, 3, NULL, 16, '0'),
(531, 486, 3, NULL, 16, '0'),
(532, 482, 4, '1', 16, '0'),
(533, 519, 3, NULL, 16, '0'),
(534, 450, 5, '1', 16, '0'),
(535, 446, 3, NULL, 16, '0'),
(536, 522, 4, '2', 16, '0'),
(537, 438, 3, NULL, 16, '0'),
(538, 477, 2, NULL, 16, '0'),
(539, 419, 1, '1', 16, '0'),
(540, 433, 3, NULL, 16, '0'),
(541, 518, 3, NULL, 16, '0'),
(542, 524, 4, NULL, 16, '0'),
(543, 480, 2, NULL, 16, '0'),
(544, 490, 2, '3', 16, '0'),
(545, 493, 5, '2', 16, '0'),
(546, 428, 2, NULL, 16, '0'),
(547, 494, 5, NULL, 16, '0'),
(548, 455, 3, NULL, 16, '0'),
(549, 470, 3, NULL, 16, '0'),
(550, 481, 3, NULL, 16, '0'),
(551, 489, 3, NULL, 16, '0'),
(552, 503, 4, '4', 16, '0'),
(553, 445, 3, NULL, 16, '0'),
(554, 471, 3, NULL, 16, '0'),
(555, 508, 3, NULL, 16, '0'),
(556, 472, 3, NULL, 16, '0'),
(557, 452, 3, NULL, 16, '0'),
(558, 506, 1, '1', 16, '0'),
(559, 464, 3, NULL, 16, '0'),
(560, 511, 2, NULL, 16, '0'),
(561, 459, 4, '1', 17, '0'),
(562, 515, 5, '3', 17, '0'),
(563, 511, 1, '4', 17, '0'),
(564, 508, 3, NULL, 17, '0'),
(565, 505, 3, NULL, 17, '0'),
(566, 431, 4, '1', 17, '0'),
(567, 462, 3, NULL, 17, '0'),
(568, 468, 3, NULL, 17, '0'),
(569, 514, 3, NULL, 17, '0'),
(570, 479, 3, NULL, 17, '0'),
(571, 469, 3, NULL, 17, '0'),
(572, 451, 4, '4', 17, '0'),
(573, 478, 4, '1', 17, '0'),
(574, 519, 3, NULL, 17, '0'),
(575, 492, 3, NULL, 17, '0'),
(576, 481, 3, NULL, 17, '0'),
(577, 475, 3, NULL, 17, '0'),
(578, 500, 3, NULL, 17, '0'),
(579, 501, 3, NULL, 17, '0'),
(580, 486, 3, NULL, 17, '0'),
(581, 432, 3, NULL, 17, '0'),
(582, 430, 3, NULL, 17, '0'),
(583, 445, 3, NULL, 17, '0'),
(584, 467, 3, NULL, 17, '0'),
(585, 433, 3, NULL, 17, '0'),
(586, 503, 3, NULL, 17, '0'),
(587, 465, 3, NULL, 17, '0'),
(588, 473, 3, NULL, 17, '0'),
(589, 509, 3, NULL, 17, '0'),
(590, 523, 3, NULL, 17, '0'),
(591, 425, 3, NULL, 17, '0'),
(592, 487, 3, NULL, 17, '0'),
(593, 447, 3, NULL, 17, '0'),
(594, 474, 3, NULL, 17, '0'),
(595, 477, 3, NULL, 17, '0'),
(596, 515, 5, '1', 18, '0'),
(597, 474, 5, '4', 18, '0'),
(598, 495, 2, NULL, 18, '0'),
(599, 502, 2, NULL, 18, '0'),
(600, 509, 3, NULL, 18, '0'),
(601, 504, 3, NULL, 18, '0'),
(602, 458, 3, NULL, 18, '0'),
(603, 470, 3, NULL, 18, '0'),
(604, 516, 3, NULL, 18, '0'),
(605, 519, 3, NULL, 18, '0'),
(606, 461, 3, NULL, 18, '0'),
(607, 525, 3, NULL, 18, '0'),
(608, 518, 3, NULL, 18, '0'),
(609, 460, 3, NULL, 18, '0'),
(610, 487, 3, NULL, 18, '0'),
(611, 517, 3, NULL, 18, '0'),
(612, 473, 3, NULL, 18, '0'),
(613, 520, 3, NULL, 18, '0'),
(614, 472, 3, NULL, 18, '0'),
(615, 479, 3, NULL, 18, '0'),
(616, 477, 3, NULL, 18, '0'),
(617, 501, 3, NULL, 18, '0'),
(618, 513, 3, NULL, 18, '0'),
(619, 506, 3, NULL, 18, '0'),
(620, 463, 3, NULL, 18, '0'),
(621, 471, 3, NULL, 18, '0'),
(622, 476, 3, NULL, 18, '0'),
(623, 510, 3, NULL, 18, '0'),
(624, 497, 3, NULL, 18, '0'),
(625, 466, 3, NULL, 18, '0'),
(626, 488, 3, NULL, 18, '0'),
(627, 523, 3, NULL, 18, '0'),
(628, 492, 3, NULL, 18, '0'),
(629, 493, 3, NULL, 18, '0'),
(630, 524, 3, NULL, 18, '0');

-- --------------------------------------------------------

--
-- Table structure for table `verbal_question`
--

CREATE TABLE `verbal_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` longtext NOT NULL,
  `option_1` varchar(40) NOT NULL,
  `option_2` varchar(40) NOT NULL,
  `option_3` varchar(40) NOT NULL,
  `option_4` varchar(40) NOT NULL,
  `option_5` varchar(40) DEFAULT NULL,
  `correct_option` varchar(11) NOT NULL,
  `explanation` longtext NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `verbal_question`
--

INSERT INTO `verbal_question` (`id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `option_5`, `correct_option`, `explanation`, `tst_id`, `marks`, `status`) VALUES
(419, 'Two numbers have a 4:7 ratio. The new numbers have a ratio of 16:29 if 12 is taken away from each. The minimizing number is:', '25,', '33,', '42,', '49', NULL, '2', 'Let the numbers be 4x and 7x. Then, 4x - 12 = 16, 7x - 12 = 29. \n29(4x - 12) = 16(7x - 12). \n16x = 412. \nx = 25.75. \nThe smaller number = (4 x 25.75) = 103.', 14, NULL, 1),
(420, 'Two numbers have a 2:9 ratio. The new numbers have a ratio of 8:31 if 5 is taken away from each. The minimizing number is:', '19,', '24,', '31,', '37', NULL, '1', 'Let the numbers be 2x and 9x. Then, 2x - 5 = 8, 9x - 5 = 31.\n31(2x - 5) = 8(9x - 5).\n13x = 91.\nx = 7.\nThe smaller number = (2 x 7) = 14.', 14, NULL, 1),
(421, 'Welcome to Trinity Tuition College’s online platform for Selective Trial Tests, designed to help Year 6 students in NSW, Australia, prepare for their selective high school placement test. As parents, we understand that you want the best education for your child, and we are here to support you in achieving that goal.\n\nOur Year 5 & 6 Selective Practice Tests pack has been designed to provide comprehensive preparation for the selective high school placement test. Our pack includes 66 tests, covering all areas of the exam, and has been proven to increase your child’s chances of getting into the school of their dreams.\n\nOur updated tests now match the latest exam standards, giving you the confidence to prepare your child for success. With Trinity Tuition College, your child will have access to the latest exam questions, enabling them to become familiar with the format and content of the test.We understand that preparing for the selective high school placement test can be stressful for both you and your child. Our all-in-one package has been designed to take the stress out of preparation by providing a structured and comprehensive approach to the exam.\n\nDon’t let your child miss out on their dream school. Sign up now for our Year 5 & 6 Selective Practice Tests pack, and give your child the competitive edge they need to succeed in their selective high school placement test.', '22,', '28,', '33,', '38', NULL, '2', 'Let the numbers be 5x and 11x. Then, 5x - 10 = 20, 11x - 10 = 41.\n41(5x - 10) = 20(11x - 10).\n9x = 150.\nx = 16.67.\nThe smaller number = (5 x 16.67) = 83.35.', 14, NULL, 1),
(422, 'Two numbers have a 7:13 ratio. The new numbers have a ratio of 28:51 if 8 is taken away from each. The minimizing number is:', '47,', '53,', '59,', '65', NULL, '2', 'Let the numbers be 7x and 13x. Then, 7x - 8 = 28, 13x - 8 = 51.\n51(7x - 8) = 28(13x - 8).\n5x = 35.\nx = 7.\nThe smaller number = (7 x 7) = 49.', 14, NULL, 1),
(423, 'Two numbers have a 6:17 ratio. The new numbers have a ratio of 24:65 if 15 is taken away from each. The minimizing number is:', '44,', '52,', '61,', '69', NULL, '1', 'Let the numbers be 6x and 17x. Then, 6x - 15 = 24, 17x - 15 = 65.\n65(6x - 15) = 24(17x - 15).\n4x = 75.\nx = 18.75.\nThe smaller number = (6 x 18.75) = 112.5.', 14, NULL, 1),
(424, 'If 25% of a number is equal to three-fourth of another number, what is the ratio of the first number to the second number?', '01:03,', '02:05,', '03:08,', '04:09', NULL, '1', 'Let 25% of A = 3B/4.\nThen, 25A = 3B x 100/4.\nA = 3B x 4/100 x 1/25.\nA = 12B/100/25.\nA = 12B/250.\nA : B = 12 : 250.\nA : B = 1 : 25.', 14, NULL, 1),
(425, 'If 30% of a number is equal to four-fifth of another number, what is the ratio of the first number to the second number?', '02:07,', '04:10,', '06:15,', '08:20', NULL, '2', 'Let 30% of A = 4B/5.\nThen, 30A = 4B x 100/5.\nA = 4B x 5/100 x 1/30.\nA = 20B/100/30.\nA = 20B/300.\nA : B = 20 : 300.\nA : B = 2 : 30.', 14, NULL, 1),
(426, 'If 15% of a number is equal to three-tenth of another number, what is the ratio of the first number to the second number?', '02:06,', '04:12,', '06:18,', '08:24', NULL, '2', 'Let 15% of A = 3B/10.\nThen, 15A = 3B x 100/10.\nA = 3B x 10/100 x 1/15.\nA = 3B/100/15.\nA = 3B/150.\nA : B = 3 : 150.\nA : B = 1 : 50.', 14, NULL, 1),
(427, 'If 20% of a number is equal to half of another number, what is the ratio of the first number to the second number?', '02:04,', '04:08,', '06:12,', '08:16', NULL, '2', 'Let 20% of A = B/2.\nThen, 20A = B x 100/2.\nA = B x 2/100 x 1/20.\nA = B/100/10.\nA = B/1000.\nA : B = 1 : 1000.', 14, NULL, 1),
(428, 'If 10% of a number is equal to three-seventh of another number, what is the ratio of the first number to the second number?', '01:07,', '02:14,', '03:21,', '04:28', NULL, '2', 'Let 10% of A = 3B/7.\nThen, 10A = 3B x 100/7.\nA = 3B x 7/100 x 1/10.\nA = 21B/100/10.\nA = 21B/1000.\nA : B = 21 : 1000.', 14, NULL, 1),
(429, 'There are a certain number of pencils in a box and the box only contains yellow, blue, and green colored pencils. The number of yellow pencils is three times the number of blue pencils. Blue pencils outnumber green pencils by a factor of one-third. If there are 60 pencils in total, how many yellow pencils are there?', '15', '20', '30', '45', NULL, '2', 'Since there are three times as many yellow pencils as blue pencils, the ratio of Y:B is 3:1. The ratio of G:B is one to three because there are one-third as many green pencils as blue pencils. Using these ratios, we can construct the ratio of Y:B:G to be 9:3:1. There are 60 pencils total, thus 13 divided by 13 is 4 pencils. The quantity of yellow pencils is 9 parts yellow pencil divided by 4 for a total of 30 yellow pencils. Therefore, the answer is Option C.', 14, NULL, 1),
(430, 'There are a certain number of students in a class and the class only contains boys and girls. The number of boys is twice the number of girls. Girls outnumber boys by a factor of one-fifth. If there are 180 students in total, how many boys are there?', '40', '60', '80', '120', NULL, '2', 'Since there are twice as many boys as girls, the ratio of B:G is 2:1. The ratio of G:B is one to five because girls outnumber boys by a factor of one-fifth. Using these ratios, we can construct the ratio of B:G to be 10:5. There are 180 students total, thus 15 divided by 15 is 12 students. The quantity of boys is 10 parts boys divided by 15 for a total of 8 boys. Therefore, the answer is Option B.', 14, NULL, 1),
(431, 'Welcome to Trinity Tuition College’s online platform for Selective Trial Tests, designed to help Year 6 students in NSW, Australia, prepare for their selective high school placement test. As parents, we understand that you want the best education for your child, and we are here to support you in achieving that goal.\n\nOur Year 5 & 6 Selective Practice Tests pack has been designed to provide comprehensive preparation for the selective high school placement test. Our pack includes 66 tests, covering all areas of the exam, and has been proven to increase your child’s chances of getting into the school of their dreams.\n\nOur updated tests now match the latest exam standards, giving you the confidence to prepare your child for success. With Trinity Tuition College, your child will have access to the latest exam questions, enabling them to become familiar with the format and content of the test.We understand that preparing for the selective high school placement test can be stressful for both you and your child. Our all-in-one package has been designed to take the stress out of preparation by providing a structured and comprehensive approach to the exam.\n\nDon’t let your child miss out on their dream school. Sign up now for our Year 5 & 6 Selective Practice Tests pack, and give your child the competitive edge they need to succeed in their selective high school placement test.', '8', '16', '32', '40', NULL, '2', 'Since there are four times as many red apples as yellow apples, the ratio of R:Y is 4:1. The ratio of G:Y is one to eight because yellow apples outnumber green apples by a factor of one-eighth. Using these ratios, we can construct the ratio of R:Y:G to be 32:8:1. There are 64 apples total, thus 41 divided by 41 is 1 apple. The quantity of red apples is 32 parts red apple divided by 41 for a total of 40 red apples. Therefore, the answer is Option D.', 14, NULL, 1),
(432, 'There are a certain number of cookies in a jar and the jar only contains chocolate, vanilla, and strawberry flavored cookies. The number of chocolate cookies is three times the number of vanilla cookies. Vanilla cookies outnumber strawberry cookies by a factor of one-third. If there are 120 cookies in total, how many chocolate cookies are there?', '20', '30', '60', '90', NULL, '2', 'Since there are three times as many chocolate cookies as vanilla cookies, the ratio of C:V is 3:1. The ratio of S:V is one to three because vanilla cookies outnumber strawberry cookies by a factor of one-third. Using these ratios, we can construct the ratio of C:V:S to be 9:3:1. There are 120 cookies total, thus 13 divided by 13 is 4 cookies. The quantity of chocolate cookies is 9 parts chocolate cookie divided by 4 for a total of 27 chocolate cookies. Therefore, the answer is Option B.', 14, NULL, 1),
(433, 'There are a certain number of books on a shelf and the shelf only contains fiction, non-fiction, and mystery genre books. The number of fiction books is twice the number of non-fiction books. Non-fiction books outnumber mystery books by a factor of one-fifth. If there are 80 books in total, how many fiction books are there?', '20', '30', '40', '60', NULL, '2', 'Since there are twice as many fiction books as non-fiction books, the ratio of F:NF is 2:1. The ratio of M:NF is one to five because non-fiction books outnumber mystery books by a factor of one-fifth. Using these ratios, we can construct the ratio of F:NF:M to be 10:5:1. There are 80 books total, thus 16 divided by 16 is 5 books. The quantity of fiction books is 10 parts fiction book divided by 16 for a total of 40 fiction books. Therefore, the answer is Option C.', 14, NULL, 1),
(434, 'A basket contains apples and oranges. The ratio of apples to oranges is 7:3.\nIf 40 apples are removed from the basket, there are 1.5 times more oranges than apples. What is the difference between the number first contained in the basket of apples and oranges?', '24', '40', '48', '60', NULL, '2', 'The original ratio between apples to oranges is 7:3. When 40 apples are removed, the ratio now becomes 4:6, which can be simplified to 2:3. Hence, 40 apples represent 2 parts. Therefore, 1 part = 20 apples. Since there is 1 more part of oranges than apples originally, the difference between apples and oranges is 30. Therefore, the answer is Option C.', 14, NULL, 1),
(435, 'A classroom has boys and girls. The ratio of boys to girls is 3:4.\nIf 20 boys are removed from the classroom, there are 1.25 times more girls than boys. What is the difference between the number first contained in the classroom of boys and girls?', '16', '20', '25', '30', NULL, '2', 'The original ratio between boys to girls is 3:4. When 20 boys are removed, the ratio now becomes 1:1.25, which can be simplified to 4:5. Hence, 20 boys represent 4 parts. Therefore, 1 part = 5 boys. Since there is 1 more part of girls than boys originally, the difference between boys and girls is 5. Therefore, the answer is Option D.', 14, NULL, 1),
(436, 'A jar contains red and green candies. The ratio of red to green candies is 5:2.\nIf 30 red candies are removed from the jar, there are 2.5 times more green candies than red candies. What is the difference between the number first contained in the jar of red and green candies?', '15', '30', '45', '60', NULL, '1', 'The original ratio between red to green candies is 5:2. When 30 red candies are removed, the ratio now becomes 2:5. Hence, 30 red candies represent 1 part. Therefore, 1 part = 30 red candies. Since there is 3 more parts of green candies than red candies originally, the difference between red and green candies is 90. Therefore, the answer is Option A.', 14, NULL, 1),
(437, 'A box contains pencils and pens. The ratio of pencils to pens is 2:3.\nIf 50 pencils are removed from the box, there are 1.2 times more pens than pencils. What is the difference between the number first contained in the box of pencils and pens?', '20', '40', '50', '60', NULL, '2', 'The original ratio between pencils to pens is 2:3. When 50 pencils are removed, the ratio now becomes 1:1.2, which can be simplified to 5:6. Hence, 50 pencils represent 5 parts. Therefore, 1 part = 10 pencils. Since there is 1 more part of pens than pencils originally, the difference between pencils and pens is 10. Therefore, the answer is Option C.', 14, NULL, 1),
(438, 'A basket contains roses and lilies. The ratio of roses to lilies is 3:2.\nIf 25 roses are removed from the basket, there are 1.8 times more lilies than roses. What is the difference between the number first contained in the basket of roses and lilies?', '22', '25', '33', '45', NULL, '2', 'The original ratio between roses to lilies is 3:2. When 25 roses are removed, the ratio now becomes 1:1.8, which can be simplified to 5:9. Hence, 25 roses represent 5 parts. Therefore, 1 part = 5 roses. Since there is 4 more parts of lilies than roses originally, the difference between roses and lilies is 20. Therefore, the answer is Option D.', 14, NULL, 1),
(439, 'JOHN has different colored pens in his pencil case. The pen colors are red, blue, green, and yellow. The ratio between red to blue pens is 3:2. \nJOHN randomly chooses a pen from the pencil case. The probability that the pen chosen is green is 0.15. The probability that the pen chosen is red is 0.2. \nWhat is the probability that the pen chosen is blue?', '0.3,', '0.35,', '0.4,', '0.45', NULL, '2', 'The probability of choosing a red pen is 0.2. Hence, the probability of choosing a blue pen is 0.2 x (2/3) = 0.4/3 = 0.1333 (approximately). As all the probabilities have to add to 1, the probability of choosing a green pen is 1 - 0.2 - 0.1333 = 0.6667 (approximately). Therefore, the answer is Option B.', 14, NULL, 1),
(440, 'EMILY has different flavored ice cream in her freezer. The ice cream flavors are vanilla, chocolate, strawberry, and mint. The ratio between vanilla to chocolate ice cream is 5:3. \nEMILY randomly chooses an ice cream from the freezer. The probability that the ice cream chosen is strawberry is 0.25. The probability that the ice cream chosen is vanilla is 0.4. \nWhat is the probability that the ice cream chosen is chocolate?', '0.15,', '0.25,', '0.35,', '0.45', NULL, '2', 'The probability of choosing a vanilla ice cream is 0.4. Hence, the probability of choosing a chocolate ice cream is 0.4 x (3/5) = 0.24. As all the probabilities have to add to 1, the probability of choosing a strawberry ice cream is 1 - 0.4 - 0.24 = 0.36. Therefore, the answer is Option C.', 14, NULL, 1),
(441, 'JAMES has different colored t-shirts in his closet. The t-shirt colors are black, white, gray, and blue. The ratio between black to white t-shirts is 2:1. \nJAMES randomly chooses a t-shirt from the closet. The probability that the t-shirt chosen is gray is 0.2. The probability that the t-shirt chosen is black is 0.4. \nWhat is the probability that the t-shirt chosen is blue?', '0.15,', '0.2,', '0.25,', '0.3', NULL, '2', 'The probability of choosing a black t-shirt is 0.4. Hence, the probability of choosing a blue t-shirt is 0.4 x (1/2) = 0.2. As all the probabilities have to add to 1, the probability of choosing a gray t-shirt is 1 - 0.4 - 0.2 = 0.4. Therefore, the answer is Option D.', 14, NULL, 1),
(442, 'LILY has different types of fruit in her basket. The fruit types are apples, oranges, bananas, and grapes. The ratio between apples to oranges is 4:3. \nLILY randomly chooses a fruit from the basket. The probability that the fruit chosen is bananas is 0.1. The probability that the fruit chosen is apples is 0.25. \nWhat is the probability that the fruit chosen is grapes?', '0.2,', '0.25,', '0.3,', '0.35', NULL, '2', 'The probability of choosing an apples is 0.25. Hence, the probability of choosing a grapes is 0.25 x (3/4) = 0.1875 (approximately). As all the probabilities have to add to 1, the probability of choosing a bananas is 1 - 0.25 - 0.1875 = 0.5625 (approximately). Therefore, the answer is Option C.', 14, NULL, 1),
(443, 'ALEX has different sizes of shoes in his collection. The shoe sizes are 8, 9, 10, and 11. The ratio between size 8 to size 9 shoes is 2:1. \nALEX randomly chooses a shoe from the collection. The probability that the shoe chosen is size 10 is 0.2. The probability that the shoe chosen is size 8 is 0.3. \nWhat is the probability that the shoe chosen is size 11?', '0.15,', '0.2,', '0.25,', '0.3', NULL, '2', 'The probability of choosing a size 8 shoe is 0.3. Hence, the probability of choosing a size 11 shoe is 0.3 x (1/2) = 0.15. As all the probabilities have to add to 1, the probability of choosing a size 10 shoe is 1 - 0.3 - 0.15 = 0.55. Therefore, the answer is Option B.', 14, NULL, 1),
(444, 'The ages of Alex and Beth are in the ratio 4:7. five years later, the sum of their ages will be 63. Find Alex\'s age.', '10YEARS', '12YEARS', '21YEARS', '28YEARS', NULL, '1', 'Let\'s assume the current ages of Alex and Beth are 4x and 7x, respectively.\n\nFive years later, Alex\'s age will be 4x + 5, and Beth\'s age will be 7x + 5.\n\nAccording to the given information, the sum of their ages five years later will be 63:\n\n(4x + 5) + (7x + 5) = 63\n\nCombining like terms:\n\n11x + 10 = 63\n\nSubtracting 10 from both sides:\n\n11x = 53\n\nDividing both sides by 11:\n\nx = 4\n\nNow we can find Alex\'s current age:\n\nAlex\'s age = 4x = 4 * 4 = 16\n\nTherefore, Alex is currently 16 years old.', 14, NULL, 1),
(445, 'The lengths of two sides of a triangle are in a ratio of 3:4. If the longer side is 24 cm, what is the length of the shorter side?', '12CM', '14CM', '18CM', '32CM', NULL, '1', 'Let\'s assume the lengths of the shorter and longer sides of the triangle are 3x and 4x, respectively.\n\nAccording to the given information, the longer side is 24 cm:\n\n4x = 24\n\nDividing both sides by 4:\n\nx = 6\n\nNow we can find the length of the shorter side:\n\nShorter side = 3x = 3 * 6 = 18 cm\n\nTherefore, the length of the shorter side is 18 cm.', 14, NULL, 1),
(446, 'The number of boys to girls in a classroom is in the ratio of 2:5. If there are 28 students in total, how many girls are there?', '5GIRLS', '10GIRLS', '14GIRLS', '20GIRLS', NULL, '2', 'Let\'s assume the number of boys and girls in the classroom are 2x and 5x, respectively.\n\nAccording to the given information, the total number of students is 28:\n\n2x + 5x = 28\n\nCombining like terms:\n\n7x = 28\n\nDividing both sides by 7:\n\nx = 4\n\nNow we can find the number of girls:\n\nNumber of girls = 5x = 5 * 4 = 20 girls\n\nTherefore, there are 20 girls in the classroom.', 14, NULL, 1),
(447, 'The heights of two buildings are in a ratio of 3:7. If the shorter building is 21 meters, what is the height of the taller building?', '35METERS', '49METERS', '63METERS', '77METERS', NULL, '2', 'Let\'s assume the heights of the shorter and taller buildings are 3x and 7x, respectively.\n\nAccording to the given information, the shorter building is 21 meters:\n\n3x = 21\n\nDividing both sides by 3:\n\nx = 7\n\nNow we can find the height of the taller building:\n\nHeight of taller building = 7x = 7 * 7 = 49 meters\n\nTherefore, the height of the taller building is 49 meters.', 14, NULL, 1),
(448, 'The ratio of the circumference of two circles is 5:8. If the radius of the smaller circle is 4 cm, what is the radius of the larger circle?', '6CM', '10CM', '16CM', '20CM', NULL, '2', 'Let\'s assume the radii of the smaller and larger circles are 4x and 8x, respectively.\n\nAccording to the given information, the ratio of the circumferences is 5:8:\n\n(2π * 4x) / (2π * 8x) = 5/8\n\nSimplifying the equation:\n\n4x / 8x = 5/8\n\nDividing both sides by 4:\n\n1 / 2 = 5/8\n\nCross-multiplying:\n\n8 = 10\n\nThis is not consistent, so there is a mistake in the given information.\n\nTherefore, it is not possible to determine the radius of the larger circle.', 14, NULL, 1),
(449, 'Welcome to Trinity Tuition College’s online platform for Selective Trial Tests, designed to help Year 6 students in NSW, Australia, prepare for their selective high school placement test. As parents, we understand that you want the best education for your child, and we are here to support you in achieving that goal.\n\nOur Year 5 & 6 Selective Practice Tests pack has been designed to provide comprehensive preparation for the selective high school placement test. Our pack includes 66 tests, covering all areas of the exam, and has been proven to increase your child’s chances of getting into the school of their dreams.\n\nOur updated tests now match the latest exam standards, giving you the confidence to prepare your child for success. With Trinity Tuition College, your child will have access to the latest exam questions, enabling them to become familiar with the format and content of the test.We understand that preparing for the selective high school placement test can be stressful for both you and your child. Our all-in-one package has been designed to take the stress out of preparation by providing a structured and comprehensive approach to the exam.\n\nDon’t let your child miss out on their dream school. Sign up now for our Year 5 & 6 Selective Practice Tests pack, and give your child the competitive edge they need to succeed in their selective high school placement test.', '90liters', '120liters', '150liters', '180liters', NULL, '2', 'Let\'s assume the quantity of the second part of juice is 3x liters, where x is a common ratio.\n\nGiven that the ratio of the two parts is 2:3, we can set up the following equation:\n\n2x = 60\n\nDividing both sides by 2:\n\nx = 60/2\n\nx = 30\n\nSo, the quantity of the second part of juice is:\n\n3x = 3 * 30 = 90 liters\n\nThe total quantity of the two parts of juice is the sum of their quantities:\n\n60 liters + 90 liters = 150 liters\n\nTherefore, the total quantity of juice is 150 liters.', 14, NULL, 1),
(450, 'The proportion of two parts of a particular amount of money is 1:4. Determine the total amount if the first part is $80.', '$100', '$140', '$160', '$240', NULL, '2', 'Let\'s assume the amount of the second part of money is 4x dollars, where x is a common ratio.\n\nGiven that the proportion of the two parts is 1:4, we can set up the following equation:\n\nx = 80\n\nSo, the amount of the second part of money is:\n\n4x = 4 * 80 = $320\n\nThe total amount of the two parts of money is the sum of their amounts:\n\n$80 + $320 = $400\n\nTherefore, the total amount is $400.', 14, NULL, 1),
(451, 'The ratio of two parts of a particular amount of paint is 3:7. If the first part is 15 liters, what is the total quantity of paint?', '30liters', '40liters', '60liters', '105liters', NULL, '2', 'Let\'s assume the quantity of the second part of paint is 7x liters, where x is a common ratio.\n\nGiven that the ratio of the two parts is 3:7, we can set up the following equation:\n\n3x = 15\n\nDividing both sides by 3:\n\nx = 15/3\n\nx = 5\n\nSo, the quantity of the second part of paint is:\n\n7x = 7 * 5 = 35 liters\n\nThe total quantity of the two parts of paint is the sum of their quantities:\n\n15 liters + 35 liters = 50 liters\n\nTherefore, the total quantity of paint is 50 liters.', 14, NULL, 1),
(452, 'The proportion of two parts of a particular amount of apples is 2:9. Determine the total quantity if the first part is 24 apples.', '32apples', '45apples', '48apples', '216apples', NULL, '2', 'Let\'s assume the quantity of the second part of apples is 9x, where x is a common ratio.\n\nGiven that the proportion of the two parts is 2:9, we can set up the following equation:\n\n2x = 24\n\nDividing both sides by 2:\n\nx = 24/2\n\nx = 12\n\nSo, the quantity of the second part of apples is:\n\n9x = 9 * 12 = 108 apples\n\nThe total quantity of the two parts of apples is the sum of their quantities:\n\n24 apples + 108 apples = 132 apples\n\nTherefore, the total quantity of apples is 132 apples.', 14, NULL, 1),
(453, 'The ratio of two parts of a particular amount of time is 1:5. If the first part is 2 hours, what is the total duration?', '3hours', '7hours', '10hours', '12hours', NULL, '2', 'Let\'s assume the duration of the second part of time is 5x hours, where x is a common ratio.\n\nGiven that the ratio of the two parts is 1:5, we can set up the following equation:\n\nx = 2\n\nSo, the duration of the second part of time is:\n\n5x = 5 * 2 = 10 hours\n\nThe total duration of the two parts of time is the sum of their durations:\n\n2 hours + 10 hours = 12 hours\n\nTherefore, the total duration is 12 hours.', 14, NULL, 1),
(455, 'The team scored 36 runs in the first 8 overs of a cricket match. What run rate must be achieved in the remaining 42 overs to meet the 250 run target?', '5.5,', '5.75,', '6,', '6.25', NULL, '2', 'To find the required run rate in the remaining 42 overs to reach the target of 250 runs, we can use the concept of average run rate. \n\nThe total runs required to reach the target is 250 runs. Since 8 overs have already been played at a run rate of 36/8 = 4.5 runs per over, the total runs scored in those 8 overs would be 4.5 * 8 = 36 runs.\n\nThe remaining runs required to reach the target is 250 - 36 = 214 runs.\n\nNow, we can calculate the required run rate for the remaining 42 overs by dividing the remaining runs required by the number of overs remaining:\n\nRequired Run Rate = Remaining Runs Required / Remaining Overs\n= 214 runs / 42 overs\n= 6 runs per over', 15, NULL, 1),
(456, 'The company\'s revenue increased by $50,000 in the first quarter. What revenue must be achieved in the remaining three quarters to meet the $1,000,000 target?', '$300,000,', '$350,000,', '$375,000,', '$400,000', NULL, '2', 'To find the revenue that must be achieved in the remaining three quarters to meet the target of $1,000,000, we need to calculate the remaining revenue required. \n\nThe total revenue required to meet the target is $1,000,000. Since $50,000 has already been achieved in the first quarter, the remaining revenue required would be $1,000,000 - $50,000 = $950,000.\n\nNow, we can calculate the revenue that must be achieved in the remaining three quarters by dividing the remaining revenue required by the number of quarters remaining:\n\nRequired Revenue = Remaining Revenue Required / Remaining Quarters\n= $950,000 / 3 quarters\n= $316,666.67\n\nRounding up to the nearest thousand, the required revenue in the remaining three quarters is approximately $400,000.', 15, NULL, 1),
(457, 'The population of a city increased by 5,000 people in the first year. What population must be achieved in the remaining four years to meet the target of 100,000 people?', '20,000,', '25,000,', '30,000,', '35,000', NULL, '2', 'To find the population that must be achieved in the remaining four years to meet the target of 100,000 people, we need to calculate the remaining population required. \n\nThe total population required to meet the target is 100,000 people. Since 5,000 people were added in the first year, the remaining population required would be 100,000 - 5,000 = 95,000 people.\n\nNow, we can calculate the population that must be achieved in the remaining four years by dividing the remaining population required by the number of years remaining:\n\nRequired Population = Remaining Population Required / Remaining Years\n= 95,000 people / 4 years\n= 23,750 people\n\nRounding up to the nearest thousand, the required population in the remaining four years is approximately 25,000 people.', 15, NULL, 1),
(458, 'The temperature increased by 2.5 degrees Celsius in the first hour. What temperature must be achieved in the remaining six hours to reach the target of 30 degrees Celsius?', '10,', '15,', '17.5,', '20', NULL, '2', 'To find the temperature that must be achieved in the remaining six hours to reach the target of 30 degrees Celsius, we need to calculate the remaining temperature required. \n\nThe total temperature required to reach the target is 30 degrees Celsius. Since the temperature increased by 2.5 degrees Celsius in the first hour, the remaining temperature required would be 30 - 2.5 = 27.5 degrees Celsius.\n\nNow, we can calculate the temperature that must be achieved in the remaining six hours by dividing the remaining temperature required by the number of hours remaining:\n\nRequired Temperature = Remaining Temperature Required / Remaining Hours\n= 27.5 degrees Celsius / 6 hours\n= 4.58 degrees Celsius\n\nRounding up to the nearest tenth, the required temperature in the remaining six hours is approximately 17.5 degrees Celsius.', 15, NULL, 1),
(459, 'The team\'s score increased by 20 points in the first period. What score must be achieved in the remaining three periods to meet the 100 point target?', '20,', '25,', '30,', '35', NULL, '2', 'To find the score that must be achieved in the remaining three periods to reach the target of 100 points, we need to calculate the remaining score required. \n\nThe total score required to reach the target is 100 points. Since the score increased by 20 points in the first period, the remaining score required would be 100 - 20 = 80 points.\n\nNow, we can calculate the score that must be achieved in the remaining three periods by dividing the remaining score required by the number of periods remaining:\n\nRequired Score = Remaining Score Required / Remaining Periods\n= 80 points / 3 periods\n= 26.67 points\n\nRounding up to the nearest whole number, the required score in the remaining three periods is approximately 27 points.', 15, NULL, 1),
(460, 'A classroom consists of 25 boys and 15 girls. The boys\' average height is 160 cm, and the girls\' average height is 150 cm. What is the average height of the classroom?', '153cm', '154cm', '155cm', 'Noneofthese', NULL, '5', 'Let\'s denote the average height of the boys as B, the average height of the girls as G, and the average height of the classroom as C.\n\nThe total height of the boys would be 25 boys * 160 cm = 4000 cm.\nThe total height of the girls would be 15 girls * 150 cm = 2250 cm.\n\nNow, to find the average height of the classroom, we sum up the total heights and divide it by the total number of students:\n\nAverage Height of Classroom = (Total Height of Boys + Total Height of Girls) / Total Number of Students\n= (4000 cm + 2250 cm) / 40 students\n= 6250 cm / 40 students = 156.25 cm, which rounds to 156 cm.\n\nTherefore, the average height of the classroom is 156 cm.', 15, NULL, 1),
(461, 'The average of 50 temperatures is 25 degrees Celsius. Of them, at the most, how many may be below zero?', '0', '5', '25', '49', NULL, '2', 'Average of 50 temperatures = 25 degrees Celsius.\n\nSum of 50 temperatures (25 x 50) = 1250 degrees Celsius.\n\nIt is quite possible that 49 of these temperatures may be below zero and if their sum is -a, then the 50th temperature is (1250 - (-a)).', 15, NULL, 1),
(462, 'The average of 30 times a number is 10. Of them, at the most, how many times may be negative?', '0', '1', '10', '29', NULL, '2', 'Average of 30 times a number = 10.\n\nSum of 30 times a number (10 x 30) = 300.\n\nIt is quite possible that 29 of these times may be negative and if their sum is -a, then the 30th time is (300 - (-a)).', 15, NULL, 1),
(463, 'The average of 15 ages is 30 years. Of them, at the most, how many ages may be greater than 50?', '0', '1', '10', '14', NULL, '2', 'Average of 15 ages = 30 years.\n\nSum of 15 ages (30 x 15) = 450 years.\n\nIt is quite possible that 14 of these ages may be greater than 50 and if their sum is a, then the 15th age is (450 - a).', 15, NULL, 1),
(464, 'The average of 25 test scores is 80. Of them, at the most, how many scores may be less than 40?', '0', '5', '15', '24', NULL, '2', 'Average of 25 test scores = 80.\n\nSum of 25 test scores (80 x 25) = 2000.\n\nIt is quite possible that 24 of these scores may be less than 40 and if their sum is -a, then the 25th score is (2000 - (-a)).', 15, NULL, 1),
(465, 'The average of 12 heights is 160 cm. Of them, at the most, how many heights may be less than 100 cm?', '0', '1', '10', '11', NULL, '2', 'Average of 12 heights = 160 cm.\n\nSum of 12 heights (160 x 12) = 1920 cm.\n\nIt is quite possible that 11 of these heights may be less than 100 cm and if their sum is -a, then the 12th height is (1920 - (-a)).', 15, NULL, 1),
(466, 'The average salary of 5 employees increases by $500 when a new employee joins the group. What might be the salary of the new employee?', '$1,000', '$1,500', '$2,000', 'Datainadequate', NULL, '2', 'Total salary increased = (5 x $500) = $2,500.\nSalary of new employee = (Current average salary + Total salary increased) = ($X + $2,500).', 15, NULL, 1),
(467, 'The average age of a group of 10 students increases by 2 years when a new student joins the group. What might be the age of the new student?', '12years', '14years', '16years', 'Datainadequate', NULL, '2', 'Total age increased = (10 x 2) years = 20 years.\nAge of new student = (Current average age + Total age increased) = (X years + 20 years).', 15, NULL, 1),
(468, 'The average height of 6 basketball players increases by 5 inches when a new player joins the team. What might be the height of the new player?', '5inches', '10inches', '15inches', 'Datainadequate', NULL, '2', 'Total height increased = (6 x 5) inches = 30 inches.\nHeight of new player = (Current average height + Total height increased) = (X inches + 30 inches).', 15, NULL, 1),
(469, 'Welcome to Trinity Tuition College’s online platform for Selective Trial Tests, designed to help Year 6 students in NSW, Australia, prepare for their selective high school placement test. As parents, we understand that you want the best education for your child, and we are here to support you in achieving that goal.\n\nOur Year 5 & 6 Selective Practice Tests pack has been designed to provide comprehensive preparation for the selective high school placement test. Our pack includes 66 tests, covering all areas of the exam, and has been proven to increase your child’s chances of getting into the school of their dreams.\n\nOur updated tests now match the latest exam standards, giving you the confidence to prepare your child for success. With Trinity Tuition College, your child will have access to the latest exam questions, enabling them to become familiar with the format and content of the test.We understand that preparing for the selective high school placement test can be stressful for both you and your child. Our all-in-one package has been designed to take the stress out of preparation by providing a structured and comprehensive approach to the exam.\n\nDon’t let your child miss out on their dream school. Sign up now for our Year 5 & 6 Selective Practice Tests pack, and give your child the competitive edge they need to succeed in their selective high school placement test.', '40points', '56points', '64points', 'Datainadequate', NULL, '2', 'Total score increased = (7 x 8) points = 56 points.\nScore of new student = (Current average score + Total score increased) = (X points + 56 points).', 15, NULL, 1),
(470, 'The average distance traveled by a group of 4 friends in a week increases by 20 miles when a new friend joins them. What might be the distance traveled by the new friend?', '20miles', '40miles', '60miles', 'Datainadequate', NULL, '2', 'Total distance increased = (4 x 20) miles = 80 miles.\nDistance traveled by new friend = (Current average distance + Total distance increased) = (X miles + 80 miles).', 15, NULL, 1),
(471, 'John had 8 toy cars. On Monday, he gave away 3 cars to his friends, on Tuesday he received 2 more cars as a gift, on Wednesday he lost 1 car, on Thursday he bought 5 cars, on Friday he sold 4 cars, and on Saturday he traded 2 cars for a toy truck. How many toy cars does John have now?', '8,', '9,', '10,', '11', NULL, '5', 'John\'s initial collection was 8 cars. After giving away 3 cars, he had 8 - 3 = 5 cars. After receiving 2 more cars, he had 5 + 2 = 7 cars. After losing 1 car, he had 7 - 1 = 6 cars. After buying 5 cars, he had 6 + 5 = 11 cars. After selling 4 cars, he had 11 - 4 = 7 cars. Finally, after trading 2 cars, he had 7 - 2 = 5 cars.', 15, NULL, 1),
(472, 'Lisa wants to save money to buy a new bike. On the first day, she saved $5, on the second day she saved $7, on the third day she saved $4, on the fourth day she saved $6, on the fifth day she saved $8, and on the last day she saved half of the money she saved on the first day. How much money did Lisa save in total?', '$19,', '$23,', '$27,', '$30', NULL, '5', 'Lisa saved $5 on the first day. On the last day, she saved half of this amount, which is $5 / 2 = $2.50. Adding all the amounts she saved, $5 + $7 + $4 + $6 + $8 + $2.50 = $32.50. So, Lisa saved a total of $32.50.', 15, NULL, 1),
(473, 'David has 10 red marbles and 14 blue marbles. If he gives away 3 red marbles and receives 6 blue marbles, how many marbles does he have now in total?', '17,', '19,', '21,', '23', NULL, '5', 'David initially had 10 red marbles and 14 blue marbles, totaling 10 + 14 = 24 marbles. After giving away 3 red marbles, he had 24 - 3 = 21 marbles. After receiving 6 blue marbles, he had 21 + 6 = 27 marbles in total.', 15, NULL, 1),
(474, 'Emma has 7 pens and 5 pencils. If she loses 2 pens and gains 3 pencils, how many writing instruments does she have in total?', '3,', '6,', '8,', '10', NULL, '5', 'Emma initially had 7 pens and 5 pencils, totaling 7 + 5 = 12 writing instruments. After losing 2 pens, she had 12 - 2 = 10 writing instruments. After gaining 3 pencils, she had 10 + 3 = 13 writing instruments in total.', 15, NULL, 1),
(475, 'Michael scored 70, 65, 75, 80, 90, and 85 on his math tests. What is his average score?', '72,', '75,', '77,', '80', NULL, '5', 'Adding all the scores, 70 + 65 + 75 + 80 + 90 + 85 = 445. Dividing this by 6 tests gives an average score of 445 / 6 = 74.1666. Rounded to the nearest whole number, Michael\'s average score is 77.', 15, NULL, 1),
(476, 'In a department of 50 employees, the average salary is $50,000. After one employee, who earns $35,000, resigns, what will be the new average salary of the department?', '$50,450,', '$49,650,', '$49,250,', '$48,750', NULL, '5', 'The total salary for the department is $50,000 * 50 = $2,500,000. After the employee with a salary of $35,000 resigns, the total salary becomes $2,500,000 - $35,000 = $2,465,000. The new average salary is thus $2,465,000 / (50 - 1) = $50,450.', 15, NULL, 1),
(477, 'In a bag of marbles, the average weight is 10 grams. If 5 marbles, each weighing 15 grams, are removed from the bag, what will be the new average weight of the marbles in the bag?', '7.5grams,', '8grams,', '8.5grams,', '9grams', NULL, '5', 'The total weight of the marbles in the bag is 10 grams * (number of marbles). After removing 5 marbles, the new total weight becomes 10 grams * (number of marbles - 5). The new average weight is thus (10 grams * (number of marbles - 5)) / (number of marbles - 5) = 10 grams.', 15, NULL, 1),
(478, 'In a restaurant, the average tip amount per bill is $5. After a customer leaves a $10 tip, what will be the new average tip amount per bill?', '$5.50,', '$6,', '$6.50,', '$7', NULL, '5', 'The total tip amount is $5 * (number of bills). After a customer leaves a $10 tip, the new total tip amount becomes $5 * (number of bills) + $10. The new average tip amount is thus ($5 * (number of bills) + $10) / (number of bills) = $5.50.', 15, NULL, 1),
(479, 'In a sports team, the average height is 6 feet. After a player, who is 6 feet 5 inches tall, leaves the team, what will be the new average height of the players?', '5feet11inches,', '6feet,', '6feet1inch,', '6feet3inches', NULL, '5', 'The total height of the players is 6 feet * (number of players). After a player who is 6 feet 5 inches tall leaves the team, the new total height becomes 6 feet * (number of players - 1). The new average height is thus (6 feet * (number of players - 1)) / (number of players - 1) = 5 feet 11 inches.', 15, NULL, 1),
(480, 'In a store, the average price of a shirt is $25. After one shirt, which is on sale for $10, is sold, what will be the new average price of the shirts in the store?', '$23,', '$24,', '$25,', '$26', NULL, '5', 'The total price of the shirts in the store is $25 * (number of shirts). After a shirt on sale for $10 is sold, the new total price becomes $25 * (number of shirts) - $10. The new average price is thus ($25 * (number of shirts) - $10) / (number of shirts) = $24.', 15, NULL, 1),
(481, 'The average age of three friends 4 years ago was 25 years and that of two friends 6 years ago was 20 years. The present age of the third friend is:', '26years', '28years', '30years', 'Noneofthese', NULL, '2', 'Sum of the present ages of the three friends = (25 x 3 + 4 x 3) years = 87 years.\n\nSum of the present ages of the two friends = (20 x 2 + 6 x 2) years = 52 years.\n\nThird friend\'s present age = (87 - 52) years = 35 years.', 15, NULL, 1),
(482, 'The average height of a group of people 2 years ago was 160 cm and that of a subgroup 4 years ago was 150 cm. The present height of the tallest person in the group is:', '170cm', '180cm', '190cm', 'Noneofthese', NULL, '2', 'Sum of the present heights of the group = (160 x n + 2 x n) cm = (162n) cm.\n\nSum of the present heights of the subgroup = (150 x m + 4 x m) cm = (154m) cm.\n\nTallest person\'s present height in the group = (162n - 154m) cm.\n\nAs we do not have any specific values for \'n\' and \'m\', we cannot determine the exact height. Therefore, the answer is None of these.', 15, NULL, 1),
(483, 'The average salary of three employees 2 years ago was $40,000 and that of two employees 5 years ago was $35,000. The present salary of the third employee is:', '$45,000', '$50,000', '$55,000', 'Noneofthese', NULL, '1', 'Sum of the present salaries of the three employees = ($40,000 x 3 + $2,000 x 3) = $126,000.\n\nSum of the present salaries of the two employees = ($35,000 x 2 + $5,000 x 2) = $80,000.\n\nThird employee\'s present salary = ($126,000 - $80,000) = $46,000.', 15, NULL, 1),
(484, 'The average weight of a group of people 5 years ago was 80 kg and that of a subgroup 3 years ago was 70 kg. The present weight of the heaviest person in the group is:', '85kg', '90kg', '95kg', 'Noneofthese', NULL, '2', 'Sum of the present weights of the group = (80 kg x n + 5 kg x n) = (85n) kg.\n\nSum of the present weights of the subgroup = (70 kg x m + 3 kg x m) = (73m) kg.\n\nHeaviest person\'s present weight in the group = (85n - 73m) kg.\n\nAs we do not have any specific values for \'n\' and \'m\', we cannot determine the exact weight. Therefore, the answer is None of these.', 15, NULL, 1),
(485, 'The average age of a group of students 4 years ago was 20 years and that of a subgroup 6 years ago was 18 years. The present age of the oldest student in the group is:', '22years', '24years', '26years', 'Noneofthese', NULL, '1', 'Sum of the present ages of the group = (20 years x n + 4 years x n) = (24n) years.\n\nSum of the present ages of the subgroup = (18 years x m + 6 years x m) = (24m) years.\n\nOldest student\'s present age in the group = (24n - 24m) years.\n\nAs we do not have any specific values for \'n\' and \'m\', we cannot determine the exact age. Therefore, the answer is None of these.', 15, NULL, 1),
(486, 'The average score of a student in two tests is 80. If the average score in the first test is 75 and in the second test is 85, what is the score of the student in the second test?', '75', '80', '85', '90', NULL, '2', 'Let the scores in the first and second tests be A and B respectively. \nWe have the following equations:\nA + B = (80 x 2) = 160\nA = 75\nSubstituting the value of A in the equation, we get B = 85.\nThe score of the student in the second test is 85.', 15, NULL, 1),
(487, 'The average age of a group of five friends is 20 years. If the average age of the first three friends is 18 years and that of the last three friends is 23 years, what is the age of the fourth friend?', '16years', '18years', '20years', '22years', NULL, '2', 'Let the ages of the first, second, third, fourth, and fifth friend be A, B, C, D, and E respectively. \nWe have the following equations:\nA + B + C + D + E = (20 x 5) = 100\n(A + B + C) = (18 x 3) = 54\n(C + D + E) = (23 x 3) = 69\nSubstituting the values of (A + B + C) and (C + D + E) in the first equation, we get D = 22.\nThe age of the fourth friend is 22 years.', 15, NULL, 1),
(488, 'The average salary of a group of employees is $50,000. If the average salary of the male employees is $55,000 and that of the female employees is $45,000, what is the ratio of male employees to female employees in the group?', '1:1', '2:1', '1:2', '3:2', NULL, '2', 'Let the number of male employees be M and the number of female employees be F. \nWe have the following equations:\n(M + F) = (50,000 x N) = 50,000N\n(M) = (55,000 x X) = 55,000X\n(F) = (45,000 x Y) = 45,000Y\nSubstituting the values of (M) and (F) in the first equation, we get (55,000X + 45,000Y) = 50,000N.\nThe ratio of male employees to female employees is 2:1.', 15, NULL, 1),
(489, 'The average height of a group of students is 160 cm. If the average height of the boys in the group is 165 cm and that of the girls is 155 cm, what is the ratio of boys to girls in the group?', '1:1', '2:1', '1:2', '3:2', NULL, '2', 'Let the number of boys be B and the number of girls be G. \nWe have the following equations:\n(B + G) = (160 x N) = 160N\n(B) = (165 x X) = 165X\n(G) = (155 x Y) = 155Y\nSubstituting the values of (B) and (G) in the first equation, we get (165X + 155Y) = 160N.\nThe ratio of boys to girls is 3:2.', 15, NULL, 1),
(490, 'The average age of a family of four members is 30 years. If the average age of the father and mother is 35 years and that of the two children is 25 years, what is the age of the father?', '30years', '32years', '35years', '40years', NULL, '2', 'Let the age of the father, mother, first child, and second child be A, B, C, and D respectively. \nWe have the following equations:\n(A + B + C + D) = (30 x 4) = 120\n(A + B) = (35 x 2) = 70\n(C + D) = (25 x 2) = 50\nSubstituting the values of (A + B) and (C + D) in the first equation, we get (70 + 50) = (A + B + C + D) = 120.\nThe age of the father is 40 years.', 15, NULL, 1),
(491, 'The average age of a group of 20 students is 15.5 years. If the average age of the first 10 students is 14.5 years, what is the average age of the remaining 10 students?', '15.5years', '16.5years', '17.5years', '18.5years', NULL, '2', 'Let\'s denote:\nA as the average age of all the students in the group\nB as the number of students in the group (20)\nC as the average age of the first 10 students (14.5 years)\nD as the average age of the remaining 10 students\n\nWe know that the total age of all students is equal to the sum of the total ages of the first 10 students and the remaining 10 students. Therefore, we can write:\n\nB * A = 10 * C + 10 * D\n\nSubstituting the known values into this equation, we get:\n\n20 * 15.5 = 10 * 14.5 + 10 * D\n310 = 145 + 10D\n10D = 165\nD = 16.5 years\n\nTherefore, the average age of the remaining 10 students is 16.5 years.', 15, NULL, 1),
(492, 'The average salary of 25 employees in a company is $45,000 per year. If the average salary of the first 10 employees is $40,000 per year, what is the average salary of the remaining 15 employees?', '$50,000peryear', '$45,000peryear', '$55,000peryear', '$60,000peryear', NULL, '2', 'Let\'s denote:\nA as the average salary of all the employees in the company\nB as the number of employees in the company (25)\nC as the average salary of the first 10 employees ($40,000 per year)\nD as the average salary of the remaining 15 employees\n\nWe know that the total salary of all employees is equal to the sum of the total salaries of the first 10 employees and the remaining 15 employees. Therefore, we can write:\n\nB * A = 10 * C + 15 * D\n\nSubstituting the known values into this equation, we get:\n\n25 * 45,000 = 10 * 40,000 + 15 * D\n1,125,000 = 400,000 + 15D\n15D = 725,000\nD = $48,333.33 per year (rounded to the nearest cent)\n\nTherefore, the average salary of the remaining 15 employees is approximately $48,333.33 per year.', 15, NULL, 1),
(493, 'The average height of 15 students in a class is 160 cm and that of the remaining 5 students is 170 cm. Find the average heights of all the students in the class.', '165cm', '164cm', '163cm', '162cm', NULL, '2', 'Let\'s denote:\nA as the average height of all the students in the class\nB as the number of students in the class (15 + 5 = 20)\nC as the average height of the 15 students (160 cm)\nD as the average height of the remaining 5 students (170 cm)\n\nWe know that the total height of all students is equal to the sum of the total heights of the 15 students and the 5 students. Therefore, we can write:\n\nB * A = 15 * C + 5 * D\n\nSubstituting the known values into this equation, we get:\n\n20 * A = 15 * 160 + 5 * 170\n20 * A = 2400 + 850\n20 * A = 3250\n\nSolving for A, we get:\n\nA = 3250 / 20\nA = 162.5 cm\n\nTherefore, the average height of all the students in the class is approximately 162.5 cm.', 15, NULL, 1);
INSERT INTO `verbal_question` (`id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `option_5`, `correct_option`, `explanation`, `tst_id`, `marks`, `status`) VALUES
(494, 'The average score of a class of 30 students in a math test is 80. If the average score of the first 15 students is 75, what is the average score of the remaining 15 students?', '80', '85', '90', '95', NULL, '2', 'Let\'s denote:\nA as the average score of all the students in the class\nB as the number of students in the class (30)\nC as the average score of the first 15 students (75)\nD as the average score of the remaining 15 students\n\nWe know that the total score of all students is equal to the sum of the total scores of the first 15 students and the remaining 15 students. Therefore, we can write:\n\nB * A = 15 * C + 15 * D\n\nSubstituting the known values into this equation, we get:\n\n30 * 80 = 15 * 75 + 15 * D\n2400 = 1125 + 15D\n15D = 1275\nD = 85\n\nTherefore, the average score of the remaining 15 students is 85.', 15, NULL, 1),
(495, 'The average speed of a car on a 200 km journey is 60 km/hr. If the average speed for the first 100 km is 50 km/hr, what is the average speed for the remaining 100 km?', '70km/hr', '80km/hr', '90km/hr', '100km/hr', NULL, '2', 'Let\'s denote:\nA as the average speed of the car on the remaining 100 km\nB as the average speed of the car on the first 100 km (50 km/hr)\nC as the average speed of the car on the entire 200 km journey (60 km/hr)\n\nWe know that the time taken for the entire journey is equal to the sum of the times taken for the first 100 km and the remaining 100 km. Therefore, we can write:\n\nDistance = Speed * Time\n\n100 km = 50 km/hr * Time + 100 km/hr * Time\n\nSimplifying, we get:\n\n100 km = 150 km/hr * Time\nTime = 2/3 hr\n\nTherefore, the average speed for the remaining 100 km is:\n\nA = 100 km / (2/3 hr) = 150 km/hr\n\nTherefore, the average speed for the remaining 100 km is 150 km/hr.', 15, NULL, 1),
(496, 'What is the average height of all the basketball players?', '6feet,', '6.1feet,', '6.2feet,', '6.3feet', NULL, '5', 'The total height of the first group is 10 players * 6 feet = 60 feet. The total height of the second group is 15 players * 6.3 feet = 94.5 feet. The combined height is 60 feet + 94.5 feet = 154.5 feet. Since there are 25 players in total, the average height is 154.5 feet / 25 players = 6.18 feet, which rounds to 6.2 feet.', 15, NULL, 1),
(497, 'What is the average age of all the employees?', '35years,', '36years,', '37years,', '38years', NULL, '5', 'The total age of the first group is 8 employees * 32 years = 256 years. The total age of the second group is 12 employees * 34 years = 408 years. The combined age is 256 years + 408 years = 664 years. Since there are 20 employees in total, the average age is 664 years / 20 employees = 33.2 years, which rounds to 35 years.', 15, NULL, 1),
(498, 'What is the average weight of all the cats?', '8pounds,', '8.5pounds,', '9pounds,', '9.5pounds', NULL, '5', 'The total weight of the first group is 15 cats * 8 pounds = 120 pounds. The total weight of the second group is 10 cats * 9 pounds = 90 pounds. The combined weight is 120 pounds + 90 pounds = 210 pounds. Since there are 25 cats in total, the average weight is 210 pounds / 25 cats = 8.4 pounds, which rounds to 8.5 pounds.', 15, NULL, 1),
(499, 'What is the average score of all the students in Math?', '75,', '76,', '77,', '78', NULL, '5', 'The total score of the first group in Math is 20 students * 72 = 1440. The total score of the second group in Math is 10 students * 82 = 820. The combined score in Math is 1440 + 820 = 2260. Since there are 30 students in total, the average score in Math is 2260 / 30 = 75.33, which rounds to 78.', 15, NULL, 1),
(500, 'What is the average distance traveled by all the cars?', '25miles,', '30miles,', '35miles,', '40miles', NULL, '5', 'The total distance traveled by the first group of cars is 15 cars * 32 miles = 480 miles. The total distance traveled by the second group of cars is 20 cars * 40 miles = 800 miles. The combined distance traveled by all the cars is 480 miles + 800 miles = 1280 miles. Since there are 35 cars in total, the average distance traveled by each car is 1280 miles / 35 cars = 36.57 miles, which rounds to 35 miles.', 15, NULL, 1),
(501, 'If the average height of three groups of 20, 25, and 30 individuals respectively is 150cm, 155cm, and 160cm, then what is the average height of all the individuals?', '153cm', '155.3cm', '158cm', '159.6cm', NULL, '2', 'Using the same formula as in the example, we can calculate the average height of all the individuals:\nTotal individuals = 20 + 25 + 30 = 75\nTotal height = 150 * 20 + 155 * 25 + 160 * 30 = 3000 + 3875 + 4800 = 11675\nAverage height = Total height / Total individuals = 11675 / 75 = 155.3cm', 15, NULL, 1),
(502, 'If the average age of three groups of 10, 12, and 15 people respectively is 25 years, 30 years, and 35 years, then what is the average age of all the people?', '28years', '30.8years', '31.5years', '33.2years', NULL, '2', 'Using the same formula as in the example, we can calculate the average age of all the people:\nTotal people = 10 + 12 + 15 = 37\nTotal age = 25 * 10 + 30 * 12 + 35 * 15 = 250 + 360 + 525 = 1135\nAverage age = Total age / Total people = 1135 / 37 = 30.8 years', 15, NULL, 1),
(503, 'If the average salary of three departments with 50, 60, and 70 employees respectively is $5000, $5500, and $6000, then what is the average salary of all the employees?', '$5400', '$5480', '$5550', '$5714', NULL, '2', 'Using the same formula as in the example, we can calculate the average salary of all the employees:\nTotal employees = 50 + 60 + 70 = 180\nTotal salary = $5000 * 50 + $5500 * 60 + $6000 * 70 = $250000 + $330000 + $420000 = $1000000\nAverage salary = Total salary / Total employees = $1000000 / 180 ≈ $5714', 15, NULL, 1),
(504, 'If the average weight of three groups of 5, 7, and 10 animals respectively is 20kg, 25kg, and 30kg, then what is the average weight of all the animals?', '22kg', '24.5kg', '27kg', '30.5kg', NULL, '2', 'Using the same formula as in the example, we can calculate the average weight of all the animals:\nTotal animals = 5 + 7 + 10 = 22\nTotal weight = 20kg * 5 + 25kg * 7 + 30kg * 10 = 100kg + 175kg + 300kg = 575kg\nAverage weight = Total weight / Total animals = 575kg / 22 ≈ 24.5kg', 15, NULL, 1),
(505, 'If the average speed of three cars traveling a distance of 100km, 150km, and 200km respectively is 50km/h, 60km/h, and 70km/h, then what is the average speed of all the cars?', '57.5km/h', '61km/h', '65km/h', '69.5km/h', NULL, '2', 'Using the same formula as in the example, we can calculate the average speed of all the cars:\nTotal distance = 100km + 150km + 200km = 450km\nTotal time = 100km / 50km/h + 150km / 60km/h + 200km / 70km/h = 2 hours + 2.5 hours + 2.86 hours ≈ 7.36 hours\nAverage speed = Total distance / Total time = 450km / 7.36 hours ≈ 61km/h', 15, NULL, 1),
(506, 'A student\'s height was measured as 150 cm instead of 160 cm. Due to that, the average height for the class increased by 3 cm. The number of students in the class is:', '15,', '20,', '25,', '30', NULL, '2', 'The average height was increased by 3 cm because of the 10 cm difference (160 - 150). This means that the total number of students is equal to the amount that the extra height would be distributed among to cause an increase of 3 cm per student. Therefore, the number of students in the class would be 10 / (3/1) = 30.', 15, NULL, 1),
(507, 'A team\'s total goals were recorded as 50 instead of 40. Due to that, the average number of goals per game for the team increased by 0.5. The number of games played by the team is:', '20,', '25,', '30,', '35', NULL, '2', 'The average number of goals per game was increased by 0.5 because of the 10 extra goals (50 - 40). This means that the total number of games played by the team is equal to the amount that the extra goals would be distributed among to cause an increase of 0.5 per game. Therefore, the number of games played by the team is 10 / (0.5/1) = 20.', 15, NULL, 1),
(508, 'A car\'s mileage was recorded as 20 mpg instead of 30 mpg. Due to that, the average fuel efficiency for the fleet increased by 5 mpg (miles per gallon). The number of cars in the fleet is:', '10,', '15,', '20,', '25', NULL, '2', 'The average fuel efficiency was increased by 5 mpg because of the 10 mpg difference (30 - 20). This means that the total number of cars in the fleet is equal to the amount that the extra mileage would be distributed among to cause an increase of 5 mpg per car. Therefore, the number of cars in the fleet is 10 / (5/1) = 20.', 15, NULL, 1),
(509, 'A company\'s revenue was recorded as $60,000 instead of $50,000. Due to that, the average revenue per employee increased by $2,000. The number of employees in the company is:', '20,', '25,', '30,', '35', NULL, '2', 'The average revenue per employee was increased by $2,000 because of the $10,000 difference ($60,000 - $50,000). This means that the total number of employees in the company is equal to the amount that the extra revenue would be distributed among to cause an increase of $2,000 per employee. Therefore, the number of employees in the company is $10,000 / ($2,000/1) = 5.', 15, NULL, 1),
(510, 'A store\'s inventory was recorded as 300 units instead of 250 units. Due to that, the average quantity sold per day increased by 2 units. The number of days in that period is:', '20,', '25,', '30,', '35', NULL, '2', 'The average quantity sold per day was increased by 2 units because of the 50 units difference (300 - 250). This means that the total number of days in that period is equal to the amount that the extra quantity would be distributed among to cause an increase of 2 units per day. Therefore, the number of days in that period is 50 / (2/1) = 25.', 15, NULL, 1),
(511, 'The average height of a group of basketball players is 6 feet. If the height of one player is mistakenly recorded as 7 feet instead of 6 feet, what is the correct average height?', '5feet', '6feet', '7feet', '8feet', NULL, '2', 'Solution: Let the total height of the group be X. According to the given condition, (X + 7) / n = 6, where n is the number of basketball players in the group. If we subtract 7 from the numerator, we have X / n = 6 - 7/n. Since the numerator should be divisible by n for the average to be a whole number, X should be divisible by n. Therefore, the correct average height would still be 6 feet. So, the correct answer is b) 6 feet.', 15, NULL, 1),
(512, 'The average score of a group of students is 80%. If the score of one student is mistakenly recorded as 90% instead of 70%, what is the correct average score?', '70%', '75%', '80%', '85%', NULL, '2', 'Solution: Let the total score of the group be X. According to the given condition, (X + 90) / n = 80, where n is the number of students in the group. If we subtract 90 from the numerator, we have X / n = 80 - 90/n. Since the numerator should be divisible by n for the average to be a whole number, X should be divisible by n. Therefore, the correct average score would still be 80%. So, the correct answer is c) 80%.', 15, NULL, 1),
(513, 'The average speed of a group of runners is 10 km/h. If the speed of one runner is mistakenly recorded as 12 km/h instead of 8 km/h, what is the correct average speed?', '8km/h', '9km/h', '10km/h', '11km/h', NULL, '2', 'Solution: Let the total distance covered by the group be X. According to the given condition, (X + 12) / n = 10, where n is the number of runners in the group. If we subtract 12 from the numerator, we have X / n = 10 - 12/n. Since the numerator should be divisible by n for the average to be a whole number, X should be divisible by n. Therefore, the correct average speed would still be 10 km/h. So, the correct answer is c) 10 km/h.', 15, NULL, 1),
(514, 'The average price of a group of products is $50. If the price of one product is mistakenly recorded as $60 instead of $40, what is the correct average price?', '$40', '$45', '$50', '$55', NULL, '2', 'Solution: Let the total cost of the products be X. According to the given condition, (X + 60) / n = 50, where n is the number of products in the group. If we subtract 60 from the numerator, we have X / n = 50 - 60/n. Since the numerator should be divisible by n for the average to be a whole number, X should be divisible by n. Therefore, the correct average price would still be $50. So, the correct answer is c) $50.', 15, NULL, 1),
(515, 'The average distance traveled by a group of cars is 200 miles. If the distance traveled by one car is mistakenly recorded as 220 miles instead of 180 miles, what is the correct average distance?', '170miles', '180miles', '190miles', '200miles', NULL, '2', 'Solution: Let the total distance traveled by the cars be X. According to the given condition, (X + 220) / n = 200, where n is the number of cars in the group. If we subtract 220 from the numerator, we have X / n = 200 - 220/n. Since the numerator should be divisible by n for the average to be a whole number, X should be divisible by n. Therefore, the correct average distance would still be 200 miles. So, the correct answer is d) 200 miles.', 15, NULL, 1),
(516, 'The average age of a group of students is 20 years. If the average age of male students is 25 years and the average age of female students is 18 years, what is the ratio of male to female students in the group?', '1:1', '2:1', '3:1', '4:1', NULL, '2', 'Let the number of male students in the group be M and the number of female students be F.\n\nAccording to the given condition, (25M + 18F) / (M + F) = 20.\n\nIf we simplify the equation, we get 25M + 18F = 20M + 20F.\n\nRearranging the terms, we have 5M = 2F, which simplifies to M = 2F.\n\nTherefore, the ratio of male to female students in the group is 2:1.\n\nSo, the correct answer is b) 2:1.', 15, NULL, 1),
(517, 'The average price of a group of products is $100. If the average price of product A is $120 and the average price of product B is $80, what is the ratio of product A to product B in the group?', '1:1', '2:1', '3:1', '4:1', NULL, '2', 'Let the number of product A in the group be A and the number of product B be B.\n\nAccording to the given condition, (120A + 80B) / (A + B) = 100.\n\nIf we simplify the equation, we get 120A + 80B = 100A + 100B.\n\nRearranging the terms, we have 20A = 20B, which simplifies to A = B.\n\nTherefore, the ratio of product A to product B in the group is 1:1.\n\nSo, the correct answer is a) 1:1.', 15, NULL, 1),
(518, 'The average height of a group of people is 170 cm. If the average height of men is 180 cm and the average height of women is 160 cm, what is the ratio of men to women in the group?', '1:1', '2:1', '3:1', '4:1', NULL, '2', 'Let the number of men in the group be M and the number of women be W.\n\nAccording to the given condition, (180M + 160W) / (M + W) = 170.\n\nIf we simplify the equation, we get 180M + 160W = 170M + 170W.\n\nRearranging the terms, we have 10M = 10W, which simplifies to M = W.\n\nTherefore, the ratio of men to women in the group is 1:1.\n\nSo, the correct answer is a) 1:1.', 15, NULL, 1),
(519, 'The average rainfall in a group of cities is 50 inches. If the average rainfall in city A is 60 inches and the average rainfall in city B is 40 inches, what is the ratio of rainfall in city A to city B in the group?', '1:1', '2:1', '3:1', '4:1', NULL, '2', 'Let the number of cities with rainfall A in the group be A and the number of cities with rainfall B be B.\n\nAccording to the given condition, (60A + 40B) / (A + B) = 50.\n\nIf we simplify the equation, we get 60A + 40B = 50A + 50B.\n\nRearranging the terms, we have 10A = 10B, which simplifies to A = B.\n\nTherefore, the ratio of rainfall in city A to city B in the group is 1:1.\n\nSo, the correct answer is a) 1:1.', 15, NULL, 1),
(520, 'The average score of a group of students is 80. If the average score of boys is 90 and the average score of girls is 70, what is the ratio of boys to girls in the group?', '1:1', '2:1', '3:1', '4:1', NULL, '2', 'Let the number of boys in the group be B and the number of girls be G.\n\nAccording to the given condition, (90B + 70G) / (B + G) = 80.\n\nIf we simplify the equation, we get 90B + 70G = 80B + 80G.\n\nRearranging the terms, we have 10B = 10G, which simplifies to B = G.\n\nTherefore, the ratio of boys to girls in the group is 1:1.\n\nSo, the correct answer is a) 1:1.', 15, NULL, 1),
(521, 'The average distance traveled by a group of 20 cyclists is 50 km. If the distance traveled by the fastest 3 cyclists is 80 km each, what is the average distance traveled by the remaining cyclists?', '45km', '47km', '49km', '52km', NULL, '2', 'Solution: The total distance traveled by the fastest 3 cyclists is 3 * 80 = 240 km. The total distance traveled by the remaining 17 cyclists is (20 * 50) - 240 = 1000 - 240 = 760 km. The average distance traveled by the remaining 17 cyclists is 760 / 17 ≈ 47 km.', 15, NULL, 1),
(522, 'The average age of a group of 25 people is 35 years. If the age of the oldest 4 people is 50 years each, what is the average age of the remaining people?', '32years', '33years', '34years', '36years', NULL, '2', 'Solution: The total age of the oldest 4 people is 4 * 50 = 200 years. The total age of the remaining 21 people is (25 * 35) - 200 = 875 - 200 = 675 years. The average age of the remaining 21 people is 675 / 21 ≈ 36 years.', 15, NULL, 1),
(523, 'The average number of books read by a group of 15 students is 8. If the number of books read by the top 2 students is 12 each, what is the average number of books read by the remaining students?', '6', '6.5', '7', '7.5', NULL, '2', 'Solution: The total number of books read by the top 2 students is 2 * 12 = 24. The total number of books read by the remaining 13 students is (15 * 8) - 24 = 120 - 24 = 96. The average number of books read by the remaining 13 students is 96 / 13 ≈ 7.', 15, NULL, 1),
(524, 'The average height of a group of 40 basketball players is 180 cm. If the height of the tallest 10 players is 200 cm each, what is the average height of the remaining players?', '172cm', '174cm', '176cm', '178cm', NULL, '1', 'Solution: The total height of the tallest 10 players is 10 * 200 = 2000 cm. The total height of the remaining 30 players is (40 * 180) - 2000 = 7200 - 2000 = 5200 cm. The average height of the remaining 30 players is 5200 / 30 ≈ 172 cm.', 15, NULL, 1),
(525, 'The average temperature of a group of 50 cities is 25 degrees Celsius. If the temperature of the hottest 7 cities is 30 degrees Celsius each, what is the average temperature of the remaining cities?', '23degreesCelsius', '23.5degreesCelsius', '24degreesCelsius', '24.5degreesCelsius', NULL, '2', 'Solution: The total temperature of the hottest 7 cities is 7 * 30 = 210 degrees Celsius. The total temperature of the remaining 43 cities is (50 * 25) - 210 = 1250 - 210 = 1040 degrees Celsius. The average temperature of the remaining 43 cities is 1040 / 43 ≈ 24 degrees Celsius.', 15, NULL, 1),
(526, 'Two quantities have a 4:7 ratio. If 5 is subtracted from each quantity, the new ratio becomes 9:16. What is the smaller quantity?', '10', '15', '20', '25', NULL, '2', 'Let the quantities be 4x and 7x. \nAccording to the given condition, 4x - 5 = 9 and 7x - 5 = 16. \nSolving these equations, we get x = 7. \nSo, the smaller quantity is 4x = (4 * 7) = 28.', 16, NULL, 1),
(527, 'The ratio between two numbers is 5:9. If 3 is added to each number, the new ratio becomes 8:12. What is the smaller number?', '12', '15', '18', '21', NULL, '1', 'Let the numbers be 5x and 9x. \nAccording to the given condition, 5x + 3 = 8 and 9x + 3 = 12. \nSolving these equations, we get x = 1. \nSo, the smaller number is 5x = (5 * 1) = 5.', 16, NULL, 1),
(528, 'The length and breadth of a rectangle are in the ratio of 7:9. If the length is increased by 6 and the breadth is increased by 4, the new ratio becomes 8:11. What is the original length of the rectangle?', '12', '14', '16', '18', NULL, '2', 'Let the original length and breadth be 7x and 9x. \nAccording to the given condition, (7x + 6)/(9x + 4) = 8/11. \nSolving this equation, we get x = 2. \nSo, the original length of the rectangle is 7x = (7 * 2) = 14.', 16, NULL, 1),
(529, 'The ages of two friends are in the ratio of 3:5. If one friend is 15 years older than the other, what is the age of the younger friend?', '12', '15', '18', '21', NULL, '1', 'Let the ages of the two friends be 3x and 5x. \nAccording to the given condition, 5x - 3x = 15. \nSolving this equation, we get x = 5. \nSo, the age of the younger friend is 3x = (3 * 5) = 15.', 16, NULL, 1),
(530, 'The ratio between the first and second class students in a school is 2:5. If the number of first-class students is increased by 10 and the number of second-class students is increased by 15, the new ratio becomes 5:9. What is the original number of second-class students?', '20', '25', '30', '35', NULL, '2', 'Let the original number of first-class and second-class students be 2x and 5x. \nAccording to the given condition, (2x + 10)/(5x + 15) = 5/9. \nSolving this equation, we get x = 3. \nSo, the original number of second-class students is 5x = (5 * 3) = 15.', 16, NULL, 1),
(531, 'If 30% of a number is equal to three-fourth of another number, what is the ratio of first number to the second number?', '3 : 4', '4 : 3', '5 : 8', '8 : 5', NULL, '1', 'Let 30% of A = 3B/4.\nThen, 30A/100 = 3B/4.\n30A = 75B/4.\nA = (75B/4) * (100/30).\nA = (25B/4) * 10.\nA = 2.5B * 10.\nA = 25B/4.\nA : B = 25 : 4.', 16, NULL, 1),
(532, 'If 20% of a number is equal to one-fifth of another number, what is the ratio of first number to the second number?', '2 : 5', '5 : 2', '10 : 3', '3 : 10', NULL, '1', 'Let 20% of A = B/5.\nThen, 20A/100 = B/5.\n20A = B/5 * 100.\n20A = B/5 * 20 * 5.\n20A = B.\nA : B = 1 : 1.', 16, NULL, 1),
(533, 'If 15% of a number is equal to one-fourth of another number, what is the ratio of first number to the second number?', '3 : 10', '10 : 3', '3 : 4', '4 : 3', NULL, '2', 'Let 15% of A = B/4.\nThen, 15A/100 = B/4.\n15A = B/4 * 100.\nA = (B/4) * (100/15).\nA = (B/4) * (20/3).\nA = (B/4) * (10/3) * 2.\nA = (B/4) * (20/3) * 1/2.\nA = (B/3) * (10/2).\nA : B = 10 : 3.', 16, NULL, 1),
(534, 'If 25% of a number is equal to one-sixth of another number, what is the ratio of first number to the second number?', '3 : 2', '3 : 1', '2 : 3', '1 : 3', NULL, '2', 'Let 25% of A = B/6.\nThen, 25A/100 = B/6.\n25A = B/6 * 100.\nA = (B/6) * (100/25).\nA = (B/6) * (4/1).\nA = (B/6) * (2/1) * (2/2).\nA = (B/3) * (2/2).\nA : B = 1 : 3.', 16, NULL, 1),
(535, 'If 35% of a number is equal to half of another number, what is the ratio of first number to the second number?', '2 : 7', '4 : 5', '7 : 2', '5 : 4', NULL, '2', 'Let 35% of A = B/2.\nThen, 35A/100 = B/2.\n35A = B/2 * 100.\nA = (B/2) * (100/35).\nA = (B/2) * (20/7).\nA = (B/2) * (10/7) * (2/2).\nA = (B/7) * (10/2).\nA : B = 10 : 7.', 16, NULL, 1),
(536, 'There are a certain number of apples in a basket and the basket only contains red, green, and yellow apples. The number of red apples is three times the number of green apples. Green apples outnumber yellow apples by a factor of one-fifth.If there are 80 apples in total, how many red apples are there?', '60', '40', '30', '20', NULL, '1', 'Number of red apples = 3/4 x 80 = 60\nNumber of green apples = 1/4 x 80 = 20\nNumber of yellow apples = 1/5 x 20 = 4\nTherefore, the number of red apples is 60.', 16, NULL, 1),
(537, 'There are a certain number of students in a class and the class only contains boys and girls. The number of boys is four times the number of girls. The number of girls is one-third the number of students. If there are 120 students in total, how many boys are there?', '80', '40', '60', '30', NULL, '1', 'Number of girls = 1/4 x 120 = 30\nNumber of boys = 4 x 30 = 120\nTherefore, the number of boys is 80.', 16, NULL, 1),
(538, 'There are a certain number of marbles in a bag and the bag only contains blue, red, and yellow marbles. The number of blue marbles is twice the number of red marbles. Red marbles outnumber yellow marbles by a factor of one-third. If there are 45 marbles in total, how many blue marbles are there?', '30', '20', '10', '15', NULL, '1', 'Number of blue marbles = 2/3 x 45 = 30\nNumber of red marbles = 1/3 x 45 = 15\nNumber of yellow marbles = 1/4 x 15 = 3\nTherefore, the number of blue marbles is 30.', 16, NULL, 1),
(539, 'There are a certain number of books on a shelf and the shelf only contains fiction, non-fiction, and mystery books. The number of fiction books is three times the number of non-fiction books. Non-fiction books outnumber mystery books by a factor of one-sixth. If there are 120 books in total, how many fiction books are there?', '90', '60', '30', '20', NULL, '1', 'Number of fiction books = 3/4 x 120 = 90\nNumber of non-fiction books = 1/4 x 120 = 30\nNumber of mystery books = 1/6 x 30 = 5\nTherefore, the number of fiction books is 90.', 16, NULL, 1),
(540, 'There are a certain number of donuts in a box and the box only contains glazed, chocolate, and strawberry donuts. The number of glazed donuts is half the number of chocolate donuts. Chocolate donuts outnumber strawberry donuts by a factor of one-seventh. If there are 84 donuts in total, how many glazed donuts are there?', '21', '14', '28', '42', NULL, '1', 'Number of glazed donuts = 1/3 x 84 = 28\nNumber of chocolate donuts = 2/3 x 84 = 56\nNumber of strawberry donuts = 1/7 x 56 = 8\nTherefore, the number of glazed donuts is 21.', 16, NULL, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_email_unique` (`email`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cart_tsp_id_index` (`tsp_id`),
  ADD KEY `cart_user_id_index` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `non_verbal_question`
--
ALTER TABLE `non_verbal_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `non_verbal_question_tst_id_index` (`tst_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `reading_question`
--
ALTER TABLE `reading_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_question_tst_id_index` (`tst_id`);

--
-- Indexes for table `test_series`
--
ALTER TABLE `test_series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_series_categories`
--
ALTER TABLE `test_series_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `test_series_product`
--
ALTER TABLE `test_series_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_series_product_ts_id_index` (`ts_id`);

--
-- Indexes for table `test_series_purchases`
--
ALTER TABLE `test_series_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_series_purchases_tsp_id_index` (`tsp_id`),
  ADD KEY `test_series_purchases_user_id_index` (`user_id`);

--
-- Indexes for table `test_series_topics`
--
ALTER TABLE `test_series_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `test_series_topics_tsc_id_index` (`tsc_id`);

--
-- Indexes for table `test_status`
--
ALTER TABLE `test_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tspc_set`
--
ALTER TABLE `tspc_set`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tspc_set_tspc_id_index` (`tspc_id`);

--
-- Indexes for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ts_pc_topics_tspcs_id_index` (`tspcs_id`),
  ADD KEY `ts_pc_topics_tst_id_index` (`tst_id`);

--
-- Indexes for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ts_product_category_tsp_id_index` (`tsp_id`),
  ADD KEY `ts_product_category_tsc_id_index` (`tsc_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_phone_unique` (`phone`);

--
-- Indexes for table `user_test_series`
--
ALTER TABLE `user_test_series`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_test_series_tsps_id_index` (`tsps_id`),
  ADD KEY `user_test_series_user_id_index` (`user_id`);

--
-- Indexes for table `user_test_status`
--
ALTER TABLE `user_test_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_test_status_q_id_foreign` (`q_id`),
  ADD KEY `user_test_status_status_id_index` (`status_id`),
  ADD KEY `user_test_status_uts_id_index` (`uts_id`);

--
-- Indexes for table `verbal_question`
--
ALTER TABLE `verbal_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `verbal_question_tst_id_index` (`tst_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT for table `non_verbal_question`
--
ALTER TABLE `non_verbal_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reading_question`
--
ALTER TABLE `reading_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_series`
--
ALTER TABLE `test_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `test_series_categories`
--
ALTER TABLE `test_series_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_series_product`
--
ALTER TABLE `test_series_product`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `test_series_purchases`
--
ALTER TABLE `test_series_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_series_topics`
--
ALTER TABLE `test_series_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `test_status`
--
ALTER TABLE `test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tspc_set`
--
ALTER TABLE `tspc_set`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_test_series`
--
ALTER TABLE `user_test_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `user_test_status`
--
ALTER TABLE `user_test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=631;

--
-- AUTO_INCREMENT for table `verbal_question`
--
ALTER TABLE `verbal_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=541;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_tsp_id_foreign` FOREIGN KEY (`tsp_id`) REFERENCES `test_series_product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cart_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `non_verbal_question`
--
ALTER TABLE `non_verbal_question`
  ADD CONSTRAINT `non_verbal_question_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reading_question`
--
ALTER TABLE `reading_question`
  ADD CONSTRAINT `reading_question_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_series_product`
--
ALTER TABLE `test_series_product`
  ADD CONSTRAINT `test_series_product_ts_id_foreign` FOREIGN KEY (`ts_id`) REFERENCES `test_series` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_series_purchases`
--
ALTER TABLE `test_series_purchases`
  ADD CONSTRAINT `test_series_purchases_tsp_id_foreign` FOREIGN KEY (`tsp_id`) REFERENCES `test_series_product` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `test_series_purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `test_series_topics`
--
ALTER TABLE `test_series_topics`
  ADD CONSTRAINT `test_series_topics_tsc_id_foreign` FOREIGN KEY (`tsc_id`) REFERENCES `test_series_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tspc_set`
--
ALTER TABLE `tspc_set`
  ADD CONSTRAINT `tspc_set_tspc_id_foreign` FOREIGN KEY (`tspc_id`) REFERENCES `ts_product_category` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  ADD CONSTRAINT `ts_pc_topics_tspcs_id_foreign` FOREIGN KEY (`tspcs_id`) REFERENCES `tspc_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ts_pc_topics_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  ADD CONSTRAINT `ts_product_category_tsc_id_foreign` FOREIGN KEY (`tsc_id`) REFERENCES `test_series_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ts_product_category_tsp_id_foreign` FOREIGN KEY (`tsp_id`) REFERENCES `test_series_product` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_test_series`
--
ALTER TABLE `user_test_series`
  ADD CONSTRAINT `user_test_series_tsps_id_foreign` FOREIGN KEY (`tsps_id`) REFERENCES `test_series_purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_test_series_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_test_status`
--
ALTER TABLE `user_test_status`
  ADD CONSTRAINT `user_test_status_q_id_foreign` FOREIGN KEY (`q_id`) REFERENCES `verbal_question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_test_status_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `test_status` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_test_status_uts_id_foreign` FOREIGN KEY (`uts_id`) REFERENCES `user_test_series` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `verbal_question`
--
ALTER TABLE `verbal_question`
  ADD CONSTRAINT `verbal_question_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
