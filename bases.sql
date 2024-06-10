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
    id INT PRIMARY KEY AUTO_INCREMENT, -- je sais pas
    name VARCHAR(128) NOT NULL
);

-- Afficher les colonnes d'une table
DESC person;