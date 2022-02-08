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

-- 테이블 okeedokee.volunteer 구조 내보내기
CREATE TABLE IF NOT EXISTS `volunteer` (
  `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '순서',
  `mnum` int(11) NOT NULL DEFAULT 0 COMMENT '회원번호',
  `id` varchar(50) DEFAULT NULL,
  `bnum` int(11) NOT NULL DEFAULT 0 COMMENT '게시판내 글번호',
  `careName` varchar(50) NOT NULL DEFAULT '0' COMMENT '제목',
  `dateFrom` varchar(50) DEFAULT '0' COMMENT '시작날짜',
  `dateTo` varchar(50) DEFAULT '0' COMMENT '끝날짜',
  `createdate` date DEFAULT curdate(),
  `phNum` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `FK_volunteer_member` (`mnum`) USING BTREE,
  CONSTRAINT `FK_volunteer_member` FOREIGN KEY (`mnum`) REFERENCES `member` (`mnum`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 okeedokee.volunteer:~0 rows (대략적) 내보내기
DELETE FROM `volunteer`;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` (`num`, `mnum`, `id`, `bnum`, `careName`, `dateFrom`, `dateTo`, `createdate`, `phNum`) VALUES
	(17, 2, 'userid02', 26, '안국동 유기견 보호소', '2022-02-16', '2022-02-17', '2022-02-08', '010-7777-7777'),
	(18, 3, 'userid03', 26, '안국동 유기견 보호소', '2022-02-15', '2022-02-16', '2022-02-08', '010-7777-7777'),
	(21, 4, 'userid04', 26, '안국동 유기견 보호소', '2022-02-16', '2022-02-17', '2022-02-08', '01011111114');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
