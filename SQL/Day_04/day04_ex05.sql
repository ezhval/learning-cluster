-- Exercise 05: create view v_price_with_discount with person name, pizza name, price and integer discount_price = price - price * 0.1

CREATE VIEW v_price_with_discount AS
SELECT p.name AS name, m.pizza_name AS pizza_name, m.price AS price, CAST(m.price * 0.9 AS INTEGER) AS discount_price
FROM person_order po
JOIN person p ON p.id = po.person_id
JOIN menu m ON po.menu_id = m.id
ORDER BY name, pizza_name;