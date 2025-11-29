-- Exercise 11: update price of 'greek pizza' applying a 10% discount (reduce price by 10%)

UPDATE menu
SET price = price * 0.9
WHERE pizza_name = 'greek pizza';
