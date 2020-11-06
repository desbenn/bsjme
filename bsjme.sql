-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 06, 2020 at 03:22 PM
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
-- Database: `bsjme`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity`
--

DROP TABLE IF EXISTS `activity`;
CREATE TABLE IF NOT EXISTS `activity` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active 2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `activity`
--

INSERT INTO `activity` (`id`, `name`, `active`) VALUES
(1, 'Active', 1),
(2, 'Inactive', 1),
(3, 'Pending', 1);

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultation_id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer` text,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultation_id` (`consultation_id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`id`, `consultation_id`, `question_id`, `answer`, `updated_date`, `updated_by`) VALUES
(1, 32, 14, '[\"hello darkness my old friend\"]', '2020-11-06 14:20:58', 23),
(2, 32, 23, '[\"26\"]', '2020-11-06 14:26:24', 23),
(3, 32, 30, '[\"31\"]', '2020-11-06 14:28:36', 23),
(4, 32, 28, '[\"we trying our best\"]', '2020-11-06 14:59:37', 23);

-- --------------------------------------------------------

--
-- Table structure for table `billing_item`
--

DROP TABLE IF EXISTS `billing_item`;
CREATE TABLE IF NOT EXISTS `billing_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `type` int(11) NOT NULL COMMENT 'type is either income or expense, income being 0 and expense being 1',
  `cost` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `billing_item`
--

INSERT INTO `billing_item` (`id`, `name`, `description`, `type`, `cost`) VALUES
(2, 'Mechanical', 'Test the malleability of metal pipe', 0, 30421),
(3, 'Chemistry', 'Poison', 1, 11501),
(4, 'Workshop', 'Extend cabinet', 0, 5000);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active 2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `active`) VALUES
(1, 'New member', 1);

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE IF NOT EXISTS `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `code`, `name`, `active`) VALUES
(1, 1, 'Kingston', 1);

-- --------------------------------------------------------

--
-- Table structure for table `clause`
--

DROP TABLE IF EXISTS `clause`;
CREATE TABLE IF NOT EXISTS `clause` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) NOT NULL DEFAULT '1',
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clause`
--

INSERT INTO `clause` (`id`, `standard_id`, `code`, `name`, `active`) VALUES
(4, 1, '4', 'clause 4', 1),
(5, 1, '5', 'clause 5', 1),
(6, 1, '6', 'clause 6', 1),
(7, 1, '7', 'clause 7', 1),
(8, 1, '8', 'clause 8', 1),
(9, 1, '9', 'clause 9', 1),
(10, 1, '10', 'clause 10', 1),
(11, 2, '22', 'Clause 22', 1),
(13, 5, 'N1', 'Qualification for Registration of Company', 1),
(14, 6, '1', 'clause 1', 1),
(15, 6, '2', 'clause 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trn` varchar(25) NOT NULL,
  `activity_id` tinyint(1) NOT NULL COMMENT '1=active  2=inactive  3=pending',
  `city_id` int(11) DEFAULT NULL,
  `county_id` int(11) NOT NULL,
  `parish_id` int(11) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `attempt` int(11) DEFAULT '0',
  `client_name` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `director_name` varchar(50) DEFAULT NULL,
  `directory` varchar(100) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `objective` text,
  `phone` varchar(50) DEFAULT NULL,
  `postal_box` varchar(45) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `remark` text,
  `target` text,
  `website` varchar(100) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `trn` (`trn`),
  KEY `client_name` (`client_name`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `trn`, `activity_id`, `city_id`, `county_id`, `parish_id`, `address`, `attempt`, `client_name`, `company_name`, `contact_name`, `director_name`, `directory`, `district`, `email`, `mobile`, `objective`, `phone`, `postal_box`, `postal_code`, `remark`, `target`, `website`, `updated_date`, `updated_by`) VALUES
(24, 'TRN001', 1, 0, 1, 8, '650 Jean-D\'Estrees apt 807', 0, 'Carmen Gagnon', 'Voyagine Inc', 'Carmen', 'Carmen Gagnon', 'TRN001', '', 'voyagine@hotmail.com', '', '', '05149836594', 'H3C0G3', 'H3C0G3', '', '', '', '2020-02-27 00:57:20', 18),
(25, 'TRN002', 2, 0, 1, 2, '11700 Racette', 0, 'M. Just', 'Hotel Association', 'Muriel', 'Muriel', 'TRN002', '', 'voyagine@hotmail.com', '', '', '5149836594', 'H1G 5J5', 'H1G 5J5', '', '', '', '2020-09-28 19:38:31', 23),
(26, 'TRN50', 1, 1, 1, 1, '67 Home Drive', 0, 'M. Untel', 'Jewel int.', '', '', 'TRN50', '', 'jewel@gmail.com', '4567899', '', '', '', '', 'dfdfsdfd', '', '', '2020-05-23 00:13:41', 28),
(28, '123456789', 1, 0, 1, 1, 'dfdfd', 0, 'dfdfdf', 'fdfd', '', '', '123456789', '', 'nicholasjumpp1@gmail.com', '', '', '', '', '', '', '', '', '2020-11-03 19:06:44', 23);

-- --------------------------------------------------------

--
-- Table structure for table `client_requirement`
--

