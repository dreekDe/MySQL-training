CREATE SCHEMA `now`;
USE  `now`;

#1
CREATE TABLE `passports` (
    `passport_id` INT PRIMARY KEY NOT NULL,
    `passport_number` VARCHAR(30) UNIQUE 
);

CREATE TABLE `people` (
    `person_id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `salary` DECIMAL(11 , 2 ),
    `passrport_id` INT UNIQUE,
    CONSTRAINT fk_people_passport FOREIGN KEY (`passrport_id`)
        REFERENCES `passports` (`passport_id`)
);

INSERT INTO `passports`
VALUE 
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2');

INSERT INTO `people` 
VALUE 
(1,  'Roberto', 43300.00, 102),
(2,	'Tom', 56100.00, 103),
(3, 'Yana', 60200.00, 101);


#2
CREATE TABLE `manufacturers` (
  `manufacturer_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `established_on` DATE NOT NULL
   );
   
CREATE TABLE `models` (
    `model_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
   `manufacturer_id` INT NOT NULL,
    CONSTRAINT fk_models_manifacturers FOREIGN KEY (`manufacturer_id`)
        REFERENCES `manufacturers` (`manufacturer_id`)
);

INSERT INTO `manufacturers`  VALUES 
(1, 'BMW', '1916-03-01'),
(2, 'Tesla', '2003-01-01'),
(3, 'Lada', '1966-05-01');

INSERT INTO `models`  VALUES 
(101, 'X1', 1),
(102, 'i6', 1),
(103, 'Model S', 2),
(104, 'Model X', 2),
(105, 'Nova', 3);


#3


 DROP SCHEMA `now`;




