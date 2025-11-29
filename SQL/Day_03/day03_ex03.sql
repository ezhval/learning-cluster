-- Exercise 03: pizzerias visited more often by women or more often by men using ALL set operators

WITH women_visits AS (
    SELECT
        pizzeria_id,
        COUNT(*) AS visit_count
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE
        p.gender = 'female'
    GROUP BY
        pizzeria_id
),
men_visits AS (
    SELECT
        pizzeria_id,
        COUNT(*) AS visit_count
    FROM
        person_visits pv
    JOIN person p ON pv.person_id = p.id
    WHERE
        gender = 'male'
    GROUP BY
        pizzeria_id
),
join_all AS ( -- Объединим полученные данные двух выборок с таблицей пиццерий
    SELECT
        p.id AS pizzeria_id,
        p.name AS pizzeria_name,
        COALESCE(w.visit_count, 0) AS women_visits, -- если какую-то из пиццерий женщины/мужчины не посещали, то left join проставит null, а мы его заменяем на "0"
        COALESCE(m.visit_count, 0) AS men_visits
    FROM
        pizzeria p
    LEFT JOIN
        women_visits w
    ON
        p.id = w.pizzeria_id
    LEFT JOIN
        men_visits m
    ON
        p.id = m.pizzeria_id
),
result AS (
    SELECT
        pizzeria_name
    FROM
        join_all
    WHERE
        women_visits > men_visits
    
    UNION ALL
    
    SELECT
        pizzeria_name
    FROM
        join_all
    WHERE
        men_visits > women_visits
)

SELECT DISTINCT -- забираем уникальное имя, если у одной пиццерии было одинаковое кол-во посещений мужчинами и женщинами, что мы учли в UNION ALL
    pizzeria_name
FROM
    result
ORDER BY
    pizzeria_name;