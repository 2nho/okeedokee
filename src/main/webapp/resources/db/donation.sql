-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.5-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- okeedokee 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `okeedokee` /*!40100 DEFAULT CHARACTER SET utf8mb3 */;
USE `okeedokee`;

-- 테이블 okeedokee.donation 구조 내보내기
CREATE TABLE IF NOT EXISTS `donation` (
  `num` int(11) NOT NULL AUTO_INCREMENT,
  `mnum` int(11) NOT NULL,
  `date` date NOT NULL,
  `donation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`) USING BTREE,
  KEY `FK_donation_member` (`mnum`) USING BTREE,
  CONSTRAINT `FK_donation_member` FOREIGN KEY (`mnum`) REFERENCES `member` (`mnum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 okeedokee.donation:~7 rows (대략적) 내보내기
DELETE FROM `donation`;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` (`num`, `mnum`, `date`, `donation`) VALUES
	(1, 2, '2022-02-07', '10'),
	(2, 2, '2022-02-07', '10000'),
	(3, 2, '2022-02-07', '1000000'),
	(4, 3, '2022-02-08', '100000'),
	(5, 4, '2022-02-08', '20000'),
	(7, 5, '2022-02-08', '30000'),
	(8, 6, '2022-02-08', '50000');
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
