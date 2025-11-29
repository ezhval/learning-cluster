-- Exercise 10: people who ordered pizza from selected pizzerias (person_name, pizza_name, pizzeria_name), ordered by all columns

SELECT person.name AS person_name,
       menu.pizza_name AS pizza_name,
       pizzeria.name AS pizzeria_name
FROM person_order

JOIN person ON person_order.person_id = person.id

JOIN menu ON person_order.menu_id = menu.id

JOIN pizzeria ON menu.pizzeria_id = pizzeria.id

ORDER BY person_name ASC, pizza_name ASC, pizzeria_name ASC;