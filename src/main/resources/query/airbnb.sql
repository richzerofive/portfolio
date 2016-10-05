-- houses
ALTER TABLE houses
	DROP FOREIGN KEY FK_member_TO_houses; -- member -> houses

-- address
ALTER TABLE address
	DROP FOREIGN KEY FK_houses_TO_address; -- houses -> address

-- building
ALTER TABLE building
	DROP FOREIGN KEY FK_houses_TO_building; -- houses -> building

-- block
ALTER TABLE block
	DROP FOREIGN KEY FK_houses_TO_block; -- houses -> block

-- houses_facility
ALTER TABLE houses_facility
	DROP FOREIGN KEY FK_houses_TO_houses_facility; -- houses -> houses_facility

-- houses_facility
ALTER TABLE houses_facility
	DROP FOREIGN KEY FK_facility_TO_houses_facility; -- facility -> houses_facility

-- houses_rules
ALTER TABLE houses_rules
	DROP FOREIGN KEY FK_houses_TO_houses_rules; -- houses -> houses_rules

-- houses_rules
ALTER TABLE houses_rules
	DROP FOREIGN KEY FK_rules_TO_houses_rules; -- rules -> houses_rules

-- reservation
ALTER TABLE reservation
	DROP FOREIGN KEY FK_houses_TO_reservation; -- houses -> reservation

-- reservation
ALTER TABLE reservation
	DROP FOREIGN KEY FK_member_TO_reservation; -- member -> reservation

-- payment
ALTER TABLE payment
	DROP FOREIGN KEY FK_reservation_TO_payment; -- reservation -> payment

-- Guide_Minor
ALTER TABLE Guide_Minor
	DROP FOREIGN KEY FK_Guide_Major_TO_Guide_Minor; -- Guide_Major -> Guide_Minor

-- member
ALTER TABLE member
	DROP FOREIGN KEY FK_Guide_Major_TO_member; -- Guide_Major -> member

-- houses
ALTER TABLE houses
	DROP PRIMARY KEY; -- houses 기본키

-- address
ALTER TABLE address
	DROP PRIMARY KEY; -- address 기본키

-- building
ALTER TABLE building
	DROP PRIMARY KEY; -- building 기본키

-- facility
ALTER TABLE facility
	DROP PRIMARY KEY; -- facility 기본키

-- rules
ALTER TABLE rules
	DROP PRIMARY KEY; -- rules 기본키

-- block
ALTER TABLE block
	DROP PRIMARY KEY; -- block 기본키

-- houses_facility
ALTER TABLE houses_facility
	DROP PRIMARY KEY; -- houses_facility 기본키

-- houses_rules
ALTER TABLE houses_rules
	DROP PRIMARY KEY; -- houses_rules 기본키

-- reservation
ALTER TABLE reservation
	DROP PRIMARY KEY; -- reservation 기본키

-- payment
ALTER TABLE payment
	DROP PRIMARY KEY; -- payment 기본키

-- Guide_Major
ALTER TABLE Guide_Major
	DROP PRIMARY KEY; -- Guide_Major 기본키

-- Guide_Minor
ALTER TABLE Guide_Minor
	DROP PRIMARY KEY; -- Guide_Minor 기본키

-- member
ALTER TABLE member
	DROP PRIMARY KEY; -- member 기본키

-- houses
DROP TABLE IF EXISTS houses RESTRICT;

-- address
DROP TABLE IF EXISTS address RESTRICT;

-- building
DROP TABLE IF EXISTS building RESTRICT;

-- facility
DROP TABLE IF EXISTS facility RESTRICT;

-- rules
DROP TABLE IF EXISTS rules RESTRICT;

-- block
DROP TABLE IF EXISTS block RESTRICT;

-- houses_facility
DROP TABLE IF EXISTS houses_facility RESTRICT;

-- houses_rules
DROP TABLE IF EXISTS houses_rules RESTRICT;

-- reservation
DROP TABLE IF EXISTS reservation RESTRICT;

-- payment
DROP TABLE IF EXISTS payment RESTRICT;

-- Guide_Major
DROP TABLE IF EXISTS Guide_Major RESTRICT;

