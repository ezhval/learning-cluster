# Day 05 – Indexes and performance

This folder contains SQL exercises focused on B-tree indexes, functional and multicolumn indexes,
partial uniqueness and basic performance tuning with `EXPLAIN ANALYZE`.

All tasks use the same demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script `../Materials/pizza_demo_db.sql`.  
The ER diagram is available as `../Materials/er_diagram.png`.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day05_ex00.sql`  
  Create a simple B-tree index for each foreign key in the database.  
  The index name must follow the pattern `idx_{table_name}_{column_name}`, e.g.  
  `idx_menu_pizzeria_id` for the `pizzeria_id` column in the `menu` table.

- `day05_ex01.sql`  
  Write a query that returns pizzas and their pizzeria names, and show (with `EXPLAIN ANALYZE`)
  that your indexes from Exercise 00 are actually used for this query.  
  If needed, adjust planner settings (e.g. disable sequential scan) to demonstrate index usage.

- `day05_ex02.sql`  
  Create a functional B-tree index `idx_person_name` on the `person.name` column, storing names in upper case.  
  Provide an SQL query together with `EXPLAIN ANALYZE` output that proves this index is being used.

- `day05_ex03.sql`  
  Create a multicolumn B-tree index `idx_person_order_multi` for the query:

  ```sql
  SELECT person_id, menu_id, order_date
  FROM person_order
  WHERE person_id = 8 AND menu_id = 19;
  ```
  The execution plan (via `EXPLAIN ANALYZE`) should use Index Only Scan on `idx_person_order_multi`.
  Provide an SQL example and proof that the index is used.

- `day05_ex04.sql`
  Create a unique B-tree index `idx_menu_unique` on the `menu` table over `(pizzeria_id, pizza_name)`.
  Provide an SQL example with `EXPLAIN ANALYZE` showing that this index is used and that it enforces uniqueness.

- `day05_ex05.sql`
  Create a partially unique B-tree index `idx_person_order_order_date` on `person_order` over `(person_id, menu_id)` with partial uniqueness for rows where `order_date = '2022-01-01'`.
  Show (via `EXPLAIN ANALYZE`) that the index is used as an index-only scan for relevant queries.

- `day05_ex06.sql`
  Consider the following query:
  ```sql
  SELECT
    m.pizza_name AS pizza_name,
    max(rating) OVER (
        PARTITION BY rating
        ORDER BY rating
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS k
  FROM menu m
  INNER JOIN pizzeria pz ON m.pizzeria_id = pz.id
  ORDER BY 1, 2;
  ```
  Create a new B-tree index `idx_1` that improves the Execution Time of this query. Demonstrate the performance gain using `EXPLAIN ANALYZE` (before/after creating `idx_1`), and drop/recreate the index as needed during experiments.