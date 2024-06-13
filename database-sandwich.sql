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


INSERT INTO ingredient (name,price,stock,type) VALUES
('Regular bread', 1.5, 10, 'bread'),
('Complete bread', 2.0, 10, 'bread'),
('Rye bread', 2.5, 5, 'bread'),
('Tofu', 1.0, 10, 'protein'),
('Chicken', 2.0, 10, 'protein'),
('Fish', 2.0, 10, 'protein'),
('Mayo', 0.5, 10, 'sauce'),
('Ketchup', 0.5, 10, 'sauce'),
('Tomato', 0.5, 10, 'garnish'),
('Salad', 0.5, 10, 'garnish'),
('Onion', 0.5, 10, 'garnish'),
('Jalapenos', 0.8, 10, 'garnish');

INSERT INTO commande (order_date, status,total) VALUES
('2024-01-03 10:05:04', 'delivered', 10),
('2024-02-13 15:15:34', 'delivered', 30),
('2024-06-13 14:59:14', 'in progress', 6.5),
('2024-06-13 15:30:01', 'awaiting', 8.5),
('2024-06-13 15:34:00', 'awaiting', 7.5);

INSERT INTO delivery_info (address,name,phone_number,commande_id) VALUES
('34 rue du truc', 'Name Name', '0123456789', 1),
('20 rue du truc', 'Name Name2', '0123456789', 2),
('13 rue du truc', 'Name Name3', '0123456789', 3),
('54 rue du truc', 'Name Name4', '0123456789', 4),
('40 rue du truc', 'Name Name5', '0123456789', 5);

INSERT INTO sandwich (quantity, commande_id) VALUES 
(1, 1),
(1, 2),
(1, 2),
(2, 3),
(1, 4),
(1,5);

INSERT INTO sandwich_ingredient (sandwich_id, ingredient_id) VALUES
(1, 1),
(1, 4),
(1, 7),
(1, 9),
(1, 10),
(1, 11),
(2, 2),
(2, 6),
(2, 8),
(2, 9),
(2, 12),
(2, 11),
(3, 4),
(3, 7),
(3, 9),
(3, 10),
(3, 11),
(4, 3),
(4, 4),
(4, 7),
(4, 9),
(4, 10),
(4, 11),
(5, 1),
(5, 4),
(5, 7),
(5, 9),
(5, 10),
(5, 11),
(6, 1),
(6, 4),
(6, 7),
(6, 9),
(6, 10),
(6, 11);