DROP TABLE IF EXISTS `client_requirement`;
CREATE TABLE IF NOT EXISTS `client_requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `requirement_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
CREATE TABLE IF NOT EXISTS `consultation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultation_no` varchar(25) NOT NULL,
  `clause_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `consultant_id` text,
  `phase_id` int(11) NOT NULL,
  `program_id` int(11) NOT NULL,
  `sector_id` int(11) NOT NULL,
  `standard_id` int(11) DEFAULT NULL,
  `status_id` int(11) NOT NULL,
  `board_meeting_time_period` text,
  `business_process` text,
  `date_begin` date DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `description` varchar(150) DEFAULT NULL,
  `exemption` text,
  `management_review_time` text,
  `product` text,
  `quality_policy` text,
  `remark` text,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`id`, `consultation_no`, `clause_id`, `client_id`, `consultant_id`, `phase_id`, `program_id`, `sector_id`, `standard_id`, `status_id`, `board_meeting_time_period`, `business_process`, `date_begin`, `date_creation`, `date_end`, `description`, `exemption`, `management_review_time`, `product`, `quality_policy`, `remark`, `updated_date`, `updated_by`) VALUES
(31, 'CON01', 11, 24, '[\"29\",\"30\"]', 1, 8, 4, 2, 11, '', '', '2020-02-27', '2020-02-27', '0000-00-00', 'Consultation 1', '', '', '', '', '', '2020-09-25 21:23:11', 23),
(32, 'CON02', 13, 25, '[\"29\"]', 2, 14, 4, 5, 21, '', '', '2020-02-27', '2020-02-27', '0000-00-00', 'Consultation 2', '', '', '', '', '', '2020-11-06 19:28:28', 23);

-- --------------------------------------------------------

--
-- Table structure for table `county`
--

DROP TABLE IF EXISTS `county`;
CREATE TABLE IF NOT EXISTS `county` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `county`
--

INSERT INTO `county` (`id`, `code`, `name`, `active`) VALUES
(1, 1, 'Cornwall', 1),
(2, 2, 'Middlesex', 1),
(3, 3, 'Surrey', 1);

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `consultation_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `document_class_id` int(11) NOT NULL DEFAULT '1',
  `doc_name` varchar(100) DEFAULT NULL,
  `doc_size` int(10) DEFAULT '0',
  `doc_type` varchar(30) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `intervention_no` (`consultation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `client_id`, `consultation_id`, `post_id`, `document_type_id`, `document_class_id`, `doc_name`, `doc_size`, `doc_type`, `updated_date`, `updated_by`) VALUES
(83, 24, NULL, NULL, 2, 4, 'Client_Services_Network_Diagram.pdf', 178, 'application/pdf', '2020-02-27 00:57:34', 18),
(85, 24, 31, NULL, 5, 1, 'WBS_Orville.jpg', 1943, 'image/jpeg', '2020-02-27 00:58:34', 18),
(86, 25, NULL, NULL, 2, 2, '20191212_124515.jpg', 2321, 'image/jpeg', '2020-02-27 12:39:44', 18),
(87, 25, 32, NULL, 3, 4, 'Client_Services_wbs.pdf', 91, 'application/pdf', '2020-02-27 12:40:38', 18),
(88, 25, 32, NULL, 5, 1, 'Quality_Procedures_Manual_for_ISO_9001.pdf', 444, 'application/pdf', '2020-02-27 12:42:17', 18);

-- --------------------------------------------------------

--
-- Table structure for table `document_class`
--

DROP TABLE IF EXISTS `document_class`;
CREATE TABLE IF NOT EXISTS `document_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document_class`
--

INSERT INTO `document_class` (`id`, `code`, `name`, `active`) VALUES
(1, 'NORMAL', 'Normal', 1),
(2, 'CLASSIFIED', 'Classified', 1),
(3, 'SECURE', 'Secure', 1),
(4, 'CONFIDENT', 'Confidential', 1),
(5, 'PRIVATE', 'Private', 1);

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `document_class_id` int(11) NOT NULL DEFAULT '1',
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`id`, `document_class_id`, `code`, `name`, `active`) VALUES
(1, 1, 'DETAIL', 'Detail', 1),
(2, 2, 'ANNUAL', 'Annual Report', 1),
(3, 1, 'PLAN', 'Corporate Plan', 1),
(5, 1, 'OTHER', 'Other', 1),
(6, 1, 'POST', 'Post Documents', 1),
(7, 1, 'FINANCE', 'Financial report', 1),
(8, 1, 'CHART', 'Organizational Chart', 1),
(9, 1, 'PROCESS', 'Process Inputs and Outputs', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
CREATE TABLE IF NOT EXISTS `inquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `inquiry_type_id` int(11) DEFAULT NULL,
  `support_type_id` int(11) DEFAULT NULL,
  `request` text,
  `feedback` text,
  `answered_by` varchar(50) DEFAULT NULL,
  `inquiry_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inquiry`
--

INSERT INTO `inquiry` (`id`, `client_id`, `inquiry_type_id`, `support_type_id`, `request`, `feedback`, `answered_by`, `inquiry_date`) VALUES
(1, 25, 2, 1, 'Could you please clarify the needs analysis', 'Sure no proble. fix so and so ', '', '2020-07-29');

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_type`
--

DROP TABLE IF EXISTS `inquiry_type`;
CREATE TABLE IF NOT EXISTS `inquiry_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `inquiry_type`
--

INSERT INTO `inquiry_type` (`id`, `code`, `name`, `active`) VALUES
(2, 'QUESTION', 'Specific question', 1);

-- --------------------------------------------------------

--
-- Table structure for table `internal_cost_plan`
--

DROP TABLE IF EXISTS `internal_cost_plan`;
CREATE TABLE IF NOT EXISTS `internal_cost_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ta_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `billing_item_id` int(11) NOT NULL,
  `p_amount` double DEFAULT NULL,
  `a_amount` double DEFAULT NULL,
  `date_updated` date NOT NULL,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `billing_item_id` (`billing_item_id`),
  KEY `client_id` (`client_id`),
  KEY `ta_id` (`ta_id`),
  KEY `updated_by` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `internal_cost_plan`
--

INSERT INTO `internal_cost_plan` (`id`, `ta_id`, `client_id`, `billing_item_id`, `p_amount`, `a_amount`, `date_updated`, `updated_by`) VALUES
(6, 8, 24, 3, 12000, 11501, '2020-10-08', 23),
(8, 8, 24, 2, 50123, 30426, '2020-11-06', 23),
(9, 8, 24, 4, 6000, 5000, '2020-10-20', 23),
(10, 8, 24, 3, 50, 50, '2020-10-20', 23);

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `module` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `subject_id` int(11) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `consultation_id` int(11) DEFAULT NULL,
  `ta_id` int(11) DEFAULT NULL,
  `remark` text,
  `attributes` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=159 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `user_id`, `timestamp`, `module`, `action`, `subject_id`, `client_id`, `consultation_id`, `ta_id`, `remark`, `attributes`) VALUES
(78, 18, '2020-02-27 13:55:29', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase End to phase Phase 1', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:1:\"0\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"7\";s:10:\"program_id\";s:2:\"11\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"49\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 12:40:56\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:3:\"End\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"8\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"11\";s:12:\"updated_date\";s:19:\"2020-02-27 13:55:29\";s:10:\"updated_by\";s:2:\"18\";}}'),
(77, 18, '2020-02-27 13:51:16', 'Client', 'Update', 25, 25, NULL, NULL, 'Update Client TRN002', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Association Hotel\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 07:39:24\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:14:\"67 Home Street\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 08:42:29\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"city_id\";s:0:\"\";s:12:\"company_name\";s:17:\"Hotel Association\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"contact_name\";s:6:\"Muriel\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"2\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:6:\"TRN002\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}}'),
(63, 18, '2020-02-27 00:57:20', 'Client', 'Create', 24, 24, NULL, NULL, 'Create Client 24', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"city_id\";s:0:\"\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:6:\"TRN001\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"18\";}'),
(76, 18, '2020-02-27 13:42:29', 'Client', 'Create', 26, 26, NULL, NULL, 'Create Client TRN50', 'a:22:{s:11:\"activity_id\";s:1:\"3\";s:7:\"address\";s:14:\"67 Home Street\";s:7:\"city_id\";s:1:\"1\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"18\";}'),
(75, 18, '2020-02-27 12:42:17', 'Consultation Document', 'Upload', 88, 25, 32, NULL, 'Upload of document Quality_Procedures_Manual_for_ISO_9001.pdf', 'a:8:{s:9:\"client_id\";s:2:\"25\";s:15:\"consultation_id\";s:2:\"32\";s:8:\"doc_size\";d:443.69;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:42:\"Quality_Procedures_Manual_for_ISO_9001.pdf\";s:16:\"document_type_id\";s:1:\"5\";s:17:\"document_class_id\";s:1:\"1\";s:10:\"updated_by\";s:2:\"18\";}'),
(73, 18, '2020-02-27 12:40:38', 'Consultation Document', 'Upload', 87, 25, 32, NULL, 'Upload of document Client_Services_wbs.pdf', 'a:8:{s:9:\"client_id\";s:2:\"25\";s:15:\"consultation_id\";s:2:\"32\";s:8:\"doc_size\";d:90.71;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:23:\"Client_Services_wbs.pdf\";s:16:\"document_type_id\";s:1:\"3\";s:17:\"document_class_id\";s:1:\"4\";s:10:\"updated_by\";s:2:\"18\";}'),
(74, 18, '2020-02-27 12:40:56', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Analysis to phase End', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:1:\"0\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"5\";s:10:\"program_id\";s:2:\"11\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"50\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 12:40:27\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Association Hotel\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:8:\"Analysis\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 3\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"7\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"11\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"49\";s:12:\"updated_date\";s:19:\"2020-02-27 12:40:56\";s:10:\"updated_by\";s:2:\"18\";}}'),
(68, 18, '2020-02-27 00:58:38', 'Consultation Document', 'Delete', 84, 24, 31, NULL, 'Delete of document Client_Services_wbs.pdf', 'a:12:{s:2:\"id\";s:2:\"84\";s:9:\"client_id\";s:2:\"24\";s:15:\"consultation_id\";s:2:\"31\";s:7:\"post_id\";N;s:16:\"document_type_id\";s:1:\"5\";s:17:\"document_class_id\";s:1:\"4\";s:8:\"doc_name\";s:23:\"Client_Services_wbs.pdf\";s:8:\"doc_size\";s:2:\"91\";s:8:\"doc_type\";s:15:\"application/pdf\";s:12:\"updated_date\";s:19:\"2020-02-26 19:58:15\";s:10:\"updated_by\";s:2:\"18\";s:9:\"directory\";s:6:\"TRN001\";}'),
(69, 18, '2020-02-27 12:39:24', 'Client', 'Create', 25, 25, NULL, NULL, 'Create Client TRN002', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"city_id\";s:0:\"\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Association Hotel\";s:12:\"contact_name\";s:6:\"Muriel\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"2\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:6:\"TRN002\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"18\";}'),
(70, 18, '2020-02-27 12:39:44', 'Client Document', 'Upload', 86, 25, NULL, NULL, 'Upload of document 20191212_124515.jpg', 'a:7:{s:9:\"client_id\";s:2:\"25\";s:8:\"doc_size\";d:2321.46;s:8:\"doc_type\";s:10:\"image/jpeg\";s:8:\"doc_name\";s:19:\"20191212_124515.jpg\";s:16:\"document_type_id\";s:1:\"2\";s:17:\"document_class_id\";s:1:\"2\";s:10:\"updated_by\";s:2:\"18\";}'),
(71, 18, '2020-02-27 12:40:15', 'Consultation', 'Create', 32, 25, 32, NULL, 'Create Consultation CON02', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"11\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:10:\"updated_by\";s:2:\"18\";}'),
(72, 18, '2020-02-27 12:40:27', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Introduction to phase Analysis', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:1:\"0\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"11\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 07:40:15\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Association Hotel\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 3\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"5\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"11\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"50\";s:12:\"updated_date\";s:19:\"2020-02-27 12:40:27\";s:10:\"updated_by\";s:2:\"18\";}}'),
(64, 18, '2020-02-27 00:57:34', 'Client Document', 'Upload', 83, 24, NULL, NULL, 'Upload of document Client_Services_Network_Diagram.pdf', 'a:7:{s:9:\"client_id\";s:2:\"24\";s:8:\"doc_size\";d:177.86;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:35:\"Client_Services_Network_Diagram.pdf\";s:16:\"document_type_id\";s:1:\"2\";s:17:\"document_class_id\";s:1:\"4\";s:10:\"updated_by\";s:2:\"18\";}'),
(65, 18, '2020-02-27 00:57:59', 'Consultation', 'Create', 31, 24, 31, NULL, 'Create Consultation CON01', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"24\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON01\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 1\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"8\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"11\";s:10:\"updated_by\";s:2:\"18\";}'),
(66, 18, '2020-02-27 00:58:15', 'Consultation Document', 'Upload', 84, 24, 31, NULL, 'Upload of document Client_Services_wbs.pdf', 'a:8:{s:9:\"client_id\";s:2:\"24\";s:15:\"consultation_id\";s:2:\"31\";s:8:\"doc_size\";d:90.71;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:23:\"Client_Services_wbs.pdf\";s:16:\"document_type_id\";s:1:\"5\";s:17:\"document_class_id\";s:1:\"4\";s:10:\"updated_by\";s:2:\"18\";}'),
(67, 18, '2020-02-27 00:58:34', 'Consultation Document', 'Upload', 85, 24, 31, NULL, 'Upload of document WBS_Orville.jpg', 'a:8:{s:9:\"client_id\";s:2:\"24\";s:15:\"consultation_id\";s:2:\"31\";s:8:\"doc_size\";d:1943.11;s:8:\"doc_type\";s:10:\"image/jpeg\";s:8:\"doc_name\";s:15:\"WBS_Orville.jpg\";s:16:\"document_type_id\";s:1:\"5\";s:17:\"document_class_id\";s:1:\"1\";s:10:\"updated_by\";s:2:\"18\";}'),
(79, 18, '2020-02-27 14:02:08', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Phase 1 to phase Introduction', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"1\";s:10:\"program_id\";s:1:\"8\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"11\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:55:29\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 1\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 1\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:12:\"updated_date\";s:19:\"2020-02-27 14:02:08\";s:10:\"updated_by\";s:2:\"18\";}}'),
(80, 18, '2020-02-27 15:07:29', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"13\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 14:02:08\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs Analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"48\";s:12:\"updated_date\";s:19:\"2020-02-27 15:07:29\";s:10:\"updated_by\";s:2:\"18\";}}'),
(81, 23, '2020-03-19 21:18:51', 'Client', 'Delete', 27, 27, NULL, NULL, 'Delete Client 27', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"27\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:17:\"2 Winchester Road\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:5:\"Frank\";s:12:\"company_name\";s:17:\"Frank Barber Shop\";s:12:\"contact_name\";s:5:\"Frank\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:22:\"frankhotdogs@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:31:\"Standardize my hot dog business\";s:5:\"phone\";s:14:\"1-999-999-9999\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-09 12:27:46\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:14:\"67 Home Street\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 08:42:29\";s:10:\"updated_by\";s:2:\"18\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(82, 23, '2020-03-19 21:28:21', 'Client', 'Update', 26, 26, NULL, NULL, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:14:\"67 Home Street\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 08:42:29\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"3\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:28:21\";s:10:\"updated_by\";s:2:\"23\";}}'),
(83, 23, '2020-03-19 21:29:47', 'Client', 'Update', 26, 26, NULL, NULL, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:28:21\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"2\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}}'),
(84, 23, '2020-03-19 22:05:09', 'Client', 'Delete', 28, 28, NULL, NULL, 'Delete Client 28', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"28\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:18:\"26 Maple Leaf Mews\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:11:\"Vybz Kartel\";s:12:\"company_name\";s:8:\"Bad Dawg\";s:12:\"contact_name\";s:11:\"Vybz Kartel\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:23:\"Standardize my sausages\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:14:\"Needs Analysis\";s:7:\"website\";s:23:\"https://www.youtube.com\";s:12:\"updated_date\";s:19:\"2020-03-19 17:01:33\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(85, 23, '2020-03-19 22:11:34', 'Client', 'Delete', 29, 29, NULL, NULL, 'Delete Client 29', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"29\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:18:\"26 Maple Leaf Mews\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:11:\"Vybz Kartel\";s:12:\"company_name\";s:8:\"Bad Dawg\";s:12:\"contact_name\";s:11:\"Vybz Kartel\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:23:\"Standardize my sausages\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:14:\"Needs Analysis\";s:7:\"website\";s:23:\"https://www.youtube.com\";s:12:\"updated_date\";s:19:\"2020-03-19 17:10:24\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(86, 23, '2020-03-19 22:17:12', 'Client', 'Delete', 30, 30, NULL, NULL, 'Delete Client 30', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"30\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:2:\"13\";s:7:\"address\";s:8:\"dssdfsdf\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:7:\"dfsdfsd\";s:12:\"company_name\";s:5:\"sfdfs\";s:12:\"contact_name\";s:7:\"dfsdfsd\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:6:\"fdffdf\";s:5:\"phone\";s:14:\"1-755-964-5214\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:14:\"Needs Analysis\";s:7:\"website\";s:20:\"https://youtube.com/\";s:12:\"updated_date\";s:19:\"2020-03-19 17:12:53\";s:10:\"updated_by\";s:1:\"0\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(87, 32, '2020-03-19 22:18:38', 'Registration', 'Registration', 32, 32, NULL, NULL, 'Create Client 32', 'a:16:{s:3:\"trn\";s:9:\"123456789\";s:12:\"company_name\";s:8:\"dfdsfsdf\";s:11:\"client_name\";s:8:\"sfsdfsdf\";s:12:\"contact_name\";s:8:\"sfsdfsdf\";s:7:\"address\";s:8:\"dsfsdfsf\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:2:\"13\";s:7:\"city_id\";s:1:\"1\";s:9:\"objective\";s:6:\"dfsdfs\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:20:\"https://youtube.com/\";s:11:\"activity_id\";i:3;s:9:\"directory\";s:9:\"123456789\";s:7:\"attempt\";i:1;}'),
(88, 33, '2020-05-05 17:50:06', 'Registration', 'Registration', 33, 33, NULL, NULL, 'Create Client 33', 'a:16:{s:3:\"trn\";s:9:\"987654321\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:7:\"address\";s:6:\"Papine\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"city_id\";s:1:\"1\";s:9:\"objective\";s:20:\"Test the application\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:11:\"activity_id\";i:3;s:9:\"directory\";s:9:\"987654321\";s:7:\"attempt\";i:1;}'),
(89, 23, '2020-05-05 17:59:41', 'Client', 'Update', 33, 33, NULL, NULL, 'Update Client 987654321', 'a:2:{s:3:\"old\";a:5:{i:0;a:25:{s:2:\"id\";s:2:\"32\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:2:\"13\";s:7:\"address\";s:8:\"dsfsdfsf\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:8:\"sfsdfsdf\";s:12:\"company_name\";s:8:\"dfdsfsdf\";s:12:\"contact_name\";s:8:\"sfsdfsdf\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:6:\"dfsdfs\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:20:\"https://youtube.com/\";s:12:\"updated_date\";s:19:\"2020-03-19 17:18:38\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"33\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:20:\"Test the application\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-05 12:50:06\";s:10:\"updated_by\";s:1:\"0\";}i:4;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:6:\"Papine\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:20:\"Test the application\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:9:\"Program 1\";s:3:\"trn\";s:9:\"987654321\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-05 17:59:41\";s:10:\"updated_by\";s:2:\"23\";}}'),
(90, 23, '2020-05-05 18:32:43', 'Consultation', 'Create', 33, 33, 33, NULL, 'Create Consultation 061296', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:1:\"4\";s:9:\"client_id\";s:2:\"33\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:6:\"061296\";s:13:\"date_creation\";s:10:\"2020-05-05\";s:10:\"date_begin\";s:10:\"2020-05-05\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:18:\"Jumpp consultation\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"1\";s:9:\"status_id\";s:2:\"48\";s:10:\"updated_by\";s:2:\"23\";}');
INSERT INTO `log` (`id`, `user_id`, `timestamp`, `module`, `action`, `subject_id`, `client_id`, `consultation_id`, `ta_id`, `remark`, `attributes`) VALUES
(91, 23, '2020-05-12 16:36:00', 'Client', 'Delete', 32, 32, NULL, NULL, 'Delete Client 32', 'a:5:{i:0;a:25:{s:2:\"id\";s:2:\"32\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:2:\"13\";s:7:\"address\";s:8:\"dsfsdfsf\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:8:\"sfsdfsdf\";s:12:\"company_name\";s:8:\"dfdsfsdf\";s:12:\"contact_name\";s:8:\"sfsdfsdf\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:6:\"dfsdfs\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:20:\"https://youtube.com/\";s:12:\"updated_date\";s:19:\"2020-03-19 17:18:38\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"33\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:20:\"Test the application\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-05 17:59:41\";s:10:\"updated_by\";s:2:\"23\";}i:4;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(92, 23, '2020-05-12 16:36:06', 'Client', 'Delete', 33, 33, NULL, NULL, 'Delete Client 33', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"33\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:20:\"Test the application\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-05 17:59:41\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(93, 23, '2020-05-22 16:55:29', 'Client', 'Update', 26, 26, NULL, NULL, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"3\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 16:55:29\";s:10:\"updated_by\";s:2:\"23\";}}'),
(94, 28, '2020-05-22 19:06:09', 'Client', 'Update', 26, 26, NULL, NULL, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 16:55:29\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"3\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:06:09\";s:10:\"updated_by\";s:2:\"28\";}}'),
(95, 28, '2020-05-22 19:13:41', 'Client', 'Update', 26, 26, NULL, NULL, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:06:09\";s:10:\"updated_by\";s:2:\"28\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}}'),
(96, 28, '2020-05-22 19:43:03', 'Client Document', 'Upload', 89, 25, NULL, NULL, 'Upload of document RICHARD_PITTER_RESUME.pdf', 'a:7:{s:9:\"client_id\";s:2:\"25\";s:8:\"doc_size\";d:278.02;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:25:\"RICHARD_PITTER_RESUME.pdf\";s:16:\"document_type_id\";s:1:\"1\";s:17:\"document_class_id\";s:1:\"1\";s:10:\"updated_by\";s:2:\"28\";}'),
(97, 28, '2020-05-29 17:49:58', 'Client', 'Create', 27, 27, NULL, NULL, 'Create Client 123456789', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:6:\"Papine\";s:7:\"city_id\";s:1:\"1\";s:11:\"client_name\";s:14:\"Nicholas Jumpp\";s:12:\"company_name\";s:24:\"University of Technology\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"123456789\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"28\";}'),
(98, 28, '2020-05-29 17:52:21', 'Client', 'Update', 27, 27, NULL, NULL, 'Update Client 123456789', 'a:2:{s:3:\"old\";a:4:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}i:2;a:25:{s:2:\"id\";s:2:\"27\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:14:\"Nicholas Jumpp\";s:12:\"company_name\";s:24:\"University of Technology\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-29 12:49:58\";s:10:\"updated_by\";s:2:\"28\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:6:\"Papine\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:24:\"University of Technology\";s:11:\"client_name\";s:14:\"Nicholas Jumpp\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"123456789\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-29 17:52:21\";s:10:\"updated_by\";s:2:\"28\";}}'),
(99, 28, '2020-06-01 00:24:38', 'Consultation', 'Create', 33, 27, 33, NULL, 'Create Consultation 109', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:1:\"4\";s:9:\"client_id\";s:2:\"27\";s:13:\"consultant_id\";s:4:\"null\";s:15:\"consultation_no\";s:3:\"109\";s:13:\"date_creation\";s:10:\"2020-06-01\";s:10:\"date_begin\";s:10:\"2020-06-01\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:4:\"fdfd\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"5\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"2\";s:11:\"standard_id\";s:1:\"1\";s:9:\"status_id\";s:2:\"50\";s:10:\"updated_by\";s:2:\"28\";}'),
(100, 28, '2020-06-01 13:49:31', 'Client', 'Create', 28, 28, NULL, NULL, 'Create Client 987654321', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:17:\"6 South Camp Road\";s:7:\"city_id\";s:1:\"1\";s:11:\"client_name\";s:16:\"Robert Downey Jr\";s:12:\"company_name\";s:26:\"Sutherland Global Services\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:22:\"rdowney@sutherland.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"987654321\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"28\";}'),
(101, 28, '2020-06-01 13:55:13', 'Client', 'Update', 28, 28, NULL, NULL, 'Update Client 987654321', 'a:2:{s:3:\"old\";a:5:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}i:2;a:25:{s:2:\"id\";s:2:\"28\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:17:\"6 South Camp Road\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:16:\"Robert Downey Jr\";s:12:\"company_name\";s:26:\"Sutherland Global Services\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:22:\"rdowney@sutherland.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-06-01 08:49:31\";s:10:\"updated_by\";s:2:\"28\";}i:3;a:25:{s:2:\"id\";s:2:\"27\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:14:\"Nicholas Jumpp\";s:12:\"company_name\";s:24:\"University of Technology\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-29 17:52:21\";s:10:\"updated_by\";s:2:\"28\";}i:4;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:17:\"6 South Camp Road\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:26:\"Sutherland Global Services\";s:11:\"client_name\";s:16:\"Robert Downey Jr\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:22:\"rdowney@sutherland.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"987654321\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-06-01 13:55:13\";s:10:\"updated_by\";s:2:\"28\";}}'),
(102, 28, '2020-06-01 14:34:37', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document RICHARD_PITTER_RESUME.pdf', 'a:12:{s:2:\"id\";s:2:\"89\";s:9:\"client_id\";s:2:\"25\";s:15:\"consultation_id\";N;s:7:\"post_id\";N;s:16:\"document_type_id\";s:1:\"1\";s:17:\"document_class_id\";s:1:\"1\";s:8:\"doc_name\";s:25:\"RICHARD_PITTER_RESUME.pdf\";s:8:\"doc_size\";s:3:\"278\";s:8:\"doc_type\";s:15:\"application/pdf\";s:12:\"updated_date\";s:19:\"2020-05-22 14:43:03\";s:10:\"updated_by\";s:2:\"28\";s:9:\"directory\";s:6:\"TRN002\";}'),
(103, 28, '2020-06-01 14:34:38', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(104, 28, '2020-06-01 14:34:39', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(105, 28, '2020-06-01 14:34:39', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(106, 28, '2020-06-01 14:34:39', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(107, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(108, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(109, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(110, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(111, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(112, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(113, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(114, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(115, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(116, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(117, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(118, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(119, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(120, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(121, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(122, 28, '2020-06-01 14:34:43', 'Client Document', 'Delete', 89, 25, NULL, NULL, 'Delete of document ', 'N;'),
(123, 23, '2020-07-27 19:24:22', 'Client', 'Delete', 27, 27, NULL, NULL, 'Delete Client 27', 'a:5:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}i:2;a:25:{s:2:\"id\";s:2:\"28\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:17:\"6 South Camp Road\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:16:\"Robert Downey Jr\";s:12:\"company_name\";s:26:\"Sutherland Global Services\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:22:\"rdowney@sutherland.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-06-01 13:55:13\";s:10:\"updated_by\";s:2:\"28\";}i:3;a:25:{s:2:\"id\";s:2:\"27\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:14:\"Nicholas Jumpp\";s:12:\"company_name\";s:24:\"University of Technology\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-29 17:52:21\";s:10:\"updated_by\";s:2:\"28\";}i:4;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(124, 23, '2020-07-27 19:24:40', 'Client', 'Delete', 28, 28, NULL, NULL, 'Delete Client 28', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}i:2;a:25:{s:2:\"id\";s:2:\"28\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:17:\"6 South Camp Road\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:16:\"Robert Downey Jr\";s:12:\"company_name\";s:26:\"Sutherland Global Services\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:22:\"rdowney@sutherland.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-06-01 13:55:13\";s:10:\"updated_by\";s:2:\"28\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(125, 23, '2020-07-27 19:29:56', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Introduction to phase Phase 2', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"13\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 15:07:29\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs Analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"2\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"8\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"24\";s:12:\"updated_date\";s:19:\"2020-07-27 19:29:56\";s:10:\"updated_by\";s:2:\"23\";}}'),
(126, 23, '2020-07-27 19:30:17', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"2\";s:10:\"program_id\";s:1:\"8\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"24\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-07-27 19:29:56\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 2\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 1\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"2\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"8\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"21\";s:12:\"updated_date\";s:19:\"2020-07-27 19:30:17\";s:10:\"updated_by\";s:2:\"23\";}}'),
(127, 23, '2020-07-27 19:30:28', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"2\";s:10:\"program_id\";s:1:\"8\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"21\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-07-27 19:30:17\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 2\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 1\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"2\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"8\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"22\";s:12:\"updated_date\";s:19:\"2020-07-27 19:30:28\";s:10:\"updated_by\";s:2:\"23\";}}'),
(128, 23, '2020-08-03 19:17:05', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Phase 2 to phase Introduction', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"2\";s:10:\"program_id\";s:1:\"8\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"22\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-07-27 19:30:28\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 2\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 1\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"48\";s:12:\"updated_date\";s:19:\"2020-08-03 19:17:05\";s:10:\"updated_by\";s:2:\"23\";}}');
INSERT INTO `log` (`id`, `user_id`, `timestamp`, `module`, `action`, `subject_id`, `client_id`, `consultation_id`, `ta_id`, `remark`, `attributes`) VALUES
(129, 23, '2020-09-24 21:02:38', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"13\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-08-03 19:17:05\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs Analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:4:\"null\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"48\";s:12:\"updated_date\";s:19:\"2020-09-24 21:02:38\";s:10:\"updated_by\";s:2:\"23\";}}'),
(132, 23, '2020-09-25 15:05:06', 'Technical Advice', 'Create', 6, 26, NULL, NULL, 'Create Technical Advice 6', 'a:8:{s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:11:\"[\"30\",\"31\"]\";s:8:\"activity\";s:1:\"1\";s:12:\"date_created\";s:10:\"2020-09-25\";s:10:\"date_begin\";s:10:\"2020-09-28\";s:10:\"date_ended\";s:10:\"2020-09-30\";s:10:\"work_scope\";s:4:\"YES!\";s:10:\"updated_by\";s:2:\"23\";}'),
(133, 23, '2020-09-25 15:11:04', 'Technical Advice', 'Create', 7, 26, NULL, NULL, 'Create Technical Advice 7', 'a:8:{s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:11:\"[\"29\",\"31\"]\";s:8:\"activity\";s:1:\"2\";s:12:\"date_created\";s:10:\"2020-09-25\";s:10:\"date_begin\";s:10:\"2020-10-14\";s:10:\"date_ended\";s:10:\"2020-10-30\";s:10:\"work_scope\";s:0:\"\";s:10:\"updated_by\";s:2:\"23\";}'),
(134, 23, '2020-09-25 16:23:11', 'Consultation', 'Update', 31, 24, 31, NULL, 'Update Consultation CON01', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"31\";s:15:\"consultation_no\";s:5:\"CON01\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"24\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:8:\"phase_id\";s:1:\"1\";s:10:\"program_id\";s:1:\"8\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"11\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 1\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:59\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:3:\"trn\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN001\";s:11:\"parish_name\";s:8:\"Kingston\";s:10:\"phase_name\";s:7:\"Phase 1\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 1\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"24\";s:13:\"consultant_id\";s:11:\"[\"29\",\"30\"]\";s:15:\"consultation_no\";s:5:\"CON01\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 1\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"8\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"11\";s:12:\"updated_date\";s:19:\"2020-09-25 16:23:11\";s:10:\"updated_by\";s:2:\"23\";}}'),
(135, 23, '2020-09-28 12:27:46', 'Technical Advice', 'Create', 8, 24, NULL, NULL, 'Create Technical Advice 8', 'a:8:{s:9:\"client_id\";s:2:\"24\";s:13:\"consultant_id\";s:16:\"[\"29\",\"30\",\"31\"]\";s:8:\"activity\";s:1:\"1\";s:12:\"date_created\";s:10:\"2020-09-28\";s:10:\"date_begin\";s:0:\"\";s:10:\"date_ended\";s:0:\"\";s:10:\"work_scope\";s:0:\"\";s:10:\"updated_by\";s:2:\"23\";}'),
(136, 23, '2020-09-28 14:38:31', 'Client', 'Update', 25, 25, NULL, NULL, 'Update Client TRN002', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"city_id\";s:0:\"\";s:12:\"company_name\";s:17:\"Hotel Association\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"contact_name\";s:6:\"Muriel\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"2\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:6:\"TRN002\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-09-28 14:38:31\";s:10:\"updated_by\";s:2:\"23\";}}'),
(137, 23, '2020-09-28 14:38:43', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:4:\"null\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"13\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-09-24 21:02:38\";s:10:\"updated_by\";s:5:\"admin\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs Analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"48\";s:12:\"updated_date\";s:19:\"2020-09-28 14:38:43\";s:10:\"updated_by\";s:2:\"23\";}}'),
(138, 23, '2020-10-14 14:57:18', 'Technical Advice', 'Create', 9, 25, NULL, NULL, 'Create Technical Advice 9', 'a:8:{s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"activity\";s:1:\"1\";s:12:\"date_created\";s:10:\"2020-10-14\";s:10:\"date_begin\";s:10:\"2020-10-22\";s:10:\"date_ended\";s:10:\"2020-10-31\";s:10:\"work_scope\";s:0:\"\";s:10:\"updated_by\";s:2:\"23\";}'),
(139, 23, '2020-10-26 19:19:03', 'Consultation', 'Create', 33, 26, 33, NULL, 'Create Consultation JEW101', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:15:\"consultation_no\";s:6:\"JEW101\";s:13:\"date_creation\";s:10:\"2020-10-26\";s:10:\"date_begin\";s:10:\"2020-10-26\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:33:\"Company would like a spa standard\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:0:\"\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"6\";s:9:\"status_id\";s:0:\"\";s:10:\"updated_by\";s:2:\"23\";}'),
(140, 23, '2020-10-26 19:19:37', 'Consultation', 'Update', 33, 26, 33, NULL, 'Update Consultation JEW101 and Move from phase  to phase Phase 1', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"33\";s:15:\"consultation_no\";s:6:\"JEW101\";s:9:\"clause_id\";s:1:\"0\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:8:\"phase_id\";s:1:\"0\";s:10:\"program_id\";s:1:\"0\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"6\";s:9:\"status_id\";s:1:\"0\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-10-26\";s:13:\"date_creation\";s:10:\"2020-10-26\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:33:\"Company would like a spa standard\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-10-26 14:19:03\";s:10:\"updated_by\";s:11:\"Coordinator\";s:7:\"address\";s:13:\"67 Home Drive\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:13:\"director_name\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:5:\"phone\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:11:\"parish_name\";s:7:\"Hanover\";s:10:\"phase_name\";N;s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";N;}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:15:\"consultation_no\";s:6:\"JEW101\";s:10:\"date_begin\";s:10:\"2020-10-26\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:33:\"Company would like a spa standard\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"9\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"6\";s:9:\"status_id\";s:2:\"14\";s:12:\"updated_date\";s:19:\"2020-10-26 19:19:37\";s:10:\"updated_by\";s:2:\"23\";}}'),
(141, 23, '2020-10-28 21:17:47', 'Consultation', 'Create', 34, 26, 34, NULL, 'Create Consultation ss3', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:3:\"ss3\";s:13:\"date_creation\";s:10:\"2020-10-28\";s:10:\"date_begin\";s:10:\"2020-10-28\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:2:\"ss\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:0:\"\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:0:\"\";s:11:\"standard_id\";s:0:\"\";s:9:\"status_id\";s:0:\"\";s:10:\"updated_by\";s:2:\"23\";}'),
(142, 23, '2020-10-28 21:35:28', 'Consultation', 'Create', 35, 26, 35, NULL, 'Create Consultation dsgfsdfsdf', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:10:\"dsgfsdfsdf\";s:13:\"date_creation\";s:10:\"2020-10-28\";s:10:\"date_begin\";s:10:\"2020-10-28\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:10:\"sfsdfsdfsd\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:0:\"\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:0:\"\";s:11:\"standard_id\";s:0:\"\";s:9:\"status_id\";s:0:\"\";s:10:\"updated_by\";s:2:\"23\";}'),
(143, 23, '2020-10-28 21:36:22', 'Consultation', 'Create', 36, 26, 36, NULL, 'Create Consultation fftgdfsdf', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:15:\"consultation_no\";s:9:\"fftgdfsdf\";s:13:\"date_creation\";s:10:\"2020-10-28\";s:10:\"date_begin\";s:10:\"2020-10-28\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:8:\"sdfsdfsf\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"2\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:10:\"updated_by\";s:2:\"23\";}'),
(144, 23, '2020-10-29 16:35:42', 'Consultation', 'Update', 36, 26, 36, NULL, 'Update Consultation fftgdfsdf and Move from phase Introduction to phase Analysis', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"36\";s:15:\"consultation_no\";s:9:\"fftgdfsdf\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"13\";s:9:\"sector_id\";s:1:\"2\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-10-28\";s:13:\"date_creation\";s:10:\"2020-10-28\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:8:\"sdfsdfsf\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-10-28 16:36:22\";s:10:\"updated_by\";s:11:\"Coordinator\";s:7:\"address\";s:13:\"67 Home Drive\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:13:\"director_name\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:5:\"phone\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:11:\"parish_name\";s:7:\"Hanover\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs Analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:15:\"consultation_no\";s:9:\"fftgdfsdf\";s:10:\"date_begin\";s:10:\"2020-10-28\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:8:\"sdfsdfsf\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"5\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"2\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-10-29 16:35:42\";s:10:\"updated_by\";s:2:\"23\";}}'),
(145, 23, '2020-10-29 16:35:54', 'Consultation', 'Update', 36, 26, 36, NULL, 'Update Consultation fftgdfsdf and Move from phase Analysis to phase Phase 1', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"36\";s:15:\"consultation_no\";s:9:\"fftgdfsdf\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:8:\"phase_id\";s:1:\"5\";s:10:\"program_id\";s:2:\"13\";s:9:\"sector_id\";s:1:\"2\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:1:\"0\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-10-28\";s:13:\"date_creation\";s:10:\"2020-10-28\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:8:\"sdfsdfsf\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-10-29 16:35:42\";s:10:\"updated_by\";s:11:\"Coordinator\";s:7:\"address\";s:13:\"67 Home Drive\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:13:\"director_name\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:5:\"phone\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:11:\"parish_name\";s:7:\"Hanover\";s:10:\"phase_name\";s:8:\"Analysis\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs Analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:15:\"consultation_no\";s:9:\"fftgdfsdf\";s:10:\"date_begin\";s:10:\"2020-10-28\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:8:\"sdfsdfsf\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"8\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"2\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-10-29 16:35:54\";s:10:\"updated_by\";s:2:\"23\";}}'),
(146, 23, '2020-11-02 17:49:12', 'Consultation', 'Create', 37, 26, 37, NULL, 'Create Consultation ggg', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:15:\"consultation_no\";s:3:\"ggg\";s:13:\"date_creation\";s:10:\"2020-11-02\";s:10:\"date_begin\";s:10:\"2020-11-02\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:5:\"ggggg\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:10:\"updated_by\";s:2:\"23\";}'),
(147, 23, '2020-11-02 17:49:44', 'Consultation', 'Delete', 37, 26, 37, NULL, 'Delete Consulation ggg', 'a:39:{s:2:\"id\";s:2:\"37\";s:15:\"consultation_no\";s:3:\"ggg\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"26\";s:13:\"consultant_id\";s:4:\"null\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"13\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-11-02\";s:13:\"date_creation\";s:10:\"2020-11-02\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:5:\"ggggg\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-02 12:49:12\";s:10:\"updated_by\";s:11:\"Coordinator\";s:7:\"address\";s:13:\"67 Home Drive\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:13:\"director_name\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:5:\"phone\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:11:\"parish_name\";s:7:\"Hanover\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs Analysis\";}'),
(148, 23, '2020-11-03 19:05:46', 'Client', 'Create', 27, 27, NULL, NULL, 'Create Client 987654321', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:7:\"dfdfdfd\";s:7:\"city_id\";s:1:\"1\";s:11:\"client_name\";s:8:\"dfdfdfdf\";s:12:\"company_name\";s:6:\"dfdfdf\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"2\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"987654321\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"23\";}'),
(149, 23, '2020-11-03 19:06:05', 'Client', 'Update', 27, 27, NULL, NULL, 'Update Client 987654321', 'a:2:{s:3:\"old\";a:4:{i:0;a:25:{s:2:\"id\";s:2:\"27\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:7:\"dfdfdfd\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"dfdfdfdf\";s:12:\"company_name\";s:6:\"dfdfdf\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-03 14:05:46\";s:10:\"updated_by\";s:2:\"23\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-09-28 14:38:31\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:7:\"dfdfdfd\";s:7:\"city_id\";s:0:\"\";s:12:\"company_name\";s:6:\"dfdfdf\";s:11:\"client_name\";s:8:\"dfdfdfdf\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"2\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"987654321\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-03 19:06:05\";s:10:\"updated_by\";s:2:\"23\";}}'),
(150, 23, '2020-11-03 19:06:18', 'Client', 'Delete', 27, 27, NULL, NULL, 'Delete Client 27', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"27\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:7:\"dfdfdfd\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"dfdfdfdf\";s:12:\"company_name\";s:6:\"dfdfdf\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-03 19:06:05\";s:10:\"updated_by\";s:2:\"23\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-09-28 14:38:31\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(151, 23, '2020-11-03 19:06:44', 'Client', 'Create', 28, 28, NULL, NULL, 'Create Client 123456789', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:5:\"dfdfd\";s:7:\"city_id\";s:0:\"\";s:11:\"client_name\";s:6:\"dfdfdf\";s:12:\"company_name\";s:4:\"fdfd\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"123456789\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"23\";}'),
(152, 23, '2020-11-04 14:19:09', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Introduction to phase Phase 1', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"13\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-09-28 14:38:43\";s:10:\"updated_by\";s:5:\"admin\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs Analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"14\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"11\";s:12:\"updated_date\";s:19:\"2020-11-04 14:19:09\";s:10:\"updated_by\";s:2:\"23\";}}'),
(153, 23, '2020-11-04 14:32:41', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Phase 1 to phase Phase 2', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:8:\"phase_id\";s:1:\"1\";s:10:\"program_id\";s:2:\"14\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"11\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-04 14:19:09\";s:10:\"updated_by\";s:5:\"admin\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 1\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:12:\"spa standard\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"2\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"14\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"21\";s:12:\"updated_date\";s:19:\"2020-11-04 14:32:41\";s:10:\"updated_by\";s:2:\"23\";}}'),
(154, 23, '2020-11-04 16:26:55', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Phase 2 to phase Phase 3', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:8:\"phase_id\";s:1:\"2\";s:10:\"program_id\";s:2:\"14\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"21\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-04 14:32:41\";s:10:\"updated_by\";s:5:\"admin\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 2\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:12:\"spa standard\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"3\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"14\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"21\";s:12:\"updated_date\";s:19:\"2020-11-04 16:26:55\";s:10:\"updated_by\";s:2:\"23\";}}'),
(155, 23, '2020-11-04 16:27:07', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Phase 3 to phase Phase 1', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:8:\"phase_id\";s:1:\"3\";s:10:\"program_id\";s:2:\"14\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"21\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-04 16:26:55\";s:10:\"updated_by\";s:5:\"admin\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 3\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:12:\"spa standard\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"14\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"31\";s:12:\"updated_date\";s:19:\"2020-11-04 16:27:07\";s:10:\"updated_by\";s:2:\"23\";}}'),
(156, 23, '2020-11-05 18:53:11', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Phase 1 to phase Phase 2', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:8:\"phase_id\";s:1:\"1\";s:10:\"program_id\";s:2:\"14\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"31\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-04 16:27:07\";s:10:\"updated_by\";s:5:\"admin\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 1\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:12:\"spa standard\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"2\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"14\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"21\";s:12:\"updated_date\";s:19:\"2020-11-05 18:53:11\";s:10:\"updated_by\";s:2:\"23\";}}'),
(157, 23, '2020-11-06 14:08:29', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Phase 2 to phase Phase 1', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:8:\"phase_id\";s:1:\"2\";s:10:\"program_id\";s:2:\"14\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"21\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-05 18:53:11\";s:10:\"updated_by\";s:5:\"admin\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 2\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:12:\"spa standard\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"14\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"11\";s:12:\"updated_date\";s:19:\"2020-11-06 14:08:29\";s:10:\"updated_by\";s:2:\"23\";}}'),
(158, 23, '2020-11-06 14:28:28', 'Consultation', 'Update', 32, 25, 32, NULL, 'Update Consultation CON02 and Move from phase Phase 1 to phase Phase 2', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:8:\"phase_id\";s:1:\"1\";s:10:\"program_id\";s:2:\"14\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"11\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-11-06 14:08:29\";s:10:\"updated_by\";s:5:\"admin\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 1\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:12:\"spa standard\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"2\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"14\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"21\";s:12:\"updated_date\";s:19:\"2020-11-06 14:28:28\";s:10:\"updated_by\";s:2:\"23\";}}');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `parish`
--

DROP TABLE IF EXISTS `parish`;
CREATE TABLE IF NOT EXISTS `parish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parish`
--

INSERT INTO `parish` (`id`, `code`, `name`, `active`) VALUES
(1, 1371, 'Hanover', 1),
(2, 1370, 'Clarendon', 1),
(3, 1372, 'Manchester', 1),
(4, 1373, 'Saint Elizabeth', 1),
(5, 1374, 'Saint James', 1),
(6, 1375, 'Trelawny', 1),
(7, 1376, 'Westmoreland', 1),
(8, 1377, 'Kingston', 1),
(9, 1378, 'Portland', 1),
(10, 1379, 'Saint Ann', 1),
(11, 1380, 'Saint Catherine', 1),
(12, 1381, 'Saint Mary', 1),
(13, 1382, 'Saint Andrew', 1),
(14, 1383, 'Saint Thomas', 1);

-- --------------------------------------------------------

--
-- Table structure for table `phase`
--

DROP TABLE IF EXISTS `phase`;
CREATE TABLE IF NOT EXISTS `phase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `icon_type` varchar(30) DEFAULT NULL,
  `remark` text,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `phase`
--

INSERT INTO `phase` (`id`, `code`, `name`, `icon`, `icon_type`, `remark`, `active`, `updated_date`, `updated_by`) VALUES
(1, '1', 'Phase 1', 'icons8-beach-50.png', '', '', 1, '2020-02-25 00:40:21', 18),
(2, '2', 'Phase 2', 'icons8-hotel-room-key-50.png', 'image/png', '', 1, '2020-02-21 01:43:21', 18),
(3, '3', 'Phase 3', 'icons8-check-all-50.png', '', '', 1, '2020-02-21 01:34:53', 18),
(4, '4', 'Phase 4', 'icons8-cafe-502.png', 'image/png', '<p>aaaa</p>', 1, '2020-02-21 01:40:31', 18),
(5, 'ANALYSIS', 'Analysis', 'about.png', '', '<p>Analysis of the situation</p>', 1, '2020-02-25 00:41:45', 18),
(6, 'INTRO', 'Introduction', 'arrow_down_16.png', 'image/png', '<p>Introduction of the problem</p>', 1, '2020-02-25 00:41:16', 18),
(7, 'END', 'End', 'bag2_32.png', 'image/png', '<p>Deliver the solution</p>', 1, '2020-02-24 19:42:20', 18);

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `date_from` date DEFAULT NULL,
  `date_to` date DEFAULT NULL,
  `doc_type` varchar(30) NOT NULL,
  `post_title` varchar(255) NOT NULL,
  `post_slug` varchar(255) NOT NULL,
  `post_text` text NOT NULL,
  `post_image` varchar(255) NOT NULL,
  `posted_by` varchar(100) NOT NULL,
  `client_visibility` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=visible 2=non visible',
  `active` tinyint(1) NOT NULL COMMENT '1=active 2=inactive',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `category_id`, `date_from`, `date_to`, `doc_type`, `post_title`, `post_slug`, `post_text`, `post_image`, `posted_by`, `client_visibility`, `active`, `updated_date`, `updated_by`) VALUES
