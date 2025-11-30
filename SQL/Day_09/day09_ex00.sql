-- Exercise 00: audit INSERTs on person into person_audit via fnc_trg_person_insert_audit / trg_person_insert_audit

/*
Триггер — это специальный объект базы данных, который автоматически выполняет определённые действия 
в ответ на события изменения данных в таблице.
*/

-- Создание таблицы для аудита
CREATE TABLE person_audit (
    created TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP,
    type_event CHAR(1) DEFAULT 'I' NOT NULL CHECK (type_event IN ('I', 'U', 'D')),
    row_id BIGINT NOT NULL,
    name VARCHAR,
    age INTEGER,
    gender VARCHAR,
    address VARCHAR
);

-- Создание триггерной функции, которая будет обрабатывать INSERT и копировать новую строку в таблицу person_audit
CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO person_audit (created, type_event, row_id, name, age, gender, address)
    VALUES (CURRENT_TIMESTAMP, 'I', NEW.id, NEW.name, NEW.age, NEW.gender, NEW.address);
    RETURN NULL;
END;
$$ 
LANGUAGE plpgsql;

-- Создание триггера
CREATE TRIGGER trg_person_insert_audit
AFTER INSERT ON person
FOR EACH ROW
EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- Вставляем новую строку в таблицу person
INSERT INTO person (id, name, age, gender, address) 
VALUES (10, 'Damir', 22, 'male', 'Irkutsk');