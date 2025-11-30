# Day 07 – Aggregations and analytical queries

This folder contains SQL exercises focused on grouped aggregation, basic OLAP-style queries
and comparing metrics across restaurants and customers.

All tasks use the same demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script `../Materials/pizza_demo_db.sql`.  
The ER diagram is available as `../Materials/er_diagram.png`.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day07_ex00.sql`  
  Return person identifiers and the corresponding number of visits to any pizzerias.  
  Sort the result by `count_of_visits` in **descending** order and by `person_id` in **ascending** order.

- `day07_ex01.sql`  
  Modify the query from Exercise 00 to return **person names** instead of identifiers and  
  show only the **top 4 people with the maximum number of visits in each pizzeria**,  
  sorted by person name.

- `day07_ex02.sql`  
  Show the top **3 pizzerias** by visits and by orders in a single list.  
  Include an `action_type` column with values `'order'` or `'visit'` depending on the source table.  
  Sort the result by `action_type` (ASC) and then by `count` (DESC).

- `day07_ex03.sql`  
  Group pizzerias by number of visits and by number of orders and join the results by pizzeria name.  
  For each pizzeria, compute `total_count` as the sum of visits and orders  
  (taking into account that some pizzerias may appear only in one of the sets).  
  Sort by `total_count` in **descending** order and by `name` in **ascending** order.

- `day07_ex04.sql`  
  Return person names and their number of visits to any pizzerias **only for those**  
  who have visited more than 3 times (`count_of_visits > 3`), using a group-level condition.

- `day07_ex05.sql`  
  Return a list of **unique person names** who have placed orders at any pizzerias.  
  Sort the result by person name.

- `day07_ex06.sql`  
  For each pizzeria, return:
  - number of orders (`count_of_orders`),
  - average pizza price (`average_price`),
  - maximum price (`max_price`),
  - minimum price (`min_price`).  
  Round the average price to 2 decimal places and sort the result by pizzeria name.

- `day07_ex07.sql`  
  Return a single row with the **global average rating** for all pizzerias.  
  Name the output column `global_rating` and round the value to 4 decimal places.

- `day07_ex08.sql`  
  Assuming that a person orders pizza only in pizzerias located in their city,  
  return the address, pizzeria name and the total number of that person’s orders.  
  Sort the result by `address` and then by pizzeria `name`.

- `day07_ex09.sql`  
  For each address, return:
  - `formula` = `max_age - (min_age / max_age)`,
  - `average` = average age for this address,
  - `comparison` = `true` if `formula > average`, otherwise `false`.  
  Sort the result by `address`.