(1, 1, '2019-09-30', '2020-03-28', 'image/jpeg', 'Welcome to new clients!', 'Welcome-to-new-clients', '<p>Welcome to the database for clients.</p>', 'logo.jpg', 'Carmen Gagnon', 1, 1, '2019-09-30 13:39:40', 18),
(4, 1, '2019-11-28', '2020-01-17', 'application/vnd.openxmlformats', 'Message for new members', 'Message-for-new-members', '<p>Here is the message</p>', 'Client_Servicing_Programme_-_WBS_Dictionary.docx', 'Carmen Gagnon', 1, 1, '2019-11-28 19:13:15', 18),
(6, 1, '2019-12-02', '2019-12-27', 'image/gif', 'Visit in BSJ', 'Visit-in-BSJ', '<p>Free zone to write the post.</p>', 'vacance-gif-042.gif', 'Carmen Gagnon', 2, 1, '2019-12-02 20:37:26', 18),
(7, 1, '2020-02-20', '2020-02-20', 'image/png', 'Here is the icon test', 'Here-is-the-icon-test', '<p>Bla bla <strong>bla&nbsp;</strong></p>\r\n\r\n<p><strong>Here is my style</strong></p>\r\n\r\n<hr />\r\n<p>This is my <span class=\"marker\">post</span></p>', 'icons8-around-the-globe-50.png', 'Carmen Gagnon', 1, 1, '2020-02-23 00:00:27', 18);

