-- Exercise 02: FULL JOIN of persons and pizzerias for 2022-01-01..03, including non-visited, replacing NULLs with '-'

SELECT 
    COALESCE(p.name, '-') AS person_name, 
    pv.visit_date,
    COALESCE(piz.name, '-') AS pizzeria_name
FROM 
    person p
FULL OUTER JOIN 
    (SELECT *
     FROM person_visits
     WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03'
    ) pv ON pv.person_id = p.id
FULL OUTER JOIN 
    pizzeria piz ON pv.pizzeria_id = piz.id
ORDER BY 
    person_name, visit_date, pizzeria_name;

