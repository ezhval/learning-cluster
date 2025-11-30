-- Exercise 05: add descriptive comments on table person_discounts and all its columns

COMMENT ON TABLE person_discounts IS 'Таблица персональных скидок клиентов в пиццериях.';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор записи.';
COMMENT ON COLUMN person_discounts.person_id IS 'Идентификатор клиента, связанный с таблицей person.';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Идентификатор пиццерии, связанный с таблицей pizzeria.';
COMMENT ON COLUMN person_discounts.discount IS 'Размер скидки для клиента в процентах. Значение находится в диапазоне от 0 до 100.';