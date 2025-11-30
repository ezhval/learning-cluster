# Day 06 – Personal discounts and data quality

This folder contains SQL exercises focused on extending the data model with personal discounts,
maintaining data consistency and automating primary key generation.

All tasks use the same demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script `../pizza_demo_db.sql`.  
The ER diagram is available as `../er_diagram.png`.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day06_ex00.sql`  
  Create a new table `person_discounts` with:
  - `id` as primary key (same datatype pattern as other `id` columns),
  - `person_id` and `pizzeria_id` as foreign keys to `person` and `pizzeria`
    with explicit constraint names `fk_person_discounts_person_id` and `fk_person_discounts_pizzeria_id`,
  - `discount` column to store a discount percentage as `numeric`.

- `day06_ex01.sql`  
  Fill `person_discounts` using a single `INSERT INTO ... SELECT ...` statement based on `person_order`:
  - aggregate by `(person_id, pizzeria_id)`,
  - set `discount` according to:
    - 1 order → `10.5`,
    - 2 orders → `22`,
    - more than 2 orders → `30`,
  - generate `id` using `ROW_NUMBER() OVER () AS id`.

- `day06_ex02.sql`  
  Return a list of orders with:
  - customer name,
  - `pizza_name`,
  - original `price`,
  - `discount_price` with personal discount applied,
  - `pizzeria_name`.  
  Sort the result by person name and pizza name.

- `day06_ex03.sql`  
  Create a multicolumn unique index `idx_person_discounts_unique` on `person_discounts`
  to prevent duplicate `(person_id, pizzeria_id)` pairs.  
  Provide an example query and `EXPLAIN ANALYZE` output that show the index is used
  (e.g. `Index Scan using idx_person_discounts_unique on person_discounts`).

- `day06_ex04.sql`  
  Strengthen data consistency for `person_discounts` by adding constraints:
  - `person_id` is NOT NULL (`ch_nn_person_id`),
  - `pizzeria_id` is NOT NULL (`ch_nn_pizzeria_id`),
  - `discount` is NOT NULL (`ch_nn_discount`),
  - `discount` has default value `0`,
  - `discount` must be in the range `[0, 100]` (`ch_range_discount`).

- `day06_ex05.sql`  
  Add comments for the `person_discounts` table and all its columns, describing the business purpose
  of the table and each attribute (in English or Russian), using `COMMENT ON TABLE` / `COMMENT ON COLUMN`.

- `day06_ex06.sql`  
  Create a sequence `seq_person_discounts` starting from 1 and set `id` in `person_discounts`
  to use `nextval('seq_person_discounts')` by default.  
  Initialise the sequence so that the next value equals  
  `number_of_rows_in_person_discounts + 1` (without hard-coding the row count),
  to avoid primary key violations when inserting new rows.