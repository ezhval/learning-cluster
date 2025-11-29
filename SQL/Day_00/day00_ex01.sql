-- Exercise 01: select names and ages of women from 'Kazan', ordered by name

SELECT name, age
FROM person
WHERE gender = 'female' AND address = 'Kazan'
ORDER BY name;