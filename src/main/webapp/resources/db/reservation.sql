CREATE TABLE `reservation` (
	`rnum` INT(11) NOT NULL AUTO_INCREMENT,
	`mnum` INT(11) NULL DEFAULT NULL,
	`bdiv` INT(1) NULL DEFAULT NULL,
	`reserName` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`content` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`reserDate` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`kindCd` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`sexCd` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`age` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`specialMark` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`processState` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`noticeSdt` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`happenPlace` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`dogImg` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`careNm` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`careAddr` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`careTel` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`chargeNm` VARCHAR(20) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`del` VARCHAR(1) NULL DEFAULT 'N' COMMENT 'Y,N' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`rnum`) USING BTREE,
	INDEX `mnum` (`mnum`) USING BTREE,
	CONSTRAINT `reserFK1` FOREIGN KEY (`mnum`) REFERENCES `okeedokee`.`member` (`mnum`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=54
;
