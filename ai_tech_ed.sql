-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 09, 2023 at 10:18 AM
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
(1, 'admin', 'admin@admin', '2023-09-05 05:01:51', '$2y$10$bmoGr/0ijgTqXaJ3VvkfKuD/TUhPK3EYkBSk6RViPFxktuzSdXR0i', 'zgh2PsI0ZI', NULL, NULL);

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
-- Table structure for table `extra_question_field`
--

CREATE TABLE `extra_question_field` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `conversation` text DEFAULT NULL,
  `paragraph` text DEFAULT NULL,
  `q_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extra_question_field`
--

INSERT INTO `extra_question_field` (`id`, `conversation`, `paragraph`, `q_id`) VALUES
(16, 'Ella: \'Critical thinking not only helps us come up with creative solutions to problems, but it also allows us to think deeply and critically evaluate different options.\'\nEvie: \'I disagree. Critical thinking is only focused on making the best decision based on available information and reasoning.\'', 'Two friends, Ella and Evie, are discussing the benefits of critical thinking. Ella believes that critical thinking helps improve problem-solving skills, while Evie argues that it only enhances decision-making abilities.', 200),
(17, 'Oliver: \'I think it\'s crucial to listen to different perspectives and gather evidence before forming an opinion on a controversial issue.\'\nJack: \'I disagree. Once you have a belief, you should stick to it firmly and not be swayed by others.\'', 'Oliver and Jack are discussing a controversial issue. Oliver states that it is important to consider different perspectives before forming an opinion, while Jack believes that one should stick to their initial beliefs no matter what.', 201),
(18, 'Sienna: \'In order to solve this puzzle, we need to find the missing piece of information by critically analyzing the given clues.\'\nJames: \'I disagree. Solving the puzzle itself requires critical thinking as we have to make logical deductions based on the available information.\'', 'A group of students, Sienna and James, are discussing a logic puzzle. Sienna claims that finding the missing piece of information required to solve the puzzle is an example of critical thinking, while James believes that solving the puzzle itself is the critical thinking aspect.', 202),
(19, 'Ella: \'In critical thinking, relying on evidence is crucial as it helps us make informed decisions based on facts and logical reasoning.\'\nEvie: \'I disagree. Personal intuition is often stronger and more reliable than external evidence when it comes to making decisions.\'', 'Ella and Evie are discussing the importance of evidence in critical thinking. Ella argues that evidence is essential for making informed decisions, while Evie disagrees, stating that personal intuition should be the primary guide.', 203),
(20, 'Oliver: \'Not applying critical thinking can often lead to poor decision-making and falling for logical fallacies that can hinder personal growth.\'\nJack: \'I disagree. Critical thinking is overrated, and common sense is sufficient to navigate through most situations in life.\'', 'Two friends, Oliver and Jack, are discussing the consequences of not applying critical thinking in daily life. Oliver believes that it can lead to poor decision-making and falling for logical fallacies, while Jack argues that critical thinking is unnecessary as common sense is enough to navigate through life.', 204),
(21, NULL, 'Oliver is considering buying a new car. He has narrowed his choices down to two models: Model A and Model B. Model A has better fuel efficiency, but Model B has more advanced safety features. Oliver thinks that since fuel prices are rising, he should choose Model A because it will save him money in the long run. Is Oliver\'s reasoning valid?', 205),
(22, NULL, 'Ella is learning about logical fallacies in her critical thinking class. She wants to make sure she avoids them in her own arguments. Which of the following statements describes a logical fallacy?', 206),
(23, 'Evie: \"I heard that James is always late for class.\"\nSienna: \"That can\'t be true. I\'ve been in two classes with James, and he has always been on time.\"', NULL, 207),
(24, NULL, 'Jack is evaluating an argument that claims eating organic food is healthier than eating conventionally grown food. He decides to research scientific studies on the topic to gather evidence. Which of the following statements best describes Jack\'s approach to critical thinking?', 208),
(25, 'Oliver: \"I believe that climate change is caused by human activities.\" \nJames: \"I disagree. The Earth has undergone natural climate change throughout history.\"', NULL, 209),
(26, NULL, 'To excel in mathematics, you need to be logical and have good problem-solving skills.', 210),
(27, 'Oliver: I think it’s important to question everything and consider different perspectives when making a decision.\nElla: I agree. It helps us avoid bias and make more informed choices.', NULL, 211),
(28, NULL, 'In a science experiment, a researcher collects data from two different groups and observes a significant difference in their results.', 212),
(29, 'James: I believe that eating a balanced diet and exercising regularly are essential for maintaining good health.\nEvie: I disagree. I think genetics play a bigger role in determining our health.', NULL, 213),
(30, NULL, 'Critical thinking involves the ability to analyze information objectively and make reasoned judgments.', 214),
(31, 'Ella: \'Critical thinking not only helps us come up with creative solutions to problems, but it also allows us to think deeply and critically evaluate different options.\'\nEvie: \'I disagree. Critical thinking is only focused on making the best decision based on available information and reasoning.\'', 'Two friends, Ella and Evie, are discussing the benefits of critical thinking. Ella believes that critical thinking helps improve problem-solving skills, while Evie argues that it only enhances decision-making abilities.', 215),
(32, 'Oliver: \'I think it\'s crucial to listen to different perspectives and gather evidence before forming an opinion on a controversial issue.\'\nJack: \'I disagree. Once you have a belief, you should stick to it firmly and not be swayed by others.\'', 'Oliver and Jack are discussing a controversial issue. Oliver states that it is important to consider different perspectives before forming an opinion, while Jack believes that one should stick to their initial beliefs no matter what.', 216),
(33, 'Sienna: \'In order to solve this puzzle, we need to find the missing piece of information by critically analyzing the given clues.\'\nJames: \'I disagree. Solving the puzzle itself requires critical thinking as we have to make logical deductions based on the available information.\'', 'A group of students, Sienna and James, are discussing a logic puzzle. Sienna claims that finding the missing piece of information required to solve the puzzle is an example of critical thinking, while James believes that solving the puzzle itself is the critical thinking aspect.', 217),
(34, 'Ella: \'In critical thinking, relying on evidence is crucial as it helps us make informed decisions based on facts and logical reasoning.\'\nEvie: \'I disagree. Personal intuition is often stronger and more reliable than external evidence when it comes to making decisions.\'', 'Ella and Evie are discussing the importance of evidence in critical thinking. Ella argues that evidence is essential for making informed decisions, while Evie disagrees, stating that personal intuition should be the primary guide.', 218),
(35, 'Oliver: \'Not applying critical thinking can often lead to poor decision-making and falling for logical fallacies that can hinder personal growth.\'\nJack: \'I disagree. Critical thinking is overrated, and common sense is sufficient to navigate through most situations in life.\'', 'Two friends, Oliver and Jack, are discussing the consequences of not applying critical thinking in daily life. Oliver believes that it can lead to poor decision-making and falling for logical fallacies, while Jack argues that critical thinking is unnecessary as common sense is enough to navigate through life.', 219),
(36, NULL, 'Oliver is considering buying a new car. He has narrowed his choices down to two models: Model A and Model B. Model A has better fuel efficiency, but Model B has more advanced safety features. Oliver thinks that since fuel prices are rising, he should choose Model A because it will save him money in the long run. Is Oliver\'s reasoning valid?', 220),
(37, NULL, 'Ella is learning about logical fallacies in her critical thinking class. She wants to make sure she avoids them in her own arguments. Which of the following statements describes a logical fallacy?', 221),
(38, 'Evie: \"I heard that James is always late for class.\"\nSienna: \"That can\'t be true. I\'ve been in two classes with James, and he has always been on time.\"', NULL, 222),
(39, NULL, 'Jack is evaluating an argument that claims eating organic food is healthier than eating conventionally grown food. He decides to research scientific studies on the topic to gather evidence. Which of the following statements best describes Jack\'s approach to critical thinking?', 223),
(40, 'Oliver: \"I believe that climate change is caused by human activities.\" \nJames: \"I disagree. The Earth has undergone natural climate change throughout history.\"', NULL, 224),
(41, NULL, 'To excel in mathematics, you need to be logical and have good problem-solving skills.', 225),
(42, 'Oliver: I think it’s important to question everything and consider different perspectives when making a decision.\nElla: I agree. It helps us avoid bias and make more informed choices.', NULL, 226),
(43, NULL, 'In a science experiment, a researcher collects data from two different groups and observes a significant difference in their results.', 227),
(44, 'James: I believe that eating a balanced diet and exercising regularly are essential for maintaining good health.\nEvie: I disagree. I think genetics play a bigger role in determining our health.', NULL, 228),
(45, NULL, 'Critical thinking involves the ability to analyze information objectively and make reasoned judgments.', 229),
(46, 'Ella: \'Critical thinking not only helps us come up with creative solutions to problems, but it also allows us to think deeply and critically evaluate different options.\'\nEvie: \'I disagree. Critical thinking is only focused on making the best decision based on available information and reasoning.\'', 'Two friends, Ella and Evie, are discussing the benefits of critical thinking. Ella believes that critical thinking helps improve problem-solving skills, while Evie argues that it only enhances decision-making abilities.', 230),
(47, 'Oliver: \'I think it\'s crucial to listen to different perspectives and gather evidence before forming an opinion on a controversial issue.\'\nJack: \'I disagree. Once you have a belief, you should stick to it firmly and not be swayed by others.\'', 'Oliver and Jack are discussing a controversial issue. Oliver states that it is important to consider different perspectives before forming an opinion, while Jack believes that one should stick to their initial beliefs no matter what.', 231),
(48, 'Sienna: \'In order to solve this puzzle, we need to find the missing piece of information by critically analyzing the given clues.\'\nJames: \'I disagree. Solving the puzzle itself requires critical thinking as we have to make logical deductions based on the available information.\'', 'A group of students, Sienna and James, are discussing a logic puzzle. Sienna claims that finding the missing piece of information required to solve the puzzle is an example of critical thinking, while James believes that solving the puzzle itself is the critical thinking aspect.', 232),
(49, 'Ella: \'In critical thinking, relying on evidence is crucial as it helps us make informed decisions based on facts and logical reasoning.\'\nEvie: \'I disagree. Personal intuition is often stronger and more reliable than external evidence when it comes to making decisions.\'', 'Ella and Evie are discussing the importance of evidence in critical thinking. Ella argues that evidence is essential for making informed decisions, while Evie disagrees, stating that personal intuition should be the primary guide.', 233),
(50, 'Oliver: \'Not applying critical thinking can often lead to poor decision-making and falling for logical fallacies that can hinder personal growth.\'\nJack: \'I disagree. Critical thinking is overrated, and common sense is sufficient to navigate through most situations in life.\'', 'Two friends, Oliver and Jack, are discussing the consequences of not applying critical thinking in daily life. Oliver believes that it can lead to poor decision-making and falling for logical fallacies, while Jack argues that critical thinking is unnecessary as common sense is enough to navigate through life.', 234),
(51, NULL, 'Oliver is considering buying a new car. He has narrowed his choices down to two models: Model A and Model B. Model A has better fuel efficiency, but Model B has more advanced safety features. Oliver thinks that since fuel prices are rising, he should choose Model A because it will save him money in the long run. Is Oliver\'s reasoning valid?', 235),
(52, NULL, 'Ella is learning about logical fallacies in her critical thinking class. She wants to make sure she avoids them in her own arguments. Which of the following statements describes a logical fallacy?', 236),
(53, 'Evie: \"I heard that James is always late for class.\"\nSienna: \"That can\'t be true. I\'ve been in two classes with James, and he has always been on time.\"', NULL, 237),
(54, NULL, 'Jack is evaluating an argument that claims eating organic food is healthier than eating conventionally grown food. He decides to research scientific studies on the topic to gather evidence. Which of the following statements best describes Jack\'s approach to critical thinking?', 238),
(55, 'Oliver: \"I believe that climate change is caused by human activities.\" \nJames: \"I disagree. The Earth has undergone natural climate change throughout history.\"', NULL, 239),
(56, NULL, 'To excel in mathematics, you need to be logical and have good problem-solving skills.', 240),
(57, 'Oliver: I think it’s important to question everything and consider different perspectives when making a decision.\nElla: I agree. It helps us avoid bias and make more informed choices.', NULL, 241),
(58, NULL, 'In a science experiment, a researcher collects data from two different groups and observes a significant difference in their results.', 242),
(59, 'James: I believe that eating a balanced diet and exercising regularly are essential for maintaining good health.\nEvie: I disagree. I think genetics play a bigger role in determining our health.', NULL, 243),
(60, NULL, 'Critical thinking involves the ability to analyze information objectively and make reasoned judgments.', 244),
(61, 'Oliver: If our scores in math were different from each other, then our scores in science must have been different too.\nElla: And if our scores in science were the same, then our scores in math must have been the same too.', 'At the end of each test, Mr. Wilson gives scores in math and science to each student in his class. The two scores are then added together to give an overall score for the test. Last week, Oliver and Ella got the same overall score.', 245),
(62, 'Jack: Our starting point was the same, so we must have ended up at the same location.\nSienna: If we ended up at the same location, then our paths must have crossed each other.', 'Situated at the edge of a dense forest, Jack and Sienna decided to hike in different directions. Jack went North for 2 miles and then East for 3 miles, while Sienna went East for 3 miles and then North for 2 miles.', 246),
(63, 'Evie: If I had won one more game, then we would have been tied.\nJames: And if we were tied, then you would have won more games than me.', 'During a board game tournament, Evie and James competed against each other. Evie won 2 games and James won 3 games. The tournament was best out of 5 games.', 247),
(64, 'Emily: If I took the picture from a higher elevation, then my picture will have a wider perspective.\nLiam: And if your picture has a wider perspective, then mine will have a narrower perspective.', 'Emily and Liam, two photographers, took pictures of the same landscape at different angles. Emily took the picture from a higher elevation, while Liam took it from a lower elevation.', 248),
(65, 'Oliver: If our solutions are different from each other, then our approaches must have been different too.\nSienna: And if our approaches were the same, then our solutions must have been the same too.', 'During a group project, Oliver and Sienna worked together to solve a complex problem. They each came up with a different solution.', 249),
(66, NULL, 'Oliver is starting a new job and is nervous about making a good impression. He decides to arrive early and dress professionally to make a good first impression.', 250),
(67, 'Ella and James are discussing a recent news article. Ella: I can\'t believe everything this article claims. James: That\'s why it\'s important to evaluate the credibility of the sources before believing everything we read.', NULL, 251),
(68, NULL, 'Sienna is comparing two different models of laptops before making a purchase. She researches their specifications, reads customer reviews, and considers her budget before making a decision.', 252),
(69, 'Evie: I think we should invest in stocks because they have the potential for high returns. Jack: But they also come with a higher level of risk compared to other investment options.', NULL, 253),
(70, NULL, 'Oliver is reading an article that presents an argument about the benefits of recycling. He carefully examines the evidence provided, considers counterarguments, and evaluates the logical coherence of the author\'s points before forming his own opinion.', 254);

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_name` varchar(40) NOT NULL,
  `image_url` varchar(150) NOT NULL,
  `tsc_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `image_name`, `image_url`, `tsc_id`) VALUES
