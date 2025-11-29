-- Exercise 07: insert a new Dmitriy visit satisfying mv_dmitriy_visits_and_eats condition and refresh the materialized view (no hard-coded ids)

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES ((SELECT MAX(id) + 1 FROM person_visits), 9, 5, '2022-01-08');

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;