SELECT 
    `department_id`, MIN(`salary`) AS `minimum_salary`
FROM
    `employees`
WHERE
    `department_id` IN (2 , 5, 7)
        AND `hire_date` > '2000-01-01'
GROUP BY `department_id`
ORDER BY `department_id`;




CREATE TABLE `temp` SELECT * FROM
    `employees`
WHERE
    `salary` > 30000;
    
DELETE FROM `temp` 
WHERE
    `manager_id` = 42;
    
UPDATE `temp` 
SET 
    `salary` = `salary` + 5000
WHERE
    `department_id` = 1;
    

SELECT 
    `department_id`, avg(`salary`) as `avg_salary`
FROM
    `temp`
    GROUP BY `department_id`
    ORDER BY `department_id`;
    
    

SELECT 
    `department_id`, MAX(`salary`) AS `max_salary`
FROM
    `employees`
GROUP BY `department_id`
HAVING `max_salary` NOT BETWEEN 30000 and 70000
ORDER BY `department_id`;
  
   

SELECT 
    COUNT(`manager_id`) AS ` `
FROM
    `employees`
WHERE
    `manager_id` IS NULL;



