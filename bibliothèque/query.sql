-- Faire une requête pour récupérer les emprunts EN COURS d'un⋅ adhérent⋅e avec le livre concerné ainsi que la date de retour prévue
SELECT livre.titre, emprunt.date_emprunt+INTERVAL jours_autorises DAY FROM emprunt 
INNER JOIN livre ON livre.id=emprunt.id_livre
WHERE emprunt.id_utilisateur=1 AND emprunt.date_retour_reelle IS NULL;

-- Faire une requête pour rechercher un livre à la fois par son titre,description,genre, nom et prénom d'auteur
SELECT * FROM livre
LEFT JOIN auteur_livre ON livre.id=auteur_livre.id_livre
LEFT JOIN auteur ON auteur_livre.id_auteur=auteur.id
WHERE CONCAT(livre.titre,livre.description,livre.genre,auteur.nom,auteur.prenom) LIKE '%es%';

-- Faire une requête pour récupérer la liste des adhérent⋅es
SELECT * FROM utilisateur WHERE role='adherent';

-- Faire une requête pour récupérer la liste des amendes non payées et le nom/prénom de l'utilisateur⋅ice à qui est assignée l'amende
SELECT amende.*, utilisateur.nom, utilisateur.prenom FROM amende
LEFT JOIN utilisateur ON amende.id_utilisateur=utilisateur.id
WHERE amende.reglee=FALSE;
-- Faire une requête pour récupérer les livres publiés depuis 1990
SELECT * FROM livre WHERE annee_publication>=1990;

-- Faire une requête pour récupérer la liste des adhérent, leur nombre d'emprunt en cours (le truc avec le case en vrai on le fait pas souvent et les jurés vous le demanderont pas)
SELECT utilisateur.*, COUNT(CASE WHEN date_retour_reelle IS NULL AND emprunt.id IS NOT NULL THEN 1 END) AS emprunt_en_cours FROM utilisateur 
LEFT JOIN emprunt ON utilisateur.id=emprunt.id_utilisateur
LEFT JOIN amende ON amende.id_utilisateur=utilisateur.id
GROUP BY utilisateur.id;