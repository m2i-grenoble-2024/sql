DROP TABLE IF EXISTS person_skill;
DROP TABLE IF EXISTS skill;
DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS person;
CREATE TABLE person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    age INT
);
-- Ici, comme l'address a une relation Many To One avec person, on lui indique une
-- colonne person_id qui indiquera l'id de la person à qui appartient l'address en question.
-- Pour ajouter des contraintes, on la déclare sous forme de clé étrangère, ce qui fait qu'on
-- ne pourra pas assigner une address à un id de personne qui n'existe pas et que lorsqu'on
-- supprime une person on pourra choisir le comportement à adopter sur les address qui appartenaient à cette person
CREATE TABLE address(
    id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255),
    city VARCHAR(255),
    zip_code VARCHAR(20),
    person_id INT REFERENCES person(id) ON DELETE SET NULL
    -- FOREIGN KEY person_id REFERENCES person(id) -- On peut aussi déclarer la FK à part
);

-- ALTER TABLE address ADD FOREIGN KEY (person_id) REFERENCES person(id);

CREATE TABLE skill(
    id INT PRIMARY KEY AUTO_INCREMENT,
    label VARCHAR(128) NOT NULL
);
-- Ici nous avons une relation Many To Many entre person et skill, on doit donc créer
-- une table de jointure dont le seul but sera de faire la correspondance entre les 
-- persons et les skills. Elle ne contiendra que des clés étrangères (celles des 2 table à relier)
-- et on fait le choix de faire une clé primaire composite qui sera la concaténation des 2 clés étrangères
-- on aurait aussi pu rajouter un id auto_increment, mais je trouve ça moins joli
CREATE TABLE person_skill(
    person_id INT,
    skill_id INT,
    PRIMARY KEY (person_id,skill_id),
    FOREIGN KEY (person_id) REFERENCES person(id) ON DELETE CASCADE,
    FOREIGN KEY (skill_id) REFERENCES skill(id) ON DELETE CASCADE
);

INSERT INTO person (name,first_name,age) VALUES
('Sakhri', 'Lisa', 65),
('Sakhri', 'Abdala', 30),
('Gomex', 'Lisa', 25),
('Johnson', 'Alberto', 65),
('Mouriel', 'Baptiste', 18);

INSERT INTO address (street, city, zip_code, person_id) VALUES 
('rue de la république', 'Grenoble', '38000', 1),
('rue de la santé', 'Lyon', '69000', 1),
('rue de la gare', 'Nantes', '44000', 2),
('rue de la paix', 'Nantes', '44000', 3),
('Avenue truc truc', 'Grenoble', '38000', 3),
('rue de la république', 'Grenoble', '38000', 5),
('rue de la santé', 'Lyon', '69000', 5),
('rue de vide', 'Lyon', '69000', NULL),
('avenue de la gare', 'Nantes', '44000', 5);

INSERT INTO skill (label) VALUES 
('PHP'),
('HTML/CSS'),
('JS'),
('MySQL'),
('Git');

INSERT INTO person_skill (person_id,skill_id) VALUES 
(1,2),
(1,3),
(1,5),
(2,1),
(2,4),
(3,5);
