#1
CREATE DEFINER=`root`@`localhost` FUNCTION `ufn_count_employees_by_town`(town_name VARCHAR(45)) RETURNS int
    DETERMINISTIC
BEGIN

DECLARE count_town_ppl INT (11);

SET  `count_town_ppl` := (SELECT COUNT(e.employee_id) FROM employees AS e
       INNER JOIN `addresses` AS a 
        ON a.address_id = e.address_id
      INNER  JOIN `towns` AS t 
        ON a.town_id = t.town_id
WHERE  t.`name` = town_name); 

RETURN  count_town_ppl;
END

                                                                                           
SELECT UFN_COUNT_EMPLOYEES_BY_TOWN('Sofia') AS `count`;
                                                                                           

#2
CREATE DEFINER=`root`@`localhost` PROCEDURE `usp_raise_salaries`(`department_name` VARCHAR(45))
BEGIN
UPDATE `employees` AS e
        JOIN
    `departments` AS d ON d.department_id = e.department_id 
SET 
    e.`salary` = e.`salary` * 1.05
WHERE
    d.`name` = `department_name`;
END 
                                                                                           
                                                                                           
                                                                                           
                                                                                    
    