-- --------------------------------------------------------

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `permission` text NOT NULL,
  `protected` tinyint(4) DEFAULT NULL COMMENT '1=Protected ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `profile`
--

INSERT INTO `profile` (`id`, `name`, `permission`, `protected`) VALUES
(1, 'Super Admin', 'a:36:{i:0;s:10:\"createUser\";i:1;s:10:\"updateUser\";i:2;s:8:\"viewUser\";i:3;s:10:\"deleteUser\";i:4;s:11:\"createGroup\";i:5;s:11:\"updateGroup\";i:6;s:9:\"viewGroup\";i:7;s:11:\"deleteGroup\";i:8;s:11:\"createBrand\";i:9;s:11:\"updateBrand\";i:10;s:9:\"viewBrand\";i:11;s:11:\"deleteBrand\";i:12;s:14:\"createCategory\";i:13;s:14:\"updateCategory\";i:14;s:12:\"viewCategory\";i:15;s:14:\"deleteCategory\";i:16;s:11:\"createStore\";i:17;s:11:\"updateStore\";i:18;s:9:\"viewStore\";i:19;s:11:\"deleteStore\";i:20;s:15:\"createAttribute\";i:21;s:15:\"updateAttribute\";i:22;s:13:\"viewAttribute\";i:23;s:15:\"deleteAttribute\";i:24;s:13:\"createProduct\";i:25;s:13:\"updateProduct\";i:26;s:11:\"viewProduct\";i:27;s:13:\"deleteProduct\";i:28;s:11:\"createOrder\";i:29;s:11:\"updateOrder\";i:30;s:9:\"viewOrder\";i:31;s:11:\"deleteOrder\";i:32;s:11:\"viewReports\";i:33;s:13:\"updateCompany\";i:34;s:11:\"viewProfile\";i:35;s:13:\"updateSetting\";}', 1),
(2, 'Coordinator', 'a:87:{i:0;s:12:\"createClient\";i:1;s:12:\"updateClient\";i:2;s:10:\"viewClient\";i:3;s:12:\"deleteClient\";i:4;s:18:\"createConsultation\";i:5;s:18:\"updateConsultation\";i:6;s:16:\"viewConsultation\";i:7;s:18:\"deleteConsultation\";i:8;s:11:\"createPhase\";i:9;s:11:\"updatePhase\";i:10;s:9:\"viewPhase\";i:11;s:11:\"deletePhase\";i:12;s:12:\"createStatus\";i:13;s:12:\"updateStatus\";i:14;s:10:\"viewStatus\";i:15;s:12:\"deleteStatus\";i:16;s:12:\"createSector\";i:17;s:12:\"updateSector\";i:18;s:10:\"viewSector\";i:19;s:12:\"deleteSector\";i:20;s:14:\"createDocument\";i:21;s:14:\"updateDocument\";i:22;s:12:\"viewDocument\";i:23;s:14:\"deleteDocument\";i:24;s:18:\"createDocumentType\";i:25;s:18:\"updateDocumentType\";i:26;s:16:\"viewDocumentType\";i:27;s:18:\"deleteDocumentType\";i:28;s:14:\"createStandard\";i:29;s:14:\"updateStandard\";i:30;s:12:\"viewStandard\";i:31;s:14:\"deleteStandard\";i:32;s:12:\"createClause\";i:33;s:12:\"updateClause\";i:34;s:10:\"viewClause\";i:35;s:12:\"deleteClause\";i:36;s:15:\"createSubClause\";i:37;s:15:\"updateSubClause\";i:38;s:13:\"viewSubClause\";i:39;s:15:\"deleteSubClause\";i:40;s:14:\"createQuestion\";i:41;s:14:\"updateQuestion\";i:42;s:12:\"viewQuestion\";i:43;s:14:\"deleteQuestion\";i:44;s:12:\"createManual\";i:45;s:12:\"updateManual\";i:46;s:10:\"viewManual\";i:47;s:12:\"deleteManual\";i:48;s:12:\"createCounty\";i:49;s:12:\"updateCounty\";i:50;s:10:\"viewCounty\";i:51;s:12:\"deleteCounty\";i:52;s:12:\"createParish\";i:53;s:12:\"updateParish\";i:54;s:10:\"viewParish\";i:55;s:12:\"deleteParish\";i:56;s:10:\"createCity\";i:57;s:10:\"updateCity\";i:58;s:8:\"viewCity\";i:59;s:10:\"deleteCity\";i:60;s:10:\"createPost\";i:61;s:10:\"updatePost\";i:62;s:8:\"viewPost\";i:63;s:10:\"deletePost\";i:64;s:14:\"createCategory\";i:65;s:14:\"updateCategory\";i:66;s:12:\"viewCategory\";i:67;s:14:\"deleteCategory\";i:68;s:13:\"createInquiry\";i:69;s:13:\"updateInquiry\";i:70;s:11:\"viewInquiry\";i:71;s:13:\"deleteInquiry\";i:72;s:17:\"createInquiryType\";i:73;s:17:\"updateInquiryType\";i:74;s:15:\"viewInquiryType\";i:75;s:17:\"deleteInquiryType\";i:76;s:17:\"createSupportType\";i:77;s:17:\"updateSupportType\";i:78;s:15:\"viewSupportType\";i:79;s:17:\"deleteSupportType\";i:80;s:13:\"viewDashboard\";i:81;s:8:\"viewNews\";i:82;s:10:\"viewReport\";i:83;s:17:\"viewDocumentation\";i:84;s:10:\"viewMyUser\";i:85;s:20:\"viewSearchConsultant\";i:86;s:13:\"updateSetting\";}', 1),
(3, 'Consultant', 'a:13:{i:0;s:10:\"viewClient\";i:1;s:16:\"viewConsultation\";i:2;s:12:\"viewDocument\";i:3;s:8:\"viewPost\";i:4;s:13:\"createInquiry\";i:5;s:13:\"updateInquiry\";i:6;s:11:\"viewInquiry\";i:7;s:13:\"deleteInquiry\";i:8;s:13:\"viewDashboard\";i:9;s:8:\"viewNews\";i:10;s:10:\"viewReport\";i:11;s:17:\"viewDocumentation\";i:12;s:10:\"viewMyUser\";}', 1),
(4, 'Client', 'a:10:{i:0;s:12:\"updateClient\";i:1;s:10:\"viewClient\";i:2;s:16:\"viewConsultation\";i:3;s:13:\"updateAnswers\";i:4;s:10:\"viewManual\";i:5;s:8:\"viewPost\";i:6;s:13:\"viewDashboard\";i:7;s:8:\"viewNews\";i:8;s:10:\"viewMyUser\";i:9;s:13:\"updateSetting\";}', 1),
(5, 'Admin', 'a:140:{i:0;s:12:\"createClient\";i:1;s:12:\"updateClient\";i:2;s:10:\"viewClient\";i:3;s:12:\"deleteClient\";i:4;s:19:\"createPendingClient\";i:5;s:19:\"updatePendingClient\";i:6;s:17:\"viewPendingClient\";i:7;s:19:\"deletePendingClient\";i:8;s:14:\"createActivity\";i:9;s:14:\"updateActivity\";i:10;s:12:\"viewActivity\";i:11;s:14:\"deleteActivity\";i:12;s:17:\"createRequirement\";i:13;s:17:\"updateRequirement\";i:14;s:15:\"viewRequirement\";i:15;s:17:\"deleteRequirement\";i:16;s:18:\"createConsultation\";i:17;s:18:\"updateConsultation\";i:18;s:16:\"viewConsultation\";i:19;s:18:\"deleteConsultation\";i:20;s:13:\"createProgram\";i:21;s:13:\"updateProgram\";i:22;s:11:\"viewProgram\";i:23;s:13:\"deleteProgram\";i:24;s:11:\"createPhase\";i:25;s:11:\"updatePhase\";i:26;s:9:\"viewPhase\";i:27;s:11:\"deletePhase\";i:28;s:12:\"createStatus\";i:29;s:12:\"updateStatus\";i:30;s:10:\"viewStatus\";i:31;s:12:\"deleteStatus\";i:32;s:12:\"createSector\";i:33;s:12:\"updateSector\";i:34;s:10:\"viewSector\";i:35;s:12:\"deleteSector\";i:36;s:21:\"createTechnicalAdvice\";i:37;s:21:\"updateTechnicalAdvice\";i:38;s:19:\"viewTechnicalAdvice\";i:39;s:21:\"deleteTechnicalAdvice\";i:40;s:21:\"createNeedsAssessment\";i:41;s:21:\"updateNeedsAssessment\";i:42;s:19:\"viewNeedsAssessment\";i:43;s:21:\"deleteNeedsAssessment\";i:44;s:14:\"createWorkPlan\";i:45;s:14:\"updateWorkPlan\";i:46;s:12:\"viewWorkPlan\";i:47;s:14:\"deleteWorkPlan\";i:48;s:22:\"createInternalCostPlan\";i:49;s:22:\"updateInternalCostPlan\";i:50;s:20:\"viewInternalCostPlan\";i:51;s:22:\"deleteInternalCostPlan\";i:52;s:13:\"createBilling\";i:53;s:13:\"updateBilling\";i:54;s:11:\"viewBilling\";i:55;s:13:\"deleteBilling\";i:56;s:14:\"createStandard\";i:57;s:14:\"updateStandard\";i:58;s:12:\"viewStandard\";i:59;s:14:\"deleteStandard\";i:60;s:12:\"createClause\";i:61;s:12:\"updateClause\";i:62;s:10:\"viewClause\";i:63;s:12:\"deleteClause\";i:64;s:15:\"createSubClause\";i:65;s:15:\"updateSubClause\";i:66;s:13:\"viewSubClause\";i:67;s:15:\"deleteSubClause\";i:68;s:14:\"createQuestion\";i:69;s:14:\"updateQuestion\";i:70;s:12:\"viewQuestion\";i:71;s:14:\"deleteQuestion\";i:72;s:13:\"createAnswers\";i:73;s:13:\"updateAnswers\";i:74;s:11:\"viewAnswers\";i:75;s:13:\"deleteAnswers\";i:76;s:12:\"createManual\";i:77;s:12:\"updateManual\";i:78;s:10:\"viewManual\";i:79;s:12:\"deleteManual\";i:80;s:14:\"createDocument\";i:81;s:14:\"updateDocument\";i:82;s:12:\"viewDocument\";i:83;s:14:\"deleteDocument\";i:84;s:18:\"createDocumentType\";i:85;s:18:\"updateDocumentType\";i:86;s:16:\"viewDocumentType\";i:87;s:18:\"deleteDocumentType\";i:88;s:19:\"createDocumentClass\";i:89;s:19:\"updateDocumentClass\";i:90;s:17:\"viewDocumentClass\";i:91;s:19:\"deleteDocumentClass\";i:92;s:12:\"createCounty\";i:93;s:12:\"updateCounty\";i:94;s:10:\"viewCounty\";i:95;s:12:\"deleteCounty\";i:96;s:12:\"createParish\";i:97;s:12:\"updateParish\";i:98;s:10:\"viewParish\";i:99;s:12:\"deleteParish\";i:100;s:10:\"createCity\";i:101;s:10:\"updateCity\";i:102;s:8:\"viewCity\";i:103;s:10:\"deleteCity\";i:104;s:13:\"createInquiry\";i:105;s:13:\"updateInquiry\";i:106;s:11:\"viewInquiry\";i:107;s:13:\"deleteInquiry\";i:108;s:17:\"createInquiryType\";i:109;s:17:\"updateInquiryType\";i:110;s:15:\"viewInquiryType\";i:111;s:17:\"deleteInquiryType\";i:112;s:17:\"createSupportType\";i:113;s:17:\"updateSupportType\";i:114;s:15:\"viewSupportType\";i:115;s:17:\"deleteSupportType\";i:116;s:10:\"createPost\";i:117;s:10:\"updatePost\";i:118;s:8:\"viewPost\";i:119;s:10:\"deletePost\";i:120;s:14:\"createCategory\";i:121;s:14:\"updateCategory\";i:122;s:12:\"viewCategory\";i:123;s:14:\"deleteCategory\";i:124;s:13:\"viewDashboard\";i:125;s:8:\"viewNews\";i:126;s:10:\"viewReport\";i:127;s:17:\"viewDocumentation\";i:128;s:10:\"viewMyUser\";i:129;s:20:\"viewSearchConsultant\";i:130;s:10:\"createUser\";i:131;s:10:\"updateUser\";i:132;s:8:\"viewUser\";i:133;s:10:\"deleteUser\";i:134;s:13:\"createProfile\";i:135;s:13:\"updateProfile\";i:136;s:11:\"viewProfile\";i:137;s:13:\"deleteProfile\";i:138;s:12:\"updateSystem\";i:139;s:13:\"updateSetting\";}', 1),
(6, 'Reader', 'a:9:{i:0;s:10:\"viewClient\";i:1;s:17:\"viewPendingClient\";i:2;s:16:\"viewConsultation\";i:3;s:8:\"viewPost\";i:4;s:13:\"viewDashboard\";i:5;s:8:\"viewNews\";i:6;s:10:\"viewReport\";i:7;s:17:\"viewDocumentation\";i:8;s:10:\"viewMyUser\";}', 1),
(7, 'Customer Service', 'a:5:{i:0;s:12:\"createClient\";i:1;s:10:\"viewClient\";i:2;s:19:\"createPendingClient\";i:3;s:8:\"viewNews\";i:4;s:10:\"viewMyUser\";}', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `program`
--

DROP TABLE IF EXISTS `program`;
CREATE TABLE IF NOT EXISTS `program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) NOT NULL,
  `clause_id` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `remark` text,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id`, `standard_id`, `clause_id`, `code`, `name`, `remark`, `active`, `updated_date`, `updated_by`) VALUES
