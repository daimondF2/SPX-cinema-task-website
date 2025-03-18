-- --------------------------------------------------------
-- Host:                         spx-webtest-s01
-- Server version:               8.0.33 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Dumping structure for table yee10db.auditlog
DROP TABLE IF EXISTS `auditlog`;
CREATE TABLE IF NOT EXISTS `auditlog` (
  `auditLogId` int NOT NULL AUTO_INCREMENT,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `entity` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `entry` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `memberId` int DEFAULT NULL,
  PRIMARY KEY (`auditLogId`),
  KEY `memberId` (`memberId`),
  CONSTRAINT `memberId` FOREIGN KEY (`memberId`) REFERENCES `members` (`memberId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=377 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table yee10db.auditlog: ~191 rows (approximately)
INSERT INTO `auditlog` (`auditLogId`, `timestamp`, `entity`, `action`, `entry`, `memberId`) VALUES
	(1, '2025-02-18 02:59:30', 'thing', 'thing', 'thing', 1),
	(2, '2025-02-18 03:00:39', 'test', 'test', 'test', 1),
	(4, '2025-02-18 03:19:52', 'joe2', 'password', 'Joe', NULL),
	(5, '2025-02-18 03:19:52', 'joe3', 'password2', 'Joe', NULL),
	(6, '2025-02-19 03:52:24', 'User', 'logout', 'memberId:17, UserName:thunk - has logged out', 1),
	(7, '2025-02-19 03:52:24', 'User', '', 'DESTROY member object: memberId:17, UserName:thunk', 1),
	(8, '2025-02-19 04:05:41', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<thinker>', 1),
	(9, '2025-02-19 04:05:42', 'User', 'Save', 'Add Successful: memberId:0, UserName:thinker', 1),
	(10, '2025-02-19 22:00:28', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<AuditTest>', NULL),
	(12, '2025-02-19 22:02:56', 'User', 'User Exists Check', 'Verified: User Exists: <AuditTest>', NULL),
	(13, '2025-02-19 22:03:52', 'User', 'User Exists Check', 'Verified: User Exists: <AuditTest>', NULL),
	(14, '2025-02-19 22:24:21', 'User', 'User Exists Check', 'Verified: User Exists: <AuditTest>', NULL),
	(15, '2025-02-19 22:25:19', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<AuditTest>', NULL),
	(17, '2025-02-19 22:51:28', 'User', 'User Exists Check', 'Verified: User Exists: <AuditTest>', NULL),
	(18, '2025-02-19 22:51:29', 'User', '', 'DESTROY member object: memberId:, UserName:AuditTest', NULL),
	(22, '2025-02-19 23:05:56', 'User', 'Save', 'Update Successful: memberId:18, UserName:thinker', NULL),
	(30, '2025-02-19 23:23:46', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(31, '2025-02-19 23:24:13', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<thinker>', NULL),
	(51, '2025-02-20 22:57:09', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(52, '2025-02-20 22:57:25', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<think>', NULL),
	(55, '2025-02-20 23:26:15', 'User', 'User Exists Check', 'Verified: User Exists: <think>', NULL),
	(56, '2025-02-20 23:26:15', 'User', '', 'DESTROY member object: memberId:, UserName:think', NULL),
	(57, '2025-02-20 23:26:32', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(58, '2025-02-20 23:26:41', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<thought>', NULL),
	(61, '2025-02-20 23:28:26', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(62, '2025-02-20 23:29:18', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<thought>', NULL),
	(65, '2025-02-20 23:31:02', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(66, '2025-02-20 23:31:06', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(67, '2025-02-20 23:31:25', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<thought>', NULL),
	(68, '2025-02-20 23:31:25', 'User', 'New User', 'Add Successful: memberId:0, UserName:thought', NULL),
	(83, '2025-02-20 23:33:06', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(84, '2025-02-20 23:33:22', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<thought>', NULL),
	(85, '2025-02-20 23:33:22', 'User', 'New User', 'Add Successful: memberId:0, UserName:thought', NULL),
	(90, '2025-02-20 23:33:39', 'User', 'Delete', 'Delete Successful: memberId:26, UserName:thought', NULL),
	(92, '2025-02-20 23:33:39', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(93, '2025-02-21 00:26:02', 'User', '', 'UserName: <<script>alert(1)</script>>: - Failed Login: Invalid userName.', NULL),
	(94, '2025-02-21 00:26:03', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(95, '2025-02-24 01:05:24', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(96, '2025-02-24 01:05:48', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<heyyy>', NULL),
	(97, '2025-02-24 01:05:48', 'User', 'New User', 'Add Successful: memberId:0, UserName:heyyy', NULL),
	(107, '2025-02-24 01:12:36', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(108, '2025-02-24 01:12:58', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<XSS>', NULL),
	(109, '2025-02-24 01:12:59', 'User', 'New User', 'Add Successful: memberId:0, UserName:XSS', NULL),
	(121, '2025-02-24 01:24:56', 'User', 'Login', 'UserName:XSS: - Failed Login: Invalid Password', NULL),
	(123, '2025-02-24 01:29:22', 'User', 'Login', 'UserName:XSS: - Failed Login: Invalid Password', NULL),
	(125, '2025-02-24 01:30:49', 'User', 'Login', 'UserName:XSS: - Failed Login: Invalid Password', NULL),
	(127, '2025-02-24 01:31:53', 'User', '', 'UserName: <<script>alert(2)</script> >: - Failed Login: Invalid userName.', NULL),
	(128, '2025-02-24 01:31:53', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(129, '2025-02-24 01:31:59', 'User', '', 'UserName: <<script>alert(2)</script> >: - Failed Login: Invalid userName.', NULL),
	(130, '2025-02-24 01:31:59', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(131, '2025-02-24 01:32:08', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(132, '2025-02-24 01:32:20', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<xSS2>', NULL),
	(133, '2025-02-24 01:32:21', 'User', 'New User', 'Add Successful: memberId:0, UserName:xSS2', NULL),
	(135, '2025-02-24 01:32:28', 'User', 'Login', 'UserName:xSS2: - Failed Login: Invalid Password', NULL),
	(137, '2025-02-24 01:33:56', 'User', 'Login', 'UserName:xSS2: - Failed Login: Invalid Password', NULL),
	(139, '2025-02-24 13:32:33', 'User', '', 'UserName: <<script>alert(1)</script> >: - Failed Login: Invalid userName.', NULL),
	(140, '2025-02-24 13:32:33', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(141, '2025-02-24 13:32:39', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(142, '2025-02-24 13:32:59', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(143, '2025-02-24 13:33:12', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(144, '2025-02-24 13:33:30', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<t>', NULL),
	(145, '2025-02-24 13:33:30', 'User', 'New User', 'Add Successful: memberId:0, UserName:t', NULL),
	(147, '2025-02-24 13:33:38', 'User', 'Login', 'UserName:t: - Failed Login: Invalid Password', NULL),
	(154, '2025-02-24 13:35:48', 'User', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL),
	(156, '2025-02-24 13:43:12', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(157, '2025-02-24 13:43:42', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(158, '2025-02-24 13:43:43', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(159, '2025-02-24 13:43:43', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(160, '2025-02-24 13:44:00', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(161, '2025-02-24 13:44:01', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(162, '2025-02-24 13:44:01', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(163, '2025-02-24 13:44:08', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(164, '2025-02-24 13:44:08', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(165, '2025-02-24 13:44:08', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(166, '2025-02-24 13:44:17', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(167, '2025-02-24 13:44:17', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(168, '2025-02-24 13:44:17', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(169, '2025-02-24 13:45:13', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(170, '2025-02-24 13:45:32', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<h>', NULL),
	(171, '2025-02-24 13:45:32', 'User', 'New User', 'Add Successful: memberId:0, UserName:h', NULL),
	(173, '2025-02-24 13:45:38', 'User', 'Login', 'UserName:h: - Failed Login: Invalid Password', NULL),
	(175, '2025-02-24 13:45:46', 'User', 'Login', 'UserName:h: - Failed Login: Invalid Password', NULL),
	(177, '2025-02-24 13:48:24', 'User', '', 'UserName: <h>: - Failed Login: Invalid userName.', NULL),
	(178, '2025-02-24 13:48:24', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(179, '2025-02-24 13:48:28', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(180, '2025-02-24 13:48:32', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(181, '2025-02-24 13:48:36', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(182, '2025-02-24 13:48:49', 'User', '', 'UserName: <t>: - Failed Login: Invalid userName.', NULL),
	(183, '2025-02-24 13:48:49', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(184, '2025-02-24 13:49:09', 'User', 'Login', 'UserName:xSS2: - Failed Login: Invalid Password', NULL),
	(186, '2025-02-24 13:49:11', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(187, '2025-02-24 13:49:22', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<xss3>', NULL),
	(188, '2025-02-24 13:49:22', 'User', 'New User', 'Add Successful: memberId:0, UserName:xss3', NULL),
	(190, '2025-02-24 13:49:27', 'User', 'Login', 'UserName:xss3: - Failed Login: Invalid Password', NULL),
	(192, '2025-02-24 13:50:21', 'User', 'Login', 'UserName:xss3: - Failed Login: Invalid Password', NULL),
	(194, '2025-02-24 13:50:24', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(195, '2025-02-24 13:50:34', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<xsstest>', NULL),
	(196, '2025-02-24 13:50:34', 'User', 'New User', 'Add Successful: memberId:0, UserName:xsstest', NULL),
	(198, '2025-02-24 13:50:50', 'User', 'Login', 'UserName:xsstest: - Failed Login: Invalid Password', NULL),
	(200, '2025-02-24 13:54:03', 'User', 'Login', 'UserName:xsstest: - Failed Login: Invalid Password', NULL),
	(202, '2025-02-24 13:54:14', 'User', 'Login', 'UserName:xsstest: - Failed Login: Invalid Password', NULL),
	(204, '2025-02-24 13:54:53', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(205, '2025-02-24 13:55:27', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<xss4>', NULL),
	(206, '2025-02-24 13:55:27', 'User', 'New User', 'Add Successful: memberId:0, UserName:xss4', NULL),
	(208, '2025-02-24 13:55:33', 'User', 'Login', 'UserName:xss4: - Failed Login: Invalid Password', NULL),
	(210, '2025-02-24 14:04:15', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(211, '2025-02-24 14:04:27', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<b>', NULL),
	(212, '2025-02-24 14:04:27', 'User', 'New User', 'Add Successful: memberId:0, UserName:b', NULL),
	(221, '2025-02-24 14:04:48', 'User', 'Login', 'UserName:b: - Failed Login: Invalid Password', NULL),
	(223, '2025-02-25 00:06:41', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(224, '2025-02-25 00:06:54', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<testin>', NULL),
	(225, '2025-02-25 00:06:54', 'User', 'New User', 'Add Successful: memberId:0, UserName:testin', NULL),
	(227, '2025-02-25 00:07:02', 'User', 'Login', 'UserName:testin: - Failed Login: Invalid Password', NULL),
	(229, '2025-02-25 00:07:55', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(230, '2025-02-25 00:11:55', 'User', '', 'UserName: <t>: - Failed Login: Invalid userName.', NULL),
	(231, '2025-02-25 00:11:55', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(232, '2025-02-25 00:12:08', 'User', '', 'UserName: <t>: - Failed Login: Invalid userName.', NULL),
	(233, '2025-02-25 00:12:08', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(234, '2025-02-25 00:12:13', 'User', '', 'UserName: <t>: - Failed Login: Invalid userName.', NULL),
	(235, '2025-02-25 00:12:13', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(236, '2025-02-25 00:12:18', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(237, '2025-02-25 00:13:13', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<fill>', NULL),
	(238, '2025-02-25 00:13:13', 'User', 'New User', 'Add Successful: memberId:0, UserName:fill', NULL),
	(240, '2025-02-25 00:13:18', 'User', 'Login', 'UserName:fill: - Failed Login: Invalid Password', NULL),
	(242, '2025-02-25 00:13:34', 'User', 'Login', 'UserName:fill: - Failed Login: Invalid Password', NULL),
	(244, '2025-02-25 00:17:22', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(245, '2025-02-25 00:33:35', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(246, '2025-02-25 00:33:37', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(247, '2025-02-25 00:34:30', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<xss5>', NULL),
	(248, '2025-02-25 00:34:30', 'User', 'New User', 'Add Successful: memberId:0, UserName:xss5', NULL),
	(250, '2025-02-25 00:34:40', 'User', '', 'UserName: <t>: - Failed Login: Invalid userName.', NULL),
	(251, '2025-02-25 00:34:40', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(252, '2025-02-25 00:35:17', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(253, '2025-02-25 00:35:40', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<poketest>', NULL),
	(254, '2025-02-25 00:35:41', 'User', 'New User', 'Add Successful: memberId:0, UserName:poketest', NULL),
	(279, '2025-02-25 00:47:34', 'User', '', 'UserName: <<script>alert(1)</script>>: - Failed Login: Invalid userName.', NULL),
	(280, '2025-02-25 00:47:34', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(281, '2025-02-25 23:25:39', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(282, '2025-02-27 02:40:08', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(283, '2025-02-27 02:40:37', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(284, '2025-02-27 02:40:37', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(285, '2025-02-27 02:40:48', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(286, '2025-02-27 02:41:00', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(287, '2025-02-27 02:41:05', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(288, '2025-02-27 02:57:05', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(289, '2025-02-27 02:57:15', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(290, '2025-02-27 03:32:12', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(291, '2025-02-27 03:33:02', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<test>', NULL),
	(292, '2025-02-27 03:33:03', 'User', 'New User', 'Add Successful: memberId:0, UserName:test', NULL),
	(299, '2025-02-27 03:48:37', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(300, '2025-02-27 03:48:58', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<fill>', NULL),
	(301, '2025-02-27 03:48:58', 'User', 'New User', 'Add Successful: memberId:0, UserName:fill', NULL),
	(303, '2025-02-27 03:49:06', 'User', 'Login', 'MemberId:41, UserName:fill - Successful login.', 41),
	(304, '2025-02-27 03:49:06', 'User', '', 'DESTROY member object: memberId:41, UserName:fill', 41),
	(305, '2025-02-27 03:49:09', 'User', '', 'DESTROY member object: memberId:41, UserName:fill', 41),
	(306, '2025-03-02 23:02:38', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(307, '2025-03-02 23:31:05', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(308, '2025-03-02 23:31:11', 'User', '', 'UserName: <duf>: - Failed Login: Invalid userName.', NULL),
	(309, '2025-03-02 23:31:11', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(310, '2025-03-02 23:33:12', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(311, '2025-03-02 23:33:22', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<thinker>', NULL),
	(312, '2025-03-02 23:33:22', 'User', 'New User', 'Add Successful: memberId:0, UserName:thinker', NULL),
	(314, '2025-03-02 23:33:29', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(315, '2025-03-02 23:33:39', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<thinker1>', NULL),
	(316, '2025-03-02 23:33:40', 'User', 'New User', 'Add Successful: memberId:0, UserName:thinker1', NULL),
	(318, '2025-03-02 23:33:56', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(319, '2025-03-02 23:34:05', 'User', 'User Exists Check', 'Verified: User Exists: <thinker1>', NULL),
	(320, '2025-03-02 23:34:05', 'User', '', 'DESTROY member object: memberId:, UserName:thinker1', NULL),
	(321, '2025-03-02 23:34:44', 'User', 'User Exists Check', 'Verified: User Exists: <thinker1>', NULL),
	(322, '2025-03-02 23:34:44', 'User', '', 'DESTROY member object: memberId:, UserName:thinker1', NULL),
	(323, '2025-03-02 23:36:09', 'User', 'User Exists Check', 'Verified: User Exists: <thinker1>', NULL),
	(324, '2025-03-02 23:36:09', 'User', '', 'DESTROY member object: memberId:, UserName:thinker1', NULL),
	(325, '2025-03-02 23:39:38', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(326, '2025-03-02 23:39:45', 'User', '', 'UserName: <thio>: - Failed Login: Invalid userName.', NULL),
	(327, '2025-03-02 23:39:45', 'User', '', 'DESTROY member object: memberId:, UserName:', NULL),
	(328, '2025-03-02 23:39:49', 'User', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL),
	(357, '2025-03-05 22:04:50', 'User', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL),
	(358, '2025-03-05 22:05:08', 'User', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL),
	(359, '2025-03-05 22:07:16', 'User', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL),
	(360, '2025-03-05 22:07:21', 'User', '', 'UserName: <eg>: - Failed Login: Invalid userName.', NULL),
	(366, '2025-03-10 03:34:14', 'User', 'Delete', 'Delete Successful: memberId:40, UserName:test', NULL),
	(367, '2025-03-11 00:41:55', 'member', 'User Exists Check', 'Verified: User Does Not Exist:<test>', NULL),
	(368, '2025-03-11 00:41:55', 'member', 'New User', 'Add Successful: memberId:0, UserName:test', NULL),
	(369, '2025-03-11 00:42:03', 'member', 'Login', 'MemberId:44, UserName:test - Successful login.', 44),
	(370, '2025-03-11 00:42:50', 'member', 'Save', 'Update Successful: memberId:44, UserName:test', 44),
	(371, '2025-03-11 00:43:18', 'member', 'logout', 'memberId:44, UserName:test - has logged out', 44),
	(372, '2025-03-11 00:43:25', 'member', '', 'UserName: <sdgui>: - Failed Login: Invalid userName.', NULL),
	(373, '2025-03-11 00:44:45', 'member', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL),
	(374, '2025-03-11 23:03:58', 'member', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL),
	(375, '2025-03-11 23:12:08', 'member', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL),
	(376, '2025-03-11 23:12:12', 'member', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL);

-- Dumping structure for table yee10db.class
DROP TABLE IF EXISTS `class`;
CREATE TABLE IF NOT EXISTS `class` (
  `classId` int NOT NULL AUTO_INCREMENT COMMENT 'uniquelly identifies each row in this table',
  `className` tinytext NOT NULL,
  PRIMARY KEY (`classId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table yee10db.class: ~2 rows (approximately)
INSERT INTO `class` (`classId`, `className`) VALUES
	(1, '12SEN'),
	(2, '12CLASS');

-- Dumping structure for table yee10db.members
DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `memberId` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `firstName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `lastName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `role` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `street` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `town` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `postcode` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`memberId`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table yee10db.members: ~5 rows (approximately)
INSERT INTO `members` (`memberId`, `username`, `password`, `firstName`, `lastName`, `role`, `street`, `town`, `state`, `postcode`, `phone`, `email`) VALUES
	(1, 'daMelonShark', 'iLoveAdo', 'Kazuo', 'Lee', 'Student', NULL, NULL, NULL, NULL, NULL, NULL),
	(41, 'fill', '$2y$10$/5dy987WSxwGX2ADu6wFFevX1cV9NLS4pBlsKEDuWmQtcTs0EDUUe', '', '', NULL, '', '', '', '', '', ''),
	(42, 'thinker', '$2y$10$9jAMIwTksjsMIFnBuo8BnemuBVscaDzEwUDVmTOWXDXdZb4jssE56', 'YvSqLvecltn6OiXkHPoKk9OR6l7q28lgR0WcyNeej2/uj8JTYbiw601lY/8OfT4HS1JhNHJaSmUxQ2sxTlRUVDN3SkhFQT09', '6xV9N0AWjavbCer+8VyAPQ/di92I3YsjqXbP13cyql6aCuMTQ2tCnvK9oSqgdzOfS3JBS3RvcC9YVzhncVBuVitlbnRyUT09', NULL, '+pRVgm3S5s/P5ZzSTOshCOPWidLFXPFx23a0mTzmEeEvIPbNSyb9EIG/3TBO8JIwZE90WE1lakY2SXNUeWRHcWtpaVZ2QT09', 'HRg5gLIFFNqwDHvfSjCC7fM+Y6WxMaRWnMwT/G+1NFdcfqsgJppRHHfZQ3kRXPpEU0tqUnpuVEtJSVFzSzNpVlhjS2JpUT09', 'pwlKEu+tXW5R2xe7nrqxHpNSFrTGmU4x9eiqzX+pHBmJQfUTYshf7IzCp0/SNXRnMFJZeTNtUFdsR2tPaFpyeWVSLzdnUT09', '+yHTdn3+BSaqicfPN7aDNvG0Z8luCRsrVl50A5Jt6QISCRYbLv4BC07FTG6GSO4nUG11NUtHUVg2bUZlU1dpeWw1OFRqdz09', '4LquQE54k9yvIXVxuGb+PXlW73iqVYTc8v6+sgd9Cij2TZ61aJjwYVao2lXHbDmAYndjQ0VXUFp4Z3RwdXd6ai9XWHptZz09', 'UISYmoNwJgb0ubJysDqOMA3cSSWh6Ae/ZK2pfLDIX5WO/GK630CHUBdrq2hfp7ZQbzNRM1JMa2M3d3AveHdSTmlXTk9XZm4valNUWlltNFZJYnVPK2hZbUFhdz0='),
	(43, 'thinker1', '$2y$10$9xjF1Ozedp9n3jr00X7ZpuOb.7bM0vdoEnUvAXAN3wYO44DNgqeWC', '', '', NULL, '', '', '', '', '', ''),
	(44, 'test', '$2y$10$FF8kHpKTKMRxDXjliINec.gGLrHcU0E5xcdYeGULvgOaoFLz4.Yz.', 'udSrXKfag8j2GpRzOmcHINpozy8IM4lWnK6XNSujuu8KkGB6jlo4jb1CSEYIwj+BWXdOYzlPUnl6TDBjNVFWQWhBSm13Zz09', '0LY6oDZidcwPf2h55EISbExfZc+vYq0qItoAk4KJFyHPYdjAEgdF5Aw2KtVKkgtIK0EvZDRGeG1HTnhUajBWdXphSDNUdz09', NULL, 'EB9UwAwg+TvqOJ6RXgZLFg3PKPu4F1AnKhtnCejsC4qf/7JyoHrqPKczsV1oGasuYlBZTDVvM0VSb0tvWHQzTzNHMHI0QT09', 'WAwV385s3msWTMDz9HlRt+RD7tZKD8eUpnV3A4nY9mbWEu086wutAzIK/YW6p6CGS2J3YWxNOWp3ZFR0eU4xZ2FCMlJxUT09', 'h+uLuvJ/cKUusxThOdwaPtDODYxf/KLQ18iXWQoSdfa+a0OzYkKMzcAsBmzdMRISTWtuaDUzcmEzRUZXSkVJb05zbVladz09', 'qJ9KJVsBefS7BO4Esf/XuNkUepQe1qSny40sqpWGVViQZqq8W2GuPLPyy+MkS1tqZGVuNEZNdjJZNjNxbi9GeE1VMlRPQT09', 'BENorW94WIF8B0swmw/zXBNpK5RCZPj0Hty5b4d/80FM3q4vmn2fh9bm8JZm0D7xbkFNVFJkRmtPU1VrMmFVRmJLdk1QZz09', 'HjgKMjTdX2Kh81VT1RAbVlnh6T2YsKOMM/EvbrmSRSO51wXIWt+iK4ce0VFp2utDcWEzVlU4OEcvTnVpbjZPZkVnejdSb21CY1RxendCclYxcFhxQ1k0WDBTZz0=');

-- Dumping structure for table yee10db.student
DROP TABLE IF EXISTS `student`;
CREATE TABLE IF NOT EXISTS `student` (
  `StudentID` int NOT NULL AUTO_INCREMENT,
  `studentName` varchar(50) NOT NULL,
  `classId` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`StudentID`),
  KEY `FK_student_class` (`classId`),
  CONSTRAINT `FK_student_class` FOREIGN KEY (`classId`) REFERENCES `class` (`classId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table yee10db.student: ~1 rows (approximately)
INSERT INTO `student` (`StudentID`, `studentName`, `classId`) VALUES
	(2, 'Bob', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
