-- Exercise 05: create partially unique index idx_person_order_order_date on (person_id, menu_id) where order_date = '2022-01-01'

CREATE UNIQUE INDEX idx_person_order_order_date ON person_order (person_id, menu_id)
WHERE order_date = '2022-01-01';

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT menu_id, person_id
FROM person_order
WHERE person_id = 1 AND order_date = '2022-01-01';