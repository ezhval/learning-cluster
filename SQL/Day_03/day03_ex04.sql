-- Exercise 04: pizzerias with orders only from women union pizzerias with orders only from men (unique names)

WITH women_orders AS (
    SELECT DISTINCT m.pizzeria_id
    FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    WHERE p.gender = 'female'
),
men_orders AS (
    SELECT DISTINCT m.pizzeria_id
    FROM person_order po
    JOIN person p ON po.person_id = p.id
    JOIN menu m ON po.menu_id = m.id
    WHERE p.gender = 'male'
),
only_women_orders AS (
    SELECT pizzeria_id
    FROM women_orders
    
    EXCEPT -- возвращает строки, которые присутствуют в 1 запросе и отсутствуют во втором

    SELECT pizzeria_id
    FROM men_orders
),
only_men_orders AS (
    SELECT pizzeria_id
    FROM men_orders
    
    EXCEPT
    
    SELECT pizzeria_id
    FROM women_orders
),
combined_result AS (
    SELECT pizzeria_id
    FROM only_women_orders
    
    UNION
    
    SELECT pizzeria_id
    FROM only_men_orders
)

SELECT DISTINCT p.name AS pizzeria_name
FROM combined_result cr
JOIN pizzeria p ON cr.pizzeria_id = p.id
ORDER BY pizzeria_name;