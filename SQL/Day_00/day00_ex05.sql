-- Exercise 05: names of people who ordered menu items 13, 14 and 18 on 2022-01-07 using subquery in SELECT (no IN or JOIN)

SELECT 
	(SELECT name
     FROM person
     WHERE person.id = person_order.person_id)
FROM person_order
WHERE (menu_id = 13 OR menu_id = 14 OR menu_id = 18) AND order_date = '2022-01-07';