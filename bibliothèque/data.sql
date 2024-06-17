INSERT INTO utilisateur (email,mot_de_passe,nom,prenom,role) VALUES 
('user@test.com', 'amoiinazefoijqs', 'test', 'test', 'adherent'),
('admin@test.com', 'amoiinazefoijqs', 'admin', 'admin', 'admin'),
('bibli@test.com', 'amoiinazefoijqs', 'bibli', 'bibli', 'bibliothecaire');

INSERT INTO auteur (nom, prenom,description) VALUES 
('K. Le Guin', 'Ursula', 'descritpion'),
('E. Butler', 'Octavia', 'description'),
('Stanley Robinson', 'Kim', 'description');

INSERT INTO livre (titre,isbn,genre,etat,annee_publication,description,disponible) VALUES 
('La main gauche de la nuit', 'QSDF2R342', 'SF', 'bon', '1985', 'description', TRUE),
('Les dépossédés', 'ABDF2R342', 'SF', 'neuf', '1990', 'description', TRUE),
('Le ministère du futur', 'ABISDJOF54', 'SF', 'bon', '2022', 'description', FALSE),
('Patternist', '0539GGSDS', 'SF', 'mauvais', '1977', 'description', FALSE);

INSERT INTO emprunt (date_emprunt,jours_autorises,id_livre,id_utilisateur, date_retour_reelle) VALUES
('2024-06-01', 30, 3, 1, NULL),
('2024-06-02', 30, 4, 1, NULL),
('2024-05-12', 30, 1, 1, '2024-05-27'),
('2024-04-12', 30, 3, 1, '2024-05-18'),
('2024-05-12', 30, 1, 2, '2024-06-01');

INSERT INTO auteur_livre (id_auteur,id_livre) VALUES 
(1, 1),
(1,2),
(2,4),
(3,3);

INSERT INTO amende (date_creation,date_echeance,id_utilisateur,prix,raison,reglee) VALUES 
('2024-06-01', '2024-08-30', 1, 2.0, 'raison', FALSE),
('2024-03-01', '2024-05-30', 1, 2.0, 'raison', TRUE);
