-- Exercise 01: only object_name values, persons first and pizza names after, keeping duplicates

SELECT name as object_name
FROM person

UNION ALL

SELECT pizza_name AS object_name
FROM menu

ORDER BY object_name;