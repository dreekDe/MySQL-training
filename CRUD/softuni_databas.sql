SELECT 
    *
FROM
    `departments`
ORDER BY `department_id`;



SELECT 
    `name`
FROM
    `departments`
ORDER BY `department_id`;



SELECT 
    `first_name`, `last_name`, `salary`
FROM
    `employees`
ORDER BY `employee_id`; 



SELECT 
    `first_name`, `middle_name`, `last_name`
FROM
    `employees`
ORDER BY `employee_id`; 



SELECT 
    CONCAT(`first_name`,'.',`last_name`,'@softuni.bg') AS `full_email_address`
FROM
    `employees`;



   SELECT DISTINCT
    `salary`
FROM
    `employees`
ORDER BY `employee_id`;
   
   
   
SELECT 
    `employee_id`,
    `first_name` AS `First Name`,
    `last_name` AS `Last Name`,
    `middle_name` AS `Middle Name`,
    `job_title` AS `Job Title`,
    `department_id` AS `Dept ID`,
    `manager_id` AS `Mngr ID`,
    `hire_date` AS `Hire Date`,
    `salary`,
    `address_id`
FROM
    `employees`
WHERE
    job_title = 'Sales Representative'
ORDER BY `employee_id`; 



SELECT
 `first_name`,
    `last_name`,
    `job_title` AS `JobTitle`
FROM
    `employees`
WHERE
  salary > 20000 and salary < 30000
ORDER BY `employee_id`; 



SELECT
 `first_name`,
    `last_name`,
    `job_title` AS `JobTitle`
FROM
    `employees`
WHERE
  salary BETWEEN 20000 and  30000
ORDER BY `employee_id`; 



SELECT 
    CONCAT_WS(' ',
            `first_name`,
            `middle_name`,
            `last_name`) AS `Full Name`
FROM
    `employees`
WHERE
    salary = 25000 OR salary = 14000
        OR salary = 12500
        OR salary = 23600;



SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    `manager_id` IS NULL;
    

    
SELECT 
    `first_name`, `last_name`, `salary`
FROM
    `employees`
WHERE
    salary > 50000
ORDER BY  `salary` DESC;
 
    
    
SELECT 
    `first_name`, `last_name`
FROM
    `employees`
ORDER BY `salary` DESC
LIMIT 5;



SELECT 
    `first_name`, `last_name`
FROM
    `employees`
WHERE
    NOT department_id = 4;
   
   
SELECT 
    *
FROM
    `employees`
ORDER BY `salary` DESC , `first_name` ASC , `last_name` DESC , `middle_name` ASC; 



   



