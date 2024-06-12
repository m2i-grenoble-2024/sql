ALTER TABLE person ADD birthdate DATE;


-- SELECT CONCAT(YEAR(NOW())-age, '-01-01') FROM person;

UPDATE person SET birthdate=CONCAT(YEAR(NOW())-age, '-01-01') WHERE birthdate IS NULL;

ALTER TABLE person DROP COLUMN age;