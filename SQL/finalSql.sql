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

-- Dumping data for table 12sendb.auditlog: ~0 rows (approximately)

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

-- Dumping data for table 12sendb.basketitem: ~0 rows (approximately)

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

-- Dumping data for table 12sendb.orderitems: ~0 rows (approximately)

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

-- Dumping data for table 12sendb.orders: ~0 rows (approximately)

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
