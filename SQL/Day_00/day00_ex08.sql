-- Exercise 08: select all columns from person_order for even id values, ordered by id

SELECT *
FROM person_order
WHERE id % 2 = 0
ORDER BY id;