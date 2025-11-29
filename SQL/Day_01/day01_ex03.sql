-- Exercise 03: people who both visited a pizzeria and ordered pizza on the same day (action_date, person_id)

SELECT 
    visit_date AS action_date,
    person_id
FROM person_visits

INTERSECT ALL

SELECT 
    order_date AS action_date,
    person_id
FROM person_order

ORDER BY action_date ASC, person_id DESC;