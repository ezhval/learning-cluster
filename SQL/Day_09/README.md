# Day 09 – Triggers and functions

This folder contains SQL exercises focused on audit triggers, SQL and PL/pgSQL functions,
and working with functions as reusable building blocks in the database.

All tasks use the same demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script `../pizza_demo_db.sql`.  
The ER diagram is available as `../er_diagram.png`.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day09_ex00.sql`  
  Create an audit table `person_audit` with the same business columns as `person` plus:
  - `created` – timestamp with time zone, default current timestamp, NOT NULL,
  - `type_event` – `char(1)` with values `I`, `U`, `D`, default `'I'`, NOT NULL,  
    with check constraint `ch_type_event`,
  - `row_id` – copy of `person.id`, NOT NULL.  
  Create a trigger function `fnc_trg_person_insert_audit` and trigger `trg_person_insert_audit`
  (`AFTER INSERT ON person FOR EACH ROW`) that writes new rows into `person_audit`.  
  Test it with:
  `INSERT INTO person(id, name, age, gender, address) VALUES (10, 'Damir', 22, 'male', 'Irkutsk');`.

- `day09_ex01.sql`  
  Extend the audit pattern with updates on `person`:  
  create trigger function `fnc_trg_person_update_audit` and trigger `trg_person_update_audit`
  that writes the **OLD** state of updated rows into `person_audit` for any `UPDATE` on `person`.  
  Test with:
  `UPDATE person SET name = 'Bulat' WHERE id = 10;`  
  `UPDATE person SET name = 'Damir' WHERE id = 10;`.

- `day09_ex02.sql`  
  Add auditing for deletes from `person`:  
  create trigger function `fnc_trg_person_delete_audit` and trigger `trg_person_delete_audit`
  that writes the **OLD** state of deleted rows into `person_audit` for any `DELETE` on `person`.  
  Test with:
  `DELETE FROM person WHERE id = 10;`.

- `day09_ex03.sql`  
  Refactor the audit to a **single generic trigger**:  
  - drop the three old triggers (`insert`, `update`, `delete`) and their functions,  
  - truncate (or delete all rows from) `person_audit`,  
  - create one trigger function `fnc_trg_person_audit` that handles all three events
    (`INSERT`, `UPDATE`, `DELETE`) with explicit `IF / ELSIF / ELSE` blocks per event type,  
  - create a single trigger `trg_person_audit` on `person` that fires for all three DML operations.  
  Reapply the full DML set:
  `INSERT`, `UPDATE`, `UPDATE`, `DELETE` for `id = 10` and verify `person_audit` contents.

- `day09_ex04.sql`  
  Instead of views for male and female persons, create two **SQL functions**:
  - `fnc_persons_female()` – returns all female persons,
  - `fnc_persons_male()` – returns all male persons.  
  Both functions should be written as plain SQL (not PL/pgSQL) and return a result set that can be queried as a table, e.g.:

  ```sql
  SELECT * FROM fnc_persons_male();
  SELECT * FROM fnc_persons_female();
  ```

- `day09_ex05.sql`  
  Replace the two functions from Exercise 04 with one generic parameterized SQL function `fnc_persons(pgender TEXT DEFAULT 'female')` that returns persons filtered by gender.
  It should be callable both with an explicit parameter and with the default value, e.g.:
  ```sql
  SELECT * FROM fnc_persons(pgender := 'male');
  SELECT * FROM fnc_persons();
  ```

- `day09_ex06.sql`  
  Implement a PL/pgSQL `function fnc_person_visits_and_eats_on_date` with parameters:
    - `pperson` (default `'Dmitriy'`),
    - `pprice` (default `500`),
    - `pdate` (default `'2022-01-08'`).

  The function should return the names of pizzerias that the given person visited on `pdate` and where they could buy pizza cheaper than `pprice`.
  It should be based on an SQL query but wrapped in PL/pgSQL. Example calls:
  ```sql
  SELECT * FROM fnc_person_visits_and_eats_on_date(pprice := 800);
  SELECT * FROM fnc_person_visits_and_eats_on_date(pperson := 'Anna', pprice := 1300, pdate := '2022-01-01');
  ```

- `day09_ex07.sql`  
  Write an SQL or PL/pgSQL function func_minimum that takes an array of numbers as an input parameter and returns the minimum value in that array.
  Example call:
  ```sql
  SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]);
  ```

- `day09_ex08.sql`  
  Write an SQL or PL/pgSQL function fnc_fibonacci(pstop INTEGER DEFAULT 10) that returns a table of all Fibonacci numbers strictly less than pstop.
  Example calls:
  ```sql
  SELECT * FROM fnc_fibonacci(100);
  SELECT * FROM fnc_fibonacci();
  ```