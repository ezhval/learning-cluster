-- Exercise 03: create multicolumn index idx_person_order_multi for person_id = 8 and menu_id = 19 with Index Only Scan

CREATE INDEX idx_person_order_multi ON person_order (person_id, menu_id, order_date); -- создаем индекс, который включает все колонки, которые участвую в запросе

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT person_id, menu_id, order_date
FROM person_order
WHERE person_id = 8 AND menu_id = 19;