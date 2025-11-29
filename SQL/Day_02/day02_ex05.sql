-- Exercise 05: names of female customers older than 25 years, ordered by name

SELECT name
FROM person
WHERE gender = 'female' AND age > 25
ORDER BY name;