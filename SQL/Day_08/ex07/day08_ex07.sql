-- Exercise 07: reproduce a deadlock on pizzeria table using two sessions with conflicting updates

/*
Взаимоблокировка (Deadlock) – cитуация выглядит как "перекрёстный замок" между параллельными сессиями.
PostgreSQL обнаружит Deadlock и отменит одну из транзакций, чтобы разблокировать систему
*/

-- Session 1
BEGIN;

-- Session 2
BEGIN;

-- Session 1
UPDATE pizzeria SET rating = 2 WHERE id = 1;

-- Session 2
UPDATE pizzeria SET rating = 2.5 WHERE id = 2;

-- Session 1
UPDATE pizzeria SET rating = 2.4 WHERE id = 2;

-- Session 2
UPDATE pizzeria SET rating = 3.0 WHERE id = 1;

-- Session 1
COMMIT;

-- Session 2
COMMIT;