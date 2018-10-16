-- --------------------------------------------------------
-- 主機:                           127.0.0.1
-- 伺服器版本:                        10.3.9-MariaDB - mariadb.org binary distribution
-- 伺服器操作系統:                      Win64
-- HeidiSQL 版本:                  9.5.0.5295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 傾印  表格 oct16.coffeeshop 結構
CREATE TABLE IF NOT EXISTS `coffeeshop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在傾印表格  oct16.coffeeshop 的資料：~4 rows (大約)
/*!40000 ALTER TABLE `coffeeshop` DISABLE KEYS */;
INSERT INTO `coffeeshop` (`id`, `name`, `city`) VALUES
	(1, 'Baker\'s Dozen Donuts', 'Canada'),
	(4, 'Lavazza', NULL),
	(5, 'Coffee Like', NULL),
	(6, 'Indian Coffee House', NULL);
/*!40000 ALTER TABLE `coffeeshop` ENABLE KEYS */;

-- 傾印  表格 oct16.review 結構
CREATE TABLE IF NOT EXISTS `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coffeeshopId` int(11) NOT NULL,
  `reviewerId` int(11) NOT NULL,
  `rate` int(10) unsigned NOT NULL DEFAULT 1,
  `content` text DEFAULT NULL,
  `timestamp` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_review_coffeeshop` (`coffeeshopId`),
  KEY `FK_review_reviewer` (`reviewerId`),
  CONSTRAINT `FK_review_coffeeshop` FOREIGN KEY (`coffeeshopId`) REFERENCES `coffeeshop` (`id`),
  CONSTRAINT `FK_review_reviewer` FOREIGN KEY (`reviewerId`) REFERENCES `reviewer` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在傾印表格  oct16.review 的資料：~4 rows (大約)
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` (`id`, `coffeeshopId`, `reviewerId`, `rate`, `content`, `timestamp`) VALUES
	(1, 1, 1, 5, 'Lorem ipsum dolor sit amet, pri congue offendit id. Audire dissentiet vis et. Ne mel iudico tation, sint possit eum ut. Mazim fuisset accusamus ius ad. Vix aperiam officiis eu. Mutat officiis concludaturque vis eu, veritus epicurei per ne.', '2018-10-16'),
	(2, 5, 3, 3, 'Ei graece virtute per, elit solum appetere an eos. Cu mea mollis cotidieque referrentur. Ei vero mucius mea. Has graeci fastidii id, minim dolore reprehendunt eos cu, ex eripuit prodesset sed. Ne eam alii nemore. Eu dolores tincidunt vis..', '2018-10-16'),
	(3, 6, 2, 4, 'Ea mel partem minimum, in choro adolescens mel. Ut mazim tamquam incorrupte pri. Duo rebum putant vituperata ut, ut tacimates expetendis quo.', '2018-10-16'),
	(4, 4, 4, 4, 'Lorem ipsum dolor sit amet, pri congue offendit id. Audire dissentiet vis et. Ne mel iudico tation, sint possit eum ut. Mazim fuisset accusamus ius ad. Vix aperiam officiis eu. Mutat officiis concludaturque vis eu, veritus epicurei per ne.', '2018-10-16');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;

-- 傾印  表格 oct16.reviewer 結構
CREATE TABLE IF NOT EXISTS `reviewer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `token` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在傾印表格  oct16.reviewer 的資料：~4 rows (大約)
/*!40000 ALTER TABLE `reviewer` DISABLE KEYS */;
INSERT INTO `reviewer` (`id`, `email`, `password`, `token`) VALUES
	(1, 'ispar@wistron.com', 'ispar', NULL),
	(2, 'referrentur@wistron.com', 'referrentur', NULL),
	(3, 'partem@wistron.com', 'partem', NULL),
	(4, 'systems@wistron.com', 'systems', NULL);
/*!40000 ALTER TABLE `reviewer` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
