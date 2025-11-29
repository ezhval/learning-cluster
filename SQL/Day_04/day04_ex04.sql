-- Exercise 04: create view v_symmetric_union with (R - S) ∪ (S - R) on person_id for visits on 2022-01-02 and 2022-01-06

CREATE VIEW v_symmetric_union AS

(
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-02'

EXCEPT

SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-06'
)

UNION

(
SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-06'

EXCEPT

SELECT person_id
FROM person_visits
WHERE visit_date = '2022-01-02'
)
ORDER BY person_id