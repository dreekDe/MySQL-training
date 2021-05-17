CREATE SCHEMA `ruk_database`;
USE `ruk_database`;

CREATE TABLE `clients` (
    `id` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `full_name` VARCHAR(50) NOT NULL,
    `age` INT(11) NOT NULL
);

CREATE TABLE `bank_accounts` (
    `id` INT(11) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `account_number` VARCHAR(10) NOT NULL,
    `balance` DECIMAL(10 , 2 ) NOT NULL,
    `client_id` INT(11) NOT NULL UNIQUE,
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
    `name` VARCHAR(30) NOT NULL UNIQUE
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


INSERT INTO `cards`(`card_number`, `card_status`, `bank_account_id`)
(
SELECT 
     REVERSE(`full_name`), 'Active', id
FROM
    `clients`
WHERE
    id BETWEEN 191 AND 200
);
                                                                          
                                                                                 
                                                                                 

UPDATE employees_clients AS ec 
SET 
    ec.employee_id = (SELECT 
            e.employee_id
        FROM
            (SELECT 
                *
            FROM
                employees_clients) AS e
        GROUP BY e.employee_id
        ORDER BY COUNT(e.client_id) , e.employee_id
        LIMIT 1)
WHERE
    ec.employee_id = ec.client_id;




DELETE e . * FROM employees AS e
        LEFT JOIN
    employees_clients AS ec ON ec.employee_id = e.id 
WHERE
    ec.client_id IS NULL;




SELECT 
    id, full_name
FROM
    clients;

SELECT 
    id,
    CONCAT_WS(' ', first_name, last_name),
    CONCAT('$', salary),
    started_on
FROM
    employees
WHERE
    salary >= 100000
        AND started_on >= '2018-01-01'
ORDER BY salary DESC , id DESC
;




SELECT 
    c.id,
    CONCAT_WS(' : ', c.card_number, cl.full_name) AS card_token
FROM
    cards AS c
        JOIN
    bank_accounts AS ba ON ba.id = c.bank_account_id
        JOIN
    clients AS cl ON cl.id = ba.client_id
ORDER BY c.id DESC;
    


SELECT 
    CONCAT_WS(' ', e.first_name, e.last_name) AS name,
    e.started_on,
    COUNT(ec.client_id) AS count_of_clients
FROM
    employees_clients AS ec
        JOIN
    employees AS e ON e.id = ec.employee_id
GROUP BY ec.employee_id
ORDER BY count_of_clients DESC , ec.employee_id ASC
LIMIT 5;




SELECT 
    br.name, COUNT(cr.card_number) AS count_of_cards
FROM
    branches AS br
        LEFT JOIN
    employees AS e ON e.branch_id = br.id
        LEFT JOIN
    employees_clients AS ec ON ec.employee_id = e.id
        LEFT JOIN
    clients AS cl ON cl.id = ec.client_id
        LEFT JOIN
    bank_accounts AS ba ON ba.client_id = cl.id
        LEFT JOIN
    cards AS cr ON cr.bank_account_id = ba.id
GROUP BY br.name
ORDER BY count_of_cards DESC , br.name ASC
;




CREATE DEFINER=`root`@`localhost` FUNCTION `udf_client_cards_count`(name VARCHAR(30)) RETURNS int
    DETERMINISTIC
BEGIN

RETURN (SELECT 
    COUNT(cr.card_number) AS cards
FROM
    clients AS cl
        LEFT JOIN
    bank_accounts AS ba ON ba.client_id = cl.id
        LEFT JOIN
    cards AS cr ON cr.bank_account_id = ba.id
    WHERE cl.full_name = name);

END
       



CREATE DEFINER=`root`@`localhost` PROCEDURE `udp_clientinfo`(name VARCHAR (30))
BEGIN
SELECT 
    cl.full_name, cl.age, ba.account_number, CONCAT('$', ba.balance) as balance
FROM
    clients AS cl
    JOIN bank_accounts as ba on ba.client_id = cl.id
    WHERE cl.full_name = name;
END

