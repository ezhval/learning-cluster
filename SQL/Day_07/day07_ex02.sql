-- Exercise 02: top 3 pizzerias by visits and by orders in one list with action_type = 'visit'/'order'

WITH top_visits AS (
    SELECT 
        pz.name,
        COUNT(*) AS count,
        'visit' AS action_type -- добавляем столбец action_type со значением 'visit'
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count DESC
    LIMIT 3
),
top_orders AS (
    SELECT 
        pz.name,
        COUNT(*) AS count,
        'order' AS action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
    ORDER BY count DESC
    LIMIT 3
)

SELECT * 
FROM top_visits
UNION ALL
SELECT * 
FROM top_orders
ORDER BY 
    action_type ASC,
    count DESC;