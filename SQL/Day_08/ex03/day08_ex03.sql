-- Exercise 03: Non-Repeatable Read under READ COMMITTED – same SELECT in session 1 returns different ratings

/*
Аномалия Non-Repeatable Read (неповторяющееся чтение)
Если одна и та же строка данных читается дважды в одной транзакции, 
и между этими двумя чтениями другая транзакция изменяет и фиксирует данные, 
то во втором чтении будут различные результаты
*/

-- Session 1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

-- Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';

-- Session 2
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT;

-- Session 1
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';
COMMIT;

-- Session 2
SELECT rating FROM pizzeria WHERE name = 'Pizza Hut';