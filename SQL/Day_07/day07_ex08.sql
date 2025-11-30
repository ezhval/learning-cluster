-- Exercise 08: for each person’s city, show address, pizzeria name and total order count, sorted by address and name

SELECT 
    p.address,
    pz.name,
    COUNT(*) AS count_of_orders
FROM person_order po
JOIN person p ON po.person_id = p.id       
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
GROUP BY p.address, pz.name
ORDER BY p.address, pz.name;