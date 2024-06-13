-- Active: 1718008404978@@127.0.0.1@3306@dam_sandwich

DROP TABLE IF EXISTS sandwich_ingredient;
DROP TABLE IF EXISTS sandwich;
DROP TABLE IF EXISTS delivery_info;
DROP TABLE IF EXISTS commande;
DROP TABLE IF EXISTS ingredient;

CREATE TABLE ingredient(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(128) NOT NULL,
    price FLOAT NOT NULL,
    type VARCHAR(128) NOT NULL,
    stock INT
);

CREATE TABLE commande (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    total FLOAT,
    status VARCHAR(128) NOT NULL
);

CREATE TABLE delivery_info(
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL,
    address VARCHAR(256) NOT NULL,
    phone_number VARCHAR(16),
    commande_id INT REFERENCES commande(id) ON DELETE CASCADE
);

CREATE TABLE sandwich(
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantity INT NOT NULL DEFAULT(1),
    commande_id INT REFERENCES commande(id) ON DELETE CASCADE
);

CREATE TABLE sandwich_ingredient(
    sandwich_id INT REFERENCES sandwich(id) ON DELETE CASCADE,
    ingredient_id INT REFERENCES ingredient(id) ON DELETE CASCADE,
    PRIMARY KEY (sandwich_id, ingredient_id)
);


