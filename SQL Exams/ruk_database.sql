CREATE SCHEMA `ruk_database`;
USE `ruk_database`;

CREATE TABLE `clients` (
    `id` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `full_name` VARCHAR(45) NOT NULL,
    `age` INT(11) NOT NULL
);

CREATE TABLE `bank_accounts` (
    `id` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `account_number` VARCHAR(10) NOT NULL,
    `balance` DECIMAL(10 , 2 ) NOT NULL,
    `client_id` INT(11) NOT NULL,
    CONSTRAINT fk_ba_cl FOREIGN KEY (`client_id`)
        REFERENCES `clients` (`id`)
);

CREATE TABLE `cards` (
    `id` INT(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `card_number` VARCHAR(19) NOT NULL,
    `card_status` VARCHAR(7) NOT NULL,
    `bank_account_id` INT(11) NOT NULL,
    CONSTRAINT fk_c_ba FOREIGN KEY (`bank_account_id`)
        REFERENCES `bank_accounts` (`id`)
);


CREATE TABLE `branches` (
    `id` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `name` VARCHAR(30) NOT NULL
);


CREATE TABLE `employees` (
    `id` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `first_name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(10 , 2 ) NOT NULL,
    `started_on` DATE NOT NULL,
    `branch_id` INT(11) NOT NULL,
    CONSTRAINT fe_e_br FOREIGN KEY (`branch_id`)
        REFERENCES `branches` (`id`)
);


CREATE TABLE `employees_clients` (
    `employee_id` INT(11),
    `client_id` INT(11),
    CONSTRAINT fk_ec_e FOREIGN KEY (`employee_id`)
        REFERENCES `employees` (`id`),
    CONSTRAINT fk_ec_c FOREIGN KEY (`client_id`)
        REFERENCES `clients` (`id`)
);