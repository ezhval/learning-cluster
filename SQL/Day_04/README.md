# Day 04 – Views and materialized views

This folder contains SQL exercises focused on virtual views, materialized views and working with derived data sets.
All tasks use the same demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script `../pizza_demo_db.sql`.  
The ER diagram is available as `../er_diagram.png`.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day04_ex00.sql`  
  Create two database views based on the `person` table, filtered by gender:
  `v_persons_female` and `v_persons_male`.  
  The views should expose the same columns as the original table.

- `day04_ex01.sql`  
  Using the views `v_persons_female` and `v_persons_male`, return a single list of person names
  from both views, ordered by `name` in ascending order.

- `day04_ex02.sql`  
  Create a database view `v_generated_dates` that “stores” generated dates from
  `2022-01-01` to `2022-01-31` (inclusive) as `DATE` values in a column `generated_date`,
  ordered by `generated_date`.

- `day04_ex03.sql`  
  Using the view `v_generated_dates`, return the days in January 2022 when **no visits**
  were recorded in `person_visits`.  
  The result should contain a single column `missing_date`, sorted in ascending order.

- `day04_ex04.sql`  
  Implement the set expression `(R - S) ∪ (S - R)` where:
  - `R` is `person_visits` filtered by `visit_date = '2022-01-02'`,
  - `S` is `person_visits` filtered by `visit_date = '2022-01-06'`.  
  Perform set operations on the `person_id` column and expose it as the only column in the result.  
  Create a view `v_symmetric_union` that returns these `person_id` values, ordered ascending.

- `day04_ex05.sql`  
  Create a view `v_price_with_discount` that returns:
  - person name,
  - pizza name,
  - original `price`,
  - calculated `discount_price = price - price * 0.1`.  
  Cast `discount_price` to `INTEGER` and sort the view by person name and pizza name.

- `day04_ex06.sql`  
  Create a materialized view `mv_dmitriy_visits_and_eats` (with data preloaded) based on the query
  that returns the names of pizzerias which **Dmitriy** visited on `2022-01-08` and where he could
  eat pizzas for **less than 800** roubles (query logic reused from Day 02, Exercise 07).

- `day04_ex07.sql`  
  Add a new visit for **Dmitriy** that satisfies the same condition as in `mv_dmitriy_visits_and_eats`
  but refers to a different pizzeria.  
  Then refresh the materialized view so that it reflects the new state.  
  Avoid hard-coded identifiers for primary keys, person or pizzeria.

- `day04_ex08.sql`  
  Drop the views and materialized view created in the previous exercises
  (virtual views and `mv_dmitriy_visits_and_eats`) to clean up the database.