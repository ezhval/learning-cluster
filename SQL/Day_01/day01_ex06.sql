-- Exercise 06: like Exercise 03 but returning person_name instead of person_id, ordered by date and name

SELECT 
    visit_date AS action_date,
    (SELECT name FROM person
     WHERE person.id = person_visits.person_id) AS person_name
FROM person_visits

INTERSECT ALL

SELECT 
    order_date AS action_date,
    (SELECT name FROM person
     WHERE person.id = person_order.person_id) AS person_name
FROM person_order

ORDER BY action_date ASC, person_name DESC;