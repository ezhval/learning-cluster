-- Exercise 05: Phantom Read under READ COMMITTED – sum of pizzeria ratings changes after insert in another session

/*
Паттерн Phantom Reads на уровне изоляции READ COMMITTED – 
результат запроса изменяется из-за появления новых строк, добавленных другой транзакцией
*/

-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 1
SELECT SUM(rating) AS total_rating FROM pizzeria;

-- Session 2
INSERT INTO pizzeria VALUES (10, 'Kazan Pizza', 5.0);
COMMIT;

-- Session 1
SELECT SUM(rating) AS total_rating FROM pizzeria;
COMMIT;

SELECT SUM(rating) AS total_rating FROM pizzeria;

-- Session 2
SELECT SUM(rating) AS total_rating FROM pizzeria;