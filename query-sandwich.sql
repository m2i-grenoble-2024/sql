-- Commencer une nouvelle commande
INSERT INTO commande (order_date,status) VALUES (NOW(), 'awaiting');

-- Récupérer les sandwich d'une commande donnée
SELECT * FROM sandwich 
LEFT JOIN commande ON commande.id=sandwich.commande_id 
WHERE commande_id=6;

-- Ajouter un sandwich à une commande
INSERT INTO sandwich (commande_id) VALUES (6);

-- Afficher la liste des pains puis des prot, puis des garnish, puis des sauces
SELECT * FROM ingredient WHERE type='bread';
SELECT * FROM ingredient WHERE type='protein';
SELECT * FROM ingredient WHERE type='garnish';
SELECT * FROM ingredient WHERE type='sauce';
-- Ajouter un ingrédient à un sandwich
INSERT INTO sandwich_ingredient (ingredient_id,sandwich_id) VALUES (2, 7);

-- Afficher le récap d'un sandwich
SELECT * FROM sandwich
INNER JOIN sandwich_ingredient ON sandwich.id=sandwich_ingredient.sandwich_id
INNER JOIN ingredient ON sandwich_ingredient.ingredient_id=ingredient.id
WHERE sandwich.id=5;

SELECT *, SUM(ingredient.price) AS total FROM sandwich
INNER JOIN sandwich_ingredient ON sandwich.id=sandwich_ingredient.sandwich_id
INNER JOIN ingredient ON sandwich_ingredient.ingredient_id=ingredient.id
WHERE sandwich.id=2
GROUP BY sandwich.id;

-- Aller chercher une commande avec ses sandwich et leurs ingrédients et le total de chaque sandwich
SELECT commande.*,GROUP_CONCAT(ingredient.name),SUM(ingredient.price) AS total FROM commande
INNER JOIN sandwich ON commande.id=sandwich.commande_id
INNER JOIN sandwich_ingredient ON sandwich.id=sandwich_ingredient.sandwich_id
INNER JOIN ingredient ON sandwich_ingredient.ingredient_id=ingredient.id
WHERE commande.id=2
GROUP BY sandwich.id;


-- Afficher commande et depuis quand elle a été passée
SELECT *, TIMESTAMPDIFF(MINUTE, NOW(), order_date) FROM commande WHERE id=5;

-- Afficher l'heure des commande en attente et le nombre de sandwich contenus dans chaque commande
SELECT TIME(order_date) AS order_time, SUM(sandwich.quantity) AS sandwich_nb FROM commande 
INNER JOIN sandwich ON sandwich.commande_id=commande.id
WHERE status='awaiting'
GROUP BY commande.id;


-- Mettre à jour le status d'une commande et modifier son order_date
UPDATE commande SET status='delivered', order_date=NOW() WHERE id=4;