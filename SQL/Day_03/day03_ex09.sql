-- Exercise 09: insert visits to Dominos by Denis and Irina on 2022-02-24 without hard-coded ids

INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES 
(
    (SELECT MAX(id) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
),

(
    (SELECT MAX(id) + 2 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    '2022-02-24'
);