-- Exercise 00: combined list of menu items and persons as object_id / object_name, ordered by both

SELECT 
    id AS object_id,
    pizza_name AS object_name
FROM menu

UNION

SELECT
    id AS object_id,
    name as object_name
FROM person

ORDER BY
    object_id, object_name;