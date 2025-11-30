-- Exercise 06: create sequence seq_person_discounts and set id DEFAULT nextval(...), initializing it to max(id)+1

/*
Последовательность в SQL — это объект базы данных, который автоматически генерирует числовые значения. 
Обычно используется для создания уникальных идентификаторов (например, для столбцов id), чтобы избежать дублирования данных.
*/

CREATE SEQUENCE seq_person_discounts
START 1;

/*
Устанавливает значение по умолчанию для столбца id. 
Теперь, при добавлении новой строки, если значение id не указано, оно автоматически берётся из последовательности.
*/
ALTER TABLE person_discounts
ALTER COLUMN id
SET DEFAULT nextval('seq_person_discounts');

SELECT setval('seq_person_discounts', -- устанавливаем новое значение (+1)
    (SELECT count(*)+1
    FROM person_discounts));