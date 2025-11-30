-- Exercise 01: based on ex00, show person names instead of ids and return only top 4 people with maximum visits in each pizzeria, sorted by person name

ELECT p.name,
    COUNT(*) AS count_of_visits -- подсчитывает количество посещений каждого пользователя
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
GROUP BY p.name
ORDER BY 
    count_of_visits DESC,
    p.name ASC
LIMIT 4;