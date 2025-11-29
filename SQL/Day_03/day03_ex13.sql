-- Exercise 13: delete all 'greek pizza' orders from Exercise 12 by date, then delete 'greek pizza' from the menu

DELETE FROM person_order
WHERE menu_id = (
    SELECT id FROM menu WHERE pizza_name = 'greek pizza'
)
AND order_date = '2022-02-25';

DELETE FROM menu
WHERE pizza_name = 'greek pizza';