-- Guide_Minor
DROP TABLE IF EXISTS Guide_Minor RESTRICT;

-- member
DROP TABLE IF EXISTS member RESTRICT;

-- houses
CREATE TABLE houses (
	house_seq    INT          NOT NULL, -- house_seq
	room_type    VARCHAR(10)  NOT NULL, -- room_type
	guest_cnt    INT          NOT NULL, -- guest_cnt
	bed_cnt      INT          NULL,     -- bed_cnt
	bathroom_cnt INT          NULL,     -- bathroom_cnt
	picture      VARCHAR(40)  NULL,     -- picture
	explaination TEXT         NULL,     -- explaination
	title        VARCHAR(50)  NOT NULL, -- title
	other_rule   VARCHAR(100) NULL,     -- other_rule
	checkin_term INT          NOT NULL, -- checkin_term
	checkin_time VARCHAR(15)  NULL,     -- checkin_time
	period       DATE         NULL,     -- period
	min_nights   INT          NOT NULL, -- min_nights
	max_nights   INT          NOT NULL, -- max_nights
	price        INT          NOT NULL, -- price
	email        VARCHAR(15)  NULL      -- email
);

-- houses
ALTER TABLE houses
	ADD CONSTRAINT PK_houses -- houses 기본키
		PRIMARY KEY (
			house_seq -- house_seq
		);

ALTER TABLE houses
	MODIFY COLUMN house_seq INT NOT NULL AUTO_INCREMENT;

-- address
CREATE TABLE address (
	address_seq INT          NOT NULL, -- address_seq
	country     VARCHAR(20)  NULL,     -- country
	state       VARCHAR(50)  NULL,     -- state
	city        VARCHAR(50)  NULL,     -- city
	street      VARCHAR(100) NULL,     -- street
	optional    VARCHAR(100) NULL,     -- optional
	zip_code    VARCHAR(15)  NULL,     -- zip_code
	latitude    VARCHAR(20)  NULL,     -- latitude
	longitude   VARCHAR(20)  NULL,     -- longitude
	house_seq   INT          NULL      -- house_seq
);

-- address
ALTER TABLE address
	ADD CONSTRAINT PK_address -- address 기본키
		PRIMARY KEY (
			address_seq -- address_seq
		);

ALTER TABLE address
	MODIFY COLUMN address_seq INT NOT NULL AUTO_INCREMENT;

-- building
CREATE TABLE building (
	building_seq INT         NOT NULL, -- building_seq
	type         VARCHAR(20) NULL,     -- type
	house_seq    INT         NULL      -- house_seq
);

-- building
ALTER TABLE building
	ADD CONSTRAINT PK_building -- building 기본키
		PRIMARY KEY (
			building_seq -- building_seq
		);

ALTER TABLE building
	MODIFY COLUMN building_seq INT NOT NULL AUTO_INCREMENT;

-- facility
CREATE TABLE facility (
	facility_seq INT         NOT NULL, -- facility_seq
	type         VARCHAR(20) NULL      -- type
);

-- facility
ALTER TABLE facility
	ADD CONSTRAINT PK_facility -- facility 기본키
		PRIMARY KEY (
			facility_seq -- facility_seq
		);

ALTER TABLE facility
	MODIFY COLUMN facility_seq INT NOT NULL AUTO_INCREMENT;

-- rules
CREATE TABLE rules (
	rule_seq INT         NOT NULL, -- rule_seq
	rule     VARCHAR(20) NULL      -- rule
);

-- rules
ALTER TABLE rules
	ADD CONSTRAINT PK_rules -- rules 기본키
		PRIMARY KEY (
			rule_seq -- rule_seq
		);

ALTER TABLE rules
	MODIFY COLUMN rule_seq INT NOT NULL AUTO_INCREMENT;

-- block
CREATE TABLE block (
	block_seq  INT  NOT NULL, -- block_seq
	block_date DATE NULL,     -- block_date
	house_seq  INT  NULL      -- house_seq
);

-- block
ALTER TABLE block
	ADD CONSTRAINT PK_block -- block 기본키
		PRIMARY KEY (
			block_seq -- block_seq
		);

