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