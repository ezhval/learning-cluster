-- Exercise 06: create materialized view mv_dmitriy_visits_and_eats for Dmitriy’s visits on 2022-01-08 with pizzas cheaper than 800

CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS
SELECT pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
JOIN person_visits pv ON pz.id = pv.pizzeria_id
JOIN person p ON pv.person_id = p.id
WHERE
    p.name = 'Dmitriy' AND
    pv.visit_date = '2022-01-08' AND
    m.price < 800
WITH DATA;