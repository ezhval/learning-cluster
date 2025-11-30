# Day 08 – Transactions and isolation

This folder contains SQL exercises focused on transactions, isolation levels and typical concurrency anomalies:
lost updates, non-repeatable reads, phantom reads and deadlocks.

All tasks use the same demo database about people, pizzerias, visits and orders.

The database schema and sample data are created by the script `../pizza_demo_db.sql`.  
The ER diagram is available as `../er_diagram.png`.

Most exercises assume working with two parallel `psql` sessions (Session #1 and Session #2).

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day08_ex00.sql`  
  Demonstrate a **simple transaction** and visibility of changes between sessions.  
  In Session #1, update the rating of `Pizza Hut` inside an explicit transaction and verify that the
  new rating is visible in Session #1 but remains invisible in Session #2 until `COMMIT` is issued.  
  After committing in Session #1, show that Session #2 can see the updated rating.

- `day08_ex01.sql`  
  Reproduce the **Lost Update** anomaly under the default `READ COMMITTED` isolation level.  
  Using two sessions, read the rating of `Pizza Hut` in both transactions, then perform updates
  to different values in Session #1 and Session #2 (e.g. `4.0` and `3.6`) and commit in the order
  shown in the scenario.  
  Show that one of the updates is effectively lost in the final result.

- `day08_ex02.sql`  
  Repeat the **Lost Update** scenario for the `REPEATABLE READ` isolation level.  
  Set `REPEATABLE READ` in both sessions, execute the same sequence of reads and updates of the `Pizza Hut`
  rating as in Exercise 01 and observe how the database prevents the anomaly  
  (e.g. by blocking or aborting one of the transactions).

- `day08_ex03.sql`  
  Demonstrate a **Non-Repeatable Read** under `READ COMMITTED`.  
  In Session #1, within a transaction, select the `Pizza Hut` rating.  
  In Session #2, update the rating (e.g. to `3.6`) and commit.  
  Then in Session #1, re-run the same `SELECT` inside the still-open transaction and show that the value
  has changed.

- `day08_ex04.sql`  
  Demonstrate how **Non-Repeatable Reads** are handled under the `SERIALIZABLE` isolation level.  
  Use two sessions: Session #1 reads the `Pizza Hut` rating inside a transaction; Session #2 tries to update
  the rating (e.g. to `3.0`) and commit, following the scenario.  
  Show how `SERIALIZABLE` prevents the anomaly (e.g. via serialization failure or blocking).

- `day08_ex05.sql`  
  Demonstrate a **Phantom Read** under `READ COMMITTED`.  
  In Session #1, start a transaction and compute the total sum of ratings for all pizzerias.  
  In Session #2, insert a new pizzeria (for example, `'Kazan Pizza'` with rating `5` and id `10`) and commit.  
  Then in Session #1, recompute the sum of ratings within the same transaction and show that the result changes
  due to the newly inserted row.

- `day08_ex06.sql`  
  Demonstrate **Phantom Reads** behaviour under `REPEATABLE READ`.  
  In Session #1, start a transaction and compute the total sum of pizzeria ratings.  
  In Session #2, insert another new pizzeria (e.g. `'Kazan Pizza 2'` with rating `4` and id `11`) and commit.  
  Then in Session #1, recompute the sum and observe how `REPEATABLE READ` handles the potential phantom
  (e.g. by keeping the original snapshot or raising a serialization error).

- `day08_ex07.sql`  
  Reproduce a **deadlock** on the `pizzeria` table using any reasonable pair of statements and isolation level.  
  Use two sessions that acquire locks on rows (or sets of rows) in a conflicting order so that both transactions
  wait on each other.  
  Show that the database detects the deadlock and aborts one of the transactions.