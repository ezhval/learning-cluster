# Day 03 – DML and data changes

This folder contains SQL exercises focused on data modification (INSERT, UPDATE, DELETE), set operations and comparative analysis of visits and orders.
All tasks use the same demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script `../pizza_demo_db.sql`.  
The ER diagram is available as `../er_diagram.png`.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day03_ex00.sql`  
  Return pizza names, prices, pizzeria names and visit dates for **Kate** where the price is between 800 and 1000 roubles.  
  Sort by `pizza_name`, `price` and `pizzeria_name`.

- `day03_ex01.sql`  
  Find menu identifiers that **no one has ever ordered**.  
  Return `menu_id`, sorted by identifier.

- `day03_ex02.sql`  
  Using the result of Exercise 01, return the names and prices of pizzas (with pizzeria names) that nobody ordered.  
  Sort by `pizza_name` and `price`.

- `day03_ex03.sql`  
  Find pizzerias that have been visited **more often by women or more often by men**.  
  Use set operators that keep duplicates (`UNION ALL`, `EXCEPT ALL`, `INTERSECT ALL`) and sort by `pizzeria_name`.

- `day03_ex04.sql`  
  Find the union of pizzerias that have orders **only from women** with pizzerias that have orders **only from men**.  
  Return unique pizzeria names and sort by `pizzeria_name`.

- `day03_ex05.sql`  
  Return the names of pizzerias that **Andrey visited** but from which he **did not make any orders**.  
  Sort by `pizzeria_name`.

- `day03_ex06.sql`  
  Find pizza names that have the **same price** but come from **different pizzerias**.  
  Return `pizza_name`, `pizzeria_name_1`, `pizzeria_name_2`, `price`, sorted by `pizza_name`.

- `day03_ex07.sql`  
  Insert a new pizza `"greek pizza"` with `id = 19` and price `800` roubles into the `"Dominos"` pizzeria (`pizzeria_id = 2`).

- `day03_ex08.sql`  
  Insert a new pizza `"sicilian pizza"` with an id computed as **max(id) + 1** and price `900` roubles into `"Dominos"`.  
  Use a subquery to get the pizzeria id and do not hard-code primary key or pizzeria identifiers.

- `day03_ex09.sql`  
  Insert new visits to `"Dominos"` by **Denis** and **Irina** on `2022-02-24`.  
  Do not use hard-coded primary key or pizzeria identifiers.

- `day03_ex10.sql`  
  Insert new orders from **Denis** and **Irina** on `2022-02-24` for the new `"sicilian pizza"` menu item.  
  Avoid hard-coded identifiers for primary keys and menu entries.

- `day03_ex11.sql`  
  Update the price of `"greek pizza"` by reducing it by 10% of the current value (apply a **–10% discount**).

- `day03_ex12.sql`  
  Using `generate_series` and the `INSERT INTO ... SELECT ...` pattern, register new orders of **all persons** for `"greek pizza"` on `2022-02-25`.  
  Do not use hard-coded primary keys or menu identifiers, window functions or multiple atomic INSERT statements.

- `day03_ex13.sql`  
  Write two DML statements:  
  1. Delete all new `"greek pizza"` orders created in Exercise 12 based on the order date.  
  2. Delete `"greek pizza"` from the menu.