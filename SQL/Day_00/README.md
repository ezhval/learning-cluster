# Day 00 – Basic SQL practice

This folder contains introductory SQL exercises based on a small demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script in the parent folder (`../pizza_demo_db.sql`).  
The ER diagram is available as `../er_diagram.png`.

## Tables (short overview)

- `person` – people who love pizza (id, name, age, gender, address)
- `pizzeria` – available pizzerias (id, name, rating)
- `menu` – pizzas and prices for each pizzeria (id, pizzeria_id, pizza_name, price)
- `person_visits` – visits of pizzerias (id, person_id, pizzeria_id, visit_date)
- `person_order` – orders made by people (id, person_id, menu_id, order_date)

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day00_ex00.sql`<br>
    Select names and ages of all people living in the city `'Kazan'`.

- `day00_ex01.sql`<br>
    Select names and ages of all women from `'Kazan'`, ordered by name.

- `day00_ex02.sql`<br>
    Write two queries that return the names and ratings of pizzerias with a rating between **3.5** and **5.0** (inclusive), ordered by rating: one using comparison operators (`>=`, `<=`) and one using `BETWEEN`.

- `day00_ex03.sql`<br>
    Select distinct person identifiers who either visited any pizzeria between `2022-01-06` and `2022-01-09` (inclusive) or visited the pizzeria with id `2`. Sort the result by person id in descending order.

- `day00_ex04.sql`<br>
    Build a formatted string `person_information` that concatenates a person’s name, age, gender and address in the format  `Anna (age:16,gender:'female',address:'Moscow')` and sort the result by this column.

- `day00_ex05.sql`<br>
    Return the names of people who ordered menu items with ids `13`, `14` and `18` on `2022-01-07`, using a subquery in the `SELECT` clause to resolve the person name. Do not use `IN` or `JOIN`.

- `day00_ex06.sql`<br>
    Extend the previous exercise: return the person name and a boolean column `check_name` that is `true` when the name is `'Denis'` and `false` otherwise, still without `IN` or `JOIN`.

- `day00_ex07.sql`<br>
    Select person id, name and a calculated column `interval_info` with values:  
    - `'interval #1'` for ages between 10 and 20 (inclusive),  
    - `'interval #2'` for ages greater than 20 and less than 24,  
    - `'interval #3'` for all other ages.  
    Sort by `interval_info`.

- `day00_ex08.sql`<br>
    Select all columns from `person_order` for rows where the id is an even number, ordered by id.

- `day00_ex09.sql`<br>
    Using a subquery in the `FROM` clause to pre-filter `person_visits` by dates `2022-01-07` to `2022-01-09`, return person names and pizzeria names for these visits.
    Resolve names via subqueries in the `SELECT` clause and sort by person name (ASC) and pizzeria name (DESC).