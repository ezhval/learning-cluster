-- Exercise 05: full Cartesian product of person and pizzeria (all person–pizzeria combinations)

SELECT *
FROM 
    person
CROSS JOIN 
    pizzeria
ORDER BY person.id, pizzeria.id;