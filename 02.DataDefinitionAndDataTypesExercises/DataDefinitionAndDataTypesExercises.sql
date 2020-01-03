-- 0. Create Database
-- You now know how to create database using the GUI of the HeidiSQL.
-- Now it’s time to create it using SQL queries.
-- In that task (and the several following it) you will be required to create the database from the previous exercise using only SQL queries.
-- Firstly, just create new database named minions.
CREATE DATABASE `minions`;

-- 1. Create Tables
-- In the newly created database Minions add table minions (id, name, age).
-- Then add new table towns (id, name).
-- Set id columns of both tables to be primary key as constraint.
-- Submit your create table queries in Judge together for both tables (one after another separated by “;”) as Run queries & check DB.
CREATE TABLE `minions` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(16) NOT NULL,
    `age` INT NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

CREATE TABLE `towns` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(16) NOT NULL,
    PRIMARY KEY(`id`)
) ENGINE = InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- 2. Alter Minions Table
-- Change the structure of the Minions table to have new column town_id that would be of the same type as the id column of towns table.
-- Add new constraint that makes town_id foreign key and references to id column of towns table.
-- Submit your create table query in Judge as MySQL run skeleton, run queries & check DB
ALTER TABLE `minions` 
ADD COLUMN `town_id` INT NOT NULL;
ALTER TABLE `minions` 
ADD CONSTRAINT `fk_town_id`
  FOREIGN KEY (`town_id`)
  REFERENCES `towns` (`id`);
  
-- 3. Insert Records in Both Tables
-- Populate both tables with sample records given in the table below.
INSERT INTO `towns`(`id`, `name`)
	VALUES (1, 'Sofia'),
			(2, 'Plovdiv'),
            (3, 'Varna');
            
INSERT INTO `minions`(`id`, `name`, `age`, `town_id`)
	VALUES(1, 'Kevin', 22, 1),
			(2, 'Bob', 15, 3),
			(3, 'Steward', NULL, 2);

-- 4. Truncate Table Minions
-- Delete all the data from the minions table using SQL query. Submit your query in Judge as Run skeleton, run queries & check DB.
TRUNCATE `minions`;

-- 5. Drop All Tables
-- Delete all tables from the minions database using SQL query. Submit your query in Judge as Run skeleton, run queries & check DB.
DROP TABLE `minions`;
DROP TABLE `towns`;

-- 6. Create Table People
-- Using SQL query create table “people” with columns:
-- • id – unique number for every person there will be no more than 231-1people. (Auto incremented)
-- © Software University Foundation (softuni.org). This work is licensed under the CC-BY-NC-SA license.
-- Follow us: Page 2 of 5
-- • name – full name of the person will be no more than 200 Unicode characters. (Not null)
-- • picture – image with size up to 2 MB. (Allow nulls)
-- • height – In meters. Real number precise up to 2 digits after floating point. (Allow nulls)
-- • weight – In kilograms. Real number precise up to 2 digits after floating point. (Allow nulls)
-- • gender – Possible states are m or f. (Not null)
-- • birthdate – (Not null)
-- • biography – detailed biography of the person it can contain max allowed Unicode characters. (Allow nulls)
-- Make id primary key. Populate the table with 5 records. Submit your CREATE and INSERT statements in Judge as Run queries & check DB.
CREATE TABLE `people` (
	`id` INT NOT NULL PRIMARY KEY UNIQUE AUTO_INCREMENT,
    `name` VARCHAR(200) NOT NULL,
    `picture`BLOB,
    `height` DOUBLE(3, 2),
    `weight` DOUBLE(3, 2),
    `gender` ENUM('m', 'f') NOT NULL,
    `birthdate` date NOT NULL,
    `biography` LONGTEXT
) ENGINE=InnoDB;

