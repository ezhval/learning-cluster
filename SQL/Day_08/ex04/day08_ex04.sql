-- Exercise 04: Non-Repeatable Read pattern under SERIALIZABLE and how it is handled (serialization / blocking)

/*
SERIALIZABLE — это самый строгий уровень изоляции транзакций. 
Он гарантирует, что выполнение параллельных транзакций приведёт к такому же результату, 
как если бы они выполнялись последовательно.

Данные, прочитанные в одной транзакции, не изменяются другими транзакциями до её завершения.
*/

-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';