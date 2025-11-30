-- Exercise 06: create index idx_1 that speeds up the window-query on pizza_name/rating and prove the speedup with EXPLAIN ANALYZE

DROP INDEX IF EXISTS idx_1;

CREATE INDEX idx_1 ON pizzeria (rating); -- столбец rating участвует в сортировке, оптимизируем

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (PARTITION BY rating ORDER BY rating ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS k
FROM  menu m
INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
ORDER BY 1,2;