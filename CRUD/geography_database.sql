SELECT 
    `peak_name`
FROM
    `peaks`
ORDER BY `peak_name`;


SELECT 
    `country_name`, `population`
FROM
    `countries`
WHERE
    `continent_code` = 'EU'
ORDER BY `population` DESC
LIMIT 30;