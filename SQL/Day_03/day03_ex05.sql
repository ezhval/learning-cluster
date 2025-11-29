-- Exercise 05: pizzerias that Andrey visited but never ordered from

WITH andrey_visited AS (
    SELECT DISTINCT pizzeria_id
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE p.name = 'Andrey'
),
andrey_ordered AS (
    SELECT DISTINCT pz.id AS pizzeria_id
    FROM person p
    JOIN person_order po ON p.id = po.person_id
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    WHERE p.name = 'Andrey'
),
combined_result AS (
    SELECT pizzeria_id
    FROM andrey_visited

    EXCEPT

    SELECT pizzeria_id
    FROM andrey_ordered
)

SELECT p.name AS pizzeria_name
FROM combined_result cr
JOIN pizzeria p ON cr.pizzeria_id = p.id
ORDER BY pizzeria_name