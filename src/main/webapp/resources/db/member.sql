CREATE TABLE `member` (
	`mnum` INT(10) NOT NULL AUTO_INCREMENT,
	`id` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`name` VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`pw` VARCHAR(40) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`address` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`email` VARCHAR(30) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`phNum` VARCHAR(15) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`petown` VARCHAR(1) NULL DEFAULT NULL COMMENT 'Y/N' COLLATE 'utf8mb3_general_ci',
	`size` VARCHAR(5) NULL DEFAULT NULL COMMENT 'b, m, s, e' COLLATE 'utf8mb3_general_ci',
	`level` VARCHAR(10) NULL DEFAULT NULL COMMENT 'admin,user' COLLATE 'utf8mb3_general_ci',
	`signupDay` DATE NULL DEFAULT NULL,
	`del` VARCHAR(1) NULL DEFAULT 'N' COMMENT 'Y/N' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`mnum`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;
