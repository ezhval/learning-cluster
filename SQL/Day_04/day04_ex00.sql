-- Exercise 00: create views v_persons_female and v_persons_male filtered by gender with the same columns as person

CREATE VIEW v_persons_female AS
SELECT *
FROM person
WHERE gender = 'female';

CREATE VIEW v_persons_male AS
SELECT *
FROM person
WHERE gender = 'male';