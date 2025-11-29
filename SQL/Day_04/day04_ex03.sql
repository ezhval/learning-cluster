-- Exercise 03: using v_generated_dates, select days in January 2022 with no visits as missing_date

SELECT generated_date AS missing_date
FROM v_generated_dates gd
LEFT JOIN person_visits pv ON gd.generated_date = pv.visit_date
WHERE 
    pv.visit_date IS NULL
ORDER BY 
    missing_date;


SELECT generated_date AS missing_date
FROM v_generated_dates

EXCEPT

SELECT visit_date AS missing_date
FROM person_visits

ORDER BY missing_date;
