-- Exercise 00: create simple B-tree indexes for all foreign keys (idx_{table}_{column}, e.g. idx_menu_pizzeria_id)

CREATE INDEX idx_menu_pizzeria_id ON menu (pizzeria_id);
CREATE INDEX idx_person_visits_person_id ON person_visits (person_id);
CREATE INDEX idx_person_visits_pizzeria_id ON person_visits (pizzeria_id);
CREATE INDEX idx_person_order_person_id ON person_order (person_id);
CREATE INDEX idx_person_order_menu_id ON person_order (menu_id);