-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 27 déc. 2019 à 17:11
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `bsjme`
--

-- --------------------------------------------------------

--
-- Structure de la table `answer`
--

DROP TABLE IF EXISTS `answer`;
CREATE TABLE IF NOT EXISTS `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `consultation_id` int(11) NOT NULL,
  `answer` text NOT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active 2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`, `active`) VALUES
(1, 'New member', 1);

-- --------------------------------------------------------

--
-- Structure de la table `city`
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
-- Déchargement des données de la table `city`
--

INSERT INTO `city` (`id`, `code`, `name`, `active`) VALUES
(1, 1, 'Kingston', 1);

-- --------------------------------------------------------

--
-- Structure de la table `clause`
--

DROP TABLE IF EXISTS `clause`;
CREATE TABLE IF NOT EXISTS `clause` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `standard_id` int(11) NOT NULL DEFAULT '1',
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `clause`
--

INSERT INTO `clause` (`id`, `standard_id`, `code`, `name`, `active`) VALUES
(4, 1, '4', 'clause 4', 1),
(5, 1, '5', 'clause 5', 1),
(6, 1, '6', 'clause 6', 1),
(7, 1, '7', 'clause 7', 1),
(8, 1, '8', 'clause 8', 1),
(9, 1, '9', 'clause 9', 1),
(10, 1, '10', 'clause 10', 1),
(11, 3, '80', 'Clause 80', 1);

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `trn` varchar(25) NOT NULL,
  `city_id` int(11) DEFAULT NULL,
  `county_id` int(11) NOT NULL,
  `parish_id` int(11) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `client_name` varchar(100) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `director_name` varchar(50) DEFAULT NULL,
  `directory` varchar(100) DEFAULT NULL,
  `district` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` varchar(100) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `postal_box` varchar(45) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `remark` text,
  `website` varchar(100) DEFAULT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_name` (`client_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id`, `trn`, `city_id`, `county_id`, `parish_id`, `address`, `client_name`, `company_name`, `director_name`, `directory`, `district`, `email`, `mobile`, `phone`, `postal_box`, `postal_code`, `remark`, `website`, `active`, `updated_date`, `updated_by`) VALUES
(6, 'TRN002', 1, 1, 1, '888 Street One', 'M. Untel', 'Company No 2', 'Director name', 'TRN002', 'district1', 'director@hotmail.com', '8765432', '12345678', 'H3C0G3', 'H3C0G3', 'remark', 'website', 1, '2019-12-04 19:53:23', 18),
(7, 'TRN003', 1, 1, 2, '777 Street', 'Client No 3', 'Company No 3', 'M. Untel', 'TRN003', '', 'untel@hotmail.com', '65656565', '05149836594', 'H3C0G3', 'H3C0G3', '', '', 1, '2019-12-10 17:13:44', 18),
(8, 'TRN001', 0, 1, 1, '999 Street 9', 'Mr Number One', 'Company No 1', 'M. Johnson', 'TRN001', '', 'johnson@hotmail.com', '', '05149836594', 'H3C0G3', 'H3C0G3', '', '', 1, '2019-12-23 00:32:45', 18),
(9, 'TRN004', 0, 1, 1, '666 Union Street', 'Number Four', 'Company No 4', 'M. Director', 'TRN004', '', 'number4@hotmail.com', '', '5149836594', 'H1G 5J5', 'H1G 5J5', '', '', 1, '2019-12-23 16:00:12', 18);

-- --------------------------------------------------------

--
-- Structure de la table `comment`
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
-- Structure de la table `consultation`
--

DROP TABLE IF EXISTS `consultation`;
CREATE TABLE IF NOT EXISTS `consultation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `consultation_no` varchar(25) NOT NULL,
  `clause_id` int(11) DEFAULT NULL,
  `client_id` int(11) NOT NULL,
  `consultant_id` text,
  `phase_id` int(11) NOT NULL,
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
  `remark` text,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `consultation`
--

INSERT INTO `consultation` (`id`, `consultation_no`, `clause_id`, `client_id`, `consultant_id`, `phase_id`, `sector_id`, `standard_id`, `status_id`, `board_meeting_time_period`, `business_process`, `date_begin`, `date_creation`, `date_end`, `description`, `exemption`, `management_review_time`, `remark`, `updated_date`, `updated_by`) VALUES
(6, '5678', 0, 6, '[\"29\",\"30\"]', 2, 4, 1, 13, '', '', NULL, '2019-12-03', NULL, 'Production of a manual for Exportation of coffee', '', '', '                                ', '2019-12-10 14:47:28', 18),
(7, '555', 0, 7, '[\"31\"]', 3, 4, 1, 14, '', '', NULL, '2019-12-18', NULL, 'Consultant for No 3', '', '', '', '2019-12-18 15:33:56', 18),
(10, 'CON001', 5, 8, '[\"29\",\"30\"]', 1, 1, 1, 11, '', '', NULL, '2019-12-22', NULL, 'Consultation no 1', '', '', '                                                                                                                                                                                                                ', '2019-12-23 00:33:28', 18),
(11, '12345', 4, 8, '[\"30\"]', 4, 1, 1, 11, '', '', NULL, '2019-12-24', NULL, 'Help for development', '', '', '                                                                    ', '2019-12-24 17:55:08', 18);

-- --------------------------------------------------------

--
-- Structure de la table `county`
--

DROP TABLE IF EXISTS `county`;
CREATE TABLE IF NOT EXISTS `county` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `county`
--

INSERT INTO `county` (`id`, `code`, `name`, `active`) VALUES
(1, 0, 'La Union', 1);

-- --------------------------------------------------------

--
-- Structure de la table `document`
--

DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) DEFAULT NULL,
  `consultation_id` int(11) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  `document_type_id` int(11) DEFAULT NULL,
  `doc_name` varchar(100) DEFAULT NULL,
  `doc_size` int(10) DEFAULT '0',
  `doc_type` varchar(30) DEFAULT NULL,
  `updated_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_by` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `intervention_no` (`consultation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `document`
--

INSERT INTO `document` (`id`, `client_id`, `consultation_id`, `post_id`, `document_type_id`, `doc_name`, `doc_size`, `doc_type`, `updated_date`, `updated_by`) VALUES
(40, 7, NULL, NULL, 1, 'Jamaica.pdf', 570, 'application/pdf', '2019-12-10 17:14:39', 18),
(43, 6, 6, NULL, 7, 'Sutton_Insurance_-_Wallet_ID_Card.pdf', 60, 'application/pdf', '2019-12-10 17:15:43', 18),
(44, 6, 6, NULL, 5, 'Sutton_Insurance_-_Accident_Benefit.pdf', 110, 'application/pdf', '2019-12-10 17:16:08', 18),
(45, 6, 6, NULL, 2, 'Jamaica.pdf', 570, 'application/pdf', '2019-12-10 18:18:58', 18),
(50, 6, 6, NULL, 3, 'montego_bay.jpg', 200, 'image/jpeg', '2019-12-11 14:55:09', 18),
(51, 6, NULL, NULL, 1, 'WBS_Orville.jpg', 1943, 'image/jpeg', '2019-12-12 20:50:41', 18);

-- --------------------------------------------------------

--
-- Structure de la table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
CREATE TABLE IF NOT EXISTS `document_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `document_type`
--

INSERT INTO `document_type` (`id`, `code`, `name`, `active`) VALUES
(1, 'DETAIL', 'Detail', 1),
(2, 'ANNUAL', 'Annual Report', 1),
(3, 'PLAN', 'Corporate Plan', 1),
(5, 'OTHER', 'Other', 1),
(6, 'POST', 'Post Documents', 1),
(7, 'FINANCE', 'Financial report', 1),
(8, 'CHART', 'Organizational Chart', 1),
(9, 'PROCESS', 'Process Inputs and Outputs', 1);

-- --------------------------------------------------------

--
-- Structure de la table `inquiry`
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `inquiry`
--

INSERT INTO `inquiry` (`id`, `client_id`, `inquiry_type_id`, `support_type_id`, `request`, `feedback`, `answered_by`, `inquiry_date`) VALUES
(4, 6, 1, 1, 'rrrx', 'fffx', 'carx', '2019-12-24'),
(5, 9, 1, 1, 'test', 'aaa', 'hh', '2019-12-24');

-- --------------------------------------------------------

--
-- Structure de la table `inquiry_type`
--

DROP TABLE IF EXISTS `inquiry_type`;
CREATE TABLE IF NOT EXISTS `inquiry_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `inquiry_type`
--

INSERT INTO `inquiry_type` (`id`, `code`, `name`, `active`) VALUES
(1, 'BEGINNER', 'Beginning the process', 1);

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`version`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `parish`
--

DROP TABLE IF EXISTS `parish`;
CREATE TABLE IF NOT EXISTS `parish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `parish`
--

INSERT INTO `parish` (`id`, `code`, `name`, `active`) VALUES
(1, 0, 'Kingston', 1),
(2, 2, 'Westmoreland', 1);

-- --------------------------------------------------------

--
-- Structure de la table `phase`
--

DROP TABLE IF EXISTS `phase`;
CREATE TABLE IF NOT EXISTS `phase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `phase`
--

INSERT INTO `phase` (`id`, `code`, `name`, `active`) VALUES
(1, '1', 'Phase 1', 1),
(2, '2', 'Phase 2', 1),
(3, '3', 'Phase 3', 1),
(4, '4', 'Phase 4', 1);

-- --------------------------------------------------------

--
-- Structure de la table `post`
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `post`
--

INSERT INTO `post` (`id`, `category_id`, `date_from`, `date_to`, `doc_type`, `post_title`, `post_slug`, `post_text`, `post_image`, `posted_by`, `client_visibility`, `active`, `updated_date`, `updated_by`) VALUES
(1, 1, '2019-09-30', '2020-03-28', 'image/jpeg', 'Welcome to new clients!', 'Welcome-to-new-clients', '<p>Welcome to the database for clients.</p>', 'logo.jpg', 'Carmen Gagnon', 1, 1, '2019-09-30 13:39:40', 18),
(4, 1, '2019-11-28', '2020-01-17', 'application/vnd.openxmlformats', 'Message for new members', 'Message-for-new-members', '<p>Here is the message</p>', 'Client_Servicing_Programme_-_WBS_Dictionary.docx', 'Carmen Gagnon', 1, 1, '2019-11-28 19:13:15', 18),
(5, 1, '2019-11-28', '2020-01-17', 'application/pdf', 'Message No 4', 'Message-No-4', '<p>Message no 4 here ius the text</p>', 'Client_Services_Network_Diagram1.pdf', 'Carmen Gagnon', 1, 1, '2019-11-28 19:14:13', 18),
(6, 1, '2019-12-02', '2019-12-27', 'image/gif', 'Visit in BSJ', 'Visit-in-BSJ', '<p>Free zone to write the post.</p>', 'vacance-gif-042.gif', 'Carmen Gagnon', 2, 1, '2019-12-02 20:37:26', 18);

-- --------------------------------------------------------

--
-- Structure de la table `profile`
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
-- Déchargement des données de la table `profile`
--

