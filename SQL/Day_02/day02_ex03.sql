-- Exercise 03: same result as Exercise 01 but implemented using a CTE (generated date series)

WITH date_series AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day'::interval) AS visit_date
)
SELECT 
    ds.visit_date::date AS missing_date
FROM 
    date_series ds
LEFT JOIN 
    person_visits pv 
ON 
    ds.visit_date = pv.visit_date AND (pv.person_id = 1 OR pv.person_id = 2)
WHERE 
    pv.visit_date IS NULL
ORDER BY 
    ds.visit_date;