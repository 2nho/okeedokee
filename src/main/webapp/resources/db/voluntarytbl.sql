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

-- 테이블 okeedokee.voluntarytbl 구조 내보내기
CREATE TABLE IF NOT EXISTS `voluntarytbl` (
  `num` int(11) NOT NULL AUTO_INCREMENT COMMENT '순서',
  `id` varchar(50) DEFAULT NULL COMMENT '담당자',
  `title` varchar(50) DEFAULT '봉사자 모집' COMMENT '제목',
  `careName` varchar(50) DEFAULT NULL COMMENT '보호소이름',
  `addr` varchar(50) DEFAULT NULL COMMENT '보호소 주소',
  `phNum` varchar(50) DEFAULT NULL COMMENT '보호소 연락처',
  `detailText` varchar(255) DEFAULT NULL COMMENT '상세설명',
  `dateFrom` varchar(50) DEFAULT NULL COMMENT '활동기간 시작',
  `dateTo` varchar(50) DEFAULT NULL COMMENT '활동기간 끝',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 okeedokee.voluntarytbl:~26 rows (대략적) 내보내기
DELETE FROM `voluntarytbl`;
/*!40000 ALTER TABLE `voluntarytbl` DISABLE KEYS */;
INSERT INTO `voluntarytbl` (`num`, `id`, `title`, `careName`, `addr`, `phNum`, `detailText`, `dateFrom`, `dateTo`) VALUES
	(1, 'admin', '봉사자 구합니다1', '서울시 보호소', '서울시 어디구 어디동 12234번지', '010-1234-1561', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-07', '2022-02-09'),
	(2, 'admin', '봉사자 구합니다2', '광주시 보호소', '경기도 광주시 어디동 3402번지', '010-1234-1562', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-08', '2022-02-10'),
	(3, 'admin', '봉사자 구합니다3', '광양시 보호소', '광양시 뭐뭐구 123013번지', '010-1234-1563', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-09', '2022-02-11'),
	(4, 'admin', '봉사자 구합니다4', '전국 연합 경기 보호소', '대전광역시 뭐뭐동 123-1번지', '010-1234-1564', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-10', '2022-02-12'),
	(5, 'admin', '봉사자 구합니다5', '청주 보호소', '충북 청주시 청주 보호소 123번지', '010-1234-1565', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-11', '2022-02-13'),
	(6, 'admin', '봉사자 구합니다6', '수원시 보호소', '경기도 수원시 권선구 수원 보호소', '010-1234-1566', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-12', '2022-02-14'),
	(7, 'admin', '봉사자 구합니다7', '남원시 보호소', '전라북도 남원시 뭐뭐면 남원보호소', '010-1234-1567', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-13', '2022-02-15'),
	(8, 'admin', '봉사자 구합니다8', '강남시 보호소', '서울특별시 강남구 뭐뭐동 강남 보호소', '010-1234-1568', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-14', '2022-02-16'),
	(9, 'admin', '봉사자 구합니다9', '인천시 보호소', '인천광역시 계양구 뭐뭐동 계양 보호소', '010-1234-1569', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-15', '2022-02-17'),
	(10, 'admin', '봉사자 구합니다10', '송도 보호소', '인천 광역시 연수구 뭐뭐동 송도 연수 보호소', '010-1234-1570', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-16', '2022-02-18'),
	(11, 'admin', '봉사자 구합니다11', '구로구 보호소', '서울특별시 구로구 뭐뭐동 구로보호소', '010-1234-1571', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-17', '2022-02-19'),
	(12, 'admin', '봉사자 구합니다12', '제주시 보호소', '제주특별자치도 남원시 뭐뭐동 제주남원 보호소', '010-1234-1572', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-18', '2022-02-20'),
	(13, 'admin', '봉사자 구합니다13', '대전시 보호소', '대전광역시 뭐멍러동 124번지', '010-1234-1573', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-19', '2022-02-21'),
	(14, 'admin', '봉사자 구합니다14', '대구시 보호소', '대구광역시 뭐모동 뭘얼1024번지', '010-1234-1574', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-20', '2022-02-22'),
	(15, 'admin', '봉사자 구합니다15', '보호소1', '주소 1', '010-1234-1575', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-21', '2022-02-23'),
	(16, 'admin', '봉사자 구합니다16', '보호소2', '주소 2', '010-1234-1576', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-22', '2022-02-24'),
	(17, 'admin', '봉사자 구합니다17', '보호소3', '주소 3', '010-1234-1577', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-23', '2022-02-25'),
	(18, 'admin', '봉사자 구합니다18', '보호소4', '주소 4', '010-1234-1578', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-24', '2022-02-26'),
	(19, 'admin', '봉사자 구합니다19', '보호소5', '주소 5', '010-1234-1579', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-25', '2022-02-27'),
	(20, 'admin', '봉사자 구합니다20', '보호소6', '주소 6', '010-1234-1580', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-26', '2022-02-28'),
	(21, 'admin', '봉사자 구합니다21', '보호소7', '주소 7', '010-1234-1581', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-27', '2022-03-01'),
	(22, 'admin', '봉사자 구합니다22', '보호소8', '주소 8', '010-1234-1582', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-02-28', '2022-03-02'),
	(23, 'admin', '봉사자 구합니다23', '보호소9', '주소 9', '010-1234-1583', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-03-01', '2022-03-03'),
	(24, 'admin', '봉사자 구합니다24', '보호소10', '주소 10', '010-1234-1584', '체력 좋은 분, 연일 봉사 가능하신 분 환영', '2022-03-02', '2022-03-04'),
	(25, 'admin', '봉사자 오너라', '안국동 유기견 보호소', '서울시', '010-2222-2222', '', '', ''),
	(26, 'admin', '봉사자 구한가', '안국동 유기견 보호소', '서울시 종로구 안국동 12번지 안국동 유기견 보호소', '010-7777-7777', '체력이 좋아야해\r\n강아지랑 잘 놀고', '2022-02-15', '2022-02-17');
/*!40000 ALTER TABLE `voluntarytbl` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;