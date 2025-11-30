-- Exercise 06: Phantom Read scenario under REPEATABLE READ – behaviour of sum of ratings after insert in another session

/*
Паттерн Phantom Reads на уровне изоляции Repeatable Read – 
изоляция Repeatable Read предотвращает Non-Repeatable Reads
*/

-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- Session 1
SELECT SUM(rating) AS total_rating FROM pizzeria;

-- Session 2
INSERT INTO pizzeria VALUES (11, 'Kazan Pizza 2', 4.0);
COMMIT;

-- Session 1
SELECT SUM(rating) AS total_rating FROM pizzeria;
COMMIT;
SELECT SUM(rating) AS total_rating FROM pizzeria;

-- Session 2
SELECT SUM(rating) AS total_rating FROM pizzeria;