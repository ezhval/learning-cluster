-- Exercise 00: pizzerias that have never been visited by any person

SELECT 
    p.name, p.rating
FROM 
    pizzeria p
LEFT JOIN 
    person_visits pv ON p.id = pv.pizzeria_id
WHERE 
    pv.pizzeria_id IS NULL;