ALTER TABLE block
	MODIFY COLUMN block_seq INT NOT NULL AUTO_INCREMENT;

-- houses_facility
CREATE TABLE houses_facility (
	houses_facility_seq INT NOT NULL, -- houses_facility_seq
	house_seq           INT NULL,     -- house_seq
	facility_seq        INT NULL      -- facility_seq
);

-- houses_facility
ALTER TABLE houses_facility
	ADD CONSTRAINT PK_houses_facility -- houses_facility 기본키
		PRIMARY KEY (
			houses_facility_seq -- houses_facility_seq
		);

ALTER TABLE houses_facility
	MODIFY COLUMN houses_facility_seq INT NOT NULL AUTO_INCREMENT;

-- houses_rules
CREATE TABLE houses_rules (
	houses_rules_seq INT NOT NULL, -- houses_rules_seq
	house_seq        INT NOT NULL, -- house_seq
	rule_seq         INT NOT NULL  -- rule_seq
);

-- houses_rules
ALTER TABLE houses_rules
	ADD CONSTRAINT PK_houses_rules -- houses_rules 기본키
		PRIMARY KEY (
			houses_rules_seq -- houses_rules_seq
		);

ALTER TABLE houses_rules
	MODIFY COLUMN houses_rules_seq INT NOT NULL AUTO_INCREMENT;

-- reservation
CREATE TABLE reservation (
	resv_seq      INT         NOT NULL, -- resv_seq
	house_seq     INT         NOT NULL, -- house_seq
	checkin_date  DATE        NOT NULL, -- checkin_date
	checkout_date DATE        NOT NULL, -- checkout_date
	guest_cnt     INT         NOT NULL, -- guest_cnt
	email         VARCHAR(15) NULL      -- email
);

-- reservation
ALTER TABLE reservation
	ADD CONSTRAINT PK_reservation -- reservation 기본키
		PRIMARY KEY (
			resv_seq -- resv_seq
		);

ALTER TABLE reservation
	MODIFY COLUMN resv_seq INT NOT NULL AUTO_INCREMENT;

-- payment
CREATE TABLE payment (
	payment_seq  INT  NOT NULL, -- payment_seq
	card_num     INT  NOT NULL, -- card_num
	price        INT  NOT NULL, -- price
	payment_date DATE NOT NULL, -- payment_date
	resv_seq     INT  NOT NULL  -- resv_seq
);

-- payment
ALTER TABLE payment
	ADD CONSTRAINT PK_payment -- payment 기본키
		PRIMARY KEY (
			payment_seq -- payment_seq
		);

ALTER TABLE payment
	MODIFY COLUMN payment_seq INT NOT NULL AUTO_INCREMENT;

-- Guide_Major
CREATE TABLE Guide_Major (
	Guide_seq      INT         NOT NULL, -- Guide_seq
	Place          VARCHAR(15) NOT NULL, -- Place
	Major_Category VARCHAR(15) NOT NULL  -- Major_Category
);

-- Guide_Major
ALTER TABLE Guide_Major
	ADD CONSTRAINT PK_Guide_Major -- Guide_Major 기본키
		PRIMARY KEY (
			Guide_seq -- Guide_seq
		);

ALTER TABLE Guide_Major
	MODIFY COLUMN Guide_seq INT NOT NULL AUTO_INCREMENT;

-- Guide_Minor
CREATE TABLE Guide_Minor (
	Minor_seq      INT          NOT NULL, -- Minor_seq
	Minor_category VARCHAR(15)  NOT NULL, -- Minor_Category
	Host_Comment   VARCHAR(150) NULL,     -- Host_Comment
	Guide_seq      INT          NOT NULL  -- Guide_seq
);

-- Guide_Minor
ALTER TABLE Guide_Minor
	ADD CONSTRAINT PK_Guide_Minor -- Guide_Minor 기본키
		PRIMARY KEY (
			Minor_seq -- Minor_seq
		);

ALTER TABLE Guide_Minor
	MODIFY COLUMN Minor_seq INT NOT NULL AUTO_INCREMENT;

