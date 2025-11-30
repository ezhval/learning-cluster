-- Exercise 04: create unique index idx_menu_unique on (pizzeria_id, pizza_name) and show it is used and enforces uniqueness

CREATE UNIQUE INDEX idx_menu_unique ON menu (pizzeria_id, pizza_name); -- каждая комбинация pizzeria_id и pizza_name будет уникальной

SET enable_seqscan = off;
EXPLAIN ANALYZE
SELECT *
FROM menu
WHERE pizzeria_id = 1 AND pizza_name = 'Margherita';
