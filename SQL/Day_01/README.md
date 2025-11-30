# Day 01 – Sets and JOINs

This folder contains solutions for SQL exercises focused on set operations and basic JOINs.
All tasks use the same demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script `../Materials/pizza_demo_db.sql`.  
The ER diagram is available as `../Materials/er_diagram.png`.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day01_ex00.sql`  
  Return one combined list with identifiers and names from both `menu` (pizza id and name) and `person` (person id and name), with columns `object_id` and `object_name`, ordered by `object_id` and `object_name`.

- `day01_ex01.sql`  
  Modify the previous query to return only `object_name` values, ordered so that all person names go first and pizza names follow, keeping duplicates.

- `day01_ex02.sql`  
  Return unique pizza names from the `menu` table, sorted by `pizza_name` in descending order, without using aggregate constructions.

- `day01_ex03.sql`  
  Find people who both visited a pizzeria and ordered pizza on the same day.  
  Return `action_date` and `person_id` based on data from `person_visits` and `person_order`, ordered by `action_date` (ASC) and `person_id` (DESC).

- `day01_ex04.sql`  
  For 7 January 2022, return the multiset difference of `person_id` values between `person_order` and `person_visits`, keeping duplicates.

- `day01_ex05.sql`  
  Return the full Cartesian product of `person` and `pizzeria` tables – all possible person–pizzeria combinations – ordered by person id and then pizzeria id.

- `day01_ex06.sql`  
  Based on the logic of Exercise 03, return `action_date` and `person_name` instead of identifiers, ordered by `action_date` (ASC) and `person_name` (DESC).

- `day01_ex07.sql`  
  Join `person_order` and `person` to return `order_date` and a formatted `person_information` string like `Anna (age:16)`, ordered by both columns in ascending order.

- `day01_ex08.sql`  
  Rewrite the query from Exercise 07 using `NATURAL JOIN` instead of an explicit join. The result must stay the same.

- `day01_ex09.sql`  
  Write two queries that return pizzerias that have never been visited:  
  one using `IN` and one using `EXISTS`.

- `day01_ex10.sql`  
  Return a list of people who ordered pizza from specific pizzerias, with columns `person_name`, `pizza_name`, `pizzeria_name`, ordered by all three columns in ascending order.