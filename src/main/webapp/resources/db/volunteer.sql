CREATE TABLE `volunteer` (
	`title` VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`mnum` INT(11) NOT NULL DEFAULT '0',
	`perid` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`title`) USING BTREE,
	INDEX `FK_volunteer_member` (`mnum`) USING BTREE,
	CONSTRAINT `FK_volunteer_member` FOREIGN KEY (`mnum`) REFERENCES `okeedokee`.`member` (`mnum`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
