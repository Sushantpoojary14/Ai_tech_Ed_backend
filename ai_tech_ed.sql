-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2023 at 07:04 AM
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
(1, 'admin', 'admin@admin', '2023-08-21 04:20:58', '$2y$10$lE4sAUDGcy6K//WDXSrRJec3q2CNf70IUSKUnfhNs65K6A8BMgNSy', 'WFmL7eG1or', NULL, NULL);

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
  `option_1` varchar(40) NOT NULL,
  `option_2` varchar(40) NOT NULL,
  `option_3` varchar(40) NOT NULL,
  `option_4` varchar(40) NOT NULL,
  `option_5` varchar(40) DEFAULT NULL,
  `correct_option` tinyint(4) NOT NULL,
  `explanation` mediumtext NOT NULL,
  `tst_id` bigint(20) UNSIGNED NOT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `option_5`, `correct_option`, `explanation`, `tst_id`, `marks`, `status`) VALUES
(1, 'Ruby bought 4 25 kg of flour. She used 3 23 kg while baking cake. How much sugar did she have left?', '120 kg', '88 KG', '105 kg', '115 kg', NULL, 5, 'Total flour bought by Ruby = 4 25 kg \r\nFlour used for baking cake = 3 23 kg\r\nTotal flour remained= Total flour bought – flour used for baking cake\r\nFirst convert the mixed fraction into proper fraction\r\nTherefore 4 25 kg = 5x4+25;= 225 kg\r\n3 23 kg = 3x3x23 =113 kg\r\n225 - 113 ; = 3x22-5x1115; = 66-5515;= 115', 4, NULL, 1),
(2, '.If 4 13 m of rod is cut from a piece of 15 m long rod, how much of rod is left?', '220 m', '50 m', '323 m', '97 m', NULL, 5, 'Total length of rod = 15m\r\nFraction of the rod cut out = 4 13 m =  133 m\r\nLength of the rod left = 15m -  133 ; = 3x15-1x133; = 45-133; = 323m\r\nTherefore 323m of rod is left', 4, NULL, 1),
(3, 'A train arrives at the station with 210 passengers on board. 23 of the passengers get off the train in Parramatta, and then 45 passengers board the train. How many passengers are on the train when it leaves the station?', '115', '65', '90', '125', NULL, 5, 'Passengers in train = 210\r\nPeople get off the train = 23 of 210 = 23 x 210 = 140\r\nPeople left in train = 210-140=70 \r\nNumber of passenger get into train=45\r\nNumber of passengers on train when it leaves the station = 70+45 = 115\r\nTherefore number of passenger on train when it leaves is 115.', 4, NULL, 1),
(4, 'Annie has 85 chocolate in a bag. She keeps 35 of them for herself and shares the rest with friends. How many chocolate will she give to her friends?', '45', '34', '52', '60', NULL, 5, 'Number of chocolate = 85\r\nNumber of chocolate Annie kept for herself = 35 of 85; = 35 x 85; = 51\r\nNumber of chocolate Annie gave to her friends = 85 – 51 =34\r\nTherefore Annie gave 34 chocolates to her friends.', 4, NULL, 1),
(5, 'The run rate was only 3.2 over the opening 10 overs of a cricket match. What run rate must be achieved in the final 40 overs to meet the 282 run target?', '6.25', '6.5', '6.75', '7', NULL, 5, 'To find the required run rate in the remaining 40 overs to reach the target of 282 runs, we can use the concept of average run rate.\n\nThe total runs required to reach the target is 282 runs. Since 10 overs have already been played at a run rate of 3.2 runs per over, the total runs scored in those 10 overs would be 10 * 3.2 = 32 runs.\n\nThe remaining runs required to reach the target is 282 - 32 = 250 runs.\n\nNow, we can calculate the required run rate for the remaining 40 overs by dividing the remaining runs required by the number of overs remaining:\n\nRequired Run Rate = Remaining Runs Required / Remaining Overs\n= 250 runs / 40 overs\n= 6.25 runs per over', 5, NULL, 1),
(6, 'A family consists of three grandchildren, two parents, and two grandparents. The grandparents\' average age is 67 years, the parents\' average age is 35 years, and the age of the grandkids is 6 years. How old on average is the family?', '28 4/years', '31   5/7   years', '32  1/7    years', 'None of these', NULL, 5, 'Let&#039;s denote the average age of the grandparents as G, the average age of the parents as P, and the average age of the grandchildren as C.\n\nThe total age of the grandparents would be 2 grandparents * 67 years = 134 years.\nThe total age of the parents would be 2 parents * 35 years = 70 years.\nThe total age of the grandchildren would be 3 grandchildren * 6 years = 18 years.\n\nNow, to find the average age of the family, we sum up the total ages and divide it by the total number of family members:\n\nAverage Age of Family = (Total Age of Grandparents + Total Age of Parents + Total Age of Grandchildren) / Total Number of Family Members\n= (134 years + 70 years + 18 years) / 7 family members\n= 222 years / 7 family members == 31.71 years', 5, NULL, 1),
(7, 'The average of 20 numbers is zero. Of them, at the most, how many may be greater than zero?', '0', '1', '10', '19', NULL, 5, 'Explanation:\nAverage of 20 numbers = 0.\n\n Sum of 20 numbers (0 x 20) = 0.\n\nIt is quite possible that 19 of these numbers may be positive and if their sum is a then 20th number is (-a).', 5, NULL, 1),
(8, 'The average weight of 8 person\'s increases by 2.5 kg when a new person comes in place of one of them weighing 65 kg. What might be the weight of the new person?', '76 kg', '76.5 kg', '85 kg', 'Data inadequate', NULL, 5, 'Explanation:\nTotal weight increased = (8 x 2.5) kg = 20 kg.\n\nWeight of new person = (65 + 20) kg = 85 kg.', 5, NULL, 1),
(9, 'Mary harvested apples from 6 trees. On the first day, she picked 35 apples, the second day she picked 40, the third day she got 50, the fourth day was 30, the fifth day was 45, and the last day she got 60 apples. She shared half of the harvest from the last day with her neighbor. What is the average number of apples she collected per day?', '40', '42.5', '43.3', '45', NULL, 5, 'Explanation: Mary shared half of the last day&#039;s harvest, which means she only kept 60 / 2 = 30 apples. Adding all the apples from the 6 days gives 35 + 40 + 50 + 30 + 45 + 30 = 230. Dividing this by 6 days gives an average of 230 / 6 = 42.5 apples per day.', 5, NULL, 1),
(10, 'In a class of 30 students, the average score for a math test was 75. After one student, who got 55 on the test, transferred out, what was the new average score of the class?', '74.5', '75.3', '76', '75.6', NULL, 5, 'Explanation: The total score for the class was 75 * 30 = 2250. After the student with the score of 55 transferred out, the total score was 2250 - 55 = 2195. The new average is thus 2195 / (30 - 1) = 75.6.', 5, NULL, 1),
(11, 'The average age of husband, wife and their child 3 years ago was 27 years and that of wife and the child 5 years ago was 20 years. The present age of the husband is:', '35 years', '40 years', '50 years', 'None of these', NULL, 5, 'Sum of the present ages of husband, wife and child = (27 x 3 + 3 x 3) years = 90 years.\n\nSum of the present ages of wife and child = (20 x 2 + 5 x 2) years = 50 years.\n\n Husband&#039;s present age = (90 - 50) years = 40 years.', 5, NULL, 1),
(12, 'The average weight of A, B and C is 45 kg. If the average weight of A and B be 40 kg and that of B and C be 43 kg, then the weight of B is:', '17 kg', '20 kg', '26 kg', '31 kg', NULL, 5, 'Explanation:\nLet A, B, C represent their respective weights. Then, we have:\n\nA + B + C = (45 x 3) = 135 .... (i)\n\nA + B = (40 x 2) = 80 .... (ii)\n\nB + C = (43 x 2) = 86 ....(iii)\n\nAdding (ii) and (iii), we get: A + 2B + C = 166 .... (iv)\n\nSubtracting (i) from (iv), we get : B = 31.\n\n B&#039;s weight = 31 kg.', 5, NULL, 1),
(13, 'The average weight of 16 boys in a class is 50.25 kg and that of the remaining 8 boys is 45.15 kg. Find the average weights of all the boys in the class.', '47.35 kg', '48.55 kg', '49.75 kg', '50.95 kg', NULL, 5, 'Let&#039;s denote:\n\nA as the average weight of all the boys in the class\nB as the number of boys in the class (16 + 8 = 24)\nC as the average weight of the 16 boys (50.25 kg)\nD as the average weight of the remaining 8 boys (45.15 kg)\nWe know that the total weight of all boys is equal to the sum of the total weights of the 16 boys and the 8 boys. Therefore, we can write:\n\nB * A = 16 * C + 8 * D\n\nSubstituting the known values into this equation, we get:\n\n24 * A = 16 * 50.25 + 8 * 45.15\n24 * A = 804 + 361.2\n24 * A = 1165.2\n\nSolving for A, we get:\n\nA = 1165.2 / 24\nA = 48.55 kg', 5, NULL, 1),
(14, 'What is the average score of all the students?', '80', '81', '82', '83', NULL, 5, 'Explanation: The total score of the first group is 12 * 85 = 1020. The total score of the second group is 18 * 78 = 1404. The combined score is 1020 + 1404 = 2424. Since there are 30 students in total, the average score is 2424 / 30 = 80.8, which rounds to 81.', 5, NULL, 1),
(15, 'If the average marks of three batches of 55, 60 and 45 students respectively is 50, 55, 60, then the average marks of all the students is:', '53.5', '54.7', '55.9', '57.1', NULL, 5, 'A as the average marks of all the students\nB as the total number of students (55 + 60 + 45 = 160)\nC1, C2, and C3 as the average marks of each batch (50, 55, and 60 respectively)\nN1, N2, and N3 as the number of students in each batch (55, 60, and 45 respectively)\nWe know that the total marks of all students is equal to the sum of the total marks of each batch. Therefore, we can write:\n\nB * A = N1 * C1 + N2 * C2 + N3 * C3\n\nSubstituting the known values into this equation, we get:\n\n160 * A = 55 * 50 + 60 * 55 + 45 * 60\n160 * A = 2750 + 3300 + 2700\n160 * A = 8750\n\nSolving for A, we get:\n\nA = 8750 / 160\nA = 54.6875\n\nSo, the average marks of all the students is approximately 54.7.', 5, NULL, 1),
(16, 'A pupil\'s marks were wrongly entered as 83 instead of 63. Due to that the average marks for the class got increased by half (1/2). The number of pupils in the class is:', '30', '35', '40', '45', NULL, 5, 'The average mark was increased by half (1/2) because of the 20 extra marks (83 - 63). This means that the total number of pupils is equal to the amount that the extra marks would be distributed among to cause an increase of 1/2 per pupil. Therefore, the number of pupils in the class would be:\n\n20 / (1/2) = 40', 5, NULL, 1),
(17, 'The average age of a group of friends is 25 years. If the age of one friend is mistakenly recorded as 30 instead of 20, what is the correct average age?', '24 years', '25 years', '26 years', '27 years', NULL, 5, 'Solution: Let the total age of the group be X. According to the given condition, (X + 30) / n = 25, where n is the number of friends in the group. If we subtract 30 from the numerator, we have X / n = 25 - 30/n. Since the numerator should be divisible by n for the average to be a whole number, X should be divisible by n. Therefore, the correct average age would still be 25 years. So, the correct answer is b) 25 years.', 5, NULL, 1),
(18, 'The average salary of a group of employees is $4000. If the average salary of male employees is $4500 and the average salary of female employees is $3500, what is the ratio of male to female employees in the group?', '1:1', '2:1', '3:1', '4:1', NULL, 5, 'Solution:\n\nLet the number of male employees in the group be M and the number of female employees be F.\n\nAccording to the given condition, (4500M + 3500F) / (M + F) = 4000.\n\nIf we simplify the equation, we get 4500M + 3500F = 4000M + 4000F.\n\nRearranging the terms, we have 500M = 500F, which simplifies to M = F.\n\nTherefore, the ratio of male to female employees in the group is 1:1.\n\nSo, the correct answer is a) 1:1.', 5, NULL, 1),
(19, 'The average marks of a class of 30 students are 70. If the marks of the top 5 students are 90 each, what is the average of the remaining students?', '65', '66', '68', '70', NULL, 5, 'Solution: The total marks of the top 5 students are 5 * 90 = 450. The total marks of the remaining 25 students are (30 * 70) - 450 = 2100 - 450 = 1650. The average of the remaining 25 students is 1650 / 25 = 66.', 5, NULL, 1),
(20, 'The run rate was only 3.2 over the opening 10 overs of a cricket match. What run rate must be achieved in the final 40 overs to meet the 282 run target?', '6.25', '6.5', '6.75', '7', NULL, 5, 'To find the required run rate in the remaining 40 overs to reach the target of 282 runs, we can use the concept of average run rate.\n\nThe total runs required to reach the target is 282 runs. Since 10 overs have already been played at a run rate of 3.2 runs per over, the total runs scored in those 10 overs would be 10 * 3.2 = 32 runs.\n\nThe remaining runs required to reach the target is 282 - 32 = 250 runs.\n\nNow, we can calculate the required run rate for the remaining 40 overs by dividing the remaining runs required by the number of overs remaining:\n\nRequired Run Rate = Remaining Runs Required / Remaining Overs\n= 250 runs / 40 overs\n= 6.25 runs per over', 7, NULL, 1),
(21, 'A family consists of three grandchildren, two parents, and two grandparents. The grandparents\' average age is 67 years, the parents\' average age is 35 years, and the age of the grandkids is 6 years. How old on average is the family?', '28 4/years', '31   5/7   years', '32  1/7    years', 'None of these', NULL, 5, 'Let&#039;s denote the average age of the grandparents as G, the average age of the parents as P, and the average age of the grandchildren as C.\n\nThe total age of the grandparents would be 2 grandparents * 67 years = 134 years.\nThe total age of the parents would be 2 parents * 35 years = 70 years.\nThe total age of the grandchildren would be 3 grandchildren * 6 years = 18 years.\n\nNow, to find the average age of the family, we sum up the total ages and divide it by the total number of family members:\n\nAverage Age of Family = (Total Age of Grandparents + Total Age of Parents + Total Age of Grandchildren) / Total Number of Family Members\n= (134 years + 70 years + 18 years) / 7 family members\n= 222 years / 7 family members == 31.71 years', 7, NULL, 1),
(22, 'The average of 20 numbers is zero. Of them, at the most, how many may be greater than zero?', '0', '1', '10', '19', NULL, 5, 'Explanation:\nAverage of 20 numbers = 0.\n\n Sum of 20 numbers (0 x 20) = 0.\n\nIt is quite possible that 19 of these numbers may be positive and if their sum is a then 20th number is (-a).', 7, NULL, 1),
(23, 'The average weight of 8 person\'s increases by 2.5 kg when a new person comes in place of one of them weighing 65 kg. What might be the weight of the new person?', '76 kg', '76.5 kg', '85 kg', 'Data inadequate', NULL, 5, 'Explanation:\nTotal weight increased = (8 x 2.5) kg = 20 kg.\n\nWeight of new person = (65 + 20) kg = 85 kg.', 7, NULL, 1),
(24, 'Mary harvested apples from 6 trees. On the first day, she picked 35 apples, the second day she picked 40, the third day she got 50, the fourth day was 30, the fifth day was 45, and the last day she got 60 apples. She shared half of the harvest from the last day with her neighbor. What is the average number of apples she collected per day?', '40', '42.5', '43.3', '45', NULL, 5, 'Explanation: Mary shared half of the last day&#039;s harvest, which means she only kept 60 / 2 = 30 apples. Adding all the apples from the 6 days gives 35 + 40 + 50 + 30 + 45 + 30 = 230. Dividing this by 6 days gives an average of 230 / 6 = 42.5 apples per day.', 7, NULL, 1),
(25, 'In a class of 30 students, the average score for a math test was 75. After one student, who got 55 on the test, transferred out, what was the new average score of the class?', '74.5', '75.3', '76', '75.6', NULL, 5, 'Explanation: The total score for the class was 75 * 30 = 2250. After the student with the score of 55 transferred out, the total score was 2250 - 55 = 2195. The new average is thus 2195 / (30 - 1) = 75.6.', 7, NULL, 1),
(26, 'The average age of husband, wife and their child 3 years ago was 27 years and that of wife and the child 5 years ago was 20 years. The present age of the husband is:', '35 years', '40 years', '50 years', 'None of these', NULL, 5, 'Sum of the present ages of husband, wife and child = (27 x 3 + 3 x 3) years = 90 years.\n\nSum of the present ages of wife and child = (20 x 2 + 5 x 2) years = 50 years.\n\n Husband&#039;s present age = (90 - 50) years = 40 years.', 7, NULL, 1),
(27, 'The average weight of A, B and C is 45 kg. If the average weight of A and B be 40 kg and that of B and C be 43 kg, then the weight of B is:', '17 kg', '20 kg', '26 kg', '31 kg', NULL, 5, 'Explanation:\nLet A, B, C represent their respective weights. Then, we have:\n\nA + B + C = (45 x 3) = 135 .... (i)\n\nA + B = (40 x 2) = 80 .... (ii)\n\nB + C = (43 x 2) = 86 ....(iii)\n\nAdding (ii) and (iii), we get: A + 2B + C = 166 .... (iv)\n\nSubtracting (i) from (iv), we get : B = 31.\n\n B&#039;s weight = 31 kg.', 7, NULL, 1),
(28, 'The average weight of 16 boys in a class is 50.25 kg and that of the remaining 8 boys is 45.15 kg. Find the average weights of all the boys in the class.', '47.35 kg', '48.55 kg', '49.75 kg', '50.95 kg', NULL, 5, 'Let&#039;s denote:\n\nA as the average weight of all the boys in the class\nB as the number of boys in the class (16 + 8 = 24)\nC as the average weight of the 16 boys (50.25 kg)\nD as the average weight of the remaining 8 boys (45.15 kg)\nWe know that the total weight of all boys is equal to the sum of the total weights of the 16 boys and the 8 boys. Therefore, we can write:\n\nB * A = 16 * C + 8 * D\n\nSubstituting the known values into this equation, we get:\n\n24 * A = 16 * 50.25 + 8 * 45.15\n24 * A = 804 + 361.2\n24 * A = 1165.2\n\nSolving for A, we get:\n\nA = 1165.2 / 24\nA = 48.55 kg', 7, NULL, 1),
(29, 'What is the average score of all the students?', '80', '81', '82', '83', NULL, 5, 'Explanation: The total score of the first group is 12 * 85 = 1020. The total score of the second group is 18 * 78 = 1404. The combined score is 1020 + 1404 = 2424. Since there are 30 students in total, the average score is 2424 / 30 = 80.8, which rounds to 81.', 7, NULL, 1),
(30, 'If the average marks of three batches of 55, 60 and 45 students respectively is 50, 55, 60, then the average marks of all the students is:', '53.5', '54.7', '55.9', '57.1', NULL, 5, 'A as the average marks of all the students\nB as the total number of students (55 + 60 + 45 = 160)\nC1, C2, and C3 as the average marks of each batch (50, 55, and 60 respectively)\nN1, N2, and N3 as the number of students in each batch (55, 60, and 45 respectively)\nWe know that the total marks of all students is equal to the sum of the total marks of each batch. Therefore, we can write:\n\nB * A = N1 * C1 + N2 * C2 + N3 * C3\n\nSubstituting the known values into this equation, we get:\n\n160 * A = 55 * 50 + 60 * 55 + 45 * 60\n160 * A = 2750 + 3300 + 2700\n160 * A = 8750\n\nSolving for A, we get:\n\nA = 8750 / 160\nA = 54.6875\n\nSo, the average marks of all the students is approximately 54.7.', 7, NULL, 1),
(31, 'A pupil\'s marks were wrongly entered as 83 instead of 63. Due to that the average marks for the class got increased by half (1/2). The number of pupils in the class is:', '30', '35', '40', '45', NULL, 5, 'The average mark was increased by half (1/2) because of the 20 extra marks (83 - 63). This means that the total number of pupils is equal to the amount that the extra marks would be distributed among to cause an increase of 1/2 per pupil. Therefore, the number of pupils in the class would be:\n\n20 / (1/2) = 40', 7, NULL, 1),
(32, 'Trees, with their towering presence and profound impact on our planet, hold a unique place in the natural world. These ancient guardians of the earth have silently witnessed the passage of time, spanning generations with their enduring grace and resilience. Beyond their aesthetic allure, trees play an indispensable role in maintaining ecological balance and sustaining life as we know it.\n\nAt a fundamental level, trees are essential contributors to the planet\'s oxygen supply through the process of photosynthesis. They absorb carbon dioxide, a greenhouse gas responsible for global warming, and release oxygen, ensuring a breathable atmosphere for humans and wildlife alike. Additionally, trees act as vital carbon sinks, absorbing and storing carbon, thus aiding in the fight against climate change.\n\nThe intricate network of roots that anchor trees into the earth performs a multifaceted role in preventing soil erosion. This not only maintains the integrity of landscapes but also ensures fertile soil for agriculture. Trees serve as a habitat and refuge for countless species, fostering biodiversity and creating a complex ecosystem where various plants, animals, insects, and microorganisms coexist in harmony.\n\nMoreover, trees possess cultural and spiritual significance across societies. Many civilizations have revered specific tree species as symbols of strength, wisdom, and interconnectedness. Trees have been integral to folklore, rituals, and traditions, reinforcing their role as more than just biological entities. They inspire artists, writers, and thinkers, serving as metaphors for growth, transformation, and resilience.\n\nHowever, despite their immense value, trees face numerous threats such as deforestation, urbanization, and climate-related stresses. Conservation efforts, reforestation projects, and sustainable land management practices are crucial in safeguarding their existence and the benefits they bestow upon us.\n\nIn conclusion, trees embody nature\'s grandeur and hold unparalleled significance. Their contributions encompass oxygen production, carbon sequestration, soil preservation, and the creation of diverse ecosystems. Beyond their ecological roles, trees resonate deeply within human cultures and spirituality. It is our responsibility to ensure their preservation for current and future generations, as they remain essential partners in the delicate symphony of life on Earth.', '24 years', '25 years', '26 years', '27 years', NULL, 5, 'Solution: Let the total age of the group be X. According to the given condition, (X + 30) / n = 25, where n is the number of friends in the group. If we subtract 30 from the numerator, we have X / n = 25 - 30/n. Since the numerator should be divisible by n for the average to be a whole number, X should be divisible by n. Therefore, the correct average age would still be 25 years. So, the correct answer is b) 25 years.', 7, NULL, 1),
(33, 'The average salary of a group of employees is $4000. If the average salary of male employees is $4500 and the average salary of female employees is $3500, what is the ratio of male to female employees in the group?', '1:1', '2:1', '3:1', '4:1', NULL, 5, 'Solution:\n\nLet the number of male employees in the group be M and the number of female employees be F.\n\nAccording to the given condition, (4500M + 3500F) / (M + F) = 4000.\n\nIf we simplify the equation, we get 4500M + 3500F = 4000M + 4000F.\n\nRearranging the terms, we have 500M = 500F, which simplifies to M = F.\n\nTherefore, the ratio of male to female employees in the group is 1:1.\n\nSo, the correct answer is a) 1:1.', 7, NULL, 1),
(34, 'The average marks of a class of 30 students are 70. If the marks of the top 5 students are 90 each, what is the average of the remaining students?', '65', '66', '68', '70', NULL, 5, 'Solution: The total marks of the top 5 students are 5 * 90 = 450. The total marks of the remaining 25 students are (30 * 70) - 450 = 2100 - 450 = 1650. The average of the remaining 25 students is 1650 / 25 = 66.', 7, NULL, 1),
(35, 'The run rate was only 3.2 over the opening 10 overs of a cricket match. What run rate must be achieved in the final 40 overs to meet the 282 run target?', '6.25', '6.5', '6.75', '7', NULL, 5, 'To find the required run rate in the remaining 40 overs to reach the target of 282 runs, we can use the concept of average run rate.\n\nThe total runs required to reach the target is 282 runs. Since 10 overs have already been played at a run rate of 3.2 runs per over, the total runs scored in those 10 overs would be 10 * 3.2 = 32 runs.\n\nThe remaining runs required to reach the target is 282 - 32 = 250 runs.\n\nNow, we can calculate the required run rate for the remaining 40 overs by dividing the remaining runs required by the number of overs remaining:\n\nRequired Run Rate = Remaining Runs Required / Remaining Overs\n= 250 runs / 40 overs\n= 6.25 runs per over', 8, NULL, 1),
(36, 'A family consists of three grandchildren, two parents, and two grandparents. The grandparents\' average age is 67 years, the parents\' average age is 35 years, and the age of the grandkids is 6 years. How old on average is the family?', '28 4/years', '31   5/7   years', '32  1/7    years', 'None of these', NULL, 5, 'Let&#039;s denote the average age of the grandparents as G, the average age of the parents as P, and the average age of the grandchildren as C.\n\nThe total age of the grandparents would be 2 grandparents * 67 years = 134 years.\nThe total age of the parents would be 2 parents * 35 years = 70 years.\nThe total age of the grandchildren would be 3 grandchildren * 6 years = 18 years.\n\nNow, to find the average age of the family, we sum up the total ages and divide it by the total number of family members:\n\nAverage Age of Family = (Total Age of Grandparents + Total Age of Parents + Total Age of Grandchildren) / Total Number of Family Members\n= (134 years + 70 years + 18 years) / 7 family members\n= 222 years / 7 family members == 31.71 years', 8, NULL, 1),
(37, 'The average of 20 numbers is zero. Of them, at the most, how many may be greater than zero?', '0', '1', '10', '19', NULL, 5, 'Explanation:\nAverage of 20 numbers = 0.\n\n Sum of 20 numbers (0 x 20) = 0.\n\nIt is quite possible that 19 of these numbers may be positive and if their sum is a then 20th number is (-a).', 8, NULL, 1),
(38, 'The average weight of 8 person\'s increases by 2.5 kg when a new person comes in place of one of them weighing 65 kg. What might be the weight of the new person?', '76 kg', '76.5 kg', '85 kg', 'Data inadequate', NULL, 5, 'Explanation:\nTotal weight increased = (8 x 2.5) kg = 20 kg.\n\nWeight of new person = (65 + 20) kg = 85 kg.', 8, NULL, 1),
(39, 'Mary harvested apples from 6 trees. On the first day, she picked 35 apples, the second day she picked 40, the third day she got 50, the fourth day was 30, the fifth day was 45, and the last day she got 60 apples. She shared half of the harvest from the last day with her neighbor. What is the average number of apples she collected per day?', '40', '42.5', '43.3', '45', NULL, 5, 'Explanation: Mary shared half of the last day&#039;s harvest, which means she only kept 60 / 2 = 30 apples. Adding all the apples from the 6 days gives 35 + 40 + 50 + 30 + 45 + 30 = 230. Dividing this by 6 days gives an average of 230 / 6 = 42.5 apples per day.', 8, NULL, 1),
(40, 'In a class of 30 students, the average score for a math test was 75. After one student, who got 55 on the test, transferred out, what was the new average score of the class?', '74.5', '75.3', '76', '75.6', NULL, 5, 'Explanation: The total score for the class was 75 * 30 = 2250. After the student with the score of 55 transferred out, the total score was 2250 - 55 = 2195. The new average is thus 2195 / (30 - 1) = 75.6.', 8, NULL, 1),
(41, 'The average age of husband, wife and their child 3 years ago was 27 years and that of wife and the child 5 years ago was 20 years. The present age of the husband is:', '35 years', '40 years', '50 years', 'None of these', NULL, 5, 'Sum of the present ages of husband, wife and child = (27 x 3 + 3 x 3) years = 90 years.\n\nSum of the present ages of wife and child = (20 x 2 + 5 x 2) years = 50 years.\n\n Husband&#039;s present age = (90 - 50) years = 40 years.', 8, NULL, 1),
(42, 'The average weight of A, B and C is 45 kg. If the average weight of A and B be 40 kg and that of B and C be 43 kg, then the weight of B is:', '17 kg', '20 kg', '26 kg', '31 kg', NULL, 5, 'Explanation:\nLet A, B, C represent their respective weights. Then, we have:\n\nA + B + C = (45 x 3) = 135 .... (i)\n\nA + B = (40 x 2) = 80 .... (ii)\n\nB + C = (43 x 2) = 86 ....(iii)\n\nAdding (ii) and (iii), we get: A + 2B + C = 166 .... (iv)\n\nSubtracting (i) from (iv), we get : B = 31.\n\n B&#039;s weight = 31 kg.', 8, NULL, 1),
(43, 'The average weight of 16 boys in a class is 50.25 kg and that of the remaining 8 boys is 45.15 kg. Find the average weights of all the boys in the class.', '47.35 kg', '48.55 kg', '49.75 kg', '50.95 kg', NULL, 5, 'Let&#039;s denote:\n\nA as the average weight of all the boys in the class\nB as the number of boys in the class (16 + 8 = 24)\nC as the average weight of the 16 boys (50.25 kg)\nD as the average weight of the remaining 8 boys (45.15 kg)\nWe know that the total weight of all boys is equal to the sum of the total weights of the 16 boys and the 8 boys. Therefore, we can write:\n\nB * A = 16 * C + 8 * D\n\nSubstituting the known values into this equation, we get:\n\n24 * A = 16 * 50.25 + 8 * 45.15\n24 * A = 804 + 361.2\n24 * A = 1165.2\n\nSolving for A, we get:\n\nA = 1165.2 / 24\nA = 48.55 kg', 8, NULL, 1),
(44, 'What is the average score of all the students?', '80', '81', '82', '83', NULL, 5, 'Explanation: The total score of the first group is 12 * 85 = 1020. The total score of the second group is 18 * 78 = 1404. The combined score is 1020 + 1404 = 2424. Since there are 30 students in total, the average score is 2424 / 30 = 80.8, which rounds to 81.', 8, NULL, 1),
(45, 'If the average marks of three batches of 55, 60 and 45 students respectively is 50, 55, 60, then the average marks of all the students is:', '53.5', '54.7', '55.9', '57.1', NULL, 5, 'A as the average marks of all the students\nB as the total number of students (55 + 60 + 45 = 160)\nC1, C2, and C3 as the average marks of each batch (50, 55, and 60 respectively)\nN1, N2, and N3 as the number of students in each batch (55, 60, and 45 respectively)\nWe know that the total marks of all students is equal to the sum of the total marks of each batch. Therefore, we can write:\n\nB * A = N1 * C1 + N2 * C2 + N3 * C3\n\nSubstituting the known values into this equation, we get:\n\n160 * A = 55 * 50 + 60 * 55 + 45 * 60\n160 * A = 2750 + 3300 + 2700\n160 * A = 8750\n\nSolving for A, we get:\n\nA = 8750 / 160\nA = 54.6875\n\nSo, the average marks of all the students is approximately 54.7.', 8, NULL, 1),
(46, 'A pupil\'s marks were wrongly entered as 83 instead of 63. Due to that the average marks for the class got increased by half (1/2). The number of pupils in the class is:', '30', '35', '40', '45', NULL, 5, 'The average mark was increased by half (1/2) because of the 20 extra marks (83 - 63). This means that the total number of pupils is equal to the amount that the extra marks would be distributed among to cause an increase of 1/2 per pupil. Therefore, the number of pupils in the class would be:\n\n20 / (1/2) = 40', 8, NULL, 1),
(47, 'The average age of a group of friends is 25 years. If the age of one friend is mistakenly recorded as 30 instead of 20, what is the correct average age?', '24 years', '25 years', '26 years', '27 years', NULL, 5, 'Solution: Let the total age of the group be X. According to the given condition, (X + 30) / n = 25, where n is the number of friends in the group. If we subtract 30 from the numerator, we have X / n = 25 - 30/n. Since the numerator should be divisible by n for the average to be a whole number, X should be divisible by n. Therefore, the correct average age would still be 25 years. So, the correct answer is b) 25 years.', 8, NULL, 1),
(48, 'The average salary of a group of employees is $4000. If the average salary of male employees is $4500 and the average salary of female employees is $3500, what is the ratio of male to female employees in the group?', '1:1', '2:1', '3:1', '4:1', NULL, 5, 'Solution:\n\nLet the number of male employees in the group be M and the number of female employees be F.\n\nAccording to the given condition, (4500M + 3500F) / (M + F) = 4000.\n\nIf we simplify the equation, we get 4500M + 3500F = 4000M + 4000F.\n\nRearranging the terms, we have 500M = 500F, which simplifies to M = F.\n\nTherefore, the ratio of male to female employees in the group is 1:1.\n\nSo, the correct answer is a) 1:1.', 8, NULL, 1),
(49, 'The average marks of a class of 30 students are 70. If the marks of the top 5 students are 90 each, what is the average of the remaining students?', '65', '66', '68', '70', NULL, 5, 'Solution: The total marks of the top 5 students are 5 * 90 = 450. The total marks of the remaining 25 students are (30 * 70) - 450 = 2100 - 450 = 1650. The average of the remaining 25 students is 1650 / 25 = 66.', 8, NULL, 1),
(52, 'The run rate was only 3.2 over the opening 10 overs of a cricket match. What run rate must be achieved in the final 40 overs to meet the 282 run target?', '28 4/years', '6.5', '6.75', '7', NULL, 5, 'To find the required run rate in the remaining 40 overs to reach the target of 282 runs, we can use the concept of average run rate.\n\nThe total runs required to reach the target is 282 runs. Since 10 overs have already been played at a run rate of 3.2 runs per over, the total runs scored in those 10 overs would be 10 * 3.2 = 32 runs.\n\nThe remaining runs required to reach the target is 282 - 32 = 250 runs.\n\nNow, we can calculate the required run rate for the remaining 40 overs by dividing the remaining runs required by the number of overs remaining:\n\nRequired Run Rate = Remaining Runs Required / Remaining Overs\n= 250 runs / 40 overs\n= 6.25 runs per over', 16, NULL, 1),
(53, 'The run rate was only 3.2 over the opening 10 overs of a cricket match. What run rate must be achieved in the final 40 overs to meet the 282 run target?', '28 4/years', '6.5', '6.75', '7', NULL, 1, 'To find the required run rate in the remaining 40 overs to reach the target of 282 runs, we can use the concept of average run rate.\n\nThe total runs required to reach the target is 282 runs. Since 10 overs have already been played at a run rate of 3.2 runs per over, the total runs scored in those 10 overs would be 10 * 3.2 = 32 runs.\n\nThe remaining runs required to reach the target is 282 - 32 = 250 runs.\n\nNow, we can calculate the required run rate for the remaining 40 overs by dividing the remaining runs required by the number of overs remaining:\n\nRequired Run Rate = Remaining Runs Required / Remaining Overs\n= 250 runs / 40 overs\n= 6.25 runs per over', 17, NULL, 1),
(54, 'A family consists of three grandchildren, two parents, and two grandparents. The grandparents\' average age is 67 years, the parents\' average age is 35 years, and the age of the grandkids is 6 years. How old on average is the family?', '28 4/years', '31   5/7   years', '32  1/7    years', 'None of these', NULL, 2, 'Let\'s denote the average age of the grandparents as G, the average age of the parents as P, and the average age of the grandchildren as C.\n\nThe total age of the grandparents would be 2 grandparents * 67 years = 134 years.\nThe total age of the parents would be 2 parents * 35 years = 70 years.\nThe total age of the grandchildren would be 3 grandchildren * 6 years = 18 years.\n\nNow, to find the average age of the family, we sum up the total ages and divide it by the total number of family members:\n\nAverage Age of Family = (Total Age of Grandparents + Total Age of Parents + Total Age of Grandchildren) / Total Number of Family Members\n= (134 years + 70 years + 18 years) / 7 family members\n= 222 years / 7 family members == 31.71 years', 17, NULL, 1),
(55, '.If 4 13 m of rod is cut from a piece of 15 m long rod, how much of rod is left?', '220 m', '50 m', '323 m', '97 m', NULL, 2, 'Total flour bought by Ruby = 4 25 kg Flour used for baking cake = 3 23 kgTotal flour remained= Total flour bought – flour used for baking cake First convert the mixed fraction into proper fractionTherefore 4 25 kg = 5x4+25;= 225 kg 3 23 kg = 3x3x23 =113 kg225 - 113 ; = 3x22-5x1115; = 66-5515;= 115', 17, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question_image`
--

CREATE TABLE `question_image` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(100) NOT NULL,
  `q_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `question_image`
--

INSERT INTO `question_image` (`id`, `image_url`, `q_id`) VALUES
(1, '/images/product-1692786972.JPG', 4),
(2, '/images/product-1692786972.JPG', 4),
(3, '/images/product-1692786972.JPG', 4);

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

--
-- Dumping data for table `set_question`
--

INSERT INTO `set_question` (`id`, `q_id`, `set_id`) VALUES
(1, 4, 4),
(2, 1, 4),
(3, 8, 4),
(4, 7, 4),
(5, 3, 4),
(6, 11, 4),
(7, 14, 4),
(8, 19, 4),
(9, 16, 4),
(10, 10, 4),
(11, 11, 5),
(12, 10, 5),
(13, 14, 5),
(14, 19, 5),
(15, 7, 5),
(16, 4, 5),
(17, 13, 5),
(18, 18, 5),
(19, 1, 5),
(20, 12, 5),
(21, 32, 6),
(22, 27, 6),
(23, 24, 6),
(24, 31, 6),
(25, 30, 6),
(26, 33, 6),
(27, 26, 6),
(28, 21, 6),
(29, 25, 6),
(30, 22, 6),
(31, 10, 7),
(32, 7, 7),
(33, 1, 7),
(34, 16, 7),
(35, 2, 7),
(36, 6, 7),
(37, 17, 7),
(38, 14, 7),
(39, 18, 7),
(40, 3, 7);

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

--
-- Dumping data for table `test_series_product`
--

INSERT INTO `test_series_product` (`id`, `p_name`, `p_description`, `p_price`, `p_image`, `ts_id`, `test_month_limit`, `total_question`, `release_date`, `status`) VALUES
(10, 'OC Package - 1', 'sssssss', '22', NULL, 1, 3, 35, NULL, 1),
(11, 'OC Package - 2', 'sssssss', '22', NULL, 1, 3, 35, NULL, 1),
(12, 'OC Reading Package - 2', 'fffff', '23', '/images/product-1692786972.JPG', 1, 6, 35, '2023-08-24', 1);

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
(2, 11, 1, '2023-08-23', '2023-11-23'),
(3, 10, 1, '2023-08-23', '2023-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `test_series_topics`
--

CREATE TABLE `test_series_topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `t_name` varchar(40) NOT NULL,
  `tsc_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `ts_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_topics`
--

INSERT INTO `test_series_topics` (`id`, `t_name`, `tsc_id`, `status`, `ts_id`) VALUES
(4, 'set - 1', 2, 1, 1),
(5, 'set - 1', 2, 1, 1),
(7, 'Averages', 1, 1, 1),
(8, 'Averages - 2', 1, 1, 1),
(16, 'Fraction', 2, 1, 1),
(17, 'Fraction', 2, 1, 1);

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

--
-- Dumping data for table `tspc_set`
--

INSERT INTO `tspc_set` (`id`, `tspc_id`, `set_number`, `set_name`, `status`) VALUES
(4, 10, 1, 'oc Reading set - 1', 1),
(5, 11, 1, 'oc Maths set - 1', 1),
(6, 12, 1, 'oc Reading set - 1', 1),
(7, 13, 1, 'OC Reading set - 1', 1);

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
(5, 4, 4),
(6, 4, 5),
(7, 5, 4),
(8, 5, 5),
(9, 6, 7),
(10, 7, 4),
(11, 7, 5);

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
(10, 10, 2, 1),
(11, 11, 1, 1),
(12, 11, 2, 1),
(13, 12, 2, 1);

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
(1, 'Prof. Jamar Larson', 'abc88@g', '478.307.2965', NULL, '2023-08-21 04:20:58', '$2y$10$QCEu0xwUXyGHrpCqycQ/IepDGPmvpsorPF967czXnomalbkw535lS', 'yMq0J3oDZI', NULL, NULL);

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

--
-- Dumping data for table `user_test_series`
--

INSERT INTO `user_test_series` (`id`, `tsps_id`, `set_id`, `complete_status`, `start_date`, `end_date`, `time_taken`, `current_timer`, `total_marks`, `q_id`) VALUES
(1, 2, 5, 1, '23-08-2023', '23-08-2023', '-0', NULL, 0, 10),
(4, 2, 6, 1, '23-08-2023', '23-08-2023', '-0', NULL, 0, 31),
(5, 2, 6, 1, '23-08-2023', '23-08-2023', '-0', NULL, 0, 42),
(6, 2, 6, 0, '23-08-2023', NULL, NULL, '44.59', NULL, 51),
(7, 3, 4, 1, '23-08-2023', '23-08-2023', '0', NULL, 0, 61),
(8, 3, 4, 1, '23-08-2023', '23-08-2023', '0', NULL, 0, 71),
(9, 3, 4, 0, '23-08-2023', NULL, NULL, NULL, NULL, 81);

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
-- Dumping data for table `user_test_status`
--

INSERT INTO `user_test_status` (`id`, `q_id`, `status_id`, `test_answer`, `marks`, `uts_id`, `test_time`) VALUES
(1, 11, 1, '2', NULL, 1, '0'),
(2, 12, 1, '1', NULL, 1, '0'),
(3, 13, 1, '2', NULL, 1, '0'),
(4, 14, 1, '3', NULL, 1, '0'),
(5, 15, 5, '1', NULL, 1, '0'),
(6, 16, 1, '1', NULL, 1, '0'),
(7, 17, 1, '4', NULL, 1, '0'),
(8, 18, 5, '2', NULL, 1, '0'),
(9, 19, 1, '1', NULL, 1, '0'),
(10, 20, 5, '1', NULL, 1, '0'),
(31, 32, 2, NULL, NULL, 4, '0'),
(32, 27, 3, NULL, NULL, 4, '0'),
(33, 24, 3, NULL, NULL, 4, '0'),
(34, 31, 3, NULL, NULL, 4, '0'),
(35, 30, 3, NULL, NULL, 4, '0'),
(36, 33, 3, NULL, NULL, 4, '0'),
(37, 26, 3, NULL, NULL, 4, '0'),
(38, 21, 3, NULL, NULL, 4, '0'),
(39, 25, 3, NULL, NULL, 4, '0'),
(40, 22, 3, NULL, NULL, 4, '0'),
(41, 32, 2, NULL, NULL, 5, '0'),
(42, 27, 2, NULL, NULL, 5, '0'),
(43, 24, 2, NULL, NULL, 5, '0'),
(44, 31, 2, NULL, NULL, 5, '0'),
(45, 30, 2, NULL, NULL, 5, '0'),
(46, 33, 2, NULL, NULL, 5, '0'),
(47, 26, 2, NULL, NULL, 5, '0'),
(48, 21, 2, NULL, NULL, 5, '0'),
(49, 25, 2, NULL, NULL, 5, '0'),
(50, 22, 2, NULL, NULL, 5, '0'),
(51, 32, 2, NULL, NULL, 6, '0'),
(52, 27, 2, NULL, NULL, 6, '0'),
(53, 24, 2, NULL, NULL, 6, '0'),
(54, 31, 2, NULL, NULL, 6, '0'),
(55, 30, 3, NULL, NULL, 6, '0'),
(56, 33, 3, NULL, NULL, 6, '0'),
(57, 26, 3, NULL, NULL, 6, '0'),
(58, 21, 3, NULL, NULL, 6, '0'),
(59, 25, 3, NULL, NULL, 6, '0'),
(60, 22, 3, NULL, NULL, 6, '0'),
(61, 4, 1, '3', NULL, 7, '0'),
(62, 1, 2, NULL, NULL, 7, '0'),
(63, 8, 3, NULL, NULL, 7, '0'),
(64, 7, 3, NULL, NULL, 7, '0'),
(65, 3, 3, NULL, NULL, 7, '0'),
(66, 11, 3, NULL, NULL, 7, '0'),
(67, 14, 3, NULL, NULL, 7, '0'),
(68, 19, 3, NULL, NULL, 7, '0'),
(69, 16, 3, NULL, NULL, 7, '0'),
(70, 10, 3, NULL, NULL, 7, '0'),
(71, 4, 1, '2', NULL, 8, '0'),
(72, 1, 2, NULL, NULL, 8, '0'),
(73, 8, 2, NULL, NULL, 8, '0'),
(74, 7, 2, NULL, NULL, 8, '0'),
(75, 3, 3, NULL, NULL, 8, '0'),
(76, 11, 3, NULL, NULL, 8, '0'),
(77, 14, 3, NULL, NULL, 8, '0'),
(78, 19, 3, NULL, NULL, 8, '0'),
(79, 16, 3, NULL, NULL, 8, '0'),
(80, 10, 3, NULL, NULL, 8, '0'),
(81, 4, 1, '1', NULL, 9, '0'),
(82, 1, 2, NULL, NULL, 9, '0'),
(83, 8, 2, NULL, NULL, 9, '0'),
(84, 7, 3, NULL, NULL, 9, '0'),
(85, 3, 3, NULL, NULL, 9, '0'),
(86, 11, 3, NULL, NULL, 9, '0'),
(87, 14, 3, NULL, NULL, 9, '0'),
(88, 19, 3, NULL, NULL, 9, '0'),
(89, 16, 3, NULL, NULL, 9, '0'),
(90, 10, 3, NULL, NULL, 9, '0');

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `question_image`
--
ALTER TABLE `question_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `reading_question`
--
ALTER TABLE `reading_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `set_question`
--
ALTER TABLE `set_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `test_status`
--
ALTER TABLE `test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tspc_set`
--
ALTER TABLE `tspc_set`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_test_series`
--
ALTER TABLE `user_test_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_test_status`
--
ALTER TABLE `user_test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

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
