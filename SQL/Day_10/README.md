# Traveling Salesman Problem in SQL

This mini-project implements a simple version of the Traveling Salesman Problem (TSP)
using recursive SQL queries on a small graph of cities.

The goal is to work with graph-like data (cities and travel costs between them) and
to generate all possible tours starting and ending at a fixed city, then analyse
their total cost.

## Data model

The graph of cities is stored in a single table with edge weights:

- `point1` – starting city,
- `point2` – destination city,
- `cost` – travel cost between `point1` and `point2`.

The graph is undirected, so for each pair of cities both directions are stored
(e.g. `(a, b)` and `(b, a)` with the same cost).

The layout of the graph and edge costs is shown in `Graph.png`:

![TSP graph](Graph.png)

The table is created and populated directly in the script for Exercise 00.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder
(e.g. `tsp_ex00.sql`, `tsp_ex01.sql` – adjust names to your repository layout).

- **Exercise 00 – Classical TSP**  
  Create a table with edges `{point1, point2, cost}` for a graph of four cities  
  (`a`, `b`, `c`, `d`) based on the given scheme.  
  Using a recursive SQL query, generate all tours that:
  - start from city `'a'`,
  - visit each city exactly once,
  - return back to `'a'`.  

  For each tour, calculate the total travel cost and return only tours with the
  **minimum total_cost**, sorted by `total_cost` and then by string representation
  of the tour (e.g. `{a,b,d,c,a}`).

- **Exercise 01 – Opposite TSP**  
  Extend the SQL from Exercise 00 so that, in addition to tours with **minimum**
  total cost, it also returns tours with the **maximum** total cost.  
  The result should contain both cheapest and most expensive tours, sorted by
  `total_cost` and then by tour.