(8, 2, 11, 'P1', 'Program 1', '', 1, '2020-02-27 18:54:43', 18),
(9, 1, 10, 'P2', 'Program 2', '', 1, '2020-02-25 00:39:12', 18),
(13, 5, 13, 'Program 3', 'Needs Analysis', '', 1, '2020-02-27 19:03:02', 18),
(14, 6, 0, 'spa', 'spa standard', '', 1, '2020-11-03 19:58:36', 23);

-- --------------------------------------------------------

--
-- Table structure for table `program_phase`
--

DROP TABLE IF EXISTS `program_phase`;
CREATE TABLE IF NOT EXISTS `program_phase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `program_id` int(11) NOT NULL,
  `phase_id` int(11) NOT NULL,
  `sequence` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `program_id` (`program_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program_phase`
--

INSERT INTO `program_phase` (`id`, `program_id`, `phase_id`, `sequence`) VALUES
(52, 9, 1, 1),
(53, 9, 2, 2),
(77, 8, 1, 1),
(78, 8, 2, 2),
(79, 8, 3, 3),
(80, 8, 4, 4),
(84, 13, 6, 1),
(85, 13, 5, 2),
(86, 13, 7, 3),
(87, 14, 1, 0),
(88, 14, 2, 0),
(89, 14, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `question_type_id` int(11) NOT NULL,
  `remark` text,
  `active` int(11) NOT NULL COMMENT '1=active 2=inactive',
  `upload_document` int(11) NOT NULL COMMENT '1=yes 2=no',
  `program_id` int(11) NOT NULL,
  `phase_id` int(11) NOT NULL,
  `standard_id` int(11) NOT NULL,
  `clause_id` int(11) DEFAULT NULL,
  `sub_clause_id` int(11) DEFAULT NULL,
  `upload_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_type_id` (`question_type_id`),
  KEY `active` (`active`),
  KEY `program_id` (`program_id`),
  KEY `phase_id` (`phase_id`),
  KEY `standard_id` (`standard_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `question`, `question_type_id`, `remark`, `active`, `upload_document`, `program_id`, `phase_id`, `standard_id`, `clause_id`, `sub_clause_id`, `upload_date`, `updated_by`) VALUES
