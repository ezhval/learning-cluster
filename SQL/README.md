# SQL learning module

This folder contains a cluster of SQL learning projects and practice exercises.  
The tasks are grouped into day-based folders and use two small demo databases that
are easy to recreate.

> ⚠️ Some days build directly on the objects and data created in previous days  
> (for example, views, indexes, additional data).  
> **It is recommended to go through the days in numerical order** (Day_00 → Day_01 → …),
> starting from a newly created database initialized only with the demo script.

## Demo databases

### 1. Pizza demo database

Used in Days 00–09:

- `pizza_demo_db.sql` – creates all tables, constraints and loads sample data.
- `er_diagram.png` – ER diagram showing relationships between the tables  
  (`person`, `pizzeria`, `menu`, `person_visits`, `person_order`).

Typical workflow:

1. Create an empty database (for example, `pizza_demo_db`).
2. Run `pizza_demo_db.sql` using your SQL client or command-line tool.
3. Optionally open `er_diagram.png` to explore the structure of the schema.

### 2. Finance DWH demo

Used in Day 11:

- `demo_dwh.sql` – creates a simple data warehouse schema (`user`, `balance`, `currency`)
  and loads sample data with temporal history in the `updated` column.

Typical workflow:

1. Create a separate database (for example, `finance_demo_dwh`) or schema.
2. Run `demo_dwh.sql` there.
3. Use `dwh_overview.png` and `dwh_tables.png` as visual reference.

## Structure

The SQL learning module is organised into day-based subfolders:

- `Day_00/` – basic `SELECT`, simple filtering and introductory queries.
- `Day_01/` – sets and joins (`UNION`, `EXCEPT`, Cartesian products, basic `JOINs`).
- `Day_02/` – outer joins, CTEs, generated date series and advanced filtering.
- `Day_03/` – data modification (`INSERT`, `UPDATE`, `DELETE`) and set logic on visits/orders.
- `Day_04/` – views and materialized views, helper datasets and symmetric set operations.
- `Day_05/` – B-tree indexes, functional and multicolumn indexes, partial uniqueness and
  performance checks with `EXPLAIN ANALYZE`.
- `Day_06/` – personal discount model: new table, constraints, indexes, comments and sequences.
- `Day_07/` – grouped aggregations, per-pizzeria and per-address metrics, derived analytical measures.
- `Day_08/` – transactions and isolation levels (`READ COMMITTED`, `REPEATABLE READ`,
  `SERIALIZABLE`), classical anomalies and deadlocks.
- `Day_09/` – audit triggers and SQL / PL/pgSQL functions (parameterised queries, helpers, Fibonacci).
- `Day_10/` – Traveling Salesman Problem in SQL: recursive CTE over a small weighted graph of cities,
  generation of all tours and comparison of minimum / maximum total cost.
- `Day_11/` – finance data warehouse mini-project: user balances, currency rates and
  historical FX logic (nearest past / future rate).

Each day folder typically contains:

- `README.md` – description of the exercises for that day.
- `*.sql` – solution scripts for individual tasks, one file per exercise.
- Optionally, helper artefacts such as diagrams or result samples.

## Assumptions and technology

- The exercises target PostgreSQL and use PostgreSQL-compatible SQL syntax.
- Demo schemas are intentionally small and simple, so they can be used both for learning
  and for quick prototyping.
- Model scripts such as `pizza_demo_db.sql` and `demo_dwh.sql` are self-contained:
  running them in an empty database is enough to create all required tables and load demo data.

## Purpose

The goal of this module is to:

- document learning progress in SQL;
- provide a clean, reproducible set of examples for querying, filtering, aggregation,
  indexing and basic data modelling.