# SQL

Projet pour voir MySQL/MariaDB


## Exercices
### Bases de la syntaxe avec des Personnes et des adresses 
![diagramme de classe exo personne](dam-first-class.png)

#### Sélections en folie ([fichier sql](exo-select.sql))
1. Dans un fichier SQL à part qu'on va appeler exo-select.sql par exemple (si vous voulez rester dans le même fichier, peu importe en vrai)
2. Faire un ou des insert pour rajouter 2 personnes qui ont comme name 'Sakhri', 2 personnes qui ont comme first name 'Lisa' et dans le lot, 2 qui ont plus de 60 ans, et une personne bonus en plus pour le plaisir
3. Faire une requête pour récupérer la personne qui a l'id 3
4. Faire une requête pour récupérer les personnes dont le first_name est Lisa
5. Faire une requête pour récupérer les personnes qui ont plus de 50 ans
6. Faire une requête pour récupérer les personnes qui ont comme name Sakhri et qui ont moins de 60 ans
7. Faire une requête pour récupérer les personnes qui ne s'appellent pas Lisa
8. Faire une requête pour récupérer les personnes qui ont entre 30 et 60 ans
9. Faire une requête pour récupérer les pesronnes dont le first name commence par un L (il faudra utiliser le LIKE pour ça, je vous laisse chercher la doc)
10. Utiliser le CONCAT dans un SELECT pour afficher une colonne full_name qui sera une concaténation du first_name et du name (pareil, je vous laisse chercher la doc)
**Bonus (plus compliqué)** Récupérer les personnes qui n'étaient pas nées en 1995 (et que la requête marche même si on est pas en 2024)

#### Order et Limit
1. En utilisant le ORDER BY récupérer les personnes ordonnées par leur name de A à Z
2. En utilisant le ORDER BY toujours, récupérer les personnes de la plus jeune à la moins jeune
3. En utilisant le LIMIT en plus du ORDER BY, afficher les 3 personnes les plus agées
4. En utilisant le ORDER BY aller chercher les personnes avec le first_name de A à Z en premier et de la plus agée à la moins agée en deuxième (même requête, même order by, 2 critères)


#### Select Jointure
1. Faire une requête qui va récupérer toutes les addresses de la person 5
2. Faire une requête pour récupérer le name des persons qui possèdent une address à Grenoble
3. Faire une requête pour récupérer les addresses qui appartiennent à la famille Sakhri
4. Faire une requête pour récupérer les addresses qui appartiennent aux personnes avec le prénom Lisa et situées dans le 38
5. Faire une requête qui récupère les persons de la plus âgée à la moins âgée qui ont une address dans une rue (plutôt qu'une avenue ou un boulevard, un chemin etc.)