(14, 'What is your primary customers/ target markets for your services?', 2, '', 1, 1, 14, 1, 6, 0, 0, '2020-11-04 15:47:44', 23),
(15, 'How long has your company been in operation?', 1, '', 1, 2, 14, 1, 6, 0, 0, '2020-11-04 15:48:32', 23),
(17, 'State other agencies with whom your company is registered.', 1, '', 1, 2, 14, 1, 6, 0, 0, '2020-11-04 16:05:04', 23),
(18, 'State the number of employees in the company', 1, '', 1, 2, 14, 1, 6, 0, 0, '2020-11-04 16:06:36', 23),
(19, 'State the size of the establishment facility (m^2)', 1, '', 1, 2, 14, 1, 6, 0, 0, '2020-11-04 16:07:08', 23),
(20, 'State total investment in equipment used.', 1, '', 1, 2, 14, 1, 6, 0, 0, '2020-11-04 16:07:50', 23),
(21, 'Are your operations guided by any of the following?', 6, '', 1, 2, 14, 1, 6, 0, 0, '2020-11-04 16:08:49', 23),
(23, 'Do you have a quality manual/ policy manual?', 4, '', 1, 2, 14, 1, 6, 0, 0, '2020-11-04 16:10:47', 23),
(25, 'What are your services offered or where can this information be found?', 1, '', 1, 2, 14, 1, 6, 0, 0, '2020-11-04 16:12:50', 23),
(27, 'Has management defined the scope of services provided?', 4, '', 1, 2, 14, 1, 6, 0, 0, '2020-11-04 16:16:47', 23),
(28, 'What is the status of value chain services with respect to business processes?', 1, '', 1, 1, 14, 2, 6, 0, 0, '2020-11-04 16:25:18', 23),
(29, 'What are the results of the internal audit?', 1, '', 1, 2, 14, 3, 6, 0, 0, '2020-11-04 16:25:50', 23),
(30, 'This is a test for the drop down list', 5, '', 1, 2, 14, 2, 6, 0, 0, '2020-11-05 18:53:01', 23);

