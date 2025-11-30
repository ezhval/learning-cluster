-- Exercise 05: list of unique person names who have placed any orders

SELECT DISTINCT p.name
FROM person_order po
JOIN person p ON po.person_id = p.id
ORDER BY name;