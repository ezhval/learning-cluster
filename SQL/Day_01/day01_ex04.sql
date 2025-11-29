-- Exercise 04: multiset difference of person_id between orders and visits on 2022-01-07, keeping duplicates

SELECT person_id 
FROM person_order
WHERE order_date = '2022-01-07'

EXCEPT ALL

SELECT person_id 
FROM person_visits
WHERE visit_date = '2022-01-07';