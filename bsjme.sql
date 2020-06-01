-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 01, 2020 at 07:09 PM
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
  `user_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

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
(13, 5, 'N1', 'Qualification for Registration of Company', 1);

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
(25, 'TRN002', 1, 0, 1, 2, '11700 Racette', 0, 'M. Just', 'Hotel Association', 'Muriel', 'Muriel', 'TRN002', '', 'voyagine@hotmail.com', '', '', '5149836594', 'H1G 5J5', 'H1G 5J5', '', '', '', '2020-02-27 18:51:16', 18),
(26, 'TRN50', 1, 1, 1, 1, '67 Home Drive', 0, 'M. Untel', 'Jewel int.', '', '', 'TRN50', '', 'jewel@gmail.com', '4567899', '', '', '', '', 'dfdfsdfd', '', '', '2020-05-23 00:13:41', 28),
(27, '123456789', 1, 1, 3, 8, 'Papine', 0, 'Nicholas Jumpp', 'University of Technology', '', '', '123456789', '', 'nicholasjumpp1@gmail.com', '', '', '', '77085', '77085', '', '', '', '2020-05-29 22:52:21', 28),
(28, '987654321', 1, 1, 3, 8, '6 South Camp Road', 0, 'Robert Downey Jr', 'Sutherland Global Services', '', '', '987654321', '', 'rdowney@sutherland.com', '', '', '', '', '', '', '', '', '2020-06-01 18:55:13', 28);

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consultation`
--

INSERT INTO `consultation` (`id`, `consultation_no`, `clause_id`, `client_id`, `consultant_id`, `phase_id`, `program_id`, `sector_id`, `standard_id`, `status_id`, `board_meeting_time_period`, `business_process`, `date_begin`, `date_creation`, `date_end`, `description`, `exemption`, `management_review_time`, `product`, `quality_policy`, `remark`, `updated_date`, `updated_by`) VALUES
(31, 'CON01', 11, 24, '[\"29\"]', 1, 8, 4, 2, 11, '', '', '2020-02-27', '2020-02-27', '0000-00-00', 'Consultation 1', '', '', '', '', '', '2020-02-27 00:57:59', 18),
(32, 'CON02', 13, 25, '[\"30\"]', 6, 13, 1, 5, 48, '', '', '2020-02-27', '2020-02-27', '0000-00-00', 'Consultation 2', '', '', '', '', '', '2020-02-27 20:07:29', 18),
(33, '109', 4, 27, 'null', 5, 13, 2, 1, 50, '', '', '2020-06-01', '2020-06-01', '0000-00-00', 'fdfd', '', '', '', '', '', '2020-06-01 00:24:38', 28);

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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;

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
(1, 25, 2, 1, 'Could you please clarify the needs analysis', 'Sure no proble. fix so and so ', '', '0000-00-00');

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
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `timestamp` datetime NOT NULL,
  `module` varchar(100) NOT NULL,
  `action` varchar(100) NOT NULL,
  `client_id` int(11) DEFAULT NULL,
  `consultation_id` int(11) DEFAULT NULL,
  `subject_id` int(11) NOT NULL,
  `remark` text,
  `attributes` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `user_id`, `timestamp`, `module`, `action`, `client_id`, `consultation_id`, `subject_id`, `remark`, `attributes`) VALUES