-- member
CREATE TABLE member (
	email      VARCHAR(15) NOT NULL, -- email
	pw         VARCHAR(20) NOT NULL, -- pw
	name       VARCHAR(10) NOT NULL, -- name
	phone      VARCHAR(15) NOT NULL, -- phone
	profileImg VARCHAR(20) NULL,     -- profileImg
	Guide_seq  INT         NOT NULL  -- Guide_seq
);

-- member
ALTER TABLE member
	ADD CONSTRAINT PK_member -- member 기본키
		PRIMARY KEY (
			email -- email
		);

-- houses
ALTER TABLE houses
	ADD CONSTRAINT FK_member_TO_houses -- member -> houses
		FOREIGN KEY (
			email -- email
		)
		REFERENCES member ( -- member
			email -- email
		);

-- address
ALTER TABLE address
	ADD CONSTRAINT FK_houses_TO_address -- houses -> address
		FOREIGN KEY (
			house_seq -- house_seq
		)
		REFERENCES houses ( -- houses
			house_seq -- house_seq
		);

-- building
ALTER TABLE building
	ADD CONSTRAINT FK_houses_TO_building -- houses -> building
		FOREIGN KEY (
			house_seq -- house_seq
		)
		REFERENCES houses ( -- houses
			house_seq -- house_seq
		);

-- block
ALTER TABLE block
	ADD CONSTRAINT FK_houses_TO_block -- houses -> block
		FOREIGN KEY (
			house_seq -- house_seq
		)
		REFERENCES houses ( -- houses
			house_seq -- house_seq
		);

-- houses_facility
ALTER TABLE houses_facility
	ADD CONSTRAINT FK_houses_TO_houses_facility -- houses -> houses_facility
		FOREIGN KEY (
			house_seq -- house_seq
		)
		REFERENCES houses ( -- houses
			house_seq -- house_seq
		);

-- houses_facility
ALTER TABLE houses_facility
	ADD CONSTRAINT FK_facility_TO_houses_facility -- facility -> houses_facility
		FOREIGN KEY (
			facility_seq -- facility_seq
		)
		REFERENCES facility ( -- facility
			facility_seq -- facility_seq
		);

-- houses_rules
ALTER TABLE houses_rules
	ADD CONSTRAINT FK_houses_TO_houses_rules -- houses -> houses_rules
		FOREIGN KEY (
			house_seq -- house_seq
		)
		REFERENCES houses ( -- houses
			house_seq -- house_seq
		);

-- houses_rules
ALTER TABLE houses_rules
	ADD CONSTRAINT FK_rules_TO_houses_rules -- rules -> houses_rules
		FOREIGN KEY (
			rule_seq -- rule_seq
		)
		REFERENCES rules ( -- rules
			rule_seq -- rule_seq
		);

-- reservation
ALTER TABLE reservation
	ADD CONSTRAINT FK_houses_TO_reservation -- houses -> reservation
		FOREIGN KEY (
			house_seq -- house_seq
		)
		REFERENCES houses ( -- houses
			house_seq -- house_seq
		);

-- reservation
ALTER TABLE reservation
	ADD CONSTRAINT FK_member_TO_reservation -- member -> reservation
		FOREIGN KEY (
			email -- email
		)
		REFERENCES member ( -- member
			email -- email
		);

-- payment
ALTER TABLE payment
	ADD CONSTRAINT FK_reservation_TO_payment -- reservation -> payment
		FOREIGN KEY (
			resv_seq -- resv_seq
		)
		REFERENCES reservation ( -- reservation
			resv_seq -- resv_seq
		);

-- Guide_Minor
ALTER TABLE Guide_Minor
	ADD CONSTRAINT FK_Guide_Major_TO_Guide_Minor -- Guide_Major -> Guide_Minor
		FOREIGN KEY (
			Guide_seq -- Guide_seq
		)
		REFERENCES Guide_Major ( -- Guide_Major
			Guide_seq -- Guide_seq
		);

-- member
ALTER TABLE member
	ADD CONSTRAINT FK_Guide_Major_TO_member -- Guide_Major -> member
		FOREIGN KEY (
			Guide_seq -- Guide_seq
		)
		REFERENCES Guide_Major ( -- Guide_Major
			Guide_seq -- Guide_seq
		);