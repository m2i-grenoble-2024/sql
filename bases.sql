-- Active: 1718008404978@@127.0.0.1@3306@dam_first

-- Créer une base de données 
CREATE DATABASE ma_database;
-- CREATE DATABASE IF NOT EXISTS ma_database;
-- Supprimer la bdd et ses données
DROP DATABASE ma_database;
-- DROP DATABASE IF EXISTS ma_database;

-- Afficher les tables actuellement présentes dans la bdd
SHOW TABLES;

DROP TABLE IF EXISTS person;
CREATE TABLE person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    first_name VARCHAR(128) NOT NULL,
    age INT
);

-- CRUD : Create Read Update Delete
-- Create : la requête permettant d'ajouter une valeur dans une table, on y indique le nom de la table, la liste des colonnes à spécifier suivie des valeurs à assigner à chaque colonne, dans le même ordre
INSERT INTO nom_table (col1,col2,col3) VALUES ('valeur1', 10, 'valeur 3');

-- Dans le cas de notre table person, ça nous donne
INSERT INTO person (name, first_name, age) VALUES ("Richter", 'Franky', 65);


SELECT * FROM ma_table;


SELECT * FROM person;
SELECT first_name,age FROM person;
SELECT * FROM person WHERE name='Richter';


-- Afficher les colonnes d'une table
DESC person;