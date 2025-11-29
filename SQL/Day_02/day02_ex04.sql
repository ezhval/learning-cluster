-- Exercise 04: combinations of mushroom and pepperoni pizzas with pizzeria names and prices, ordered by pizza and pizzeria

WITH pizza_name AS (
    SELECT *
    FROM menu
    WHERE pizza_name IN ('pepperoni pizza', 'mushroom pizza')
)

SELECT pn.pizza_name, pz.name AS pizzeria_name, pn.price
FROM pizza_name pn
INNER JOIN pizzeria pz ON pn.pizzeria_id = pz.id
ORDER BY pizza_name, pizzeria_name;