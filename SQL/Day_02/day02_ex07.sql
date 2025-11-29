-- Exercise 07: pizzeria visited by Dmitriy on 2022-01-08 where he could eat pizza for less than 800

SELECT pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_visits pv ON pz.id = pv.pizzeria_id
JOIN person p ON pv.person_id = p.id

WHERE
    p.name = 'Dmitriy' AND
    pv.visit_date = '2022-01-08' AND
    m.price < 800;