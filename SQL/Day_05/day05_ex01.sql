-- Exercise 01: query pizzas and pizzeria names and show via EXPLAIN ANALYZE that FK indexes from ex00 are used

SET enable_seqscan = off; -- отключаем использование последовательного сканирования (seq scan) в пользу индексов

EXPLAIN ANALYZE
SELECT 
    m.pizza_name,
    p.name AS pizzeria_name
FROM menu m
JOIN pizzeria p ON m.pizzeria_id = p.id;