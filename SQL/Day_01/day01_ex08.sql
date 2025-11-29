-- Exercise 08: same result as Exercise 07 but implemented using NATURAL JOIN

SELECT order_date,
    CONCAT(p.name, ' (age:', p.age, ')') AS person_information
FROM person_order
NATURAL JOIN 
    (SELECT person.id AS person_id, name, age FROM person) AS p

ORDER BY person_order.order_date ASC, person_information ASC;