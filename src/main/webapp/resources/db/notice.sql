CREATE TABLE `notice` (
	`num` INT(11) NOT NULL AUTO_INCREMENT,
	`title` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`content` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`date` DATE NULL DEFAULT NULL,
	`name` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb3_general_ci',
	`bdiv` INT(11) NULL DEFAULT NULL,
	`del` VARCHAR(50) NULL DEFAULT 'N' COLLATE 'utf8mb3_general_ci',
	`hasfile` VARCHAR(50) NULL DEFAULT 'N' COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`num`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
;
