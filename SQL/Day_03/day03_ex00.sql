-- Exercise 00: Kate’s visits with pizzas priced between 800 and 1000 (pizza, price, pizzeria, visit_date)

SELECT Kate.pizza_name, Kate.price, Kate.pizzeria_name, Kate.visit_date
FROM (
    SELECT p.name, m.pizza_name, m.price, pz.name AS pizzeria_name, pv.visit_date
    FROM menu m
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    JOIN person_visits pv ON pz.id = pv.pizzeria_id
    JOIN person p ON pv.person_id = p.id

    WHERE 
        p.name = 'Kate' AND price >= 800 AND price <= 1000
    ) AS Kate

ORDER BY Kate.pizza_name, Kate.price, Kate.pizzeria_name;