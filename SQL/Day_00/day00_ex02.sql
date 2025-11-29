-- Exercise 02: pizzerias with rating between 3.5 and 5 (two queries)

SELECT name, rating
FROM pizzeria
WHERE rating >= 3.5 AND rating <= 5
ORDER BY rating;

SELECT name, rating
FROM pizzeria
WHERE rating BETWEEN 3.5 AND 5
ORDER BY rating;