-- --------------------------------------------------------

--
-- Table structure for table `question_option`
--

DROP TABLE IF EXISTS `question_option`;
CREATE TABLE IF NOT EXISTS `question_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `ques_option` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question_option`
--

INSERT INTO `question_option` (`id`, `question_id`, `ques_option`) VALUES
(14, 27, 'Yes'),
(15, 27, 'No'),
(25, 23, 'YAAAAAAAAAAS'),
(26, 23, 'Maybe'),
(30, 30, 'Yes'),
(31, 30, 'No'),
(32, 30, 'Maybe'),
(33, 30, 'LOOOL you thought');

-- --------------------------------------------------------

--
-- Table structure for table `question_type`
--

DROP TABLE IF EXISTS `question_type`;
CREATE TABLE IF NOT EXISTS `question_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question_type`
--

INSERT INTO `question_type` (`id`, `code`, `name`, `active`) VALUES
(1, 'TEXT', 'Text', 1),
(2, 'TEXTAREA', 'Textarea', 1),
(3, 'BOOLEAN', 'Boolean', 1),
(4, 'RADIO', 'Radio buttons', 1),
(5, 'LIST', 'Drop/Down list', 1),
(6, 'CHECKBOX', 'Checkbox', 1),
(7, 'UPLOAD', 'Upload of documents', 1);

-- --------------------------------------------------------

--
-- Table structure for table `registration_customization`
--

DROP TABLE IF EXISTS `registration_customization`;
CREATE TABLE IF NOT EXISTS `registration_customization` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `body` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration_customization`
--

INSERT INTO `registration_customization` (`id`, `title`, `body`) VALUES
(1, 'Thank you for your interest!', 'You will be contacted via phone/ email by one of our representatives within 3-10 business days.');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
CREATE TABLE IF NOT EXISTS `report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `report_code` char(5) NOT NULL,
  `report_desc` varchar(200) DEFAULT NULL,
  `report_form` varchar(100) NOT NULL,
  `report_title` varchar(100) NOT NULL,
  `report_selection` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Yes 2-=No',
  PRIMARY KEY (`id`),
  UNIQUE KEY `report_code` (`report_code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`id`, `report_code`, `report_desc`, `report_form`, `report_title`, `report_selection`) VALUES
(1, 'REP01', 'List of Clients', '/application/controllers/Report01.php', 'List of Clients', 1),
(2, 'REP02', 'List of Consultations', '/application/controllers/Report02.php', 'List of Consultations', 1),
(4, 'REP04', 'Inquiries', '/application/controllers/Report04.php', 'Inquiries', 1),
(5, 'REP05', 'List of Consultations by County', 'application/controllers/Report05.php', 'List of Consultations  by County', 1),
(6, 'REP06', 'List of Settings', '/application/controllers/Report06.php', 'List of Settings', 2),
(7, 'REP0C', 'Client', '/appliation/controllers/Report_client.php', 'Client', 2),
(8, 'REP0I', 'Consultation', '/appliation/controllers/Report_consultation.php', 'Consultation', 2),
(9, 'REP08', 'List of Clauses', '/application/controllers/Report08.php', 'List of Clauses', 2),
(10, 'REP07', 'List of sub-clauses', '/application/controllers/Report07.php', 'List of Sub-Clauses', 2),
(11, 'QPM01', 'Quality & Procedures Manual for ISO 9001', '/application/controllers/QPM01.php', 'Quality & Procedures Manual for ISO 9001', 2);

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

DROP TABLE IF EXISTS `requirement`;
CREATE TABLE IF NOT EXISTS `requirement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` varchar(300) NOT NULL,
  `question_type_id` int(11) NOT NULL,
  `remark` varchar(300) DEFAULT NULL,
  `question_option` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`id`, `question`, `question_type_id`, `remark`, `question_option`) VALUES
(18, 'What line of business are you in?', 5, 'List of different lines of businesses.', '[\"Agriculture and Fisheries\",\"Aviation\",\"Automotive\",\"Banking and Finance\",\"Building and Associated Materials\",\"Business Process Outsourcing\",\"Cannabis\",\"Construction\",\"Cosmetics\",\"Creative Industry\",\"Distribution\",\"Education\",\"Engineering - Electrical\",\"Food and Beverage Manufacturing\",\"Furniture\",\"Freight Forwarding\",\"Government\",\"Health Services\",\"Hospitality and Tourism\",\"Industrial, Chemical and Allied Products\",\"Information and Communication Technology\",\"Laboratories\",\"Legal Services\",\"Mining\",\"Non- Governmental Organization \",\"Packaging\",\"Paints and Surface Coatings\",\"Paper Products\",\"Petroleum\",\"Pharmaceutical\",\"Playground Equipment\",\"Renewable Energy\",\"Shipping\",\"Sports\",\"Transportation\",\"Utilities\",\"Waste Management\",\"Wholesale and Retail Sales\"]'),
(19, 'How many employees do you have?', 4, 'Individuals that work for you.', '[\"less than 5\",\"6-20\",\"21-50\",\"greater than 50\"]'),
(20, 'How long have you been in operation? (Years)', 4, '', '[\"0-2 \",\"2-5\",\"5-10\",\"more than 10\"]'),
(21, 'Have you or your staff engaged in any training programmes within the past five years? (Yes or No)If yes kindly state.', 1, '', '[]'),
(22, 'What are your areas of interest?', 5, 'List of interest that we facilitate at the Bureau of Standards Jamaica', '[\"Auditing\",\"Bamboo\",\"Business Continuity\",\"Business Development and Financing\",\"Calibration\",\"Certification\",\"Environmental Management\",\"Exportation of Goods and Services\",\"Food Safety Modernization\",\"Importation of Goods and Services\",\"Private Standards (HACCP, ISO, SQF, FSSC, GACP, etc.)\",\"Regulatory Compliance\",\"Risk Management\",\"Standards Compliance\",\"Testing\",\"Training\"]'),
(23, 'Are you aware of the services offered by the BSJ?(Yes, No) If yes, kindly state.', 1, '', '[\"222222\",\"option no 1\"]'),
(25, 'carmen question', 0, 'remark', '[\"option no 1\",\"222222\"]');

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`id`, `name`, `active`) VALUES
(1, 'Industrial', 1),
(2, 'Agriculture', 1),
(3, 'Manufacturing', 1),
(4, 'Exports/Imports', 1);

-- --------------------------------------------------------

--
-- Table structure for table `standard`
--

DROP TABLE IF EXISTS `standard`;
CREATE TABLE IF NOT EXISTS `standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard`
--

INSERT INTO `standard` (`id`, `code`, `name`, `active`) VALUES
(1, 'ISO9001', 'ISO 9001', 1),
(2, '2', 'Certification 2', 1),
(3, 'STA1', 'Standard 1', 1),
(5, 'NEEDS', 'Registration of Company', 1),
(6, 'SPA9001', 'SPA STANDARD', 1);

-- --------------------------------------------------------

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phase_id` int(11) NOT NULL,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`id`, `phase_id`, `code`, `name`, `active`) VALUES
(11, 1, '11', 'Assigned', 1),
(12, 1, '12', 'Engaged', 1),
(13, 1, '13', 'Update request for customer', 1),
(14, 1, '14', 'Awaiting feedback from consultant', 1),
(15, 1, '15', 'Feedback submitted', 1),
(16, 1, '16', 'Changes implemented/Completed', 1),
(21, 2, '21', 'Assigned', 1),
(22, 2, '22', 'Engaged', 1),
(23, 2, '23', 'Update request for customer', 1),
(24, 2, '24', 'Awaiting feedback from consultant', 1),
(25, 2, '25', 'Feedback submitted', 1),
(26, 2, '26', 'Changes implemented/Completed', 1),
(31, 3, '31', 'Assigned', 1),
(32, 3, '32', 'Engaged', 1),
(33, 3, '33', 'Update request for customer', 1),
(34, 3, '34', 'Awaiting feedback from consultant', 1),
(35, 3, '35', 'Feedback submitted', 1),
(36, 3, '36', 'Changes implemented/Completed', 1),
(41, 4, '41', 'Training & Development', 1),
(42, 4, '42', 'Internal Audit', 1),
(43, 4, '43', 'Management review', 1),
(44, 4, '44', 'Pre certification', 1),
(45, 4, '45', 'Clean up NC', 1),
(46, 4, '46', 'Generate Manual', 1),
(48, 6, 'CLI', 'Client Problem', 1),
(49, 7, 'MANUAL', 'Deliver the manual', 1),
(50, 5, 'EXAM', 'Examination of the problem', 1),
(51, 5, 'MARK', 'Marketing study', 1);

