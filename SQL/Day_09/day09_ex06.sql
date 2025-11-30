-- Exercise 06: plpgsql function fnc_person_visits_and_eats_on_date(pperson, pprice, pdate) showing suitable pizzerias

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
    pperson VARCHAR DEFAULT 'Dmitriy',
    pprice NUMERIC DEFAULT 500,
    pdate DATE DEFAULT '2022-01-08'
)
RETURNS TABLE (
    name VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT pz.name
    FROM person AS p
    JOIN person_visits AS pv ON p.id = pv.person_id
    JOIN menu AS m ON pv.pizzeria_id = m.pizzeria_id
    JOIN pizzeria AS pz ON pv.pizzeria_id = pz.id
    WHERE p.name = pperson
      AND pv.visit_date = pdate
      AND m.price < pprice;
END;
$$ 
LANGUAGE plpgsql;
