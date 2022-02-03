CREATE TABLE `donation` (
	`num` INT(11) NOT NULL,
	`mnum` INT(11) NOT NULL,
	`date` DATE NOT NULL,
	`donation` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`num`) USING BTREE,
	INDEX `FK_donation_member` (`mnum`) USING BTREE,
	CONSTRAINT `FK_donation_member` FOREIGN KEY (`mnum`) REFERENCES `okeedokee`.`member` (`mnum`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
