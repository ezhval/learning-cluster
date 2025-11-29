-- Exercise 08: insert 'sicilian pizza' with id = max(id) + 1 and price 900 into Dominos without hard-coded ids

INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (
    (SELECT MAX(id) + 1 FROM menu),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    'sicilian pizza',
    900
);