INSERT INTO `profile` (`id`, `name`, `permission`, `protected`) VALUES
(1, 'Super Admin', 'a:36:{i:0;s:10:\"createUser\";i:1;s:10:\"updateUser\";i:2;s:8:\"viewUser\";i:3;s:10:\"deleteUser\";i:4;s:11:\"createGroup\";i:5;s:11:\"updateGroup\";i:6;s:9:\"viewGroup\";i:7;s:11:\"deleteGroup\";i:8;s:11:\"createBrand\";i:9;s:11:\"updateBrand\";i:10;s:9:\"viewBrand\";i:11;s:11:\"deleteBrand\";i:12;s:14:\"createCategory\";i:13;s:14:\"updateCategory\";i:14;s:12:\"viewCategory\";i:15;s:14:\"deleteCategory\";i:16;s:11:\"createStore\";i:17;s:11:\"updateStore\";i:18;s:9:\"viewStore\";i:19;s:11:\"deleteStore\";i:20;s:15:\"createAttribute\";i:21;s:15:\"updateAttribute\";i:22;s:13:\"viewAttribute\";i:23;s:15:\"deleteAttribute\";i:24;s:13:\"createProduct\";i:25;s:13:\"updateProduct\";i:26;s:11:\"viewProduct\";i:27;s:13:\"deleteProduct\";i:28;s:11:\"createOrder\";i:29;s:11:\"updateOrder\";i:30;s:9:\"viewOrder\";i:31;s:11:\"deleteOrder\";i:32;s:11:\"viewReports\";i:33;s:13:\"updateCompany\";i:34;s:11:\"viewProfile\";i:35;s:13:\"updateSetting\";}', 1),
(2, 'Coordinator', 'a:87:{i:0;s:12:\"createClient\";i:1;s:12:\"updateClient\";i:2;s:10:\"viewClient\";i:3;s:12:\"deleteClient\";i:4;s:18:\"createConsultation\";i:5;s:18:\"updateConsultation\";i:6;s:16:\"viewConsultation\";i:7;s:18:\"deleteConsultation\";i:8;s:11:\"createPhase\";i:9;s:11:\"updatePhase\";i:10;s:9:\"viewPhase\";i:11;s:11:\"deletePhase\";i:12;s:12:\"createStatus\";i:13;s:12:\"updateStatus\";i:14;s:10:\"viewStatus\";i:15;s:12:\"deleteStatus\";i:16;s:12:\"createSector\";i:17;s:12:\"updateSector\";i:18;s:10:\"viewSector\";i:19;s:12:\"deleteSector\";i:20;s:14:\"createDocument\";i:21;s:14:\"updateDocument\";i:22;s:12:\"viewDocument\";i:23;s:14:\"deleteDocument\";i:24;s:18:\"createDocumentType\";i:25;s:18:\"updateDocumentType\";i:26;s:16:\"viewDocumentType\";i:27;s:18:\"deleteDocumentType\";i:28;s:14:\"createStandard\";i:29;s:14:\"updateStandard\";i:30;s:12:\"viewStandard\";i:31;s:14:\"deleteStandard\";i:32;s:12:\"createClause\";i:33;s:12:\"updateClause\";i:34;s:10:\"viewClause\";i:35;s:12:\"deleteClause\";i:36;s:15:\"createSubClause\";i:37;s:15:\"updateSubClause\";i:38;s:13:\"viewSubClause\";i:39;s:15:\"deleteSubClause\";i:40;s:14:\"createQuestion\";i:41;s:14:\"updateQuestion\";i:42;s:12:\"viewQuestion\";i:43;s:14:\"deleteQuestion\";i:44;s:12:\"createManual\";i:45;s:12:\"updateManual\";i:46;s:10:\"viewManual\";i:47;s:12:\"deleteManual\";i:48;s:12:\"createCounty\";i:49;s:12:\"updateCounty\";i:50;s:10:\"viewCounty\";i:51;s:12:\"deleteCounty\";i:52;s:12:\"createParish\";i:53;s:12:\"updateParish\";i:54;s:10:\"viewParish\";i:55;s:12:\"deleteParish\";i:56;s:10:\"createCity\";i:57;s:10:\"updateCity\";i:58;s:8:\"viewCity\";i:59;s:10:\"deleteCity\";i:60;s:10:\"createPost\";i:61;s:10:\"updatePost\";i:62;s:8:\"viewPost\";i:63;s:10:\"deletePost\";i:64;s:14:\"createCategory\";i:65;s:14:\"updateCategory\";i:66;s:12:\"viewCategory\";i:67;s:14:\"deleteCategory\";i:68;s:13:\"createInquiry\";i:69;s:13:\"updateInquiry\";i:70;s:11:\"viewInquiry\";i:71;s:13:\"deleteInquiry\";i:72;s:17:\"createInquiryType\";i:73;s:17:\"updateInquiryType\";i:74;s:15:\"viewInquiryType\";i:75;s:17:\"deleteInquiryType\";i:76;s:17:\"createSupportType\";i:77;s:17:\"updateSupportType\";i:78;s:15:\"viewSupportType\";i:79;s:17:\"deleteSupportType\";i:80;s:13:\"viewDashboard\";i:81;s:8:\"viewNews\";i:82;s:10:\"viewReport\";i:83;s:17:\"viewDocumentation\";i:84;s:10:\"viewMyUser\";i:85;s:20:\"viewSearchConsultant\";i:86;s:13:\"updateSetting\";}', 1),
(3, 'Consultant', 'a:13:{i:0;s:10:\"viewClient\";i:1;s:16:\"viewConsultation\";i:2;s:12:\"viewDocument\";i:3;s:8:\"viewPost\";i:4;s:13:\"createInquiry\";i:5;s:13:\"updateInquiry\";i:6;s:11:\"viewInquiry\";i:7;s:13:\"deleteInquiry\";i:8;s:13:\"viewDashboard\";i:9;s:8:\"viewNews\";i:10;s:10:\"viewReport\";i:11;s:17:\"viewDocumentation\";i:12;s:10:\"viewMyUser\";}', 1),
(4, 'Client', 'a:10:{i:0;s:12:\"updateClient\";i:1;s:10:\"viewClient\";i:2;s:18:\"createConsultation\";i:3;s:18:\"updateConsultation\";i:4;s:16:\"viewConsultation\";i:5;s:8:\"viewPost\";i:6;s:13:\"viewDashboard\";i:7;s:8:\"viewNews\";i:8;s:17:\"viewDocumentation\";i:9;s:10:\"viewMyUser\";}', 1),
(5, 'Admin', 'a:96:{i:0;s:12:\"createClient\";i:1;s:12:\"updateClient\";i:2;s:10:\"viewClient\";i:3;s:12:\"deleteClient\";i:4;s:18:\"createConsultation\";i:5;s:18:\"updateConsultation\";i:6;s:16:\"viewConsultation\";i:7;s:18:\"deleteConsultation\";i:8;s:11:\"createPhase\";i:9;s:11:\"updatePhase\";i:10;s:9:\"viewPhase\";i:11;s:11:\"deletePhase\";i:12;s:12:\"createStatus\";i:13;s:12:\"updateStatus\";i:14;s:10:\"viewStatus\";i:15;s:12:\"deleteStatus\";i:16;s:12:\"createSector\";i:17;s:12:\"updateSector\";i:18;s:10:\"viewSector\";i:19;s:12:\"deleteSector\";i:20;s:14:\"createDocument\";i:21;s:14:\"updateDocument\";i:22;s:12:\"viewDocument\";i:23;s:14:\"deleteDocument\";i:24;s:18:\"createDocumentType\";i:25;s:18:\"updateDocumentType\";i:26;s:16:\"viewDocumentType\";i:27;s:18:\"deleteDocumentType\";i:28;s:14:\"createStandard\";i:29;s:14:\"updateStandard\";i:30;s:12:\"viewStandard\";i:31;s:14:\"deleteStandard\";i:32;s:12:\"createClause\";i:33;s:12:\"updateClause\";i:34;s:10:\"viewClause\";i:35;s:12:\"deleteClause\";i:36;s:15:\"createSubClause\";i:37;s:15:\"updateSubClause\";i:38;s:13:\"viewSubClause\";i:39;s:15:\"deleteSubClause\";i:40;s:14:\"createQuestion\";i:41;s:14:\"updateQuestion\";i:42;s:12:\"viewQuestion\";i:43;s:14:\"deleteQuestion\";i:44;s:12:\"createManual\";i:45;s:12:\"updateManual\";i:46;s:10:\"viewManual\";i:47;s:12:\"deleteManual\";i:48;s:12:\"createCounty\";i:49;s:12:\"updateCounty\";i:50;s:10:\"viewCounty\";i:51;s:12:\"deleteCounty\";i:52;s:12:\"createParish\";i:53;s:12:\"updateParish\";i:54;s:10:\"viewParish\";i:55;s:12:\"deleteParish\";i:56;s:10:\"createCity\";i:57;s:10:\"updateCity\";i:58;s:8:\"viewCity\";i:59;s:10:\"deleteCity\";i:60;s:10:\"createPost\";i:61;s:10:\"updatePost\";i:62;s:8:\"viewPost\";i:63;s:10:\"deletePost\";i:64;s:14:\"createCategory\";i:65;s:14:\"updateCategory\";i:66;s:12:\"viewCategory\";i:67;s:14:\"deleteCategory\";i:68;s:13:\"createInquiry\";i:69;s:13:\"updateInquiry\";i:70;s:11:\"viewInquiry\";i:71;s:13:\"deleteInquiry\";i:72;s:17:\"createInquiryType\";i:73;s:17:\"updateInquiryType\";i:74;s:15:\"viewInquiryType\";i:75;s:17:\"deleteInquiryType\";i:76;s:17:\"createSupportType\";i:77;s:17:\"updateSupportType\";i:78;s:15:\"viewSupportType\";i:79;s:17:\"deleteSupportType\";i:80;s:13:\"viewDashboard\";i:81;s:8:\"viewNews\";i:82;s:10:\"viewReport\";i:83;s:17:\"viewDocumentation\";i:84;s:10:\"viewMyUser\";i:85;s:20:\"viewSearchConsultant\";i:86;s:10:\"createUser\";i:87;s:10:\"updateUser\";i:88;s:8:\"viewUser\";i:89;s:10:\"deleteUser\";i:90;s:13:\"createProfile\";i:91;s:13:\"updateProfile\";i:92;s:11:\"viewProfile\";i:93;s:13:\"deleteProfile\";i:94;s:12:\"updateSystem\";i:95;s:13:\"updateSetting\";}', 1);

-- --------------------------------------------------------

--
-- Structure de la table `qms`
--

