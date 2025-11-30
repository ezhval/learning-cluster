-- Exercise 00: create table person_discounts with PK id, FKs to person and pizzeria, and numeric discount

CREATE TABLE person_discounts (
    id BIGINT PRIMARY KEY,
    person_id BIGINT NOT NULL,
    pizzeria_id BIGINT NOT NULL,
    discount NUMERIC NOT NULL,
    CONSTRAINT fk_person_discounts_person_id FOREIGN KEY (person_id) REFERENCES person(id),
    CONSTRAINT fk_person_discounts_pizzeria_id FOREIGN KEY (pizzeria_id) REFERENCES pizzeria(id)
);

/* создаем внешний ключ (foreign key) person_id в таблице person_discounts, 
это гарантирует, что значение person_id в таблице person_discounts всегда существует в таблице person */