-- Exercise 03: distinct person ids with visits between 2022-01-06 and 2022-01-09 or to pizzeria id = 2, ordered desc

SELECT DISTINCT person_id
FROM person_visits
WHERE (visit_date BETWEEN '2022-01-06' AND '2022-01-09') OR pizzeria_id = 2
ORDER BY person_id DESC;