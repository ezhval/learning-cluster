-- Exercise 00: simple transaction demo – Pizza Hut rating visible in session 1 only after COMMIT for session 2

-- Session #1
BEGIN;
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
SELECT * 
FROM pizzeria 
WHERE name = 'Pizza Hut';

-- Session #2
SELECT * 
FROM pizzeria 
WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;

-- Session #2
SELECT * 
FROM pizzeria 
WHERE name = 'Pizza Hut';