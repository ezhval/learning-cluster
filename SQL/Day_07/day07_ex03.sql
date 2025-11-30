-- Exercise 03: join visit/order counts per pizzeria, compute total_count and sort by total_count desc, name asc

WITH visits AS (
    SELECT 
        pz.name AS restaurant_name,
        COUNT(*) AS visit_count
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
),
orders AS (
    SELECT 
        pz.name AS restaurant_name,
        COUNT(*) AS order_count
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
)

SELECT 
    v.restaurant_name AS name, 
    COALESCE(v.visit_count, 0) + COALESCE(o.order_count, 0) AS total_count -- если данные отсутствуют в одной из таблиц, вместо NULL подставляется 0
FROM visits v
FULL JOIN orders o ON v.restaurant_name = o.restaurant_name
ORDER BY 
    total_count DESC,
    name ASC;