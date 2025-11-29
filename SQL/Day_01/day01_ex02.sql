-- Exercise 02: unique pizza_name values from menu, ordered by name in descending order

SELECT pizza_name 
FROM menu

UNION

SELECT pizza_name 
FROM menu

ORDER BY pizza_name DESC;