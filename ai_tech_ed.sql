-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2023 at 08:54 AM
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
(1, 'admin', 'admin@admin', '2023-08-26 01:24:03', '$2y$10$ogxXGorf8IiJ63DFurGLneu8IVhLYeAwDNiKM3zcGG/5QgEMKNnnS', 'J9oatZEgbL', NULL, NULL);

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
  `exception` longtext NOT NULL
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
(1, '01_create_users_table', 1),
(2, '02_create_password_reset_tokens_table', 1),
(3, '03_create_failed_jobs_table', 1),
(4, '05_create_admin_table', 1),
(5, '06_create_test_series_table', 1),
(6, '07_create_test_series_categories_table', 1),
(7, '08_create_test_series_topics_table', 1),
(8, '09_create_test_series_product_table', 1),
(9, '10_create_test_series_purchases_table', 1),
(10, '11_create_cart_table', 1),
(11, '12_create_question_table', 1),
(12, '13_reading_question_table', 1),
(13, '14_create_non_verbal_question_table', 1),
(14, '15_create_test_status_table', 1),
(15, '16_create_ts_product_category_table', 1),
(16, '17_create_tspc_set_table', 1),
(17, '18_create_ts_pc_topics_table', 1),
(18, '19_create_user_test_series_table', 1),
(19, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(20, '20_create_user_test_status_table', 1),
(21, '21_create_question_image_table', 1),
(22, '22_create_set_question_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `non_verbal_question`
--

CREATE TABLE `non_verbal_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `option_1` varchar(40) NOT NULL,
  `option_2` varchar(40) NOT NULL,
  `option_3` varchar(40) NOT NULL,
  `option_4` varchar(40) NOT NULL,
  `option_5` varchar(40) DEFAULT NULL,
  `correct_option` int(11) NOT NULL,
  `explanation` text NOT NULL,
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
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` mediumtext NOT NULL,
  `option_1` varchar(255) NOT NULL,
  `option_2` varchar(255) NOT NULL,
  `option_3` varchar(255) NOT NULL,
  `option_4` varchar(255) NOT NULL,
  `option_5` varchar(255) DEFAULT NULL,
  `correct_option` varchar(11) NOT NULL,
  `explanation` mediumtext NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `question_image`
--

CREATE TABLE `question_image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `q_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reading_question`
--

CREATE TABLE `reading_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` text NOT NULL,
  `option_1` varchar(40) NOT NULL,
  `option_2` varchar(40) NOT NULL,
  `option_3` varchar(40) NOT NULL,
  `option_4` varchar(40) NOT NULL,
  `option_5` varchar(40) DEFAULT NULL,
  `correct_option` int(11) NOT NULL,
  `explanation` text NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `set_question`
--

CREATE TABLE `set_question` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `q_id` bigint(20) UNSIGNED DEFAULT NULL,
  `set_id` bigint(20) UNSIGNED NOT NULL
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
(1, 'OC'),
(2, 'Selective');

-- --------------------------------------------------------

--
-- Table structure for table `test_series_categories`
--

CREATE TABLE `test_series_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsc_type` varchar(40) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_categories`
--

INSERT INTO `test_series_categories` (`id`, `tsc_type`, `duration`) VALUES
(1, 'Maths', 30),
(2, 'Reading', 45),
(3, 'Thinking', 35);

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
  `test_month_limit` int(11) NOT NULL,
  `total_question` int(11) NOT NULL,
  `release_date` varchar(40) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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

-- --------------------------------------------------------

--
-- Table structure for table `test_series_topics`
--

CREATE TABLE `test_series_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `t_name` varchar(40) NOT NULL,
  `topic` varchar(40) NOT NULL,
  `tsc_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `ts_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
  `set_number` int(11) DEFAULT NULL,
  `set_name` varchar(40) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ts_pc_topics`
--

CREATE TABLE `ts_pc_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tspcs_id` bigint(20) UNSIGNED NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, 'Guillermo Mante DDS', 'abc80@g', '+1.763.498.7366', NULL, '2023-08-26 01:24:03', '$2y$10$KmIwU9T2.ItabWn8Je03Xu0.1a/wc/T5twuSEFem/5rzUGeNIGU9G', 'FXqvatzJh2', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_test_series`
--

CREATE TABLE `user_test_series` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsps_id` bigint(20) UNSIGNED NOT NULL,
  `set_id` bigint(20) UNSIGNED NOT NULL,
  `complete_status` tinyint(4) NOT NULL DEFAULT 0,
  `start_date` varchar(40) NOT NULL,
  `end_date` varchar(40) DEFAULT NULL,
  `time_taken` varchar(40) DEFAULT NULL,
  `current_timer` varchar(40) DEFAULT NULL,
  `total_marks` tinyint(4) DEFAULT NULL,
  `q_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_test_status`
--

CREATE TABLE `user_test_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `q_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `test_answer` varchar(255) DEFAULT NULL,
  `marks` tinyint(4) DEFAULT NULL,
  `uts_id` bigint(20) UNSIGNED NOT NULL,
  `test_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_tst_id_index` (`tst_id`);

--
-- Indexes for table `question_image`
--
ALTER TABLE `question_image`
  ADD PRIMARY KEY (`id`),
  ADD KEY `question_image_q_id_foreign` (`q_id`);

--
-- Indexes for table `reading_question`
--
ALTER TABLE `reading_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reading_question_tst_id_index` (`tst_id`);

--
-- Indexes for table `set_question`
--
ALTER TABLE `set_question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `set_question_q_id_foreign` (`q_id`),
  ADD KEY `set_question_set_id_index` (`set_id`);

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
  ADD KEY `test_series_topics_tsc_id_index` (`tsc_id`),
  ADD KEY `test_series_topics_ts_id_index` (`ts_id`);

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
  ADD KEY `user_test_series_set_id_index` (`set_id`);

--
-- Indexes for table `user_test_status`
--
ALTER TABLE `user_test_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_test_status_q_id_foreign` (`q_id`),
  ADD KEY `user_test_status_status_id_index` (`status_id`),
  ADD KEY `user_test_status_uts_id_index` (`uts_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `non_verbal_question`
--
ALTER TABLE `non_verbal_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question_image`
--
ALTER TABLE `question_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reading_question`
--
ALTER TABLE `reading_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `set_question`
--
ALTER TABLE `set_question`
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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_series_purchases`
--
ALTER TABLE `test_series_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_series_topics`
--
ALTER TABLE `test_series_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `test_status`
--
ALTER TABLE `test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tspc_set`
--
ALTER TABLE `tspc_set`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_test_series`
--
ALTER TABLE `user_test_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_test_status`
--
ALTER TABLE `user_test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `question_image`
--
ALTER TABLE `question_image`
  ADD CONSTRAINT `question_image_q_id_foreign` FOREIGN KEY (`q_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reading_question`
--
ALTER TABLE `reading_question`
  ADD CONSTRAINT `reading_question_tst_id_foreign` FOREIGN KEY (`tst_id`) REFERENCES `test_series_topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `set_question`
--
ALTER TABLE `set_question`
  ADD CONSTRAINT `set_question_q_id_foreign` FOREIGN KEY (`q_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `set_question_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `tspc_set` (`id`) ON DELETE CASCADE;

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
  ADD CONSTRAINT `test_series_topics_ts_id_foreign` FOREIGN KEY (`ts_id`) REFERENCES `test_series` (`id`) ON DELETE CASCADE,
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
  ADD CONSTRAINT `user_test_series_set_id_foreign` FOREIGN KEY (`set_id`) REFERENCES `tspc_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_test_series_tsps_id_foreign` FOREIGN KEY (`tsps_id`) REFERENCES `test_series_purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_test_status`
--
ALTER TABLE `user_test_status`
  ADD CONSTRAINT `user_test_status_q_id_foreign` FOREIGN KEY (`q_id`) REFERENCES `question` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_test_status_status_id_foreign` FOREIGN KEY (`status_id`) REFERENCES `test_status` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_test_status_uts_id_foreign` FOREIGN KEY (`uts_id`) REFERENCES `user_test_series` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
