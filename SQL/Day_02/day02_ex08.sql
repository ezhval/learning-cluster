-- Exercise 08: men from Moscow or Samara who ordered pepperoni or mushroom pizza, ordered by name in descending order

SELECT p.name
FROM person p
JOIN person_order po ON p.id = po.person_id
JOIN menu m ON po.menu_id = m.id
WHERE 
    gender = 'male' AND
    address IN ('Moscow', 'Samara') AND
    pizza_name IN ('pepperoni pizza', 'mushroom pizza')
ORDER BY p.name DESC 