-- --------------------------------------------------------

--
-- Table structure for table `sub_clause`
--

DROP TABLE IF EXISTS `sub_clause`;
CREATE TABLE IF NOT EXISTS `sub_clause` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clause_id` int(11) NOT NULL DEFAULT '1',
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_clause`
--

INSERT INTO `sub_clause` (`id`, `clause_id`, `code`, `name`, `active`) VALUES
(1, 4, '4.1', 'Understanding the organization and its context', 1),
(2, 4, '4.2', 'Understanding the needs and expectations of interested parties', 1),
(3, 4, '4.3', 'Determining the scope of the Quality Management System', 1),
(4, 4, '4.4', 'Quality Management System and its processes', 1),
(5, 5, '5.1.1', 'Leadership', 1),
(6, 5, '5.1.2', 'Customer Focus ', 1),
(7, 5, '5.2.1', 'Quality Policy', 1),
(8, 5, '5.2.2', 'Quality Policy', 1),
(9, 5, '5.3', 'Organizational roles, responsibilities and authorities', 1),
(10, 6, '6.1', 'Actions to address risks and opportunities', 1),
(11, 6, '6.1.2', 'Actions to address risks and opportunities', 1),
(12, 6, '6.2.1', 'Quality objectives and planning to achieve them', 1),
(13, 6, '6.2.2', 'Quality objectives and planning to achieve them', 1),
(14, 6, '6.3', 'Planning for changes', 1),
(15, 7, '7.1.1', 'Resources', 1),
(16, 7, '7.1.2', 'People', 1),
(17, 7, '7.1.3', 'Infrastructure', 1),
(18, 7, '7.1.4', 'Environment for the operation of processes', 1),
(19, 7, '7.1.5', 'Monitoring and measuring resources', 1),
(20, 7, '7.1.6', 'Organizational Knowledge', 1),
(21, 7, '7.2', 'Competence', 1),
(22, 7, '7.3', 'Awareness', 1),
(23, 7, '7.4', 'Communication', 1),
(24, 7, '7.5.1', 'Documneted Information', 1),
(25, 7, '7.5.2', 'Documneted Information', 1),
(26, 7, '7.5.3', 'Documneted Information', 1),
(27, 7, '7.5.3.1', 'Documneted Information', 1),
(28, 7, '7.5.3.2', 'Documneted Information', 1),
(29, 8, '8.1', 'Operations', 1),
(30, 8, '8.2.1', 'Customer Communication', 1),
(31, 8, '8.2.2', 'Determining the requirement for products & Services', 1),
(32, 8, '8.2.3', 'Review of the requirements for products and services', 1),
(33, 8, '8.2.4', 'Review of the requirements for products and services', 1),
(34, 8, '8.3.2', 'Design and development of products and services', 1),
(35, 8, '8.3.3', 'Design and development of products and services', 1),
(36, 8, '8.3.3', 'Design and development inputs', 1),
(37, 8, '8.3.4', 'Design and development inputs', 1),
(38, 8, '8.3.4', 'Design and development controls', 1),
(39, 8, '8.3.5', 'Design and development controls', 1),
(40, 8, '8.3.6', 'Design and development outputs', 1),
(41, 8, '8.3.6', 'Design and Development changes', 1),
(42, 8, '8.4.1', 'Control of externally provided processes, products and services', 1),
(43, 8, '8.4.2', 'Type and extent of control', 1),
(44, 8, '8.4.3', 'Type and extent of control', 1),
(45, 8, '8.4.3', 'Information for external providers', 1),
(46, 8, '8.5.1', 'Production and Service provision', 1),
(47, 8, '8.5.1', 'Control of production and service provision', 1),
(48, 8, '8.5.2', 'Identification and traceability', 1),
(49, 8, '8.5.3', 'Property belonging to customers or external providers', 1),
(50, 8, '8.5.4', 'Preservation', 1),
(51, 8, '8.5.5', 'Post Delivery Activities', 1),
(52, 8, '8.5.6', 'Post Delivery Activities', 1),
(53, 8, '8.6', 'Control of Changes', 1),
(54, 8, '8.6.', 'Release of products and services', 1),
(55, 8, '8.6', 'Release of products and services', 1),
(56, 8, '8.7', 'Control of Nonconforming outputs', 1),
(57, 9, '9.1.1', 'Performance Evaluation', 1),
(58, 9, '9.1.2', 'Customer satisfaction', 1),
(59, 9, '9.1.3', 'Analysis and evaluation', 1),
(60, 9, '9.2.1', 'Internal Audit', 1),
(61, 9, '9.2.2', 'Internal Audit', 1),
(62, 9, '9.3.1', 'Management Review', 1),
(63, 9, '9.3.2', 'Management Review', 1),
(64, 9, '9.3.3', 'Management Review inputs', 1),
(65, 9, '9.3.3', 'Management Revew outputs', 1),
(66, 10, '10.1', 'Improvement', 1),
(67, 10, '10.2.1', 'Nonconformity and corrective action ', 1),
(68, 10, '10.2.2', 'Nonconformity and corrective action ', 1),
(69, 10, '10.3', 'Continual improvement', 1),
(70, 11, '80.1', 'Here is the sub-clause for Standard 1', 1),
(71, 13, 'N.1.1', 'Situation of the client', 1),
(72, 13, 'N.1.2', 'Investiment', 1),
(73, 14, 'testspa', 'spatest', 1);

-- --------------------------------------------------------

--
-- Table structure for table `support_type`
--

DROP TABLE IF EXISTS `support_type`;
CREATE TABLE IF NOT EXISTS `support_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `support_type`
--

INSERT INTO `support_type` (`id`, `code`, `name`, `active`) VALUES
(1, 'INFO', 'Information', 1);

-- --------------------------------------------------------

--
-- Table structure for table `technical_advice`
--

DROP TABLE IF EXISTS `technical_advice`;
CREATE TABLE IF NOT EXISTS `technical_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `consultant_id` text,
  `activity` int(11) NOT NULL,
  `date_created` date NOT NULL,
  `date_begin` date DEFAULT NULL,
  `date_ended` date DEFAULT NULL,
  `work_scope` text,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  KEY `activity` (`activity`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `technical_advice`
--

INSERT INTO `technical_advice` (`id`, `client_id`, `consultant_id`, `activity`, `date_created`, `date_begin`, `date_ended`, `work_scope`, `updated_by`) VALUES
(8, 24, '[\"31\"]', 1, '2020-09-28', '2020-09-29', '2020-10-26', 'hsdfhskglhsjklghsalkgsa', 23),
(9, 25, '[\"30\"]', 1, '2020-10-14', '2020-10-22', '2020-10-31', '', 23);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) NOT NULL,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `remark` text,
  `active` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  `updated_by` int(11) NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `profile_id`, `username`, `password`, `email`, `name`, `phone`, `remark`, `active`, `updated_by`, `updated_date`) VALUES
(18, 5, 'voyagine', '$2y$10$zdSQoIZNy10Gs3uQhG0OF.8xucSKJyP5AEkuCkPY08axj/rNm7lrW', 'voyagine@hotmail.com', 'Carmen Gagnon', '5149836594', NULL, 1, 18, '2019-12-12 17:56:40'),
(23, 5, 'admin', '$2y$10$ZX.EHlOqIPmRWyrxP05zWuViAa1tq4lej3NnVRcsOsXh2SwF6nh8W', 'admin@hotmail.com', 'admin', '', NULL, 1, 23, '2019-12-18 20:08:01'),
(24, 5, 'bsjme', '$2y$10$LAzMxF3v4LDX3RNP8.RDo.9J5MPz2oilCkdByFkG6hMAAWY.mqpDm', 'bsjme@gmail.com', 'bsjme', '', NULL, 1, 18, '2019-12-09 23:43:02'),
(27, 4, 'TRN001', '$2y$10$yMR1S5Q05AcDynYzy9pWY.5zpsOpI3zeOBRiEOCXsA0tgYBGOZPAy', 'client@hotmail.com', 'Client security', '5149836594', NULL, 1, 23, '2019-12-22 00:57:53'),
(28, 2, 'coordinator', '$2y$10$c6A5etaespHgz.aZCk7Wm.3H8uC3.aCDfPhdK6YEr9YKkEomjbya.', 'coordinator@hotmail.com', 'Coordinator', '', NULL, 1, 23, '2019-12-18 20:04:18'),
(29, 3, 'consultant1', '$2y$10$OGQl0/pjeKdcuJXINJy/1urTVpircS/2KO5WLhuOU6YZOXT.En8Bq', 'consultant1@hotmail.com', 'Consultant 1', '123456789', NULL, 1, 23, '2019-12-18 20:07:50'),
(30, 3, 'consultant2', '$2y$10$8EjzOfJ7W9mAyq9jNEz1POGLENZX9excWKpl505iDzXbyQzeK1SkS', 'consultant2@hotmail.com', 'Consultant No 2', '', NULL, 1, 18, '2019-12-18 20:08:33'),
(31, 3, 'consultant3', '$2y$10$LNvKCbDAmYkBL93oQlZH1uC.k4Qje.xC8JFkOdSzzdvQaBM9ERUTK', 'consultant3@hotmail.com', 'Consultant No 3', '', NULL, 1, 18, '2019-12-18 20:09:11'),
(37, 4, 'TRN002', '$2y$10$i/66TmRPUoWoqSXOf9L2P.g4415vjzSZbZSUwgSeDTabRZlIyVKXm', 'voyagine@hotmail.com', 'M. Untel', 'phone', NULL, 1, 23, '2019-12-23 17:54:46'),
(38, 4, 'TRN003', '$2y$10$FnwBu5YX5GSpu5T0sXcNvulVbC7tBBglrCPteknl..B6eODAxoBIi', 'voyagine@hotmail.com', 'Client No 3', '05149836594', NULL, 1, 18, '2019-12-23 17:59:28'),
(41, 6, 'reader', '$2y$10$CWCkyvlwQNZqYhX/yzLsouJGPeM7GqWJy/4J5T.PYQlWGUr5Dqpy.', 'reader@hotmail.com', 'M. Reader', '5149836594', NULL, 1, 18, '2020-02-25 15:13:49');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
  ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`consultation_id`) REFERENCES `consultation` (`id`),
  ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- Constraints for table `internal_cost_plan`
--
ALTER TABLE `internal_cost_plan`
  ADD CONSTRAINT `internal_cost_plan_ibfk_1` FOREIGN KEY (`billing_item_id`) REFERENCES `billing_item` (`id`),
  ADD CONSTRAINT `internal_cost_plan_ibfk_2` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `internal_cost_plan_ibfk_3` FOREIGN KEY (`ta_id`) REFERENCES `technical_advice` (`id`),
  ADD CONSTRAINT `internal_cost_plan_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `user` (`id`);

--
-- Constraints for table `question_option`
--
ALTER TABLE `question_option`
  ADD CONSTRAINT `question_option_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);

--
-- Constraints for table `technical_advice`
--
ALTER TABLE `technical_advice`
  ADD CONSTRAINT `technical_advice_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  ADD CONSTRAINT `technical_advice_ibfk_2` FOREIGN KEY (`activity`) REFERENCES `activity` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
