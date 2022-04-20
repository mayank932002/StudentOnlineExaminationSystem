-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2022 at 01:23 PM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `soes`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin1_soes`
--

CREATE TABLE `admin1_soes` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_contact_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_profile` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('Master','User') COLLATE utf8_unicode_ci NOT NULL,
  `user_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `user_created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin1_soes`
--

INSERT INTO `admin1_soes` (`user_id`, `user_name`, `user_contact_no`, `user_email`, `user_password`, `user_profile`, `user_type`, `user_status`, `user_created_on`) VALUES
(1, 'Admin', '8320601536', 'admin@gmail.com', 'admin', '', 'Master', 'Enable', '2022-04-09 17:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `admin_soes`
--

CREATE TABLE `admin_soes` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_contact_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `user_profile` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` enum('Master') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Master',
  `user_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `user_created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `admin_soes`
--

INSERT INTO `admin_soes` (`user_id`, `user_name`, `user_contact_no`, `user_email`, `user_password`, `user_profile`, `user_type`, `user_status`, `user_created_on`) VALUES
(1, 'Faculty', '8320601536', 'faculty@gmail.com', 'faculty', '../images/1647489465.png', 'Master', 'Enable', '2022-03-17 04:57:45'),
(11, 'Mayank', '8320601536', 'pm132061@gmail.com', 'pm132061', '../images/1649577215.png', 'Master', 'Enable', '2022-04-10 13:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `class_soes`
--

CREATE TABLE `class_soes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `class_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `class_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `class_created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `class_soes`
--

INSERT INTO `class_soes` (`class_id`, `class_name`, `class_code`, `class_status`, `class_created_on`) VALUES
(4, 'Computer Engineering 6th Sem CO1', 'bf7a6ca8c856096624ceec499cd9fc71', 'Enable', '2022-04-06 14:08:13'),
(5, 'Computer Engineering 6th Sem CO2', '19fa30d8cabe1339d44c2b6529b1fc8d', 'Enable', '2022-04-06 14:08:20'),
(6, 'Computer Engineering 5th Sem CO1', '9bf5bcd4ecd8c5866991761ca33c7b66', 'Enable', '2022-04-06 14:08:28'),
(7, 'Computer Engineering 5th Sem CO2', '91b4c1f2bed12ac258f4463c0426c14a', 'Enable', '2022-04-06 14:10:06'),
(8, 'Computer Engineering', '492daea2d321bc8f319b014714107eaf', 'Enable', '2022-04-10 13:26:18');

-- --------------------------------------------------------

--
-- Table structure for table `exam_soes`
--

CREATE TABLE `exam_soes` (
  `exam_id` int(11) NOT NULL,
  `exam_title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `exam_class_id` int(11) NOT NULL,
  `exam_duration` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `exam_status` enum('Pending','Created','Started','Completed') COLLATE utf8_unicode_ci NOT NULL,
  `exam_created_on` datetime NOT NULL,
  `exam_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `exam_result_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exam_soes`
--

INSERT INTO `exam_soes` (`exam_id`, `exam_title`, `exam_class_id`, `exam_duration`, `exam_status`, `exam_created_on`, `exam_code`, `exam_result_datetime`) VALUES
(12, 'MID EXAM', 8, '2', 'Completed', '2022-04-10 13:30:57', 'e93df7e3ee56b84123fdae3ad8d3e6fa', '2022-04-10 13:55:00');

-- --------------------------------------------------------

--
-- Table structure for table `exam_subject_question_answer`
--

CREATE TABLE `exam_subject_question_answer` (
  `answer_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `exam_subject_question_id` int(11) NOT NULL,
  `student_answer_option` enum('0','1','2','3','4') COLLATE utf8_unicode_ci NOT NULL,
  `marks` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exam_subject_question_answer`
--

INSERT INTO `exam_subject_question_answer` (`answer_id`, `student_id`, `exam_subject_question_id`, `student_answer_option`, `marks`) VALUES
(26, 1, 33, '4', '-0'),
(27, 1, 34, '4', '-0'),
(28, 1, 35, '4', '+1'),
(29, 1, 36, '4', '-0'),
(30, 1, 37, '4', '-0'),
(31, 1, 38, '4', '-0'),
(32, 1, 39, '4', '-0'),
(33, 1, 40, '4', '-0'),
(34, 1, 41, '4', '-0'),
(35, 1, 42, '4', '-0'),
(36, 1, 43, '4', '-0'),
(37, 10, 48, '1', '-0'),
(38, 10, 44, '1', '-0'),
(39, 10, 45, '2', '+1'),
(40, 10, 46, '4', '-0'),
(41, 10, 47, '4', '-0');

-- --------------------------------------------------------

--
-- Table structure for table `exam_subject_question_soes`
--

CREATE TABLE `exam_subject_question_soes` (
  `exam_subject_question_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `exam_subject_id` int(11) NOT NULL,
  `exam_subject_question_title` text COLLATE utf8_unicode_ci NOT NULL,
  `exam_subject_question_answer` enum('1','2','3','4') COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `exam_subject_question_soes`
--

INSERT INTO `exam_subject_question_soes` (`exam_subject_question_id`, `exam_id`, `exam_subject_id`, `exam_subject_question_title`, `exam_subject_question_answer`) VALUES
(27, 8, 8, 'bgb', '3'),
(28, 8, 8, 'rgr', '4'),
(29, 9, 9, '1.Which of the following contains both date and time?', '4'),
(30, 9, 9, '2.Which of the following is advantage of using JDBC connection pool?', '4'),
(31, 9, 9, '3.Which of the following is advantage of using PreparedStatement in Java?', '3'),
(32, 9, 9, '4.Which one of the following contains date information?', '1'),
(33, 9, 9, '5.What does setAutoCommit(false) do?', '3'),
(34, 9, 9, '6.Which of the following is used to call stored procedure?', '3'),
(35, 9, 9, '7.Which of the following is method of JDBC batch process?', '4'),
(36, 9, 9, '8.Which of the following is used to rollback a JDBC transection?', '1'),
(37, 9, 9, '9.Which driver uses ODBC driver to connect to the database?', '1'),
(38, 9, 9, '10.How many JDBC product components does the Java software provides?', '1'),
(44, 12, 10, '1. What is Digital Electronics?', '4'),
(45, 12, 10, '2. Which of the following is correct for Digital Circuits?', '2'),
(46, 12, 10, '3.What is a Circuit?', '1'),
(47, 12, 10, 'Which of the following is an example of a digital Electronic?', '1'),
(48, 12, 10, 'Which of the following is a type of digital logic circuit?', '2');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_soes`
--

CREATE TABLE `faculty_soes` (
  `faculty_id` int(11) NOT NULL,
  `faculty_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_address` tinytext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_email_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_password` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_gender` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_dob` date NOT NULL,
  `faculty_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_status` enum('Enable','Disable') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_email_verification_code` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_email_verified` enum('Yes') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_added_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `faculty_added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_soes`
--

INSERT INTO `faculty_soes` (`faculty_id`, `faculty_name`, `faculty_address`, `faculty_email_id`, `faculty_password`, `faculty_gender`, `faculty_dob`, `faculty_image`, `faculty_status`, `faculty_email_verification_code`, `faculty_email_verified`, `faculty_added_by`, `faculty_added_on`) VALUES
(3, 'mayank', 'surat', 'pm132061@gmail.com', 'pm132061', 'Male', '2022-04-22', '../images/10340.png', 'Enable', '', 'Yes', 'Master', '2022-04-08 13:23:20'),
(4, 'faculty', 'surat', 'faculty@gmail.com', 'password', 'Male', '2022-04-25', '../images/11728.png', 'Enable', '', 'Yes', 'Master', '2022-04-08 13:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `question_option_soes`
--

CREATE TABLE `question_option_soes` (
  `question_option_id` int(11) NOT NULL,
  `exam_subject_question_id` int(11) NOT NULL,
  `question_option_number` int(1) NOT NULL,
  `question_option_title` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `question_option_soes`
--

INSERT INTO `question_option_soes` (`question_option_id`, `exam_subject_question_id`, `question_option_number`, `question_option_title`) VALUES
(51, 13, 3, 'is not essential when we have millions of files'),
(52, 13, 4, 'none of the above'),
(53, 14, 1, '1'),
(54, 14, 2, '2'),
(55, 14, 3, '3'),
(56, 14, 4, '5'),
(57, 15, 1, 'CATCH'),
(58, 15, 2, 'DISK'),
(59, 15, 3, 'PRINTER'),
(60, 15, 4, 'MOUSE'),
(61, 16, 1, 'hughu7'),
(62, 16, 2, 'ugu7gt'),
(63, 16, 3, 'bughu'),
(64, 16, 4, '8uh8uh'),
(65, 17, 1, 'k fv'),
(66, 17, 2, 'ujbu'),
(67, 17, 3, 'yuvuy67'),
(68, 17, 4, 'yiuyf'),
(69, 18, 1, 'jbb'),
(70, 18, 2, 'jbbkh'),
(71, 18, 3, 'hkiv hj'),
(72, 18, 4, 'hkyvhj'),
(73, 19, 1, 'kibnibn'),
(74, 19, 2, 'kibnkib'),
(75, 19, 3, 'kibjb'),
(76, 19, 4, 'kibibn'),
(77, 20, 1, 'ubjub'),
(78, 20, 2, 'uibju'),
(79, 20, 3, 'ubib'),
(80, 20, 4, 'ibvuib'),
(81, 21, 1, 'kjln bkln'),
(82, 21, 2, 'kjln kjln'),
(83, 21, 3, 'jlknlkn'),
(84, 21, 4, 'ljn'),
(85, 22, 1, 'ffd'),
(86, 22, 2, 'fr'),
(87, 22, 3, 'fre'),
(88, 22, 4, 'fw'),
(89, 1, 1, 'MSC'),
(90, 1, 2, 'Roamer'),
(91, 1, 3, 'Hand off'),
(92, 1, 4, 'Forward channel'),
(93, 2, 1, 'Limited internet browsing'),
(94, 2, 2, 'Short Messaging Service'),
(95, 2, 3, 'Both a &amp; b'),
(96, 2, 4, 'None of the above'),
(97, 3, 1, 'Assigning different group of channels'),
(98, 3, 2, 'Using transmitters with different power level'),
(99, 3, 3, 'Using different antennas'),
(100, 3, 4, 'All of the above'),
(101, 4, 1, 'Circular'),
(102, 4, 2, 'Square'),
(103, 4, 3, 'Oval'),
(104, 4, 4, 'Hexagon'),
(105, 5, 1, 'Increase in radio spectrum'),
(106, 5, 2, 'Increasing the number of base stations &amp; reusing the channels'),
(107, 5, 3, 'Both a &amp; b'),
(108, 5, 4, 'None of the above'),
(109, 6, 1, 'PHP is an open-source programming language'),
(110, 6, 2, 'PHP is used to develop dynamic and interactive websites'),
(111, 6, 3, 'PHP is a server-side scripting language'),
(112, 6, 4, 'All of the mentioned'),
(113, 7, 1, 'Drek Kolkevi'),
(114, 7, 2, 'Rasmus Lerdorf'),
(115, 7, 3, 'Willam Makepiece'),
(116, 7, 4, 'List Barely'),
(117, 8, 1, 'PHP stands for Preprocessor Home Page'),
(118, 8, 2, 'PHP stands for Pretext Hypertext Processor'),
(119, 8, 3, 'PHP stands for Hypertext Preprocessor'),
(120, 8, 4, 'PHP stands for Personal Hyper Processor'),
(121, 9, 1, '&lt;?php ?&gt;'),
(122, 9, 2, '&lt; php &gt;'),
(123, 9, 3, '&lt; ? php ?&gt;'),
(124, 9, 4, '&lt;? ?&gt;'),
(125, 10, 1, '#'),
(126, 10, 2, '//'),
(127, 10, 3, '/**/'),
(128, 10, 4, 'All of the mentioned'),
(129, 11, 1, 'Directory is a combination of multiple data'),
(130, 11, 2, 'Directory is a collection of objects.'),
(131, 11, 3, 'Directory is a file that acts as a folder for other files.'),
(132, 11, 4, 'Directory is a including manysoftware.'),
(133, 12, 1, 'Relative path name'),
(134, 12, 2, 'Absolute path name'),
(135, 12, 3, 'Standalone name'),
(136, 12, 4, 'All of the above'),
(137, 13, 1, 'allows easy storage and retrieval of file names'),
(138, 13, 2, 'is a much-debated unnecessary feature'),
(139, 13, 3, 'is not essential when we have millions of files'),
(140, 13, 4, 'none of the above'),
(141, 14, 1, '1'),
(142, 14, 2, '2'),
(143, 14, 3, '3'),
(144, 14, 4, '5'),
(145, 15, 1, 'CATCH'),
(146, 15, 2, 'DISK'),
(147, 15, 3, 'PRINTER'),
(148, 15, 4, 'MOUSE'),
(149, 16, 1, 'RGRG'),
(150, 16, 2, 'RG'),
(151, 16, 3, 'FGG'),
(152, 16, 4, 'RGR'),
(153, 17, 1, 'GRG'),
(154, 17, 2, 'IYKIU'),
(155, 17, 3, 'UYH'),
(156, 17, 4, 'YHFGR'),
(157, 18, 1, 'GTRD'),
(158, 18, 2, 'GHN'),
(159, 18, 3, 'YHN'),
(160, 18, 4, 'YHN'),
(161, 19, 1, 'TCTY'),
(162, 19, 2, 'TCTY'),
(163, 19, 3, 'YTCTY'),
(164, 19, 4, 'TCT'),
(165, 20, 1, 'TGHG'),
(166, 20, 2, 'HG'),
(167, 20, 3, 'HGHG'),
(168, 20, 4, 'HT'),
(169, 21, 1, 'q'),
(170, 21, 2, 'wd'),
(171, 21, 3, 'fe'),
(172, 21, 4, 'ef'),
(173, 22, 1, 'ffd'),
(174, 22, 2, 'fr'),
(175, 22, 3, 'fre'),
(176, 22, 4, 'fw'),
(177, 23, 1, 'gfg'),
(178, 23, 2, 'fhfh'),
(179, 23, 3, 'fhhf'),
(180, 23, 4, 'fhh'),
(181, 24, 1, '1'),
(182, 24, 2, '2'),
(183, 24, 3, '3'),
(184, 24, 4, '4'),
(185, 25, 1, '21'),
(186, 25, 2, '22'),
(187, 25, 3, '23'),
(188, 25, 4, '24'),
(189, 26, 1, '32'),
(190, 26, 2, '33'),
(191, 26, 3, '34'),
(192, 26, 4, '35'),
(193, 27, 1, '11'),
(194, 27, 2, '12'),
(195, 27, 3, '13'),
(196, 27, 4, '14'),
(197, 28, 1, '41'),
(198, 28, 2, '42'),
(199, 28, 3, '43'),
(200, 28, 4, '44'),
(201, 29, 1, 'java.io.date'),
(202, 29, 2, 'java.sql.date'),
(203, 29, 3, 'java.util.date'),
(204, 29, 4, 'java.util.datetime'),
(205, 30, 1, 'slow performance'),
(206, 30, 2, 'using more memory'),
(207, 30, 3, 'using less memory'),
(208, 30, 4, 'better performance'),
(209, 31, 1, 'slow performance'),
(210, 31, 2, 'encourages sql injection'),
(211, 31, 3, 'prevents sql injection'),
(212, 31, 4, 'more memory usage'),
(213, 32, 1, 'java.sql.timestamp'),
(214, 32, 2, 'java.sql.time'),
(215, 32, 3, 'java.io.time'),
(216, 32, 4, 'java.io.timestamp'),
(217, 33, 1, 'commits transection after each query'),
(218, 33, 2, 'explicitly commits transection'),
(219, 33, 3, 'does not commit transaction automatically after each query'),
(220, 33, 4, 'never commits transection'),
(221, 34, 1, 'statement'),
(222, 34, 2, 'preparedstatement'),
(223, 34, 3, 'callablestatment'),
(224, 34, 4, 'calledstatement'),
(225, 35, 1, 'setbatch()'),
(226, 35, 2, 'deletebatch()'),
(227, 35, 3, 'removebatch()'),
(228, 35, 4, 'addbatch()'),
(229, 36, 1, 'rollback()'),
(230, 36, 2, 'rollforward()'),
(231, 36, 3, 'deletetransection()'),
(232, 36, 4, 'removetransection()'),
(233, 37, 1, 'jdbc-odbc bridge driver'),
(234, 37, 2, 'native - api driver'),
(235, 37, 3, 'network protocol driver'),
(236, 37, 4, 'thin driver'),
(237, 38, 1, '3'),
(238, 38, 2, '2'),
(239, 38, 3, '4'),
(240, 38, 4, '5'),
(241, 39, 1, 'jbbiu'),
(242, 39, 2, 'ihkbuib'),
(243, 39, 3, 'bjuu'),
(244, 39, 4, 'iuobuoi'),
(245, 40, 1, '1'),
(246, 40, 2, '2'),
(247, 40, 3, '3'),
(248, 40, 4, '4'),
(249, 41, 1, '11'),
(250, 41, 2, '12'),
(251, 41, 3, '13'),
(252, 41, 4, '14'),
(253, 42, 1, '45'),
(254, 42, 2, '46'),
(255, 42, 3, '47'),
(256, 42, 4, '49'),
(257, 43, 1, 'ipnvk'),
(258, 43, 2, 'ionbu'),
(259, 43, 3, 'kinn'),
(260, 43, 4, 'kin'),
(261, 44, 1, 'Field of electronics involving the study of digital signal'),
(262, 44, 2, 'Engineering of devices that digital signal'),
(263, 44, 3, 'Engineering of devices that produce digital signal'),
(264, 44, 4, 'All pf the mentioned'),
(265, 45, 1, 'Less susceptible to noise or degradation in quality'),
(266, 45, 2, 'Use transistors to create logic gates to perform Boolean logic'),
(267, 45, 3, 'Easier to perform error detection and correction with digital signal'),
(268, 45, 4, 'All of the mentioned'),
(269, 46, 1, 'Open-loop through which electrons can pass'),
(270, 46, 2, 'Closed-loop through which electrons can pass'),
(271, 46, 3, 'Closed-loop through which Neutrons can pass'),
(272, 46, 4, 'None of the mentioned'),
(273, 47, 1, 'Computers'),
(274, 47, 2, 'Information appliances'),
(275, 47, 3, 'Digital cameras'),
(276, 47, 4, 'All of the mentioned'),
(277, 48, 1, 'Combinational logic circuits'),
(278, 48, 2, 'Sequential logic circuits'),
(279, 48, 3, 'Both a &amp; b'),
(280, 48, 4, 'None of the mentioned');

-- --------------------------------------------------------

--
-- Table structure for table `student_soes`
--

CREATE TABLE `student_soes` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_address` tinytext COLLATE utf8_unicode_ci NOT NULL,
  `student_email_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `student_gender` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `student_dob` date NOT NULL,
  `student_image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `student_email_verification_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `student_email_verified` enum('No','Yes') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Yes',
  `student_added_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `student_added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_soes`
--

INSERT INTO `student_soes` (`student_id`, `student_name`, `student_address`, `student_email_id`, `student_password`, `student_gender`, `student_dob`, `student_image`, `student_status`, `student_email_verification_code`, `student_email_verified`, `student_added_by`, `student_added_on`) VALUES
(1, 'Mayank Patel', 'Surat', 'pm132061@gmail.com', 'pm132061', 'Male', '2002-03-09', '../images/25325.jpg', 'Enable', '446e5529b3d225d74fdf8391fdce4447', 'Yes', 'Master', '2022-03-17 09:30:33'),
(2, 'Ishant Patil', 'Surat', 'ishantpatil@gmail.com', 'ishant123', 'Male', '2002-03-01', '../images/1314.jpg', 'Enable', '', 'Yes', 'Master', '2022-04-06 18:20:30'),
(3, 'Vinay Patil', 'Surat', 'vinaypatil@gmail.com', 'vinay123', 'Male', '2002-03-21', '../images/15283.jpg', 'Enable', '', 'Yes', 'Master', '2022-04-06 18:21:53'),
(4, 'Uday Patil', 'Surat', 'udaypatil@gmail.com', 'uday123', 'Male', '2002-04-18', '../images/9584.jpg', 'Enable', '', 'Yes', 'Master', '2022-04-06 18:23:37'),
(5, 'Harsh Parte', 'Surat', 'harshparte@gmail.com', 'harsh123', 'Male', '2002-04-26', '../images/16617.jpg', 'Enable', '', 'Yes', 'Master', '2022-04-06 18:24:45'),
(6, 'Neel Pachigar', 'Surat', 'neelpachigar@gmail.com', 'neel123', 'Male', '2022-04-16', '../images/20846.jpg', 'Enable', '', 'Yes', 'Master', '2022-04-06 18:26:28'),
(7, 'Dhruv Patel', 'Surat', 'dhruvpatel@gmail.com', 'dhruv123', 'Male', '2022-04-29', '../images/24591.jpg', 'Enable', '', 'Yes', 'Master', '2022-04-06 18:28:45'),
(8, 'Aryan Parmar', 'Surat', 'aryanparmar@gmail.com', 'aryan123', 'Male', '2022-04-30', '../images/10396.jpg', 'Enable', '', 'Yes', 'Master', '2022-04-06 18:30:03'),
(10, 'Praful Patil', 'Surat', 'prafulpatil@gmail.com', 'prafulpatil', 'Male', '2002-05-21', '../images/30861.png', 'Enable', '', 'Yes', 'Master', '2022-04-10 13:29:23');

-- --------------------------------------------------------

--
-- Table structure for table `student_to_class_soes`
--

CREATE TABLE `student_to_class_soes` (
  `student_to_class_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `student_roll_no` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `student_to_class_soes`
--

INSERT INTO `student_to_class_soes` (`student_to_class_id`, `class_id`, `student_id`, `student_roll_no`, `added_on`) VALUES
(1, 6, 8, '196080307001', '2022-04-06 18:30:36'),
(2, 6, 7, '196080307002', '2022-04-06 18:30:50'),
(3, 7, 5, '196080307003', '2022-04-06 18:31:02'),
(4, 7, 2, '196080307004', '2022-04-06 18:31:12'),
(5, 4, 1, '196080307005', '2022-04-06 18:31:26'),
(6, 4, 6, '196080307006', '2022-04-06 18:31:35'),
(7, 5, 4, '196080307007', '2022-04-06 18:31:43'),
(8, 5, 3, '196080307008', '2022-04-06 18:31:52'),
(9, 8, 10, '196080307015', '2022-04-10 13:30:38');

-- --------------------------------------------------------

--
-- Table structure for table `subject_soes`
--

CREATE TABLE `subject_soes` (
  `subject_id` int(11) NOT NULL,
  `subject_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `subject_status` enum('Enable','Disable') COLLATE utf8_unicode_ci NOT NULL,
  `subject_created_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject_soes`
--

INSERT INTO `subject_soes` (`subject_id`, `subject_name`, `subject_status`, `subject_created_on`) VALUES
(6, 'JAVA', 'Enable', '2022-04-06 14:10:22'),
(7, 'AJAVA', 'Enable', '2022-04-06 14:10:27'),
(8, 'DWPD', 'Enable', '2022-04-06 14:10:33'),
(9, 'NMA', 'Enable', '2022-04-06 14:10:39'),
(10, 'MCAD', 'Enable', '2022-04-06 14:10:46'),
(11, 'CNS', 'Enable', '2022-04-06 14:10:59'),
(12, 'CMTS', 'Enable', '2022-04-06 14:11:05'),
(13, 'AJP', 'Enable', '2022-04-07 00:24:46'),
(14, 'FDE', 'Enable', '2022-04-10 13:26:43');

-- --------------------------------------------------------

--
-- Table structure for table `subject_to_class_soes`
--

CREATE TABLE `subject_to_class_soes` (
  `subject_to_class_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `added_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject_to_class_soes`
--

INSERT INTO `subject_to_class_soes` (`subject_to_class_id`, `class_id`, `subject_id`, `added_on`) VALUES
(10, 6, 12, '2022-04-06 14:11:38'),
(11, 6, 11, '2022-04-06 14:11:45'),
(12, 6, 8, '2022-04-06 14:11:51'),
(13, 6, 6, '2022-04-06 14:11:57'),
(14, 7, 12, '2022-04-06 14:12:07'),
(15, 7, 11, '2022-04-06 14:12:14'),
(16, 7, 8, '2022-04-06 14:12:20'),
(17, 7, 6, '2022-04-06 14:12:27'),
(18, 4, 7, '2022-04-06 14:12:39'),
(19, 5, 7, '2022-04-06 14:12:55'),
(20, 4, 10, '2022-04-06 14:13:02'),
(21, 5, 10, '2022-04-06 14:13:08'),
(22, 4, 9, '2022-04-06 14:13:15'),
(23, 5, 9, '2022-04-06 14:13:22'),
(24, 6, 13, '2022-04-07 00:25:04'),
(25, 4, 13, '2022-04-08 07:13:50'),
(26, 8, 14, '2022-04-10 13:27:04');

-- --------------------------------------------------------

--
-- Table structure for table `subject_wise_exam_detail`
--

CREATE TABLE `subject_wise_exam_detail` (
  `exam_subject_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `subject_total_question` int(5) NOT NULL,
  `marks_per_right_answer` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `marks_per_wrong_answer` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `subject_exam_datetime` datetime NOT NULL,
  `subject_exam_status` enum('Pending','Started','Completed') COLLATE utf8_unicode_ci NOT NULL,
  `subject_exam_code` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subject_wise_exam_detail`
--

INSERT INTO `subject_wise_exam_detail` (`exam_subject_id`, `exam_id`, `subject_id`, `subject_total_question`, `marks_per_right_answer`, `marks_per_wrong_answer`, `subject_exam_datetime`, `subject_exam_status`, `subject_exam_code`) VALUES
(10, 12, 14, 5, '1', '0', '2022-04-10 13:50:00', 'Completed', '096232ec5550795161125482c0479a67');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin1_soes`
--
ALTER TABLE `admin1_soes`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `admin_soes`
--
ALTER TABLE `admin_soes`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `class_soes`
--
ALTER TABLE `class_soes`
  ADD PRIMARY KEY (`class_id`);

--
-- Indexes for table `exam_soes`
--
ALTER TABLE `exam_soes`
  ADD PRIMARY KEY (`exam_id`);

--
-- Indexes for table `exam_subject_question_answer`
--
ALTER TABLE `exam_subject_question_answer`
  ADD PRIMARY KEY (`answer_id`);

--
-- Indexes for table `exam_subject_question_soes`
--
ALTER TABLE `exam_subject_question_soes`
  ADD PRIMARY KEY (`exam_subject_question_id`);

--
-- Indexes for table `faculty_soes`
--
ALTER TABLE `faculty_soes`
  ADD PRIMARY KEY (`faculty_id`);

--
-- Indexes for table `question_option_soes`
--
ALTER TABLE `question_option_soes`
  ADD PRIMARY KEY (`question_option_id`);

--
-- Indexes for table `student_soes`
--
ALTER TABLE `student_soes`
  ADD PRIMARY KEY (`student_id`);

--
-- Indexes for table `student_to_class_soes`
--
ALTER TABLE `student_to_class_soes`
  ADD PRIMARY KEY (`student_to_class_id`);

--
-- Indexes for table `subject_soes`
--
ALTER TABLE `subject_soes`
  ADD PRIMARY KEY (`subject_id`);

--
-- Indexes for table `subject_to_class_soes`
--
ALTER TABLE `subject_to_class_soes`
  ADD PRIMARY KEY (`subject_to_class_id`);

--
-- Indexes for table `subject_wise_exam_detail`
--
ALTER TABLE `subject_wise_exam_detail`
  ADD PRIMARY KEY (`exam_subject_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin1_soes`
--
ALTER TABLE `admin1_soes`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `admin_soes`
--
ALTER TABLE `admin_soes`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `class_soes`
--
ALTER TABLE `class_soes`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `exam_soes`
--
ALTER TABLE `exam_soes`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `exam_subject_question_answer`
--
ALTER TABLE `exam_subject_question_answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `exam_subject_question_soes`
--
ALTER TABLE `exam_subject_question_soes`
  MODIFY `exam_subject_question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;
--
-- AUTO_INCREMENT for table `faculty_soes`
--
ALTER TABLE `faculty_soes`
  MODIFY `faculty_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `question_option_soes`
--
ALTER TABLE `question_option_soes`
  MODIFY `question_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=281;
--
-- AUTO_INCREMENT for table `student_soes`
--
ALTER TABLE `student_soes`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `student_to_class_soes`
--
ALTER TABLE `student_to_class_soes`
  MODIFY `student_to_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `subject_soes`
--
ALTER TABLE `subject_soes`
  MODIFY `subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `subject_to_class_soes`
--
ALTER TABLE `subject_to_class_soes`
  MODIFY `subject_to_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
--
-- AUTO_INCREMENT for table `subject_wise_exam_detail`
--
ALTER TABLE `subject_wise_exam_detail`
  MODIFY `exam_subject_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
