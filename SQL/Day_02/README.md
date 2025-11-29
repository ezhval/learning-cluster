# Day 02 – Outer joins, CTEs and filtering

This folder contains SQL exercises focused on outer joins, gap-finding, CTEs and more complex filtering logic.
All tasks use the same demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script `../pizza_demo_db.sql`.  
The ER diagram is available as `../er_diagram.png`.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day02_ex00.sql`  
  Return a list of pizzerias (name and rating) that have **never been visited** by any person.

- `day02_ex01.sql`  
  Using `generate_series`, find the **missing dates** between `2022-01-01` and `2022-01-10` (inclusive)  
  for visits made by persons with ids `1` or `2`. Return days that were missed by **both**, ordered ascending.

- `day02_ex02.sql`  
  Using a **FULL JOIN**, return all person names and pizzeria names for the period `2022-01-01`–`2022-01-03`:  
  include people who did not visit and pizzerias that were not visited. Replace `NULL` in `person_name` and
  `pizzeria_name` with `'-'` and order by all three columns (`person_name`, `visit_date`, `pizzeria_name`).

- `day02_ex03.sql`  
  Rewrite the solution from Exercise 01 using a **CTE (Common Table Expression)** for the date generator.
  The result (missing dates) should match Exercise 01.

- `day02_ex04.sql`  
  Find all combinations of **mushroom** and **pepperoni** pizzas with their pizzeria names and prices  
  using the `menu` table, and sort the result by `pizza_name` and `pizzeria_name`.

- `day02_ex05.sql`  
  Return the names of all **female** customers older than 25 years, ordered by name.

- `day02_ex06.sql`  
  Find all pizza names (and corresponding pizzeria names) that were ordered by **Denis** or **Anna**,  
  and sort the result by `pizza_name` and `pizzeria_name`.

- `day02_ex07.sql`  
  Find the name of the pizzeria that **Dmitriy** visited on `2022-01-08` where he could eat pizza  
  for **less than 800** roubles.

- `day02_ex08.sql`  
  Return the names of all **men** from **Moscow** or **Samara** who ordered **pepperoni** or **mushroom** pizza  
  (or both). Sort the result by `name` in **descending** order.

- `day02_ex09.sql`  
  Find the names of all **women** who ordered **both** pepperoni and cheese pizzas (any date, any pizzeria).  
  Order the result by `name`.

- `day02_ex10.sql`  
  Find pairs of people who live at the **same address**. Return `person_name1`, `person_name2` and
  `common_address`, ordered by `person_name1`, then `person_name2`, then `common_address`.