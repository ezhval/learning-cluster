# SQL learning module

This folder contains a cluster of SQL learning projects and practice exercises.  
All tasks are based on a small demo database that is self-contained and easy to recreate.

## Database

The demo database used in the exercises is defined by a single script:

- `pizza_demo_db.sql` – creates all tables, constraints and loads sample data.
- `er_diagram.png` – ER diagram showing the relationships between the tables.

To prepare the database:

1. Create an empty database in your SQL engine.
2. Run `pizza_demo_db.sql` using your SQL client or command-line tool.
3. Optionally open `er_diagram.png` to explore the structure of the database.

## Structure

The SQL learning module is organised into day-based subfolders:

- `Day_00/` – introductory SQL exercises on basic `SELECT`, filtering and simple subqueries.
- `Day_01/`, `Day_02/`, … – follow-up practice blocks (joins, aggregation, window functions, etc.).

Each day folder typically contains:

- `README.md` – description of the exercises for that day.
- `*.sql` – solution scripts for individual tasks.
- Optionally, result samples (`*_result.sql`, `.md` or `.csv`).

## Assumptions and technology

- The exercises are written in standard SQL with a focus on PostgreSQL-compatible syntax.
- The demo schema is intentionally small and simple, so it can be used both for learning and quick prototyping.

## Purpose

The goal of this module is to document learning progress in SQL and to provide a clean, reproducible set of examples that demonstrate querying, filtering, aggregation and basic data modelling on a realistic but compact dataset.
