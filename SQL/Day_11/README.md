# Day 11 – Data Warehouse and ETL basics

This folder contains SQL exercises focused on a simple Data Warehouse (DWH) scenario:
aggregating balances from multiple operational sources and calculating derived metrics
in a DWH layer.

The tasks are based on three source systems (`user`, `currency`, `balance`) and their
corresponding DWH tables.

The overall data flow from source systems into the DWH is shown below:

![Source systems and DWH](dwh_overview.png)

The DWH schema and sample data are created by the script `../Materials/demo_dwh.sql`.  
The logical DWH schema is shown below:

![DWH schema](dwh_tables.png)

## Source and DWH tables (short overview)

**Source databases (OLTP):**

- `user` – user master data (`id`, `name`, `lastname`), may contain `NULL` names/lastnames.
- `currency` – currency master data (`id`, `name`, `rate_to_usd`).
- `balance` – balance movements per user (`user_id`, `money`, `type`, `currency_id`).

**DWH database (ODS / temporal layer):**

- `user` – same structure as source, with possible anomalies.
- `currency` – temporal history with `updated` timestamp (duplicate `id` values allowed).
- `balance` – temporal balance movements with `updated` timestamp.

All DWH tables inherit anomalies from the sources:

- missing related rows (no strict foreign keys),
- possible `NULL` values in names,
- temporal history stored in `updated`.

## Exercises and solutions

Each exercise is implemented in a separate SQL script in this folder.

- `day11_ex00.sql` – **Classical DWH aggregation**  
  Write an SQL statement that returns the total volume of balance transactions,
  aggregated by user and balance type, processing **all** data including anomalies.

  The result should contain:

  - `name` – from `user.name`; if `NULL`, use `'not defined'`;
  - `lastname` – from `user.lastname`; if `NULL`, use `'not defined'`;
  - `type` – from `balance.type`;
  - `volume` – sum of all `balance.money` movements for the user and type;
  - `currency_name` – from `currency.name`; if `NULL`, use `'not defined'`;
  - `last_rate_to_usd` – latest `currency.rate_to_usd` for the corresponding currency  
    (by `updated` in descending order); if `rate_to_usd` is `NULL`, use `1`;
  - `total_volume_in_usd` – `volume * last_rate_to_usd`.

  Sort the result by `name` in **descending** order, then by `lastname` and `type`
  in **ascending** order.

- `day11_ex01.sql` – **Detailed per-transaction view with nearest rate**  

  After inserting additional historical rates:

  ```sql
  INSERT INTO currency VALUES (100, 'EUR', 0.85, '2022-01-01 13:29');
  INSERT INTO currency VALUES (100, 'EUR', 0.79, '2022-01-08 13:29');
  ```  
  Write an SQL statement that returns all users and all balance transactions (for this task ignore balances whose `currency_id` does not exist in `currency`) with currency name and calculated value of the balance in USD.
  
  The result should contain:
    - `name` – from `user.name`; if `NULL`, use `'not defined'`;
    - `lastname` – from `user.lastname`; if `NULL`, use `'not defined'`;
    - `currency_name` – from `currency.name`;
    - `currency_in_usd` – amount in USD, calculated using `currency.rate_to_usd` chosen by the following logic relative to `balance.updated`:
        - find the nearest rate in the past (`t1`);
        - if there is no past rate, take the nearest rate in the future (`t2`);
        - use either the `t1` or `t2` rate for the calculation.

  Sort the result by `name` in descending order, then by `lastname` and `currency_name` in ascending order.