INSERT INTO `people`(`name`, `gender`, `birthdate`)
	VALUES
			('Peter', 'm', '1988-02-17'),
            ('Michael', 'f', '2012-02-13'),
            ('Mariya', 'm', '1988-08-04'),
            ('Oleg', 'm', '1982-03-03'),
            ('Magdalena','f','2020-05-20');
	
-- 7. Create Table Users
-- Using SQL query create table users with columns:
-- • id – unique number for every user. There will be no more than 263-1 users. (Auto incremented)
-- • username – unique identifier of the user will be no more than 30 characters (non Unicode). (Required)
-- • password – password will be no longer than 26 characters (non Unicode). (Required)
-- • profile_picture – image with size up to 900 KB.
-- • last_login_time
-- • is_deleted – shows if the user deleted his/her profile. Possible states are true or false.
-- Make id primary key. Populate the table with 5 records. Submit
CREATE TABLE `users`(
	`id` BIGINT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    `username` VARCHAR(30) NOT NULL UNIQUE,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` TIMESTAMP,
    `is_deleted` BOOLEAN
);

INSERT INTO `users`(`username`, `password`, `last_login_time`, `is_deleted`)
	VALUES
			('popUpFish', '123', NOW(), FALSE),
            ('iupiYey', '123', NOW(), TRUE),
            ('superMario', '123', NOW(), FALSE),
            ('ManyO', '123', NULL, FALSE),
            ('mammaMia', '123', NULL, TRUE);

-- 8. Change Primary Key
-- Using SQL queries modify table users from the previous task. First remove current primary key then create new primary key that would be combination of fields id and username.
-- The initial primary key name on id is pk_users. Submit your query in Judge as Run skeleton, run queries & check DB.
ALTER TABLE `users`
	DROP PRIMARY KEY,
    ADD CONSTRAINT `pk_users` PRIMARY KEY(`id`, `username`);

-- 9. Set Default Value of a Field
-- Using SQL queries modify table users. Make the default value of last_login_time field to be the current time.
-- Submit your query in Judge as Run skeleton, run queries & check DB.
ALTER TABLE `users`
	MODIFY COLUMN `last_login_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `users`
	CHANGE COLUMN `last_login_time` `last_login_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 10. Set Unique Field
-- Using SQL queries modify table users. Remove username field from the primary key so only the field id would be primary key.
-- Now add unique constraint to the username field. The initial primary key name on (id, username) is pk_users.
-- Submit your query in Judge as Run skeleton, run queries & check DB.
ALTER TABLE `users`
	DROP PRIMARY KEY,
    ADD CONSTRAINT `pk_users` PRIMARY KEY(`id`),
    ADD CONSTRAINT UNIQUE(`username`);

-- 11. Movies Database
-- Using SQL queries create Movies database with the following entities:
-- • directors (id, director_name, notes)
-- • genres (id, genre_name, notes)
-- • categories (id, category_name, notes)
-- • movies (id, title, director_id, copyright_year, length, genre_id, category_id, rating, notes)
-- Set most appropriate data types for each column. Set primary key to each table. Populate each table with 5 records. Make sure the columns that are present in 2 tables would be of the same data type. Consider which fields
-- © Software University Foundation (softuni.org). This work is licensed under the CC-BY-NC-SA license.
-- Follow us: Page 3 of 5
-- are always required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries & check DB.
CREATE DATABASE `movies`;

USE `movies`

CREATE TABLE `directors` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(32) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `genres` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(16) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `categories` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(32) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `movies` (
	`id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(32) NOT NULL,
    `director_id` INT NOT NULL,
    `copyright_year` YEAR NOT NULL,
    `length` TIME NOT NULL,
    `genre_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `rating` INT NOT NULL,
    `notes` TEXT
);

INSERT INTO `directors`(`director_name`)
	VALUES
			('Peter'),
			('Nikolay'),
            ('Mariya'),
            ('Olive'),
            ('Momo');
            
INSERT INTO `genres`(`genre_name`)
	VALUES
			('horror'),
			('comedy'),
			('action'),
			('thriller'),
			('adventure');            
            
INSERT INTO `categories`(`category_name`)
	VALUES
			('yoyo'),
			('yoyo1'),
			('yoyo2'),
			('yoyo3'),
			('yoyo4');
            
INSERT INTO `movies`(`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`)
	VALUES
			('Walk in a park', 1, 2018, 23, 1, 1, 10),
			('Sleep in a park', 2, 2017, 45, 2, 2, 9),
			('Live in a park', 3, 2016, 54, 3, 3, 8),
			('Jump in a park', 4, 2015, 28, 4, 4, 7),
			('Swinm in a park', 5, 2014, 49, 5, 5, 6);

-- 12. Car Rental Database
-- Using SQL queries create car_rental database with the following entities:
-- • categories (id, category, daily_rate, weekly_rate, monthly_rate, weekend_rate)
-- • cars (id, plate_number, make, model, car_year, category_id, doors, picture, car_condition, available)
-- • employees (id, first_name, last_name, title, notes)
-- • customers (id, driver_licence_number, full_name, address, city, zip_code, notes)
-- • rental_orders (id, employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes)
-- Set most appropriate data types for each column. Set primary key to each table. Populate each table with 3 records.
-- Make sure the columns that are present in 2 tables would be of the same data type. Consider which fields are always required and which are optional.
-- Submit your CREATE TABLE and INSERT statements as Run queries & check DB.
CREATE DATABASE `car_rental`;

USE `car_rental`;

CREATE TABLE `categories` (
	`id` INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	`category` VARCHAR(30) NOT NULL,
	`daily_rate` DOUBLE NOT NULL,
	`weekly_rate` DOUBLE NOT NULL,
	`monthly_rate` DOUBLE NOT NULL,
	`weekend_rate` DOUBLE NOT NULL
);

INSERT INTO `categories`(`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`)
	VALUES
			('cat1', 100.00, 500.00, 1500.00, 250.00),
            ('cat2', 110.00, 520.00, 1550.00, 300.00),
            ('cat3', 50.00, 200.00, 500.00, 150.00);

CREATE TABLE `cars` (
	`id` INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	`plate_number` VARCHAR(20) NOT NULL UNIQUE,
	`make` VARCHAR(20) NOT NULL,
	`model` VARCHAR(20) NOT NULL,
	`car_year` YEAR NOT NULL,
	`category_id` INT UNSIGNED NOT NULL,
	`doors` TINYINT UNSIGNED NOT NULL,
	`picture` BLOB,
	`car_condition` VARCHAR(20),
	`available` BOOLEAN NOT NULL DEFAULT TRUE
);

INSERT INTO `cars`
		(`plate_number`, `make`, `model`, `car_year`, `category_id`, `doors`, `car_condition`)
	VALUES 
		('Plate Num 1', 'Maker 1', 'Model 1', '1970', 1, 2, ''),
		('Plate Num 2', 'Maker 2', 'Model 2', '1980', 2, 4, 'Scrap'),
		('Plate Num 3', 'Maker 3', 'Model 3', '1990', 3, 5, 'Good');

CREATE TABLE `employees` (
	`id` INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	`first_name` VARCHAR(30) NOT NULL,
	`last_name` VARCHAR(30) NOT NULL,
	`title` VARCHAR(30) NOT NULL,
	`notes` VARCHAR(128)
);

INSERT INTO `employees`
		(`first_name`, `last_name`, `title`, `notes`)
	VALUES 
		('Gosho', 'Goshev', 'Boss', ''),
		('Pesho', 'Peshev', 'Supervisor', ''),
		('Bai', 'Ivan', 'Worker', 'Can do any work');

CREATE TABLE `customers` (
	`id` INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	`driver_licence_number` VARCHAR(30) NOT NULL,
	`full_name` VARCHAR(60) NOT NULL,
	`address` VARCHAR(50) NOT NULL,
	`city` VARCHAR(20) NOT NULL,
	`zip_code` INT(4) NOT NULL,
	`notes` VARCHAR(128)
);

INSERT INTO `customers`
		(`driver_licence_number`, `full_name`, `address`, `city`, `zip_code`, `notes`)
	VALUES 
		('1234ABCD', 'Gosho Goshev', 'A casstle', 'Sofia', 1000, ''),
		('2234ABCD', 'Pesho Peshev', 'A boat', 'Varna', 2000, ''),
		('3234ABCD', 'Bai Ivan', 'Under the bridge', 'Sofia', 1000, '');

CREATE TABLE `rental_orders` (
	`id` INT UNSIGNED PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	`employee_id` INT UNSIGNED NOT NULL,
	`customer_id` INT UNSIGNED NOT NULL,
	`car_id` INT UNSIGNED NOT NULL,
	`car_condition` VARCHAR(20),
	`tank_level` DOUBLE,
	`kilometrage_start` DOUBLE,
	`kilometrage_end` DOUBLE,
	`total_kilometrage` DOUBLE,
	`start_date` DATE,
	`end_date` DATE,
	`total_days` INT UNSIGNED,
	`rate_applied` DOUBLE,
	`tax_rate` DOUBLE,
	`order_status` VARCHAR(30),
	`notes` VARCHAR(128)
);

INSERT INTO `rental_orders`
		(`employee_id`, `customer_id`, `car_id`, `car_condition`, `start_date`)
	VALUES 
		(1, 3, 2, 'Good', NOW()),
		(2, 1, 3, 'Bad', NOW()),
		(3, 2, 1, 'OK', NOW());

-- 13. Hotel Database
-- Using SQL queries create Hotel database with the following entities:
-- • employees (id, first_name, last_name, title, notes)
-- • customers (account_number, first_name, last_name, phone_number, emergency_name, emergency_number, notes)
-- • room_status (room_status, notes)
-- • room_types (room_type, notes)
-- • bed_types (bed_type, notes)
-- • rooms (room_number, room_type, bed_type, rate, room_status, notes)
-- • payments (id, employee_id, payment_date, account_number, first_date_occupied, last_date_occupied, total_days, amount_charged, tax_rate, tax_amount, payment_total, notes)
-- • occupancies (id, employee_id, date_occupied, account_number, room_number, rate_applied, phone_charge, notes)
-- Set most appropriate data types for each column. Set primary key to each table.
-- Populate each table with 3 records. Make sure the columns that are present in 2 tables would be of the same data type.
-- Consider which fields are always required and which are optional. Submit your CREATE TABLE and INSERT statements as Run queries & check DB.
CREATE DATABASE `hotel`;

USE `hotel`;

CREATE TABLE `employees` (
	`id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `title` VARCHAR(30) NOT NULL,
    `notes` VARCHAR(128)
);

