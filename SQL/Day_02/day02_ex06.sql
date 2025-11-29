-- Exercise 06: pizza and pizzeria names for orders made by Denis or Anna, ordered by pizza and pizzeria

SELECT m.pizza_name, pz.name AS pizzeria_name
FROM person_order po
JOIN person p ON p.id = po.person_id AND p.name IN ('Anna', 'Denis')
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY pizza_name, pizzeria_name;