CREATE SCHEMA if not EXISTS `softuni_stores_system`;
USE `softuni_store_sistem`;


CREATE TABLE `towns` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL
);

CREATE TABLE `addresses` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `town_id` INT(11) NOT NULL,
    FOREIGN KEY (`town_id`)
        REFERENCES `towns` (`id`)
);

CREATE TABLE `categories` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL
);

CREATE TABLE `pictures` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `url` VARCHAR(100) NOT NULL,
    `added_on` DATETIME not null
);

CREATE TABLE `stores` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `rating` FLOAT NOT NULL,
    `has_parking` TINYINT(1),
    `address_id` INT(11) NOT NULL,
    FOREIGN KEY (`address_id`)
        REFERENCES `addresses` (`id`)
);


CREATE TABLE `products` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(40) NOT NULL,
    `best_before` DATE,
    `price` DECIMAL(10 , 2 ) NOT NULL,
    `description` TEXT,
    `category_id` INT(11) NOT NULL,
    FOREIGN KEY (`category_id`)
        REFERENCES `categories` (`id`),
    `picture_id` INT(11) NOT NULL,
    FOREIGN KEY (`picture_id`)
        REFERENCES `pictures` (`id`)
);

CREATE TABLE `employees` (
    `id` INT(11) PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(15) NOT NULL,
    `middle_name` CHAR(1),
    `last_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(19 , 2 ) NOT NULL,
    `hire_date` DATE NOT NULL,
    `manager_id` INT(11),
    FOREIGN KEY (`manager_id`)
        REFERENCES `employees` (`id`),
    `store_id` INT(11) NOT NULL,
    FOREIGN KEY (`store_id`)
        REFERENCES `stores` (`id`)
);


CREATE TABLE `products_stores` (
    `product_id` INT(11),
    `store_id` INT(11),
    CONSTRAINT fk_ps_p FOREIGN KEY (`product_id`)
        REFERENCES `products` (`id`),
    CONSTRAINT fk_ps_s FOREIGN KEY (`store_id`)
        REFERENCES `stores` (`id`),
    CONSTRAINT pk_ps PRIMARY KEY (`product_id` , `store_id`)
);





