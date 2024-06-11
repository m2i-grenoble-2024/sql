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
    person_id INT REFERENCES person(id)
    -- FOREIGN KEY person_id REFERENCES person(id) -- On peut aussi déclarer la FK à part
);

-- ALTER TABLE address ADD FOREIGN KEY (person_id) REFERENCES person(id);

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
('rue de la gare', 'Nantes', '44000', 5);
