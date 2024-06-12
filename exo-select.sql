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

-- Faire un commentaire
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

-- Pour faire une requête qui concerne à la fois les personnes et leur skills, on doit
-- faire 2 jointures, une entre la première table et la table de jointure, et une autre
-- entre la table de jointure et la deuxième table (car les 2 tables ne se connaissent pas directement)
SELECT person.* FROM person
LEFT JOIN person_skill ON person.id=person_skill.person_id
LEFT JOIN skill ON skill.id=person_skill.skill_id
WHERE skill.label='PHP';



SELECT * FROM person
LEFT JOIN person_skill ON person.id=person_skill.person_id
LEFT JOIN skill ON skill.id=person_skill.skill_id
LEFT JOIN address ON person.id=address.person_id
WHERE skill.label='Git' AND address.city='Grenoble';

-- Ici, on va chercher les skills qui sont pratiqués dans la ville de Grenoble,
-- comme ils sont liés à des personnes, il peut y avoir des répétitions, donc on utilise
-- le DISTINCT pour ne pas répéter un même skill, et on utilise un INNER JOIN pour ne
-- pas aller chercher les personnes qui n'ont pas de skill (sinon une des valeurs affichées
-- serait NULL pour représenter les personnes sans skill à Grenoble)
SELECT DISTINCT skill.label FROM person
INNER JOIN person_skill ON person.id=person_skill.person_id
LEFT JOIN skill ON skill.id=person_skill.skill_id
LEFT JOIN address ON person.id=address.person_id
WHERE address.city='Grenoble';



SELECT first_name, COUNT(*),AVG(age) FROM person GROUP BY first_name;

SELECT MAX(age), name FROM person GROUP BY name;

SELECT person.*, COUNT(address.id) AS address_count FROM person 
LEFT JOIN address ON person.id=address.person_id
GROUP BY person.id;

SELECT person.*, COUNT(address.id) AS address_count FROM person 
LEFT JOIN address ON person.id=address.person_id
GROUP BY person.id
HAVING address_count >= 2;

SELECT person.*, GROUP_CONCAT(label) AS skills FROM person
LEFT JOIN person_skill ON person_skill.person_id=person.id
LEFT JOIN skill ON person_skill.skill_id=skill.id
GROUP BY person.id;

SELECT skill.*, COUNT(person.id) as skill_users, MAX(person.age) AS oldest_user, AVG(person.age) AS avg_user_age FROM skill 
LEFT JOIN person_skill ON person_skill.person_id=skill.id
LEFT JOIN person ON person_skill.skill_id=person.id
GROUP BY skill.id;

SELECT address.city, COUNT(skill.id) FROM address 
LEFT JOIN person ON person.id=address.person_id
LEFT JOIN person_skill ON person_skill.person_id=person.id
LEFT JOIN skill ON person_skill.skill_id=skill.id
GROUP BY address.city ORDER BY COUNT(skill.id) DESC;


DELETE FROM person WHERE id=1;