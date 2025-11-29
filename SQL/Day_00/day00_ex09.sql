-- Exercise 09: names of people and pizzerias for visits between 2022-01-07 and 2022-01-09 using subquery in FROM and subqueries in SELECT

SELECT
    (SELECT name FROM person WHERE person.id = pv.person_id) AS person_name,
    (SELECT name FROM pizzeria WHERE pizzeria.id = pv.pizzeria_id) AS pizzeria_name
FROM
    (SELECT * FROM person_visits WHERE visit_date = '2022-01-07' OR visit_date = '2022-01-08' OR visit_date = '2022-01-09') AS pv
ORDER BY person_name ASC, pizzeria_name DESC;