-- Exercise 09: per address compute formula = max_age - (min_age / max_age), average age and comparison = formula > average

SELECT 
    p.address,
    ROUND(MAX(p.age) - (MIN(p.age) * 1.0 / MAX(p.age)), 2) AS formula,
    ROUND(AVG(p.age), 2) AS average,
    CASE 
        WHEN (MAX(p.age) - (MIN(p.age) * 1.0 / MAX(p.age))) > AVG(p.age) THEN 'true'
        ELSE 'false'
    END AS comparison
FROM person p
GROUP BY p.address
ORDER BY p.address;