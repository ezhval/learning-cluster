-- Exercise 01: Lost Update anomaly under READ COMMITTED with two sessions updating Pizza Hut rating

/*
READ COMMITTED — это уровень изоляции транзакций в базах данных, который гарантирует, 
что только зафиксированные данные (committed) могут быть прочитаны в рамках транзакции.
*/

--Session 1
SHOW TRANSACTION ISOLATION LEVEL;

--Session 2
SHOW TRANSACTION ISOLATION LEVEL;

--Session 1
BEGIN;

--Session 2
BEGIN;

--Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--Session 1
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

--Session 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

--Session 1
COMMIT;

--Session 2
COMMIT;

--Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';