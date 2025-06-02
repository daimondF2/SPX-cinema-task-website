-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
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

-- Dumping structure for table 12sendb.auditlog
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
) ENGINE=InnoDB AUTO_INCREMENT=560 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 12sendb.auditlog: ~125 rows (approximately)
INSERT INTO `auditlog` (`auditLogId`, `timestamp`, `entity`, `action`, `entry`, `memberId`) VALUES
	(1, '2025-02-18 02:59:30', 'thing', 'thing', 'thing', 1),
	(2, '2025-02-18 03:00:39', 'test', 'test', 'test', 1),
	(4, '2025-02-18 03:19:52', 'joe2', 'password', 'Joe', NULL),
	(5, '2025-02-18 03:19:52', 'joe3', 'password2', 'Joe', NULL),
	(6, '2025-02-19 03:52:24', 'User', 'logout', 'memberId:17, UserName:thunk - has logged out', 1),
	(7, '2025-02-19 03:52:24', 'User', '', 'DESTROY member object: memberId:17, UserName:thunk', 1),
	(8, '2025-02-19 04:05:41', 'User', 'User Exists Check', 'Verified: User Does Not Exist:<thinker>', 1),
	(9, '2025-02-19 04:05:42', 'User', 'Save', 'Add Successful: memberId:0, UserName:thinker', 1),
	(443, '2025-05-22 23:53:12', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(444, '2025-05-23 01:24:58', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(445, '2025-05-25 22:36:13', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(446, '2025-05-25 22:37:48', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(447, '2025-05-26 00:07:49', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(448, '2025-05-26 02:08:46', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(449, '2025-05-26 02:09:27', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(450, '2025-05-26 02:36:51', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 2 added to sessionId:5 for booking date: 2025-05-29', 40),
	(451, '2025-05-26 02:36:57', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 4 added to sessionId:5 for booking date: 2025-05-29', 40),
	(452, '2025-05-26 09:54:33', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(453, '2025-05-26 22:56:01', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(454, '2025-05-26 23:45:25', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(455, '2025-05-27 01:08:29', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(456, '2025-05-27 10:45:11', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(457, '2025-05-27 11:40:37', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(458, '2025-05-27 12:27:09', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(459, '2025-05-28 00:18:01', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(460, '2025-05-29 03:51:04', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(461, '2025-05-29 03:51:10', 'member', 'logout', 'memberId:40, UserName:test - has logged out', 40),
	(462, '2025-05-29 03:51:25', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(463, '2025-05-29 03:51:39', 'member', 'logout', 'memberId:40, UserName:test - has logged out', 40),
	(464, '2025-05-29 03:51:58', 'member', 'Login', 'UserName:test: - Failed Login: Invalid Password', NULL),
	(465, '2025-05-29 03:52:03', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(466, '2025-05-29 04:22:48', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-26', 40),
	(467, '2025-05-29 04:23:26', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-26', 40),
	(468, '2025-05-29 04:23:34', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-26', 40),
	(469, '2025-05-29 04:23:36', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-26', 40),
	(470, '2025-05-29 04:33:36', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:5 for booking date: 2025-05-29', 40),
	(471, '2025-05-29 04:36:02', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 2 added to sessionId:3 for booking date: 2025-05-30', 40),
	(472, '2025-05-29 04:36:09', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 4 added to sessionId:3 for booking date: 2025-05-30', 40),
	(473, '2025-05-29 04:36:25', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 2 added to sessionId:4 for booking date: 2025-05-31', 40),
	(474, '2025-05-29 04:36:30', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 4 added to sessionId:4 for booking date: 2025-05-31', 40),
	(475, '2025-05-29 04:36:38', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-31', 40),
	(476, '2025-05-29 04:40:05', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-31', 40),
	(477, '2025-05-29 04:40:07', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-31', 40),
	(478, '2025-05-29 04:40:07', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-31', 40),
	(479, '2025-05-29 04:40:07', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-31', 40),
	(480, '2025-05-29 04:40:08', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-31', 40),
	(481, '2025-05-29 04:47:36', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:3 for booking date: 2025-05-30', 40),
	(482, '2025-05-29 04:48:01', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:3 for booking date: 2025-05-30', 40),
	(483, '2025-05-29 04:53:17', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:3 for booking date: 2025-05-30', 40),
	(484, '2025-05-29 04:53:29', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 1 added to sessionId:3 for booking date: 2025-05-30', 40),
	(485, '2025-05-29 22:19:41', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(486, '2025-05-30 01:07:52', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(487, '2025-05-30 01:07:53', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(488, '2025-05-30 01:14:35', 'basketItem', 'delete', 'Delete BasketItem Successful: memberId:40,  removed from sessionId:3 for booking date: 2025-05-30', 40),
	(489, '2025-05-30 01:14:37', 'basketItem', 'delete', 'Delete BasketItem Successful: memberId:40,  removed from sessionId:4 for booking date: 2025-05-31', 40),
	(490, '2025-05-30 01:17:14', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 3 added to sessionId:4 for booking date: 2025-05-31', 40),
	(491, '2025-05-30 01:17:31', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 2 added to sessionId:4 for booking date: 2025-05-31', 40),
	(492, '2025-05-30 01:17:53', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 9 added to sessionId:2 for booking date: 2025-05-31', 40),
	(493, '2025-05-30 01:18:02', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 2 added to sessionId:2 for booking date: 2025-05-31', 40),
	(494, '2025-05-30 01:18:23', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-31', 40),
	(495, '2025-05-30 01:18:25', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 added to sessionId:2 for booking date: 2025-05-31', 40),
	(496, '2025-05-30 01:21:44', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 removed to sessionId:2 for booking date: 2025-05-31', 40),
	(497, '2025-05-30 01:24:10', 'basketItem', 'delete', 'Delete BasketItem Successful: memberId:40,  removed from sessionId:2 for booking date: 2025-05-31', 40),
	(498, '2025-05-30 01:27:14', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 3 added to sessionId:2 for booking date: 2025-05-31', 40),
	(499, '2025-05-30 01:27:36', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 4 added to sessionId:2 for booking date: 2025-05-31', 40),
	(500, '2025-05-30 01:28:41', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-31', 40),
	(501, '2025-05-30 01:28:44', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 removed to sessionId:4 for booking date: 2025-05-31', 40),
	(502, '2025-05-30 01:28:47', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-05-31', 40),
	(503, '2025-05-30 01:28:48', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 removed to sessionId:4 for booking date: 2025-05-31', 40),
	(504, '2025-05-30 01:28:50', 'basketItem', 'delete', 'Delete BasketItem Successful: memberId:40,  removed from sessionId:2 for booking date: 2025-05-31', 40),
	(505, '2025-05-30 01:48:35', 'member', 'logout', 'memberId:40, UserName:test - has logged out', 40),
	(506, '2025-05-30 01:48:44', 'member', 'Login', 'MemberId:42, UserName:thinker - Successful login.', 42),
	(507, '2025-05-30 01:49:01', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:42, 2 added to sessionId:4 for booking date: 2025-05-31', 42),
	(508, '2025-05-30 01:49:06', 'basketItem', 'update', 'Update BasketItem Successful: memberId:42, 1 removed to sessionId:4 for booking date: 2025-05-31', 42),
	(509, '2025-05-30 01:49:10', 'basketItem', 'update', 'Update BasketItem Successful: memberId:42, 1 added to sessionId:4 for booking date: 2025-05-31', 42),
	(510, '2025-05-30 01:49:11', 'basketItem', 'update', 'Update BasketItem Successful: memberId:42, 1 added to sessionId:4 for booking date: 2025-05-31', 42),
	(511, '2025-05-30 01:49:12', 'basketItem', 'update', 'Update BasketItem Successful: memberId:42, 1 added to sessionId:4 for booking date: 2025-05-31', 42),
	(512, '2025-05-30 01:49:13', 'basketItem', 'delete', 'Delete BasketItem Successful: memberId:42,  removed from sessionId:4 for booking date: 2025-05-31', 42),
	(513, '2025-05-30 01:49:26', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:42, 3 added to sessionId:5 for booking date: 2025-05-31', 42),
	(514, '2025-05-30 01:49:29', 'member', 'logout', 'memberId:42, UserName:thinker - has logged out', 42),
	(515, '2025-05-30 01:49:35', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(516, '2025-05-30 01:49:46', 'member', 'logout', 'memberId:40, UserName:test - has logged out', 40),
	(517, '2025-05-30 01:49:53', 'member', 'Login', 'MemberId:42, UserName:thinker - Successful login.', 42),
	(518, '2025-05-30 01:50:06', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:42, 4 added to sessionId:4 for booking date: 2025-05-31', 42),
	(519, '2025-05-30 01:50:10', 'basketItem', 'update', 'Update BasketItem Successful: memberId:42, 1 added to sessionId:4 for booking date: 2025-05-31', 42),
	(520, '2025-05-30 01:50:12', 'basketItem', 'update', 'Update BasketItem Successful: memberId:42, 1 removed to sessionId:4 for booking date: 2025-05-31', 42),
	(521, '2025-05-30 01:50:14', 'basketItem', 'update', 'Update BasketItem Successful: memberId:42, 1 removed to sessionId:4 for booking date: 2025-05-31', 42),
	(522, '2025-05-30 01:50:16', 'member', 'logout', 'memberId:42, UserName:thinker - has logged out', 42),
	(523, '2025-05-30 01:50:21', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(524, '2025-05-30 03:33:06', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(525, '2025-05-31 07:18:50', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(526, '2025-05-31 08:14:56', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(527, '2025-05-31 08:23:45', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(528, '2025-06-01 01:31:15', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(529, '2025-06-01 01:56:00', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(530, '2025-06-01 03:32:59', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(531, '2025-06-01 03:37:09', 'order', 'checkout', 'Checkout Successful: memberId:40, orderId:1', 40),
	(532, '2025-06-01 03:38:31', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 3 added to sessionId:4 for booking date: 2025-06-14', 40),
	(533, '2025-06-01 03:38:36', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 added to sessionId:4 for booking date: 2025-06-14', 40),
	(534, '2025-06-01 03:38:37', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 removed to sessionId:4 for booking date: 2025-06-14', 40),
	(535, '2025-06-01 03:38:39', 'order', 'checkout', 'Checkout Successful: memberId:40, orderId:1', 40),
	(536, '2025-06-01 23:49:06', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(537, '2025-06-01 23:49:21', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 3 added to sessionId:2 for booking date: 2025-06-26', 40),
	(538, '2025-06-02 00:01:25', 'order', 'create', 'Order created with ID: 0', 40),
	(539, '2025-06-02 00:01:25', 'order', 'checkout', 'Checkout Successful: memberId:40, orderId:1', 40),
	(540, '2025-06-02 00:07:41', 'member', 'logout', 'memberId:40, UserName:test - has logged out', 40),
	(541, '2025-06-02 00:07:50', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(542, '2025-06-02 00:08:02', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 2 added to sessionId:1 for booking date: 2025-06-17', 40),
	(543, '2025-06-02 00:08:06', 'order', 'create', 'Order created with ID: 0', 40),
	(544, '2025-06-02 00:08:06', 'order', 'checkout', 'Checkout Successful: memberId:40, orderId:1', 40),
	(545, '2025-06-02 00:24:25', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 2 added to sessionId:1 for booking date: 2025-06-12', 40),
	(546, '2025-06-02 00:24:29', 'order', 'create', 'Order created with ID: 21test thing ID:', 40),
	(547, '2025-06-02 00:24:29', 'order', 'checkout', 'Checkout Successful: memberId:40, orderId:1', 40),
	(548, '2025-06-02 00:25:53', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 3 added to sessionId:4 for booking date: 2025-06-26', 40),
	(549, '2025-06-02 00:25:58', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 4 added to sessionId:4 for booking date: 2025-06-26', 40),
	(550, '2025-06-02 00:26:14', 'basketItem', 'addBasketItem', 'Add BasketItem Successful: memberId:40, 2 added to sessionId:5 for booking date: 2025-06-27', 40),
	(551, '2025-06-02 00:26:20', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 added to sessionId:5 for booking date: 2025-06-27', 40),
	(552, '2025-06-02 00:26:22', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 removed to sessionId:5 for booking date: 2025-06-27', 40),
	(553, '2025-06-02 00:26:24', 'basketItem', 'update', 'Update BasketItem Successful: memberId:40, 1 removed to sessionId:4 for booking date: 2025-06-26', 40),
	(554, '2025-06-02 00:26:26', 'basketItem', 'delete', 'Delete BasketItem Successful: memberId:40,  removed from sessionId:5 for booking date: 2025-06-27', 40),
	(555, '2025-06-02 00:26:28', 'order', 'checkout', 'Checkout Successful: memberId:40, orderId:22', 40),
	(556, '2025-06-02 01:25:21', 'member', 'Login', 'MemberId:40, UserName:test - Successful login.', 40),
	(557, '2025-06-02 01:49:20', 'member', 'logout', 'memberId:40, UserName:test - has logged out', 40),
	(558, '2025-06-02 01:49:30', 'member', 'Login', 'MemberId:42, UserName:thinker - Successful login.', 42),
	(559, '2025-06-02 01:49:37', 'order', 'checkout', 'Checkout Successful: memberId:42, orderId:23', 42);

-- Dumping structure for table 12sendb.basketitem
CREATE TABLE IF NOT EXISTS `basketitem` (
  `basketItemId` int NOT NULL AUTO_INCREMENT,
  `sessionId` int DEFAULT NULL,
  `seats` int DEFAULT NULL,
  `seatCost` float DEFAULT NULL,
  `bookingDate` date DEFAULT NULL,
  `totalCost` float DEFAULT NULL,
  `memberId` int DEFAULT NULL,
  PRIMARY KEY (`basketItemId`),
  KEY `FK_basketitem_members` (`memberId`),
  KEY `FK__sessions` (`sessionId`),
  CONSTRAINT `FK__sessions` FOREIGN KEY (`sessionId`) REFERENCES `sessions` (`sessionId`),
  CONSTRAINT `FK_basketitem_members` FOREIGN KEY (`memberId`) REFERENCES `members` (`memberId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 12sendb.basketitem: ~2 rows (approximately)

-- Dumping structure for table 12sendb.cinemalocations
CREATE TABLE IF NOT EXISTS `cinemalocations` (
  `locationId` int NOT NULL AUTO_INCREMENT,
  `locationName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '',
  `GPS` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT '',
  PRIMARY KEY (`locationId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 12sendb.cinemalocations: ~2 rows (approximately)
INSERT INTO `cinemalocations` (`locationId`, `locationName`, `GPS`, `address`) VALUES
	(1, 'chatswood', '-33.796924885456555, 151.18294357356496', '1 Anderson St, Chatswood NSW 2067'),
	(2, 'wharoonga', '123213.12312312, 12312321.12313', '1 Smith St, Wharoonga NSW 2069');

-- Dumping structure for table 12sendb.cinemas
CREATE TABLE IF NOT EXISTS `cinemas` (
  `cinemaId` int NOT NULL AUTO_INCREMENT,
  `cinemaName` varchar(255) DEFAULT NULL,
  `locationId` int DEFAULT NULL,
  PRIMARY KEY (`cinemaId`),
  KEY `locationId` (`locationId`),
  CONSTRAINT `locationId` FOREIGN KEY (`locationId`) REFERENCES `cinemalocations` (`locationId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 12sendb.cinemas: ~3 rows (approximately)
INSERT INTO `cinemas` (`cinemaId`, `cinemaName`, `locationId`) VALUES
	(1, 'smartMan cinema', 1),
	(2, 'lowly cinema', 1),
	(3, 'heaven cinema', 2);

-- Dumping structure for table 12sendb.members
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 12sendb.members: ~5 rows (approximately)
INSERT INTO `members` (`memberId`, `username`, `password`, `firstName`, `lastName`, `role`, `street`, `town`, `state`, `postcode`, `phone`, `email`) VALUES
	(1, 'daMelonShark', 'iLoveAdo', 'Kazuo', 'Lee', 'Student', NULL, NULL, NULL, NULL, NULL, NULL),
	(40, 'test', '$2y$10$HJWiE5PrfwLy6lwLa1L5AuK2M3minKmGSjY8nnSzctMQoAAZcS9Zm', 'UFGe1eNpHLE5QVPo9Fw9vy/wpDZOAlMt0eO+C4EBN+TrxKTugd/2PIj0yeqFRgbBaHR5RVIrSWVFUVUyS0drUXoreUZ3QT09', '5PHR7v1jofbmnLg3intb9avIxdiXwLLf1gXX6wyj0ntOekJVyqaacfLR6RcNMLIGaEFPY1ZCTUxoUGJEMy9kY2FGRTZGQT09', NULL, 'zty8FTgUQaHF36ybYvHLeRhDhpIJRa4VJh64+rTzicZfcW27gcXYU0Qsint7pdoXZG1RK0ZvL1o4ZXRtODdQMXYwcnJHZz09', 'WQDNQsiZ++P2Yz64ICEVaVEykjFAhFlp16lC2O47I3Bv3Z3cvBiBJk/25jqN5vQUaGZzcGIvaG4rcVd0NzVpaURDbGZHZz09', '598cOwaeNyKJf4jMVR8SD17Tn1yE+2w8JMnduyehs/SiDE6leGKvDQDkSwvlFs4rMFdVeU5jRGlIUFJBMjNKYk9ISUgzZz09', '3T/stiPgtss7QIBcDiwdN42k+Dkrv4zcabBdRyZLCTTgYQ9zMbJKz8WMChP79v7CeTM4TDh0Q0U4NkMvN3BlNXVUZTY3Zz09', 'dLDBn6b2zduZ/FM908pfzk8GIpr+bYgN4D+otNEitu2hNdjzFdfsK+DEwF77+Lb7TTFLN2ZZbEIyRk1iZkZHVkpLeENzQT09', 'kNIOG+74V+CQETlTsHOm26zAlcxVJR+SSDVWsztrqMXkL2RudzVW9Y26g7gIQ77OWjBmTUNPZEdyTElQTHBSam0zb0hab1FRdTBveXEzYkFDUXE1d1RzZXlZdz0='),
	(41, 'fill', '$2y$10$/5dy987WSxwGX2ADu6wFFevX1cV9NLS4pBlsKEDuWmQtcTs0EDUUe', '', '', NULL, '', '', '', '', '', ''),
	(42, 'thinker', '$2y$10$9jAMIwTksjsMIFnBuo8BnemuBVscaDzEwUDVmTOWXDXdZb4jssE56', 'YvSqLvecltn6OiXkHPoKk9OR6l7q28lgR0WcyNeej2/uj8JTYbiw601lY/8OfT4HS1JhNHJaSmUxQ2sxTlRUVDN3SkhFQT09', '6xV9N0AWjavbCer+8VyAPQ/di92I3YsjqXbP13cyql6aCuMTQ2tCnvK9oSqgdzOfS3JBS3RvcC9YVzhncVBuVitlbnRyUT09', NULL, '+pRVgm3S5s/P5ZzSTOshCOPWidLFXPFx23a0mTzmEeEvIPbNSyb9EIG/3TBO8JIwZE90WE1lakY2SXNUeWRHcWtpaVZ2QT09', 'HRg5gLIFFNqwDHvfSjCC7fM+Y6WxMaRWnMwT/G+1NFdcfqsgJppRHHfZQ3kRXPpEU0tqUnpuVEtJSVFzSzNpVlhjS2JpUT09', 'pwlKEu+tXW5R2xe7nrqxHpNSFrTGmU4x9eiqzX+pHBmJQfUTYshf7IzCp0/SNXRnMFJZeTNtUFdsR2tPaFpyeWVSLzdnUT09', '+yHTdn3+BSaqicfPN7aDNvG0Z8luCRsrVl50A5Jt6QISCRYbLv4BC07FTG6GSO4nUG11NUtHUVg2bUZlU1dpeWw1OFRqdz09', '4LquQE54k9yvIXVxuGb+PXlW73iqVYTc8v6+sgd9Cij2TZ61aJjwYVao2lXHbDmAYndjQ0VXUFp4Z3RwdXd6ai9XWHptZz09', 'UISYmoNwJgb0ubJysDqOMA3cSSWh6Ae/ZK2pfLDIX5WO/GK630CHUBdrq2hfp7ZQbzNRM1JMa2M3d3AveHdSTmlXTk9XZm4valNUWlltNFZJYnVPK2hZbUFhdz0='),
	(43, 'thinker1', '$2y$10$9xjF1Ozedp9n3jr00X7ZpuOb.7bM0vdoEnUvAXAN3wYO44DNgqeWC', '', '', NULL, '', '', '', '', '', '');

-- Dumping structure for table 12sendb.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `movieId` int NOT NULL AUTO_INCREMENT,
  `movieName` varchar(255) NOT NULL,
  `posterFile` varchar(255) DEFAULT NULL,
  `movieDescription` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `trailerName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`movieId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 12sendb.movies: ~4 rows (approximately)
INSERT INTO `movies` (`movieId`, `movieName`, `posterFile`, `movieDescription`, `trailerName`) VALUES
	(1, 'Minecraft Movie', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1ynBMNx9XXvr-RhefS3mQ9outziLZ_bCUhQ&s', 'I am Steve as a child I yearned for the mines. Steve is on the quest to stop the nether from spreading into the overworld.', 'wJO_vIDZn-I?si=J44yf555fmTBniqa'),
	(2, 'brr brr patapim', 'https://i1.sndcdn.com/artworks-dof1BE4LTvPrIn4h-GEIQZw-t500x500.jpg', 'Brr brrr Patapim, il mio cappello è pieno di Slim! Nel bosco fitto e misterioso viveva un essere assai curioso. Con radici intrecciate e gambe incrociate, mani sottili, braccia agitate. Il suo naso lungo come un prosciutto, un po\' babbuino, un po\' cespugliotto. Si chiamava Patapim, oh che strano, e parlava Italiano… ma con accento arcanol. Un giorno trovo un cappello dorato, "Perfetto!" grido, "che bel risultato!" Ma dentro c\'era Slim, il ranocchio blu, che faceva "Brrr brrr!" senza un perche in piu. Patapim piangeva: "Mio caro cappello! Ora c\'e Slim, che guaio, che duello!" Saltave, rideva, si disperava, ma il ranocchio mai se ne andava. Con fogile sui gomiti e muschio sul mento corse nel bosco spinto dal vento. Ando dal mago Tiramisu, chiedendo aluto con un gran "Ciuu ciuu!" Il mago rispose, mangiando un panino: "Per togliere Slim, serve un palloncino!" Cosi Patapim, con gran confusione, soffio nel pallone con emozione. Slim volo, con un grande BOOM, sparendo nel cielo come un bel fungo di fumo! Ora Patapim balla nel vento.', '9i7p0xJsP_I?si=pqrHbDppBLrs3LBS'),
	(3, 'Tung Tung Tung Sahur', 'https://uploads.dailydot.com/2025/04/tung-tung-sahur-meme-2.png?auto=compress&fm=png', 'Tung tung tung tung sahur. Anomali mengerikan yang hanya keluar pada sahur. Konon katanya kalau ada orang yang dipanggil Sahur tiga kali dan tidak nyaut maka makhluk ini datang di rumah kalian. Hi seremnya. Tung tung ini biasanya bersuara layaknya pukulan kentungan seperti ini. Share ke teman kalian yang susah Sahur.', 'HmIMmFAV4BY?si=DydEuYP2dV91hGvG'),
	(4, 'tralalero tralala', 'https://i.ytimg.com/vi/zy3ourPnsRs/hq720.jpg?sqp=-oaymwE7CK4FEIIDSFryq4qpAy0IARUAAAAAGAElAADIQj0AgKJD8AEB-AHOBYAC0AWKAgwIABABGEsgWChlMA8=&rs=AOn4CLB3e6Qu77jXcVi05P4kjD9wgW1U2A', '"Tralalero Tralala" is an AI-generated audio meme that first appeared on TikTok in early 2025. The sound features a robotic Italian voice chanting, "Tralalero Tralala, porco dio e porco Allah," and rambling about his grandma interrupting a Fortnite session.', NULL);

-- Dumping structure for table 12sendb.orderitems
CREATE TABLE IF NOT EXISTS `orderitems` (
  `orderItemId` int NOT NULL AUTO_INCREMENT,
  `sessionId` int DEFAULT NULL,
  `seats` int DEFAULT NULL,
  `seatCost` float DEFAULT NULL,
  `orderId` int DEFAULT NULL,
  `bookingDate` date DEFAULT NULL,
  `totalCost` float DEFAULT NULL,
  PRIMARY KEY (`orderItemId`),
  KEY `FK_orderitems_order` (`orderId`),
  KEY `FK_orders_sessions` (`sessionId`),
  CONSTRAINT `FK_orderitems_order` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_orders_sessions` FOREIGN KEY (`sessionId`) REFERENCES `sessions` (`sessionId`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 12sendb.orderitems: ~9 rows (approximately)
INSERT INTO `orderitems` (`orderItemId`, `sessionId`, `seats`, `seatCost`, `orderId`, `bookingDate`, `totalCost`) VALUES
	(1, 3, 5, 12, 1, '2025-05-27', 60),
	(2, 4, 2, 30, 1, '2025-05-27', 60),
	(3, 1, 3, 10, 2, '2025-05-25', 30),
	(14, 4, 6, 30, 1, '2025-05-31', 180),
	(15, 4, 3, 30, 1, '2025-06-14', 90),
	(16, 2, 3, 10, 1, '2025-06-26', 30),
	(17, 1, 2, 10, 1, '2025-06-17', 20),
	(18, 1, 2, 10, 1, '2025-06-12', 20),
	(19, 4, 6, 30, 22, '2025-06-26', 180),
	(20, 5, 3, 5, 23, '2025-05-31', 15),
	(21, 4, 3, 30, 23, '2025-05-31', 90);

-- Dumping structure for table 12sendb.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `orderId` int NOT NULL AUTO_INCREMENT,
  `booked` tinyint(1) DEFAULT '1',
  `memberId` int DEFAULT NULL,
  `orderTime` datetime DEFAULT NULL,
  PRIMARY KEY (`orderId`),
  KEY `FK_order_members` (`memberId`),
  CONSTRAINT `FK_order_members` FOREIGN KEY (`memberId`) REFERENCES `members` (`memberId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 12sendb.orders: ~4 rows (approximately)
INSERT INTO `orders` (`orderId`, `booked`, `memberId`, `orderTime`) VALUES
	(1, 1, 40, '2025-05-27 09:07:27'),
	(2, 1, 40, '2025-05-27 10:16:02'),
	(21, 0, 40, '2025-06-02 10:24:29'),
	(22, 0, 40, '2025-06-02 10:26:28'),
	(23, 0, 42, '2025-06-02 11:49:36');

-- Dumping structure for table 12sendb.sessions
CREATE TABLE IF NOT EXISTS `sessions` (
  `sessionId` int NOT NULL AUTO_INCREMENT,
  `cinemaId` int DEFAULT NULL,
  `movieId` int DEFAULT NULL,
  `time` time DEFAULT NULL,
  `seatCost` int DEFAULT NULL,
  PRIMARY KEY (`sessionId`) USING BTREE,
  KEY `cinemaId` (`cinemaId`),
  KEY `movieId` (`movieId`),
  CONSTRAINT `cinemaId` FOREIGN KEY (`cinemaId`) REFERENCES `cinemas` (`cinemaId`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `movieId` FOREIGN KEY (`movieId`) REFERENCES `movies` (`movieId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table 12sendb.sessions: ~5 rows (approximately)
INSERT INTO `sessions` (`sessionId`, `cinemaId`, `movieId`, `time`, `seatCost`) VALUES
	(1, 1, 1, '03:00:00', 10),
	(2, 1, 2, '02:00:00', 10),
	(3, 2, 2, '04:00:00', 12),
	(4, 3, 3, '13:00:00', 30),
	(5, 3, 4, '11:00:00', 5);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
