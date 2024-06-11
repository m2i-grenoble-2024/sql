-- Supprime les données d'une table mais garde la table
-- TRUNCATE person;

INSERT INTO person (name,first_name,age) VALUES
('Sakhri', 'Lisa', 65),
('Sakhri', 'Abdala', 30),
('Gomex', 'Lisa', 25),
('Johnson', 'Alberto', 65),
('Mouriel', 'Baptiste', 18);


SELECT * FROM person WHERE id=3;
SELECT * FROM person WHERE first_name='Lisa';
SELECT * FROM person WHERE age > 50;
SELECT * FROM person WHERE name='Sakhri' AND age < 60;
SELECT * FROM person WHERE first_name!='Lisa';
SELECT * FROM person WHERE age >= 30 AND age <= 60;
-- Pareil qu'au dessus
SELECT * FROM person WHERE age BETWEEN 30 AND 60;
SELECT * FROM person WHERE first_name LIKE 'L%';
-- '%L' finit par L, 'L%' commence par L, '%L%' contient L quelque part

SELECT CONCAT(first_name,' ', name) AS full_name FROM person;

SELECT * FROM person WHERE CONCAT(first_name,name) LIKE '%as%';

SELECT * FROM person WHERE YEAR(NOW())-age > 1995;


SELECT * FROM person ORDER BY name ASC;
SELECT * FROM person ORDER BY age ASC;
SELECT * FROM person ORDER BY age DESC LIMIT 3;
SELECT * FROM person ORDER BY first_name ASC, age DESC;



SELECT * FROM address WHERE person_id=5;

SELECT person.name FROM person LEFT JOIN address ON person.id=address.person_id
 WHERE address.city='Grenoble';


 SELECT address.* FROM address LEFT JOIN person ON person.id=address.person_id 
 WHERE person.name='Sakhri';

 SELECT address.* FROM address LEFT JOIN person ON person.id=address.person_id 
 WHERE person.first_name='Lisa' AND address.zip_code LIKE '38%';

 SELECT DISTINCT person.* FROM person LEFT JOIN address ON person.id=address.person_id 
 WHERE address.street LIKE '%rue %' ORDER BY person.age DESC;

 SELECT person.* FROM person LEFT JOIN address ON person.id=address.person_id 
 WHERE address.id IS NULL;

 SELECT * FROM address WHERE person_id IS NULL;

SELECT person.* FROM person LEFT JOIN address ON person.id=address.person_id 
 WHERE CONCAT(person.name, person.first_name, address.street, address.city) LIKE '%on%';


SELECT person.* FROM person
LEFT JOIN person_skill ON person.id=person_skill.person_id
LEFT JOIN skill ON skill.id=person_skill.skill_id
WHERE skill.label='PHP';



SELECT * FROM person
LEFT JOIN person_skill ON person.id=person_skill.person_id
LEFT JOIN skill ON skill.id=person_skill.skill_id
LEFT JOIN address ON person.id=address.person_id
WHERE skill.label='Git' AND address.city='Grenoble';