DROP TABLE IF EXISTS `qms`;
CREATE TABLE IF NOT EXISTS `qms` (
  `id` int(11) NOT NULL,
  `certification` varchar(12) DEFAULT NULL,
  `phase` int(11) NOT NULL,
  `clause` int(11) NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `sub_clause` varchar(12) DEFAULT NULL,
  `question` varchar(4000) DEFAULT NULL,
  `input_format` varchar(12) DEFAULT NULL,
  `field_length` varchar(12) DEFAULT NULL,
  `upload` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `phase_index` (`phase`),
  KEY `clause_index` (`clause`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `qms`
--

INSERT INTO `qms` (`id`, `certification`, `phase`, `clause`, `heading`, `sub_clause`, `question`, `input_format`, `field_length`, `upload`) VALUES
(1, 'ISO 9001', 1, 4, 'Understanding the organization and its context', '4.1', 'Has the organization identified all external and internal issues relevant to its strategic plan ?', 'Boolean', NULL, NULL),
(2, 'ISO 9001', 1, 4, 'Understanding the organization and its context', '4.1', 'Has the organization established a process for monitor and review the external and internal issues that may affect the QMS?', 'Boolean', NULL, NULL),
(3, 'ISO 9001', 1, 4, 'Understanding the needs and expectations of interested parties', '4.2', 'Has the organization identified all relevant interested party and how their requierments may impact the operations of the organization?', 'Boolean', NULL, 'yes'),
(4, 'ISO 9001', 1, 4, 'Understanding the needs and expectations of interested parties', '4.2', 'How do you monitor and review the information about interested parties  and their requierments ?', 'String', 'Text Area', 'yes'),
(5, 'ISO 9001', 2, 4, 'Determining the scope of the Quality Management System', '4.3', 'Does the scope of the QMS, include products and services provided by the organization, and a justification for any exclusions?', 'Boolean', NULL, 'yes'),
(6, 'ISO 9001', 2, 4, 'Determining the scope of the Quality Management System', '4.3', 'Does the organization have the scope of the quality management system\nmaintained as documented information?', 'Boolean', NULL, 'yes'),
(7, 'ISO 9001', 2, 4, 'Determining the scope of the Quality Management System', '4.3', 'Have : The internal and external issues;The requirments of the relevant interested parties and; The products and services provided by the organization, been considered when determining the scope of the organization ?', 'Boolean', NULL, 'no*'),
(8, 'ISO 9001', 2, 4, 'Determining the scope of the Quality Management System', '4.3', 'Is there assurance that: All requirements of the standard that are applicable to the organization, have been applied, and that; Those requirments determined to be non- applicable, do not affect the organization’s ability to ensure conformity to the standard ?', 'String', 'Text Area', 'no'),
(9, 'ISO 9001', 2, 4, 'Quality Management System and its processes', '4.4', 'Have the processes of the organization been determined for the QMS?', 'Boolean', NULL, 'yes'),
(10, 'ISO 9001', 2, 4, 'Quality Management System and its processes', '4.4', 'What are the: Inputs and outputs; Sequence of interactions; Crieteria, Methods, Measurments and Key Performance Indicators; Resources needed; Defined responsibility and authority for all personnel; Risks and Opportunities; Method(s) for monitoring and change to ensure intended results, of these processes ?', 'String', 'Text Area', 'Yes'),
(11, 'ISO 9001', 2, 4, 'Quality Management System and its processes', '4.4', 'Has the organization defined; Documented information to support the operation of its processes and; Documented information to be retained as evidence that these processes are beingcarried out as planned?', 'Boolean', NULL, 'yes'),
(12, 'ISO 9001', 2, 5, ' Leadership', '5.1.1', 'Has top management demonstrated leadership by: Taking accountability of the effectivness of the QMS by establishing the Quality Policy and Quality Objectives and; ensuring that they are alligne with the organization\'s strategic objectives?', 'Boolean', NULL, 'yes'),
(13, 'ISO 9001', 2, 5, ' Leadership', '5.1.1', 'Has top management demonstrated leadership by communicating the Quality Policy and Quality Objectives within the organization, to ensure that the importance of meeting the requirements of the  QMS and customers is understood?', 'Boolean', NULL, 'no'),
(14, 'ISO 9001', 2, 5, ' Leadership', '5.1.1', 'Has top management demonstrated leadership by: Providing adequate resources; Engaging/directing/supporting process effectiveness to achieve required results; Conducting Management Reviews, and; Communicating QMS effectiveness.', 'Boolean', NULL, 'yes'),
(15, 'ISO 9001', 2, 5, ' Leadership', '5.1.1', 'Has top management demonstrated leadership by promoting continual improvement and supporting other management roles within the organization to do the same?', 'String', 'Text Area', 'no'),
(16, 'ISO 9001', 3, 5, 'Customer Focus ', '5.1.2', 'Has top management demonstrated leadership by: Identifying customer requirements, and ensuring adherance to regulatory and statutory requirements?', 'String', 'Text Area', 'no'),
(17, 'ISO 9001', 3, 5, 'Customer Focus ', '5.1.2', 'Has top management demonstrated leadership, by ensuring that Risks and Opportunities are determined and addressed?', 'String', 'Text Area', 'yes'),
(18, 'ISO 9001', 3, 5, 'Customer Focus ', '5.1.2', 'Has top management demonstrated leadership by: Putting focus on consistently providing products/services that meet customer requirements, and enhancing customer satisfaction?', 'String', 'Text Area', 'no'),
(19, 'ISO 9001', 2, 5, 'Quality Policy', '5.2.1', 'Has top management established, a Quality Policy that is appropriate to the context of your organization, and facilites the review and maintaince of the Quality Policy?', 'Boolean', NULL, 'yes'),
(20, 'ISO 9001', 2, 5, 'Quality Policy', '5.2.1', 'Has top management established, a Quality Policy that: Includes a commitment to satisfying applicable requirements, and includes a commitment to continual improvement?', 'Boolean', NULL, 'yes'),
(21, 'ISO 9001', 2, 5, 'Quality Policy', '5.2.1', 'Has top management established, a Quality Policy that is communicated and understood within the organization, and is continually reviewed for suitability?', 'Boolean', NULL, 'yes'),
(22, 'ISO 9001', 2, 5, 'Quality Policy', '5.2.1', 'Has top management established Quality Objectives that are measurable and consistent with the Quality Policy?', 'Boolean', NULL, 'yes'),
(23, 'ISO 9001', 2, 5, 'Quality Policy', '5.2.2', 'Has top management established, a Quality Policy that is documented, communicated and understood within the organization, and has been made available to the relevant interested parties?', 'String', 'Text Area', 'yes'),
(24, 'ISO 9001', 3, 5, 'Organizational roles, responsibilities and authorities', '5.3', 'How does top managemnt ensure that the responsibilities and authority for all personnelare defined and communicated within the ogranization?', 'String', 'Text Area', 'yes'),
(25, 'ISO 9001', 3, 5, 'Organizational roles, responsibilities and authorities', '5.3', 'How does top managemnt assign responsibility and authority to ensure that the QMS conforms to intenational sytandards?', 'String', 'Text Area', 'yes'),
(26, 'ISO 9001', 3, 5, 'Organizational roles, responsibilities and authorities', '5.3', 'How does top managemnt assign the responsibility and authority to ensure the reporting of the performance of the QMS and its processes are delivering their intended outputs?', 'String', 'Text Area', 'yes'),
(27, 'ISO 9001', 3, 5, 'Organizational roles, responsibilities and authorities', '5.3', 'How does top managemnt assign the responsibility and authority to ensure Customer Focus throughout the organization?', 'String', 'Text Area', 'yes'),
(29, 'ISO 9001', 4, 6, 'Actions to address risks and opportunities', '6.1', 'How are the internal and external issues and interested parties considered when planning for the QMS?', 'String', 'Text Area', 'yes'),
(30, 'ISO 9001', 4, 6, 'Actions to address risks and opportunities', '6.1', 'How are risks and opportunities determined and addressed so that the QMS can: Achieve its intended results, prevent or reduce undesired effects, and achieve continual improvement?', 'String', 'Text Area', 'yes'),
(31, 'ISO 9001', 4, 6, 'Actions to address risks and opportunities', '6.1.2', 'How are actions planned to address risks and oppertunities?', 'String', 'Text Area', 'yes'),
(32, 'ISO 9001', 4, 6, 'Actions to address risks and opportunities', '6.1.2', 'How are actions integrated and implemented into the QMS processes, and how does management evalute the  effectivness of these actions?', 'String', 'Text Area', 'yes'),
(33, 'ISO 9001', 4, 6, 'Actions to address risks and opportunities', '6.1.2', 'How are the actions taken to address risks and oppertunities determined in relation to the potential impact of the non-conforming products or services?', 'String', 'Text Area', 'yes'),
(34, 'ISO 9001', 4, 6, 'Quality objectives and planning to achieve them', '6.2.1', 'Are your Quality Objectives maintained as documented information and, relevant to all functions, processes and levels of the organization ?', 'String', 'Text Area', 'yes'),
(35, 'ISO 9001', 4, 6, 'Quality objectives and planning to achieve them', '6.2.1', 'Are your Quality Objectives measurable and consistent with the Quality Policy?', 'Boolean', NULL, 'yes'),
(36, 'ISO 9001', 4, 6, 'Quality objectives and planning to achieve them', '6.2.2', 'How are your Quality Objectives measured, monitered communicated within the organization,  and updated?', 'String', 'Text Area', 'yes'),
(37, 'ISO 9001', 4, 6, 'Quality objectives and planning to achieve them', '6.2.2', 'How does the organization determine:when activities are to be completed, what will be done, what resources are to be used, and how results will be evaluated for quality objectives?', 'String', 'Text Area', 'yes'),
(38, 'ISO 9001', 4, 6, 'Planning for changes', '6.3', 'How are changes to the QMS planned and exsicuted?', 'String', 'Text Area', 'yes'),
(39, 'ISO 9001', 4, 6, 'Planning for changes', '6.3', 'Have the potential risks and oppetunities for improvement associated with changes to the QMS been identified and documented?', 'String', 'Text Area', 'yes'),
(40, 'ISO 9001', 4, 6, 'Planning for changes', '6.3', 'How does the organization determin the integrity of the QMS?', 'String', 'Text Area', 'yes'),
(41, 'ISO 9001', 4, 6, 'Planning for changes', '6.3', 'How are  resources sourced, monitored and made available to the organization?', 'String', 'Text Area', 'yes'),
(42, 'ISO 9001', 4, 6, 'Planning for changes', '6.3', 'How are responsibilities and autority allocated and relocated within the organization?', 'String', 'Text Area', 'yes'),
(43, 'ISO 9001', 4, 7, 'Resources', '7.1.1', 'How are resources determined for the establishment, implementation, maintenance and continual improvement of the QMS; while considering limitations on internal and external resources?', 'String', 'Text Area', 'yes'),
(44, 'ISO 9001', 4, 7, 'People', '7.1.2', 'Are adequate human resources in place to ensure compliance with customer requirements and applicable statutory and regulatory requierments; both locally and internationally?', 'Boolean', NULL, 'yes'),
(45, 'ISO 9001', 4, 7, 'Infrastructure', '7.1.3', 'How do you determine the infrastructure needed for effective operation of processes related to the QMS, such as: Maintenance of equipment, Buildings and associated utilities, Transportation, and Information and Communication Technology ?', 'String', 'Text Area', 'yes'),
(46, 'ISO 9001', 4, 7, 'Environment for the operation of processes', '7.1.4', 'How does the organization determine and manage the work environment needed to achieve conformity to the product and service requirements of the QMS?', 'String', 'Text Area', 'yes'),
(47, 'ISO 9001', 4, 7, 'Monitoring and measuring resources', '7.1.5', 'Has the organization determined the monitoring and measurement activities to be undertaken, and the resources needed to ensure conformity to predefined requirements?', 'String', 'Text Area', 'yes'),
(48, 'ISO 9001', 4, 7, 'Monitoring and measuring resources', '7.1.5', 'How do you determine the validity, reliablity and suitablilty of the resources provided for monitoring and measurment activities, including: Ensuring suitablity of resources, maintainace of resources to ensure fitness for purpose, and the maintainance of documented information as evidence of fitness?', 'String', 'Text Area', 'yes'),
(49, 'ISO 9001', 4, 7, 'Monitoring and measuring resources', '7.1.5', 'Have all monitoring and measurment activities been determined?', 'Boolean', NULL, 'yes'),
(50, 'ISO 9001', 4, 7, 'Monitoring and measuring resources', '7.1.5', 'Are resources used for monitoring and measuring suitability maintained?', 'Boolean', NULL, 'yes'),
(51, 'ISO 9001', 4, 7, 'Monitoring and measuring resources', '7.1.5', 'What documented information is maintained as evidence of fitness for the monitoring and\nmeasuring of resources?', 'String', 'Text Area', 'yes'),
(52, 'ISO 9001', 4, 7, 'Monitoring and measuring resources', '7.1.5', 'How Is measurment equipment calibrated or verified: at specified intervals, against national or international measurement standards (or any other means by which the basis for calibration or verification shall be defined)?', 'String', 'Text Area', 'yes'),
(53, 'ISO 9001', 4, 7, 'Monitoring and measuring resources', '7.1.5', 'How is measuring equipment identified to determine:  Its calibration status; How they are safeguarded from adjustments; and safeguarding against damage and deterioration, during handling, maintenance and storage?', 'String', 'Text Area', 'yes'),
(54, 'ISO 9001', 4, 7, 'Monitoring and measuring resources', '7.1.5', 'How do you demonstrate the validity of previously measured results, when measurment equipment is found to not conform to requirements, and what action is taken on the affected equipment?', 'String', 'Text Area', 'yes'),
(56, 'ISO 9001', 4, 7, 'Organizational Knowledge', '7.1.6', 'What evidence is available to ensure that the organization has determined the knowledge necessary for effective operation of its processes?', 'String', 'Text Area', 'yes'),
(57, 'ISO 9001', 4, 7, 'Organizational Knowledge', '7.1.6', 'How do you detrmine  and maintain the necessary knowledge for the operation of the various processes, and are they available, if needed?', 'String', 'Text Area', 'yes'),
(58, 'ISO 9001', 4, 7, 'Organizational Knowledge', '7.1.6', 'How do you consider current knowledge and how do you acquire additional knowledge when addressing changing needs and trends?', 'String', 'Text Area', 'yes'),
(60, 'ISO 9001', 4, 7, 'Competence', '7.2', 'Have the necessary competence for personnel, been determined, and appropriate documented information for education, training, skills and experience been maintained?', 'Boolean', NULL, 'yes'),
(61, 'ISO 9001', 4, 7, 'Competence', '7.2', 'How do you determine competence on the basis of appropriate education, training or experience?', 'String', 'Text Area', 'yes'),
(62, 'ISO 9001', 4, 7, 'Competence', '7.2', 'How do you take actions to acquire necessary competence where applicable, and how do you evaluate the effectiveness of those actions?', 'String', 'Text Area', 'yes'),
(63, 'ISO 9001', 4, 7, 'Competence', '7.2', 'Are Personnel aware of the relevance and importance of their activities and how they contribute to the achievement of the organization\'s quality objectives?', 'Boolean', NULL, 'no'),
(64, 'ISO 9001', 4, 7, 'Competence', '7.2', 'Is documented information  maintained on competency and achievements in education, training, skills and experience?', 'String', 'Text Area', 'yes'),
(65, 'ISO 9001', 4, 7, 'Awareness', '7.3', 'Have the Quality Policy and Quality Objectives been communicated within the organization, and the contributions to the effectiveness; benefits of quality and performance, and; the Implications of non-conformance with the QMS, been understood?', 'Boolean', NULL, 'no'),
(66, 'ISO 9001', 4, 7, 'Communication', '7.4', 'How do you determine internal and external communications that are relevant to the QMS, along with: the Subject of Communication; When and how to communicate, and; With whom/who to communicate?', 'String', 'Text Area', 'yes'),
(67, 'ISO 9001', 4, 7, 'Communication', '7.4', 'Is Leadership able to demonstrate how they ensure that appropriate communication processes are established within the organization, and that communication takes place regarding the effectiveness of the QMS?', 'Boolean', NULL, 'yes'),
(68, 'ISO 9001', 4, 7, 'Documneted Information', '7.5.1', 'Does the organization’s QMS include documented information required by the ISO 9001 standard and Documented information determined to be necessary for the effectiveness the QMS, by the organization ?', 'Boolean', NULL, 'yes'),
(69, 'ISO 9001', 4, 7, 'Documneted Information', '7.5.2', 'Is documented information properly identified  (e.g. title, date, author or reference) , and discribed in it\'s respective media format (language, software version, graphics)?', 'String', 'Text Area', 'yes'),
(70, 'ISO 9001', 4, 7, 'Documneted Information', '7.5.3', 'How is documented information reviewed and approved for suitability and adequacy?', 'String', 'Text Area', 'yes'),
(71, 'ISO 9001', 4, 7, 'Documneted Information', '7.5.3.1', 'Is documented information controlled and protected to ensure Its suitability and availability for use?', 'Boolean', NULL, 'yes'),
(72, 'ISO 9001', 4, 7, 'Documneted Information', '7.5.3.2', 'How do you control Documented Information in order to address: Distribution, control, access, retrieval and use; Storage and preservation and including legibility; and Control of changes (version control); Retention and disposition?', 'String', 'Text Area', 'yes'),
(73, 'ISO 9001', 4, 7, 'Documneted Information', '7.5.3.2', 'How do you identify and control Documented Information of external origin which you have determined as necessary fo the QMS?', 'String', 'Text Area', 'yes'),
(74, 'ISO 9001', 4, 8, 'Operations', '8.1', 'How are the consequences of unintended changes controlled, and how are actions taken to mitigate their adverse effects?', 'String', 'Text Area', 'yes'),
(75, 'ISO 9001', 4, 8, 'Operations', '8.1', 'Are adequate actions in place to ensure effective planning, implementation and control of the processes, including, the methods needed to ensure:\n• Adequate identification of requirements for products andservices?\n• Establishment of criteria for products and services?\n• Determination of neededresources?\n• Implementation of the processes in accordance with the notedcriteria?\n• Retention of documented information to show process effectiveness, and to demonstrate conformity of products and services to requirements?\n', 'Boolean', NULL, 'yes'),
(77, 'ISO 9001', 4, 8, 'Customer Communication', '8.2.1', 'Has the organization considered what information is communicated to customers in regards to products and services?', 'Boolean', NULL, 'yes'),
(78, 'ISO 9001', 4, 8, 'Customer Communication', '8.2.1', 'Has the organization implemented a system for monitoring customer feedback as it relates to product and/or services including complaints?', 'Boolean', NULL, 'yes'),
(79, 'ISO 9001', 4, 8, 'Customer Communication', '8.2.1', 'Does the organization have a system in place regarding the handling and control of customer property?', 'Boolean', NULL, 'yes'),
(80, 'ISO 9001', 4, 8, 'Customer Communication', '8.2.1', 'Has the organization considered establishing specific requirements for contingency action when it is necessary?', 'Boolean', NULL, 'yes'),
(81, 'ISO 9001', 4, 8, 'Determining the requirement for products & Services', '8.2.2', 'Has the organization considered all regulatory and statutory requirments as well as those determined by the organiztion when determining the requirements for products and services being offered to customers?', 'Boolean', NULL, 'yes'),
(82, 'ISO 9001', 4, 8, 'Determining the requirement for products & Services', '8.2.2', 'Has the organization considered its ability to meet its claims for the products and/or services being offered?', 'Boolean', NULL, 'yes*'),
(83, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Has the organization considered its ability to consistently meet the requirements specified by customers as well as it\'s ability to meet the requirements for delivery and post delivery activities?', 'Boolean', NULL, 'yes*'),
(84, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Has the organization also considered it\'s ability to meet those requiremets which are not stated by the customer but are necessary for the specified or intended use when known?', 'String', 'Text', 'yes*'),
(85, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Has the organization considered its ability to meet its own specified requirements?', 'String', 'Text', 'yes*'),
(86, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Has the organization considered its ability to meet statutory and regulatory requirements where applicable to products and services?', 'String', 'Text', 'yes*'),
(87, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Has the organization considered it ability to meet any other additional requirements that may be needed for products and services?', 'String', 'Text', 'yes*'),
(88, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Has the organization established a process for reviewing requirements specified by customers?', 'String', 'Text', 'yes*'),
(89, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Has the organization considered all requirements which may not have been stated by the customer but is necessary for use?', 'String', 'Text', 'yes*'),
(90, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Has the organization established a process for identifying all applicable statutory and regulatory requirements for the products or services ?', 'Boolean', NULL, 'yes'),
(91, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Does the organization have a process in place for handling order changes?', 'Boolean', NULL, 'yes'),
(92, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Does the organization have a process in place for reviewing customer orders before accepting same?', 'Boolean', NULL, 'yes'),
(93, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Does the organization maintain documented information for order reviews and handling order changes?', 'Boolean', NULL, 'yes'),
(94, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Does the organization review requirements to the product before committing to providing same to customers?', 'Boolean', NULL, 'yes'),
(95, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Does the review activity carried out by th organization ensure that product requirements are defined?', 'Boolean', NULL, 'yes'),
(96, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Does the review activity carried out by the organization ensure that contract or order requirements differing from those previously expressed are resolved?', 'Boolean', NULL, 'yes'),
(97, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'Does the review activity carried out by the organization ensure that it has the capacity or ability to meet defined requirements?', 'Boolean', NULL, 'yes'),
(98, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.3', 'How does the organization demonstrate that it confirms customer requirements when no documented statement of requirement is provided by the customer?', 'String', 'Text', '*'),
(99, 'ISO 9001', 4, 8, 'Review of the requirements for products and services', '8.2.4', 'How does the organization ensure that relevant documented information is amemded, and that relevant persons are made aware of the changed requirements, when the requirements for products and serviecs have been changed?', 'String', 'Text', 'yes'),
(101, 'ISO 9001', 4, 8, 'Design and development of products and services', '8.3.2', 'Is evidence available that the organization plans and controls the design and development of products and services, considering the nature,duration and complexity of the design activities?', 'Boolean', NULL, 'yes'),
(102, 'ISO 9001', 4, 8, 'Design and development of products and services', '8.3.2', 'Does the organization determine the following during the design and development planning stage: The review, verification and validation appropriate to each design and development stage', 'Boolean', NULL, '*'),
(103, 'ISO 9001', 4, 8, 'Design and development of products and services', '8.3.2', 'Has the organization considered the responsibilities and authorities for design and devlopment?', 'Boolean', NULL, 'yes'),
(104, 'ISO 9001', 4, 8, 'Design and development of products and services', '8.3.2', 'Are the interfaces between different groups involved in design and development managed to ensure effective communication and clear assignment of responsibility, involvement of customer and/or user groups.', 'Boolean', NULL, 'yes'),
(105, 'ISO 9001', 4, 8, 'Design and development of products and services', '8.3.2', 'Does the organization maintain documented information to demonstrate that the design and development\nrequirements have been met?\n', 'Boolean', NULL, 'yes'),
(106, 'ISO 9001', 4, 8, 'Design and development of products and services', '8.3.3', 'Are inputs relating to product requirements determined and documented information maintained relating to:\n•  Functional and performancerequirements?\n•  Applicable statutory and regulatory requirements?\n•  Applicable information from previous similar designs?\n•  Other requirements essential for designand development?\n•  Level of control by customers and other relevant interestedparties.\n', 'Boolean', NULL, 'yes'),
(107, 'ISO 9001', 4, 8, 'Design and development inputs', '8.3.3', 'Does the organization have evidence to indicate that design and development inputs have been reviewed for adequacy; and that requirements are unambiguous and not in conflict with each other?', 'Boolean', NULL, 'yes'),
(108, 'ISO 9001', 4, 8, 'Design and development inputs', '8.3.4', 'Does the organization have controls in place to ensure that the results to be achieved are clearly defined; Design and development reviews are planned and conducted; verification activities are conducted to ensure all inputs are met?', 'Boolean', NULL, 'yes'),
(109, 'ISO 9001', 4, 8, 'Design and development controls', '8.3.4', 'Does the organization have a validation process to ensure suitability for intended use?', 'Boolean', NULL, 'yes'),
(110, 'ISO 9001', 4, 8, 'Design and development controls', '8.3.4', 'Does the organization conduct a verification process to ensure that design and development outputs have satisfied the design and development input requirements?', 'String', 'Text', 'yes'),
(111, 'ISO 9001', 4, 8, 'Design and development controls', '8.3.4', 'Is design and development validation conducted to ensure that the resulting product is capable of fulfilling the requirements for the specified or known intended use or application?', 'Boolean', NULL, 'yes'),
(112, 'ISO 9001', 4, 8, 'Design and development controls', '8.3.5', 'Does the organization have controls in place to ensure: Input requirements have been met; outputs are adequate for the subsequent processes of the provision of products and services; identification of monitoring and measuring requirements, and the acceptance criteria; design products are fit for intended purpose and their safe and proper use?', 'Boolean', NULL, 'yes'),
(113, 'ISO 9001', 4, 8, 'Design and development outputs', '8.3.6', 'Does the organization maintain documented information for the design and development activities?', 'Boolean', NULL, 'yes'),
(114, 'ISO 9001', 4, 8, 'Design and development outputs', '8.3.6', 'Does the organization ensure that the design and development changes are: controlled during and after the design and development process; identified, reviewed, verified and validated as appropriate; evaluated for effect on constituent parts and delivered products; approved before implementation?', 'Boolean', NULL, 'yes'),
(115, 'ISO 9001', 4, 8, 'Design and Development changes', '8.3.6', 'Does the organization consider design and development changes to ensure that it does not have an adverse impact on conformity to requirements?', 'Boolean', NULL, 'yes'),
(116, 'ISO 9001', 4, 8, 'Design and Development changes', '8.3.6', 'Does the organization maintain documented information on results of changes and any necessary actions?', 'Boolean', NULL, 'yes'),
(117, 'ISO 9001', 4, 8, 'Control of externally provided processes, products and services', '8.4.1', 'What processes exist to ensure that externally provided processes, products and services conform to specified purchase requirements?', 'String', 'Text', 'yes'),
(118, 'ISO 9001', 4, 8, 'Control of externally provided processes, products and services', '8.4.1', 'Are the requirements in 8.4.2 applied to all suppliers who: Provide products for incorporation in the products; Provide products directly to thecustomers; Provide full or partial outsourced processto the organization.', 'String', 'Text', 'yes'),
(119, 'ISO 9001', 4, 8, 'Control of externally provided processes, products and services', '8.4.1', 'Are external providers evaluated and selected; monitored for performance and re-evaluated based upon their ability to supply product in accordance with the organization requirements?', 'Boolean', NULL, 'yes'),
(120, 'ISO 9001', 4, 8, 'Control of externally provided processes, products and services', '8.4.1', 'Is documented information of the results of supplier evaluations and any necessary actions arising from evaluations maintained?', 'Boolean', NULL, 'yes'),
(121, 'ISO 9001', 4, 8, 'Type and extent of control', '8.4.2', 'Does the external provider monitoring process take into consideration: The type and extent of controls to be applied; The potential impact of the externally provided processes, products and services on the ability to meet applicable statutory and regulatory requirements; ', 'String', 'Text', 'yes'),
(122, 'ISO 9001', 4, 8, 'Type and extent of control', '8.4.2', 'Does the external provider monitoring process take into consideration the perceived effectiveness of the controls applied by the external provider?', 'String', 'Text', 'yes'),
(123, 'ISO 9001', 4, 8, 'Type and extent of control', '8.4.2', 'Have the necessary verification processes been implemented to ensure that externally provided processes, products and services do not adversely affect the organization’s ability to meet customer\nrequirements?\n', 'String', 'Text', 'yes'),
(124, 'ISO 9001', 4, 8, 'Type and extent of control', '8.4.2', 'Does the controls of outsourced processess and functions remain within the scope of the organization\'s QMS?', 'String', 'Text', 'yes'),
(125, 'ISO 9001', 4, 8, 'Type and extent of control', '8.4.2', 'Is documented information maintained as a result of evaluation, monitoring and re-evaluation\nof external providers?', 'String', 'Text', 'yes'),
(126, 'ISO 9001', 4, 8, 'Type and extent of control', '8.4.2', 'Have inspections or other activities necessary for ensuring that purchased product meets specified purchase requirements been established and implemented?', 'Boolean', NULL, 'yes'),
(127, 'ISO 9001', 4, 8, 'Type and extent of control', '8.4.3', 'Does the organization ensure communication is provided to external providers concerning: Products and services to be provided or provided on behalf of the organization; Approval of products and services, methods, processes or equipment; Competence of personnel, including needed qualification; Interactions with the organization’s QMS; Control and monitoring of the external provider’sperformance ?', 'Boolean', NULL, 'yes'),
(128, 'ISO 9001', 4, 8, 'Information for external providers', '8.4.3', 'Does the organization ensure communication is provided to external providers concerning Notification of verification activities to be conducted by the organization at the external provider’spremises', 'Boolean', NULL, 'yes'),
(129, 'ISO 9001', 4, 8, 'Information for external providers', '8.4.3', 'Is the adequacy of specified purchase requirements ensured prior to their communication to the supplier', 'Boolean', NULL, 'yes'),
(130, 'ISO 9001', 4, 8, 'Production and Service provision', '8.5.1', 'Are production and service operations carried out under controlled conditions?', 'String', 'Text', 'yes'),
(131, 'ISO 9001', 4, 8, 'Control of production and service provision', '8.5.1', 'What evidence does the organization have to demonstrate production and service operate under controlled conditions? Controlled conditions shall include as applicable the following: The availability of information that describes the characteristics of the product; The availability of the required documented information;  The use of suitable equipment; The availability and use of monitoring and measurement resources; The implementation of monitoring and measurement; The implementation of release, delivery and post-delivery activities; The competency requirements or qualification of personnel; The implementation of products and services release, delivery and post-delivery activities.', 'String', 'Text', 'yes'),
(132, 'ISO 9001', 4, 8, 'Control of production and service provision', '8.5.1', 'Can it be demonstrated that measurement and monitoring of the product is carried out at various stages of the product realization process in accordance with planned arrangements?\n', 'Boolean', NULL, 'yes'),
(133, 'ISO 9001', 4, 8, 'Control of production and service provision', '8.5.1', 'Are production and service processes validated, and periodically revalidated, where the resulting output cannot be verified by subsequent monitoring or measurement?\n', 'String', 'Text', 'yes'),
(134, 'ISO 9001', 4, 8, 'Identification and traceability', '8.5.2', 'Are process outputs identified, as appropriate, by suitable means throughout the product/service\nrealization process?\n', 'String', 'Text', 'yes'),
(135, 'ISO 9001', 4, 8, 'Identification and traceability', '8.5.2', 'Is product status identified with respect to measuring and monitoring requirements\nthroughout product realization?\n', 'String', 'Text', 'yes'),
(136, 'ISO 9001', 4, 8, 'Identification and traceability', '8.5.2', 'Is traceability a specified requirement? If so, is unique identification of the product outputs\ncontrolled and documented information maintained to ensure adequatetraceability?\n', 'String', 'Text', 'yes'),
(137, 'ISO 9001', 4, 8, 'Property belonging to customers or external providers', '8.5.3', 'Is customer property provided for the use or incorporation into the product under the control or use of the organization? If so, does a process exist which ensures that care is provided for\ncustomer or external provider property?\n', 'String', 'Text', 'yes'),
(138, 'ISO 9001', 4, 8, 'Property belonging to customers or external providers', '8.5.3', 'Is the organization reporting to the customer or external provider, when their property is incorrectly used, lost, damaged or otherwise found to be unsuitable for use?\n', 'String', 'Text', 'yes'),
(139, 'ISO 9001', 4, 8, 'Property belonging to customers or external providers', '8.5.3', 'How does the organization demonstrate that customer property is identified; verified; protected and safeguarded?', 'String', 'Text', 'yes'),
(140, 'ISO 9001', 4, 8, 'Preservation', '8.5.4', 'How does the organization demonstrate that product and constituent part to the product  are preserved during internal processing and delivery to the intended destination in order to maintain conformity to requirements?', 'String', 'Text', 'yes'),
(141, 'ISO 9001', 4, 8, 'Preservation', '8.5.4', 'As applicable, are product preservation methods established, as appropriate,for:                                              • Identification?\n• Handling?\n• Packaging?\n• Storage?\n• Protection\n', 'String', 'Text', 'yes'),
(142, 'ISO 9001', 4, 8, 'Post Delivery Activities', '8.5.5', 'Is the organization meeting requirements for post- delivery activities?', 'Boolean', NULL, 'yes'),
(143, 'ISO 9001', 4, 8, 'Post Delivery Activities', '8.5.5', 'With respect to post-delivery activities does the organization condsider the following:                                                                       •The risks associated with its products and services                                                                                                                                         • Customer requirements\n•  The nature, use and intended  lifetime of the products and services\n• Customer feedback\n• Statutory and regulatory requirements\n', 'String', 'Text', 'yes'),
(144, 'ISO 9001', 4, 8, 'Post Delivery Activities', '8.5.6', 'Are documented information maintained describing the results of the review of the changes, the personnel authorizing the change, and the necessary actions?', 'Boolean', NULL, 'yes'),
(145, 'ISO 9001', 4, 8, 'Control of Changes', '8.6', 'Are planned arrangements in place to ensure achievement of the product and service\nrequirements?\n', 'String', 'Text', 'yes'),
(146, 'ISO 9001', 4, 8, 'Release of products and services', '8.6.', 'Are documented information maintained as evidence of conformity with the acceptance\ncriteria and traceability to the person(s) authorizing release?\n', 'Boolean', NULL, 'yes'),
(147, 'ISO 9001', 4, 8, 'Release of products and services', '8.6', 'Are controls in place to ensure that release of product and delivery of service to the customer do not proceed until all planned arrangements are satisfactorily completed? ', 'String', 'Text', 'yes'),
(148, 'ISO 9001', 4, 8, 'Release of products and services', '8.6.', 'Does the organization maintain documented information to identify the person authorizing the\nrelease?\n', 'Boolean', NULL, 'yes'),
(149, 'ISO 9001', 4, 8, 'Control of Nonconforming outputs', '8.7', 'Are products and services that do not conform to the requirements, identified and controlled to prevent their\nunintended use or delivery?\n', 'Boolean', NULL, 'yes'),
(150, 'ISO 9001', 4, 8, 'Control of Nonconforming outputs', '8.7', 'Has the organization taken appropriate actions in addressing non conformities detected based on its nature and the impact it has on conformity of products and services? (This also applies to non conforming products and services detected after delivery of products, during or after the provision of services) ', 'String', 'Text', 'yes'),
(151, 'ISO 9001', 4, 8, 'Control of Nonconforming outputs', '8.7', 'In addressing non conformities detected, does the organization utelize any of the methods:                                                    • Correction\n• Segregation, containment\n• Informing the customer\n• Obtaining authorization for use “as-is”, continuation or acceptance under concession.\n', 'String', 'Text', 'yes'),
(152, 'ISO 9001', 4, 8, 'Control of Nonconforming outputs', '8.7', 'Does the organization maintain documented information that: Describes the nonconformity; describes the actions taken; describes concessions obtained; and identifies the authority deciding the action in respect of the nonconformity?', 'String', 'Text', 'yes'),
(153, 'ISO 9001', 4, 8, 'Control of Nonconforming outputs', '8.7', 'Are corrected nonconforming products and services verified for compliance after rework?', 'String', 'Text', 'yes'),
(156, 'ISO 9001', 4, 9, 'Performance Evaluation', '9.1.1', 'Has the organization identified                                                                                                                                                          • What has to be monitored\n• The methods for monitoring, measurement, analysis, evaluation\n• When the monitoring is to be performed\n• When the results are to be analyzed.\n', 'Boolean', NULL, 'Yes'),
(157, 'ISO 9001', 4, 9, 'Performance Evaluation', '9.1.1', 'Does the organization maintain documented information to ensure that the monitoring and measurement activities are implemented in accordance with the above\nrequirements?\n', 'Boolean', NULL, 'Yes'),
(158, 'ISO 9001', 4, 9, 'Performance Evaluation', '9.1.1', 'Does this evaluation include review of the quality performance data to ensure effectiveness of the\nquality management system?', 'Boolean', NULL, 'Yes'),
(159, 'ISO 9001', 4, 9, 'Customer satisfaction', '9.1.2', 'Is information relating to customer perception to whether the organization has fulfilled customer requirements monitored?', 'Boolean', NULL, 'Yes'),
(160, 'ISO 9001', 4, 9, 'Customer satisfaction', '9.1.2', 'Is information obtained related to customer views and opinions of the organization and its products and services?', 'Boolean', NULL, 'yes'),
(161, 'ISO 9001', 4, 9, 'Customer satisfaction', '9.1.2', 'Is the method for obtaining and using the customer satisfaction information determined?', 'Boolean', NULL, 'yes'),
(162, 'ISO 9001', 4, 9, 'Analysis and evaluation', '9.1.3', 'Does the organization analyze and evaluate the data arising from monitoring and measurement?\nactivities?', 'String', 'Text', 'yes'),
(163, 'ISO 9001', 4, 9, 'Analysis and evaluation', '9.1.3', 'Is the organization using the sources of data to:\n• Demonstrate conformity of products and services to requirements?\n• Assess and enhance customer satisfaction?\n• Ensure conformity of effectiveness of the quality managementsystem?\n• Demonstrate that planning has been successfully implemented?\n• Assess the performance ofprocesses?\n• Assess the performance of external providers?\n• Determine the need or opportunities for improvement within the quality management system', 'String', 'Text', 'Yes'),
(164, 'ISO 9001', 4, 9, 'Analysis and evaluation', '9.1.3', 'Are the results of the above analysis provided as input to management review?', 'Boolean', NULL, 'Yes'),
(166, 'ISO 9001', 4, 9, 'Internal Audit', '9.2.1', 'Is evidence available to confirm that internal audits are conducted at planned intervals based upon:\n•  The status and importance of the processes and areas to be audited?\n• The results of previous audits?\n• Customer feedback?\n• Changes impacting the organization?\n', 'Boolean', NULL, 'yes'),
(167, 'ISO 9001', 4, 9, 'Internal Audit', '9.2.1', 'Does the internal quality audit activity determine whether the quality management system:\n•  Conforms to planned arrangements?\n•  Conforms to ISO 9001:2015?\n•  Conforms to quality management system requirements established by the organization?\n• Is effectively implemented and maintained?', 'Boolean', NULL, 'yes'),
(168, 'ISO 9001', 4, 9, 'Internal Audit', '9.2.2', 'Have audit criteria, scope, frequency and methods been defined?', 'Boolean', NULL, 'yes'),
(169, 'ISO 9001', 4, 9, 'Internal Audit', '9.2.2', 'Is evidence available to confirm that internal auditors do not audit their own work, and are\nobjective and impartial of the audit process?\n', 'String', 'Text', 'yes'),
(170, 'ISO 9001', 4, 9, 'Internal Audit', '9.2.2', 'Does the management responsible for the area being audited ensure that any necessary corrections and corrective actions are taken without undue delay to eliminate detected\nnonconformities and their causes?\n', 'String', 'Text', 'yes'),
(171, 'ISO 9001', 4, 9, 'Internal Audit', '9.2.2', 'Are documented information maintained as evidence of the implementation of the audit?\nprogram and the audit results?', 'Boolean', NULL, 'yes'),
(173, 'ISO 9001', 4, 9, 'Management Review', '9.3.1', 'Does top management review the quality management system at planned intervals to\nensure its continuing suitability, adequacy and effectiveness?', 'String', 'Text', 'yes'),
(174, 'ISO 9001', 4, 9, 'Management Review', '9.3.1', 'Does management review evaluate the need for changes to the quality management system, including the quality policy and quality objectives?', 'String', 'Text', 'yes'),
(175, 'ISO 9001', 4, 9, 'Management Review', '9.3.1', 'Is documented information maintained as the result of management reviews?', 'Boolean', NULL, 'yes'),
(176, 'ISO 9001', 4, 9, 'Management Review', '9.3.2', 'Do the inputs to management review include information on the following (including quality indicators (if any):\n• Results of audits\n• Customer Satisfaction\n• Nonconformities and Corrective Actions\n• Monitoring and measurement results\n• Issues concerning external providers and other relevant interested parties\n• Adequacy of resources\n• Process performance and conformity of products andservices\n• Effectiveness of actions taken to address risks and opportunities.\n• Performance of external suppliers.\n', 'String', 'Text', 'yes'),
(177, 'ISO 9001', 4, 9, 'Management Review inputs', '9.3.3', 'Do the outputs from management review include decisions and actions related to:\n• Improvement of the effectiveness of the quality management system and itsprocesses?\n• Improvement of product related to customer requirements?\n•Resource needs?', 'String', 'Text', 'yes'),
(178, 'ISO 9001', 4, 9, 'Management Revew outputs', '9.3.3', 'Does the organization maintain documented information as evidence of management reviews?', 'Boolean', NULL, 'yes'),
(179, 'ISO 9001', 4, 9, 'Management Revew outputs', '9.3.3', ' Does management review evaluate the need for changes to the quality management system, including the quality policy and quality objectives?', 'Boolean', NULL, 'yes'),
(180, 'ISO 9001', 4, 10, 'Improvement', '10.1', 'Is the organization selecting opportunities for improvement and implementing necessary actions to meet customer requirements?', 'String', 'Text', 'yes'),
(181, 'ISO 9001', 4, 10, 'Improvement', '10.1', 'Is the organization taking actions to prevent nonconformities, improve products and services, and improve the overall quality management system results?', 'String', 'Text', 'yes'),
(182, 'ISO 9001', 4, 10, 'Nonconformity and corrective action ', '10.2.1', 'In the presence of a nonconformity, does the organization\n• React to the nonconformity by taking actions to control and correct it, and dealing with its consequences\n• Evaluate the need for action to eliminate the cause                                                                                                                    • Implement any action needed\n• Review the effective of any corrective action?\n• Make change to the quality management system?', 'String', 'Text', 'yes'),
(183, 'ISO 9001', 4, 10, 'Nonconformity and corrective action ', '10.2.2', 'Is documented information maintained to show the nature of the nonconformity and any subsequent actions taken, and the results of any corrective action taken?', 'Boolean', NULL, 'yes'),
(184, 'ISO 9001', 4, 10, 'Nonconformity and corrective action ', '10.2.2', 'In the presence of a nonconformity, does the organization react to the nonconformity by taking actions to control and correct it, and dealing with its consequences?', 'String', 'Text', 'yes'),
(185, 'ISO 9001', 4, 10, 'Nonconformity and corrective action ', '10.2.2', 'Are the actions taken appropriate to the effects, or potential effects of the nonconformity?', 'String', 'Text', 'no'),
(186, 'ISO 9001', 4, 10, 'Nonconformity and corrective action ', '10.2.2', 'Are the corrective actions taken appropriate to the effects of the nonconformities encountered?', 'Boolean', NULL, 'yes'),
(187, 'ISO 9001', 4, 10, 'Nonconformity and corrective action ', '10.2.2', 'Is action taken to eliminate the causes of nonconformities in order to prevent recurrence?', 'Boolean', NULL, 'yes'),
(188, 'ISO 9001', 4, 10, 'Continual improvement', '10.3', 'Is the organization continually improving the suitability, adequacy and effectiveness of the quality management system?', 'String', 'Text', 'yes'),
(189, 'ISO 9001', 4, 10, 'Continual improvement', '10.3', 'Are the outputs of analysis and evaluation, and the outputs from the management review process used to identify the areas of underperformances?', 'String', 'Text', 'yes'),
(190, 'ISO 9001', 4, 10, 'Continual improvement', '10.3', 'Are specialized tools and methodologies used for investigation of the causes of underperformance?', 'String', 'Text', '*yes'),
(191, 'ISO 9001', 4, 10, 'Continual improvement', '10.3', 'How does the organization demonstrate that the effectiveness of the quality management system is being\ncontinually improved?', 'String', 'Text', 'yes');

-- --------------------------------------------------------

--
-- Structure de la table `question`
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
  `input_format` varchar(50) DEFAULT NULL,
  `field_length` varchar(50) DEFAULT NULL,
  `upload` varchar(50) DEFAULT NULL,
  `sub_clause` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=193 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `question`
--

INSERT INTO `question` (`id`, `sub_clause_id`, `question_type_id`, `question`, `choice`, `remark`, `upload_document`, `active`, `updated_date`, `updated_by`, `input_format`, `field_length`, `upload`, `sub_clause`) VALUES
(1, 1, 3, 'Has the organization identified all external and internal issues relevant to its strategic plan ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, NULL, '4.1'),
(2, 1, 3, 'Has the organization established a process for monitor and review the external and internal issues that may affect the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, NULL, '4.1'),
(3, 2, 3, 'Has the organization identified all relevant interested party and how their requierments may impact the operations of the organization?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '4.2'),
(4, 2, 1, 'How do you monitor and review the information about interested parties  and their requierments ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '4.2'),
(5, 3, 3, 'Does the scope of the QMS, include products and services provided by the organization, and a justification for any exclusions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '4.3'),
(6, 3, 3, 'Does the organization have the scope of the quality management system\nmaintained as documented information?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '4.3'),
(7, 3, 3, 'Have : The internal and external issues;The requirments of the relevant interested parties and; The products and services provided by the organization, been considered when determining the scope of the organization ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'no*', '4.3'),
(8, 3, 1, 'Is there assurance that: All requirements of the standard that are applicable to the organization, have been applied, and that; Those requirments determined to be non- applicable, do not affect the organization’s ability to ensure conformity to the standard ?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'no', '4.3'),
(9, 4, 3, 'Have the processes of the organization been determined for the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '4.4'),
(10, 4, 1, 'What are the: Inputs and outputs; Sequence of interactions; Crieteria, Methods, Measurments and Key Performance Indicators; Resources needed; Defined responsibility and authority for all personnel; Risks and Opportunities; Method(s) for monitoring and change to ensure intended results, of these processes ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'Yes', '4.4'),
(11, 4, 3, 'Has the organization defined; Documented information to support the operation of its processes and; Documented information to be retained as evidence that these processes are beingcarried out as planned?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '4.4'),
(12, 5, 3, 'Has top management demonstrated leadership by: Taking accountability of the effectivness of the QMS by establishing the Quality Policy and Quality Objectives and; ensuring that they are alligne with the organization\'s strategic objectives?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '5.1.1'),
(13, 5, 3, 'Has top management demonstrated leadership by communicating the Quality Policy and Quality Objectives within the organization, to ensure that the importance of meeting the requirements of the  QMS and customers is understood?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'no', '5.1.1'),
(14, 5, 3, 'Has top management demonstrated leadership by: Providing adequate resources; Engaging/directing/supporting process effectiveness to achieve required results; Conducting Management Reviews, and; Communicating QMS effectiveness.', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '5.1.1'),
(15, 5, 1, 'Has top management demonstrated leadership by promoting continual improvement and supporting other management roles within the organization to do the same?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'no', '5.1.1'),
(16, 6, 1, 'Has top management demonstrated leadership by: Identifying customer requirements, and ensuring adherance to regulatory and statutory requirements?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'no', '5.1.2'),
(17, 6, 1, 'Has top management demonstrated leadership, by ensuring that Risks and Opportunities are determined and addressed?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '5.1.2'),
(18, 6, 1, 'Has top management demonstrated leadership by: Putting focus on consistently providing products/services that meet customer requirements, and enhancing customer satisfaction?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'no', '5.1.2'),
(19, 7, 3, 'Has top management established, a Quality Policy that is appropriate to the context of your organization, and facilites the review and maintaince of the Quality Policy?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '5.2.1'),
(20, 7, 3, 'Has top management established, a Quality Policy that: Includes a commitment to satisfying applicable requirements, and includes a commitment to continual improvement?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '5.2.1'),
(21, 7, 3, 'Has top management established, a Quality Policy that is communicated and understood within the organization, and is continually reviewed for suitability?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '5.2.1'),
(22, 7, 3, 'Has top management established Quality Objectives that are measurable and consistent with the Quality Policy?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '5.2.1'),
(23, 8, 1, 'Has top management established, a Quality Policy that is documented, communicated and understood within the organization, and has been made available to the relevant interested parties?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '5.2.2'),
(24, 9, 1, 'How does top managemnt ensure that the responsibilities and authority for all personnelare defined and communicated within the ogranization?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '5.3'),
(25, 9, 1, 'How does top managemnt assign responsibility and authority to ensure that the QMS conforms to intenational sytandards?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '5.3'),
(26, 9, 1, 'How does top managemnt assign the responsibility and authority to ensure the reporting of the performance of the QMS and its processes are delivering their intended outputs?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '5.3'),
(27, 9, 1, 'How does top managemnt assign the responsibility and authority to ensure Customer Focus throughout the organization?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '5.3'),
(29, 10, 1, 'How are the internal and external issues and interested parties considered when planning for the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.1'),
(30, 10, 1, 'How are risks and opportunities determined and addressed so that the QMS can: Achieve its intended results, prevent or reduce undesired effects, and achieve continual improvement?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.1'),
(31, 11, 1, 'How are actions planned to address risks and oppertunities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.1.2'),
(32, 11, 1, 'How are actions integrated and implemented into the QMS processes, and how does management evalute the  effectivness of these actions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.1.2'),
(33, 11, 1, 'How are the actions taken to address risks and oppertunities determined in relation to the potential impact of the non-conforming products or services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.1.2'),
(34, 12, 1, 'Are your Quality Objectives maintained as documented information and, relevant to all functions, processes and levels of the organization ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.2.1'),
(35, 12, 3, 'Are your Quality Objectives measurable and consistent with the Quality Policy?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '6.2.1'),
(36, 13, 1, 'How are your Quality Objectives measured, monitered communicated within the organization,  and updated?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.2.2'),
(37, 13, 1, 'How does the organization determine:when activities are to be completed, what will be done, what resources are to be used, and how results will be evaluated for quality objectives?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.2.2'),
(38, 14, 1, 'How are changes to the QMS planned and exsicuted?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.3'),
(39, 14, 1, 'Have the potential risks and oppetunities for improvement associated with changes to the QMS been identified and documented?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.3'),
(40, 14, 1, 'How does the organization determin the integrity of the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.3'),
(41, 14, 1, 'How are  resources sourced, monitored and made available to the organization?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.3'),
(42, 14, 1, 'How are responsibilities and autority allocated and relocated within the organization?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '6.3'),
(43, 15, 1, 'How are resources determined for the establishment, implementation, maintenance and continual improvement of the QMS; while considering limitations on internal and external resources?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.1'),
(44, 16, 3, 'Are adequate human resources in place to ensure compliance with customer requirements and applicable statutory and regulatory requierments; both locally and internationally?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '7.1.2'),
(45, 17, 1, 'How do you determine the infrastructure needed for effective operation of processes related to the QMS, such as: Maintenance of equipment, Buildings and associated utilities, Transportation, and Information and Communication Technology ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.3'),
(46, 18, 1, 'How does the organization determine and manage the work environment needed to achieve conformity to the product and service requirements of the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.4'),
(47, 19, 1, 'Has the organization determined the monitoring and measurement activities to be undertaken, and the resources needed to ensure conformity to predefined requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.5'),
(48, 19, 1, 'How do you determine the validity, reliablity and suitablilty of the resources provided for monitoring and measurment activities, including: Ensuring suitablity of resources, maintainace of resources to ensure fitness for purpose, and the maintainance of documented information as evidence of fitness?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.5'),
(49, 19, 3, 'Have all monitoring and measurment activities been determined?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '7.1.5'),
(50, 19, 3, 'Are resources used for monitoring and measuring suitability maintained?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '7.1.5'),
(51, 19, 1, 'What documented information is maintained as evidence of fitness for the monitoring and\nmeasuring of resources?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.5'),
(52, 19, 1, 'How Is measurment equipment calibrated or verified: at specified intervals, against national or international measurement standards (or any other means by which the basis for calibration or verification shall be defined)?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.5'),
(53, 19, 1, 'How is measuring equipment identified to determine:  Its calibration status; How they are safeguarded from adjustments; and safeguarding against damage and deterioration, during handling, maintenance and storage?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.5'),
(54, 19, 1, 'How do you demonstrate the validity of previously measured results, when measurment equipment is found to not conform to requirements, and what action is taken on the affected equipment?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.5'),
(56, 20, 1, 'What evidence is available to ensure that the organization has determined the knowledge necessary for effective operation of its processes?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.6'),
(57, 20, 1, 'How do you detrmine  and maintain the necessary knowledge for the operation of the various processes, and are they available, if needed?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.6'),
(58, 20, 1, 'How do you consider current knowledge and how do you acquire additional knowledge when addressing changing needs and trends?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.1.6'),
(60, 21, 3, 'Have the necessary competence for personnel, been determined, and appropriate documented information for education, training, skills and experience been maintained?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '7.2'),
(61, 21, 1, 'How do you determine competence on the basis of appropriate education, training or experience?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.2'),
(62, 21, 1, 'How do you take actions to acquire necessary competence where applicable, and how do you evaluate the effectiveness of those actions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.2'),
(63, 21, 3, 'Are Personnel aware of the relevance and importance of their activities and how they contribute to the achievement of the organization\'s quality objectives?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'no', '7.2'),
(64, 21, 1, 'Is documented information  maintained on competency and achievements in education, training, skills and experience?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.2'),
(65, 22, 3, 'Have the Quality Policy and Quality Objectives been communicated within the organization, and the contributions to the effectiveness; benefits of quality and performance, and; the Implications of non-conformance with the QMS, been understood?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'no', '7.3'),
(66, 23, 1, 'How do you determine internal and external communications that are relevant to the QMS, along with: the Subject of Communication; When and how to communicate, and; With whom/who to communicate?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.4'),
(67, 23, 3, 'Is Leadership able to demonstrate how they ensure that appropriate communication processes are established within the organization, and that communication takes place regarding the effectiveness of the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '7.4'),
(68, 24, 3, 'Does the organization’s QMS include documented information required by the ISO 9001 standard and Documented information determined to be necessary for the effectiveness the QMS, by the organization ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '7.5.1'),
(69, 25, 1, 'Is documented information properly identified  (e.g. title, date, author or reference) , and discribed in it\'s respective media format (language, software version, graphics)?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.5.2'),
(70, 26, 1, 'How is documented information reviewed and approved for suitability and adequacy?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.5.3'),
(71, 27, 3, 'Is documented information controlled and protected to ensure Its suitability and availability for use?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '7.5.3.1'),
(72, 28, 1, 'How do you control Documented Information in order to address: Distribution, control, access, retrieval and use; Storage and preservation and including legibility; and Control of changes (version control); Retention and disposition?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.5.3.2'),
(73, 28, 1, 'How do you identify and control Documented Information of external origin which you have determined as necessary fo the QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '7.5.3.2'),
(74, 29, 1, 'How are the consequences of unintended changes controlled, and how are actions taken to mitigate their adverse effects?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text Area', 'yes', '8.1'),
(75, 29, 3, 'Are adequate actions in place to ensure effective planning, implementation and control of the processes, including, the methods needed to ensure:\n• Adequate identification of requirements for products andservices?\n• Establishment of criteria for products and services?\n• Determination of neededresources?\n• Implementation of the processes in accordance with the notedcriteria?\n• Retention of documented information to show process effectiveness, and to demonstrate conformity of products and services to requirements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.1'),
(77, 30, 3, 'Has the organization considered what information is communicated to customers in regards to products and services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.1'),
(78, 30, 3, 'Has the organization implemented a system for monitoring customer feedback as it relates to product and/or services including complaints?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.1'),
(79, 30, 3, 'Does the organization have a system in place regarding the handling and control of customer property?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.1'),
(80, 30, 3, 'Has the organization considered establishing specific requirements for contingency action when it is necessary?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.1'),
(81, 31, 3, 'Has the organization considered all regulatory and statutory requirments as well as those determined by the organiztion when determining the requirements for products and services being offered to customers?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.2'),
(82, 31, 3, 'Has the organization considered its ability to meet its claims for the products and/or services being offered?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes*', '8.2.2'),
(83, 32, 3, 'Has the organization considered its ability to consistently meet the requirements specified by customers as well as it\'s ability to meet the requirements for delivery and post delivery activities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes*', '8.2.3'),
(84, 32, 1, 'Has the organization also considered it\'s ability to meet those requiremets which are not stated by the customer but are necessary for the specified or intended use when known?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes*', '8.2.3'),
(85, 32, 1, 'Has the organization considered its ability to meet its own specified requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes*', '8.2.3'),
(86, 32, 1, 'Has the organization considered its ability to meet statutory and regulatory requirements where applicable to products and services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes*', '8.2.3'),
(87, 32, 1, 'Has the organization considered it ability to meet any other additional requirements that may be needed for products and services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes*', '8.2.3'),
(88, 32, 1, 'Has the organization established a process for reviewing requirements specified by customers?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes*', '8.2.3'),
(89, 32, 1, 'Has the organization considered all requirements which may not have been stated by the customer but is necessary for use?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes*', '8.2.3'),
(90, 32, 3, 'Has the organization established a process for identifying all applicable statutory and regulatory requirements for the products or services ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.3'),
(91, 32, 3, 'Does the organization have a process in place for handling order changes?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.3'),
(92, 32, 3, 'Does the organization have a process in place for reviewing customer orders before accepting same?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.3'),
(93, 32, 3, 'Does the organization maintain documented information for order reviews and handling order changes?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.3'),
(94, 32, 3, 'Does the organization review requirements to the product before committing to providing same to customers?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.3'),
(95, 32, 3, 'Does the review activity carried out by th organization ensure that product requirements are defined?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.3'),
(96, 32, 3, 'Does the review activity carried out by the organization ensure that contract or order requirements differing from those previously expressed are resolved?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.3'),
(97, 32, 3, 'Does the review activity carried out by the organization ensure that it has the capacity or ability to meet defined requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.2.3'),
(98, 32, 1, 'How does the organization demonstrate that it confirms customer requirements when no documented statement of requirement is provided by the customer?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', '*', '8.2.3'),
(99, 33, 1, 'How does the organization ensure that relevant documented information is amemded, and that relevant persons are made aware of the changed requirements, when the requirements for products and serviecs have been changed?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.2.4'),
(101, 34, 3, 'Is evidence available that the organization plans and controls the design and development of products and services, considering the nature,duration and complexity of the design activities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.2'),
(102, 34, 3, 'Does the organization determine the following during the design and development planning stage: The review, verification and validation appropriate to each design and development stage', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, '*', '8.3.2'),
(103, 34, 3, 'Has the organization considered the responsibilities and authorities for design and devlopment?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.2'),
(104, 34, 3, 'Are the interfaces between different groups involved in design and development managed to ensure effective communication and clear assignment of responsibility, involvement of customer and/or user groups.', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.2'),
(105, 34, 3, 'Does the organization maintain documented information to demonstrate that the design and development\nrequirements have been met?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.2'),
(106, 35, 3, 'Are inputs relating to product requirements determined and documented information maintained relating to:\n•  Functional and performancerequirements?\n•  Applicable statutory and regulatory requirements?\n•  Applicable information from previous similar designs?\n•  Other requirements essential for designand development?\n•  Level of control by customers and other relevant interestedparties.\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.3'),
(107, 35, 3, 'Does the organization have evidence to indicate that design and development inputs have been reviewed for adequacy; and that requirements are unambiguous and not in conflict with each other?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.3'),
(108, 37, 3, 'Does the organization have controls in place to ensure that the results to be achieved are clearly defined; Design and development reviews are planned and conducted; verification activities are conducted to ensure all inputs are met?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.4'),
(109, 37, 3, 'Does the organization have a validation process to ensure suitability for intended use?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.4'),
(110, 37, 1, 'Does the organization conduct a verification process to ensure that design and development outputs have satisfied the design and development input requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.3.4'),
(111, 37, 3, 'Is design and development validation conducted to ensure that the resulting product is capable of fulfilling the requirements for the specified or known intended use or application?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.4'),
(112, 39, 3, 'Does the organization have controls in place to ensure: Input requirements have been met; outputs are adequate for the subsequent processes of the provision of products and services; identification of monitoring and measuring requirements, and the acceptance criteria; design products are fit for intended purpose and their safe and proper use?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.5'),
(113, 40, 3, 'Does the organization maintain documented information for the design and development activities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.6'),
(114, 40, 3, 'Does the organization ensure that the design and development changes are: controlled during and after the design and development process; identified, reviewed, verified and validated as appropriate; evaluated for effect on constituent parts and delivered products; approved before implementation?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.6'),
(115, 40, 3, 'Does the organization consider design and development changes to ensure that it does not have an adverse impact on conformity to requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.6'),
(116, 40, 3, 'Does the organization maintain documented information on results of changes and any necessary actions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.3.6'),
(117, 42, 1, 'What processes exist to ensure that externally provided processes, products and services conform to specified purchase requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.4.1'),
(118, 42, 1, 'Are the requirements in 8.4.2 applied to all suppliers who: Provide products for incorporation in the products; Provide products directly to thecustomers; Provide full or partial outsourced processto the organization.', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.4.1'),
(119, 42, 3, 'Are external providers evaluated and selected; monitored for performance and re-evaluated based upon their ability to supply product in accordance with the organization requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.4.1'),
(120, 42, 3, 'Is documented information of the results of supplier evaluations and any necessary actions arising from evaluations maintained?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.4.1'),
(121, 43, 1, 'Does the external provider monitoring process take into consideration: The type and extent of controls to be applied; The potential impact of the externally provided processes, products and services on the ability to meet applicable statutory and regulatory requirements; ', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.4.2'),
(122, 43, 1, 'Does the external provider monitoring process take into consideration the perceived effectiveness of the controls applied by the external provider?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.4.2'),
(123, 43, 1, 'Have the necessary verification processes been implemented to ensure that externally provided processes, products and services do not adversely affect the organization’s ability to meet customer\nrequirements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.4.2'),
(124, 43, 1, 'Does the controls of outsourced processess and functions remain within the scope of the organization\'s QMS?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.4.2'),
(125, 43, 1, 'Is documented information maintained as a result of evaluation, monitoring and re-evaluation\nof external providers?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.4.2'),
(126, 43, 3, 'Have inspections or other activities necessary for ensuring that purchased product meets specified purchase requirements been established and implemented?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.4.2'),
(127, 44, 3, 'Does the organization ensure communication is provided to external providers concerning: Products and services to be provided or provided on behalf of the organization; Approval of products and services, methods, processes or equipment; Competence of personnel, including needed qualification; Interactions with the organization’s QMS; Control and monitoring of the external provider’sperformance ?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.4.3'),
(128, 44, 3, 'Does the organization ensure communication is provided to external providers concerning Notification of verification activities to be conducted by the organization at the external provider’spremises', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.4.3'),
(129, 44, 3, 'Is the adequacy of specified purchase requirements ensured prior to their communication to the supplier', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.4.3'),
(130, 46, 1, 'Are production and service operations carried out under controlled conditions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.1'),
(131, 46, 1, 'What evidence does the organization have to demonstrate production and service operate under controlled conditions? Controlled conditions shall include as applicable the following: The availability of information that describes the characteristics of the product; The availability of the required documented information;  The use of suitable equipment; The availability and use of monitoring and measurement resources; The implementation of monitoring and measurement; The implementation of release, delivery and post-delivery activities; The competency requirements or qualification of personnel; The implementation of products and services release, delivery and post-delivery activities.', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.1'),
(132, 46, 3, 'Can it be demonstrated that measurement and monitoring of the product is carried out at various stages of the product realization process in accordance with planned arrangements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.5.1'),
(133, 46, 1, 'Are production and service processes validated, and periodically revalidated, where the resulting output cannot be verified by subsequent monitoring or measurement?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.1'),
(134, 48, 1, 'Are process outputs identified, as appropriate, by suitable means throughout the product/service\nrealization process?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.2'),
(135, 48, 1, 'Is product status identified with respect to measuring and monitoring requirements\nthroughout product realization?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.2'),
(136, 48, 1, 'Is traceability a specified requirement? If so, is unique identification of the product outputs\ncontrolled and documented information maintained to ensure adequatetraceability?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.2'),
(137, 49, 1, 'Is customer property provided for the use or incorporation into the product under the control or use of the organization? If so, does a process exist which ensures that care is provided for\ncustomer or external provider property?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.3'),
(138, 49, 1, 'Is the organization reporting to the customer or external provider, when their property is incorrectly used, lost, damaged or otherwise found to be unsuitable for use?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.3'),
(139, 49, 1, 'How does the organization demonstrate that customer property is identified; verified; protected and safeguarded?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.3'),
(140, 50, 1, 'How does the organization demonstrate that product and constituent part to the product  are preserved during internal processing and delivery to the intended destination in order to maintain conformity to requirements?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.4'),
(141, 50, 1, 'As applicable, are product preservation methods established, as appropriate,for:                                              • Identification?\n• Handling?\n• Packaging?\n• Storage?\n• Protection\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.4'),
(142, 51, 3, 'Is the organization meeting requirements for post- delivery activities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.5.5'),
(143, 51, 1, 'With respect to post-delivery activities does the organization condsider the following:                                                                       •The risks associated with its products and services                                                                                                                                         • Customer requirements\n•  The nature, use and intended  lifetime of the products and services\n• Customer feedback\n• Statutory and regulatory requirements\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.5.5'),
(144, 52, 3, 'Are documented information maintained describing the results of the review of the changes, the personnel authorizing the change, and the necessary actions?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.5.6'),
(145, 53, 1, 'Are planned arrangements in place to ensure achievement of the product and service\nrequirements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.6'),
(146, 54, 3, 'Are documented information maintained as evidence of conformity with the acceptance\ncriteria and traceability to the person(s) authorizing release?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.6.'),
(147, 53, 1, 'Are controls in place to ensure that release of product and delivery of service to the customer do not proceed until all planned arrangements are satisfactorily completed? ', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.6'),
(148, 54, 3, 'Does the organization maintain documented information to identify the person authorizing the\nrelease?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.6.'),
(149, 56, 3, 'Are products and services that do not conform to the requirements, identified and controlled to prevent their\nunintended use or delivery?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '8.7'),
(150, 56, 1, 'Has the organization taken appropriate actions in addressing non conformities detected based on its nature and the impact it has on conformity of products and services? (This also applies to non conforming products and services detected after delivery of products, during or after the provision of services) ', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.7'),
(151, 56, 1, 'In addressing non conformities detected, does the organization utelize any of the methods:                                                    • Correction\n• Segregation, containment\n• Informing the customer\n• Obtaining authorization for use “as-is”, continuation or acceptance under concession.\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.7'),
(152, 56, 1, 'Does the organization maintain documented information that: Describes the nonconformity; describes the actions taken; describes concessions obtained; and identifies the authority deciding the action in respect of the nonconformity?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.7'),
(153, 56, 1, 'Are corrected nonconforming products and services verified for compliance after rework?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '8.7'),
(156, 57, 3, 'Has the organization identified                                                                                                                                                          • What has to be monitored\n• The methods for monitoring, measurement, analysis, evaluation\n• When the monitoring is to be performed\n• When the results are to be analyzed.\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'Yes', '9.1.1'),
(157, 57, 3, 'Does the organization maintain documented information to ensure that the monitoring and measurement activities are implemented in accordance with the above\nrequirements?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'Yes', '9.1.1'),
(158, 57, 3, 'Does this evaluation include review of the quality performance data to ensure effectiveness of the\nquality management system?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'Yes', '9.1.1'),
(159, 58, 3, 'Is information relating to customer perception to whether the organization has fulfilled customer requirements monitored?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'Yes', '9.1.2'),
(160, 58, 3, 'Is information obtained related to customer views and opinions of the organization and its products and services?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '9.1.2'),
(161, 58, 3, 'Is the method for obtaining and using the customer satisfaction information determined?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '9.1.2'),
(162, 59, 1, 'Does the organization analyze and evaluate the data arising from monitoring and measurement?\nactivities?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '9.1.3'),
(163, 59, 1, 'Is the organization using the sources of data to:\n• Demonstrate conformity of products and services to requirements?\n• Assess and enhance customer satisfaction?\n• Ensure conformity of effectiveness of the quality managementsystem?\n• Demonstrate that planning has been successfully implemented?\n• Assess the performance ofprocesses?\n• Assess the performance of external providers?\n• Determine the need or opportunities for improvement within the quality management system', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'Yes', '9.1.3'),
(164, 59, 3, 'Are the results of the above analysis provided as input to management review?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'Yes', '9.1.3'),
(166, 60, 3, 'Is evidence available to confirm that internal audits are conducted at planned intervals based upon:\n•  The status and importance of the processes and areas to be audited?\n• The results of previous audits?\n• Customer feedback?\n• Changes impacting the organization?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '9.2.1'),
(167, 60, 3, 'Does the internal quality audit activity determine whether the quality management system:\n•  Conforms to planned arrangements?\n•  Conforms to ISO 9001:2015?\n•  Conforms to quality management system requirements established by the organization?\n• Is effectively implemented and maintained?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '9.2.1'),
(168, 61, 3, 'Have audit criteria, scope, frequency and methods been defined?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '9.2.2'),
(169, 61, 1, 'Is evidence available to confirm that internal auditors do not audit their own work, and are\nobjective and impartial of the audit process?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '9.2.2'),
(170, 61, 1, 'Does the management responsible for the area being audited ensure that any necessary corrections and corrective actions are taken without undue delay to eliminate detected\nnonconformities and their causes?\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '9.2.2'),
(171, 61, 3, 'Are documented information maintained as evidence of the implementation of the audit?\nprogram and the audit results?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '9.2.2'),
(173, 62, 1, 'Does top management review the quality management system at planned intervals to\nensure its continuing suitability, adequacy and effectiveness?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '9.3.1'),
(174, 62, 1, 'Does management review evaluate the need for changes to the quality management system, including the quality policy and quality objectives?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '9.3.1'),
(175, 62, 3, 'Is documented information maintained as the result of management reviews?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '9.3.1'),
(176, 63, 1, 'Do the inputs to management review include information on the following (including quality indicators (if any):\n• Results of audits\n• Customer Satisfaction\n• Nonconformities and Corrective Actions\n• Monitoring and measurement results\n• Issues concerning external providers and other relevant interested parties\n• Adequacy of resources\n• Process performance and conformity of products andservices\n• Effectiveness of actions taken to address risks and opportunities.\n• Performance of external suppliers.\n', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '9.3.2'),
(177, 64, 1, 'Do the outputs from management review include decisions and actions related to:\n• Improvement of the effectiveness of the quality management system and itsprocesses?\n• Improvement of product related to customer requirements?\n•Resource needs?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '9.3.3'),
(178, 64, 3, 'Does the organization maintain documented information as evidence of management reviews?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '9.3.3'),
(179, 64, 3, ' Does management review evaluate the need for changes to the quality management system, including the quality policy and quality objectives?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '9.3.3'),
(180, 66, 1, 'Is the organization selecting opportunities for improvement and implementing necessary actions to meet customer requirements?', 1, '', 2, 1, '2019-12-18 03:07:48', 18, 'String', 'Text', 'yes', '10.1'),
(181, 66, 1, 'Is the organization taking actions to prevent nonconformities, improve products and services, and improve the overall quality management system results?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '10.1'),
(182, 67, 1, 'In the presence of a nonconformity, does the organization\n• React to the nonconformity by taking actions to control and correct it, and dealing with its consequences\n• Evaluate the need for action to eliminate the cause                                                                                                                    • Implement any action needed\n• Review the effective of any corrective action?\n• Make change to the quality management system?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '10.2.1'),
(183, 68, 3, 'Is documented information maintained to show the nature of the nonconformity and any subsequent actions taken, and the results of any corrective action taken?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '10.2.2'),
(184, 68, 1, 'In the presence of a nonconformity, does the organization react to the nonconformity by taking actions to control and correct it, and dealing with its consequences?', 1, '', 2, 1, '2019-12-18 03:08:53', 18, 'String', 'Text', 'yes', '10.2.2'),
(185, 68, 1, 'Are the actions taken appropriate to the effects, or potential effects of the nonconformity?', 1, NULL, 2, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'no', '10.2.2'),
(186, 68, 3, 'Are the corrective actions taken appropriate to the effects of the nonconformities encountered?', 1, '', 1, 1, '2019-12-18 03:08:44', 18, 'Boolean', NULL, 'yes', '10.2.2'),
(187, 68, 3, 'Is action taken to eliminate the causes of nonconformities in order to prevent recurrence?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'Boolean', NULL, 'yes', '10.2.2'),
(188, 69, 1, 'Is the organization continually improving the suitability, adequacy and effectiveness of the quality management system?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '10.3'),
(189, 69, 1, 'Are the outputs of analysis and evaluation, and the outputs from the management review process used to identify the areas of underperformances?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '10.3'),
(190, 69, 1, 'Are specialized tools and methodologies used for investigation of the causes of underperformance?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', '*yes', '10.3'),
(191, 69, 1, 'How does the organization demonstrate that the effectiveness of the quality management system is being\ncontinually improved?', 1, NULL, 1, 1, '2019-12-13 22:37:57', NULL, 'String', 'Text', 'yes', '10.3'),
(192, 70, 2, 'This is a test question', 1, '', 1, 1, '2019-12-18 01:20:57', 18, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `question_option`
--

DROP TABLE IF EXISTS `question_option`;
CREATE TABLE IF NOT EXISTS `question_option` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `option_desc` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `question_option`
--

INSERT INTO `question_option` (`id`, `question_id`, `option_desc`) VALUES
(29, 184, ''),
(27, 180, ''),
(28, 186, ''),
(26, 192, '');

-- --------------------------------------------------------

--
-- Structure de la table `question_type`
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
-- Déchargement des données de la table `question_type`
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
-- Structure de la table `report`
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `report`
--

INSERT INTO `report` (`id`, `report_code`, `report_desc`, `report_form`, `report_title`, `report_selection`) VALUES
(1, 'REP01', 'List of Clients', '/application/controllers/Repor01.php', 'List of Clients', 1),
(2, 'REP02', 'List of Consultations', '/application/controllers/Report02.php', 'List of Consultations', 1),
(4, 'REP04', 'Inquiries', '/application/controllers/Report04.php', 'Inquiries', 1),
(5, 'REP05', 'List of Consultations by County', 'application/controllers/Report05.php', 'List of Consultations  by County', 1),
(6, 'REP06', 'List of Settings', '/application/controllers/Report06.php', 'List of Settings', 2),
(7, 'REP0C', 'Client', '/appliation/controllers/Report_client.php', 'Client', 2),
(8, 'REP0I', 'Consultation', '/appliation/controllers/Report_consultation.php', 'Consultation', 2),
(9, 'REP08', 'List of Clauses', '/application/controllers/report08.php', 'List of Clauses', 1),
(10, 'REP07', 'List of sub-clauses', '/application/controllers/Report07.php', 'List of Sub-Clauses', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sector`
--

DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sector`
--

INSERT INTO `sector` (`id`, `name`, `active`) VALUES
(1, 'Industrial', 1),
(2, 'Agriculture', 1),
(3, 'Manufacturing', 1),
(4, 'Exports/Imports', 1);

-- --------------------------------------------------------

--
-- Structure de la table `standard`
--

DROP TABLE IF EXISTS `standard`;
CREATE TABLE IF NOT EXISTS `standard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `standard`
--

INSERT INTO `standard` (`id`, `code`, `name`, `active`) VALUES
(1, 'ISO9001', 'ISO 9001', 1),
(2, '2', 'Certification 2', 1),
(3, 'STA1', 'Standard 1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `status`
--

DROP TABLE IF EXISTS `status`;
CREATE TABLE IF NOT EXISTS `status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `phase_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `status`
--

INSERT INTO `status` (`id`, `code`, `phase_id`, `name`, `active`) VALUES
(11, '11', 1, 'Assigned', 1),
(12, '12', 1, 'Engaged', 1),
(13, '13', 1, 'Update request for customer', 1),
(14, '14', 1, 'Awaiting feedback from consultant', 1),
(15, '15', 1, 'Feedback submitted', 1),
(16, '16', 1, 'Changes implemented/Completed', 1),
(21, '21', 2, 'Assigned', 1),
(22, '22', 2, 'Engaged', 1),
(23, '23', 2, 'Update request for customer', 1),
(24, '24', 2, 'Awaiting feedback from consultant', 1),
(25, '25', 2, 'Feedback submitted', 1),
(26, '26', 2, 'Changes implemented/Completed', 1),
(31, '31', 3, 'Assigned', 1),
(32, '32', 3, 'Engaged', 1),
(33, '33', 3, 'Update request for customer', 1),
(34, '34', 3, 'Awaiting feedback from consultant', 1),
(35, '35', 3, 'Feedback submitted', 1),
(36, '36', 3, 'Changes implemented/Completed', 1),
(41, '41', 4, 'Training & Development', 1),
(42, '42', 4, 'Internal Audit', 1),
(43, '43', 4, 'Management review', 1),
(44, '44', 4, 'Pre certification', 1),
(45, '45', 4, 'Clean up NC', 1),
(46, '46', 4, 'Generate Manual', 1);

-- --------------------------------------------------------

--
-- Structure de la table `sub_clause`
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `sub_clause`
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
(70, 11, 1, '80.1', 'Here is the sub-clause for Standard 1', 1);

-- --------------------------------------------------------

--
-- Structure de la table `support_type`
--

DROP TABLE IF EXISTS `support_type`;
CREATE TABLE IF NOT EXISTS `support_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  `active` tinyint(1) NOT NULL COMMENT '1=active  2=inactive',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `support_type`
--

INSERT INTO `support_type` (`id`, `code`, `name`, `active`) VALUES
(1, 'RENS', 'Renseignements', 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `profile_id`, `username`, `password`, `email`, `name`, `phone`, `remark`, `active`, `updated_by`, `updated_date`) VALUES
(18, 5, 'voyagine', '$2y$10$zdSQoIZNy10Gs3uQhG0OF.8xucSKJyP5AEkuCkPY08axj/rNm7lrW', 'voyagine@hotmail.com', 'Carmen Gagnon', '5149836594', NULL, 1, 18, '2019-12-12 17:56:40'),
(23, 5, 'admin', '$2y$10$ZX.EHlOqIPmRWyrxP05zWuViAa1tq4lej3NnVRcsOsXh2SwF6nh8W', 'admin@hotmail.com', 'admin', '', NULL, 1, 18, '2019-12-18 20:08:01'),
(24, 5, 'bsjme', '$2y$10$LAzMxF3v4LDX3RNP8.RDo.9J5MPz2oilCkdByFkG6hMAAWY.mqpDm', 'bsjme@gmail.com', 'bsjme', '', NULL, 1, 18, '2019-12-09 23:43:02'),
(27, 4, 'TRN001', '$2y$10$stgkLqq5GW/hQhYIkz2bVeEBlYv6/zQCXWHVwlBOA8rRkCOEVCYta', 'client@hotmail.com', 'Client security', '5149836594', NULL, 1, 18, '2019-12-22 00:57:53'),
(28, 2, 'coordinator', '$2y$10$juoiwO/60oN5Ubwn.57WTeEuweYiMX8RtaaoUUDqq7qBUB7b2Oaim', 'coordinator@hotmail.com', 'Coordinator', '', NULL, 1, 18, '2019-12-18 20:04:18'),
(29, 3, 'consultant1', '$2y$10$/YPuhMPCEryZe2Hc/CcnFegKcTu4nldja.WL0QnZhvx9gKyGNmCRK', 'consultant1@hotmail.com', 'Consultant No 1', '123456789', NULL, 1, 18, '2019-12-18 20:07:50'),
(30, 3, 'consultant2', '$2y$10$8EjzOfJ7W9mAyq9jNEz1POGLENZX9excWKpl505iDzXbyQzeK1SkS', 'consultant2@hotmail.com', 'Consultant No 2', '', NULL, 1, 18, '2019-12-18 20:08:33'),
(31, 3, 'consultant3', '$2y$10$LNvKCbDAmYkBL93oQlZH1uC.k4Qje.xC8JFkOdSzzdvQaBM9ERUTK', 'consultant3@hotmail.com', 'Consultant No 3', '', NULL, 1, 18, '2019-12-18 20:09:11'),
(37, 4, 'TRN002', '$2y$10$4p8/hRM7XRvDeil0pxGeKORuFDR7JJnMv.M45jKajF523RqGUi7Um', 'voyagine@hotmail.com', 'M. Untel', 'phone', NULL, 1, 18, '2019-12-23 17:54:46'),
(38, 4, 'TRN003', '$2y$10$FnwBu5YX5GSpu5T0sXcNvulVbC7tBBglrCPteknl..B6eODAxoBIi', 'voyagine@hotmail.com', 'Client No 3', '05149836594', NULL, 1, 18, '2019-12-23 17:59:28');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
