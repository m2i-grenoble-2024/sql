DROP TABLE IF EXISTS address;
DROP TABLE IF EXISTS person;
CREATE TABLE person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    age INT
);
CREATE TABLE address(
    id INT PRIMARY KEY AUTO_INCREMENT,
    street VARCHAR(255),
    city VARCHAR(255),
    zip_code VARCHAR(20),
    person_id INT NOT NULL REFERENCES person(id)
);

INSERT INTO address (person_id) VALUES (1);
DELETE FROM person WHERE id=1;

-- Créer la table address avec ses 4 propriétés propres toutes en varchar sauf l'id
-- mais également une colonne person_id en INT qui ne pourra pas être null
-- Chercher sur internet comment faire en sorte que cette colonne person_id soit une
-- FOREIGN KEY qui fait référence à l'id de la table person

-- Pour voir si ça marche, essayer de faire d'abord un INSERT INTO address en lui
-- donnant une person_id existante (genre 1) puis essayer avec une person_id qui n'existe
-- pas (genre 2000), si la foreign key est bien faite, ça devrait causer une erreur