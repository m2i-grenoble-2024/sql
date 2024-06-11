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
    -- FOREIGN KEY person_id REFERENCES person(id) -- On peut aussi déclarer la FK à part
);

-- ALTER TABLE address ADD FOREIGN KEY (person_id) REFERENCES person(id);

INSERT INTO person (name,first_name,age) VALUES
('Sakhri', 'Lisa', 65),
('Sakhri', 'Abdala', 30),
('Gomex', 'Lisa', 25),
('Johnson', 'Alberto', 65),
('Mouriel', 'Baptiste', 18);