(78, 18, '2020-02-27 13:55:29', 'Consultation', 'Update', 25, 32, 32, 'Update Consultation CON02 and Move from phase End to phase Phase 1', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:1:\"0\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"7\";s:10:\"program_id\";s:2:\"11\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"49\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 12:40:56\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:3:\"End\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"8\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"11\";s:12:\"updated_date\";s:19:\"2020-02-27 13:55:29\";s:10:\"updated_by\";s:2:\"18\";}}'),
(77, 18, '2020-02-27 13:51:16', 'Client', 'Update', 25, NULL, 25, 'Update Client TRN002', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Association Hotel\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 07:39:24\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:14:\"67 Home Street\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 08:42:29\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"city_id\";s:0:\"\";s:12:\"company_name\";s:17:\"Hotel Association\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"contact_name\";s:6:\"Muriel\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"2\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:6:\"TRN002\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}}'),
(63, 18, '2020-02-27 00:57:20', 'Client', 'Create', 24, NULL, 24, 'Create Client 24', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"city_id\";s:0:\"\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:6:\"TRN001\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"18\";}'),
(76, 18, '2020-02-27 13:42:29', 'Client', 'Create', 26, NULL, 26, 'Create Client TRN50', 'a:22:{s:11:\"activity_id\";s:1:\"3\";s:7:\"address\";s:14:\"67 Home Street\";s:7:\"city_id\";s:1:\"1\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"18\";}'),
(75, 18, '2020-02-27 12:42:17', 'Consultation Document', 'Upload', 25, 32, 88, 'Upload of document Quality_Procedures_Manual_for_ISO_9001.pdf', 'a:8:{s:9:\"client_id\";s:2:\"25\";s:15:\"consultation_id\";s:2:\"32\";s:8:\"doc_size\";d:443.69;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:42:\"Quality_Procedures_Manual_for_ISO_9001.pdf\";s:16:\"document_type_id\";s:1:\"5\";s:17:\"document_class_id\";s:1:\"1\";s:10:\"updated_by\";s:2:\"18\";}'),
(73, 18, '2020-02-27 12:40:38', 'Consultation Document', 'Upload', 25, 32, 87, 'Upload of document Client_Services_wbs.pdf', 'a:8:{s:9:\"client_id\";s:2:\"25\";s:15:\"consultation_id\";s:2:\"32\";s:8:\"doc_size\";d:90.71;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:23:\"Client_Services_wbs.pdf\";s:16:\"document_type_id\";s:1:\"3\";s:17:\"document_class_id\";s:1:\"4\";s:10:\"updated_by\";s:2:\"18\";}'),
(74, 18, '2020-02-27 12:40:56', 'Consultation', 'Update', 25, 32, 32, 'Update Consultation CON02 and Move from phase Analysis to phase End', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:1:\"0\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"5\";s:10:\"program_id\";s:2:\"11\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"50\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 12:40:27\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Association Hotel\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:8:\"Analysis\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 3\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"7\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"11\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"49\";s:12:\"updated_date\";s:19:\"2020-02-27 12:40:56\";s:10:\"updated_by\";s:2:\"18\";}}'),
(68, 18, '2020-02-27 00:58:38', 'Consultation Document', 'Delete', 24, 31, 84, 'Delete of document Client_Services_wbs.pdf', 'a:12:{s:2:\"id\";s:2:\"84\";s:9:\"client_id\";s:2:\"24\";s:15:\"consultation_id\";s:2:\"31\";s:7:\"post_id\";N;s:16:\"document_type_id\";s:1:\"5\";s:17:\"document_class_id\";s:1:\"4\";s:8:\"doc_name\";s:23:\"Client_Services_wbs.pdf\";s:8:\"doc_size\";s:2:\"91\";s:8:\"doc_type\";s:15:\"application/pdf\";s:12:\"updated_date\";s:19:\"2020-02-26 19:58:15\";s:10:\"updated_by\";s:2:\"18\";s:9:\"directory\";s:6:\"TRN001\";}'),
(69, 18, '2020-02-27 12:39:24', 'Client', 'Create', 25, NULL, 25, 'Create Client TRN002', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"city_id\";s:0:\"\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Association Hotel\";s:12:\"contact_name\";s:6:\"Muriel\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"2\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:6:\"TRN002\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"18\";}'),
(70, 18, '2020-02-27 12:39:44', 'Client Document', 'Upload', 25, NULL, 86, 'Upload of document 20191212_124515.jpg', 'a:7:{s:9:\"client_id\";s:2:\"25\";s:8:\"doc_size\";d:2321.46;s:8:\"doc_type\";s:10:\"image/jpeg\";s:8:\"doc_name\";s:19:\"20191212_124515.jpg\";s:16:\"document_type_id\";s:1:\"2\";s:17:\"document_class_id\";s:1:\"2\";s:10:\"updated_by\";s:2:\"18\";}'),
(71, 18, '2020-02-27 12:40:15', 'Consultation', 'Create', 25, 32, 32, 'Create Consultation CON02', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"11\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:10:\"updated_by\";s:2:\"18\";}'),
(72, 18, '2020-02-27 12:40:27', 'Consultation', 'Update', 25, 32, 32, 'Update Consultation CON02 and Move from phase Introduction to phase Analysis', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:1:\"0\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"11\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 07:40:15\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Association Hotel\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 3\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:0:\"\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"5\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"11\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"50\";s:12:\"updated_date\";s:19:\"2020-02-27 12:40:27\";s:10:\"updated_by\";s:2:\"18\";}}'),
(64, 18, '2020-02-27 00:57:34', 'Client Document', 'Upload', 24, NULL, 83, 'Upload of document Client_Services_Network_Diagram.pdf', 'a:7:{s:9:\"client_id\";s:2:\"24\";s:8:\"doc_size\";d:177.86;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:35:\"Client_Services_Network_Diagram.pdf\";s:16:\"document_type_id\";s:1:\"2\";s:17:\"document_class_id\";s:1:\"4\";s:10:\"updated_by\";s:2:\"18\";}'),
(65, 18, '2020-02-27 00:57:59', 'Consultation', 'Create', 24, 31, 31, 'Create Consultation CON01', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"24\";s:13:\"consultant_id\";s:6:\"[\"29\"]\";s:15:\"consultation_no\";s:5:\"CON01\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 1\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"1\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:1:\"8\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"4\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"11\";s:10:\"updated_by\";s:2:\"18\";}'),
(66, 18, '2020-02-27 00:58:15', 'Consultation Document', 'Upload', 24, 31, 84, 'Upload of document Client_Services_wbs.pdf', 'a:8:{s:9:\"client_id\";s:2:\"24\";s:15:\"consultation_id\";s:2:\"31\";s:8:\"doc_size\";d:90.71;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:23:\"Client_Services_wbs.pdf\";s:16:\"document_type_id\";s:1:\"5\";s:17:\"document_class_id\";s:1:\"4\";s:10:\"updated_by\";s:2:\"18\";}'),
(67, 18, '2020-02-27 00:58:34', 'Consultation Document', 'Upload', 24, 31, 85, 'Upload of document WBS_Orville.jpg', 'a:8:{s:9:\"client_id\";s:2:\"24\";s:15:\"consultation_id\";s:2:\"31\";s:8:\"doc_size\";d:1943.11;s:8:\"doc_type\";s:10:\"image/jpeg\";s:8:\"doc_name\";s:15:\"WBS_Orville.jpg\";s:16:\"document_type_id\";s:1:\"5\";s:17:\"document_class_id\";s:1:\"1\";s:10:\"updated_by\";s:2:\"18\";}'),
(79, 18, '2020-02-27 14:02:08', 'Consultation', 'Update', 25, 32, 32, 'Update Consultation CON02 and Move from phase Phase 1 to phase Introduction', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"1\";s:10:\"program_id\";s:1:\"8\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"11\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:55:29\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:7:\"Phase 1\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:9:\"Program 1\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:12:\"updated_date\";s:19:\"2020-02-27 14:02:08\";s:10:\"updated_by\";s:2:\"18\";}}'),
(80, 18, '2020-02-27 15:07:29', 'Consultation', 'Update', 25, 32, 32, 'Update Consultation CON02', 'a:2:{s:3:\"old\";a:39:{s:2:\"id\";s:2:\"32\";s:15:\"consultation_no\";s:5:\"CON02\";s:9:\"clause_id\";s:2:\"11\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:8:\"phase_id\";s:1:\"6\";s:10:\"program_id\";s:2:\"13\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"2\";s:9:\"status_id\";s:2:\"48\";s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:13:\"date_creation\";s:10:\"2020-02-27\";s:8:\"date_end\";s:10:\"0000-00-00\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:7:\"product\";s:0:\"\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 14:02:08\";s:10:\"updated_by\";s:13:\"Carmen Gagnon\";s:7:\"address\";s:13:\"11700 Racette\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:13:\"director_name\";s:6:\"Muriel\";s:3:\"trn\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:7:\"website\";s:0:\"\";s:9:\"directory\";s:6:\"TRN002\";s:11:\"parish_name\";s:9:\"Clarendon\";s:10:\"phase_name\";s:12:\"Introduction\";s:11:\"county_name\";s:8:\"Cornwall\";s:12:\"program_name\";s:14:\"Needs Analysis\";}s:3:\"new\";a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:2:\"13\";s:9:\"client_id\";s:2:\"25\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:5:\"CON02\";s:10:\"date_begin\";s:10:\"2020-02-27\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:14:\"Consultation 2\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"5\";s:9:\"status_id\";s:2:\"48\";s:12:\"updated_date\";s:19:\"2020-02-27 15:07:29\";s:10:\"updated_by\";s:2:\"18\";}}'),
(81, 23, '2020-03-19 21:18:51', 'Client', 'Delete', 27, NULL, 27, 'Delete Client 27', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"27\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:17:\"2 Winchester Road\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:5:\"Frank\";s:12:\"company_name\";s:17:\"Frank Barber Shop\";s:12:\"contact_name\";s:5:\"Frank\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:22:\"frankhotdogs@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:31:\"Standardize my hot dog business\";s:5:\"phone\";s:14:\"1-999-999-9999\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-09 12:27:46\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:14:\"67 Home Street\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 08:42:29\";s:10:\"updated_by\";s:2:\"18\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(82, 23, '2020-03-19 21:28:21', 'Client', 'Update', 26, NULL, 26, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:14:\"67 Home Street\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 08:42:29\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"3\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:28:21\";s:10:\"updated_by\";s:2:\"23\";}}'),
(83, 23, '2020-03-19 21:29:47', 'Client', 'Update', 26, NULL, 26, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:28:21\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"2\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}}'),
(84, 23, '2020-03-19 22:05:09', 'Client', 'Delete', 28, NULL, 28, 'Delete Client 28', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"28\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:18:\"26 Maple Leaf Mews\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:11:\"Vybz Kartel\";s:12:\"company_name\";s:8:\"Bad Dawg\";s:12:\"contact_name\";s:11:\"Vybz Kartel\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:23:\"Standardize my sausages\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:14:\"Needs Analysis\";s:7:\"website\";s:23:\"https://www.youtube.com\";s:12:\"updated_date\";s:19:\"2020-03-19 17:01:33\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(85, 23, '2020-03-19 22:11:34', 'Client', 'Delete', 29, NULL, 29, 'Delete Client 29', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"29\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:18:\"26 Maple Leaf Mews\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:11:\"Vybz Kartel\";s:12:\"company_name\";s:8:\"Bad Dawg\";s:12:\"contact_name\";s:11:\"Vybz Kartel\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:23:\"Standardize my sausages\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:14:\"Needs Analysis\";s:7:\"website\";s:23:\"https://www.youtube.com\";s:12:\"updated_date\";s:19:\"2020-03-19 17:10:24\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(86, 23, '2020-03-19 22:17:12', 'Client', 'Delete', 30, NULL, 30, 'Delete Client 30', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"30\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:2:\"13\";s:7:\"address\";s:8:\"dssdfsdf\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:7:\"dfsdfsd\";s:12:\"company_name\";s:5:\"sfdfs\";s:12:\"contact_name\";s:7:\"dfsdfsd\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:6:\"fdffdf\";s:5:\"phone\";s:14:\"1-755-964-5214\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:14:\"Needs Analysis\";s:7:\"website\";s:20:\"https://youtube.com/\";s:12:\"updated_date\";s:19:\"2020-03-19 17:12:53\";s:10:\"updated_by\";s:1:\"0\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(87, 32, '2020-03-19 22:18:38', 'Registration', 'Registration', 32, NULL, 32, 'Create Client 32', 'a:16:{s:3:\"trn\";s:9:\"123456789\";s:12:\"company_name\";s:8:\"dfdsfsdf\";s:11:\"client_name\";s:8:\"sfsdfsdf\";s:12:\"contact_name\";s:8:\"sfsdfsdf\";s:7:\"address\";s:8:\"dsfsdfsf\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:2:\"13\";s:7:\"city_id\";s:1:\"1\";s:9:\"objective\";s:6:\"dfsdfs\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:20:\"https://youtube.com/\";s:11:\"activity_id\";i:3;s:9:\"directory\";s:9:\"123456789\";s:7:\"attempt\";i:1;}'),
(88, 33, '2020-05-05 17:50:06', 'Registration', 'Registration', 33, NULL, 33, 'Create Client 33', 'a:16:{s:3:\"trn\";s:9:\"987654321\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:7:\"address\";s:6:\"Papine\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"city_id\";s:1:\"1\";s:9:\"objective\";s:20:\"Test the application\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:11:\"activity_id\";i:3;s:9:\"directory\";s:9:\"987654321\";s:7:\"attempt\";i:1;}'),
(89, 23, '2020-05-05 17:59:41', 'Client', 'Update', 33, NULL, 33, 'Update Client 987654321', 'a:2:{s:3:\"old\";a:5:{i:0;a:25:{s:2:\"id\";s:2:\"32\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:2:\"13\";s:7:\"address\";s:8:\"dsfsdfsf\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:8:\"sfsdfsdf\";s:12:\"company_name\";s:8:\"dfdsfsdf\";s:12:\"contact_name\";s:8:\"sfsdfsdf\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:6:\"dfsdfs\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:20:\"https://youtube.com/\";s:12:\"updated_date\";s:19:\"2020-03-19 17:18:38\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"33\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:20:\"Test the application\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-05 12:50:06\";s:10:\"updated_by\";s:1:\"0\";}i:4;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:6:\"Papine\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:20:\"Test the application\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:9:\"Program 1\";s:3:\"trn\";s:9:\"987654321\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-05 17:59:41\";s:10:\"updated_by\";s:2:\"23\";}}'),
(90, 23, '2020-05-05 18:32:43', 'Consultation', 'Create', 33, 33, 33, 'Create Consultation 061296', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:1:\"4\";s:9:\"client_id\";s:2:\"33\";s:13:\"consultant_id\";s:6:\"[\"30\"]\";s:15:\"consultation_no\";s:6:\"061296\";s:13:\"date_creation\";s:10:\"2020-05-05\";s:10:\"date_begin\";s:10:\"2020-05-05\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:18:\"Jumpp consultation\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"6\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"1\";s:11:\"standard_id\";s:1:\"1\";s:9:\"status_id\";s:2:\"48\";s:10:\"updated_by\";s:2:\"23\";}');
INSERT INTO `log` (`id`, `user_id`, `timestamp`, `module`, `action`, `client_id`, `consultation_id`, `subject_id`, `remark`, `attributes`) VALUES
(91, 23, '2020-05-12 16:36:00', 'Client', 'Delete', 32, NULL, 32, 'Delete Client 32', 'a:5:{i:0;a:25:{s:2:\"id\";s:2:\"32\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:2:\"13\";s:7:\"address\";s:8:\"dsfsdfsf\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:8:\"sfsdfsdf\";s:12:\"company_name\";s:8:\"dfdsfsdf\";s:12:\"contact_name\";s:8:\"sfsdfsdf\";s:13:\"director_name\";N;s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";N;s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";N;s:9:\"objective\";s:6:\"dfsdfs\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";N;s:11:\"postal_code\";N;s:6:\"remark\";N;s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:20:\"https://youtube.com/\";s:12:\"updated_date\";s:19:\"2020-03-19 17:18:38\";s:10:\"updated_by\";s:1:\"0\";}i:1;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:2;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"33\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:20:\"Test the application\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-05 17:59:41\";s:10:\"updated_by\";s:2:\"23\";}i:4;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(92, 23, '2020-05-12 16:36:06', 'Client', 'Delete', 33, NULL, 33, 'Delete Client 33', 'a:4:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"33\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"1\";s:11:\"client_name\";s:14:\"Nichilas Jumpp\";s:12:\"company_name\";s:9:\"Jumpp inc\";s:12:\"contact_name\";s:14:\"Nichilas Jumpp\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:20:\"Test the application\";s:5:\"phone\";s:14:\"1-876-788-9327\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:9:\"Program 1\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-05 17:59:41\";s:10:\"updated_by\";s:2:\"23\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}'),
(93, 23, '2020-05-22 16:55:29', 'Client', 'Update', 26, NULL, 26, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"2\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-03-19 21:29:47\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"3\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 16:55:29\";s:10:\"updated_by\";s:2:\"23\";}}'),
(94, 28, '2020-05-22 19:06:09', 'Client', 'Update', 26, NULL, 26, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 16:55:29\";s:10:\"updated_by\";s:2:\"23\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"3\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:06:09\";s:10:\"updated_by\";s:2:\"28\";}}'),
(95, 28, '2020-05-22 19:13:41', 'Client', 'Update', 26, NULL, 26, 'Update Client TRN50', 'a:2:{s:3:\"old\";a:3:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"3\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:06:09\";s:10:\"updated_by\";s:2:\"28\";}i:2;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:10:\"Jewel int.\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"1\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"1\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:5:\"TRN50\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}}'),
(96, 28, '2020-05-22 19:43:03', 'Client Document', 'Upload', 25, NULL, 89, 'Upload of document RICHARD_PITTER_RESUME.pdf', 'a:7:{s:9:\"client_id\";s:2:\"25\";s:8:\"doc_size\";d:278.02;s:8:\"doc_type\";s:15:\"application/pdf\";s:8:\"doc_name\";s:25:\"RICHARD_PITTER_RESUME.pdf\";s:16:\"document_type_id\";s:1:\"1\";s:17:\"document_class_id\";s:1:\"1\";s:10:\"updated_by\";s:2:\"28\";}'),
(97, 28, '2020-05-29 17:49:58', 'Client', 'Create', 27, NULL, 27, 'Create Client 123456789', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:6:\"Papine\";s:7:\"city_id\";s:1:\"1\";s:11:\"client_name\";s:14:\"Nicholas Jumpp\";s:12:\"company_name\";s:24:\"University of Technology\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"123456789\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"28\";}'),
(98, 28, '2020-05-29 17:52:21', 'Client', 'Update', 27, NULL, 27, 'Update Client 123456789', 'a:2:{s:3:\"old\";a:4:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}i:2;a:25:{s:2:\"id\";s:2:\"27\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:14:\"Nicholas Jumpp\";s:12:\"company_name\";s:24:\"University of Technology\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-29 12:49:58\";s:10:\"updated_by\";s:2:\"28\";}i:3;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:6:\"Papine\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:24:\"University of Technology\";s:11:\"client_name\";s:14:\"Nicholas Jumpp\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"123456789\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-29 17:52:21\";s:10:\"updated_by\";s:2:\"28\";}}'),
(99, 28, '2020-06-01 00:24:38', 'Consultation', 'Create', 27, 33, 33, 'Create Consultation 109', 'a:21:{s:25:\"board_meeting_time_period\";s:0:\"\";s:16:\"business_process\";s:0:\"\";s:9:\"clause_id\";s:1:\"4\";s:9:\"client_id\";s:2:\"27\";s:13:\"consultant_id\";s:4:\"null\";s:15:\"consultation_no\";s:3:\"109\";s:13:\"date_creation\";s:10:\"2020-06-01\";s:10:\"date_begin\";s:10:\"2020-06-01\";s:8:\"date_end\";s:0:\"\";s:11:\"description\";s:4:\"fdfd\";s:9:\"exemption\";s:0:\"\";s:22:\"management_review_time\";s:0:\"\";s:8:\"phase_id\";s:1:\"5\";s:7:\"product\";s:0:\"\";s:10:\"program_id\";s:2:\"13\";s:14:\"quality_policy\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:9:\"sector_id\";s:1:\"2\";s:11:\"standard_id\";s:1:\"1\";s:9:\"status_id\";s:2:\"50\";s:10:\"updated_by\";s:2:\"28\";}'),
(100, 28, '2020-06-01 13:49:31', 'Client', 'Create', 28, NULL, 28, 'Create Client 987654321', 'a:22:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:17:\"6 South Camp Road\";s:7:\"city_id\";s:1:\"1\";s:11:\"client_name\";s:16:\"Robert Downey Jr\";s:12:\"company_name\";s:26:\"Sutherland Global Services\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:22:\"rdowney@sutherland.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"987654321\";s:7:\"website\";s:0:\"\";s:10:\"updated_by\";s:2:\"28\";}'),
(101, 28, '2020-06-01 13:55:13', 'Client', 'Update', 28, NULL, 28, 'Update Client 987654321', 'a:2:{s:3:\"old\";a:5:{i:0;a:25:{s:2:\"id\";s:2:\"25\";s:3:\"trn\";s:6:\"TRN002\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"2\";s:7:\"address\";s:13:\"11700 Racette\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:7:\"M. Just\";s:12:\"company_name\";s:17:\"Hotel Association\";s:12:\"contact_name\";s:6:\"Muriel\";s:13:\"director_name\";s:6:\"Muriel\";s:9:\"directory\";s:6:\"TRN002\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:10:\"5149836594\";s:10:\"postal_box\";s:7:\"H1G 5J5\";s:11:\"postal_code\";s:7:\"H1G 5J5\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-27 13:51:16\";s:10:\"updated_by\";s:2:\"18\";}i:1;a:25:{s:2:\"id\";s:2:\"26\";s:3:\"trn\";s:5:\"TRN50\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"1\";s:7:\"address\";s:13:\"67 Home Drive\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:8:\"M. Untel\";s:12:\"company_name\";s:10:\"Jewel int.\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:5:\"TRN50\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:15:\"jewel@gmail.com\";s:6:\"mobile\";s:7:\"4567899\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:8:\"dfdfsdfd\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-22 19:13:41\";s:10:\"updated_by\";s:2:\"28\";}i:2;a:25:{s:2:\"id\";s:2:\"28\";s:3:\"trn\";s:9:\"987654321\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:17:\"6 South Camp Road\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:16:\"Robert Downey Jr\";s:12:\"company_name\";s:26:\"Sutherland Global Services\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:22:\"rdowney@sutherland.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-06-01 08:49:31\";s:10:\"updated_by\";s:2:\"28\";}i:3;a:25:{s:2:\"id\";s:2:\"27\";s:3:\"trn\";s:9:\"123456789\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"1\";s:9:\"county_id\";s:1:\"3\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:6:\"Papine\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:14:\"Nicholas Jumpp\";s:12:\"company_name\";s:24:\"University of Technology\";s:12:\"contact_name\";s:0:\"\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"123456789\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:24:\"nicholasjumpp1@gmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:5:\"77085\";s:11:\"postal_code\";s:5:\"77085\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-05-29 17:52:21\";s:10:\"updated_by\";s:2:\"28\";}i:4;a:25:{s:2:\"id\";s:2:\"24\";s:3:\"trn\";s:6:\"TRN001\";s:11:\"activity_id\";s:1:\"1\";s:7:\"city_id\";s:1:\"0\";s:9:\"county_id\";s:1:\"1\";s:9:\"parish_id\";s:1:\"8\";s:7:\"address\";s:26:\"650 Jean-D\'Estrees apt 807\";s:7:\"attempt\";s:1:\"0\";s:11:\"client_name\";s:13:\"Carmen Gagnon\";s:12:\"company_name\";s:12:\"Voyagine Inc\";s:12:\"contact_name\";s:6:\"Carmen\";s:13:\"director_name\";s:13:\"Carmen Gagnon\";s:9:\"directory\";s:6:\"TRN001\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:20:\"voyagine@hotmail.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:5:\"phone\";s:11:\"05149836594\";s:10:\"postal_box\";s:6:\"H3C0G3\";s:11:\"postal_code\";s:6:\"H3C0G3\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-02-26 19:57:20\";s:10:\"updated_by\";s:2:\"18\";}}s:3:\"new\";a:23:{s:11:\"activity_id\";s:1:\"1\";s:7:\"address\";s:17:\"6 South Camp Road\";s:7:\"city_id\";s:1:\"1\";s:12:\"company_name\";s:26:\"Sutherland Global Services\";s:11:\"client_name\";s:16:\"Robert Downey Jr\";s:12:\"contact_name\";s:0:\"\";s:9:\"county_id\";s:1:\"3\";s:13:\"director_name\";s:0:\"\";s:9:\"directory\";s:9:\"987654321\";s:8:\"district\";s:0:\"\";s:5:\"email\";s:22:\"rdowney@sutherland.com\";s:6:\"mobile\";s:0:\"\";s:9:\"objective\";s:0:\"\";s:9:\"parish_id\";s:1:\"8\";s:5:\"phone\";s:0:\"\";s:10:\"postal_box\";s:0:\"\";s:11:\"postal_code\";s:0:\"\";s:6:\"remark\";s:0:\"\";s:6:\"target\";s:0:\"\";s:3:\"trn\";s:9:\"987654321\";s:7:\"website\";s:0:\"\";s:12:\"updated_date\";s:19:\"2020-06-01 13:55:13\";s:10:\"updated_by\";s:2:\"28\";}}'),
(102, 28, '2020-06-01 14:34:37', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document RICHARD_PITTER_RESUME.pdf', 'a:12:{s:2:\"id\";s:2:\"89\";s:9:\"client_id\";s:2:\"25\";s:15:\"consultation_id\";N;s:7:\"post_id\";N;s:16:\"document_type_id\";s:1:\"1\";s:17:\"document_class_id\";s:1:\"1\";s:8:\"doc_name\";s:25:\"RICHARD_PITTER_RESUME.pdf\";s:8:\"doc_size\";s:3:\"278\";s:8:\"doc_type\";s:15:\"application/pdf\";s:12:\"updated_date\";s:19:\"2020-05-22 14:43:03\";s:10:\"updated_by\";s:2:\"28\";s:9:\"directory\";s:6:\"TRN002\";}'),
(103, 28, '2020-06-01 14:34:38', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(104, 28, '2020-06-01 14:34:39', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(105, 28, '2020-06-01 14:34:39', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(106, 28, '2020-06-01 14:34:39', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(107, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(108, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(109, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(110, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(111, 28, '2020-06-01 14:34:40', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(112, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(113, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(114, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(115, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(116, 28, '2020-06-01 14:34:41', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(117, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(118, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(119, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(120, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(121, 28, '2020-06-01 14:34:42', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;'),
(122, 28, '2020-06-01 14:34:43', 'Client Document', 'Delete', 25, NULL, 89, 'Delete of document ', 'N;');

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
(4, 'Client', 'a:9:{i:0;s:12:\"updateClient\";i:1;s:10:\"viewClient\";i:2;s:16:\"viewConsultation\";i:3;s:13:\"updateAnswers\";i:4;s:10:\"viewManual\";i:5;s:8:\"viewPost\";i:6;s:13:\"viewDashboard\";i:7;s:8:\"viewNews\";i:8;s:10:\"viewMyUser\";}', 1),
(5, 'Admin', 'a:120:{i:0;s:12:\"createClient\";i:1;s:12:\"updateClient\";i:2;s:10:\"viewClient\";i:3;s:12:\"deleteClient\";i:4;s:19:\"createPendingClient\";i:5;s:19:\"updatePendingClient\";i:6;s:17:\"viewPendingClient\";i:7;s:19:\"deletePendingClient\";i:8;s:14:\"createActivity\";i:9;s:14:\"updateActivity\";i:10;s:12:\"viewActivity\";i:11;s:14:\"deleteActivity\";i:12;s:17:\"createRequirement\";i:13;s:17:\"updateRequirement\";i:14;s:15:\"viewRequirement\";i:15;s:17:\"deleteRequirement\";i:16;s:18:\"createConsultation\";i:17;s:18:\"updateConsultation\";i:18;s:16:\"viewConsultation\";i:19;s:18:\"deleteConsultation\";i:20;s:13:\"createProgram\";i:21;s:13:\"updateProgram\";i:22;s:11:\"viewProgram\";i:23;s:13:\"deleteProgram\";i:24;s:11:\"createPhase\";i:25;s:11:\"updatePhase\";i:26;s:9:\"viewPhase\";i:27;s:11:\"deletePhase\";i:28;s:12:\"createStatus\";i:29;s:12:\"updateStatus\";i:30;s:10:\"viewStatus\";i:31;s:12:\"deleteStatus\";i:32;s:12:\"createSector\";i:33;s:12:\"updateSector\";i:34;s:10:\"viewSector\";i:35;s:12:\"deleteSector\";i:36;s:14:\"createStandard\";i:37;s:14:\"updateStandard\";i:38;s:12:\"viewStandard\";i:39;s:14:\"deleteStandard\";i:40;s:12:\"createClause\";i:41;s:12:\"updateClause\";i:42;s:10:\"viewClause\";i:43;s:12:\"deleteClause\";i:44;s:15:\"createSubClause\";i:45;s:15:\"updateSubClause\";i:46;s:13:\"viewSubClause\";i:47;s:15:\"deleteSubClause\";i:48;s:14:\"createQuestion\";i:49;s:14:\"updateQuestion\";i:50;s:12:\"viewQuestion\";i:51;s:14:\"deleteQuestion\";i:52;s:13:\"createAnswers\";i:53;s:13:\"updateAnswers\";i:54;s:11:\"viewAnswers\";i:55;s:13:\"deleteAnswers\";i:56;s:12:\"createManual\";i:57;s:12:\"updateManual\";i:58;s:10:\"viewManual\";i:59;s:12:\"deleteManual\";i:60;s:14:\"createDocument\";i:61;s:14:\"updateDocument\";i:62;s:12:\"viewDocument\";i:63;s:14:\"deleteDocument\";i:64;s:18:\"createDocumentType\";i:65;s:18:\"updateDocumentType\";i:66;s:16:\"viewDocumentType\";i:67;s:18:\"deleteDocumentType\";i:68;s:19:\"createDocumentClass\";i:69;s:19:\"updateDocumentClass\";i:70;s:17:\"viewDocumentClass\";i:71;s:19:\"deleteDocumentClass\";i:72;s:12:\"createCounty\";i:73;s:12:\"updateCounty\";i:74;s:10:\"viewCounty\";i:75;s:12:\"deleteCounty\";i:76;s:12:\"createParish\";i:77;s:12:\"updateParish\";i:78;s:10:\"viewParish\";i:79;s:12:\"deleteParish\";i:80;s:10:\"createCity\";i:81;s:10:\"updateCity\";i:82;s:8:\"viewCity\";i:83;s:10:\"deleteCity\";i:84;s:13:\"createInquiry\";i:85;s:13:\"updateInquiry\";i:86;s:11:\"viewInquiry\";i:87;s:13:\"deleteInquiry\";i:88;s:17:\"createInquiryType\";i:89;s:17:\"updateInquiryType\";i:90;s:15:\"viewInquiryType\";i:91;s:17:\"deleteInquiryType\";i:92;s:17:\"createSupportType\";i:93;s:17:\"updateSupportType\";i:94;s:15:\"viewSupportType\";i:95;s:17:\"deleteSupportType\";i:96;s:10:\"createPost\";i:97;s:10:\"updatePost\";i:98;s:8:\"viewPost\";i:99;s:10:\"deletePost\";i:100;s:14:\"createCategory\";i:101;s:14:\"updateCategory\";i:102;s:12:\"viewCategory\";i:103;s:14:\"deleteCategory\";i:104;s:13:\"viewDashboard\";i:105;s:8:\"viewNews\";i:106;s:10:\"viewReport\";i:107;s:17:\"viewDocumentation\";i:108;s:10:\"viewMyUser\";i:109;s:20:\"viewSearchConsultant\";i:110;s:10:\"createUser\";i:111;s:10:\"updateUser\";i:112;s:8:\"viewUser\";i:113;s:10:\"deleteUser\";i:114;s:13:\"createProfile\";i:115;s:13:\"updateProfile\";i:116;s:11:\"viewProfile\";i:117;s:13:\"deleteProfile\";i:118;s:12:\"updateSystem\";i:119;s:13:\"updateSetting\";}', 1),
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `program`
--

INSERT INTO `program` (`id`, `standard_id`, `clause_id`, `code`, `name`, `remark`, `active`, `updated_date`, `updated_by`) VALUES
(8, 2, 11, 'P1', 'Program 1', '', 1, '2020-02-27 18:54:43', 18),
(9, 1, 10, 'P2', 'Program 2', '', 1, '2020-02-25 00:39:12', 18),
(13, 5, 13, 'Program 3', 'Needs Analysis', '', 1, '2020-02-27 19:03:02', 18);

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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8;

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
(86, 13, 7, 3);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_clause_id` int(11) DEFAULT '1',
  `question_type_id` int(11) NOT NULL DEFAULT '1',
  `question` text,
  `choice` tinyint(4) DEFAULT '1' COMMENT '1=one  2=multiple',
  `remark` text,
  `upload_document` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1=Yes  2=No',
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `sub_clause_id`, `question_type_id`, `question`, `choice`, `remark`, `upload_document`, `active`, `updated_date`, `updated_by`) VALUES
(1, 1, 3, 'Has the organization identified all external and internal issues relevant to its strategic plan ?', 1, '', 1, 1, '2020-02-06 03:41:15', 23),
(2, 1, 3, 'Has the organization established a process for monitor and review the external and internal issues that may affect the QMS?', 1, '', 1, 1, '2020-02-17 18:57:42', 23),
(3, 2, 3, 'Has the organization identified all relevant interested party and how their requierments may impact the operations of the organization?', 1, '', 1, 1, '2020-01-28 21:34:29', 23),
(4, 2, 1, 'How do you monitor and review the information about interested parties  and their requierments ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(5, 3, 3, 'Does the scope of the QMS, include products and services provided by the organization, and a justification for any exclusions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(6, 3, 3, 'Does the organization have the scope of the quality management system\nmaintained as documented information?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(7, 3, 3, 'Have : The internal and external issues;The requirments of the relevant interested parties and; The products and services provided by the organization, been considered when determining the scope of the organization ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(8, 3, 1, 'Is there assurance that: All requirements of the standard that are applicable to the organization, have been applied, and that; Those requirments determined to be non- applicable, do not affect the organization’s ability to ensure conformity to the standard ?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL),
(9, 4, 3, 'Have the processes of the organization been determined for the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(10, 4, 1, 'What are the: Inputs and outputs; Sequence of interactions; Crieteria, Methods, Measurments and Key Performance Indicators; Resources needed; Defined responsibility and authority for all personnel; Risks and Opportunities; Method(s) for monitoring and change to ensure intended results, of these processes ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(11, 4, 3, 'Has the organization defined; Documented information to support the operation of its processes and; Documented information to be retained as evidence that these processes are beingcarried out as planned?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(12, 5, 3, 'Has top management demonstrated leadership by: Taking accountability of the effectivness of the QMS by establishing the Quality Policy and Quality Objectives and; ensuring that they are alligne with the organization\'s strategic objectives?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(13, 5, 3, 'Has top management demonstrated leadership by communicating the Quality Policy and Quality Objectives within the organization, to ensure that the importance of meeting the requirements of the  QMS and customers is understood?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL),
(14, 5, 3, 'Has top management demonstrated leadership by: Providing adequate resources; Engaging/directing/supporting process effectiveness to achieve required results; Conducting Management Reviews, and; Communicating QMS effectiveness.', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(15, 5, 1, 'Has top management demonstrated leadership by promoting continual improvement and supporting other management roles within the organization to do the same?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL),
(16, 6, 1, 'Has top management demonstrated leadership by: Identifying customer requirements, and ensuring adherance to regulatory and statutory requirements?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL),
(17, 6, 1, 'Has top management demonstrated leadership, by ensuring that Risks and Opportunities are determined and addressed?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(18, 6, 1, 'Has top management demonstrated leadership by: Putting focus on consistently providing products/services that meet customer requirements, and enhancing customer satisfaction?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL),
(19, 7, 3, 'Has top management established, a Quality Policy that is appropriate to the context of your organization, and facilites the review and maintaince of the Quality Policy?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(20, 7, 3, 'Has top management established, a Quality Policy that: Includes a commitment to satisfying applicable requirements, and includes a commitment to continual improvement?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(21, 7, 3, 'Has top management established, a Quality Policy that is communicated and understood within the organization, and is continually reviewed for suitability?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(22, 7, 3, 'Has top management established Quality Objectives that are measurable and consistent with the Quality Policy?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(23, 8, 1, 'Has top management established, a Quality Policy that is documented, communicated and understood within the organization, and has been made available to the relevant interested parties?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(24, 9, 1, 'How does top managemnt ensure that the responsibilities and authority for all personnelare defined and communicated within the ogranization?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(25, 9, 1, 'How does top managemnt assign responsibility and authority to ensure that the QMS conforms to intenational sytandards?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(26, 9, 1, 'How does top managemnt assign the responsibility and authority to ensure the reporting of the performance of the QMS and its processes are delivering their intended outputs?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(27, 9, 1, 'How does top managemnt assign the responsibility and authority to ensure Customer Focus throughout the organization?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(29, 10, 1, 'How are the internal and external issues and interested parties considered when planning for the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(30, 10, 1, 'How are risks and opportunities determined and addressed so that the QMS can: Achieve its intended results, prevent or reduce undesired effects, and achieve continual improvement?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(31, 11, 1, 'How are actions planned to address risks and oppertunities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(32, 11, 1, 'How are actions integrated and implemented into the QMS processes, and how does management evalute the  effectivness of these actions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(33, 11, 1, 'How are the actions taken to address risks and oppertunities determined in relation to the potential impact of the non-conforming products or services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(34, 12, 1, 'Are your Quality Objectives maintained as documented information and, relevant to all functions, processes and levels of the organization ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(35, 12, 3, 'Are your Quality Objectives measurable and consistent with the Quality Policy?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(36, 13, 1, 'How are your Quality Objectives measured, monitered communicated within the organization,  and updated?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(37, 13, 1, 'How does the organization determine:when activities are to be completed, what will be done, what resources are to be used, and how results will be evaluated for quality objectives?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(38, 14, 1, 'How are changes to the QMS planned and exsicuted?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(39, 14, 1, 'Have the potential risks and oppetunities for improvement associated with changes to the QMS been identified and documented?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(40, 14, 1, 'How does the organization determin the integrity of the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(41, 14, 1, 'How are  resources sourced, monitored and made available to the organization?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(42, 14, 1, 'How are responsibilities and autority allocated and relocated within the organization?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(43, 15, 1, 'How are resources determined for the establishment, implementation, maintenance and continual improvement of the QMS; while considering limitations on internal and external resources?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(44, 16, 3, 'Are adequate human resources in place to ensure compliance with customer requirements and applicable statutory and regulatory requierments; both locally and internationally?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(45, 17, 1, 'How do you determine the infrastructure needed for effective operation of processes related to the QMS, such as: Maintenance of equipment, Buildings and associated utilities, Transportation, and Information and Communication Technology ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(46, 18, 1, 'How does the organization determine and manage the work environment needed to achieve conformity to the product and service requirements of the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(47, 19, 1, 'Has the organization determined the monitoring and measurement activities to be undertaken, and the resources needed to ensure conformity to predefined requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(48, 19, 1, 'How do you determine the validity, reliablity and suitablilty of the resources provided for monitoring and measurment activities, including: Ensuring suitablity of resources, maintainace of resources to ensure fitness for purpose, and the maintainance of documented information as evidence of fitness?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(49, 19, 3, 'Have all monitoring and measurment activities been determined?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(50, 19, 3, 'Are resources used for monitoring and measuring suitability maintained?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(51, 19, 1, 'What documented information is maintained as evidence of fitness for the monitoring and\nmeasuring of resources?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(52, 19, 1, 'How Is measurment equipment calibrated or verified: at specified intervals, against national or international measurement standards (or any other means by which the basis for calibration or verification shall be defined)?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(53, 19, 1, 'How is measuring equipment identified to determine:  Its calibration status; How they are safeguarded from adjustments; and safeguarding against damage and deterioration, during handling, maintenance and storage?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(54, 19, 1, 'How do you demonstrate the validity of previously measured results, when measurment equipment is found to not conform to requirements, and what action is taken on the affected equipment?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(56, 20, 1, 'What evidence is available to ensure that the organization has determined the knowledge necessary for effective operation of its processes?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(57, 20, 1, 'How do you detrmine  and maintain the necessary knowledge for the operation of the various processes, and are they available, if needed?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(58, 20, 1, 'How do you consider current knowledge and how do you acquire additional knowledge when addressing changing needs and trends?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(60, 21, 3, 'Have the necessary competence for personnel, been determined, and appropriate documented information for education, training, skills and experience been maintained?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(61, 21, 1, 'How do you determine competence on the basis of appropriate education, training or experience?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(62, 21, 1, 'How do you take actions to acquire necessary competence where applicable, and how do you evaluate the effectiveness of those actions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(63, 21, 3, 'Are Personnel aware of the relevance and importance of their activities and how they contribute to the achievement of the organization\'s quality objectives?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL),
(64, 21, 1, 'Is documented information  maintained on competency and achievements in education, training, skills and experience?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(65, 22, 3, 'Have the Quality Policy and Quality Objectives been communicated within the organization, and the contributions to the effectiveness; benefits of quality and performance, and; the Implications of non-conformance with the QMS, been understood?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL),
(66, 23, 1, 'How do you determine internal and external communications that are relevant to the QMS, along with: the Subject of Communication; When and how to communicate, and; With whom/who to communicate?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(67, 23, 3, 'Is Leadership able to demonstrate how they ensure that appropriate communication processes are established within the organization, and that communication takes place regarding the effectiveness of the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(68, 24, 3, 'Does the organization’s QMS include documented information required by the ISO 9001 standard and Documented information determined to be necessary for the effectiveness the QMS, by the organization ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(69, 25, 1, 'Is documented information properly identified  (e.g. title, date, author or reference) , and discribed in it\'s respective media format (language, software version, graphics)?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(70, 26, 1, 'How is documented information reviewed and approved for suitability and adequacy?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(71, 27, 3, 'Is documented information controlled and protected to ensure Its suitability and availability for use?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(72, 28, 1, 'How do you control Documented Information in order to address: Distribution, control, access, retrieval and use; Storage and preservation and including legibility; and Control of changes (version control); Retention and disposition?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(73, 28, 1, 'How do you identify and control Documented Information of external origin which you have determined as necessary fo the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(74, 29, 1, 'How are the consequences of unintended changes controlled, and how are actions taken to mitigate their adverse effects?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(75, 29, 3, 'Are adequate actions in place to ensure effective planning, implementation and control of the processes, including, the methods needed to ensure:\n• Adequate identification of requirements for products andservices?\n• Establishment of criteria for products and services?\n• Determination of neededresources?\n• Implementation of the processes in accordance with the notedcriteria?\n• Retention of documented information to show process effectiveness, and to demonstrate conformity of products and services to requirements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(77, 30, 3, 'Has the organization considered what information is communicated to customers in regards to products and services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(78, 30, 3, 'Has the organization implemented a system for monitoring customer feedback as it relates to product and/or services including complaints?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(79, 30, 3, 'Does the organization have a system in place regarding the handling and control of customer property?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(80, 30, 3, 'Has the organization considered establishing specific requirements for contingency action when it is necessary?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(81, 31, 3, 'Has the organization considered all regulatory and statutory requirments as well as those determined by the organiztion when determining the requirements for products and services being offered to customers?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(82, 31, 3, 'Has the organization considered its ability to meet its claims for the products and/or services being offered?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(83, 32, 3, 'Has the organization considered its ability to consistently meet the requirements specified by customers as well as it\'s ability to meet the requirements for delivery and post delivery activities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(84, 32, 1, 'Has the organization also considered it\'s ability to meet those requiremets which are not stated by the customer but are necessary for the specified or intended use when known?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(85, 32, 1, 'Has the organization considered its ability to meet its own specified requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(86, 32, 1, 'Has the organization considered its ability to meet statutory and regulatory requirements where applicable to products and services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(87, 32, 1, 'Has the organization considered it ability to meet any other additional requirements that may be needed for products and services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(88, 32, 1, 'Has the organization established a process for reviewing requirements specified by customers?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(89, 32, 1, 'Has the organization considered all requirements which may not have been stated by the customer but is necessary for use?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(90, 32, 3, 'Has the organization established a process for identifying all applicable statutory and regulatory requirements for the products or services ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(91, 32, 3, 'Does the organization have a process in place for handling order changes?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(92, 32, 3, 'Does the organization have a process in place for reviewing customer orders before accepting same?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(93, 32, 3, 'Does the organization maintain documented information for order reviews and handling order changes?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(94, 32, 3, 'Does the organization review requirements to the product before committing to providing same to customers?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(95, 32, 3, 'Does the review activity carried out by th organization ensure that product requirements are defined?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(96, 32, 3, 'Does the review activity carried out by the organization ensure that contract or order requirements differing from those previously expressed are resolved?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(97, 32, 3, 'Does the review activity carried out by the organization ensure that it has the capacity or ability to meet defined requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(98, 32, 1, 'How does the organization demonstrate that it confirms customer requirements when no documented statement of requirement is provided by the customer?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(99, 33, 1, 'How does the organization ensure that relevant documented information is amemded, and that relevant persons are made aware of the changed requirements, when the requirements for products and serviecs have been changed?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(101, 34, 3, 'Is evidence available that the organization plans and controls the design and development of products and services, considering the nature,duration and complexity of the design activities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(102, 34, 3, 'Does the organization determine the following during the design and development planning stage: The review, verification and validation appropriate to each design and development stage', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(103, 34, 3, 'Has the organization considered the responsibilities and authorities for design and devlopment?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(104, 34, 3, 'Are the interfaces between different groups involved in design and development managed to ensure effective communication and clear assignment of responsibility, involvement of customer and/or user groups.', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(105, 34, 3, 'Does the organization maintain documented information to demonstrate that the design and development\nrequirements have been met?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(106, 35, 3, 'Are inputs relating to product requirements determined and documented information maintained relating to:\n•  Functional and performancerequirements?\n•  Applicable statutory and regulatory requirements?\n•  Applicable information from previous similar designs?\n•  Other requirements essential for designand development?\n•  Level of control by customers and other relevant interestedparties.\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(107, 35, 3, 'Does the organization have evidence to indicate that design and development inputs have been reviewed for adequacy; and that requirements are unambiguous and not in conflict with each other?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(108, 37, 3, 'Does the organization have controls in place to ensure that the results to be achieved are clearly defined; Design and development reviews are planned and conducted; verification activities are conducted to ensure all inputs are met?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(109, 37, 3, 'Does the organization have a validation process to ensure suitability for intended use?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(110, 37, 1, 'Does the organization conduct a verification process to ensure that design and development outputs have satisfied the design and development input requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(111, 37, 3, 'Is design and development validation conducted to ensure that the resulting product is capable of fulfilling the requirements for the specified or known intended use or application?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(112, 39, 3, 'Does the organization have controls in place to ensure: Input requirements have been met; outputs are adequate for the subsequent processes of the provision of products and services; identification of monitoring and measuring requirements, and the acceptance criteria; design products are fit for intended purpose and their safe and proper use?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(113, 40, 3, 'Does the organization maintain documented information for the design and development activities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(114, 40, 3, 'Does the organization ensure that the design and development changes are: controlled during and after the design and development process; identified, reviewed, verified and validated as appropriate; evaluated for effect on constituent parts and delivered products; approved before implementation?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(115, 40, 3, 'Does the organization consider design and development changes to ensure that it does not have an adverse impact on conformity to requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(116, 40, 3, 'Does the organization maintain documented information on results of changes and any necessary actions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(117, 42, 1, 'What processes exist to ensure that externally provided processes, products and services conform to specified purchase requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(118, 42, 1, 'Are the requirements in 8.4.2 applied to all suppliers who: Provide products for incorporation in the products; Provide products directly to thecustomers; Provide full or partial outsourced processto the organization.', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(119, 42, 3, 'Are external providers evaluated and selected; monitored for performance and re-evaluated based upon their ability to supply product in accordance with the organization requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(120, 42, 3, 'Is documented information of the results of supplier evaluations and any necessary actions arising from evaluations maintained?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(121, 43, 1, 'Does the external provider monitoring process take into consideration: The type and extent of controls to be applied; The potential impact of the externally provided processes, products and services on the ability to meet applicable statutory and regulatory requirements; ', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(122, 43, 1, 'Does the external provider monitoring process take into consideration the perceived effectiveness of the controls applied by the external provider?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(123, 43, 1, 'Have the necessary verification processes been implemented to ensure that externally provided processes, products and services do not adversely affect the organization’s ability to meet customer\nrequirements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(124, 43, 1, 'Does the controls of outsourced processess and functions remain within the scope of the organization\'s QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(125, 43, 1, 'Is documented information maintained as a result of evaluation, monitoring and re-evaluation\nof external providers?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(126, 43, 3, 'Have inspections or other activities necessary for ensuring that purchased product meets specified purchase requirements been established and implemented?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(127, 44, 3, 'Does the organization ensure communication is provided to external providers concerning: Products and services to be provided or provided on behalf of the organization; Approval of products and services, methods, processes or equipment; Competence of personnel, including needed qualification; Interactions with the organization’s QMS; Control and monitoring of the external provider’sperformance ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(128, 44, 3, 'Does the organization ensure communication is provided to external providers concerning Notification of verification activities to be conducted by the organization at the external provider’spremises', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(129, 44, 3, 'Is the adequacy of specified purchase requirements ensured prior to their communication to the supplier', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(130, 46, 1, 'Are production and service operations carried out under controlled conditions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(131, 46, 1, 'What evidence does the organization have to demonstrate production and service operate under controlled conditions? Controlled conditions shall include as applicable the following: The availability of information that describes the characteristics of the product; The availability of the required documented information;  The use of suitable equipment; The availability and use of monitoring and measurement resources; The implementation of monitoring and measurement; The implementation of release, delivery and post-delivery activities; The competency requirements or qualification of personnel; The implementation of products and services release, delivery and post-delivery activities.', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(132, 46, 3, 'Can it be demonstrated that measurement and monitoring of the product is carried out at various stages of the product realization process in accordance with planned arrangements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(133, 46, 1, 'Are production and service processes validated, and periodically revalidated, where the resulting output cannot be verified by subsequent monitoring or measurement?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(134, 48, 1, 'Are process outputs identified, as appropriate, by suitable means throughout the product/service\nrealization process?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(135, 48, 1, 'Is product status identified with respect to measuring and monitoring requirements\nthroughout product realization?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(136, 48, 1, 'Is traceability a specified requirement? If so, is unique identification of the product outputs\ncontrolled and documented information maintained to ensure adequatetraceability?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(137, 49, 1, 'Is customer property provided for the use or incorporation into the product under the control or use of the organization? If so, does a process exist which ensures that care is provided for\ncustomer or external provider property?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(138, 49, 1, 'Is the organization reporting to the customer or external provider, when their property is incorrectly used, lost, damaged or otherwise found to be unsuitable for use?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(139, 49, 1, 'How does the organization demonstrate that customer property is identified; verified; protected and safeguarded?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(140, 50, 1, 'How does the organization demonstrate that product and constituent part to the product  are preserved during internal processing and delivery to the intended destination in order to maintain conformity to requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(141, 50, 1, 'As applicable, are product preservation methods established, as appropriate,for:                                              • Identification?\n• Handling?\n• Packaging?\n• Storage?\n• Protection\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(142, 51, 3, 'Is the organization meeting requirements for post- delivery activities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(143, 51, 1, 'With respect to post-delivery activities does the organization condsider the following:                                                                       •The risks associated with its products and services                                                                                                                                         • Customer requirements\n•  The nature, use and intended  lifetime of the products and services\n• Customer feedback\n• Statutory and regulatory requirements\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(144, 52, 3, 'Are documented information maintained describing the results of the review of the changes, the personnel authorizing the change, and the necessary actions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(145, 53, 1, 'Are planned arrangements in place to ensure achievement of the product and service\nrequirements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(146, 54, 3, 'Are documented information maintained as evidence of conformity with the acceptance\ncriteria and traceability to the person(s) authorizing release?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(147, 53, 1, 'Are controls in place to ensure that release of product and delivery of service to the customer do not proceed until all planned arrangements are satisfactorily completed? ', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(148, 54, 3, 'Does the organization maintain documented information to identify the person authorizing the\nrelease?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(149, 56, 3, 'Are products and services that do not conform to the requirements, identified and controlled to prevent their\nunintended use or delivery?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(150, 56, 1, 'Has the organization taken appropriate actions in addressing non conformities detected based on its nature and the impact it has on conformity of products and services? (This also applies to non conforming products and services detected after delivery of products, during or after the provision of services) ', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(151, 56, 1, 'In addressing non conformities detected, does the organization utelize any of the methods:                                                    • Correction\n• Segregation, containment\n• Informing the customer\n• Obtaining authorization for use “as-is”, continuation or acceptance under concession.\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(152, 56, 1, 'Does the organization maintain documented information that: Describes the nonconformity; describes the actions taken; describes concessions obtained; and identifies the authority deciding the action in respect of the nonconformity?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(153, 56, 1, 'Are corrected nonconforming products and services verified for compliance after rework?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(156, 57, 3, 'Has the organization identified                                                                                                                                                          • What has to be monitored\n• The methods for monitoring, measurement, analysis, evaluation\n• When the monitoring is to be performed\n• When the results are to be analyzed.\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(157, 57, 3, 'Does the organization maintain documented information to ensure that the monitoring and measurement activities are implemented in accordance with the above\nrequirements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(158, 57, 3, 'Does this evaluation include review of the quality performance data to ensure effectiveness of the\nquality management system?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(159, 58, 3, 'Is information relating to customer perception to whether the organization has fulfilled customer requirements monitored?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(160, 58, 3, 'Is information obtained related to customer views and opinions of the organization and its products and services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(161, 58, 3, 'Is the method for obtaining and using the customer satisfaction information determined?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(162, 59, 1, 'Does the organization analyze and evaluate the data arising from monitoring and measurement?\nactivities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(163, 59, 1, 'Is the organization using the sources of data to:\n• Demonstrate conformity of products and services to requirements?\n• Assess and enhance customer satisfaction?\n• Ensure conformity of effectiveness of the quality managementsystem?\n• Demonstrate that planning has been successfully implemented?\n• Assess the performance ofprocesses?\n• Assess the performance of external providers?\n• Determine the need or opportunities for improvement within the quality management system', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(164, 59, 3, 'Are the results of the above analysis provided as input to management review?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(166, 60, 3, 'Is evidence available to confirm that internal audits are conducted at planned intervals based upon:\n•  The status and importance of the processes and areas to be audited?\n• The results of previous audits?\n• Customer feedback?\n• Changes impacting the organization?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(167, 60, 3, 'Does the internal quality audit activity determine whether the quality management system:\n•  Conforms to planned arrangements?\n•  Conforms to ISO 9001:2015?\n•  Conforms to quality management system requirements established by the organization?\n• Is effectively implemented and maintained?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(168, 61, 3, 'Have audit criteria, scope, frequency and methods been defined?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(169, 61, 1, 'Is evidence available to confirm that internal auditors do not audit their own work, and are\nobjective and impartial of the audit process?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(170, 61, 1, 'Does the management responsible for the area being audited ensure that any necessary corrections and corrective actions are taken without undue delay to eliminate detected\nnonconformities and their causes?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(171, 61, 3, 'Are documented information maintained as evidence of the implementation of the audit?\nprogram and the audit results?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(173, 62, 1, 'Does top management review the quality management system at planned intervals to\nensure its continuing suitability, adequacy and effectiveness?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(174, 62, 1, 'Does management review evaluate the need for changes to the quality management system, including the quality policy and quality objectives?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(175, 62, 3, 'Is documented information maintained as the result of management reviews?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(176, 63, 1, 'Do the inputs to management review include information on the following (including quality indicators (if any):\n• Results of audits\n• Customer Satisfaction\n• Nonconformities and Corrective Actions\n• Monitoring and measurement results\n• Issues concerning external providers and other relevant interested parties\n• Adequacy of resources\n• Process performance and conformity of products andservices\n• Effectiveness of actions taken to address risks and opportunities.\n• Performance of external suppliers.\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(177, 64, 1, 'Do the outputs from management review include decisions and actions related to:\n• Improvement of the effectiveness of the quality management system and itsprocesses?\n• Improvement of product related to customer requirements?\n•Resource needs?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(178, 64, 3, 'Does the organization maintain documented information as evidence of management reviews?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(179, 64, 3, ' Does management review evaluate the need for changes to the quality management system, including the quality policy and quality objectives?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(180, 66, 1, 'Is the organization selecting opportunities for improvement and implementing necessary actions to meet customer requirements?', 1, '', 2, 1, '2019-12-18 03:07:48', 18),
(181, 66, 1, 'Is the organization taking actions to prevent nonconformities, improve products and services, and improve the overall quality management system results?', 1, '', 1, 1, '2020-02-22 20:05:15', 18),
(182, 67, 1, 'In the presence of a nonconformity, does the organization\n• React to the nonconformity by taking actions to control and correct it, and dealing with its consequences\n• Evaluate the need for action to eliminate the cause                                                                                                                    • Implement any action needed\n• Review the effective of any corrective action?\n• Make change to the quality management system?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(183, 68, 3, 'Is documented information maintained to show the nature of the nonconformity and any subsequent actions taken, and the results of any corrective action taken?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(184, 68, 1, 'In the presence of a nonconformity, does the organization react to the nonconformity by taking actions to control and correct it, and dealing with its consequences?', 1, '', 2, 1, '2019-12-18 03:08:53', 18),
(185, 68, 1, 'Are the actions taken appropriate to the effects, or potential effects of the nonconformity?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL),
(186, 68, 3, 'Are the corrective actions taken appropriate to the effects of the nonconformities encountered?', 1, '', 1, 1, '2019-12-18 03:08:44', 18),
(187, 68, 3, 'Is action taken to eliminate the causes of nonconformities in order to prevent recurrence?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(188, 69, 1, 'Is the organization continually improving the suitability, adequacy and effectiveness of the quality management system?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(189, 69, 1, 'Are the outputs of analysis and evaluation, and the outputs from the management review process used to identify the areas of underperformances?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(190, 69, 1, 'Are specialized tools and methodologies used for investigation of the causes of underperformance?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(191, 69, 1, 'How does the organization demonstrate that the effectiveness of the quality management system is being\ncontinually improved?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL),
(192, 70, 2, 'This is a test question', 1, '', 1, 1, '2019-12-18 01:20:57', 18),
(193, 71, 1, 'Is your company in Jamaica?', 1, '', 1, 1, '2020-02-27 19:18:34', 18),
(194, 71, 1, 'Where will you give the services?', 1, '', 1, 1, '2020-02-27 19:19:09', 18),
(195, 72, 1, 'How much money can you invest?', 1, '', 1, 1, '2020-02-27 19:19:33', 18);

-- --------------------------------------------------------

--
-- Table structure for table `question_option`
--

DROP TABLE IF EXISTS `question_option`;
CREATE TABLE IF NOT EXISTS `question_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_id` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `question_option`
--

INSERT INTO `question_option` (`id`, `question_id`, `option_desc`) VALUES
(1, 2, 'yes'),
(2, 2, 'no'),
(3, 181, ''),
(4, 193, ''),
(5, 194, ''),
(6, 195, '');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `standard`
--

INSERT INTO `standard` (`id`, `code`, `name`, `active`) VALUES
(1, 'ISO9001', 'ISO 9001', 1),
(2, '2', 'Certification 2', 1),
(3, 'STA1', 'Standard 1', 1),
(5, 'NEEDS', 'Registration of Company', 1);

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

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
  `phase_id` int(11) NOT NULL DEFAULT '1',
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_clause`
--

INSERT INTO `sub_clause` (`id`, `clause_id`, `phase_id`, `code`, `name`, `active`) VALUES
(1, 4, 1, '4.1', 'Understanding the organization and its context', 1),
(2, 4, 1, '4.2', 'Understanding the needs and expectations of interested parties', 1),
(3, 4, 2, '4.3', 'Determining the scope of the Quality Management System', 1),
(4, 4, 2, '4.4', 'Quality Management System and its processes', 1),
(5, 5, 2, '5.1.1', 'Leadership', 1),
(6, 5, 3, '5.1.2', 'Customer Focus ', 1),
(7, 5, 2, '5.2.1', 'Quality Policy', 1),
(8, 5, 2, '5.2.2', 'Quality Policy', 1),
(9, 5, 3, '5.3', 'Organizational roles, responsibilities and authorities', 1),
(10, 6, 4, '6.1', 'Actions to address risks and opportunities', 1),
(11, 6, 4, '6.1.2', 'Actions to address risks and opportunities', 1),
(12, 6, 4, '6.2.1', 'Quality objectives and planning to achieve them', 1),
(13, 6, 4, '6.2.2', 'Quality objectives and planning to achieve them', 1),
(14, 6, 4, '6.3', 'Planning for changes', 1),
(15, 7, 4, '7.1.1', 'Resources', 1),
(16, 7, 4, '7.1.2', 'People', 1),
(17, 7, 4, '7.1.3', 'Infrastructure', 1),
(18, 7, 4, '7.1.4', 'Environment for the operation of processes', 1),
(19, 7, 4, '7.1.5', 'Monitoring and measuring resources', 1),
(20, 7, 4, '7.1.6', 'Organizational Knowledge', 1),
(21, 7, 4, '7.2', 'Competence', 1),
(22, 7, 4, '7.3', 'Awareness', 1),
(23, 7, 4, '7.4', 'Communication', 1),
(24, 7, 4, '7.5.1', 'Documneted Information', 1),
(25, 7, 4, '7.5.2', 'Documneted Information', 1),
(26, 7, 4, '7.5.3', 'Documneted Information', 1),
(27, 7, 4, '7.5.3.1', 'Documneted Information', 1),
(28, 7, 4, '7.5.3.2', 'Documneted Information', 1),
(29, 8, 4, '8.1', 'Operations', 1),
(30, 8, 4, '8.2.1', 'Customer Communication', 1),
(31, 8, 4, '8.2.2', 'Determining the requirement for products & Services', 1),
(32, 8, 4, '8.2.3', 'Review of the requirements for products and services', 1),
(33, 8, 4, '8.2.4', 'Review of the requirements for products and services', 1),
(34, 8, 4, '8.3.2', 'Design and development of products and services', 1),
(35, 8, 4, '8.3.3', 'Design and development of products and services', 1),
(36, 8, 4, '8.3.3', 'Design and development inputs', 1),
(37, 8, 4, '8.3.4', 'Design and development inputs', 1),
(38, 8, 4, '8.3.4', 'Design and development controls', 1),
(39, 8, 4, '8.3.5', 'Design and development controls', 1),
(40, 8, 4, '8.3.6', 'Design and development outputs', 1),
(41, 8, 4, '8.3.6', 'Design and Development changes', 1),
(42, 8, 4, '8.4.1', 'Control of externally provided processes, products and services', 1),
(43, 8, 4, '8.4.2', 'Type and extent of control', 1),
(44, 8, 4, '8.4.3', 'Type and extent of control', 1),
(45, 8, 4, '8.4.3', 'Information for external providers', 1),
(46, 8, 4, '8.5.1', 'Production and Service provision', 1),
(47, 8, 4, '8.5.1', 'Control of production and service provision', 1),
(48, 8, 4, '8.5.2', 'Identification and traceability', 1),
(49, 8, 4, '8.5.3', 'Property belonging to customers or external providers', 1),
(50, 8, 4, '8.5.4', 'Preservation', 1),
(51, 8, 4, '8.5.5', 'Post Delivery Activities', 1),
(52, 8, 4, '8.5.6', 'Post Delivery Activities', 1),
(53, 8, 4, '8.6', 'Control of Changes', 1),
(54, 8, 4, '8.6.', 'Release of products and services', 1),
(55, 8, 4, '8.6', 'Release of products and services', 1),
(56, 8, 4, '8.7', 'Control of Nonconforming outputs', 1),
(57, 9, 4, '9.1.1', 'Performance Evaluation', 1),
(58, 9, 4, '9.1.2', 'Customer satisfaction', 1),
(59, 9, 4, '9.1.3', 'Analysis and evaluation', 1),
(60, 9, 4, '9.2.1', 'Internal Audit', 1),
(61, 9, 4, '9.2.2', 'Internal Audit', 1),
(62, 9, 4, '9.3.1', 'Management Review', 1),
(63, 9, 4, '9.3.2', 'Management Review', 1),
(64, 9, 4, '9.3.3', 'Management Review inputs', 1),
(65, 9, 4, '9.3.3', 'Management Revew outputs', 1),
(66, 10, 4, '10.1', 'Improvement', 1),
(67, 10, 4, '10.2.1', 'Nonconformity and corrective action ', 1),
(68, 10, 4, '10.2.2', 'Nonconformity and corrective action ', 1),
(69, 10, 4, '10.3', 'Continual improvement', 1),
(70, 11, 1, '80.1', 'Here is the sub-clause for Standard 1', 1),
(71, 13, 6, 'N.1.1', 'Situation of the client', 1),
(72, 13, 6, 'N.1.2', 'Investiment', 1);

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
(23, 5, 'admin', '$2y$10$ZX.EHlOqIPmRWyrxP05zWuViAa1tq4lej3NnVRcsOsXh2SwF6nh8W', 'admin@hotmail.com', 'admin', '', NULL, 1, 18, '2019-12-18 20:08:01'),
(24, 5, 'bsjme', '$2y$10$LAzMxF3v4LDX3RNP8.RDo.9J5MPz2oilCkdByFkG6hMAAWY.mqpDm', 'bsjme@gmail.com', 'bsjme', '', NULL, 1, 18, '2019-12-09 23:43:02'),
(27, 4, 'TRN001', '$2y$10$isLhasHW6KpuaXnYwA4Jl.TvR2/bVgmbuqZDuW777iW0ZPvHAS07.', 'client@hotmail.com', 'Client security', '5149836594', NULL, 1, 23, '2019-12-22 00:57:53'),
(28, 2, 'coordinator', '$2y$10$c6A5etaespHgz.aZCk7Wm.3H8uC3.aCDfPhdK6YEr9YKkEomjbya.', 'coordinator@hotmail.com', 'Coordinator', '', NULL, 1, 23, '2019-12-18 20:04:18'),
(29, 3, 'consultant1', '$2y$10$OGQl0/pjeKdcuJXINJy/1urTVpircS/2KO5WLhuOU6YZOXT.En8Bq', 'consultant1@hotmail.com', 'Consultant 1', '123456789', NULL, 1, 23, '2019-12-18 20:07:50'),
(30, 3, 'consultant2', '$2y$10$8EjzOfJ7W9mAyq9jNEz1POGLENZX9excWKpl505iDzXbyQzeK1SkS', 'consultant2@hotmail.com', 'Consultant No 2', '', NULL, 1, 18, '2019-12-18 20:08:33'),
(31, 3, 'consultant3', '$2y$10$LNvKCbDAmYkBL93oQlZH1uC.k4Qje.xC8JFkOdSzzdvQaBM9ERUTK', 'consultant3@hotmail.com', 'Consultant No 3', '', NULL, 1, 18, '2019-12-18 20:09:11'),
(37, 4, 'TRN002', '$2y$10$i/66TmRPUoWoqSXOf9L2P.g4415vjzSZbZSUwgSeDTabRZlIyVKXm', 'voyagine@hotmail.com', 'M. Untel', 'phone', NULL, 1, 23, '2019-12-23 17:54:46'),
(38, 4, 'TRN003', '$2y$10$FnwBu5YX5GSpu5T0sXcNvulVbC7tBBglrCPteknl..B6eODAxoBIi', 'voyagine@hotmail.com', 'Client No 3', '05149836594', NULL, 1, 18, '2019-12-23 17:59:28'),
(39, 4, '123456789', '$2y$10$4lo56xMDEH4eWFX0Geo4quY.oU6fJE3Ssuw1Zol33vnU5lNm7IYRW', 'jumppnicholas1@gmail.com', 'Nicholas Jumpp', '1-876-788-9327', NULL, 1, 18, '2020-02-21 17:12:14'),
(41, 6, 'reader', '$2y$10$CWCkyvlwQNZqYhX/yzLsouJGPeM7GqWJy/4J5T.PYQlWGUr5Dqpy.', 'reader@hotmail.com', 'M. Reader', '5149836594', NULL, 1, 18, '2020-02-25 15:13:49');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `question_option`
--
ALTER TABLE `question_option`
  ADD CONSTRAINT `question_option_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