(1, 'bag', '/images/bag.jpg', 3),
(2, 'boy', '/images/boy.jpg', 3),
(3, 'car', '/images/car.jpg', 3),
(4, 'girl', '/images/girl.jpg', 3),
(5, 'left_boy', '/images/left_boy.jpg', 3),
(6, 'men', '/images/men.jpg', 3),
(7, 'motor', '/images/motor.jpg', 3),
(8, 'right_girl', '/images/right_girl.jpg', 3),
(9, 'ship', '/images/ship.jpg', 3),
(10, 'train', '/images/train.jpg', 3),
(11, 'women', '/images/women.jpg', 3),
(12, 'bag', '/images/bag.jpg', 1),
(13, 'boy', '/images/boy.jpg', 1),
(14, 'car', '/images/car.jpg', 1),
(15, 'girl', '/images/girl.jpg', 1),
(16, 'left_boy', '/images/left_boy.jpg', 1),
(17, 'men', '/images/men.jpg', 1),
(18, 'motor', '/images/motor.jpg', 1),
(19, 'right_girl', '/images/right_girl.jpg', 1),
(20, 'ship', '/images/ship.jpg', 1),
(21, 'train', '/images/train.jpg', 1),
(22, 'women', '/images/women.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `images_names`
--

CREATE TABLE `images_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_id` bigint(20) UNSIGNED DEFAULT NULL,
  `image_name` varchar(40) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(22, '22_create_set_question_table', 1),
(23, '23_create_images_table', 1),
(24, '24_create_images_names_table', 1),
(25, '25_extra_question_field_table', 1);

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
(200, 'Which friend has a more accurate understanding of the benefits of critical thinking?', 'Ella', 'Evie', 'Both Ella and Evie', 'Neither Ella nor Evie', NULL, '1', 'Ella has a more accurate understanding of the benefits of critical thinking. While critical thinking does improve decision-making abilities, it also enhances problem-solving skills by encouraging creative thinking and evaluating different options.', 28, NULL, 1),
(201, 'Whose approach demonstrates critical thinking?', 'Oliver', 'Jack', 'Both Oliver and Jack', 'Neither Oliver nor Jack', NULL, '1', 'Oliver\'s approach demonstrates critical thinking. Critical thinking involves considering different perspectives, gathering evidence, and being open to changing one\'s beliefs based on new information or reasoning.', 28, NULL, 1),
(202, 'Whose reasoning best aligns with the concept of critical thinking in this context?', 'Sienna', 'James', 'Both Sienna and James', 'Neither Sienna nor James', NULL, '1', 'Sienna\'s reasoning best aligns with the concept of critical thinking in this context. Critical thinking involves analyzing information, making logical deductions, and finding missing pieces of information to solve complex problems or puzzles.', 28, NULL, 1),
(203, 'Which friend has a better understanding of the role of evidence in critical thinking?', 'Ella', 'Evie', 'Both Ella and Evie', 'Neither Ella nor Evie', NULL, '1', 'Ella has a better understanding of the role of evidence in critical thinking. Critical thinking involves basing decisions on objective evidence and logical reasoning rather than personal intuition, which can be biased or unreliable.', 28, NULL, 1),
(204, 'Which friend has a more accurate understanding of the consequences of not applying critical thinking?', 'Oliver', 'Jack', 'Both Oliver and Jack', 'Neither Oliver nor Jack', NULL, '1', 'Oliver has a more accurate understanding of the consequences of not applying critical thinking. Without critical thinking, individuals are more prone to making poor decisions, falling for logical fallacies, and hindering personal growth. Common sense alone may not always be sufficient to navigate complex situations or evaluate information critically.', 28, NULL, 1),
(205, 'Which one of the following statements accurately evaluates Oliver\'s reasoning?', 'Oliver\'s reasoning is valid because choosing a car with better fuel efficiency will always save money.', 'Oliver\'s reasoning is valid because fuel prices are rising, and it is important to save money in the long run.', 'Oliver\'s reasoning is not valid because he has not considered the additional cost of Model A compared to Model B.', 'Oliver\'s reasoning is not valid because fuel efficiency is not the only factor to consider when choosing a car.', NULL, '3', 'Oliver\'s reasoning is not valid because he has not considered the additional cost of Model A compared to Model B. While it is true that Model A has better fuel efficiency, the higher upfront cost of the car needs to be taken into account before determining if it will save money in the long run.', 28, NULL, 1);
INSERT INTO `question` (`id`, `question`, `option_1`, `option_2`, `option_3`, `option_4`, `option_5`, `correct_option`, `explanation`, `tst_id`, `marks`, `status`) VALUES
(206, 'Which one of the following statements describes a logical fallacy?', 'Presenting evidence from reputable sources to support an argument.', 'Using personal attacks or insults instead of addressing the argument itself.', 'Analyzing the pros and cons of a decision before making a final choice.', 'Considering alternative explanations and perspectives in order to make an informed decision.', NULL, '2', 'Using personal attacks or insults instead of addressing the argument itself is a type of logical fallacy called ad hominem. Logical fallacies are errors in reasoning that can weaken an argument.', 28, NULL, 1),
(207, 'What can be inferred from Sienna\'s response?', 'James is always late for class.', 'Sienna has never seen James in class.', 'Sienna has only seen James in two classes and cannot speak for his punctuality in other classes.', 'James is always on time for class.', NULL, '3', 'Sienna\'s response implies that she can only speak for James\' punctuality in the two classes they have had together. She cannot make a general statement about James always being on time for class.', 28, NULL, 1),
(208, 'Which of the following statements best describes Jack\'s approach to critical thinking?', 'Jack is relying solely on personal experiences to form his opinion.', 'Jack is using scientific evidence to evaluate the argument.', 'Jack is blindly accepting the argument without questioning its validity.', 'Jack is avoiding any research or evidence and simply forming his own opinion.', NULL, '2', 'Jack is using scientific evidence to evaluate the argument. By researching scientific studies on the topic, he is gathering objective information to support or refute the claim that eating organic food is healthier.', 28, NULL, 1),
(209, 'What is the main point of disagreement between Oliver and James?', 'Whether climate change is caused by human activities or not.', 'Whether natural climate change has occurred in the past or not.', 'Whether climate change is a serious issue or not.', 'Whether human activities can contribute to natural climate change or not.', NULL, '1', 'The main point of disagreement between Oliver and James is whether climate change is caused by human activities or not. Oliver believes it is, while James disagrees and attributes it to natural climate change throughout history.', 28, NULL, 1),
(210, 'Based on the given information, which person is more likely to excel in mathematics?', 'Ella, who enjoys puzzles and always thinks critically', 'Oliver, who likes to paint and listen to music', 'Jack, who loves outdoor activities and sports', 'Sienna, who is skilled at playing musical instruments', NULL, '1', 'Critical thinking, logic, and problem-solving skills are important in mathematics, which Ella possesses.', 28, NULL, 1),
(211, 'Based on the conversation, what is a characteristic of critical thinking?', 'Being open-minded and considering various viewpoints', 'Being assertive and persuasive in arguments', 'Being able to memorize facts quickly', 'Being skilled in artistic expression', NULL, '1', 'The conversation highlights the importance of considering different perspectives, which is a characteristic of critical thinking.', 28, NULL, 1),
(212, 'Which of the following is the most appropriate critical thinking question the researcher should ask next?', 'How can I prove that the results are accurate?', 'What could be the potential flaws in the experiment?', 'Can I ignore the results and continue with the study?', 'Should I only consider the positive outcomes?', NULL, '2', 'Asking about potential flaws in the experiment is a critical thinking question that will help ensure the validity of the results.', 28, NULL, 1),
(213, 'What can be inferred about James and Evie\'s critical thinking based on the conversation?', 'James values evidence and logic, while Evie relies on personal beliefs.', 'James relies on personal beliefs, while Evie values evidence and logic.', 'Both James and Evie rely on personal beliefs.', 'Neither James nor Evie value evidence and logic.', NULL, '1', 'Based on the conversation, James supports his belief with concepts of a balanced diet and exercise, while Evie\'s argument relies on a vague concept of genetics, indicating that James values evidence and logic more.', 28, NULL, 1),
(214, 'What is a key component of critical thinking?', 'Making impulsive decisions without considering all the facts', 'Ignoring different perspectives and viewpoints', 'Analyzing information objectively and making reasoned judgments', 'Relying solely on personal beliefs and emotions', NULL, '3', 'Critical thinking requires the analysis of information in an objective manner and making judgments based on reason rather than personal biases or emotions.', 28, NULL, 1),
(215, 'Which friend has a more accurate understanding of the benefits of critical thinking?', 'Ella', 'Evie', 'Both Ella and Evie', 'Neither Ella nor Evie', NULL, '1', 'Ella has a more accurate understanding of the benefits of critical thinking. While critical thinking does improve decision-making abilities, it also enhances problem-solving skills by encouraging creative thinking and evaluating different options.', 29, NULL, 1),
(216, 'Whose approach demonstrates critical thinking?', 'Oliver', 'Jack', 'Both Oliver and Jack', 'Neither Oliver nor Jack', NULL, '1', 'Oliver\'s approach demonstrates critical thinking. Critical thinking involves considering different perspectives, gathering evidence, and being open to changing one\'s beliefs based on new information or reasoning.', 29, NULL, 1),
(217, 'Whose reasoning best aligns with the concept of critical thinking in this context?', 'Sienna', 'James', 'Both Sienna and James', 'Neither Sienna nor James', NULL, '1', 'Sienna\'s reasoning best aligns with the concept of critical thinking in this context. Critical thinking involves analyzing information, making logical deductions, and finding missing pieces of information to solve complex problems or puzzles.', 29, NULL, 1),
(218, 'Which friend has a better understanding of the role of evidence in critical thinking?', 'Ella', 'Evie', 'Both Ella and Evie', 'Neither Ella nor Evie', NULL, '1', 'Ella has a better understanding of the role of evidence in critical thinking. Critical thinking involves basing decisions on objective evidence and logical reasoning rather than personal intuition, which can be biased or unreliable.', 29, NULL, 1),
(219, 'Which friend has a more accurate understanding of the consequences of not applying critical thinking?', 'Oliver', 'Jack', 'Both Oliver and Jack', 'Neither Oliver nor Jack', NULL, '1', 'Oliver has a more accurate understanding of the consequences of not applying critical thinking. Without critical thinking, individuals are more prone to making poor decisions, falling for logical fallacies, and hindering personal growth. Common sense alone may not always be sufficient to navigate complex situations or evaluate information critically.', 29, NULL, 1),
(220, 'Which one of the following statements accurately evaluates Oliver\'s reasoning?', 'Oliver\'s reasoning is valid because choosing a car with better fuel efficiency will always save money.', 'Oliver\'s reasoning is valid because fuel prices are rising, and it is important to save money in the long run.', 'Oliver\'s reasoning is not valid because he has not considered the additional cost of Model A compared to Model B.', 'Oliver\'s reasoning is not valid because fuel efficiency is not the only factor to consider when choosing a car.', NULL, '3', 'Oliver\'s reasoning is not valid because he has not considered the additional cost of Model A compared to Model B. While it is true that Model A has better fuel efficiency, the higher upfront cost of the car needs to be taken into account before determining if it will save money in the long run.', 29, NULL, 1),
(221, 'Which one of the following statements describes a logical fallacy?', 'Presenting evidence from reputable sources to support an argument.', 'Using personal attacks or insults instead of addressing the argument itself.', 'Analyzing the pros and cons of a decision before making a final choice.', 'Considering alternative explanations and perspectives in order to make an informed decision.', NULL, '2', 'Using personal attacks or insults instead of addressing the argument itself is a type of logical fallacy called ad hominem. Logical fallacies are errors in reasoning that can weaken an argument.', 29, NULL, 1),
(222, 'What can be inferred from Sienna\'s response?', 'James is always late for class.', 'Sienna has never seen James in class.', 'Sienna has only seen James in two classes and cannot speak for his punctuality in other classes.', 'James is always on time for class.', NULL, '3', 'Sienna\'s response implies that she can only speak for James\' punctuality in the two classes they have had together. She cannot make a general statement about James always being on time for class.', 29, NULL, 1),
(223, 'Which of the following statements best describes Jack\'s approach to critical thinking?', 'Jack is relying solely on personal experiences to form his opinion.', 'Jack is using scientific evidence to evaluate the argument.', 'Jack is blindly accepting the argument without questioning its validity.', 'Jack is avoiding any research or evidence and simply forming his own opinion.', NULL, '2', 'Jack is using scientific evidence to evaluate the argument. By researching scientific studies on the topic, he is gathering objective information to support or refute the claim that eating organic food is healthier.', 29, NULL, 1),
(224, 'What is the main point of disagreement between Oliver and James?', 'Whether climate change is caused by human activities or not.', 'Whether natural climate change has occurred in the past or not.', 'Whether climate change is a serious issue or not.', 'Whether human activities can contribute to natural climate change or not.', NULL, '1', 'The main point of disagreement between Oliver and James is whether climate change is caused by human activities or not. Oliver believes it is, while James disagrees and attributes it to natural climate change throughout history.', 29, NULL, 1),
(225, 'Based on the given information, which person is more likely to excel in mathematics?', 'Ella, who enjoys puzzles and always thinks critically', 'Oliver, who likes to paint and listen to music', 'Jack, who loves outdoor activities and sports', 'Sienna, who is skilled at playing musical instruments', NULL, '1', 'Critical thinking, logic, and problem-solving skills are important in mathematics, which Ella possesses.', 29, NULL, 1),
(226, 'Based on the conversation, what is a characteristic of critical thinking?', 'Being open-minded and considering various viewpoints', 'Being assertive and persuasive in arguments', 'Being able to memorize facts quickly', 'Being skilled in artistic expression', NULL, '1', 'The conversation highlights the importance of considering different perspectives, which is a characteristic of critical thinking.', 29, NULL, 1),
(227, 'Which of the following is the most appropriate critical thinking question the researcher should ask next?', 'How can I prove that the results are accurate?', 'What could be the potential flaws in the experiment?', 'Can I ignore the results and continue with the study?', 'Should I only consider the positive outcomes?', NULL, '2', 'Asking about potential flaws in the experiment is a critical thinking question that will help ensure the validity of the results.', 29, NULL, 1),
(228, 'What can be inferred about James and Evie\'s critical thinking based on the conversation?', 'James values evidence and logic, while Evie relies on personal beliefs.', 'James relies on personal beliefs, while Evie values evidence and logic.', 'Both James and Evie rely on personal beliefs.', 'Neither James nor Evie value evidence and logic.', NULL, '1', 'Based on the conversation, James supports his belief with concepts of a balanced diet and exercise, while Evie\'s argument relies on a vague concept of genetics, indicating that James values evidence and logic more.', 29, NULL, 1),
(229, 'What is a key component of critical thinking?', 'Making impulsive decisions without considering all the facts', 'Ignoring different perspectives and viewpoints', 'Analyzing information objectively and making reasoned judgments', 'Relying solely on personal beliefs and emotions', NULL, '3', 'Critical thinking requires the analysis of information in an objective manner and making judgments based on reason rather than personal biases or emotions.', 29, NULL, 1),
(230, 'Which friend has a more accurate understanding of the benefits of critical thinking?', 'Ella', 'Evie', 'Both Ella and Evie', 'Neither Ella nor Evie', NULL, '1', 'Ella has a more accurate understanding of the benefits of critical thinking. While critical thinking does improve decision-making abilities, it also enhances problem-solving skills by encouraging creative thinking and evaluating different options.', 30, NULL, 1),
(231, 'Whose approach demonstrates critical thinking?', 'Oliver', 'Jack', 'Both Oliver and Jack', 'Neither Oliver nor Jack', NULL, '1', 'Oliver\'s approach demonstrates critical thinking. Critical thinking involves considering different perspectives, gathering evidence, and being open to changing one\'s beliefs based on new information or reasoning.', 30, NULL, 1),
(232, 'Whose reasoning best aligns with the concept of critical thinking in this context?', 'Sienna', 'James', 'Both Sienna and James', 'Neither Sienna nor James', NULL, '1', 'Sienna\'s reasoning best aligns with the concept of critical thinking in this context. Critical thinking involves analyzing information, making logical deductions, and finding missing pieces of information to solve complex problems or puzzles.', 30, NULL, 1),
(233, 'Which friend has a better understanding of the role of evidence in critical thinking?', 'Ella', 'Evie', 'Both Ella and Evie', 'Neither Ella nor Evie', NULL, '1', 'Ella has a better understanding of the role of evidence in critical thinking. Critical thinking involves basing decisions on objective evidence and logical reasoning rather than personal intuition, which can be biased or unreliable.', 30, NULL, 1),
(234, 'Which friend has a more accurate understanding of the consequences of not applying critical thinking?', 'Oliver', 'Jack', 'Both Oliver and Jack', 'Neither Oliver nor Jack', NULL, '1', 'Oliver has a more accurate understanding of the consequences of not applying critical thinking. Without critical thinking, individuals are more prone to making poor decisions, falling for logical fallacies, and hindering personal growth. Common sense alone may not always be sufficient to navigate complex situations or evaluate information critically.', 30, NULL, 1),
(235, 'Which one of the following statements accurately evaluates Oliver\'s reasoning?', 'Oliver\'s reasoning is valid because choosing a car with better fuel efficiency will always save money.', 'Oliver\'s reasoning is valid because fuel prices are rising, and it is important to save money in the long run.', 'Oliver\'s reasoning is not valid because he has not considered the additional cost of Model A compared to Model B.', 'Oliver\'s reasoning is not valid because fuel efficiency is not the only factor to consider when choosing a car.', NULL, '3', 'Oliver\'s reasoning is not valid because he has not considered the additional cost of Model A compared to Model B. While it is true that Model A has better fuel efficiency, the higher upfront cost of the car needs to be taken into account before determining if it will save money in the long run.', 30, NULL, 1),
(236, 'Which one of the following statements describes a logical fallacy?', 'Presenting evidence from reputable sources to support an argument.', 'Using personal attacks or insults instead of addressing the argument itself.', 'Analyzing the pros and cons of a decision before making a final choice.', 'Considering alternative explanations and perspectives in order to make an informed decision.', NULL, '2', 'Using personal attacks or insults instead of addressing the argument itself is a type of logical fallacy called ad hominem. Logical fallacies are errors in reasoning that can weaken an argument.', 30, NULL, 1),
(237, 'What can be inferred from Sienna\'s response?', 'James is always late for class.', 'Sienna has never seen James in class.', 'Sienna has only seen James in two classes and cannot speak for his punctuality in other classes.', 'James is always on time for class.', NULL, '3', 'Sienna\'s response implies that she can only speak for James\' punctuality in the two classes they have had together. She cannot make a general statement about James always being on time for class.', 30, NULL, 1),
(238, 'Which of the following statements best describes Jack\'s approach to critical thinking?', 'Jack is relying solely on personal experiences to form his opinion.', 'Jack is using scientific evidence to evaluate the argument.', 'Jack is blindly accepting the argument without questioning its validity.', 'Jack is avoiding any research or evidence and simply forming his own opinion.', NULL, '2', 'Jack is using scientific evidence to evaluate the argument. By researching scientific studies on the topic, he is gathering objective information to support or refute the claim that eating organic food is healthier.', 30, NULL, 1),
(239, 'What is the main point of disagreement between Oliver and James?', 'Whether climate change is caused by human activities or not.', 'Whether natural climate change has occurred in the past or not.', 'Whether climate change is a serious issue or not.', 'Whether human activities can contribute to natural climate change or not.', NULL, '1', 'The main point of disagreement between Oliver and James is whether climate change is caused by human activities or not. Oliver believes it is, while James disagrees and attributes it to natural climate change throughout history.', 30, NULL, 1),
(240, 'Based on the given information, which person is more likely to excel in mathematics?', 'Ella, who enjoys puzzles and always thinks critically', 'Oliver, who likes to paint and listen to music', 'Jack, who loves outdoor activities and sports', 'Sienna, who is skilled at playing musical instruments', NULL, '1', 'Critical thinking, logic, and problem-solving skills are important in mathematics, which Ella possesses.', 30, NULL, 1),
(241, 'Based on the conversation, what is a characteristic of critical thinking?', 'Being open-minded and considering various viewpoints', 'Being assertive and persuasive in arguments', 'Being able to memorize facts quickly', 'Being skilled in artistic expression', NULL, '1', 'The conversation highlights the importance of considering different perspectives, which is a characteristic of critical thinking.', 30, NULL, 1),
(242, 'Which of the following is the most appropriate critical thinking question the researcher should ask next?', 'How can I prove that the results are accurate?', 'What could be the potential flaws in the experiment?', 'Can I ignore the results and continue with the study?', 'Should I only consider the positive outcomes?', NULL, '2', 'Asking about potential flaws in the experiment is a critical thinking question that will help ensure the validity of the results.', 30, NULL, 1),
(243, 'What can be inferred about James and Evie\'s critical thinking based on the conversation?', 'James values evidence and logic, while Evie relies on personal beliefs.', 'James relies on personal beliefs, while Evie values evidence and logic.', 'Both James and Evie rely on personal beliefs.', 'Neither James nor Evie value evidence and logic.', NULL, '1', 'Based on the conversation, James supports his belief with concepts of a balanced diet and exercise, while Evie\'s argument relies on a vague concept of genetics, indicating that James values evidence and logic more.', 30, NULL, 1),
(244, 'What is a key component of critical thinking?', 'Making impulsive decisions without considering all the facts', 'Ignoring different perspectives and viewpoints', 'Analyzing information objectively and making reasoned judgments', 'Relying solely on personal beliefs and emotions', NULL, '3', 'Critical thinking requires the analysis of information in an objective manner and making judgments based on reason rather than personal biases or emotions.', 30, NULL, 1),
(245, 'If the information in the box is true, whose reasoning is correct?', 'Oliver only', 'Ella only', 'Both Oliver and Ella', 'Neither Oliver nor Ella', NULL, '3', 'If Oliver and Ella got the same overall score, it means their math scores and science scores were the same. Therefore, both Oliver and Ella\'s reasoning is correct.', 31, NULL, 1),
(246, 'If the information in the box is true, whose reasoning is correct?', 'Jack only', 'Sienna only', 'Both Jack and Sienna', 'Neither Jack nor Sienna', NULL, '2', 'If Jack and Sienna started at the same point and ended up at the same location, it means their paths must have crossed. Therefore, Sienna\'s reasoning is correct.', 31, NULL, 1),
(247, 'If the information in the box is true, whose reasoning is correct?', 'Evie only', 'James only', 'Both Evie and James', 'Neither Evie nor James', NULL, '1', 'If Evie won 2 games and James won 3 games, it means if Evie had won one more game, they would have been tied at 3 games each. Therefore, Evie\'s reasoning is correct.', 31, NULL, 1),
(248, 'If the information in the box is true, whose reasoning is correct?', 'Emily only', 'Liam only', 'Both Emily and Liam', 'Neither Emily nor Liam', NULL, '1', 'If Emily took the picture from a higher elevation, it means her picture will have a wider perspective. Therefore, Emily\'s reasoning is correct.', 31, NULL, 1),
(249, 'If the information in the box is true, whose reasoning is correct?', 'Oliver only', 'Sienna only', 'Both Oliver and Sienna', 'Neither Oliver nor Sienna', NULL, '2', 'If Oliver and Sienna came up with different solutions, it means their approaches must have been different. Therefore, Sienna\'s reasoning is correct.', 31, NULL, 1),
(250, 'What critical thinking skill does Oliver demonstrate in this situation?', 'Problem solving', 'Decision making', 'Analytical thinking', 'Creative thinking', NULL, '2', 'Oliver demonstrates the critical thinking skill of decision making by carefully considering the best course of action to make a good impression at his new job.', 31, NULL, 1),
(251, 'What critical thinking concept does James highlight in his response?', 'Logical reasoning', 'Skepticism', 'Inference', 'Accuracy', NULL, '2', 'James highlights the critical thinking concept of skepticism by encouraging Ella to question the credibility of the sources and not believe everything she reads.', 31, NULL, 1),
(252, 'What critical thinking skill does Sienna demonstrate in her decision-making process?', 'Analysis', 'Synthesis', 'Evaluation', 'Inference', NULL, '3', 'Sienna demonstrates the critical thinking skill of evaluation by carefully considering the specifications, customer reviews, and budget before making a decision between the two laptop models.', 31, NULL, 1),
(253, 'What critical thinking skill does Jack display in his response to Evie?', 'Perspective taking', 'Problem solving', 'Decision making', 'Analytical thinking', NULL, '1', 'Jack displays the critical thinking skill of perspective taking by considering both the potential returns and the higher level of risk associated with investing in stocks.', 31, NULL, 1),
(254, 'What critical thinking skill does Oliver demonstrate while reading the article?', 'Evaluation', 'Analysis', 'Logical reasoning', 'Inference', NULL, '3', 'Oliver demonstrates the critical thinking skill of logical reasoning by carefully examining the evidence, considering counterarguments, and evaluating the logical coherence of the author\'s points before forming his own opinion on the benefits of recycling.', 31, NULL, 1),
(255, 'Oliver has 20 red marbles and 30 blue marbles. What is the ratio of red marbles to blue marbles?', '1:2', '2:1', '3:2', '2:3', NULL, '2', 'The ratio of red marbles to blue marbles is 2:1.', 32, NULL, 1),
(256, 'Ella and Evie are sharing a box of cookies. Ella ate 1/4 of the cookies and Evie ate 3/4 of the cookies. What is the ratio of Ella\'s share to Evie\'s share?', '1:3', '3:1', '1:4', '4:1', NULL, '1', 'The ratio of Ella\'s share to Evie\'s share is 1:3.', 32, NULL, 1),
(257, 'James drove 80 miles in 2 hours. Jack drove 120 miles in 3 hours. What is the ratio of James\'s speed to Jack\'s speed?', '2:3', '3:2', '4:5', '5:4', NULL, '2', 'The ratio of James\'s speed to Jack\'s speed is 3:2.', 32, NULL, 1),
(258, 'Sienna has 4 red balloons and 6 green balloons. What is the ratio of red balloons to total balloons?', '2:5', '1:2', '2:3', '3:4', NULL, '3', 'The ratio of red balloons to total balloons is 2:3.', 32, NULL, 1),
(259, 'Oliver spent $40 on books and $60 on stationery. What is the ratio of his spending on books to his spending on stationery?', '4:6', '2:3', '3:2', '6:4', NULL, '2', 'The ratio of Oliver\'s spending on books to his spending on stationery is 2:3.', 32, NULL, 1),
(260, 'Oliver has 20 pens. His friend James has 3 times as many pens as Oliver. How many pens does James have?', '50', '40', '60', '30', NULL, '3', 'James has 3 times as many pens as Oliver, so he has 3 x 20 = 60 pens.', 32, NULL, 1),
(261, 'Sienna buys a dress for $80. Ella buys a dress for 5 times the price of Sienna\'s dress. How much did Ella\'s dress cost?', '$400', '$320', '$240', '$160', NULL, '1', 'Ella\'s dress costs 5 times Sienna\'s dress, so it costs 5 x $80 = $400.', 32, NULL, 1),
(262, 'Jack runs at a speed of 15 meters per second. Evie runs at 3/5 of Jack\'s speed. What is Evie\'s running speed?', '9 meters per second', '7 meters per second', '12 meters per second', '10 meters per second', NULL, '4', 'Evie runs at 3/5 of Jack\'s speed, so her speed is (3/5) x 15 = 9 meters per second.', 32, NULL, 1),
(263, 'Oliver scores 75% on a test. James scores 15% higher than Oliver. What is James\' score?', '86.25%', '81.25%', '90.75%', '78.75%', NULL, '1', 'James scores 15% higher than Oliver, so his score is 75% + 15% = 90%. In percentage form, this is 90% x 1 = 90%.', 32, NULL, 1),
(264, 'Ella has an orange to apple ratio of 3:2. If she has 15 oranges, how many apples does she have?', '10', '7', '8', '12', NULL, '3', 'The ratio of oranges to apples is 3:2. If Ella has 15 oranges, then the number of apples is (15 / 3) x 2 = 30 / 3 = 10. Therefore, Ella has 10 apples.', 32, NULL, 1);

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
(1, '/images/boy.jpg', 205),
(2, '/images/left_boy.jpg', 2),
(3, '/images/car.jpg', 82),
(4, '/images/bag.jpg', 82),
(5, '/images/boy.jpg', 255),
(6, '/images/right_girl.jpg', 256),
(7, '/images/girl.jpg', 256),
(8, '/images/boy.jpg', 257),
(9, '/images/left_boy.jpg', 257),
(10, '/images/right_girl.jpg', 258),
(11, '/images/boy.jpg', 259),
(12, '/images/boy.jpg', 260),
(13, '/images/left_boy.jpg', 260),
(14, '/images/right_girl.jpg', 261),
(15, '/images/girl.jpg', 261),
(16, '/images/boy.jpg', 262),
(17, '/images/girl.jpg', 262),
(18, '/images/boy.jpg', 263),
(19, '/images/left_boy.jpg', 263),
(20, '/images/right_girl.jpg', 264);

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
(1, 16, 1),
(2, 54, 1),
(3, 1, 1),
(4, 61, 1),
(5, 23, 1),
(6, 80, 1),
(7, 52, 1),
(8, 66, 1),
(9, 9, 1),
(10, 55, 1),
(11, 60, 1),
(12, 6, 1),
(13, 76, 1),
(14, 30, 1),
(15, 75, 1),
(16, 7, 1),
(17, 64, 1),
(18, 3, 1),
(19, 18, 1),
(20, 67, 1),
(21, 33, 1),
(22, 53, 1),
(23, 56, 1),
(24, 12, 1),
(25, 73, 1),
(26, 59, 1),
(27, 4, 1),
(28, 40, 1),
(29, 5, 1),
(30, 58, 1),
(31, 34, 1),
(32, 14, 1),
(33, 43, 1),
(34, 63, 1),
(35, 39, 1),
(36, 158, 2),
(37, 109, 2),
(38, 129, 2),
(39, 115, 2),
(40, 90, 2),
(41, 125, 2),
(42, 131, 2),
(43, 104, 2),
(44, 152, 2),
(45, 106, 2),
(46, 148, 2),
(47, 101, 2),
(48, 95, 2),
(49, 151, 2),
(50, 157, 2),
(51, 84, 2),
(52, 146, 2),
(53, 97, 2),
(54, 94, 2),
(55, 133, 2),
(56, 100, 2),
(57, 91, 2),
(58, 107, 2),
(59, 98, 2),
(60, 128, 2),
(61, 83, 2),
(62, 139, 2),
(63, 108, 2),
(64, 85, 2),
(65, 135, 2),
(66, 136, 2),
(67, 154, 2),
(68, 121, 2),
(69, 160, 2),
(70, 86, 2),
(71, 67, 3),
(72, 14, 3),
(73, 25, 3),
(74, 17, 3),
(75, 56, 3),
(76, 152, 3),
(77, 138, 3),
(78, 41, 3),
(79, 99, 3),
(80, 100, 3),
(81, 116, 3),
(82, 9, 3),
(83, 120, 3),
(84, 76, 3),
(85, 42, 3),
(86, 111, 3),
(87, 78, 3),
(88, 122, 3),
(89, 94, 3),
(90, 16, 3),
(91, 35, 3),
(92, 4, 3),
(93, 106, 3),
(94, 103, 3),
(95, 48, 3),
(96, 18, 3),
(97, 132, 3),
(98, 109, 3),
(99, 144, 3),
(100, 133, 3),
(101, 30, 3),
(102, 81, 3),
(103, 19, 3),
(104, 29, 3),
(105, 15, 3),
(123, 220, 7),
(124, 215, 7),
(125, 200, 7),
(126, 224, 7),
(127, 209, 7),
(128, 244, 7),
(129, 241, 7),
(130, 234, 7),
(131, 227, 7),
(132, 226, 7),
(133, 221, 7),
(134, 231, 7),
(135, 202, 7),
(136, 240, 7),
(137, 228, 7),
(138, 208, 7),
(139, 201, 7),
(140, 243, 7),
(141, 235, 7),
(142, 213, 7),
(143, 233, 7),
(144, 211, 7),
(145, 218, 7),
(146, 219, 7),
(147, 242, 7),
(148, 225, 7),
(149, 210, 7),
(150, 207, 7),
(151, 238, 7),
(152, 237, 7),
(153, 203, 7),
(154, 232, 7),
(155, 212, 7),
(156, 214, 7),
(157, 206, 7),
(158, 233, 8),
(159, 241, 8),
(160, 204, 8),
(161, 243, 8),
(162, 232, 8),
(163, 238, 8),
(164, 218, 8),
(165, 231, 8),
(166, 206, 8),
(167, 217, 8),
(168, 228, 8),
(169, 225, 8),
(170, 210, 8),
(171, 227, 8),
(172, 221, 8),
(173, 237, 8),
(174, 200, 8),
(175, 226, 8),
(176, 205, 8),
(177, 211, 8),
(178, 216, 8),
(179, 222, 8),
(180, 201, 8),
(181, 229, 8),
(182, 242, 8),
(183, 235, 8),
(184, 212, 8),
(185, 208, 8),
(186, 230, 8),
(187, 240, 8),
(188, 236, 8),
(189, 203, 8),
(190, 214, 8),
(191, 209, 8),
(192, 234, 8);

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
(1, 'OC Test Package - 1', 'it is a test product', '89', '/images/product-1693910995.jpg', 1, 3, 35, '2023-09-07', 1),
(3, 'OC Test Package - 2', 'adada', '89', '/images/product-1694066622.jpg', 1, 6, 35, '2023-09-03', 1);

-- --------------------------------------------------------

--
-- Table structure for table `test_series_purchases`
--

CREATE TABLE `test_series_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tsp_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `valid_from` varchar(50) NOT NULL,
  `valid_till` varchar(50) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `test_series_purchases`
--

INSERT INTO `test_series_purchases` (`id`, `tsp_id`, `user_id`, `valid_from`, `valid_till`, `status`) VALUES
(2, 3, 2, '2023-09-07', '2023-09-09', 1),
(3, 1, 1, '2023-09-09', '2023-12-09', 1),
(4, 3, 1, '2023-09-09', '2024-03-09', 1);

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
(1, 'OC - Ratio - Easy', 'Ratio', 1, 1, 1),
(2, 'OC - Ratio - Medium', 'Ratio', 1, 1, 1),
(28, 'OC - Thinking - Medium', 'Thinking', 3, 1, 1),
(29, 'OC - Thinking - Easy', 'Thinking', 3, 1, 1),
(30, 'OC - Thinking - Easy2', 'Thinking', 3, 1, 1),
(31, 'Critical Thinking', 'Critical Thinking', 3, 1, 1),
(32, 'Ratio', 'ratio', 1, 1, 1);

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
(1, 1, 1, 'OC Maths set - 1', 1),
(2, 1, 2, 'OC Maths set - 2', 1),
(3, 1, 3, 'OC Maths set - 3', 1),
(7, 3, 1, 'OC Thinking set - 1', 1),
(8, 3, 2, 'OC Thinking set - 2', 1);

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
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 3, 2),
(8, 7, 28),
(9, 7, 30),
(10, 7, 29),
(11, 8, 28),
(12, 8, 29),
(13, 8, 30);

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
(1, 1, 1, 3),
(3, 3, 3, 2);

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
(1, 'Deshawn Orn I', 'abc67@g', '1-478-336-0387', NULL, '2023-09-05 05:01:51', '$2y$10$6gzgBz1ZaAY.iHxt2vPebeVqd3.cZFS4uuIa9CWjfZ8IcQJ9IShPi', '0es5NE5FMs', NULL, NULL),
(2, 'Hthth Sushant', 'spoojari694@gmail.com', '8805778742', NULL, NULL, '$2y$10$4FKyeyScLJgopL7JJU.tt.CQxzToGOYllKvKK28Jvc2GSFamWsJf.', NULL, NULL, NULL);

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
  `percentage` int(11) DEFAULT 0,
  `total_marks` tinyint(4) DEFAULT 0,
  `total_answered` int(11) DEFAULT 0,
  `q_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_test_series`
--

INSERT INTO `user_test_series` (`id`, `tsps_id`, `set_id`, `complete_status`, `start_date`, `end_date`, `time_taken`, `current_timer`, `percentage`, `total_marks`, `total_answered`, `q_id`) VALUES
(8, 2, 7, 1, '09-09-2023', '09-09-2023', '18', NULL, 11, 4, 11, 223),
(9, 4, 7, 1, '09-09-2023', '09-09-2023', '1', '34.59', 17, 6, 13, 270),
(10, 4, 7, 1, '09-09-2023', '09-09-2023', '2', NULL, 26, 9, 22, 308);

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
(206, 220, 1, 'B', 0, 8, '0.04'),
(207, 215, 1, 'B', 0, 8, '30.51'),
(208, 200, 1, 'A', 1, 8, '0'),
(209, 224, 1, 'B', 0, 8, '0.02'),
(210, 209, 1, 'A', 1, 8, '0.05'),
(211, 244, 1, 'A', 0, 8, '0.01'),
(212, 241, 1, 'A', 1, 8, '0.01'),
(213, 234, 1, 'A', 1, 8, '0.03'),
(214, 227, 1, 'C', 0, 8, '0.01'),
(215, 226, 3, NULL, 0, 8, '0'),
(216, 221, 3, NULL, 0, 8, '0'),
(217, 231, 3, NULL, 0, 8, '0'),
(218, 202, 3, NULL, 0, 8, '0'),
(219, 240, 3, NULL, 0, 8, '0'),
(220, 228, 1, 'C', 0, 8, '0.02'),
(221, 208, 3, NULL, 0, 8, '0'),
(222, 201, 3, NULL, 0, 8, '0'),
(223, 243, 1, 'C', 0, 8, '0.01'),
(224, 235, 3, NULL, 0, 8, '0'),
(225, 213, 3, NULL, 0, 8, '0'),
(226, 233, 3, NULL, 0, 8, '0'),
(227, 211, 3, NULL, 0, 8, '0'),
(228, 218, 3, NULL, 0, 8, '0'),
(229, 219, 3, NULL, 0, 8, '0'),
(230, 242, 3, NULL, 0, 8, '0'),
(231, 225, 3, NULL, 0, 8, '0'),
(232, 210, 3, NULL, 0, 8, '0'),
(233, 207, 3, NULL, 0, 8, '0'),
(234, 238, 3, NULL, 0, 8, '0'),
(235, 237, 3, NULL, 0, 8, '0'),
(236, 203, 3, NULL, 0, 8, '0'),
(237, 232, 3, NULL, 0, 8, '0'),
(238, 212, 3, NULL, 0, 8, '0'),
(239, 214, 3, NULL, 0, 8, '0'),
(240, 206, 3, NULL, 0, 8, '0'),
(241, 220, 2, NULL, 0, 9, '0'),
(242, 215, 1, 'A', 1, 9, '0.01'),
(243, 200, 1, 'A', 1, 9, '0.01'),
(244, 224, 2, NULL, 0, 9, '0'),
(245, 209, 3, NULL, 0, 9, '0'),
(246, 244, 3, NULL, 0, 9, '0'),
(247, 241, 3, NULL, 0, 9, '0'),
(248, 234, 1, 'A', 1, 9, '0.01'),
(249, 227, 3, NULL, 0, 9, '0'),
(250, 226, 3, NULL, 0, 9, '0'),
(251, 221, 3, NULL, 0, 9, '0'),
(252, 231, 1, 'A', 1, 9, '0.01'),
(253, 202, 3, NULL, 0, 9, '0'),
(254, 240, 1, 'A', 1, 9, '0.01'),
(255, 228, 3, NULL, 0, 9, '0'),
(256, 208, 1, 'A', 0, 9, '0.01'),
(257, 201, 3, NULL, 0, 9, '0'),
(258, 243, 1, 'B', 0, 9, '0.01'),
(259, 235, 1, 'D', 0, 9, '0.01'),
(260, 213, 3, NULL, 0, 9, '0'),
(261, 233, 1, 'B', 0, 9, '0.02'),
(262, 211, 1, 'C', 0, 9, '0.01'),
(263, 218, 3, NULL, 0, 9, '0'),
(264, 219, 1, 'A', 1, 9, '0.01'),
(265, 242, 1, 'D', 0, 9, '0.01'),
(266, 225, 3, NULL, 0, 9, '0'),
(267, 210, 3, NULL, 0, 9, '0'),
(268, 207, 3, NULL, 0, 9, '0'),
(269, 238, 3, NULL, 0, 9, '0'),
(270, 237, 1, 'A', 0, 9, '0'),
(271, 203, 3, NULL, 0, 9, '0'),
(272, 232, 3, NULL, 0, 9, '0'),
(273, 212, 3, NULL, 0, 9, '0'),
(274, 214, 3, NULL, 0, 9, '0'),
(275, 206, 3, NULL, 0, 9, '0'),
(276, 220, 2, NULL, 0, 10, '0'),
(277, 215, 1, 'A', 1, 10, '0.02'),
(278, 200, 1, 'A', 1, 10, '0.01'),
(279, 224, 1, 'C', 0, 10, '0.01'),
(280, 209, 1, 'C', 0, 10, '0.02'),
(281, 244, 1, 'C', 1, 10, '0'),
(282, 241, 1, 'A', 1, 10, '0.01'),
(283, 234, 1, 'A', 1, 10, '0.01'),
(284, 227, 3, NULL, 0, 10, '0'),
(285, 226, 3, NULL, 0, 10, '0'),
(286, 221, 3, NULL, 0, 10, '0'),
(287, 231, 1, 'B', 0, 10, '0.01'),
(288, 202, 3, NULL, 0, 10, '0'),
(289, 240, 3, NULL, 0, 10, '0'),
(290, 228, 3, NULL, 0, 10, '0'),
(291, 208, 1, 'C', 0, 10, '0'),
(292, 201, 1, 'A', 1, 10, '0.01'),
(293, 243, 1, 'D', 0, 10, '0.01'),
(294, 235, 1, 'C', 1, 10, '0.01'),
(295, 213, 1, 'B', 0, 10, '0.01'),
(296, 233, 1, 'A', 1, 10, '0'),
(297, 211, 1, 'C', 0, 10, '-0.8'),
(298, 218, 1, 'C', 0, 10, '0.1'),
(299, 219, 1, 'C', 0, 10, '0.1'),
(300, 242, 1, 'C', 0, 10, '0.1'),
(301, 225, 1, 'C', 0, 10, '0'),
(302, 210, 1, 'C', 0, 10, '0'),
(303, 207, 1, 'C', 1, 10, '0.01'),
(304, 238, 3, NULL, 0, 10, '0'),
(305, 237, 3, NULL, 0, 10, '0'),
(306, 203, 3, NULL, 0, 10, '0'),
(307, 232, 3, NULL, 0, 10, '0'),
(308, 212, 1, 'C', 0, 10, '0'),
(309, 214, 3, NULL, 0, 10, '0'),
(310, 206, 3, NULL, 0, 10, '0');

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
-- Indexes for table `extra_question_field`
--
ALTER TABLE `extra_question_field`
  ADD PRIMARY KEY (`id`),
  ADD KEY `extra_question_field_q_id_foreign` (`q_id`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_tsc_id_foreign` (`tsc_id`);

--
-- Indexes for table `images_names`
--
ALTER TABLE `images_names`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_names_image_id_foreign` (`image_id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `extra_question_field`
--
ALTER TABLE `extra_question_field`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `images_names`
--
ALTER TABLE `images_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `non_verbal_question`
--
ALTER TABLE `non_verbal_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=265;

--
-- AUTO_INCREMENT for table `question_image`
--
ALTER TABLE `question_image`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `reading_question`
--
ALTER TABLE `reading_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `set_question`
--
ALTER TABLE `set_question`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=193;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `test_series_purchases`
--
ALTER TABLE `test_series_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `test_series_topics`
--
ALTER TABLE `test_series_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `test_status`
--
ALTER TABLE `test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tspc_set`
--
ALTER TABLE `tspc_set`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `ts_pc_topics`
--
ALTER TABLE `ts_pc_topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `ts_product_category`
--
ALTER TABLE `ts_product_category`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_test_series`
--
ALTER TABLE `user_test_series`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_test_status`
--
ALTER TABLE `user_test_status`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=311;

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
-- Constraints for table `extra_question_field`
--
ALTER TABLE `extra_question_field`
  ADD CONSTRAINT `extra_question_field_q_id_foreign` FOREIGN KEY (`q_id`) REFERENCES `question` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_tsc_id_foreign` FOREIGN KEY (`tsc_id`) REFERENCES `test_series_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `images_names`
--
ALTER TABLE `images_names`
  ADD CONSTRAINT `images_names_image_id_foreign` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE CASCADE;

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