INSERT INTO `employees` (`first_name`, `last_name`, `title`)
VALUES
		('Gosho', 'Goshov', 'Boss'),
        ('Pesho', 'Peshev', 'Manager'),
        ('Simo', 'Simov', 'Worker');

CREATE TABLE `customers` (
	`account_number` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(30) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `phone_number` VARCHAR(20),
    `emergency_name` VARCHAR(30) NOT NULL,
    `emergency_number` VARCHAR(20) NOT NULL,
    `notes` VARCHAR(128)
);

INSERT INTO `customers`
		(`first_name`, `last_name`, `emergency_name`, `emergency_number`)
VALUES
		('Nikolay', 'Nikolov', 'Mariya', '3135135'),
        ('Doncho', 'Donchov', 'Kiril', '136513'),
        ('Ivan', 'Ivanov', 'Kolio', '52153135');

CREATE TABLE `room_status` (
	`room_status` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `notes` VARCHAR(128)
);

INSERT INTO `room_status` (`notes`)
VALUES
		('Free'),
        ('Occupied'),
        ('Change the sheets');
        
CREATE TABLE `room_types` (
	`room_type` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `notes` VARCHAR(128)
);

INSERT INTO `room_types` (`notes`)
	VALUES
			('Single'),
            ('Double'),
            ('Triple');

