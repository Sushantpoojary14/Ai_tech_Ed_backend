-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2023 at 12:30 PM
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

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `tsp_id`, `user_id`) VALUES
(8, 8, 2);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `image_name` varchar(40) NOT NULL,
  `image_url` varchar(150) NOT NULL,
  `tsc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image_name`, `image_url`, `tsc_id`) VALUES
(5, 'boy', '/images/boy.jpg', 3),
(6, 'car', '/images/car.jpg', 1),
(7, 'girl', '/images/girl.jpg', 3),
(8, 'men', '/images/men.jpg', 1),
(9, 'motor', '/images/motor.jpg', 1),
(10, 'ship', '/images/ship.jpg', 1),
(11, 'train', '/images/train.jpg', 1),
(12, 'Oliver', '/images/boy.jpg', 3),
(13, 'James', '/images/left_boy.jpg', 3),
(14, 'Jack', '/images/left_boy.jpg', 3),
(15, 'Thomas', '/images/left_boy.jpg', 3),
(16, 'Ella', '/images/right_girl.jpg', 3),
(17, 'Evie', '/images/girl.jpg', 3),
(18, 'Sienna', '/images/girl.jpg', 3),
(19, 'Isla', '/images/girl.jpg', 3),
(20, 'bag', '/images/bag.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `images_names`
--

CREATE TABLE `images_names` (
  `id` int(11) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `image_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `images_names`
--

INSERT INTO `images_names` (`id`, `image_id`, `image_name`) VALUES
(1, 5, 'James'),
(2, 7, 'sneha'),
(3, 5, 'car'),
(4, 11, 'train');

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

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `option_5`, `correct_option`, `explanation`, `tst_id`, `marks`, `status`) VALUES
(1, 'A recipe calls for 1/2 cup of flour. If you want to make half of the recipe, how much flour do you need?', '1/4 cup', '1/2 cup', '1 cup', '2 cups', NULL, '1', 'If a recipe calls for 1/2 cup of flour and you want to make half of the recipe, you need 1/4 cup of flour.', 1, NULL, 1),
(2, 'Sandy has a candy bar that is divided into 10 equal pieces. If he eats 3 pieces, what fraction of the candy bar does he have left?', '1/5', '2/5', '3/5', '4/5', NULL, '4', 'Solution: Since there are 10 pieces in total and Sandy eats 3 pieces, he has 10 - 3 = 7 pieces left. Therefore, the fraction of the candy bar he has left is 7/10.', 1, NULL, 1),
(3, 'A rectangle is divided into 12 equal parts. If 9 parts are shaded, what fraction of the rectangle is shaded?', '1/2', '2/3', '3/4', '3/2', NULL, '2', 'If 9 out of 12 parts are shaded, the fraction of the rectangle that is shaded is 9/12, which simplifies to 3/4.', 1, NULL, 1),
(4, 'Linda won 5/6 of the total prize money in a contest. What fraction of the prize money did the other contestants win?', '1/6', '1/3', '1/4', '1/2', NULL, '1', 'To find the fraction of the prize money won by the other contestants, we need to subtract Linda\'s fraction (5/6) from 1. 1 - 5/6 = 1/6.', 1, NULL, 1),
(5, 'Sara finished reading 4/5 of a book. How much of the book does she have left to read?', '1/5', '2/5', '3/5', '4/5', NULL, '1', 'Finishing 4/5 of the book means she has 1/5 of the book left to read.', 1, NULL, 1),
(6, 'A pizza pie is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pie remains?', '5/8', '3/8', '1/8', '2/8', NULL, '2', 'If 3 slices are eaten, there are 8 - 3 = 5 slices remaining. The fraction of the pie that remains is 5/8.', 1, NULL, 1),
(7, 'Sally bought a cake and ate 3/4 of it. If the cake originally weighed 1.5 kg, how much cake did Sally eat?', '0.2 kg', '0.8 kg', '1 kg', '1.2 kg', NULL, '2', 'If Sally ate 3/4 of a cake that originally weighed 1.5 kg, she ate 0.8 kg of cake.', 1, NULL, 1),
(8, 'If a pizza is divided into 8 equal slices and you eat 3 slices, what fraction of the pizza have you eaten?', '1/2', '3/16', '3/8', '2/3', NULL, '3', 'Eating 3 slices out of 8 is equivalent to eating 3/8 of the pizza.', 1, NULL, 1),
(9, 'A tank is filled with 15 liters of water. If 2/5 of the water is drained, how many liters of water are left in the tank?', '3', '6', '9', '12', NULL, '2', 'To find the answer, we need to subtract 2/5 of 15 liters from 15. This gives us 6 liters, which is the amount of water left in the tank.', 1, NULL, 1),
(10, 'A group of friends ordered 3 large pizzas to share. Each pizza was cut into 8 equal slices. If each person had 2 slices, what fraction of the pizzas remained?', '3/16', '1/4', '5/16', '7/16', NULL, '4', 'Solution: There were a total of 24 slices (3 x 8) and each person had 2 slices which means 8 people were served. The remaining slices are 24 - (2 x 8) = 24 - 16 = 8. The fraction representing the remaining slices is 8/24 which simplifies to 1/3 or 7/16.', 1, NULL, 1),
(11, 'A bag contains 12 red marbles and 8 green marbles. What fraction of the marbles are red?', '3/4', '2/3', '3/5', '5/8', NULL, '1', 'Solution: The total number of marbles is 12 + 8 = 20. The fraction of red marbles is 12/20, which can be simplified to 3/5.', 1, NULL, 1),
(12, 'If Amy has 3/5 of a pizza and Sam has 2/5 of the same pizza, what fraction of the pizza do they have in total?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'By adding 3/5 and 2/5, we get a total of 5/5, which is equal to the whole pizza.', 1, NULL, 1),
(13, 'What is the value of 3/4 divided by 2/3?', '1/2', '3/8', '9/8', '8/9', NULL, '3', 'To divide fractions, we need to multiply the first fraction by the reciprocal of the second fraction. So, (3/4) / (2/3) becomes (3/4) * (3/2) = 9/8.', 1, NULL, 1),
(14, 'If 3/4 of a pizza is left, what fraction of the pizza has been eaten?', '1/4', '1/3', '1/2', '3/5', NULL, '3', 'To find the fraction that has been eaten, subtract the fraction that is left from 1 (whole). In this case, 1 - 3/4 = 1/4. Therefore, 3/4 of the pizza has been eaten.', 1, NULL, 1),
(15, 'There are 20 students in a class, and 3/5 of them are girls. How many boys are there in the class?', '4', '6', '8', '12', NULL, '3', 'If 3/5 of the students in a class are girls, then 2/5 of the students are boys. If there are 20 students in total, there are 8 boys in the class.', 1, NULL, 1),
(16, 'Simplify the fraction 16/24.', '2/3', '3/4', '4/5', '5/6', NULL, '1', 'To simplify a fraction, the numerator and denominator can be divided by their greatest common factor (GCF).', 1, NULL, 1),
(17, 'If a pizza is divided into 8 equal slices, and 3 slices are eaten, what fraction of the pizza remains?', '1/5', '1/3', '3/8', '5/8', NULL, '4', 'If 3 out of 8 slices are eaten, 5/8 of the pizza remains.', 1, NULL, 1),
(18, 'What is the equivalent fraction of 5/10?', '1/5', '3/10', '1/2', '2/5', NULL, '3', '5/10 is equivalent to 1/2.', 1, NULL, 1),
(19, 'Which fraction is greater: 2/3 or 3/4?', '2/3', '3/4', 'They are equal', 'Cannot be determined', NULL, '2', 'To compare fractions with different denominators, find a common denominator. In this case, the common denominator is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Comparing 8/12 and 9/12, we can see that 3/4 is greater than 2/3.', 1, NULL, 1),
(20, 'What is the fraction equivalent to 0.75?', '3/4', '1/2', '4/3', '1/3', NULL, '1', 'To convert a decimal to a fraction, the decimal can be written as the numerator and a power of 10 as the denominator.', 1, NULL, 1),
(21, 'A recipe calls for 2/3 cup of sugar. If Laura only has 1/4 cup of sugar, what fraction of the required sugar does she have?', '1/4', '2/7', '1/6', '4/7', NULL, '2', 'To find the fraction of the required sugar that Laura has, we need to divide the amount she has (1/4 cup) by the required amount (2/3 cup). So, (1/4 cup) / (2/3 cup) = (1/4 cup) * (3/2 cup) = 3/8. Therefore, she has 2/7 of the required sugar.', 1, NULL, 1),
(22, 'If a basketball team scores 4/5 of their shots, what fraction of shots do they miss?', '1/5', '1/4', '1/3', '2/5', NULL, '1', 'To find the fraction of shots missed, we subtract the fraction of shots made (4/5) from 1, which gives us 1 - 4/5 = 1/5. So, they miss 1/5 of their shots.', 1, NULL, 1),
(23, 'Emily spent 3/10 of her money on a new book. If she had $50 before buying the book, how much money does she have left?', '$20', '$25', '$30', '$35', NULL, '3', 'To find the answer, we need to multiply $50 by 3/10 and then subtract the result from $50. This gives us $30, which is the amount of money Emily has left.', 1, NULL, 1),
(24, 'What fraction is equivalent to 0.6?', '1/2', '2/3', '3/5', '6/10', NULL, '4', 'To convert a decimal to a fraction, place the decimal number over a power of 10. In this case, 0.6 can be expressed as 6/10, which is equivalent to 3/5.', 1, NULL, 1),
(25, 'What is 3/8 as a decimal?', '0.25', '0.3', '0.375', '0.4', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 8 equals 0.375.', 1, NULL, 1),
(26, 'What is the result of adding 2/3 and 1/4?', '3/7', '4/7', '5/7', '6/7', NULL, '2', 'To add fractions with different denominators, find a common denominator. In this case, the common denominator of 3 and 4 is 12. Then, convert both fractions to have the same denominator. 2/3 becomes 8/12 and 1/4 becomes 3/12. Lastly, add the numerators: 8/12 + 3/12 = 11/12, which simplifies to 4/7.', 1, NULL, 1),
(27, 'The length of a rectangle is 12 cm and its width is 3 cm. What is the fraction representing the ratio of the width to the length?', '3/12', '1/4', '4/1', '12/3', NULL, '2', 'Solution: The fraction representing the ratio of the width to the length is 3/12 which simplifies to 1/4.', 1, NULL, 1),
(28, 'Which fraction is greater: 3/4 or 2/3?', '3/4', '2/3', 'Equal', 'Cannot be determined', NULL, '2', '2/3 is greater than 3/4.', 1, NULL, 1),
(29, 'James baked a cake using a recipe that calls for 1 1/2 cups of flour. If he wants to make half of the recipe, how many cups of flour does he need?', '3/4', '1/2', '1/4', '1/8', NULL, '1', 'To make half of the recipe, James needs to divide the amount of flour by 2, which is (1 1/2) / 2 = 3/4 cup of flour.', 1, NULL, 1),
(30, 'If a pizza is divided into 8 equal slices and you eat 3 of them, what fraction of the pizza have you eaten?', '1/4', '3/8', '3/5', '3/8', NULL, '2', 'If a pizza is divided into 8 equal slices and you eat 3 of them, you have eaten 3/8 of the pizza.', 1, NULL, 1),
(31, 'A recipe calls for 3/4 cup of sugar. If you want to halve the recipe, how much sugar should you use?', '1/4 cup', '1/2 cup', '1 cup', '1 1/2 cups', NULL, '1', 'Solution: Halving the recipe means using half the amount of each ingredient. Half of 3/4 cup is 3/4 x 1/2 = 3/8 cup. Therefore, you should use 1/4 cup of sugar.', 1, NULL, 1),
(32, 'What is 1/2 of 3/4?', '1/4', '3/8', '5/8', '3/4', NULL, '2', '1/2 of 3/4 is equal to 3/8.', 1, NULL, 1),
(33, 'A class has 30 students, out of which 3/5 are boys. How many boys are there in the class?', '10', '12', '15', '18', NULL, '4', 'To find the number of boys in the class, we multiply the total number of students by the fraction representing the proportion of boys (3/5). So, (3/5) * 30 = 18. Therefore, there are 18 boys in the class.', 1, NULL, 1),
(34, 'A baker had 6 cups of flour. He used 2/3 of it to make bread. How many cups of flour did the baker use?', '2', '3', '4', '5', NULL, '3', 'To find the answer, we need to multiply 6 cups of flour by 2/3. This gives us 4 cups, which is the amount of flour the baker used.', 1, NULL, 1),
(35, 'The numerator of a fraction is 4 less than the denominator. If the fraction is simplified to its lowest form, what is the ratio of the numerator to the denominator?', '1:2', '1:3', '1:4', '1:5', NULL, '3', 'Let the denominator of the fraction be D. According to the given condition, the numerator becomes D-4. As the fraction is simplified to its lowest form, there are no common factors between the numerator and denominator. Therefore, the ratio of the numerator to the denominator is 1:4.', 1, NULL, 1),
(36, 'If 2/3 of a cupcake recipe requires 1/2 cup of sugar, how much sugar is needed for the whole recipe?', '1/8', '1/4', '3/4', '1', NULL, '4', 'The whole cupcake recipe requires the amount of sugar for 2/3 which is equal to (2/3) * (1/2) = 1/3 cup of sugar.', 1, NULL, 1),
(37, 'A tank contains 60 liters of water. If 3/5 of the water is used, how many liters of water are left?', '12 liters', '18 liters', '24 liters', '36 liters', NULL, '2', 'Solution: If 3/5 of 60 liters of water is used, then the amount of water left is (1 - 3/5) * 60 = 2/5 * 60 = 24 liters.', 1, NULL, 1),
(38, 'What is 2/3 of 1/4?', '1/3', '1/2', '1/8', '3/4', NULL, '3', 'To find 2/3 of 1/4, multiply them together. (2/3) x (1/4) = 2/12 = 1/6.', 1, NULL, 1),
(39, 'A recipe calls for 2/3 cup of milk. If you want to make 1 1/2 times the recipe, how much milk do you need?', '3/4', '1', '1 1/4', '1 1/2', NULL, '3', 'To find the amount of milk needed for 1 1/2 times the recipe, multiply the amount for 1 recipe by 1 1/2, which is (2/3) * (3/2) = 6/9 = 2/3 + 2/3 + 2/3 = 6/9 = 2/3 cup of milk.', 1, NULL, 1),
(40, 'If 3/4 of a number is 15, what is the number?', '5', '12', '16', '20', NULL, '2', 'To find the number, divide 15 by 3/4. 15 ÷ (3/4) = 15 x (4/3) = 60/3 = 20.', 1, NULL, 1),
(41, 'What is the fraction of shaded squares out of the total squares in the figure below?', '1/2', '2/5', '3/4', '4/7', NULL, '3', 'To find the fraction of shaded squares, we need to compare the number of shaded squares to the total number of squares. In this figure, there are 3 shaded squares out of the total of 4 squares, so the fraction is 3/4.', 1, NULL, 1),
(42, 'Sara has 3/5 of a pizza and John has 1/3 of a pizza. What fraction of the pizza do they have together?', '2/5', '7/15', '4/15', '7/10', NULL, '2', 'To find the fraction of the pizza they have together, we need to find the common denominator for 5 and 3, which is 15. Sara has (3/5) * 15/15 = 9/15 of the pizza, and John has (1/3) * 15/15 = 5/15 of the pizza. Together, they have 9/15 + 5/15 = 14/15 of the pizza.', 1, NULL, 1),
(43, 'The sum of two fractions is 3/5. If one fraction is 1/3, what is the other fraction?', '2/5', '1/5', '1/15', '3/8', NULL, '1', 'To find the other fraction, subtract 1/3 from 3/5. 3/5 - 1/3 = 2/5.', 1, NULL, 1),
(44, 'Which fraction is equivalent to 3/5?', '4/6', '2/4', '6/10', '1/3', NULL, '3', 'To find an equivalent fraction, multiply both the numerator and denominator by the same number. Multiplying 3/5 by 2 gives 6/10, which reduces to 3/5.', 1, NULL, 1),
(45, 'If a fraction is in its simplest form, what is the greatest common factor (GCF) of its numerator and denominator?', '1', '2', '3', '4', NULL, '1', 'If a fraction is in its simplest form, it means that the numerator and denominator have no common factors other than 1.', 1, NULL, 1),
(46, 'Simplify the fraction 9/12.', '3/4', '2/3', '1/2', '4/9', NULL, '2', 'To simplify 9/12, divide both the numerator and denominator by their greatest common factor, which is 3. 9/12 ÷ 3/3 = 3/4.', 1, NULL, 1),
(47, 'A recipe calls for 3/4 cup of sugar. If John wants to make half of the recipe, how much sugar does he need?', '1/4 cup', '3/8 cup', '1/2 cup', '5/8 cup', NULL, '2', 'Solution: If John wants to make half of the recipe, he needs half of 3/4 cup of sugar, which is (1/2) * (3/4) = 3/8 cup.', 1, NULL, 1),
(48, 'What is the simplified form of 2/4?', '1/4', '1/2', '3/4', '3/2', NULL, '2', 'To simplify the fraction 2/4, divide both the numerator and the denominator by their greatest common divisor, which is 2. Therefore, the simplified form of 2/4 is 1/2.', 1, NULL, 1),
(49, 'John saved 1/3 of his monthly salary. If his salary was $1200, how much money did he save?', '$200', '$400', '$600', '$800', NULL, '3', 'Saving 1/3 of $1200 is equivalent to saving $400.', 1, NULL, 1),
(50, 'A car covered 3/5 of a distance in 2 hours. How long would it take to cover the remaining distance if it maintains the same speed?', '1 hour', '1.5 hours', '2.5 hours', '3 hours', NULL, '4', 'Solution: If the car covered 3/5 of the distance in 2 hours, then it covered 1 - 3/5 = 2/5 of the distance in the remaining time. Let\'s call the required time as x hours. Setting up a proportion, we have (2/5) / 2 = (2/5 + 2/x). Solving for x, we get x = 3. Therefore, it would take the car 3 hours to cover the remaining distance.', 1, NULL, 1),
(51, 'Sara has 6/8 cup of milk. How much more milk does she need to make 1 full cup?', '1/8', '1/4', '2/8', '3/8', NULL, '1', 'To find how much more milk Sara needs to make 1 full cup, we need to subtract the fraction she already has (6/8) from 1. 1 - 6/8 = 1/8.', 1, NULL, 1),
(52, 'What is 3/4 as a decimal?', '0.25', '0.5', '0.75', '1', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 4 is 0.75.', 1, NULL, 1),
(53, 'What is the fraction equivalent of 0.75?', '1/4', '1/2', '3/4', '1', NULL, '3', '0.75 is equivalent to 3/4.', 1, NULL, 1),
(54, 'What is the result of adding 1/3 and 2/5?', '5/8', '11/15', '7/10', '3/8', NULL, '3', 'To add fractions with different denominators, find a common denominator. The common denominator for 1/3 and 2/5 is 15. Therefore, 1/3 + 2/5 = (5/15) + (6/15) = 7/15.', 1, NULL, 1),
(55, 'Alex had a pie divided into 8 equal slices. If Alex ate 3/8 of the pie, how many slices did he eat?', '1', '2', '3', '4', NULL, '4', 'To find the number of slices Alex ate, multiply the total number of slices by the fraction of the pie he ate, which is 8 slices * (3/8) = 24/8 = 3 slices.', 1, NULL, 1),
(56, 'A pizza is divided into 8 equal slices. John ate 3/8 of the pizza. How many slices are left?', '1', '2', '3', '4', NULL, '4', 'John ate 3 out of 8 slices, so the remaining slices are 8 minus 3, which equals 5. Therefore, 4 slices are left.', 1, NULL, 1),
(57, 'Julia saved 5/8 of her monthly salary and spent the rest on bills and groceries. If she spent 3/10 of her monthly salary, what fraction of her salary did she save?', '2/5', '1/2', '3/8', '5/8', NULL, '3', 'Solution: The fraction of her salary that she saved is 1 - 3/10 = 7/10. Therefore, she saved 7/10 of her monthly salary.', 1, NULL, 1),
(58, 'Which fraction is greater: 4/7 or 3/5?', '4/7', '3/5', 'They are equal.', 'Cannot be determined with the given information.', NULL, '2', 'To compare fractions with different denominators, find a common denominator. The common denominator for 4/7 and 3/5 is 35. Therefore, converting both fractions to have a denominator of 35, 4/7 becomes 20/35 and 3/5 becomes 21/35. Since 21/35 is greater than 20/35, 3/5 is the greater fraction.', 1, NULL, 1),
(59, 'What is the result of adding 1/3 and 1/4?', '2/5', '7/12', '1/7', '1/12', NULL, '2', 'To add fractions with different denominators, find the least common multiple (LCM) of the denominators. In this case, the LCM of 3 and 4 is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Adding 1/3 and 1/4 results in 7/12.', 1, NULL, 1),
(60, 'John ate 3/4 of a pizza. What fraction of the pizza is left?', '1/4', '1/3', '1/2', '2/3', NULL, '1', 'To find the fraction of the pizza that is left, we need to subtract the fraction that John ate (3/4) from 1. 1 - 3/4 = 1/4.', 1, NULL, 1),
(61, 'If a recipe calls for 2/3 cup of sugar but you only have 1/4 cup, what fraction of the required sugar do you have?', '1/2', '1/3', '1/4', '1/6', NULL, '2', 'To find the fraction of the required sugar that you have, you divide the amount you have (1/4) by the required amount (2/3). So, 1/4 ÷ 2/3 = 1/4 x 3/2 = 3/8. Therefore, you have 1/3 of the required sugar.', 1, NULL, 1),
(62, 'Sara cuts a cake into 6 equal slices and eats 2 slices. What fraction of the cake did she eat?', '1/6', '2/6', '3/6', '4/6', NULL, '3', 'If Sara eats 2 out of 6 slices, the fraction of the cake she ate is 2/6.', 1, NULL, 1),
(63, 'Which of the following fractions is greater than 1/2?', '2/3', '3/4', '1/3', '4/5', NULL, '2', 'To compare fractions, if the numerators are the same, the fraction with the smaller denominator is greater.', 1, NULL, 1),
(64, 'A pizza is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pizza is left?', '1/8', '3/8', '5/8', '7/8', NULL, '4', 'Solution: Since the pizza was divided into 8 slices and 3 slices were eaten, there are 8 - 3 = 5 slices left. Therefore, the fraction of the pizza that is left is 5/8.', 1, NULL, 1),
(65, 'If a tank is filled with 3/4 of its capacity, what fraction of the tank is empty?', '1/4', '1/3', '1/2', '2/3', NULL, '4', 'To find the fraction of the tank that is empty, we subtract the fraction that is full (3/4) from 1, which gives us 1 - 3/4 = 1/4. So, 2/3 of the tank is empty.', 1, NULL, 1),
(66, 'Which fraction is equivalent to 4/5?', '1/2', '2/4', '8/10', '10/12', NULL, '3', 'To find an equivalent fraction, multiply or divide the numerator and denominator by the same number. In this case, dividing both 4 and 8 by 2 gives the fraction 8/10, which is equivalent to 4/5.', 1, NULL, 1),
(67, 'A group of friends shared a pizza with 10 equal slices. If each friend had 2 slices, how many friends were there in the group?', '3', '4', '5', '6', NULL, '4', 'If each friend had 2 slices and there were 10 slices in total, then there were 10/2 = 5 friends in the group.', 1, NULL, 1),
(68, 'Sarah has 12 marbles and she gives 1/4 of them to her friend. How many marbles does Sarah give to her friend?', '1', '2', '3', '4', NULL, '3', 'If Sarah has 12 marbles and she gives 1/4 of them to her friend, she gives 3 marbles to her friend.', 1, NULL, 1),
(69, 'A certain pizza recipe calls for 3/4 cup of flour. If you want to make 4 pizzas, how many cups of flour do you need?', '1/3', '1', '2', '3', NULL, '3', 'To make 4 pizzas, you need to multiply the amount of flour for 1 pizza by 4, which is (3/4) * 4 = 3 cups of flour.', 1, NULL, 1),
(70, 'If a cake is divided into 8 equal slices and John eats 3/8 of a slice, how many whole slices of cake does he eat?', '1/2', '1', '1 1/2', '2', NULL, '1', 'By dividing 3/8 by 1/8 (the size of one whole slice), we get 3/8 ÷ 1/8 = 3. John eats 3 whole slices.', 1, NULL, 1),
(71, 'A glass is filled to 3/4 of its capacity. If there are 400 ml of liquid in the glass, what is its total capacity?', '400 ml', '600 ml', '800 ml', '1200 ml', NULL, '3', 'If 3/4 of the capacity is equal to 400 ml, then the total capacity is 400 ml * (4/3) = 800 ml.', 1, NULL, 1),
(72, 'A recipe calls for 2/3 cup of sugar. If Lucy wants to make 4 times the recipe, how much sugar does she need?', '1 cup', '1 and 1/3 cups', '1 and 1/2 cups', '2 cups', NULL, '2', 'To find the answer, we need to multiply 2/3 cup by 4. This gives us 8/3 or 2 and 2/3 cups of sugar needed for the recipe.', 1, NULL, 1),
(73, 'A recipe calls for 3/4 cup of sugar, but John only has 1/2 cup. How much more sugar does he need?', '1/4', '1/3', '1/8', '1/6', NULL, '1', 'To find how much more sugar John needs, we need to subtract the fraction he already has (1/2) from the required fraction (3/4). 3/4 - 1/2 = 1/4.', 1, NULL, 1),
(74, 'What is 30% expressed as a fraction in simplest form?', '1/30', '3/10', '3/30', '10/3', NULL, '2', 'To convert a percentage to a fraction, divide the percentage by 100 and simplify. In this case, 30% becomes 30/100, which simplifies to 3/10.', 1, NULL, 1),
(75, 'Which of the following fractions is equivalent to 2/5?', '1/3', '3/5', '4/10', '5/8', NULL, '3', 'To find equivalent fractions, multiply or divide the numerator and denominator by the same number. In this case, multiplying 2 and 5 by 2 gives the fraction 4/10, which is equivalent to 2/5.', 1, NULL, 1),
(76, 'If a rope is 3/4 meters long and you cut off 1/6 meters from it, how long is the remaining rope?', '1/2 meters', '1/3 meters', '1/4 meters', '5/12 meters', NULL, '4', 'Cutting off 1/6 meters from a rope that is 3/4 meters long leaves 5/12 meters of the rope remaining.', 1, NULL, 1),
(77, 'Which fraction is equivalent to 3/5?', '1/5', '2/10', '4/5', '6/5', NULL, '2', 'To find an equivalent fraction, multiply or divide both the numerator and the denominator of the given fraction by the same non-zero number. In this case, multiplying 3/5 by 2/2, we get 6/10, which is equivalent to 3/5.', 1, NULL, 1),
(78, 'If 2/5 of a bucket of water is poured out, what fraction of the water remains?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'If 2/5 of the water is poured out, 3/5 of the water remains.', 1, NULL, 1),
(79, 'What is 2/5 of 40?', '8', '10', '16', '20', NULL, '4', 'To find a fraction of a whole number, multiply the whole number by the numerator and divide by the denominator. In this case, (2/5) * 40 = (2 * 40) / 5 = 80 / 5 = 16. Therefore, 2/5 of 40 is 16.', 1, NULL, 1),
(80, 'Which of the following fractions is equivalent to 1/2?', '3/4', '2/3', '4/5', '5/10', NULL, '4', 'To find an equivalent fraction, the numerator and denominator of the original fraction can be multiplied or divided by the same number.', 1, NULL, 1),
(81, 'A recipe calls for 1/2 cup of flour. If you want to make half of the recipe, how much flour do you need?', '1/4 cup', '1/2 cup', '1 cup', '2 cups', NULL, '1', 'If a recipe calls for 1/2 cup of flour and you want to make half of the recipe, you need 1/4 cup of flour.', 2, NULL, 1),
(82, 'Sandy has a candy bar that is divided into 10 equal pieces. If he eats 3 pieces, what fraction of the candy bar does he have left?', '1/5', '2/5', '3/5', '4/5', NULL, '4', 'Solution: Since there are 10 pieces in total and Sandy eats 3 pieces, he has 10 - 3 = 7 pieces left. Therefore, the fraction of the candy bar he has left is 7/10.', 2, NULL, 1),
(83, 'A rectangle is divided into 12 equal parts. If 9 parts are shaded, what fraction of the rectangle is shaded?', '1/2', '2/3', '3/4', '3/2', NULL, '2', 'If 9 out of 12 parts are shaded, the fraction of the rectangle that is shaded is 9/12, which simplifies to 3/4.', 2, NULL, 1),
(84, 'Linda won 5/6 of the total prize money in a contest. What fraction of the prize money did the other contestants win?', '1/6', '1/3', '1/4', '1/2', NULL, '1', 'To find the fraction of the prize money won by the other contestants, we need to subtract Linda\'s fraction (5/6) from 1. 1 - 5/6 = 1/6.', 2, NULL, 1),
(85, 'Sara finished reading 4/5 of a book. How much of the book does she have left to read?', '1/5', '2/5', '3/5', '4/5', NULL, '1', 'Finishing 4/5 of the book means she has 1/5 of the book left to read.', 2, NULL, 1),
(86, 'A pizza pie is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pie remains?', '5/8', '3/8', '1/8', '2/8', NULL, '2', 'If 3 slices are eaten, there are 8 - 3 = 5 slices remaining. The fraction of the pie that remains is 5/8.', 2, NULL, 1),
(87, 'Sally bought a cake and ate 3/4 of it. If the cake originally weighed 1.5 kg, how much cake did Sally eat?', '0.2 kg', '0.8 kg', '1 kg', '1.2 kg', NULL, '2', 'If Sally ate 3/4 of a cake that originally weighed 1.5 kg, she ate 0.8 kg of cake.', 2, NULL, 1),
(88, 'If a pizza is divided into 8 equal slices and you eat 3 slices, what fraction of the pizza have you eaten?', '1/2', '3/16', '3/8', '2/3', NULL, '3', 'Eating 3 slices out of 8 is equivalent to eating 3/8 of the pizza.', 2, NULL, 1),
(89, 'A tank is filled with 15 liters of water. If 2/5 of the water is drained, how many liters of water are left in the tank?', '3', '6', '9', '12', NULL, '2', 'To find the answer, we need to subtract 2/5 of 15 liters from 15. This gives us 6 liters, which is the amount of water left in the tank.', 2, NULL, 1),
(90, 'A group of friends ordered 3 large pizzas to share. Each pizza was cut into 8 equal slices. If each person had 2 slices, what fraction of the pizzas remained?', '3/16', '1/4', '5/16', '7/16', NULL, '4', 'Solution: There were a total of 24 slices (3 x 8) and each person had 2 slices which means 8 people were served. The remaining slices are 24 - (2 x 8) = 24 - 16 = 8. The fraction representing the remaining slices is 8/24 which simplifies to 1/3 or 7/16.', 2, NULL, 1),
(91, 'A bag contains 12 red marbles and 8 green marbles. What fraction of the marbles are red?', '3/4', '2/3', '3/5', '5/8', NULL, '1', 'Solution: The total number of marbles is 12 + 8 = 20. The fraction of red marbles is 12/20, which can be simplified to 3/5.', 2, NULL, 1),
(92, 'If Amy has 3/5 of a pizza and Sam has 2/5 of the same pizza, what fraction of the pizza do they have in total?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'By adding 3/5 and 2/5, we get a total of 5/5, which is equal to the whole pizza.', 2, NULL, 1),
(93, 'What is the value of 3/4 divided by 2/3?', '1/2', '3/8', '9/8', '8/9', NULL, '3', 'To divide fractions, we need to multiply the first fraction by the reciprocal of the second fraction. So, (3/4) / (2/3) becomes (3/4) * (3/2) = 9/8.', 2, NULL, 1),
(94, 'If 3/4 of a pizza is left, what fraction of the pizza has been eaten?', '1/4', '1/3', '1/2', '3/5', NULL, '3', 'To find the fraction that has been eaten, subtract the fraction that is left from 1 (whole). In this case, 1 - 3/4 = 1/4. Therefore, 3/4 of the pizza has been eaten.', 2, NULL, 1),
(95, 'There are 20 students in a class, and 3/5 of them are girls. How many boys are there in the class?', '4', '6', '8', '12', NULL, '3', 'If 3/5 of the students in a class are girls, then 2/5 of the students are boys. If there are 20 students in total, there are 8 boys in the class.', 2, NULL, 1),
(96, 'Simplify the fraction 16/24.', '2/3', '3/4', '4/5', '5/6', NULL, '1', 'To simplify a fraction, the numerator and denominator can be divided by their greatest common factor (GCF).', 2, NULL, 1),
(97, 'If a pizza is divided into 8 equal slices, and 3 slices are eaten, what fraction of the pizza remains?', '1/5', '1/3', '3/8', '5/8', NULL, '4', 'If 3 out of 8 slices are eaten, 5/8 of the pizza remains.', 2, NULL, 1),
(98, 'What is the equivalent fraction of 5/10?', '1/5', '3/10', '1/2', '2/5', NULL, '3', '5/10 is equivalent to 1/2.', 2, NULL, 1),
(99, 'Which fraction is greater: 2/3 or 3/4?', '2/3', '3/4', 'They are equal', 'Cannot be determined', NULL, '2', 'To compare fractions with different denominators, find a common denominator. In this case, the common denominator is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Comparing 8/12 and 9/12, we can see that 3/4 is greater than 2/3.', 2, NULL, 1),
(100, 'What is the fraction equivalent to 0.75?', '3/4', '1/2', '4/3', '1/3', NULL, '1', 'To convert a decimal to a fraction, the decimal can be written as the numerator and a power of 10 as the denominator.', 2, NULL, 1),
(101, 'A recipe calls for 2/3 cup of sugar. If Laura only has 1/4 cup of sugar, what fraction of the required sugar does she have?', '1/4', '2/7', '1/6', '4/7', NULL, '2', 'To find the fraction of the required sugar that Laura has, we need to divide the amount she has (1/4 cup) by the required amount (2/3 cup). So, (1/4 cup) / (2/3 cup) = (1/4 cup) * (3/2 cup) = 3/8. Therefore, she has 2/7 of the required sugar.', 2, NULL, 1),
(102, 'If a basketball team scores 4/5 of their shots, what fraction of shots do they miss?', '1/5', '1/4', '1/3', '2/5', NULL, '1', 'To find the fraction of shots missed, we subtract the fraction of shots made (4/5) from 1, which gives us 1 - 4/5 = 1/5. So, they miss 1/5 of their shots.', 2, NULL, 1),
(103, 'Emily spent 3/10 of her money on a new book. If she had $50 before buying the book, how much money does she have left?', '$20', '$25', '$30', '$35', NULL, '3', 'To find the answer, we need to multiply $50 by 3/10 and then subtract the result from $50. This gives us $30, which is the amount of money Emily has left.', 2, NULL, 1),
(104, 'What fraction is equivalent to 0.6?', '1/2', '2/3', '3/5', '6/10', NULL, '4', 'To convert a decimal to a fraction, place the decimal number over a power of 10. In this case, 0.6 can be expressed as 6/10, which is equivalent to 3/5.', 2, NULL, 1),
(105, 'What is 3/8 as a decimal?', '0.25', '0.3', '0.375', '0.4', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 8 equals 0.375.', 2, NULL, 1),
(106, 'What is the result of adding 2/3 and 1/4?', '3/7', '4/7', '5/7', '6/7', NULL, '2', 'To add fractions with different denominators, find a common denominator. In this case, the common denominator of 3 and 4 is 12. Then, convert both fractions to have the same denominator. 2/3 becomes 8/12 and 1/4 becomes 3/12. Lastly, add the numerators: 8/12 + 3/12 = 11/12, which simplifies to 4/7.', 2, NULL, 1),
(107, 'The length of a rectangle is 12 cm and its width is 3 cm. What is the fraction representing the ratio of the width to the length?', '3/12', '1/4', '4/1', '12/3', NULL, '2', 'Solution: The fraction representing the ratio of the width to the length is 3/12 which simplifies to 1/4.', 2, NULL, 1),
(108, 'Which fraction is greater: 3/4 or 2/3?', '3/4', '2/3', 'Equal', 'Cannot be determined', NULL, '2', '2/3 is greater than 3/4.', 2, NULL, 1),
(109, 'James baked a cake using a recipe that calls for 1 1/2 cups of flour. If he wants to make half of the recipe, how many cups of flour does he need?', '3/4', '1/2', '1/4', '1/8', NULL, '1', 'To make half of the recipe, James needs to divide the amount of flour by 2, which is (1 1/2) / 2 = 3/4 cup of flour.', 2, NULL, 1),
(110, 'If a pizza is divided into 8 equal slices and you eat 3 of them, what fraction of the pizza have you eaten?', '1/4', '3/8', '3/5', '3/8', NULL, '2', 'If a pizza is divided into 8 equal slices and you eat 3 of them, you have eaten 3/8 of the pizza.', 2, NULL, 1),
(111, 'A recipe calls for 3/4 cup of sugar. If you want to halve the recipe, how much sugar should you use?', '1/4 cup', '1/2 cup', '1 cup', '1 1/2 cups', NULL, '1', 'Solution: Halving the recipe means using half the amount of each ingredient. Half of 3/4 cup is 3/4 x 1/2 = 3/8 cup. Therefore, you should use 1/4 cup of sugar.', 2, NULL, 1),
(112, 'What is 1/2 of 3/4?', '1/4', '3/8', '5/8', '3/4', NULL, '2', '1/2 of 3/4 is equal to 3/8.', 2, NULL, 1),
(113, 'A class has 30 students, out of which 3/5 are boys. How many boys are there in the class?', '10', '12', '15', '18', NULL, '4', 'To find the number of boys in the class, we multiply the total number of students by the fraction representing the proportion of boys (3/5). So, (3/5) * 30 = 18. Therefore, there are 18 boys in the class.', 2, NULL, 1),
(114, 'A baker had 6 cups of flour. He used 2/3 of it to make bread. How many cups of flour did the baker use?', '2', '3', '4', '5', NULL, '3', 'To find the answer, we need to multiply 6 cups of flour by 2/3. This gives us 4 cups, which is the amount of flour the baker used.', 2, NULL, 1),
(115, 'The numerator of a fraction is 4 less than the denominator. If the fraction is simplified to its lowest form, what is the ratio of the numerator to the denominator?', '1:2', '1:3', '1:4', '1:5', NULL, '3', 'Let the denominator of the fraction be D. According to the given condition, the numerator becomes D-4. As the fraction is simplified to its lowest form, there are no common factors between the numerator and denominator. Therefore, the ratio of the numerator to the denominator is 1:4.', 2, NULL, 1),
(116, 'If 2/3 of a cupcake recipe requires 1/2 cup of sugar, how much sugar is needed for the whole recipe?', '1/8', '1/4', '3/4', '1', NULL, '4', 'The whole cupcake recipe requires the amount of sugar for 2/3 which is equal to (2/3) * (1/2) = 1/3 cup of sugar.', 2, NULL, 1),
(117, 'A tank contains 60 liters of water. If 3/5 of the water is used, how many liters of water are left?', '12 liters', '18 liters', '24 liters', '36 liters', NULL, '2', 'Solution: If 3/5 of 60 liters of water is used, then the amount of water left is (1 - 3/5) * 60 = 2/5 * 60 = 24 liters.', 2, NULL, 1),
(118, 'What is 2/3 of 1/4?', '1/3', '1/2', '1/8', '3/4', NULL, '3', 'To find 2/3 of 1/4, multiply them together. (2/3) x (1/4) = 2/12 = 1/6.', 2, NULL, 1),
(119, 'A recipe calls for 2/3 cup of milk. If you want to make 1 1/2 times the recipe, how much milk do you need?', '3/4', '1', '1 1/4', '1 1/2', NULL, '3', 'To find the amount of milk needed for 1 1/2 times the recipe, multiply the amount for 1 recipe by 1 1/2, which is (2/3) * (3/2) = 6/9 = 2/3 + 2/3 + 2/3 = 6/9 = 2/3 cup of milk.', 2, NULL, 1),
(120, 'If 3/4 of a number is 15, what is the number?', '5', '12', '16', '20', NULL, '2', 'To find the number, divide 15 by 3/4. 15 ÷ (3/4) = 15 x (4/3) = 60/3 = 20.', 2, NULL, 1),
(121, 'What is the fraction of shaded squares out of the total squares in the figure below?', '1/2', '2/5', '3/4', '4/7', NULL, '3', 'To find the fraction of shaded squares, we need to compare the number of shaded squares to the total number of squares. In this figure, there are 3 shaded squares out of the total of 4 squares, so the fraction is 3/4.', 2, NULL, 1),
(122, 'Sara has 3/5 of a pizza and John has 1/3 of a pizza. What fraction of the pizza do they have together?', '2/5', '7/15', '4/15', '7/10', NULL, '2', 'To find the fraction of the pizza they have together, we need to find the common denominator for 5 and 3, which is 15. Sara has (3/5) * 15/15 = 9/15 of the pizza, and John has (1/3) * 15/15 = 5/15 of the pizza. Together, they have 9/15 + 5/15 = 14/15 of the pizza.', 2, NULL, 1),
(123, 'The sum of two fractions is 3/5. If one fraction is 1/3, what is the other fraction?', '2/5', '1/5', '1/15', '3/8', NULL, '1', 'To find the other fraction, subtract 1/3 from 3/5. 3/5 - 1/3 = 2/5.', 2, NULL, 1),
(124, 'Which fraction is equivalent to 3/5?', '4/6', '2/4', '6/10', '1/3', NULL, '3', 'To find an equivalent fraction, multiply both the numerator and denominator by the same number. Multiplying 3/5 by 2 gives 6/10, which reduces to 3/5.', 2, NULL, 1),
(125, 'If a fraction is in its simplest form, what is the greatest common factor (GCF) of its numerator and denominator?', '1', '2', '3', '4', NULL, '1', 'If a fraction is in its simplest form, it means that the numerator and denominator have no common factors other than 1.', 2, NULL, 1),
(126, 'Simplify the fraction 9/12.', '3/4', '2/3', '1/2', '4/9', NULL, '2', 'To simplify 9/12, divide both the numerator and denominator by their greatest common factor, which is 3. 9/12 ÷ 3/3 = 3/4.', 2, NULL, 1),
(127, 'A recipe calls for 3/4 cup of sugar. If John wants to make half of the recipe, how much sugar does he need?', '1/4 cup', '3/8 cup', '1/2 cup', '5/8 cup', NULL, '2', 'Solution: If John wants to make half of the recipe, he needs half of 3/4 cup of sugar, which is (1/2) * (3/4) = 3/8 cup.', 2, NULL, 1),
(128, 'What is the simplified form of 2/4?', '1/4', '1/2', '3/4', '3/2', NULL, '2', 'To simplify the fraction 2/4, divide both the numerator and the denominator by their greatest common divisor, which is 2. Therefore, the simplified form of 2/4 is 1/2.', 2, NULL, 1),
(129, 'John saved 1/3 of his monthly salary. If his salary was $1200, how much money did he save?', '$200', '$400', '$600', '$800', NULL, '3', 'Saving 1/3 of $1200 is equivalent to saving $400.', 2, NULL, 1),
(130, 'A car covered 3/5 of a distance in 2 hours. How long would it take to cover the remaining distance if it maintains the same speed?', '1 hour', '1.5 hours', '2.5 hours', '3 hours', NULL, '4', 'Solution: If the car covered 3/5 of the distance in 2 hours, then it covered 1 - 3/5 = 2/5 of the distance in the remaining time. Let\'s call the required time as x hours. Setting up a proportion, we have (2/5) / 2 = (2/5 + 2/x). Solving for x, we get x = 3. Therefore, it would take the car 3 hours to cover the remaining distance.', 2, NULL, 1),
(131, 'Sara has 6/8 cup of milk. How much more milk does she need to make 1 full cup?', '1/8', '1/4', '2/8', '3/8', NULL, '1', 'To find how much more milk Sara needs to make 1 full cup, we need to subtract the fraction she already has (6/8) from 1. 1 - 6/8 = 1/8.', 2, NULL, 1),
(132, 'What is 3/4 as a decimal?', '0.25', '0.5', '0.75', '1', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 4 is 0.75.', 2, NULL, 1),
(133, 'What is the fraction equivalent of 0.75?', '1/4', '1/2', '3/4', '1', NULL, '3', '0.75 is equivalent to 3/4.', 2, NULL, 1),
(134, 'What is the result of adding 1/3 and 2/5?', '5/8', '11/15', '7/10', '3/8', NULL, '3', 'To add fractions with different denominators, find a common denominator. The common denominator for 1/3 and 2/5 is 15. Therefore, 1/3 + 2/5 = (5/15) + (6/15) = 7/15.', 2, NULL, 1),
(135, 'Alex had a pie divided into 8 equal slices. If Alex ate 3/8 of the pie, how many slices did he eat?', '1', '2', '3', '4', NULL, '4', 'To find the number of slices Alex ate, multiply the total number of slices by the fraction of the pie he ate, which is 8 slices * (3/8) = 24/8 = 3 slices.', 2, NULL, 1),
(136, 'A pizza is divided into 8 equal slices. John ate 3/8 of the pizza. How many slices are left?', '1', '2', '3', '4', NULL, '4', 'John ate 3 out of 8 slices, so the remaining slices are 8 minus 3, which equals 5. Therefore, 4 slices are left.', 2, NULL, 1),
(137, 'Julia saved 5/8 of her monthly salary and spent the rest on bills and groceries. If she spent 3/10 of her monthly salary, what fraction of her salary did she save?', '2/5', '1/2', '3/8', '5/8', NULL, '3', 'Solution: The fraction of her salary that she saved is 1 - 3/10 = 7/10. Therefore, she saved 7/10 of her monthly salary.', 2, NULL, 1),
(138, 'Which fraction is greater: 4/7 or 3/5?', '4/7', '3/5', 'They are equal.', 'Cannot be determined with the given information.', NULL, '2', 'To compare fractions with different denominators, find a common denominator. The common denominator for 4/7 and 3/5 is 35. Therefore, converting both fractions to have a denominator of 35, 4/7 becomes 20/35 and 3/5 becomes 21/35. Since 21/35 is greater than 20/35, 3/5 is the greater fraction.', 2, NULL, 1),
(139, 'What is the result of adding 1/3 and 1/4?', '2/5', '7/12', '1/7', '1/12', NULL, '2', 'To add fractions with different denominators, find the least common multiple (LCM) of the denominators. In this case, the LCM of 3 and 4 is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Adding 1/3 and 1/4 results in 7/12.', 2, NULL, 1),
(140, 'John ate 3/4 of a pizza. What fraction of the pizza is left?', '1/4', '1/3', '1/2', '2/3', NULL, '1', 'To find the fraction of the pizza that is left, we need to subtract the fraction that John ate (3/4) from 1. 1 - 3/4 = 1/4.', 2, NULL, 1),
(141, 'If a recipe calls for 2/3 cup of sugar but you only have 1/4 cup, what fraction of the required sugar do you have?', '1/2', '1/3', '1/4', '1/6', NULL, '2', 'To find the fraction of the required sugar that you have, you divide the amount you have (1/4) by the required amount (2/3). So, 1/4 ÷ 2/3 = 1/4 x 3/2 = 3/8. Therefore, you have 1/3 of the required sugar.', 2, NULL, 1),
(142, 'Sara cuts a cake into 6 equal slices and eats 2 slices. What fraction of the cake did she eat?', '1/6', '2/6', '3/6', '4/6', NULL, '3', 'If Sara eats 2 out of 6 slices, the fraction of the cake she ate is 2/6.', 2, NULL, 1),
(143, 'Which of the following fractions is greater than 1/2?', '2/3', '3/4', '1/3', '4/5', NULL, '2', 'To compare fractions, if the numerators are the same, the fraction with the smaller denominator is greater.', 2, NULL, 1),
(144, 'A pizza is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pizza is left?', '1/8', '3/8', '5/8', '7/8', NULL, '4', 'Solution: Since the pizza was divided into 8 slices and 3 slices were eaten, there are 8 - 3 = 5 slices left. Therefore, the fraction of the pizza that is left is 5/8.', 2, NULL, 1),
(145, 'If a tank is filled with 3/4 of its capacity, what fraction of the tank is empty?', '1/4', '1/3', '1/2', '2/3', NULL, '4', 'To find the fraction of the tank that is empty, we subtract the fraction that is full (3/4) from 1, which gives us 1 - 3/4 = 1/4. So, 2/3 of the tank is empty.', 2, NULL, 1),
(146, 'Which fraction is equivalent to 4/5?', '1/2', '2/4', '8/10', '10/12', NULL, '3', 'To find an equivalent fraction, multiply or divide the numerator and denominator by the same number. In this case, dividing both 4 and 8 by 2 gives the fraction 8/10, which is equivalent to 4/5.', 2, NULL, 1),
(147, 'A group of friends shared a pizza with 10 equal slices. If each friend had 2 slices, how many friends were there in the group?', '3', '4', '5', '6', NULL, '4', 'If each friend had 2 slices and there were 10 slices in total, then there were 10/2 = 5 friends in the group.', 2, NULL, 1),
(148, 'Sarah has 12 marbles and she gives 1/4 of them to her friend. How many marbles does Sarah give to her friend?', '1', '2', '3', '4', NULL, '3', 'If Sarah has 12 marbles and she gives 1/4 of them to her friend, she gives 3 marbles to her friend.', 2, NULL, 1),
(149, 'A certain pizza recipe calls for 3/4 cup of flour. If you want to make 4 pizzas, how many cups of flour do you need?', '1/3', '1', '2', '3', NULL, '3', 'To make 4 pizzas, you need to multiply the amount of flour for 1 pizza by 4, which is (3/4) * 4 = 3 cups of flour.', 2, NULL, 1),
(150, 'If a cake is divided into 8 equal slices and John eats 3/8 of a slice, how many whole slices of cake does he eat?', '1/2', '1', '1 1/2', '2', NULL, '1', 'By dividing 3/8 by 1/8 (the size of one whole slice), we get 3/8 ÷ 1/8 = 3. John eats 3 whole slices.', 2, NULL, 1),
(151, 'A glass is filled to 3/4 of its capacity. If there are 400 ml of liquid in the glass, what is its total capacity?', '400 ml', '600 ml', '800 ml', '1200 ml', NULL, '3', 'If 3/4 of the capacity is equal to 400 ml, then the total capacity is 400 ml * (4/3) = 800 ml.', 2, NULL, 1),
(152, 'A recipe calls for 2/3 cup of sugar. If Lucy wants to make 4 times the recipe, how much sugar does she need?', '1 cup', '1 and 1/3 cups', '1 and 1/2 cups', '2 cups', NULL, '2', 'To find the answer, we need to multiply 2/3 cup by 4. This gives us 8/3 or 2 and 2/3 cups of sugar needed for the recipe.', 2, NULL, 1),
(153, 'A recipe calls for 3/4 cup of sugar, but John only has 1/2 cup. How much more sugar does he need?', '1/4', '1/3', '1/8', '1/6', NULL, '1', 'To find how much more sugar John needs, we need to subtract the fraction he already has (1/2) from the required fraction (3/4). 3/4 - 1/2 = 1/4.', 2, NULL, 1),
(154, 'What is 30% expressed as a fraction in simplest form?', '1/30', '3/10', '3/30', '10/3', NULL, '2', 'To convert a percentage to a fraction, divide the percentage by 100 and simplify. In this case, 30% becomes 30/100, which simplifies to 3/10.', 2, NULL, 1),
(155, 'Which of the following fractions is equivalent to 2/5?', '1/3', '3/5', '4/10', '5/8', NULL, '3', 'To find equivalent fractions, multiply or divide the numerator and denominator by the same number. In this case, multiplying 2 and 5 by 2 gives the fraction 4/10, which is equivalent to 2/5.', 2, NULL, 1),
(156, 'If a rope is 3/4 meters long and you cut off 1/6 meters from it, how long is the remaining rope?', '1/2 meters', '1/3 meters', '1/4 meters', '5/12 meters', NULL, '4', 'Cutting off 1/6 meters from a rope that is 3/4 meters long leaves 5/12 meters of the rope remaining.', 2, NULL, 1),
(157, 'Which fraction is equivalent to 3/5?', '1/5', '2/10', '4/5', '6/5', NULL, '2', 'To find an equivalent fraction, multiply or divide both the numerator and the denominator of the given fraction by the same non-zero number. In this case, multiplying 3/5 by 2/2, we get 6/10, which is equivalent to 3/5.', 2, NULL, 1),
(158, 'If 2/5 of a bucket of water is poured out, what fraction of the water remains?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'If 2/5 of the water is poured out, 3/5 of the water remains.', 2, NULL, 1),
(159, 'What is 2/5 of 40?', '8', '10', '16', '20', NULL, '4', 'To find a fraction of a whole number, multiply the whole number by the numerator and divide by the denominator. In this case, (2/5) * 40 = (2 * 40) / 5 = 80 / 5 = 16. Therefore, 2/5 of 40 is 16.', 2, NULL, 1),
(160, 'Which of the following fractions is equivalent to 1/2?', '3/4', '2/3', '4/5', '5/10', NULL, '4', 'To find an equivalent fraction, the numerator and denominator of the original fraction can be multiplied or divided by the same number.', 2, NULL, 1),
(161, 'A recipe calls for 1/2 cup of flour. If you want to make half of the recipe, how much flour do you need?', '1/4 cup', '1/2 cup', '1 cup', '2 cups', NULL, '1', 'If a recipe calls for 1/2 cup of flour and you want to make half of the recipe, you need 1/4 cup of flour.', 4, NULL, 1),
(162, 'Sandy has a candy bar that is divided into 10 equal pieces. If he eats 3 pieces, what fraction of the candy bar does he have left?', '1/5', '2/5', '3/5', '4/5', NULL, '4', 'Solution: Since there are 10 pieces in total and Sandy eats 3 pieces, he has 10 - 3 = 7 pieces left. Therefore, the fraction of the candy bar he has left is 7/10.', 4, NULL, 1),
(163, 'A rectangle is divided into 12 equal parts. If 9 parts are shaded, what fraction of the rectangle is shaded?', '1/2', '2/3', '3/4', '3/2', NULL, '2', 'If 9 out of 12 parts are shaded, the fraction of the rectangle that is shaded is 9/12, which simplifies to 3/4.', 4, NULL, 1),
(164, 'Linda won 5/6 of the total prize money in a contest. What fraction of the prize money did the other contestants win?', '1/6', '1/3', '1/4', '1/2', NULL, '1', 'To find the fraction of the prize money won by the other contestants, we need to subtract Linda\'s fraction (5/6) from 1. 1 - 5/6 = 1/6.', 4, NULL, 1),
(165, 'Sara finished reading 4/5 of a book. How much of the book does she have left to read?', '1/5', '2/5', '3/5', '4/5', NULL, '1', 'Finishing 4/5 of the book means she has 1/5 of the book left to read.', 4, NULL, 1),
(166, 'A pizza pie is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pie remains?', '5/8', '3/8', '1/8', '2/8', NULL, '2', 'If 3 slices are eaten, there are 8 - 3 = 5 slices remaining. The fraction of the pie that remains is 5/8.', 4, NULL, 1),
(167, 'Sally bought a cake and ate 3/4 of it. If the cake originally weighed 1.5 kg, how much cake did Sally eat?', '0.2 kg', '0.8 kg', '1 kg', '1.2 kg', NULL, '2', 'If Sally ate 3/4 of a cake that originally weighed 1.5 kg, she ate 0.8 kg of cake.', 4, NULL, 1),
(168, 'If a pizza is divided into 8 equal slices and you eat 3 slices, what fraction of the pizza have you eaten?', '1/2', '3/16', '3/8', '2/3', NULL, '3', 'Eating 3 slices out of 8 is equivalent to eating 3/8 of the pizza.', 4, NULL, 1),
(169, 'A tank is filled with 15 liters of water. If 2/5 of the water is drained, how many liters of water are left in the tank?', '3', '6', '9', '12', NULL, '2', 'To find the answer, we need to subtract 2/5 of 15 liters from 15. This gives us 6 liters, which is the amount of water left in the tank.', 4, NULL, 1),
(170, 'A group of friends ordered 3 large pizzas to share. Each pizza was cut into 8 equal slices. If each person had 2 slices, what fraction of the pizzas remained?', '3/16', '1/4', '5/16', '7/16', NULL, '4', 'Solution: There were a total of 24 slices (3 x 8) and each person had 2 slices which means 8 people were served. The remaining slices are 24 - (2 x 8) = 24 - 16 = 8. The fraction representing the remaining slices is 8/24 which simplifies to 1/3 or 7/16.', 4, NULL, 1),
(171, 'A bag contains 12 red marbles and 8 green marbles. What fraction of the marbles are red?', '3/4', '2/3', '3/5', '5/8', NULL, '1', 'Solution: The total number of marbles is 12 + 8 = 20. The fraction of red marbles is 12/20, which can be simplified to 3/5.', 4, NULL, 1),
(172, 'If Amy has 3/5 of a pizza and Sam has 2/5 of the same pizza, what fraction of the pizza do they have in total?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'By adding 3/5 and 2/5, we get a total of 5/5, which is equal to the whole pizza.', 4, NULL, 1);
INSERT INTO `question` (`id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `option_5`, `correct_option`, `explanation`, `tst_id`, `marks`, `status`) VALUES
(173, 'What is the value of 3/4 divided by 2/3?', '1/2', '3/8', '9/8', '8/9', NULL, '3', 'To divide fractions, we need to multiply the first fraction by the reciprocal of the second fraction. So, (3/4) / (2/3) becomes (3/4) * (3/2) = 9/8.', 4, NULL, 1),
(174, 'If 3/4 of a pizza is left, what fraction of the pizza has been eaten?', '1/4', '1/3', '1/2', '3/5', NULL, '3', 'To find the fraction that has been eaten, subtract the fraction that is left from 1 (whole). In this case, 1 - 3/4 = 1/4. Therefore, 3/4 of the pizza has been eaten.', 4, NULL, 1),
(175, 'There are 20 students in a class, and 3/5 of them are girls. How many boys are there in the class?', '4', '6', '8', '12', NULL, '3', 'If 3/5 of the students in a class are girls, then 2/5 of the students are boys. If there are 20 students in total, there are 8 boys in the class.', 4, NULL, 1),
(176, 'Simplify the fraction 16/24.', '2/3', '3/4', '4/5', '5/6', NULL, '1', 'To simplify a fraction, the numerator and denominator can be divided by their greatest common factor (GCF).', 4, NULL, 1),
(177, 'If a pizza is divided into 8 equal slices, and 3 slices are eaten, what fraction of the pizza remains?', '1/5', '1/3', '3/8', '5/8', NULL, '4', 'If 3 out of 8 slices are eaten, 5/8 of the pizza remains.', 4, NULL, 1),
(178, 'What is the equivalent fraction of 5/10?', '1/5', '3/10', '1/2', '2/5', NULL, '3', '5/10 is equivalent to 1/2.', 4, NULL, 1),
(179, 'Which fraction is greater: 2/3 or 3/4?', '2/3', '3/4', 'They are equal', 'Cannot be determined', NULL, '2', 'To compare fractions with different denominators, find a common denominator. In this case, the common denominator is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Comparing 8/12 and 9/12, we can see that 3/4 is greater than 2/3.', 4, NULL, 1),
(180, 'What is the fraction equivalent to 0.75?', '3/4', '1/2', '4/3', '1/3', NULL, '1', 'To convert a decimal to a fraction, the decimal can be written as the numerator and a power of 10 as the denominator.', 4, NULL, 1),
(181, 'A recipe calls for 2/3 cup of sugar. If Laura only has 1/4 cup of sugar, what fraction of the required sugar does she have?', '1/4', '2/7', '1/6', '4/7', NULL, '2', 'To find the fraction of the required sugar that Laura has, we need to divide the amount she has (1/4 cup) by the required amount (2/3 cup). So, (1/4 cup) / (2/3 cup) = (1/4 cup) * (3/2 cup) = 3/8. Therefore, she has 2/7 of the required sugar.', 4, NULL, 1),
(182, 'If a basketball team scores 4/5 of their shots, what fraction of shots do they miss?', '1/5', '1/4', '1/3', '2/5', NULL, '1', 'To find the fraction of shots missed, we subtract the fraction of shots made (4/5) from 1, which gives us 1 - 4/5 = 1/5. So, they miss 1/5 of their shots.', 4, NULL, 1),
(183, 'Emily spent 3/10 of her money on a new book. If she had $50 before buying the book, how much money does she have left?', '$20', '$25', '$30', '$35', NULL, '3', 'To find the answer, we need to multiply $50 by 3/10 and then subtract the result from $50. This gives us $30, which is the amount of money Emily has left.', 4, NULL, 1),
(184, 'What fraction is equivalent to 0.6?', '1/2', '2/3', '3/5', '6/10', NULL, '4', 'To convert a decimal to a fraction, place the decimal number over a power of 10. In this case, 0.6 can be expressed as 6/10, which is equivalent to 3/5.', 4, NULL, 1),
(185, 'What is 3/8 as a decimal?', '0.25', '0.3', '0.375', '0.4', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 8 equals 0.375.', 4, NULL, 1),
(186, 'What is the result of adding 2/3 and 1/4?', '3/7', '4/7', '5/7', '6/7', NULL, '2', 'To add fractions with different denominators, find a common denominator. In this case, the common denominator of 3 and 4 is 12. Then, convert both fractions to have the same denominator. 2/3 becomes 8/12 and 1/4 becomes 3/12. Lastly, add the numerators: 8/12 + 3/12 = 11/12, which simplifies to 4/7.', 4, NULL, 1),
(187, 'The length of a rectangle is 12 cm and its width is 3 cm. What is the fraction representing the ratio of the width to the length?', '3/12', '1/4', '4/1', '12/3', NULL, '2', 'Solution: The fraction representing the ratio of the width to the length is 3/12 which simplifies to 1/4.', 4, NULL, 1),
(188, 'Which fraction is greater: 3/4 or 2/3?', '3/4', '2/3', 'Equal', 'Cannot be determined', NULL, '2', '2/3 is greater than 3/4.', 4, NULL, 1),
(189, 'James baked a cake using a recipe that calls for 1 1/2 cups of flour. If he wants to make half of the recipe, how many cups of flour does he need?', '3/4', '1/2', '1/4', '1/8', NULL, '1', 'To make half of the recipe, James needs to divide the amount of flour by 2, which is (1 1/2) / 2 = 3/4 cup of flour.', 4, NULL, 1),
(190, 'If a pizza is divided into 8 equal slices and you eat 3 of them, what fraction of the pizza have you eaten?', '1/4', '3/8', '3/5', '3/8', NULL, '2', 'If a pizza is divided into 8 equal slices and you eat 3 of them, you have eaten 3/8 of the pizza.', 4, NULL, 1),
(191, 'A recipe calls for 3/4 cup of sugar. If you want to halve the recipe, how much sugar should you use?', '1/4 cup', '1/2 cup', '1 cup', '1 1/2 cups', NULL, '1', 'Solution: Halving the recipe means using half the amount of each ingredient. Half of 3/4 cup is 3/4 x 1/2 = 3/8 cup. Therefore, you should use 1/4 cup of sugar.', 4, NULL, 1),
(192, 'What is 1/2 of 3/4?', '1/4', '3/8', '5/8', '3/4', NULL, '2', '1/2 of 3/4 is equal to 3/8.', 4, NULL, 1),
(193, 'A class has 30 students, out of which 3/5 are boys. How many boys are there in the class?', '10', '12', '15', '18', NULL, '4', 'To find the number of boys in the class, we multiply the total number of students by the fraction representing the proportion of boys (3/5). So, (3/5) * 30 = 18. Therefore, there are 18 boys in the class.', 4, NULL, 1),
(194, 'A baker had 6 cups of flour. He used 2/3 of it to make bread. How many cups of flour did the baker use?', '2', '3', '4', '5', NULL, '3', 'To find the answer, we need to multiply 6 cups of flour by 2/3. This gives us 4 cups, which is the amount of flour the baker used.', 4, NULL, 1),
(195, 'The numerator of a fraction is 4 less than the denominator. If the fraction is simplified to its lowest form, what is the ratio of the numerator to the denominator?', '1:2', '1:3', '1:4', '1:5', NULL, '3', 'Let the denominator of the fraction be D. According to the given condition, the numerator becomes D-4. As the fraction is simplified to its lowest form, there are no common factors between the numerator and denominator. Therefore, the ratio of the numerator to the denominator is 1:4.', 4, NULL, 1),
(196, 'If 2/3 of a cupcake recipe requires 1/2 cup of sugar, how much sugar is needed for the whole recipe?', '1/8', '1/4', '3/4', '1', NULL, '4', 'The whole cupcake recipe requires the amount of sugar for 2/3 which is equal to (2/3) * (1/2) = 1/3 cup of sugar.', 4, NULL, 1),
(197, 'A tank contains 60 liters of water. If 3/5 of the water is used, how many liters of water are left?', '12 liters', '18 liters', '24 liters', '36 liters', NULL, '2', 'Solution: If 3/5 of 60 liters of water is used, then the amount of water left is (1 - 3/5) * 60 = 2/5 * 60 = 24 liters.', 4, NULL, 1),
(198, 'What is 2/3 of 1/4?', '1/3', '1/2', '1/8', '3/4', NULL, '3', 'To find 2/3 of 1/4, multiply them together. (2/3) x (1/4) = 2/12 = 1/6.', 4, NULL, 1),
(199, 'A recipe calls for 2/3 cup of milk. If you want to make 1 1/2 times the recipe, how much milk do you need?', '3/4', '1', '1 1/4', '1 1/2', NULL, '3', 'To find the amount of milk needed for 1 1/2 times the recipe, multiply the amount for 1 recipe by 1 1/2, which is (2/3) * (3/2) = 6/9 = 2/3 + 2/3 + 2/3 = 6/9 = 2/3 cup of milk.', 4, NULL, 1),
(200, 'If 3/4 of a number is 15, what is the number?', '5', '12', '16', '20', NULL, '2', 'To find the number, divide 15 by 3/4. 15 ÷ (3/4) = 15 x (4/3) = 60/3 = 20.', 4, NULL, 1),
(201, 'What is the fraction of shaded squares out of the total squares in the figure below?', '1/2', '2/5', '3/4', '4/7', NULL, '3', 'To find the fraction of shaded squares, we need to compare the number of shaded squares to the total number of squares. In this figure, there are 3 shaded squares out of the total of 4 squares, so the fraction is 3/4.', 4, NULL, 1),
(202, 'Sara has 3/5 of a pizza and John has 1/3 of a pizza. What fraction of the pizza do they have together?', '2/5', '7/15', '4/15', '7/10', NULL, '2', 'To find the fraction of the pizza they have together, we need to find the common denominator for 5 and 3, which is 15. Sara has (3/5) * 15/15 = 9/15 of the pizza, and John has (1/3) * 15/15 = 5/15 of the pizza. Together, they have 9/15 + 5/15 = 14/15 of the pizza.', 4, NULL, 1),
(203, 'The sum of two fractions is 3/5. If one fraction is 1/3, what is the other fraction?', '2/5', '1/5', '1/15', '3/8', NULL, '1', 'To find the other fraction, subtract 1/3 from 3/5. 3/5 - 1/3 = 2/5.', 4, NULL, 1),
(204, 'Which fraction is equivalent to 3/5?', '4/6', '2/4', '6/10', '1/3', NULL, '3', 'To find an equivalent fraction, multiply both the numerator and denominator by the same number. Multiplying 3/5 by 2 gives 6/10, which reduces to 3/5.', 4, NULL, 1),
(205, 'If a fraction is in its simplest form, what is the greatest common factor (GCF) of its numerator and denominator?', '1', '2', '3', '4', NULL, '1', 'If a fraction is in its simplest form, it means that the numerator and denominator have no common factors other than 1.', 4, NULL, 1),
(206, 'Simplify the fraction 9/12.', '3/4', '2/3', '1/2', '4/9', NULL, '2', 'To simplify 9/12, divide both the numerator and denominator by their greatest common factor, which is 3. 9/12 ÷ 3/3 = 3/4.', 4, NULL, 1),
(207, 'A recipe calls for 3/4 cup of sugar. If John wants to make half of the recipe, how much sugar does he need?', '1/4 cup', '3/8 cup', '1/2 cup', '5/8 cup', NULL, '2', 'Solution: If John wants to make half of the recipe, he needs half of 3/4 cup of sugar, which is (1/2) * (3/4) = 3/8 cup.', 4, NULL, 1),
(208, 'What is the simplified form of 2/4?', '1/4', '1/2', '3/4', '3/2', NULL, '2', 'To simplify the fraction 2/4, divide both the numerator and the denominator by their greatest common divisor, which is 2. Therefore, the simplified form of 2/4 is 1/2.', 4, NULL, 1),
(209, 'John saved 1/3 of his monthly salary. If his salary was $1200, how much money did he save?', '$200', '$400', '$600', '$800', NULL, '3', 'Saving 1/3 of $1200 is equivalent to saving $400.', 4, NULL, 1),
(210, 'A car covered 3/5 of a distance in 2 hours. How long would it take to cover the remaining distance if it maintains the same speed?', '1 hour', '1.5 hours', '2.5 hours', '3 hours', NULL, '4', 'Solution: If the car covered 3/5 of the distance in 2 hours, then it covered 1 - 3/5 = 2/5 of the distance in the remaining time. Let\'s call the required time as x hours. Setting up a proportion, we have (2/5) / 2 = (2/5 + 2/x). Solving for x, we get x = 3. Therefore, it would take the car 3 hours to cover the remaining distance.', 4, NULL, 1),
(211, 'Sara has 6/8 cup of milk. How much more milk does she need to make 1 full cup?', '1/8', '1/4', '2/8', '3/8', NULL, '1', 'To find how much more milk Sara needs to make 1 full cup, we need to subtract the fraction she already has (6/8) from 1. 1 - 6/8 = 1/8.', 4, NULL, 1),
(212, 'What is 3/4 as a decimal?', '0.25', '0.5', '0.75', '1', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 4 is 0.75.', 4, NULL, 1),
(213, 'What is the fraction equivalent of 0.75?', '1/4', '1/2', '3/4', '1', NULL, '3', '0.75 is equivalent to 3/4.', 4, NULL, 1),
(214, 'What is the result of adding 1/3 and 2/5?', '5/8', '11/15', '7/10', '3/8', NULL, '3', 'To add fractions with different denominators, find a common denominator. The common denominator for 1/3 and 2/5 is 15. Therefore, 1/3 + 2/5 = (5/15) + (6/15) = 7/15.', 4, NULL, 1),
(215, 'Alex had a pie divided into 8 equal slices. If Alex ate 3/8 of the pie, how many slices did he eat?', '1', '2', '3', '4', NULL, '4', 'To find the number of slices Alex ate, multiply the total number of slices by the fraction of the pie he ate, which is 8 slices * (3/8) = 24/8 = 3 slices.', 4, NULL, 1),
(216, 'A pizza is divided into 8 equal slices. John ate 3/8 of the pizza. How many slices are left?', '1', '2', '3', '4', NULL, '4', 'John ate 3 out of 8 slices, so the remaining slices are 8 minus 3, which equals 5. Therefore, 4 slices are left.', 4, NULL, 1),
(217, 'Julia saved 5/8 of her monthly salary and spent the rest on bills and groceries. If she spent 3/10 of her monthly salary, what fraction of her salary did she save?', '2/5', '1/2', '3/8', '5/8', NULL, '3', 'Solution: The fraction of her salary that she saved is 1 - 3/10 = 7/10. Therefore, she saved 7/10 of her monthly salary.', 4, NULL, 1),
(218, 'Which fraction is greater: 4/7 or 3/5?', '4/7', '3/5', 'They are equal.', 'Cannot be determined with the given information.', NULL, '2', 'To compare fractions with different denominators, find a common denominator. The common denominator for 4/7 and 3/5 is 35. Therefore, converting both fractions to have a denominator of 35, 4/7 becomes 20/35 and 3/5 becomes 21/35. Since 21/35 is greater than 20/35, 3/5 is the greater fraction.', 4, NULL, 1),
(219, 'What is the result of adding 1/3 and 1/4?', '2/5', '7/12', '1/7', '1/12', NULL, '2', 'To add fractions with different denominators, find the least common multiple (LCM) of the denominators. In this case, the LCM of 3 and 4 is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Adding 1/3 and 1/4 results in 7/12.', 4, NULL, 1),
(220, 'John ate 3/4 of a pizza. What fraction of the pizza is left?', '1/4', '1/3', '1/2', '2/3', NULL, '1', 'To find the fraction of the pizza that is left, we need to subtract the fraction that John ate (3/4) from 1. 1 - 3/4 = 1/4.', 4, NULL, 1),
(221, 'If a recipe calls for 2/3 cup of sugar but you only have 1/4 cup, what fraction of the required sugar do you have?', '1/2', '1/3', '1/4', '1/6', NULL, '2', 'To find the fraction of the required sugar that you have, you divide the amount you have (1/4) by the required amount (2/3). So, 1/4 ÷ 2/3 = 1/4 x 3/2 = 3/8. Therefore, you have 1/3 of the required sugar.', 4, NULL, 1),
(222, 'Sara cuts a cake into 6 equal slices and eats 2 slices. What fraction of the cake did she eat?', '1/6', '2/6', '3/6', '4/6', NULL, '3', 'If Sara eats 2 out of 6 slices, the fraction of the cake she ate is 2/6.', 4, NULL, 1),
(223, 'Which of the following fractions is greater than 1/2?', '2/3', '3/4', '1/3', '4/5', NULL, '2', 'To compare fractions, if the numerators are the same, the fraction with the smaller denominator is greater.', 4, NULL, 1),
(224, 'A pizza is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pizza is left?', '1/8', '3/8', '5/8', '7/8', NULL, '4', 'Solution: Since the pizza was divided into 8 slices and 3 slices were eaten, there are 8 - 3 = 5 slices left. Therefore, the fraction of the pizza that is left is 5/8.', 4, NULL, 1),
(225, 'If a tank is filled with 3/4 of its capacity, what fraction of the tank is empty?', '1/4', '1/3', '1/2', '2/3', NULL, '4', 'To find the fraction of the tank that is empty, we subtract the fraction that is full (3/4) from 1, which gives us 1 - 3/4 = 1/4. So, 2/3 of the tank is empty.', 4, NULL, 1),
(226, 'Which fraction is equivalent to 4/5?', '1/2', '2/4', '8/10', '10/12', NULL, '3', 'To find an equivalent fraction, multiply or divide the numerator and denominator by the same number. In this case, dividing both 4 and 8 by 2 gives the fraction 8/10, which is equivalent to 4/5.', 4, NULL, 1),
(227, 'A group of friends shared a pizza with 10 equal slices. If each friend had 2 slices, how many friends were there in the group?', '3', '4', '5', '6', NULL, '4', 'If each friend had 2 slices and there were 10 slices in total, then there were 10/2 = 5 friends in the group.', 4, NULL, 1),
(228, 'Sarah has 12 marbles and she gives 1/4 of them to her friend. How many marbles does Sarah give to her friend?', '1', '2', '3', '4', NULL, '3', 'If Sarah has 12 marbles and she gives 1/4 of them to her friend, she gives 3 marbles to her friend.', 4, NULL, 1),
(229, 'A certain pizza recipe calls for 3/4 cup of flour. If you want to make 4 pizzas, how many cups of flour do you need?', '1/3', '1', '2', '3', NULL, '3', 'To make 4 pizzas, you need to multiply the amount of flour for 1 pizza by 4, which is (3/4) * 4 = 3 cups of flour.', 4, NULL, 1),
(230, 'If a cake is divided into 8 equal slices and John eats 3/8 of a slice, how many whole slices of cake does he eat?', '1/2', '1', '1 1/2', '2', NULL, '1', 'By dividing 3/8 by 1/8 (the size of one whole slice), we get 3/8 ÷ 1/8 = 3. John eats 3 whole slices.', 4, NULL, 1),
(231, 'A glass is filled to 3/4 of its capacity. If there are 400 ml of liquid in the glass, what is its total capacity?', '400 ml', '600 ml', '800 ml', '1200 ml', NULL, '3', 'If 3/4 of the capacity is equal to 400 ml, then the total capacity is 400 ml * (4/3) = 800 ml.', 4, NULL, 1),
(232, 'A recipe calls for 2/3 cup of sugar. If Lucy wants to make 4 times the recipe, how much sugar does she need?', '1 cup', '1 and 1/3 cups', '1 and 1/2 cups', '2 cups', NULL, '2', 'To find the answer, we need to multiply 2/3 cup by 4. This gives us 8/3 or 2 and 2/3 cups of sugar needed for the recipe.', 4, NULL, 1),
(233, 'A recipe calls for 3/4 cup of sugar, but John only has 1/2 cup. How much more sugar does he need?', '1/4', '1/3', '1/8', '1/6', NULL, '1', 'To find how much more sugar John needs, we need to subtract the fraction he already has (1/2) from the required fraction (3/4). 3/4 - 1/2 = 1/4.', 4, NULL, 1),
(234, 'What is 30% expressed as a fraction in simplest form?', '1/30', '3/10', '3/30', '10/3', NULL, '2', 'To convert a percentage to a fraction, divide the percentage by 100 and simplify. In this case, 30% becomes 30/100, which simplifies to 3/10.', 4, NULL, 1),
(235, 'Which of the following fractions is equivalent to 2/5?', '1/3', '3/5', '4/10', '5/8', NULL, '3', 'To find equivalent fractions, multiply or divide the numerator and denominator by the same number. In this case, multiplying 2 and 5 by 2 gives the fraction 4/10, which is equivalent to 2/5.', 4, NULL, 1),
(236, 'If a rope is 3/4 meters long and you cut off 1/6 meters from it, how long is the remaining rope?', '1/2 meters', '1/3 meters', '1/4 meters', '5/12 meters', NULL, '4', 'Cutting off 1/6 meters from a rope that is 3/4 meters long leaves 5/12 meters of the rope remaining.', 4, NULL, 1),
(237, 'Which fraction is equivalent to 3/5?', '1/5', '2/10', '4/5', '6/5', NULL, '2', 'To find an equivalent fraction, multiply or divide both the numerator and the denominator of the given fraction by the same non-zero number. In this case, multiplying 3/5 by 2/2, we get 6/10, which is equivalent to 3/5.', 4, NULL, 1),
(238, 'If 2/5 of a bucket of water is poured out, what fraction of the water remains?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'If 2/5 of the water is poured out, 3/5 of the water remains.', 4, NULL, 1),
(239, 'What is 2/5 of 40?', '8', '10', '16', '20', NULL, '4', 'To find a fraction of a whole number, multiply the whole number by the numerator and divide by the denominator. In this case, (2/5) * 40 = (2 * 40) / 5 = 80 / 5 = 16. Therefore, 2/5 of 40 is 16.', 4, NULL, 1),
(240, 'Which of the following fractions is equivalent to 1/2?', '3/4', '2/3', '4/5', '5/10', NULL, '4', 'To find an equivalent fraction, the numerator and denominator of the original fraction can be multiplied or divided by the same number.', 4, NULL, 1),
(241, 'A recipe calls for 1/2 cup of flour. If you want to make half of the recipe, how much flour do you need?', '1/4 cup', '1/2 cup', '1 cup', '2 cups', NULL, '1', 'If a recipe calls for 1/2 cup of flour and you want to make half of the recipe, you need 1/4 cup of flour.', 5, NULL, 1),
(242, 'Sandy has a candy bar that is divided into 10 equal pieces. If he eats 3 pieces, what fraction of the candy bar does he have left?', '1/5', '2/5', '3/5', '4/5', NULL, '4', 'Solution: Since there are 10 pieces in total and Sandy eats 3 pieces, he has 10 - 3 = 7 pieces left. Therefore, the fraction of the candy bar he has left is 7/10.', 5, NULL, 1),
(243, 'A rectangle is divided into 12 equal parts. If 9 parts are shaded, what fraction of the rectangle is shaded?', '1/2', '2/3', '3/4', '3/2', NULL, '2', 'If 9 out of 12 parts are shaded, the fraction of the rectangle that is shaded is 9/12, which simplifies to 3/4.', 5, NULL, 1),
(244, 'Linda won 5/6 of the total prize money in a contest. What fraction of the prize money did the other contestants win?', '1/6', '1/3', '1/4', '1/2', NULL, '1', 'To find the fraction of the prize money won by the other contestants, we need to subtract Linda\'s fraction (5/6) from 1. 1 - 5/6 = 1/6.', 5, NULL, 1),
(245, 'Sara finished reading 4/5 of a book. How much of the book does she have left to read?', '1/5', '2/5', '3/5', '4/5', NULL, '1', 'Finishing 4/5 of the book means she has 1/5 of the book left to read.', 5, NULL, 1),
(246, 'A pizza pie is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pie remains?', '5/8', '3/8', '1/8', '2/8', NULL, '2', 'If 3 slices are eaten, there are 8 - 3 = 5 slices remaining. The fraction of the pie that remains is 5/8.', 5, NULL, 1),
(247, 'Sally bought a cake and ate 3/4 of it. If the cake originally weighed 1.5 kg, how much cake did Sally eat?', '0.2 kg', '0.8 kg', '1 kg', '1.2 kg', NULL, '2', 'If Sally ate 3/4 of a cake that originally weighed 1.5 kg, she ate 0.8 kg of cake.', 5, NULL, 1),
(248, 'If a pizza is divided into 8 equal slices and you eat 3 slices, what fraction of the pizza have you eaten?', '1/2', '3/16', '3/8', '2/3', NULL, '3', 'Eating 3 slices out of 8 is equivalent to eating 3/8 of the pizza.', 5, NULL, 1),
(249, 'A tank is filled with 15 liters of water. If 2/5 of the water is drained, how many liters of water are left in the tank?', '3', '6', '9', '12', NULL, '2', 'To find the answer, we need to subtract 2/5 of 15 liters from 15. This gives us 6 liters, which is the amount of water left in the tank.', 5, NULL, 1),
(250, 'A group of friends ordered 3 large pizzas to share. Each pizza was cut into 8 equal slices. If each person had 2 slices, what fraction of the pizzas remained?', '3/16', '1/4', '5/16', '7/16', NULL, '4', 'Solution: There were a total of 24 slices (3 x 8) and each person had 2 slices which means 8 people were served. The remaining slices are 24 - (2 x 8) = 24 - 16 = 8. The fraction representing the remaining slices is 8/24 which simplifies to 1/3 or 7/16.', 5, NULL, 1),
(251, 'A bag contains 12 red marbles and 8 green marbles. What fraction of the marbles are red?', '3/4', '2/3', '3/5', '5/8', NULL, '1', 'Solution: The total number of marbles is 12 + 8 = 20. The fraction of red marbles is 12/20, which can be simplified to 3/5.', 5, NULL, 1),
(252, 'If Amy has 3/5 of a pizza and Sam has 2/5 of the same pizza, what fraction of the pizza do they have in total?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'By adding 3/5 and 2/5, we get a total of 5/5, which is equal to the whole pizza.', 5, NULL, 1),
(253, 'What is the value of 3/4 divided by 2/3?', '1/2', '3/8', '9/8', '8/9', NULL, '3', 'To divide fractions, we need to multiply the first fraction by the reciprocal of the second fraction. So, (3/4) / (2/3) becomes (3/4) * (3/2) = 9/8.', 5, NULL, 1),
(254, 'If 3/4 of a pizza is left, what fraction of the pizza has been eaten?', '1/4', '1/3', '1/2', '3/5', NULL, '3', 'To find the fraction that has been eaten, subtract the fraction that is left from 1 (whole). In this case, 1 - 3/4 = 1/4. Therefore, 3/4 of the pizza has been eaten.', 5, NULL, 1),
(255, 'There are 20 students in a class, and 3/5 of them are girls. How many boys are there in the class?', '4', '6', '8', '12', NULL, '3', 'If 3/5 of the students in a class are girls, then 2/5 of the students are boys. If there are 20 students in total, there are 8 boys in the class.', 5, NULL, 1),
(256, 'Simplify the fraction 16/24.', '2/3', '3/4', '4/5', '5/6', NULL, '1', 'To simplify a fraction, the numerator and denominator can be divided by their greatest common factor (GCF).', 5, NULL, 1),
(257, 'If a pizza is divided into 8 equal slices, and 3 slices are eaten, what fraction of the pizza remains?', '1/5', '1/3', '3/8', '5/8', NULL, '4', 'If 3 out of 8 slices are eaten, 5/8 of the pizza remains.', 5, NULL, 1),
(258, 'What is the equivalent fraction of 5/10?', '1/5', '3/10', '1/2', '2/5', NULL, '3', '5/10 is equivalent to 1/2.', 5, NULL, 1),
(259, 'Which fraction is greater: 2/3 or 3/4?', '2/3', '3/4', 'They are equal', 'Cannot be determined', NULL, '2', 'To compare fractions with different denominators, find a common denominator. In this case, the common denominator is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Comparing 8/12 and 9/12, we can see that 3/4 is greater than 2/3.', 5, NULL, 1),
(260, 'What is the fraction equivalent to 0.75?', '3/4', '1/2', '4/3', '1/3', NULL, '1', 'To convert a decimal to a fraction, the decimal can be written as the numerator and a power of 10 as the denominator.', 5, NULL, 1),
(261, 'A recipe calls for 2/3 cup of sugar. If Laura only has 1/4 cup of sugar, what fraction of the required sugar does she have?', '1/4', '2/7', '1/6', '4/7', NULL, '2', 'To find the fraction of the required sugar that Laura has, we need to divide the amount she has (1/4 cup) by the required amount (2/3 cup). So, (1/4 cup) / (2/3 cup) = (1/4 cup) * (3/2 cup) = 3/8. Therefore, she has 2/7 of the required sugar.', 5, NULL, 1),
(262, 'If a basketball team scores 4/5 of their shots, what fraction of shots do they miss?', '1/5', '1/4', '1/3', '2/5', NULL, '1', 'To find the fraction of shots missed, we subtract the fraction of shots made (4/5) from 1, which gives us 1 - 4/5 = 1/5. So, they miss 1/5 of their shots.', 5, NULL, 1),
(263, 'Emily spent 3/10 of her money on a new book. If she had $50 before buying the book, how much money does she have left?', '$20', '$25', '$30', '$35', NULL, '3', 'To find the answer, we need to multiply $50 by 3/10 and then subtract the result from $50. This gives us $30, which is the amount of money Emily has left.', 5, NULL, 1),
(264, 'What fraction is equivalent to 0.6?', '1/2', '2/3', '3/5', '6/10', NULL, '4', 'To convert a decimal to a fraction, place the decimal number over a power of 10. In this case, 0.6 can be expressed as 6/10, which is equivalent to 3/5.', 5, NULL, 1),
(265, 'What is 3/8 as a decimal?', '0.25', '0.3', '0.375', '0.4', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 8 equals 0.375.', 5, NULL, 1),
(266, 'What is the result of adding 2/3 and 1/4?', '3/7', '4/7', '5/7', '6/7', NULL, '2', 'To add fractions with different denominators, find a common denominator. In this case, the common denominator of 3 and 4 is 12. Then, convert both fractions to have the same denominator. 2/3 becomes 8/12 and 1/4 becomes 3/12. Lastly, add the numerators: 8/12 + 3/12 = 11/12, which simplifies to 4/7.', 5, NULL, 1),
(267, 'The length of a rectangle is 12 cm and its width is 3 cm. What is the fraction representing the ratio of the width to the length?', '3/12', '1/4', '4/1', '12/3', NULL, '2', 'Solution: The fraction representing the ratio of the width to the length is 3/12 which simplifies to 1/4.', 5, NULL, 1),
(268, 'Which fraction is greater: 3/4 or 2/3?', '3/4', '2/3', 'Equal', 'Cannot be determined', NULL, '2', '2/3 is greater than 3/4.', 5, NULL, 1),
(269, 'James baked a cake using a recipe that calls for 1 1/2 cups of flour. If he wants to make half of the recipe, how many cups of flour does he need?', '3/4', '1/2', '1/4', '1/8', NULL, '1', 'To make half of the recipe, James needs to divide the amount of flour by 2, which is (1 1/2) / 2 = 3/4 cup of flour.', 5, NULL, 1),
(270, 'If a pizza is divided into 8 equal slices and you eat 3 of them, what fraction of the pizza have you eaten?', '1/4', '3/8', '3/5', '3/8', NULL, '2', 'If a pizza is divided into 8 equal slices and you eat 3 of them, you have eaten 3/8 of the pizza.', 5, NULL, 1),
(271, 'A recipe calls for 3/4 cup of sugar. If you want to halve the recipe, how much sugar should you use?', '1/4 cup', '1/2 cup', '1 cup', '1 1/2 cups', NULL, '1', 'Solution: Halving the recipe means using half the amount of each ingredient. Half of 3/4 cup is 3/4 x 1/2 = 3/8 cup. Therefore, you should use 1/4 cup of sugar.', 5, NULL, 1),
(272, 'What is 1/2 of 3/4?', '1/4', '3/8', '5/8', '3/4', NULL, '2', '1/2 of 3/4 is equal to 3/8.', 5, NULL, 1),
(273, 'A class has 30 students, out of which 3/5 are boys. How many boys are there in the class?', '10', '12', '15', '18', NULL, '4', 'To find the number of boys in the class, we multiply the total number of students by the fraction representing the proportion of boys (3/5). So, (3/5) * 30 = 18. Therefore, there are 18 boys in the class.', 5, NULL, 1),
(274, 'A baker had 6 cups of flour. He used 2/3 of it to make bread. How many cups of flour did the baker use?', '2', '3', '4', '5', NULL, '3', 'To find the answer, we need to multiply 6 cups of flour by 2/3. This gives us 4 cups, which is the amount of flour the baker used.', 5, NULL, 1),
(275, 'The numerator of a fraction is 4 less than the denominator. If the fraction is simplified to its lowest form, what is the ratio of the numerator to the denominator?', '1:2', '1:3', '1:4', '1:5', NULL, '3', 'Let the denominator of the fraction be D. According to the given condition, the numerator becomes D-4. As the fraction is simplified to its lowest form, there are no common factors between the numerator and denominator. Therefore, the ratio of the numerator to the denominator is 1:4.', 5, NULL, 1),
(276, 'If 2/3 of a cupcake recipe requires 1/2 cup of sugar, how much sugar is needed for the whole recipe?', '1/8', '1/4', '3/4', '1', NULL, '4', 'The whole cupcake recipe requires the amount of sugar for 2/3 which is equal to (2/3) * (1/2) = 1/3 cup of sugar.', 5, NULL, 1),
(277, 'A tank contains 60 liters of water. If 3/5 of the water is used, how many liters of water are left?', '12 liters', '18 liters', '24 liters', '36 liters', NULL, '2', 'Solution: If 3/5 of 60 liters of water is used, then the amount of water left is (1 - 3/5) * 60 = 2/5 * 60 = 24 liters.', 5, NULL, 1),
(278, 'What is 2/3 of 1/4?', '1/3', '1/2', '1/8', '3/4', NULL, '3', 'To find 2/3 of 1/4, multiply them together. (2/3) x (1/4) = 2/12 = 1/6.', 5, NULL, 1),
(279, 'A recipe calls for 2/3 cup of milk. If you want to make 1 1/2 times the recipe, how much milk do you need?', '3/4', '1', '1 1/4', '1 1/2', NULL, '3', 'To find the amount of milk needed for 1 1/2 times the recipe, multiply the amount for 1 recipe by 1 1/2, which is (2/3) * (3/2) = 6/9 = 2/3 + 2/3 + 2/3 = 6/9 = 2/3 cup of milk.', 5, NULL, 1),
(280, 'If 3/4 of a number is 15, what is the number?', '5', '12', '16', '20', NULL, '2', 'To find the number, divide 15 by 3/4. 15 ÷ (3/4) = 15 x (4/3) = 60/3 = 20.', 5, NULL, 1),
(281, 'What is the fraction of shaded squares out of the total squares in the figure below?', '1/2', '2/5', '3/4', '4/7', NULL, '3', 'To find the fraction of shaded squares, we need to compare the number of shaded squares to the total number of squares. In this figure, there are 3 shaded squares out of the total of 4 squares, so the fraction is 3/4.', 5, NULL, 1),
(282, 'Sara has 3/5 of a pizza and John has 1/3 of a pizza. What fraction of the pizza do they have together?', '2/5', '7/15', '4/15', '7/10', NULL, '2', 'To find the fraction of the pizza they have together, we need to find the common denominator for 5 and 3, which is 15. Sara has (3/5) * 15/15 = 9/15 of the pizza, and John has (1/3) * 15/15 = 5/15 of the pizza. Together, they have 9/15 + 5/15 = 14/15 of the pizza.', 5, NULL, 1),
(283, 'The sum of two fractions is 3/5. If one fraction is 1/3, what is the other fraction?', '2/5', '1/5', '1/15', '3/8', NULL, '1', 'To find the other fraction, subtract 1/3 from 3/5. 3/5 - 1/3 = 2/5.', 5, NULL, 1),
(284, 'Which fraction is equivalent to 3/5?', '4/6', '2/4', '6/10', '1/3', NULL, '3', 'To find an equivalent fraction, multiply both the numerator and denominator by the same number. Multiplying 3/5 by 2 gives 6/10, which reduces to 3/5.', 5, NULL, 1),
(285, 'If a fraction is in its simplest form, what is the greatest common factor (GCF) of its numerator and denominator?', '1', '2', '3', '4', NULL, '1', 'If a fraction is in its simplest form, it means that the numerator and denominator have no common factors other than 1.', 5, NULL, 1),
(286, 'Simplify the fraction 9/12.', '3/4', '2/3', '1/2', '4/9', NULL, '2', 'To simplify 9/12, divide both the numerator and denominator by their greatest common factor, which is 3. 9/12 ÷ 3/3 = 3/4.', 5, NULL, 1),
(287, 'A recipe calls for 3/4 cup of sugar. If John wants to make half of the recipe, how much sugar does he need?', '1/4 cup', '3/8 cup', '1/2 cup', '5/8 cup', NULL, '2', 'Solution: If John wants to make half of the recipe, he needs half of 3/4 cup of sugar, which is (1/2) * (3/4) = 3/8 cup.', 5, NULL, 1),
(288, 'What is the simplified form of 2/4?', '1/4', '1/2', '3/4', '3/2', NULL, '2', 'To simplify the fraction 2/4, divide both the numerator and the denominator by their greatest common divisor, which is 2. Therefore, the simplified form of 2/4 is 1/2.', 5, NULL, 1),
(289, 'John saved 1/3 of his monthly salary. If his salary was $1200, how much money did he save?', '$200', '$400', '$600', '$800', NULL, '3', 'Saving 1/3 of $1200 is equivalent to saving $400.', 5, NULL, 1),
(290, 'A car covered 3/5 of a distance in 2 hours. How long would it take to cover the remaining distance if it maintains the same speed?', '1 hour', '1.5 hours', '2.5 hours', '3 hours', NULL, '4', 'Solution: If the car covered 3/5 of the distance in 2 hours, then it covered 1 - 3/5 = 2/5 of the distance in the remaining time. Let\'s call the required time as x hours. Setting up a proportion, we have (2/5) / 2 = (2/5 + 2/x). Solving for x, we get x = 3. Therefore, it would take the car 3 hours to cover the remaining distance.', 5, NULL, 1),
(291, 'Sara has 6/8 cup of milk. How much more milk does she need to make 1 full cup?', '1/8', '1/4', '2/8', '3/8', NULL, '1', 'To find how much more milk Sara needs to make 1 full cup, we need to subtract the fraction she already has (6/8) from 1. 1 - 6/8 = 1/8.', 5, NULL, 1),
(292, 'What is 3/4 as a decimal?', '0.25', '0.5', '0.75', '1', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 4 is 0.75.', 5, NULL, 1),
(293, 'What is the fraction equivalent of 0.75?', '1/4', '1/2', '3/4', '1', NULL, '3', '0.75 is equivalent to 3/4.', 5, NULL, 1),
(294, 'What is the result of adding 1/3 and 2/5?', '5/8', '11/15', '7/10', '3/8', NULL, '3', 'To add fractions with different denominators, find a common denominator. The common denominator for 1/3 and 2/5 is 15. Therefore, 1/3 + 2/5 = (5/15) + (6/15) = 7/15.', 5, NULL, 1),
(295, 'Alex had a pie divided into 8 equal slices. If Alex ate 3/8 of the pie, how many slices did he eat?', '1', '2', '3', '4', NULL, '4', 'To find the number of slices Alex ate, multiply the total number of slices by the fraction of the pie he ate, which is 8 slices * (3/8) = 24/8 = 3 slices.', 5, NULL, 1),
(296, 'A pizza is divided into 8 equal slices. John ate 3/8 of the pizza. How many slices are left?', '1', '2', '3', '4', NULL, '4', 'John ate 3 out of 8 slices, so the remaining slices are 8 minus 3, which equals 5. Therefore, 4 slices are left.', 5, NULL, 1),
(297, 'Julia saved 5/8 of her monthly salary and spent the rest on bills and groceries. If she spent 3/10 of her monthly salary, what fraction of her salary did she save?', '2/5', '1/2', '3/8', '5/8', NULL, '3', 'Solution: The fraction of her salary that she saved is 1 - 3/10 = 7/10. Therefore, she saved 7/10 of her monthly salary.', 5, NULL, 1),
(298, 'Which fraction is greater: 4/7 or 3/5?', '4/7', '3/5', 'They are equal.', 'Cannot be determined with the given information.', NULL, '2', 'To compare fractions with different denominators, find a common denominator. The common denominator for 4/7 and 3/5 is 35. Therefore, converting both fractions to have a denominator of 35, 4/7 becomes 20/35 and 3/5 becomes 21/35. Since 21/35 is greater than 20/35, 3/5 is the greater fraction.', 5, NULL, 1),
(299, 'What is the result of adding 1/3 and 1/4?', '2/5', '7/12', '1/7', '1/12', NULL, '2', 'To add fractions with different denominators, find the least common multiple (LCM) of the denominators. In this case, the LCM of 3 and 4 is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Adding 1/3 and 1/4 results in 7/12.', 5, NULL, 1),
(300, 'John ate 3/4 of a pizza. What fraction of the pizza is left?', '1/4', '1/3', '1/2', '2/3', NULL, '1', 'To find the fraction of the pizza that is left, we need to subtract the fraction that John ate (3/4) from 1. 1 - 3/4 = 1/4.', 5, NULL, 1),
(301, 'If a recipe calls for 2/3 cup of sugar but you only have 1/4 cup, what fraction of the required sugar do you have?', '1/2', '1/3', '1/4', '1/6', NULL, '2', 'To find the fraction of the required sugar that you have, you divide the amount you have (1/4) by the required amount (2/3). So, 1/4 ÷ 2/3 = 1/4 x 3/2 = 3/8. Therefore, you have 1/3 of the required sugar.', 5, NULL, 1),
(302, 'Sara cuts a cake into 6 equal slices and eats 2 slices. What fraction of the cake did she eat?', '1/6', '2/6', '3/6', '4/6', NULL, '3', 'If Sara eats 2 out of 6 slices, the fraction of the cake she ate is 2/6.', 5, NULL, 1),
(303, 'Which of the following fractions is greater than 1/2?', '2/3', '3/4', '1/3', '4/5', NULL, '2', 'To compare fractions, if the numerators are the same, the fraction with the smaller denominator is greater.', 5, NULL, 1),
(304, 'A pizza is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pizza is left?', '1/8', '3/8', '5/8', '7/8', NULL, '4', 'Solution: Since the pizza was divided into 8 slices and 3 slices were eaten, there are 8 - 3 = 5 slices left. Therefore, the fraction of the pizza that is left is 5/8.', 5, NULL, 1),
(305, 'If a tank is filled with 3/4 of its capacity, what fraction of the tank is empty?', '1/4', '1/3', '1/2', '2/3', NULL, '4', 'To find the fraction of the tank that is empty, we subtract the fraction that is full (3/4) from 1, which gives us 1 - 3/4 = 1/4. So, 2/3 of the tank is empty.', 5, NULL, 1),
(306, 'Which fraction is equivalent to 4/5?', '1/2', '2/4', '8/10', '10/12', NULL, '3', 'To find an equivalent fraction, multiply or divide the numerator and denominator by the same number. In this case, dividing both 4 and 8 by 2 gives the fraction 8/10, which is equivalent to 4/5.', 5, NULL, 1),
(307, 'A group of friends shared a pizza with 10 equal slices. If each friend had 2 slices, how many friends were there in the group?', '3', '4', '5', '6', NULL, '4', 'If each friend had 2 slices and there were 10 slices in total, then there were 10/2 = 5 friends in the group.', 5, NULL, 1),
(308, 'Sarah has 12 marbles and she gives 1/4 of them to her friend. How many marbles does Sarah give to her friend?', '1', '2', '3', '4', NULL, '3', 'If Sarah has 12 marbles and she gives 1/4 of them to her friend, she gives 3 marbles to her friend.', 5, NULL, 1),
(309, 'A certain pizza recipe calls for 3/4 cup of flour. If you want to make 4 pizzas, how many cups of flour do you need?', '1/3', '1', '2', '3', NULL, '3', 'To make 4 pizzas, you need to multiply the amount of flour for 1 pizza by 4, which is (3/4) * 4 = 3 cups of flour.', 5, NULL, 1),
(310, 'If a cake is divided into 8 equal slices and John eats 3/8 of a slice, how many whole slices of cake does he eat?', '1/2', '1', '1 1/2', '2', NULL, '1', 'By dividing 3/8 by 1/8 (the size of one whole slice), we get 3/8 ÷ 1/8 = 3. John eats 3 whole slices.', 5, NULL, 1),
(311, 'A glass is filled to 3/4 of its capacity. If there are 400 ml of liquid in the glass, what is its total capacity?', '400 ml', '600 ml', '800 ml', '1200 ml', NULL, '3', 'If 3/4 of the capacity is equal to 400 ml, then the total capacity is 400 ml * (4/3) = 800 ml.', 5, NULL, 1),
(312, 'A recipe calls for 2/3 cup of sugar. If Lucy wants to make 4 times the recipe, how much sugar does she need?', '1 cup', '1 and 1/3 cups', '1 and 1/2 cups', '2 cups', NULL, '2', 'To find the answer, we need to multiply 2/3 cup by 4. This gives us 8/3 or 2 and 2/3 cups of sugar needed for the recipe.', 5, NULL, 1),
(313, 'A recipe calls for 3/4 cup of sugar, but John only has 1/2 cup. How much more sugar does he need?', '1/4', '1/3', '1/8', '1/6', NULL, '1', 'To find how much more sugar John needs, we need to subtract the fraction he already has (1/2) from the required fraction (3/4). 3/4 - 1/2 = 1/4.', 5, NULL, 1),
(314, 'What is 30% expressed as a fraction in simplest form?', '1/30', '3/10', '3/30', '10/3', NULL, '2', 'To convert a percentage to a fraction, divide the percentage by 100 and simplify. In this case, 30% becomes 30/100, which simplifies to 3/10.', 5, NULL, 1),
(315, 'Which of the following fractions is equivalent to 2/5?', '1/3', '3/5', '4/10', '5/8', NULL, '3', 'To find equivalent fractions, multiply or divide the numerator and denominator by the same number. In this case, multiplying 2 and 5 by 2 gives the fraction 4/10, which is equivalent to 2/5.', 5, NULL, 1),
(316, 'If a rope is 3/4 meters long and you cut off 1/6 meters from it, how long is the remaining rope?', '1/2 meters', '1/3 meters', '1/4 meters', '5/12 meters', NULL, '4', 'Cutting off 1/6 meters from a rope that is 3/4 meters long leaves 5/12 meters of the rope remaining.', 5, NULL, 1),
(317, 'Which fraction is equivalent to 3/5?', '1/5', '2/10', '4/5', '6/5', NULL, '2', 'To find an equivalent fraction, multiply or divide both the numerator and the denominator of the given fraction by the same non-zero number. In this case, multiplying 3/5 by 2/2, we get 6/10, which is equivalent to 3/5.', 5, NULL, 1),
(318, 'If 2/5 of a bucket of water is poured out, what fraction of the water remains?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'If 2/5 of the water is poured out, 3/5 of the water remains.', 5, NULL, 1),
(319, 'What is 2/5 of 40?', '8', '10', '16', '20', NULL, '4', 'To find a fraction of a whole number, multiply the whole number by the numerator and divide by the denominator. In this case, (2/5) * 40 = (2 * 40) / 5 = 80 / 5 = 16. Therefore, 2/5 of 40 is 16.', 5, NULL, 1),
(320, 'Which of the following fractions is equivalent to 1/2?', '3/4', '2/3', '4/5', '5/10', NULL, '4', 'To find an equivalent fraction, the numerator and denominator of the original fraction can be multiplied or divided by the same number.', 5, NULL, 1),
(334, 'A recipe calls for 1/2 cup of flour. If you want to make half of the recipe, how much flour do you need?', '1/4 cup', '1/2 cup', '1 cup', '2 cups', NULL, '1', 'If a recipe calls for 1/2 cup of flour and you want to make half of the recipe, you need 1/4 cup of flour.', 14, NULL, 1),
(335, 'Sandy has a candy bar that is divided into 10 equal pieces. If he eats 3 pieces, what fraction of the candy bar does he have left?', '1/5', '2/5', '3/5', '4/5', NULL, '4', 'Solution: Since there are 10 pieces in total and Sandy eats 3 pieces, he has 10 - 3 = 7 pieces left. Therefore, the fraction of the candy bar he has left is 7/10.', 14, NULL, 1),
(336, 'A rectangle is divided into 12 equal parts. If 9 parts are shaded, what fraction of the rectangle is shaded?', '1/2', '2/3', '3/4', '3/2', NULL, '2', 'If 9 out of 12 parts are shaded, the fraction of the rectangle that is shaded is 9/12, which simplifies to 3/4.', 14, NULL, 1),
(337, 'Linda won 5/6 of the total prize money in a contest. What fraction of the prize money did the other contestants win?', '1/6', '1/3', '1/4', '1/2', NULL, '1', 'To find the fraction of the prize money won by the other contestants, we need to subtract Linda\'s fraction (5/6) from 1. 1 - 5/6 = 1/6.', 14, NULL, 1),
(338, 'Sara finished reading 4/5 of a book. How much of the book does she have left to read?', '1/5', '2/5', '3/5', '4/5', NULL, '1', 'Finishing 4/5 of the book means she has 1/5 of the book left to read.', 14, NULL, 1),
(339, 'A pizza pie is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pie remains?', '5/8', '3/8', '1/8', '2/8', NULL, '2', 'If 3 slices are eaten, there are 8 - 3 = 5 slices remaining. The fraction of the pie that remains is 5/8.', 14, NULL, 1),
(340, 'Sally bought a cake and ate 3/4 of it. If the cake originally weighed 1.5 kg, how much cake did Sally eat?', '0.2 kg', '0.8 kg', '1 kg', '1.2 kg', NULL, '2', 'If Sally ate 3/4 of a cake that originally weighed 1.5 kg, she ate 0.8 kg of cake.', 14, NULL, 1),
(341, 'If a pizza is divided into 8 equal slices and you eat 3 slices, what fraction of the pizza have you eaten?', '1/2', '3/16', '3/8', '2/3', NULL, '3', 'Eating 3 slices out of 8 is equivalent to eating 3/8 of the pizza.', 14, NULL, 1),
(342, 'A tank is filled with 15 liters of water. If 2/5 of the water is drained, how many liters of water are left in the tank?', '3', '6', '9', '12', NULL, '2', 'To find the answer, we need to subtract 2/5 of 15 liters from 15. This gives us 6 liters, which is the amount of water left in the tank.', 14, NULL, 1),
(343, 'A group of friends ordered 3 large pizzas to share. Each pizza was cut into 8 equal slices. If each person had 2 slices, what fraction of the pizzas remained?', '3/16', '1/4', '5/16', '7/16', NULL, '4', 'Solution: There were a total of 24 slices (3 x 8) and each person had 2 slices which means 8 people were served. The remaining slices are 24 - (2 x 8) = 24 - 16 = 8. The fraction representing the remaining slices is 8/24 which simplifies to 1/3 or 7/16.', 14, NULL, 1),
(344, 'A bag contains 12 red marbles and 8 green marbles. What fraction of the marbles are red?', '3/4', '2/3', '3/5', '5/8', NULL, '1', 'Solution: The total number of marbles is 12 + 8 = 20. The fraction of red marbles is 12/20, which can be simplified to 3/5.', 14, NULL, 1),
(345, 'If Amy has 3/5 of a pizza and Sam has 2/5 of the same pizza, what fraction of the pizza do they have in total?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'By adding 3/5 and 2/5, we get a total of 5/5, which is equal to the whole pizza.', 14, NULL, 1),
(346, 'What is the value of 3/4 divided by 2/3?', '1/2', '3/8', '9/8', '8/9', NULL, '3', 'To divide fractions, we need to multiply the first fraction by the reciprocal of the second fraction. So, (3/4) / (2/3) becomes (3/4) * (3/2) = 9/8.', 14, NULL, 1),
(347, 'If 3/4 of a pizza is left, what fraction of the pizza has been eaten?', '1/4', '1/3', '1/2', '3/5', NULL, '3', 'To find the fraction that has been eaten, subtract the fraction that is left from 1 (whole). In this case, 1 - 3/4 = 1/4. Therefore, 3/4 of the pizza has been eaten.', 14, NULL, 1),
(348, 'There are 20 students in a class, and 3/5 of them are girls. How many boys are there in the class?', '4', '6', '8', '12', NULL, '3', 'If 3/5 of the students in a class are girls, then 2/5 of the students are boys. If there are 20 students in total, there are 8 boys in the class.', 14, NULL, 1),
(349, 'Simplify the fraction 16/24.', '2/3', '3/4', '4/5', '5/6', NULL, '1', 'To simplify a fraction, the numerator and denominator can be divided by their greatest common factor (GCF).', 14, NULL, 1),
(350, 'If a pizza is divided into 8 equal slices, and 3 slices are eaten, what fraction of the pizza remains?', '1/5', '1/3', '3/8', '5/8', NULL, '4', 'If 3 out of 8 slices are eaten, 5/8 of the pizza remains.', 14, NULL, 1),
(351, 'What is the equivalent fraction of 5/10?', '1/5', '3/10', '1/2', '2/5', NULL, '3', '5/10 is equivalent to 1/2.', 14, NULL, 1),
(352, 'Which fraction is greater: 2/3 or 3/4?', '2/3', '3/4', 'They are equal', 'Cannot be determined', NULL, '2', 'To compare fractions with different denominators, find a common denominator. In this case, the common denominator is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Comparing 8/12 and 9/12, we can see that 3/4 is greater than 2/3.', 14, NULL, 1),
(353, 'What is the fraction equivalent to 0.75?', '3/4', '1/2', '4/3', '1/3', NULL, '1', 'To convert a decimal to a fraction, the decimal can be written as the numerator and a power of 10 as the denominator.', 14, NULL, 1),
(354, 'A recipe calls for 2/3 cup of sugar. If Laura only has 1/4 cup of sugar, what fraction of the required sugar does she have?', '1/4', '2/7', '1/6', '4/7', NULL, '2', 'To find the fraction of the required sugar that Laura has, we need to divide the amount she has (1/4 cup) by the required amount (2/3 cup). So, (1/4 cup) / (2/3 cup) = (1/4 cup) * (3/2 cup) = 3/8. Therefore, she has 2/7 of the required sugar.', 14, NULL, 1),
(355, 'If a basketball team scores 4/5 of their shots, what fraction of shots do they miss?', '1/5', '1/4', '1/3', '2/5', NULL, '1', 'To find the fraction of shots missed, we subtract the fraction of shots made (4/5) from 1, which gives us 1 - 4/5 = 1/5. So, they miss 1/5 of their shots.', 14, NULL, 1),
(356, 'Emily spent 3/10 of her money on a new book. If she had $50 before buying the book, how much money does she have left?', '$20', '$25', '$30', '$35', NULL, '3', 'To find the answer, we need to multiply $50 by 3/10 and then subtract the result from $50. This gives us $30, which is the amount of money Emily has left.', 14, NULL, 1),
(357, 'What fraction is equivalent to 0.6?', '1/2', '2/3', '3/5', '6/10', NULL, '4', 'To convert a decimal to a fraction, place the decimal number over a power of 10. In this case, 0.6 can be expressed as 6/10, which is equivalent to 3/5.', 14, NULL, 1);
INSERT INTO `question` (`id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `option_5`, `correct_option`, `explanation`, `tst_id`, `marks`, `status`) VALUES
(358, 'What is 3/8 as a decimal?', '0.25', '0.3', '0.375', '0.4', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 8 equals 0.375.', 14, NULL, 1),
(359, 'What is the result of adding 2/3 and 1/4?', '3/7', '4/7', '5/7', '6/7', NULL, '2', 'To add fractions with different denominators, find a common denominator. In this case, the common denominator of 3 and 4 is 12. Then, convert both fractions to have the same denominator. 2/3 becomes 8/12 and 1/4 becomes 3/12. Lastly, add the numerators: 8/12 + 3/12 = 11/12, which simplifies to 4/7.', 14, NULL, 1),
(360, 'The length of a rectangle is 12 cm and its width is 3 cm. What is the fraction representing the ratio of the width to the length?', '3/12', '1/4', '4/1', '12/3', NULL, '2', 'Solution: The fraction representing the ratio of the width to the length is 3/12 which simplifies to 1/4.', 14, NULL, 1),
(361, 'Which fraction is greater: 3/4 or 2/3?', '3/4', '2/3', 'Equal', 'Cannot be determined', NULL, '2', '2/3 is greater than 3/4.', 14, NULL, 1),
(362, 'James baked a cake using a recipe that calls for 1 1/2 cups of flour. If he wants to make half of the recipe, how many cups of flour does he need?', '3/4', '1/2', '1/4', '1/8', NULL, '1', 'To make half of the recipe, James needs to divide the amount of flour by 2, which is (1 1/2) / 2 = 3/4 cup of flour.', 14, NULL, 1),
(363, 'If a pizza is divided into 8 equal slices and you eat 3 of them, what fraction of the pizza have you eaten?', '1/4', '3/8', '3/5', '3/8', NULL, '2', 'If a pizza is divided into 8 equal slices and you eat 3 of them, you have eaten 3/8 of the pizza.', 14, NULL, 1),
(364, 'A recipe calls for 3/4 cup of sugar. If you want to halve the recipe, how much sugar should you use?', '1/4 cup', '1/2 cup', '1 cup', '1 1/2 cups', NULL, '1', 'Solution: Halving the recipe means using half the amount of each ingredient. Half of 3/4 cup is 3/4 x 1/2 = 3/8 cup. Therefore, you should use 1/4 cup of sugar.', 14, NULL, 1),
(365, 'What is 1/2 of 3/4?', '1/4', '3/8', '5/8', '3/4', NULL, '2', '1/2 of 3/4 is equal to 3/8.', 14, NULL, 1),
(366, 'A class has 30 students, out of which 3/5 are boys. How many boys are there in the class?', '10', '12', '15', '18', NULL, '4', 'To find the number of boys in the class, we multiply the total number of students by the fraction representing the proportion of boys (3/5). So, (3/5) * 30 = 18. Therefore, there are 18 boys in the class.', 14, NULL, 1),
(367, 'A baker had 6 cups of flour. He used 2/3 of it to make bread. How many cups of flour did the baker use?', '2', '3', '4', '5', NULL, '3', 'To find the answer, we need to multiply 6 cups of flour by 2/3. This gives us 4 cups, which is the amount of flour the baker used.', 14, NULL, 1),
(368, 'The numerator of a fraction is 4 less than the denominator. If the fraction is simplified to its lowest form, what is the ratio of the numerator to the denominator?', '1:2', '1:3', '1:4', '1:5', NULL, '3', 'Let the denominator of the fraction be D. According to the given condition, the numerator becomes D-4. As the fraction is simplified to its lowest form, there are no common factors between the numerator and denominator. Therefore, the ratio of the numerator to the denominator is 1:4.', 14, NULL, 1),
(369, 'If 2/3 of a cupcake recipe requires 1/2 cup of sugar, how much sugar is needed for the whole recipe?', '1/8', '1/4', '3/4', '1', NULL, '4', 'The whole cupcake recipe requires the amount of sugar for 2/3 which is equal to (2/3) * (1/2) = 1/3 cup of sugar.', 14, NULL, 1),
(370, 'A tank contains 60 liters of water. If 3/5 of the water is used, how many liters of water are left?', '12 liters', '18 liters', '24 liters', '36 liters', NULL, '2', 'Solution: If 3/5 of 60 liters of water is used, then the amount of water left is (1 - 3/5) * 60 = 2/5 * 60 = 24 liters.', 14, NULL, 1),
(371, 'What is 2/3 of 1/4?', '1/3', '1/2', '1/8', '3/4', NULL, '3', 'To find 2/3 of 1/4, multiply them together. (2/3) x (1/4) = 2/12 = 1/6.', 14, NULL, 1),
(372, 'A recipe calls for 2/3 cup of milk. If you want to make 1 1/2 times the recipe, how much milk do you need?', '3/4', '1', '1 1/4', '1 1/2', NULL, '3', 'To find the amount of milk needed for 1 1/2 times the recipe, multiply the amount for 1 recipe by 1 1/2, which is (2/3) * (3/2) = 6/9 = 2/3 + 2/3 + 2/3 = 6/9 = 2/3 cup of milk.', 14, NULL, 1),
(373, 'If 3/4 of a number is 15, what is the number?', '5', '12', '16', '20', NULL, '2', 'To find the number, divide 15 by 3/4. 15 ÷ (3/4) = 15 x (4/3) = 60/3 = 20.', 14, NULL, 1),
(374, 'What is the fraction of shaded squares out of the total squares in the figure below?', '1/2', '2/5', '3/4', '4/7', NULL, '3', 'To find the fraction of shaded squares, we need to compare the number of shaded squares to the total number of squares. In this figure, there are 3 shaded squares out of the total of 4 squares, so the fraction is 3/4.', 14, NULL, 1),
(375, 'Sara has 3/5 of a pizza and John has 1/3 of a pizza. What fraction of the pizza do they have together?', '2/5', '7/15', '4/15', '7/10', NULL, '2', 'To find the fraction of the pizza they have together, we need to find the common denominator for 5 and 3, which is 15. Sara has (3/5) * 15/15 = 9/15 of the pizza, and John has (1/3) * 15/15 = 5/15 of the pizza. Together, they have 9/15 + 5/15 = 14/15 of the pizza.', 14, NULL, 1),
(376, 'The sum of two fractions is 3/5. If one fraction is 1/3, what is the other fraction?', '2/5', '1/5', '1/15', '3/8', NULL, '1', 'To find the other fraction, subtract 1/3 from 3/5. 3/5 - 1/3 = 2/5.', 14, NULL, 1),
(377, 'Which fraction is equivalent to 3/5?', '4/6', '2/4', '6/10', '1/3', NULL, '3', 'To find an equivalent fraction, multiply both the numerator and denominator by the same number. Multiplying 3/5 by 2 gives 6/10, which reduces to 3/5.', 14, NULL, 1),
(378, 'If a fraction is in its simplest form, what is the greatest common factor (GCF) of its numerator and denominator?', '1', '2', '3', '4', NULL, '1', 'If a fraction is in its simplest form, it means that the numerator and denominator have no common factors other than 1.', 14, NULL, 1),
(379, 'Simplify the fraction 9/12.', '3/4', '2/3', '1/2', '4/9', NULL, '2', 'To simplify 9/12, divide both the numerator and denominator by their greatest common factor, which is 3. 9/12 ÷ 3/3 = 3/4.', 14, NULL, 1),
(380, 'A recipe calls for 3/4 cup of sugar. If John wants to make half of the recipe, how much sugar does he need?', '1/4 cup', '3/8 cup', '1/2 cup', '5/8 cup', NULL, '2', 'Solution: If John wants to make half of the recipe, he needs half of 3/4 cup of sugar, which is (1/2) * (3/4) = 3/8 cup.', 14, NULL, 1),
(381, 'What is the simplified form of 2/4?', '1/4', '1/2', '3/4', '3/2', NULL, '2', 'To simplify the fraction 2/4, divide both the numerator and the denominator by their greatest common divisor, which is 2. Therefore, the simplified form of 2/4 is 1/2.', 14, NULL, 1),
(382, 'John saved 1/3 of his monthly salary. If his salary was $1200, how much money did he save?', '$200', '$400', '$600', '$800', NULL, '3', 'Saving 1/3 of $1200 is equivalent to saving $400.', 14, NULL, 1),
(383, 'A car covered 3/5 of a distance in 2 hours. How long would it take to cover the remaining distance if it maintains the same speed?', '1 hour', '1.5 hours', '2.5 hours', '3 hours', NULL, '4', 'Solution: If the car covered 3/5 of the distance in 2 hours, then it covered 1 - 3/5 = 2/5 of the distance in the remaining time. Let\'s call the required time as x hours. Setting up a proportion, we have (2/5) / 2 = (2/5 + 2/x). Solving for x, we get x = 3. Therefore, it would take the car 3 hours to cover the remaining distance.', 14, NULL, 1),
(384, 'Sara has 6/8 cup of milk. How much more milk does she need to make 1 full cup?', '1/8', '1/4', '2/8', '3/8', NULL, '1', 'To find how much more milk Sara needs to make 1 full cup, we need to subtract the fraction she already has (6/8) from 1. 1 - 6/8 = 1/8.', 14, NULL, 1),
(385, 'What is 3/4 as a decimal?', '0.25', '0.5', '0.75', '1', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 4 is 0.75.', 14, NULL, 1),
(386, 'What is the fraction equivalent of 0.75?', '1/4', '1/2', '3/4', '1', NULL, '3', '0.75 is equivalent to 3/4.', 14, NULL, 1),
(387, 'What is the result of adding 1/3 and 2/5?', '5/8', '11/15', '7/10', '3/8', NULL, '3', 'To add fractions with different denominators, find a common denominator. The common denominator for 1/3 and 2/5 is 15. Therefore, 1/3 + 2/5 = (5/15) + (6/15) = 7/15.', 14, NULL, 1),
(388, 'Alex had a pie divided into 8 equal slices. If Alex ate 3/8 of the pie, how many slices did he eat?', '1', '2', '3', '4', NULL, '4', 'To find the number of slices Alex ate, multiply the total number of slices by the fraction of the pie he ate, which is 8 slices * (3/8) = 24/8 = 3 slices.', 14, NULL, 1),
(389, 'A pizza is divided into 8 equal slices. John ate 3/8 of the pizza. How many slices are left?', '1', '2', '3', '4', NULL, '4', 'John ate 3 out of 8 slices, so the remaining slices are 8 minus 3, which equals 5. Therefore, 4 slices are left.', 14, NULL, 1),
(390, 'Julia saved 5/8 of her monthly salary and spent the rest on bills and groceries. If she spent 3/10 of her monthly salary, what fraction of her salary did she save?', '2/5', '1/2', '3/8', '5/8', NULL, '3', 'Solution: The fraction of her salary that she saved is 1 - 3/10 = 7/10. Therefore, she saved 7/10 of her monthly salary.', 14, NULL, 1),
(391, 'Which fraction is greater: 4/7 or 3/5?', '4/7', '3/5', 'They are equal.', 'Cannot be determined with the given information.', NULL, '2', 'To compare fractions with different denominators, find a common denominator. The common denominator for 4/7 and 3/5 is 35. Therefore, converting both fractions to have a denominator of 35, 4/7 becomes 20/35 and 3/5 becomes 21/35. Since 21/35 is greater than 20/35, 3/5 is the greater fraction.', 14, NULL, 1),
(392, 'What is the result of adding 1/3 and 1/4?', '2/5', '7/12', '1/7', '1/12', NULL, '2', 'To add fractions with different denominators, find the least common multiple (LCM) of the denominators. In this case, the LCM of 3 and 4 is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Adding 1/3 and 1/4 results in 7/12.', 14, NULL, 1),
(393, 'John ate 3/4 of a pizza. What fraction of the pizza is left?', '1/4', '1/3', '1/2', '2/3', NULL, '1', 'To find the fraction of the pizza that is left, we need to subtract the fraction that John ate (3/4) from 1. 1 - 3/4 = 1/4.', 14, NULL, 1),
(394, 'If a recipe calls for 2/3 cup of sugar but you only have 1/4 cup, what fraction of the required sugar do you have?', '1/2', '1/3', '1/4', '1/6', NULL, '2', 'To find the fraction of the required sugar that you have, you divide the amount you have (1/4) by the required amount (2/3). So, 1/4 ÷ 2/3 = 1/4 x 3/2 = 3/8. Therefore, you have 1/3 of the required sugar.', 14, NULL, 1),
(395, 'Sara cuts a cake into 6 equal slices and eats 2 slices. What fraction of the cake did she eat?', '1/6', '2/6', '3/6', '4/6', NULL, '3', 'If Sara eats 2 out of 6 slices, the fraction of the cake she ate is 2/6.', 14, NULL, 1),
(396, 'Which of the following fractions is greater than 1/2?', '2/3', '3/4', '1/3', '4/5', NULL, '2', 'To compare fractions, if the numerators are the same, the fraction with the smaller denominator is greater.', 14, NULL, 1),
(397, 'A pizza is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pizza is left?', '1/8', '3/8', '5/8', '7/8', NULL, '4', 'Solution: Since the pizza was divided into 8 slices and 3 slices were eaten, there are 8 - 3 = 5 slices left. Therefore, the fraction of the pizza that is left is 5/8.', 14, NULL, 1),
(398, 'If a tank is filled with 3/4 of its capacity, what fraction of the tank is empty?', '1/4', '1/3', '1/2', '2/3', NULL, '4', 'To find the fraction of the tank that is empty, we subtract the fraction that is full (3/4) from 1, which gives us 1 - 3/4 = 1/4. So, 2/3 of the tank is empty.', 14, NULL, 1),
(399, 'Which fraction is equivalent to 4/5?', '1/2', '2/4', '8/10', '10/12', NULL, '3', 'To find an equivalent fraction, multiply or divide the numerator and denominator by the same number. In this case, dividing both 4 and 8 by 2 gives the fraction 8/10, which is equivalent to 4/5.', 14, NULL, 1),
(400, 'A group of friends shared a pizza with 10 equal slices. If each friend had 2 slices, how many friends were there in the group?', '3', '4', '5', '6', NULL, '4', 'If each friend had 2 slices and there were 10 slices in total, then there were 10/2 = 5 friends in the group.', 14, NULL, 1),
(401, 'Sarah has 12 marbles and she gives 1/4 of them to her friend. How many marbles does Sarah give to her friend?', '1', '2', '3', '4', NULL, '3', 'If Sarah has 12 marbles and she gives 1/4 of them to her friend, she gives 3 marbles to her friend.', 14, NULL, 1),
(402, 'A certain pizza recipe calls for 3/4 cup of flour. If you want to make 4 pizzas, how many cups of flour do you need?', '1/3', '1', '2', '3', NULL, '3', 'To make 4 pizzas, you need to multiply the amount of flour for 1 pizza by 4, which is (3/4) * 4 = 3 cups of flour.', 14, NULL, 1),
(403, 'If a cake is divided into 8 equal slices and John eats 3/8 of a slice, how many whole slices of cake does he eat?', '1/2', '1', '1 1/2', '2', NULL, '1', 'By dividing 3/8 by 1/8 (the size of one whole slice), we get 3/8 ÷ 1/8 = 3. John eats 3 whole slices.', 14, NULL, 1),
(404, 'A glass is filled to 3/4 of its capacity. If there are 400 ml of liquid in the glass, what is its total capacity?', '400 ml', '600 ml', '800 ml', '1200 ml', NULL, '3', 'If 3/4 of the capacity is equal to 400 ml, then the total capacity is 400 ml * (4/3) = 800 ml.', 14, NULL, 1),
(405, 'A recipe calls for 2/3 cup of sugar. If Lucy wants to make 4 times the recipe, how much sugar does she need?', '1 cup', '1 and 1/3 cups', '1 and 1/2 cups', '2 cups', NULL, '2', 'To find the answer, we need to multiply 2/3 cup by 4. This gives us 8/3 or 2 and 2/3 cups of sugar needed for the recipe.', 14, NULL, 1),
(406, 'A recipe calls for 3/4 cup of sugar, but John only has 1/2 cup. How much more sugar does he need?', '1/4', '1/3', '1/8', '1/6', NULL, '1', 'To find how much more sugar John needs, we need to subtract the fraction he already has (1/2) from the required fraction (3/4). 3/4 - 1/2 = 1/4.', 14, NULL, 1),
(407, 'What is 30% expressed as a fraction in simplest form?', '1/30', '3/10', '3/30', '10/3', NULL, '2', 'To convert a percentage to a fraction, divide the percentage by 100 and simplify. In this case, 30% becomes 30/100, which simplifies to 3/10.', 14, NULL, 1),
(408, 'Which of the following fractions is equivalent to 2/5?', '1/3', '3/5', '4/10', '5/8', NULL, '3', 'To find equivalent fractions, multiply or divide the numerator and denominator by the same number. In this case, multiplying 2 and 5 by 2 gives the fraction 4/10, which is equivalent to 2/5.', 14, NULL, 1),
(409, 'If a rope is 3/4 meters long and you cut off 1/6 meters from it, how long is the remaining rope?', '1/2 meters', '1/3 meters', '1/4 meters', '5/12 meters', NULL, '4', 'Cutting off 1/6 meters from a rope that is 3/4 meters long leaves 5/12 meters of the rope remaining.', 14, NULL, 1),
(410, 'Which fraction is equivalent to 3/5?', '1/5', '2/10', '4/5', '6/5', NULL, '2', 'To find an equivalent fraction, multiply or divide both the numerator and the denominator of the given fraction by the same non-zero number. In this case, multiplying 3/5 by 2/2, we get 6/10, which is equivalent to 3/5.', 14, NULL, 1),
(411, 'If 2/5 of a bucket of water is poured out, what fraction of the water remains?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'If 2/5 of the water is poured out, 3/5 of the water remains.', 14, NULL, 1),
(412, 'What is 2/5 of 40?', '8', '10', '16', '20', NULL, '4', 'To find a fraction of a whole number, multiply the whole number by the numerator and divide by the denominator. In this case, (2/5) * 40 = (2 * 40) / 5 = 80 / 5 = 16. Therefore, 2/5 of 40 is 16.', 14, NULL, 1),
(413, 'Which of the following fractions is equivalent to 1/2?', '3/4', '2/3', '4/5', '5/10', NULL, '4', 'To find an equivalent fraction, the numerator and denominator of the original fraction can be multiplied or divided by the same number.', 14, NULL, 1),
(414, 'A recipe calls for 1/2 cup of flour. If you want to make half of the recipe, how much flour do you need?', '1/4 cup', '1/2 cup', '1 cup', '2 cups', NULL, '1', 'If a recipe calls for 1/2 cup of flour and you want to make half of the recipe, you need 1/4 cup of flour.', 15, NULL, 1),
(415, 'Sandy has a candy bar that is divided into 10 equal pieces. If he eats 3 pieces, what fraction of the candy bar does he have left?', '1/5', '2/5', '3/5', '4/5', NULL, '4', 'Solution: Since there are 10 pieces in total and Sandy eats 3 pieces, he has 10 - 3 = 7 pieces left. Therefore, the fraction of the candy bar he has left is 7/10.', 15, NULL, 1),
(416, 'A rectangle is divided into 12 equal parts. If 9 parts are shaded, what fraction of the rectangle is shaded?', '1/2', '2/3', '3/4', '3/2', NULL, '2', 'If 9 out of 12 parts are shaded, the fraction of the rectangle that is shaded is 9/12, which simplifies to 3/4.', 15, NULL, 1),
(417, 'Linda won 5/6 of the total prize money in a contest. What fraction of the prize money did the other contestants win?', '1/6', '1/3', '1/4', '1/2', NULL, '1', 'To find the fraction of the prize money won by the other contestants, we need to subtract Linda\'s fraction (5/6) from 1. 1 - 5/6 = 1/6.', 15, NULL, 1),
(418, 'Sara finished reading 4/5 of a book. How much of the book does she have left to read?', '1/5', '2/5', '3/5', '4/5', NULL, '1', 'Finishing 4/5 of the book means she has 1/5 of the book left to read.', 15, NULL, 1),
(419, 'A pizza pie is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pie remains?', '5/8', '3/8', '1/8', '2/8', NULL, '2', 'If 3 slices are eaten, there are 8 - 3 = 5 slices remaining. The fraction of the pie that remains is 5/8.', 15, NULL, 1),
(420, 'Sally bought a cake and ate 3/4 of it. If the cake originally weighed 1.5 kg, how much cake did Sally eat?', '0.2 kg', '0.8 kg', '1 kg', '1.2 kg', NULL, '2', 'If Sally ate 3/4 of a cake that originally weighed 1.5 kg, she ate 0.8 kg of cake.', 15, NULL, 1),
(421, 'If a pizza is divided into 8 equal slices and you eat 3 slices, what fraction of the pizza have you eaten?', '1/2', '3/16', '3/8', '2/3', NULL, '3', 'Eating 3 slices out of 8 is equivalent to eating 3/8 of the pizza.', 15, NULL, 1),
(422, 'A tank is filled with 15 liters of water. If 2/5 of the water is drained, how many liters of water are left in the tank?', '3', '6', '9', '12', NULL, '2', 'To find the answer, we need to subtract 2/5 of 15 liters from 15. This gives us 6 liters, which is the amount of water left in the tank.', 15, NULL, 1),
(423, 'A group of friends ordered 3 large pizzas to share. Each pizza was cut into 8 equal slices. If each person had 2 slices, what fraction of the pizzas remained?', '3/16', '1/4', '5/16', '7/16', NULL, '4', 'Solution: There were a total of 24 slices (3 x 8) and each person had 2 slices which means 8 people were served. The remaining slices are 24 - (2 x 8) = 24 - 16 = 8. The fraction representing the remaining slices is 8/24 which simplifies to 1/3 or 7/16.', 15, NULL, 1),
(424, 'A bag contains 12 red marbles and 8 green marbles. What fraction of the marbles are red?', '3/4', '2/3', '3/5', '5/8', NULL, '1', 'Solution: The total number of marbles is 12 + 8 = 20. The fraction of red marbles is 12/20, which can be simplified to 3/5.', 15, NULL, 1),
(425, 'If Amy has 3/5 of a pizza and Sam has 2/5 of the same pizza, what fraction of the pizza do they have in total?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'By adding 3/5 and 2/5, we get a total of 5/5, which is equal to the whole pizza.', 15, NULL, 1),
(426, 'What is the value of 3/4 divided by 2/3?', '1/2', '3/8', '9/8', '8/9', NULL, '3', 'To divide fractions, we need to multiply the first fraction by the reciprocal of the second fraction. So, (3/4) / (2/3) becomes (3/4) * (3/2) = 9/8.', 15, NULL, 1),
(427, 'If 3/4 of a pizza is left, what fraction of the pizza has been eaten?', '1/4', '1/3', '1/2', '3/5', NULL, '3', 'To find the fraction that has been eaten, subtract the fraction that is left from 1 (whole). In this case, 1 - 3/4 = 1/4. Therefore, 3/4 of the pizza has been eaten.', 15, NULL, 1),
(428, 'There are 20 students in a class, and 3/5 of them are girls. How many boys are there in the class?', '4', '6', '8', '12', NULL, '3', 'If 3/5 of the students in a class are girls, then 2/5 of the students are boys. If there are 20 students in total, there are 8 boys in the class.', 15, NULL, 1),
(429, 'Simplify the fraction 16/24.', '2/3', '3/4', '4/5', '5/6', NULL, '1', 'To simplify a fraction, the numerator and denominator can be divided by their greatest common factor (GCF).', 15, NULL, 1),
(430, 'If a pizza is divided into 8 equal slices, and 3 slices are eaten, what fraction of the pizza remains?', '1/5', '1/3', '3/8', '5/8', NULL, '4', 'If 3 out of 8 slices are eaten, 5/8 of the pizza remains.', 15, NULL, 1),
(431, 'What is the equivalent fraction of 5/10?', '1/5', '3/10', '1/2', '2/5', NULL, '3', '5/10 is equivalent to 1/2.', 15, NULL, 1),
(432, 'Which fraction is greater: 2/3 or 3/4?', '2/3', '3/4', 'They are equal', 'Cannot be determined', NULL, '2', 'To compare fractions with different denominators, find a common denominator. In this case, the common denominator is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Comparing 8/12 and 9/12, we can see that 3/4 is greater than 2/3.', 15, NULL, 1),
(433, 'What is the fraction equivalent to 0.75?', '3/4', '1/2', '4/3', '1/3', NULL, '1', 'To convert a decimal to a fraction, the decimal can be written as the numerator and a power of 10 as the denominator.', 15, NULL, 1),
(434, 'A recipe calls for 2/3 cup of sugar. If Laura only has 1/4 cup of sugar, what fraction of the required sugar does she have?', '1/4', '2/7', '1/6', '4/7', NULL, '2', 'To find the fraction of the required sugar that Laura has, we need to divide the amount she has (1/4 cup) by the required amount (2/3 cup). So, (1/4 cup) / (2/3 cup) = (1/4 cup) * (3/2 cup) = 3/8. Therefore, she has 2/7 of the required sugar.', 15, NULL, 1),
(435, 'If a basketball team scores 4/5 of their shots, what fraction of shots do they miss?', '1/5', '1/4', '1/3', '2/5', NULL, '1', 'To find the fraction of shots missed, we subtract the fraction of shots made (4/5) from 1, which gives us 1 - 4/5 = 1/5. So, they miss 1/5 of their shots.', 15, NULL, 1),
(436, 'Emily spent 3/10 of her money on a new book. If she had $50 before buying the book, how much money does she have left?', '$20', '$25', '$30', '$35', NULL, '3', 'To find the answer, we need to multiply $50 by 3/10 and then subtract the result from $50. This gives us $30, which is the amount of money Emily has left.', 15, NULL, 1),
(437, 'What fraction is equivalent to 0.6?', '1/2', '2/3', '3/5', '6/10', NULL, '4', 'To convert a decimal to a fraction, place the decimal number over a power of 10. In this case, 0.6 can be expressed as 6/10, which is equivalent to 3/5.', 15, NULL, 1),
(438, 'What is 3/8 as a decimal?', '0.25', '0.3', '0.375', '0.4', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 8 equals 0.375.', 15, NULL, 1),
(439, 'What is the result of adding 2/3 and 1/4?', '3/7', '4/7', '5/7', '6/7', NULL, '2', 'To add fractions with different denominators, find a common denominator. In this case, the common denominator of 3 and 4 is 12. Then, convert both fractions to have the same denominator. 2/3 becomes 8/12 and 1/4 becomes 3/12. Lastly, add the numerators: 8/12 + 3/12 = 11/12, which simplifies to 4/7.', 15, NULL, 1),
(440, 'The length of a rectangle is 12 cm and its width is 3 cm. What is the fraction representing the ratio of the width to the length?', '3/12', '1/4', '4/1', '12/3', NULL, '2', 'Solution: The fraction representing the ratio of the width to the length is 3/12 which simplifies to 1/4.', 15, NULL, 1),
(441, 'Which fraction is greater: 3/4 or 2/3?', '3/4', '2/3', 'Equal', 'Cannot be determined', NULL, '2', '2/3 is greater than 3/4.', 15, NULL, 1),
(442, 'James baked a cake using a recipe that calls for 1 1/2 cups of flour. If he wants to make half of the recipe, how many cups of flour does he need?', '3/4', '1/2', '1/4', '1/8', NULL, '1', 'To make half of the recipe, James needs to divide the amount of flour by 2, which is (1 1/2) / 2 = 3/4 cup of flour.', 15, NULL, 1),
(443, 'If a pizza is divided into 8 equal slices and you eat 3 of them, what fraction of the pizza have you eaten?', '1/4', '3/8', '3/5', '3/8', NULL, '2', 'If a pizza is divided into 8 equal slices and you eat 3 of them, you have eaten 3/8 of the pizza.', 15, NULL, 1),
(444, 'A recipe calls for 3/4 cup of sugar. If you want to halve the recipe, how much sugar should you use?', '1/4 cup', '1/2 cup', '1 cup', '1 1/2 cups', NULL, '1', 'Solution: Halving the recipe means using half the amount of each ingredient. Half of 3/4 cup is 3/4 x 1/2 = 3/8 cup. Therefore, you should use 1/4 cup of sugar.', 15, NULL, 1),
(445, 'What is 1/2 of 3/4?', '1/4', '3/8', '5/8', '3/4', NULL, '2', '1/2 of 3/4 is equal to 3/8.', 15, NULL, 1),
(446, 'A class has 30 students, out of which 3/5 are boys. How many boys are there in the class?', '10', '12', '15', '18', NULL, '4', 'To find the number of boys in the class, we multiply the total number of students by the fraction representing the proportion of boys (3/5). So, (3/5) * 30 = 18. Therefore, there are 18 boys in the class.', 15, NULL, 1),
(447, 'A baker had 6 cups of flour. He used 2/3 of it to make bread. How many cups of flour did the baker use?', '2', '3', '4', '5', NULL, '3', 'To find the answer, we need to multiply 6 cups of flour by 2/3. This gives us 4 cups, which is the amount of flour the baker used.', 15, NULL, 1),
(448, 'The numerator of a fraction is 4 less than the denominator. If the fraction is simplified to its lowest form, what is the ratio of the numerator to the denominator?', '1:2', '1:3', '1:4', '1:5', NULL, '3', 'Let the denominator of the fraction be D. According to the given condition, the numerator becomes D-4. As the fraction is simplified to its lowest form, there are no common factors between the numerator and denominator. Therefore, the ratio of the numerator to the denominator is 1:4.', 15, NULL, 1),
(449, 'If 2/3 of a cupcake recipe requires 1/2 cup of sugar, how much sugar is needed for the whole recipe?', '1/8', '1/4', '3/4', '1', NULL, '4', 'The whole cupcake recipe requires the amount of sugar for 2/3 which is equal to (2/3) * (1/2) = 1/3 cup of sugar.', 15, NULL, 1),
(450, 'A tank contains 60 liters of water. If 3/5 of the water is used, how many liters of water are left?', '12 liters', '18 liters', '24 liters', '36 liters', NULL, '2', 'Solution: If 3/5 of 60 liters of water is used, then the amount of water left is (1 - 3/5) * 60 = 2/5 * 60 = 24 liters.', 15, NULL, 1),
(451, 'What is 2/3 of 1/4?', '1/3', '1/2', '1/8', '3/4', NULL, '3', 'To find 2/3 of 1/4, multiply them together. (2/3) x (1/4) = 2/12 = 1/6.', 15, NULL, 1),
(452, 'A recipe calls for 2/3 cup of milk. If you want to make 1 1/2 times the recipe, how much milk do you need?', '3/4', '1', '1 1/4', '1 1/2', NULL, '3', 'To find the amount of milk needed for 1 1/2 times the recipe, multiply the amount for 1 recipe by 1 1/2, which is (2/3) * (3/2) = 6/9 = 2/3 + 2/3 + 2/3 = 6/9 = 2/3 cup of milk.', 15, NULL, 1),
(453, 'If 3/4 of a number is 15, what is the number?', '5', '12', '16', '20', NULL, '2', 'To find the number, divide 15 by 3/4. 15 ÷ (3/4) = 15 x (4/3) = 60/3 = 20.', 15, NULL, 1),
(454, 'What is the fraction of shaded squares out of the total squares in the figure below?', '1/2', '2/5', '3/4', '4/7', NULL, '3', 'To find the fraction of shaded squares, we need to compare the number of shaded squares to the total number of squares. In this figure, there are 3 shaded squares out of the total of 4 squares, so the fraction is 3/4.', 15, NULL, 1),
(455, 'Sara has 3/5 of a pizza and John has 1/3 of a pizza. What fraction of the pizza do they have together?', '2/5', '7/15', '4/15', '7/10', NULL, '2', 'To find the fraction of the pizza they have together, we need to find the common denominator for 5 and 3, which is 15. Sara has (3/5) * 15/15 = 9/15 of the pizza, and John has (1/3) * 15/15 = 5/15 of the pizza. Together, they have 9/15 + 5/15 = 14/15 of the pizza.', 15, NULL, 1),
(456, 'The sum of two fractions is 3/5. If one fraction is 1/3, what is the other fraction?', '2/5', '1/5', '1/15', '3/8', NULL, '1', 'To find the other fraction, subtract 1/3 from 3/5. 3/5 - 1/3 = 2/5.', 15, NULL, 1),
(457, 'Which fraction is equivalent to 3/5?', '4/6', '2/4', '6/10', '1/3', NULL, '3', 'To find an equivalent fraction, multiply both the numerator and denominator by the same number. Multiplying 3/5 by 2 gives 6/10, which reduces to 3/5.', 15, NULL, 1),
(458, 'If a fraction is in its simplest form, what is the greatest common factor (GCF) of its numerator and denominator?', '1', '2', '3', '4', NULL, '1', 'If a fraction is in its simplest form, it means that the numerator and denominator have no common factors other than 1.', 15, NULL, 1),
(459, 'Simplify the fraction 9/12.', '3/4', '2/3', '1/2', '4/9', NULL, '2', 'To simplify 9/12, divide both the numerator and denominator by their greatest common factor, which is 3. 9/12 ÷ 3/3 = 3/4.', 15, NULL, 1),
(460, 'A recipe calls for 3/4 cup of sugar. If John wants to make half of the recipe, how much sugar does he need?', '1/4 cup', '3/8 cup', '1/2 cup', '5/8 cup', NULL, '2', 'Solution: If John wants to make half of the recipe, he needs half of 3/4 cup of sugar, which is (1/2) * (3/4) = 3/8 cup.', 15, NULL, 1),
(461, 'What is the simplified form of 2/4?', '1/4', '1/2', '3/4', '3/2', NULL, '2', 'To simplify the fraction 2/4, divide both the numerator and the denominator by their greatest common divisor, which is 2. Therefore, the simplified form of 2/4 is 1/2.', 15, NULL, 1),
(462, 'John saved 1/3 of his monthly salary. If his salary was $1200, how much money did he save?', '$200', '$400', '$600', '$800', NULL, '3', 'Saving 1/3 of $1200 is equivalent to saving $400.', 15, NULL, 1),
(463, 'A car covered 3/5 of a distance in 2 hours. How long would it take to cover the remaining distance if it maintains the same speed?', '1 hour', '1.5 hours', '2.5 hours', '3 hours', NULL, '4', 'Solution: If the car covered 3/5 of the distance in 2 hours, then it covered 1 - 3/5 = 2/5 of the distance in the remaining time. Let\'s call the required time as x hours. Setting up a proportion, we have (2/5) / 2 = (2/5 + 2/x). Solving for x, we get x = 3. Therefore, it would take the car 3 hours to cover the remaining distance.', 15, NULL, 1),
(464, 'Sara has 6/8 cup of milk. How much more milk does she need to make 1 full cup?', '1/8', '1/4', '2/8', '3/8', NULL, '1', 'To find how much more milk Sara needs to make 1 full cup, we need to subtract the fraction she already has (6/8) from 1. 1 - 6/8 = 1/8.', 15, NULL, 1),
(465, 'What is 3/4 as a decimal?', '0.25', '0.5', '0.75', '1', NULL, '3', 'To convert a fraction to a decimal, divide the numerator by the denominator. In this case, 3 divided by 4 is 0.75.', 15, NULL, 1),
(466, 'What is the fraction equivalent of 0.75?', '1/4', '1/2', '3/4', '1', NULL, '3', '0.75 is equivalent to 3/4.', 15, NULL, 1),
(467, 'What is the result of adding 1/3 and 2/5?', '5/8', '11/15', '7/10', '3/8', NULL, '3', 'To add fractions with different denominators, find a common denominator. The common denominator for 1/3 and 2/5 is 15. Therefore, 1/3 + 2/5 = (5/15) + (6/15) = 7/15.', 15, NULL, 1),
(468, 'Alex had a pie divided into 8 equal slices. If Alex ate 3/8 of the pie, how many slices did he eat?', '1', '2', '3', '4', NULL, '4', 'To find the number of slices Alex ate, multiply the total number of slices by the fraction of the pie he ate, which is 8 slices * (3/8) = 24/8 = 3 slices.', 15, NULL, 1),
(469, 'A pizza is divided into 8 equal slices. John ate 3/8 of the pizza. How many slices are left?', '1', '2', '3', '4', NULL, '4', 'John ate 3 out of 8 slices, so the remaining slices are 8 minus 3, which equals 5. Therefore, 4 slices are left.', 15, NULL, 1),
(470, 'Julia saved 5/8 of her monthly salary and spent the rest on bills and groceries. If she spent 3/10 of her monthly salary, what fraction of her salary did she save?', '2/5', '1/2', '3/8', '5/8', NULL, '3', 'Solution: The fraction of her salary that she saved is 1 - 3/10 = 7/10. Therefore, she saved 7/10 of her monthly salary.', 15, NULL, 1),
(471, 'Which fraction is greater: 4/7 or 3/5?', '4/7', '3/5', 'They are equal.', 'Cannot be determined with the given information.', NULL, '2', 'To compare fractions with different denominators, find a common denominator. The common denominator for 4/7 and 3/5 is 35. Therefore, converting both fractions to have a denominator of 35, 4/7 becomes 20/35 and 3/5 becomes 21/35. Since 21/35 is greater than 20/35, 3/5 is the greater fraction.', 15, NULL, 1),
(472, 'What is the result of adding 1/3 and 1/4?', '2/5', '7/12', '1/7', '1/12', NULL, '2', 'To add fractions with different denominators, find the least common multiple (LCM) of the denominators. In this case, the LCM of 3 and 4 is 12. Then, convert each fraction to have a denominator of 12 by multiplying the numerator and denominator by the appropriate factors. Adding 1/3 and 1/4 results in 7/12.', 15, NULL, 1),
(473, 'John ate 3/4 of a pizza. What fraction of the pizza is left?', '1/4', '1/3', '1/2', '2/3', NULL, '1', 'To find the fraction of the pizza that is left, we need to subtract the fraction that John ate (3/4) from 1. 1 - 3/4 = 1/4.', 15, NULL, 1),
(474, 'If a recipe calls for 2/3 cup of sugar but you only have 1/4 cup, what fraction of the required sugar do you have?', '1/2', '1/3', '1/4', '1/6', NULL, '2', 'To find the fraction of the required sugar that you have, you divide the amount you have (1/4) by the required amount (2/3). So, 1/4 ÷ 2/3 = 1/4 x 3/2 = 3/8. Therefore, you have 1/3 of the required sugar.', 15, NULL, 1),
(475, 'Sara cuts a cake into 6 equal slices and eats 2 slices. What fraction of the cake did she eat?', '1/6', '2/6', '3/6', '4/6', NULL, '3', 'If Sara eats 2 out of 6 slices, the fraction of the cake she ate is 2/6.', 15, NULL, 1),
(476, 'Which of the following fractions is greater than 1/2?', '2/3', '3/4', '1/3', '4/5', NULL, '2', 'To compare fractions, if the numerators are the same, the fraction with the smaller denominator is greater.', 15, NULL, 1),
(477, 'A pizza is divided into 8 equal slices. If 3 slices are eaten, what fraction of the pizza is left?', '1/8', '3/8', '5/8', '7/8', NULL, '4', 'Solution: Since the pizza was divided into 8 slices and 3 slices were eaten, there are 8 - 3 = 5 slices left. Therefore, the fraction of the pizza that is left is 5/8.', 15, NULL, 1),
(478, 'If a tank is filled with 3/4 of its capacity, what fraction of the tank is empty?', '1/4', '1/3', '1/2', '2/3', NULL, '4', 'To find the fraction of the tank that is empty, we subtract the fraction that is full (3/4) from 1, which gives us 1 - 3/4 = 1/4. So, 2/3 of the tank is empty.', 15, NULL, 1),
(479, 'Which fraction is equivalent to 4/5?', '1/2', '2/4', '8/10', '10/12', NULL, '3', 'To find an equivalent fraction, multiply or divide the numerator and denominator by the same number. In this case, dividing both 4 and 8 by 2 gives the fraction 8/10, which is equivalent to 4/5.', 15, NULL, 1),
(480, 'A group of friends shared a pizza with 10 equal slices. If each friend had 2 slices, how many friends were there in the group?', '3', '4', '5', '6', NULL, '4', 'If each friend had 2 slices and there were 10 slices in total, then there were 10/2 = 5 friends in the group.', 15, NULL, 1),
(481, 'Sarah has 12 marbles and she gives 1/4 of them to her friend. How many marbles does Sarah give to her friend?', '1', '2', '3', '4', NULL, '3', 'If Sarah has 12 marbles and she gives 1/4 of them to her friend, she gives 3 marbles to her friend.', 15, NULL, 1),
(482, 'A certain pizza recipe calls for 3/4 cup of flour. If you want to make 4 pizzas, how many cups of flour do you need?', '1/3', '1', '2', '3', NULL, '3', 'To make 4 pizzas, you need to multiply the amount of flour for 1 pizza by 4, which is (3/4) * 4 = 3 cups of flour.', 15, NULL, 1),
(483, 'If a cake is divided into 8 equal slices and John eats 3/8 of a slice, how many whole slices of cake does he eat?', '1/2', '1', '1 1/2', '2', NULL, '1', 'By dividing 3/8 by 1/8 (the size of one whole slice), we get 3/8 ÷ 1/8 = 3. John eats 3 whole slices.', 15, NULL, 1),
(484, 'A glass is filled to 3/4 of its capacity. If there are 400 ml of liquid in the glass, what is its total capacity?', '400 ml', '600 ml', '800 ml', '1200 ml', NULL, '3', 'If 3/4 of the capacity is equal to 400 ml, then the total capacity is 400 ml * (4/3) = 800 ml.', 15, NULL, 1),
(485, 'A recipe calls for 2/3 cup of sugar. If Lucy wants to make 4 times the recipe, how much sugar does she need?', '1 cup', '1 and 1/3 cups', '1 and 1/2 cups', '2 cups', NULL, '2', 'To find the answer, we need to multiply 2/3 cup by 4. This gives us 8/3 or 2 and 2/3 cups of sugar needed for the recipe.', 15, NULL, 1),
(486, 'A recipe calls for 3/4 cup of sugar, but John only has 1/2 cup. How much more sugar does he need?', '1/4', '1/3', '1/8', '1/6', NULL, '1', 'To find how much more sugar John needs, we need to subtract the fraction he already has (1/2) from the required fraction (3/4). 3/4 - 1/2 = 1/4.', 15, NULL, 1),
(487, 'What is 30% expressed as a fraction in simplest form?', '1/30', '3/10', '3/30', '10/3', NULL, '2', 'To convert a percentage to a fraction, divide the percentage by 100 and simplify. In this case, 30% becomes 30/100, which simplifies to 3/10.', 15, NULL, 1),
(488, 'Which of the following fractions is equivalent to 2/5?', '1/3', '3/5', '4/10', '5/8', NULL, '3', 'To find equivalent fractions, multiply or divide the numerator and denominator by the same number. In this case, multiplying 2 and 5 by 2 gives the fraction 4/10, which is equivalent to 2/5.', 15, NULL, 1),
(489, 'If a rope is 3/4 meters long and you cut off 1/6 meters from it, how long is the remaining rope?', '1/2 meters', '1/3 meters', '1/4 meters', '5/12 meters', NULL, '4', 'Cutting off 1/6 meters from a rope that is 3/4 meters long leaves 5/12 meters of the rope remaining.', 15, NULL, 1),
(490, 'Which fraction is equivalent to 3/5?', '1/5', '2/10', '4/5', '6/5', NULL, '2', 'To find an equivalent fraction, multiply or divide both the numerator and the denominator of the given fraction by the same non-zero number. In this case, multiplying 3/5 by 2/2, we get 6/10, which is equivalent to 3/5.', 15, NULL, 1),
(491, 'If 2/5 of a bucket of water is poured out, what fraction of the water remains?', '1/5', '2/5', '3/5', '4/5', NULL, '3', 'If 2/5 of the water is poured out, 3/5 of the water remains.', 15, NULL, 1),
(492, 'What is 2/5 of 40?', '8', '10', '16', '20', NULL, '4', 'To find a fraction of a whole number, multiply the whole number by the numerator and divide by the denominator. In this case, (2/5) * 40 = (2 * 40) / 5 = 80 / 5 = 16. Therefore, 2/5 of 40 is 16.', 15, NULL, 1),
(493, 'Which of the following fractions is equivalent to 1/2?', '3/4', '2/3', '4/5', '5/10', NULL, '4', 'To find an equivalent fraction, the numerator and denominator of the original fraction can be multiplied or divided by the same number.', 15, NULL, 1),
(494, 'Two numbers have a 3:5 ratio. The new numbers have a ratio of 12:23 if 7 is added to each. The maximizing number is:', '25', '29', '41', '47', NULL, '3', 'Let the numbers be 3x and 5x. Then, (3x + 7) / (5x + 7) = 12/23. Solving this equation, x = 4. The maximizing number = 5 * 4 + 7 = 27.', 16, NULL, 1),
(495, 'In a school, the ratio of boys to girls is 7:11. If the number of boys is increased by 14 and the number of girls is increased by 22, the new ratio becomes 5:8. The original number of boys is:', '14', '21', '28', '35', NULL, '3', 'Let the number of boys be 7x and girls be 11x. Then, (7x + 14) / (11x + 22) = 5/8. Solving this equation, x = 6. The original number of boys = 7 * 6 = 42.', 16, NULL, 1),
(496, 'Two numbers have a ratio of 5:8. If the first number is multiplied by 3 and the second number is multiplied by 4, the new ratio becomes 15:32. The original ratio of the numbers is:', '2:3', '3:5', '4:5', '5:8', NULL, '4', 'Let the first number be 5x and the second number be 8x. Then, (3 * 5x) / (4 * 8x) = 15/32. Solving this equation, x = 8/15. The original ratio of the numbers = 5x:8x = 5 * (8/15):8 * (8/15) = 2/3:8/5 = 2:3.', 16, NULL, 1),
(497, 'The ratio of the ages of John and Peter is 2:5. After 10 years, the ratio of their ages will be 3:7. What is John\'s current age?', '10', '14', '16', '20', NULL, '3', 'Let the current ages of John and Peter be 2x and 5x respectively. After 10 years, (2x + 10) / (5x + 10) = 3/7. Solving this equation, x = 10/3. John\'s current age = 2x = 2 * (10/3) = 20/3 ≈ 6.67 years ≈ 16.67 years.', 16, NULL, 1),
(498, 'The ratio of the prices of two items is 3:4. If the price of the second item is $48, what is the price of the first item?', '$24', '$32', '$36', '$44', NULL, '2', 'Let the price of the first item be 3x dollars. Then, 4x = 48. Solving this equation, x = 12. The price of the first item = 3x = 3 * 12 = $36.', 16, NULL, 1),
(499, 'If 60% of a number is equal to two-thirds of another number, what is the ratio of the first number to the second number?', '2:3', '3:2', '4:5', '5:4', NULL, '2', 'Let 60% of A = 2B/3. Then, 60A = 2B/3 * 100.   2A = 2B/3 * 5.  A = 5B/3. A : B = 5 : 3.', 16, NULL, 1),
(500, 'If the ratio of boys to girls in a class is 3:4 and there are 28 students in the class, how many boys are there?', '9', '12', '16', '21', NULL, '3', 'Let the number of boys be 3x and the number of girls be 4x. 3x + 4x = 28. 7x = 28. x = 4. So there are 3 * 4 = 12 boys.', 16, NULL, 1),
(501, 'The ratio of the length of a rectangle to its width is 5:2. If the width is 10 cm, what is the length?', '15 cm', '20 cm', '25 cm', '30 cm', NULL, '3', 'Let the length be 5x. Then, 5x/10 = 5/2. 5x = 50, x = 10. So the length is 5 * 10 = 50 cm.', 16, NULL, 1),
(502, 'The ratio of the number of apples to the number of oranges in a basket is 3:4. If there are 21 oranges in the basket, how many apples are there?', '09', '12', '15', '18', NULL, '2', 'Let the number of apples be 3x and the number of oranges be 4x. Since there are 21 oranges, 4x = 21. x = 21/4 = 5.25. So, there are 3 * 5.25 = 15.75 apples.', 16, NULL, 1),
(503, 'If the ratio of the height to the width of a rectangle is 3:8 and the width is 12m, what is the height of the rectangle?', '4.50m', '4.80m', '10.50m', '12.00m', NULL, '3', 'Let the height be 3x. Then, 3x/12 = 3/8. 3x = 3 * 12/8 = 9/2 = 4.50. So the height is 3 * 4.50 = 10.50m.', 16, NULL, 1),
(504, 'In a box of colored pencils, the ratio of red pencils to blue pencils is 3:5. If there are 40 blue pencils, how many red pencils are there?', '15', '25', '45', '75', NULL, '4', 'The ratio of red pencils to blue pencils is 3:5, so the number of red pencils can be found by multiplying 3 by the number of blue pencils. 3 x 40 = 120. Therefore, there are 120 red pencils.', 16, NULL, 1),
(505, 'In a school, the ratio of boys to girls is 4:7. If there are 56 girls, how many boys are there?', '16', '24', '32', '48', NULL, '3', 'The ratio of boys to girls is 4:7, so the number of boys can be found by multiplying 4 by the number of girls. 4 x 56 = 224. Therefore, there are 224 boys.', 16, NULL, 1),
(506, 'A recipe for a cake requires a ratio of 2 cups of flour to 3 cups of sugar. If there are 12 cups of sugar, how many cups of flour are needed?', '6', '8', '10', '12', NULL, '2', 'The ratio of flour to sugar is 2:3, so the number of cups of flour can be found by multiplying 2 by the number of cups of sugar. 2 x 12 = 24. Therefore, 24 cups of flour are needed.', 16, NULL, 1),
(507, 'A car travels 240 miles in 4 hours. At that rate, how far will it travel in 6 hours?', '240', '360', '480', '720', NULL, '3', 'The car travels 240 miles in 4 hours, so its rate is 240/4 = 60 miles per hour. To find the distance traveled in 6 hours, multiply the rate by the time: 60 x 6 = 360 miles. Therefore, the car will travel 360 miles in 6 hours.', 16, NULL, 1),
(508, 'The length of a rectangle is 12 cm and its width is in the ratio 3:5. What is the width of the rectangle?', '3 cm', '5 cm', '6 cm', '10 cm', NULL, '3', 'The ratio of the width to the length is 3:5, so the width can be found by multiplying 3 by the length and then dividing by 5. (3 x 12) / 5 = 36 / 5 = 7.2. Therefore, the width of the rectangle is 7.2 cm.', 16, NULL, 1),
(509, 'Sneha bought 5 8 kg of flour. If she used 1 4 kg of flour to make a cake, how much flour does Sneha have now?', '1 2 kg', '3 8 kg', '3 4 kg', '9 8 kg', NULL, '3', 'Total weight of flour = 5 8 kg\nFraction of flour used in cake = 1 4 kg\nWeight of flour left = 5 8 kg - 1 4 kg = 3 8 kg\nTherefore Sneha has 3 8 kg of flour now.', 17, NULL, 1),
(510, 'sushant has 10 apples and he gives sneha 3 apples. How many apples does sushant have left?', '5', '6', '7', '8', NULL, '1', 'Apples sushant has = 10\nApples given to sneha = 3\nApples left with sushant = 10 - 3 = 7', 17, NULL, 1),
(511, 'sushant bought 3 1/2 kg of rice. sneha used 2 1/4 kg of rice to cook. How much rice is left?', '1/4 kg', '5/4 kg', '1 kg', '2 1/4 kg', NULL, '2', 'Total rice bought by sushant = 3 1/2 kg = 3x2+1 = 7/2 kg\nRice used for cooking = 2 1/4 kg = 2x4+1 = 9/4 kg\nRice left = Total rice bought - Rice used for cooking = 7/2 - 9/4\nTo subtract fractions, find a common denominator and subtract the numerators. The common denominator is 4.\n7/2 - 9/4 = (7x2)/(2x4) - 9/4 = 14/8 - 9/4 = (14-18)/8 = -4/8 = -1/2\nTherefore, the rice left is 1/2 kg. Note that a negative value suggests that more rice was used than bought, so please check the calculations.', 17, NULL, 1),
(512, 'A bag contains 9 red marbles and 3 4 of the marbles are green. How many green marbles are there in the bag?', '3 green marbles', '6 green marbles', '7 green marbles', '9 green marbles', NULL, '2', 'Total marbles in the bag = 9 + 3 4 = 9 + 9 4 = 36 4 + 9 4 = 45 4\nNumber of green marbles = 3 4 of 45 4 = 3 4 × 45 4 = 135 4 = 33 3 4 = 6 green marbles\nTherefore there are 6 green marbles in the bag.', 17, NULL, 1),
(513, 'A cake recipe requires 1/2 cup of sugar. If sneha only has 1/4 cup of sugar, how much more does she need?', '1/4 cup', '1/8 cup', '3/4 cup', '1/2 cup', NULL, '3', 'Sugar required for the recipe = 1/2 cup\nSugar sneha has = 1/4 cup\nSugar more needed = Sugar required - Sugar sneha has = 1/2 - 1/4 = 2/4 - 1/4 = 1/4 = 3/4 cup', 17, NULL, 1),
(514, 'Ruby baked a cake using 3 1/2 cups of flour. If the recipe required 2 3/4 cups of flour, how much extra flour did Ruby use?', '3/4 cups', '1 cups', '2 1/4 cups', '4 3/4 cups', NULL, '3', 'Flour used by Ruby = 3 1/2 cups = 3x2+1 = 7/2 cups\nFlour required by the recipe = 2 3/4 cups = 2x4+3 = 11/4 cups\nExtra flour used = Flour used by Ruby - Flour required by the recipe\nTo subtract fractions, find a common denominator and subtract the numerators. The common denominator is 4.\n7/2 - 11/4 = (7x2)/(2x2) - 11/4 = 14/4 - 11/4 = (14-11)/4 = 3/4\nTherefore, Ruby used an extra 3/4 cups of flour.', 17, NULL, 1),
(515, 'sneha spent 3/5 of her allowance on a toy. If her allowance is $20, how much money did she spend?', '$10', '$8', '$12', '$15', NULL, '3', 'Allowance of sneha = $20\nMoney spent by sneha = 3/5 of $20 = (3/5) x $20 = $12', 17, NULL, 1),
(516, 'sneha bought 2 3/8 meters of fabric. If she used 1 7/8 meters to make a dress, how much fabric does she have left?', '1/4 meters', '3 meters', '3 3/8 meters', '4 7/8 meters', NULL, '3', 'Total fabric bought by sneha = 2 3/8 meters = 2x8+3 = 19/8 meters\nFabric used to make a dress = 1 7/8 meters = 1x8+7 = 15/8 meters\nFabric left = Total fabric bought - Fabric used to make a dress\nTo subtract fractions, find a common denominator and subtract the numerators. The common denominator is 8.\n19/8 - 15/8 = (19-15)/8 = 4/8 = 1/2\nTherefore, sneha has 1/2 meters of fabric left.', 17, NULL, 1),
(517, 'A cake recipe requires 3/4 cups of sugar. If sushant only has 1/8 cups of sugar, how much more sugar does he need?', '5/8 cups', '7/8 cups', '1 cups', '1 1/8 cups', NULL, '1', 'Sugar required by the recipe = 3/4 cups\nSugar sushant has = 1/8 cups\nSugar needed = Sugar required by the recipe - Sugar sushant has\nTo subtract fractions, find a common denominator and subtract the numerators. The common denominator is 8.\n3/4 - 1/8 = (3x2)/8 - 1/8 = 6/8 - 1/8 = (6-1)/8 = 5/8\nTherefore, sushant needs an additional 5/8 cups of sugar.', 17, NULL, 1),
(518, 'A rectangular cake is divided into 5 equal parts. If Sneha ate 2 5 parts of the cake, how much cake is left?', '3 5 parts', '2 5 parts', '1 5 parts', '4 5 parts', NULL, '1', 'Total parts of the cake = 5\nFraction of cake eaten by Sneha = 2 5 parts\nParts of cake left = 5 parts - 2 5 parts = 3 5 parts\nTherefore 3 5 parts of cake is left.', 17, NULL, 1),
(519, 'If a rope measuring 9 12 m is cut into 3 equal parts, what is the length of each part?', '1 12 m', '2 12 m', '3 12 m', '4 12 m', NULL, '2', 'Total length of rope = 9 12 m\nNumber of equal parts = 3\nLength of each part = 9 12 m ÷ 3 = 3 12 m = 2 12 m\nTherefore the length of each part is 2 12 m.', 17, NULL, 1),
(520, 'If sneha ate 1/4 of a pizza that was cut into 8 equal slices, how many slices are left?', '6', '5', '4', '3', NULL, '3', 'Total slices = 8\nSlices eaten by sneha = 1/4 of 8 = 8/4 = 2\nSlices left = Total slices - Slices eaten = 8 - 2 = 6', 17, NULL, 1);
INSERT INTO `question` (`id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `option_5`, `correct_option`, `explanation`, `tst_id`, `marks`, `status`) VALUES
(521, 'In a container, there are 5/8 liters of milk. 3/4 liters of milk are used to make tea. How much milk is left in the container?', '1/8 liters', '7/8 liters', '1 3/8 liters', '1 1/4 liters', NULL, '1', 'Total milk in the container = 5/8 liters\nMilk used to make tea = 3/4 liters\nMilk left = Total milk - Milk used to make tea\nTo subtract fractions, find a common denominator and subtract the numerators. The common denominator is 8.\n5/8 - 3/4 = (5x1)/(8x1) - 3/4 = 5/8 - (3x2)/(4x2) = 5/8 - 6/8 = (5-6)/8 = -1/8\nTherefore, the milk left in the container is -1/8 liters. Note that a negative value suggests that more milk was used than available, so please check the calculations.', 17, NULL, 1),
(522, 'Sushant had 12 34 kg of apples. If he gave 3 12 kg of apples to his friend, how much apples does Sushant have now?', '7 22 kg', '9 22 kg', '8 22 kg', '7 24 kg', NULL, '2', 'Total weight of apples = 12 34 kg\nFraction of apples given to friend = 3 12 kg\nWeight of apples left = 12 34 kg - 3 12 kg = 9 22 kg\nTherefore Sushant has 9 22 kg of apples now.', 17, NULL, 1),
(523, 'sushant solved 2/3 of a math problem. If the problem had 12 parts, how many parts are left to solve?', '4', '6', '8', '10', NULL, '4', 'Total parts of the problem = 12\nParts solved by sushant = 2/3 of 12 = 2/3 x 12 = 8\nParts left to solve = Total parts - Parts solved = 12 - 8 = 4', 17, NULL, 1),
(524, 'Sneha has 12 pieces of candy. She eats 4 pieces and gives some to her friends. How many pieces of candy does she give to her friends?', '3', '5', '7', '9', NULL, '3', 'Number of candy Sneha eats = 4\nNumber of candy she gives to her friends = 12 - 4 = 8\nTherefore, Sneha gives 8 pieces of candy to her friends.', 17, NULL, 1),
(525, 'Sushant has 15 marbles. He wants to divide them equally among his 5 friends. How many marbles does each friend receive?', '2', '3', '4', '5', NULL, '2', 'Number of marbles Sushant has = 15\nNumber of friends = 5\nEach friend will receive 15 ÷ 5 = 3 marbles.', 17, NULL, 1),
(526, 'Sneha has 18 books. She wants to organize them into 3 equal stacks. How many books will be in each stack?', '4', '6', '8', '10', NULL, '3', 'Number of books Sneha has = 18\nNumber of stacks = 3\nEach stack will have 18 ÷ 3 = 6 books.', 17, NULL, 1),
(527, 'Sushant drank 3/4 of a glass of juice. What fraction of the glass is left?', '1/4', '1/3', '1/2', '2/3', NULL, '1', 'Fraction of the glass of juice Sushant drank = 3/4\nFraction of the glass left = 1 - 3/4 = 1/4.', 17, NULL, 1),
(528, 'Sneha solved 2/3 of a math worksheet. What fraction of the worksheet is left to be solved?', '1/6', '1/3', '1/2', '2/3', NULL, '4', 'Fraction of the math worksheet Sneha solved = 2/3\nFraction of the worksheet left = 1 - 2/3 = 1/3.', 17, NULL, 1);

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
(12, '/images/girl.jpg', 509),
(13, '/images/boy.jpg', 510),
(14, '/images/girl.jpg', 510),
(15, '/images/boy.jpg', 511),
(16, '/images/girl.jpg', 511),
(17, '/images/girl.jpg', 513),
(18, '/images/girl.jpg', 515),
(19, '/images/girl.jpg', 516),
(20, '/images/boy.jpg', 517),
(21, '/images/girl.jpg', 518),
(22, '/images/girl.jpg', 520),
(23, '/images/boy.jpg', 522),
(24, '/images/boy.jpg', 523),
(25, '/images/girl.jpg', 524),
(26, '/images/boy.jpg', 525),
(27, '/images/girl.jpg', 526),
(28, '/images/boy.jpg', 527),
(29, '/images/girl.jpg', 528);

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
(2311, 318, 67),
(2312, 316, 67),
(2313, 249, 67),
(2314, 301, 67),
(2315, 278, 67),
(2316, 319, 67),
(2317, 311, 67),
(2318, 248, 67),
(2319, 268, 67),
(2320, 296, 67),
(2321, 279, 67),
(2322, 270, 67),
(2323, 290, 67),
(2324, 303, 67),
(2325, 246, 67),
(2326, 265, 67),
(2327, 259, 67),
(2328, 289, 67),
(2329, 260, 67),
(2330, 267, 67),
(2331, 317, 67),
(2332, 305, 67),
(2333, 302, 67),
(2334, 253, 67),
(2335, 262, 67),
(2336, 277, 67),
(2337, 306, 67),
(2338, 281, 67),
(2339, 291, 67),
(2340, 257, 67),
(2341, 298, 67),
(2342, 294, 67),
(2343, 261, 67),
(2344, 275, 67),
(2345, 307, 67),
(2486, 14, 72),
(2487, 32, 72),
(2488, 1, 72),
(2489, 45, 72),
(2490, 59, 72),
(2491, 39, 72),
(2492, 50, 72),
(2493, 17, 72),
(2494, 2, 72),
(2495, 40, 72),
(2496, 18, 72),
(2497, 57, 72),
(2498, 41, 72),
(2499, 31, 72),
(2500, 3, 72),
(2501, 38, 72),
(2502, 4, 72),
(2503, 53, 72),
(2504, 66, 72),
(2505, 76, 72),
(2506, 47, 72),
(2507, 21, 72),
(2508, 69, 72),
(2509, 49, 72),
(2510, 29, 72),
(2511, 65, 72),
(2512, 44, 72),
(2513, 30, 72),
(2514, 27, 72),
(2515, 58, 72),
(2516, 71, 72),
(2517, 64, 72),
(2518, 77, 72),
(2519, 63, 72),
(2520, 20, 72),
(2521, 45, 73),
(2522, 60, 73),
(2523, 3, 73),
(2524, 74, 73),
(2525, 7, 73),
(2526, 48, 73),
(2527, 6, 73),
(2528, 59, 73),
(2529, 8, 73),
(2530, 71, 73),
(2531, 27, 73),
(2532, 5, 73),
(2533, 32, 73),
(2534, 51, 73),
(2535, 68, 73),
(2536, 25, 73),
(2537, 49, 73),
(2538, 70, 73),
(2539, 46, 73),
(2540, 10, 73),
(2541, 57, 73),
(2542, 66, 73),
(2543, 36, 73),
(2544, 1, 73),
(2545, 9, 73),
(2546, 61, 73),
(2547, 67, 73),
(2548, 69, 73),
(2549, 21, 73),
(2550, 39, 73),
(2551, 20, 73),
(2552, 43, 73),
(2553, 19, 73),
(2554, 16, 73),
(2555, 31, 73),
(2556, 147, 74),
(2557, 121, 74),
(2558, 160, 74),
(2559, 120, 74),
(2560, 124, 74),
(2561, 84, 74),
(2562, 134, 74),
(2563, 101, 74),
(2564, 136, 74),
(2565, 155, 74),
(2566, 88, 74),
(2567, 152, 74),
(2568, 98, 74),
(2569, 138, 74),
(2570, 132, 74),
(2571, 126, 74),
(2572, 90, 74),
(2573, 117, 74),
(2574, 100, 74),
(2575, 146, 74),
(2576, 119, 74),
(2577, 145, 74),
(2578, 104, 74),
(2579, 143, 74),
(2580, 154, 74),
(2581, 116, 74),
(2582, 133, 74),
(2583, 153, 74),
(2584, 144, 74),
(2585, 140, 74),
(2586, 115, 74),
(2587, 85, 74),
(2588, 109, 74),
(2589, 91, 74),
(2590, 139, 74),
(2591, 203, 75),
(2592, 238, 75),
(2593, 196, 75),
(2594, 224, 75),
(2595, 227, 75),
(2596, 179, 75),
(2597, 233, 75),
(2598, 225, 75),
(2599, 223, 75),
(2600, 178, 75),
(2601, 195, 75),
(2602, 212, 75),
(2603, 216, 75),
(2604, 204, 75),
(2605, 194, 75),
(2606, 165, 75),
(2607, 213, 75),
(2608, 168, 75),
(2609, 173, 75),
(2610, 166, 75),
(2611, 192, 75),
(2612, 209, 75),
(2613, 186, 75),
(2614, 221, 75),
(2615, 205, 75),
(2616, 169, 75),
(2617, 232, 75),
(2618, 172, 75),
(2619, 170, 75),
(2620, 199, 75),
(2621, 176, 75),
(2622, 210, 75),
(2623, 190, 75),
(2624, 207, 75),
(2625, 220, 75),
(2781, 29, 77),
(2782, 56, 77),
(2783, 50, 77),
(2784, 25, 77),
(2785, 16, 77),
(2786, 22, 77),
(2787, 19, 77),
(2788, 12, 77),
(2789, 37, 77),
(2790, 34, 77),
(2791, 44, 77),
(2792, 72, 77),
(2793, 9, 77),
(2794, 55, 77),
(2795, 46, 77),
(2796, 79, 77),
(2797, 40, 77),
(2798, 17, 77),
(2799, 6, 77),
(2800, 69, 77),
(2801, 60, 77),
(2802, 48, 77),
(2803, 32, 77),
(2804, 33, 77),
(2805, 61, 77),
(2806, 45, 77),
(2807, 43, 77),
(2808, 18, 77),
(2809, 2, 77),
(2810, 4, 77),
(2811, 21, 77),
(2812, 49, 77),
(2813, 73, 77),
(2814, 54, 77),
(2815, 31, 77),
(2886, 520, 76),
(2887, 503, 76),
(2888, 497, 76),
(2889, 509, 76),
(2890, 502, 76),
(2891, 507, 76),
(2892, 518, 76),
(2893, 498, 76),
(2894, 499, 76),
(2895, 500, 76),
(2896, 508, 76),
(2897, 522, 76),
(2898, 526, 76),
(2899, 512, 76),
(2900, 528, 76),
(2901, 506, 76),
(2902, 511, 76),
(2903, 504, 76),
(2904, 521, 76),
(2905, 510, 76),
(2906, 501, 76),
(2907, 517, 76),
(2908, 519, 76),
(2909, 523, 76),
(2910, 505, 76),
(2911, 513, 76),
(2912, 496, 76),
(2913, 516, 76),
(2914, 525, 76),
(2915, 515, 76),
(2916, 527, 76),
(2917, 524, 76),
(2918, 494, 76),
(2919, 495, 76),
(2920, 514, 76),
(2921, 500, 64),
(2922, 155, 64),
(2923, 113, 64),
(2924, 105, 64),
(2925, 160, 64),
(2926, 154, 64),
(2927, 505, 64),
(2928, 96, 64),
(2929, 124, 64),
(2930, 513, 64),
(2931, 503, 64),
(2932, 522, 64),
(2933, 143, 64),
(2934, 524, 64),
(2935, 106, 64),
(2936, 104, 64),
(2937, 123, 64),
(2938, 130, 64),
(2939, 149, 64),
(2940, 512, 64),
(2941, 507, 64),
(2942, 132, 64),
(2943, 140, 64),
(2944, 494, 64),
(2945, 517, 64),
(2946, 81, 64),
(2947, 88, 64),
(2948, 137, 64),
(2949, 100, 64),
(2950, 157, 64),
(2951, 497, 64),
(2952, 525, 64),
(2953, 128, 64),
(2954, 87, 64),
(2955, 515, 64);

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
(6, 'OC Package - 5', 'fsfsfs', '89', '/images/product-1693303411.png', 1, 3, 35, '2023-09-04', 1),
(8, 'OC Test Package - 4', 'dadad', '89', '/images/product-1693482495.jpg', 1, 6, 35, '2023-08-31', 1);

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
(3, 6, 2, '2023-08-31', '2023-12-01');

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

--
-- Dumping data for table `test_series_topics`
--

INSERT INTO `test_series_topics` (`id`, `t_name`, `topic`, `tsc_id`, `status`, `ts_id`) VALUES
(1, 'OC - Fraction - Easy', 'Fraction', 1, 1, 1),
(2, 'OC - Average - Easy', 'Average', 1, 1, 1),
(4, 'OC - Test - Easy', 'Test', 3, 1, 1),
(5, 'OC - Test2 - Easy', 'Test2', 3, 1, 1),
(14, 'OC - Test2 - Easy', 'Test3', 3, 1, 1),
(15, 'OC - Test4 - Easy', 'Test4', 3, 1, 1),
(16, 'Ratio', 'Ratio', 1, 1, 1),
(17, 'Fraction', 'Fractions', 1, 1, 1);

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
(64, 6, 1, 'OC Maths set - 1', 1),
(67, 7, 1, 'OC Thinking set - 1', 1),
(72, 6, 2, 'OC Maths set - 2', 1),
(73, 6, 3, 'OC Maths set - 3', 1),
(74, 6, 4, 'OC Maths set - 4', 1),
(75, 7, 2, 'OC Thinking set - 2', 1),
(76, 9, 1, 'OC Maths set - 1', 1),
(77, 6, 5, 'OC Maths set - 5', 1);

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
(85, 67, 5),
(90, 72, 1),
(91, 73, 1),
(92, 74, 2),
(93, 75, 4),
(96, 64, 2),
(97, 76, 16),
(98, 77, 1),
(101, 64, 16),
(102, 76, 17),
(103, 64, 17);

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
(6, 6, 1, 1),
(7, 6, 3, 1),
(9, 8, 1, 1);

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
(1, 'Guillermo Mante DDS', 'abc80@g', '+1.763.498.7366', NULL, '2023-08-26 01:24:03', '$2y$10$KmIwU9T2.ItabWn8Je03Xu0.1a/wc/T5twuSEFem/5rzUGeNIGU9G', 'FXqvatzJh2', NULL, NULL),
(2, 'Susahnt Su', 'spoojari694@gmail.com', '8805778742', '2023-08-17', NULL, '$2y$10$8xx6sHHf4pPJUDYhM0MI..rWXZv2onTz2Ui.n1D7Ija7d/oxL.Oqe', NULL, NULL, NULL);

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
  `percentage` int(11) DEFAULT 0,
  `total_answered` int(11) DEFAULT NULL,
  `q_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_test_series`
--

INSERT INTO `user_test_series` (`id`, `tsps_id`, `set_id`, `complete_status`, `start_date`, `end_date`, `time_taken`, `current_timer`, `total_marks`, `percentage`, `total_answered`, `q_id`) VALUES
(5, 3, 64, 1, '02-09-2023', '02-09-2023', '2', NULL, 0, 0, 0, 93),
(9, 3, 75, 1, '04-09-2023', '04-09-2023', '1', NULL, 1, 3, 0, 156),
(10, 3, 74, 1, '04-09-2023', '04-09-2023', '2', NULL, 3, 9, 6, 214);

-- --------------------------------------------------------

--
-- Table structure for table `user_test_status`
--

CREATE TABLE `user_test_status` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `q_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status_id` bigint(20) UNSIGNED NOT NULL DEFAULT 3,
  `test_answer` varchar(255) DEFAULT NULL,
  `marks` tinyint(4) DEFAULT 0,
  `uts_id` bigint(20) UNSIGNED NOT NULL,
  `test_time` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_test_status`
--

INSERT INTO `user_test_status` (`id`, `q_id`, `status_id`, `test_answer`, `marks`, `uts_id`, `test_time`) VALUES
(86, 500, 2, NULL, NULL, 5, '0'),
(87, 155, 1, '2', NULL, 5, '0'),
(88, 113, 1, '1', NULL, 5, '0'),
(89, 105, 1, '1', NULL, 5, '0'),
(90, 160, 1, '1', NULL, 5, '0'),
(91, 154, 1, '1', NULL, 5, '0'),
(92, 505, 1, '1', NULL, 5, '0'),
(93, 96, 1, '2', NULL, 5, '0'),
(94, 124, 3, NULL, NULL, 5, '0'),
(95, 513, 3, NULL, NULL, 5, '0'),
(96, 503, 3, NULL, NULL, 5, '0'),
(97, 522, 3, NULL, NULL, 5, '0'),
(98, 143, 3, NULL, NULL, 5, '0'),
(99, 524, 3, NULL, NULL, 5, '0'),
(100, 106, 3, NULL, NULL, 5, '0'),
(101, 104, 3, NULL, NULL, 5, '0'),
(102, 123, 3, NULL, NULL, 5, '0'),
(103, 130, 3, NULL, NULL, 5, '0'),
(104, 149, 3, NULL, NULL, 5, '0'),
(105, 512, 3, NULL, NULL, 5, '0'),
(106, 507, 3, NULL, NULL, 5, '0'),
(107, 132, 3, NULL, NULL, 5, '0'),
(108, 140, 3, NULL, NULL, 5, '0'),
(109, 494, 3, NULL, NULL, 5, '0'),
(110, 517, 3, NULL, NULL, 5, '0'),
(111, 81, 3, NULL, NULL, 5, '0'),
(112, 88, 3, NULL, NULL, 5, '0'),
(113, 137, 3, NULL, NULL, 5, '0'),
(114, 100, 3, NULL, NULL, 5, '0'),
(115, 157, 3, NULL, NULL, 5, '0'),
(116, 497, 3, NULL, NULL, 5, '0'),
(117, 525, 3, NULL, NULL, 5, '0'),
(118, 128, 3, NULL, NULL, 5, '0'),
(119, 87, 3, NULL, NULL, 5, '0'),
(120, 515, 3, NULL, NULL, 5, '0'),
(156, 203, 1, '1', 1, 9, '0'),
(157, 238, 1, '2', 0, 9, '0'),
(158, 196, 3, NULL, 0, 9, '0'),
(159, 224, 3, NULL, 0, 9, '0'),
(160, 227, 3, NULL, 0, 9, '0'),
(161, 179, 3, NULL, 0, 9, '0'),
(162, 233, 3, NULL, 0, 9, '0'),
(163, 225, 3, NULL, 0, 9, '0'),
(164, 223, 3, NULL, 0, 9, '0'),
(165, 178, 3, NULL, 0, 9, '0'),
(166, 195, 3, NULL, 0, 9, '0'),
(167, 212, 3, NULL, 0, 9, '0'),
(168, 216, 3, NULL, 0, 9, '0'),
(169, 204, 3, NULL, 0, 9, '0'),
(170, 194, 3, NULL, 0, 9, '0'),
(171, 165, 3, NULL, 0, 9, '0'),
(172, 213, 3, NULL, 0, 9, '0'),
(173, 168, 3, NULL, 0, 9, '0'),
(174, 173, 3, NULL, 0, 9, '0'),
(175, 166, 3, NULL, 0, 9, '0'),
(176, 192, 3, NULL, 0, 9, '0'),
(177, 209, 3, NULL, 0, 9, '0'),
(178, 186, 3, NULL, 0, 9, '0'),
(179, 221, 3, NULL, 0, 9, '0'),
(180, 205, 3, NULL, 0, 9, '0'),
(181, 169, 3, NULL, 0, 9, '0'),
(182, 232, 3, NULL, 0, 9, '0'),
(183, 172, 3, NULL, 0, 9, '0'),
(184, 170, 3, NULL, 0, 9, '0'),
(185, 199, 3, NULL, 0, 9, '0'),
(186, 176, 3, NULL, 0, 9, '0'),
(187, 210, 3, NULL, 0, 9, '0'),
(188, 190, 3, NULL, 0, 9, '0'),
(189, 207, 3, NULL, 0, 9, '0'),
(190, 220, 3, NULL, 0, 9, '0'),
(191, 147, 1, '3', 0, 10, '0'),
(192, 121, 3, NULL, 0, 10, '0'),
(193, 160, 3, NULL, 0, 10, '0'),
(194, 120, 3, NULL, 0, 10, '0'),
(195, 124, 3, NULL, 0, 10, '0'),
(196, 84, 3, NULL, 0, 10, '0'),
(197, 134, 3, NULL, 0, 10, '0'),
(198, 101, 3, NULL, 0, 10, '0'),
(199, 136, 3, NULL, 0, 10, '0'),
(200, 155, 3, NULL, 0, 10, '0'),
(201, 88, 3, NULL, 0, 10, '0'),
(202, 152, 1, '2', 1, 10, '0'),
(203, 98, 1, '3', 1, 10, '0'),
(204, 138, 3, NULL, 0, 10, '0'),
(205, 132, 3, NULL, 0, 10, '0'),
(206, 126, 3, NULL, 0, 10, '0'),
(207, 90, 3, NULL, 0, 10, '0'),
(208, 117, 3, NULL, 0, 10, '0'),
(209, 100, 3, NULL, 0, 10, '0'),
(210, 146, 3, NULL, 0, 10, '0'),
(211, 119, 1, '3', 1, 10, '0'),
(212, 145, 3, NULL, 0, 10, '0'),
(213, 104, 1, '3', 0, 10, '0'),
(214, 143, 1, '3', 0, 10, '0'),
(215, 154, 3, NULL, 0, 10, '0'),
(216, 116, 3, NULL, 0, 10, '0'),
(217, 133, 3, NULL, 0, 10, '0'),
(218, 153, 3, NULL, 0, 10, '0'),
(219, 144, 3, NULL, 0, 10, '0'),
(220, 140, 3, NULL, 0, 10, '0'),
(221, 115, 3, NULL, 0, 10, '0'),
(222, 85, 3, NULL, 0, 10, '0'),
(223, 109, 3, NULL, 0, 10, '0'),
(224, 91, 3, NULL, 0, 10, '0'),
(225, 139, 3, NULL, 0, 10, '0');

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
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tsc_id` (`tsc_id`);

--
-- Indexes for table `images_names`
--
ALTER TABLE `images_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `image_id` (`image_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `images_names`
--
ALTER TABLE `images_names`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=529;

--
-- AUTO_INCREMENT for table `question_image`
--
ALTER TABLE `question_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `reading_question`
--
ALTER TABLE `reading_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `set_question`
--
ALTER TABLE `set_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2956;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `test_series_purchases`
--
ALTER TABLE `test_series_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_test_series`
--
ALTER TABLE `user_test_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_test_status`
--
ALTER TABLE `user_test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

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
