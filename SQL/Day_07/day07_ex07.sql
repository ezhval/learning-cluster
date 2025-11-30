-- Exercise 07: single row with global average pizzeria rating as global_rating (rounded to 4 decimals)

SELECT ROUND(AVG(rating), 4) AS global_rating
FROM pizzeria;