CREATE TABLE `bed_types` (
	`bed_type` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `notes` VARCHAR(128)
);

INSERT INTO `bed_types` (`notes`)
	VALUES
			('King size'),
            ('Queend size'),
            ('Standard size');
            
CREATE TABLE `rooms` (
	`room_number` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `room_type` INT NOT NULL,
    `bed_type` INT NOT NULL,
    `rate` DOUBLE NOT NULL,
    `room_status` INT NOT NULL,
    `notes` VARCHAR(128)
);

INSERT INTO `rooms` (`room_type`, `bed_type`, `rate`, `room_status`)
	VALUES
			(1, 1, 100, 1),
            (2, 2, 90, 1),
            (3, 3, 80, 1);

CREATE TABLE `payments` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `employee_id` INT NOT NULL,
    `payment_date` DATE NOT NULL,
    `account_number` VARCHAR(30) NOT NULL,
	`first_date_occupied` DATE,
    `last_date_occupied` DATE,
    `total_days` INT,
    `amount_charged` DOUBLE,
    `tax_rate` DOUBLE,
    `tax_amount` DOUBLE,
    `payment_total` DOUBLE,
    `notes` VARCHAR(128)
);

INSERT INTO `payments` (`employee_id`, `payment_date`, `account_number`)
	VALUES
			(1, '2018-01-01', '4134314314'),
            (2, '2018-01-03', '5465464456'),
            (1, '2018-01-04', '5464564566');

