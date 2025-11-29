-- Exercise 12: using generate_series, insert orders of all persons for 'greek pizza' on 2022-02-25 via INSERT ... SELECT

DELETE FROM person_order
WHERE order_date >= '2022-02-25';

INSERT INTO person_order (id, person_id, menu_id, order_date)
SELECT 
    (SELECT COALESCE(MAX(id), 0) FROM person_order) + p.id AS new_id,
    p.id, 
    (SELECT id FROM menu WHERE pizza_name = 'greek pizza'),
    '2022-02-25'
FROM 
    person p
WHERE 
    (
        SELECT id 
        FROM menu 
        WHERE pizza_name = 'greek pizza'
    ) IS NOT NULL;