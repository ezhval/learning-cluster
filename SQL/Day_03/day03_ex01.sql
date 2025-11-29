-- Exercise 01: menu item ids that have never been ordered by anyone

SELECT m.id AS menu_id
FROM menu m
WHERE m.id NOT IN
    (
    SELECT menu_id
    FROM person_order
    )
ORDER BY menu_id;