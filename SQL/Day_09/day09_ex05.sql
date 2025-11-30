-- Exercise 05: generic SQL function fnc_persons(pgender default 'female') returning persons filtered by gender

DROP FUNCTION IF EXISTS fnc_persons_female;
DROP FUNCTION IF EXISTS fnc_persons_male;

CREATE OR REPLACE FUNCTION fnc_persons(pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (
    id person.id%TYPE,
    name person.name%TYPE,
    age person.age%TYPE,
    gender person.gender%TYPE,
    address person.address%TYPE
) AS $$
    SELECT id, name, age, gender, address
    FROM person
    WHERE gender = pgender;
$$ 
LANGUAGE SQL;