-- Exercise 02: create functional index idx_person_name on UPPER(person.name) and prove its usage with EXPLAIN ANALYZE

CREATE INDEX idx_person_name ON person (UPPER(name)); -- будет хранить все значения стобца в верхнем регистре

SET enable_seqscan = off;

EXPLAIN ANALYZE
SELECT *
FROM person
WHERE UPPER(name) = 'Nataly';