CREATE TABLE `occupancies` (
	`id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `employee_id` INT NOT NULL,
    `date_occupied` DATE NOT NULL,
    `account_number` INT NOT NULL,
    `room_number` INT NOT NULL,
    `rate_applied` DOUBLE,
    `phone_charge` DOUBLE,
    `notes` VARCHAR(128)
);

INSERT INTO `occupancies` (`employee_id`, `date_occupied`, `account_number`, `room_number`)
	VALUES
			(1, '2018-01-01', 13513513, 1),
            (1, '2018-01-03', 46146565, 2),
            (1, '2018-01-05', 45645645, 3);

-- 15. Create SoftUni Database
-- Now create bigger database called soft_uni. You will use database in the future tasks. It should hold information about
-- • towns (id, name)
-- • addresses (id, address_text, town_id)
-- • departments (id, name)
-- © Software University Foundation (softuni.org). This work is licensed under the CC-BY-NC-SA license.
-- Follow us: Page 4 of 5
-- • employees (id, first_name, middle_name, last_name, job_title, department_id, hire_date, salary, address_id)
-- Id columns are auto incremented starting from 1 and increased by 1 (1, 2, 3, 4…).
-- Make sure you use appropriate data types for each column.
-- Add primary and foreign keys as constraints for each table. Use only SQL queries.
-- Consider which fields are always required and which are optional. Submit your CREATE TABLE statements as Run queries & check DB.
CREATE DATABASE `softUni`;

USE `softUni`;

CREATE TABLE `towns` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(16) NOT NULL,
    CONSTRAINT `pk_towns` PRIMARY KEY (`id`)
);

CREATE TABLE `addresses` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `address_text` VARCHAR(50) NOT NULL,
    `town_id` INT NOT NULL,
    CONSTRAINT `pk_addresses` PRIMARY KEY (`id`),
    CONSTRAINT `fk_addresses_towns` FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`)
);

CREATE TABLE `departments` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(16) NOT NULL,
    CONSTRAINT `pk_departments` PRIMARY KEY (`id`)
);

