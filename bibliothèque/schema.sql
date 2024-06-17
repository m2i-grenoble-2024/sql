CREATE TABLE utilisateur(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    role VARCHAR(64) NOT NULL,
    nom VARCHAR(128),
    prenom VARCHAR(128)
);

CREATE TABLE auteur(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(128),
    prenom VARCHAR(128),
    description TEXT
);

CREATE TABLE livre(
    id INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    isbn VARCHAR(13) NOT NULL,
    genre VARCHAR(128),
    description TEXT,
    annee_publication YEAR,
    disponible BOOLEAN NOT NULL,
    etat VARCHAR(128)
);

CREATE TABLE emprunt(
    id INT PRIMARY KEY AUTO_INCREMENT,
    date_emprunt DATE NOT NULL,
    date_retour DATE,
    jours_autorises INT NOT NULL,
    id_utilisateur INT NOT NULL,
    id_livre INT NOT NULL,
    FOREIGN KEY (id_utilisateur)  REFERENCES utilisateur(id),
    FOREIGN KEY (id_livre)  REFERENCES livre(id)
);

CREATE TABLE amende(
    id INT PRIMARY KEY AUTO_INCREMENT,
    prix DOUBLE NOT NULL,
    date_creation DATE NOT NULL,
    date_echeance DATE NOT NULL,
    reglee BOOLEAN NOT NULL DEFAULT FALSE,
    raison TEXT NOT NULL,
    id_utilisateur INT NOT NULL,
    FOREIGN KEY (id_utilisateur)  REFERENCES utilisateur(id)
);