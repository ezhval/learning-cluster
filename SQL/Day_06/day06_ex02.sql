-- Exercise 02: show orders with person name, pizza_name, price, discount_price and pizzeria_name, ordered by person and pizza

SELECT 
    p.name AS person_name, 
    m.pizza_name AS pizza_name, 
    m.price AS price,
    ROUND(m.price * (1 - pd.discount / 100), 2) AS discount_price, 
    pz.name AS pizzeria_name
FROM person_order po
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person p ON po.person_id = p.id
JOIN person_discounts pd ON p.id = pd.person_id AND pz.id = pd.pizzeria_id
ORDER BY person_name, pizza_name;