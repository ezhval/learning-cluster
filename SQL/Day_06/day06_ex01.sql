-- Exercise 01: populate person_discounts via single INSERT ... SELECT with discount tiers and ROW_NUMBER() as id

INSERT INTO person_discounts (id, person_id, pizzeria_id, discount)
SELECT 
    ROW_NUMBER() OVER () AS id, person_id, m.pizzeria_id,
    CASE 
        WHEN COUNT(*) = 1 THEN 10.5 -- просчитываем количество заказов (строк) для кажой пары person_id + pizzeria_id
        WHEN COUNT(*) = 2 THEN 22
        ELSE 30                             
    END AS discount
FROM person_order po
JOIN menu m ON po.menu_id = m.id
GROUP BY person_id, m.pizzeria_id; 

/*
Функция ROW_NUMBER() - нумерует строки в порядке, заданном с помощью конструкции OVER (ORDER BY ...).
Если порядок не задан (просто OVER ()), строки будут нумероваться в произвольном порядке, как они появляются в результирующем наборе.

ROW_NUMBER() OVER ([PARTITION BY ...] [ORDER BY ...]) AS id
OVER: Указывает, что это оконная функция. Определяет, как строки делятся на группы (PARTITION BY) 
и сортируются внутри этих групп (ORDER BY).

PARTITION BY (необязательный): группирует строки. Нумерация строк начинается заново для каждой группы.
ORDER BY (необязательный): указывает порядок, в котором строки должны быть нумерованы.
Если PARTITION BY и ORDER BY не используются, строки просто получают уникальные номера без учета групп и порядка.
*/