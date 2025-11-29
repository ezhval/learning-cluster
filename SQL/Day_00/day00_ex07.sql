-- Exercise 07: person id, name and age interval_info ('interval #1', '#2', '#3') via CASE, ordered by interval_info

SELECT id, name,
    CASE
        WHEN (age >= 10 and age <= 20) THEN 'interval #1'
        WHEN (age > 20 and age < 24) THEN 'interval #2'
        ELSE 'interval #3'
    END AS interval_info
FROM person
ORDER BY interval_info ASC;