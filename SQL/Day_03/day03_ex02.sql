-- Exercise 02: pizzas (name, price, pizzeria) that nobody ordered, based on unused menu ids

ELECT m.pizza_name, m.price, pz.name AS pizza_name
FROM menu m
JOIN pizzeria pz ON pz.id = m.pizzeria_id

WHERE m.id NOT IN 
    (
    SELECT menu_id
    FROM person_order
    )
ORDER BY m.pizza_name, m.price;