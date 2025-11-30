-- Exercise 02: Lost Update scenario under REPEATABLE READ and how the anomaly is prevented

/*
В режиме REPEATABLE READ каждая сессия видит снимок данных на момент начала своей транзакции.
Этот уровень блокирует строки от изменений другими транзакциями до завершения текущей транзакции
*/

-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 1
UPDATE pizzeria SET rating = 4.0 WHERE name = 'Pizza Hut';

-- Session 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

-- Session 1
COMMIT;

-- Session 2
COMMIT;

-- Session 1
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';