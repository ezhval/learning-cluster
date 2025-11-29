-- Exercise 01: select person names from v_persons_female and v_persons_male in one list, ordered by name

SELECT name
FROM v_persons_female
UNION
SELECT name
FROM v_persons_male
ORDER BY name;