CREATE TABLE `employees` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `middle_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `job_title` VARCHAR(32) NOT NULL,
    `department_id` INT NOT NULL,
    `hire_date` DATE NOT NULL,
    `salary` INT NOT NULL,
    `address_id` INT NOT NULL,
    CONSTRAINT `pk_employees` PRIMARY KEY (`id`),
    CONSTRAINT `fk_employees_department`
		FOREIGN KEY (`department_id`)
        REFERENCES `departments` (`id`),
	CONSTRAINT `fk_employees_addresses`
		FOREIGN KEY (`address_id`)
        REFERENCES `addresses` (`id`)
);

-- **. Backup Database
-- By using mysqldump command from MySql command line make a backup of the database soft_uni, from the previous tasks, into a file named “softuni-backup.sql”.
-- Drop your database from Heidi or MySQL Workbench. Then restore the database from the created backup file by using mysql command line.

-- mysqldump –u[user name] –p [database name] > [dump file]
-- then
DROP DATABASE `soft_uni`;
-- then
-- mysql -u <user> -p<password> < softuni-backup.sql

-- 15. Basic Insert
-- Use the SoftUni database and insert some data using SQL queries.
-- • towns: Sofia, Plovdiv, Varna, Burgas
-- • departments: Engineering, Sales, Marketing, Software Development, Quality Assurance
-- • employees:
-- Submit your INSERT queries in Judge as Run skeleton, run queries & check DB.
INSERT INTO `towns` (`town`)
	VALUES
			('Sofia'),
            ('Plovdiv'),
            ('Varna'),
            ('Burgas');
            
INSERT INTO `departments` (`name`)
	VALUES
			('Engineering Sales'),
            ('Sales'),
            ('Marketing'),
            ('Software Develpemnt'),
            ('Quality Assurance');
            
INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
	VALUES
			('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
            ('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
            ('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
            ('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
            ('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);

-- 16. Basic Select All Fields
-- Use the soft_uni database and first select all records from the towns, then from departments and finally from employees table.
-- Use SQL queries and submit them to Judge at once. Submit your query statements as Prepare DB & Run queries.
SELECT * FROM `towns`;
SELECT * FROM `departments`;
SELECT * FROM `employees`;

-- 17. Basic Select All Fields and Order Them
-- Modify queries from previous problem by sorting:
-- • towns - alphabetically by name
-- • departments - alphabetically by name
-- • employees - descending by salary
-- Submit your query statements as Prepare DB & Run queries.
SELECT * FROM `towns`
ORDER BY `town`;
SELECT * FROM `departments`
ORDER BY `name`;
SELECT * FROM `employees`
ORDER BY `salary` DESC;

-- 18. Basic Select Some Fields
-- Modify queries from previous problem to show only some of the columns. For table: name job_title department hire_date salary
-- © Software University Foundation (softuni.org). This work is licensed under the CC-BY-NC-SA license.
-- Follow us: Page 5 of 5
-- • towns – name
-- • departments – name
-- • employees – first_name, last_name, job_title, salary
-- Keep the ordering from the previous problem. Submit your query statements as Prepare DB & Run queries.
SELECT `town` FROM `towns`
ORDER BY `town`;
SELECT `name` FROM `departments`
ORDER BY `name`;
SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC;

-- 19. Increase Employees Salary
-- Use softuni database and increase the salary of all employees by 10%. Select only salary column from the employees table. Submit your query statements as Prepare DB & Run queries.
UPDATE `employees`
	SET `salary` = `salary` * 1.10;

SELECT `salary` FROM `employees`;

-- 20. Decrease Tax Rate
-- Use hotel database and decrease tax rate by 3% to all payments. Select only tax_rate column from the payments table. Submit your query statements as Prepare DB & Run queries.
UPDATE `payments`
	SET `tax_rate` = `tax_rate` * 0.97;
SELECT `tax_rate` FROM `payments`;

-- 21. Delete All Records
-- Use Hotel database and delete all records from the occupancies table. Use SQL query. Submit your query statements as Run skeleton, run queries & check DB.
DELETE FROM `occupancies`;









