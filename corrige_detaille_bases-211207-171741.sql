-- 1.1 Find the members information of each driver

-- Hint : 

-- Le format de base d'une requete SQL est le SFW : select from where
-- dans les tables disponibles, il faut trouver celle qui contient entre autre le nom des drivers
-- La table 'member' contient tous les noms de membres, c'est cette table qu'il faut sélectionner dans le 'FROM'

-- La documentation de la base de données montre que la table member contient l'attribut 'is_ride_owner' qui vaut 1 ou 0 selon le membre
-- il faut donc sélectionner les membres qui sont des conducteurs, soit les membres dont l'attribut 'is_ride_owner' vaut 1
-- -> C'est la condition du where


-- Final : 

SELECT *
FROM `members`
Where is_ride_owner = '1' ;
 
-- 1.2 Count the number of different cities of departure


-- Hint : 

-- on identifie d'abord avec la doc où se trouve les différentes villes de départ 
-- c'est la table Ride qui contient l'information starting_cities_id

-- Pour compter un nombre d'occurences on connaît la fonction d'agrégation COUNT()
-- on pourrait être tenté d'utiliser 
SELECT COUNT(starting_city_id) -- pour trouver la solution 
-- Attention : cette requête se contente de compter le nombre de lignes dans la colonne starting_city_id, 
-- Pour ne pas compter les doublons, on se rappelle de DINSTINCT, la commande qui permet d'éviter les redondances en ne prenant que les valeurs uniques !
-- C'est exactement ce qu'on veut : compter les valeurs uniques de starting_city_id


-- Final : 

SELECT COUNT(DISTINCT starting_city_id) 
FROM rides;



-- 1.3 Show information of all trips in descending order of price 

-- On comprend que ce sont les informations de la table rides qui nous intéresse 
-- D'après les différents attributs on comprend que le prix correspond à l'attribut contribution_per_passenger
SELECT *
FROM rides
-- ici les informations ne sont pas donner de manière classée, pour classer on connait la commande ORDER BY
-- Nous voulons ordonner sur la colonne contribution_per_passenger, par ordre décroissant, il faut donc préciser le mot clé DESC 

-- Final : 

SELECT *
FROM rides 
ORDER BY contribution_per_passenger DESC;


-- 1.4 Show car information for all cars with a license plate that begin by “9”

-- Les informations requises sont disponibles dans la table car
-- Le where portera sur l'attribut plate qui contient chaque numéro de plaque d'immatriculation
-- On doit spécifier le format requis : les plaques qui commencent par 9
-- On se souvient du mot clé LIKE qui permet de préciser ce qu'on cherche, la doc complète est disponible au lien https://sql.sh/cours/where/like

-- ce qui nous intéresse ici est LIKE '9%' qui permet de sélectionner toutes les lignes qui commencent par 9, quelque soit ce qui suit

-- Final : 


SELECT *
FROM cars 
WHERE plate LIKE '9%';

-- 1.5 Show car information of all cars made before 2000

-- Comme ci-dessus les informations requises sont dans la table cars
-- Le where porte sur l'attribut year qui contient l'année de fabrication de chaque car 
-- On sait qu'on peut utiliser des opérateurs logiques (=,<,>=, <>) dans le WHERE pour comparer la valeur de chaque ligne avec un valeur souhaitée 
-- Notre test est ici 'year' < 2000 

-- Final : 

SELECT *
FROM cars  
WHERE `year` < 2000;

-- 1.6 What is the most represented color of car ?

-- Les informations sur la couleur sont présentes dans la table cars
-- On veut compter le nombre de voiture de chaque vouleur, on se doute que nous allons avoir besoin de la fonction d'agrégation COUNT(colour)
-- Cependant COUNT(colour) se contente de compter le nobmre de lignes dans la colonne colour
-- La commande COUNT(DINSTINCT colour) ne résout rien : elle compte le nombre de couleur différentes présentes dans la colonne
-- Ce que nous voulons c'est compter le nombre de valeurs pour chaque couleur. 
-- On veut donc séparer notre table en plusieurs groupes de voitures de même couleur, puis compter le nombre de valeurs dans chacun de ces groupes
-- C'est le moment d'utiliser la commande GROUP BY :


SELECT colour, COUNT(colour) 
FROM cars
GROUP BY colour;

-- le plus gros du travail est fait, la requête a divisé la table en groupes de voiture de couleur différentes, groupes auxquels a été appliquée la fonction count
-- Maintenant, on veut ordonner les valeurs pour voir apparaître la plus grande, il faut utiliser un order by
-- pour plus de clarté on peut renommer la colonne COUNT(colour) en nb_car 

-- Final : 


SELECT colour, COUNT(colour) AS nb_car 
FROM cars
GROUP BY colour
ORDER BY nb_car DESC;

-- 1.7 What are the different “ids” of the French brands that make up your customer base? Hint: Renault & Citroën are the only French cars

-- Les informations se trouvent dans la table cars,
-- les différentes marques de voitures sont renseignés dans l'attribut Make de la table
-- on ne peut pas comme en 1.5 et utiliser l'opérateur = 
WHERE maker = 'citroen'
-- c'est impossible car nous voulons que la condition intègre plusieurs marques
-- le mot clé IN permet de demander plusieurs valeurs à la commande WHERE 

-- Final : 

SELECT car_id, maker
FROM cars
WHERE maker IN ('Citroen', 'Renault');

--1.8 The maximum price asked? The minimum?

-- C'est dans la table rides qui sont renseignées les prix demandés pour chaque course, sous l'attribut contribution_per_passenger
-- Après la fonction COUNT, ce sont les fonctions d'agrégation MAX et MIN que l'on peut utiliser pour trouver la valeur maximale et minimale de l'attibut
-- Pour plus de clarté on pense à nommer les colonnes crées par l'utilisation de fonctions d'agrégation

-- Final :  

SELECT MAX(contribution_per_passenger) as max_price, MIN(contribution_per_passenger) as min_price
FROM rides  ;

-- 1.9 Show all different departure cities ids

-- on nous demande presque la même chose qu'en 1.2 mais nous n'avons plus besoin de compter le nombre d'ids diférrents, simplement de les afficher.
-- On se rappelle du mot clé DISTINCT qui permet de prendre en compte uniquement les valeurs uniques 

-- Final :

SELECT DISTINCT starting_city_id
From rides;


-- Intermédiaire : 

-- 2.1 What’s the proportion of drivers liking pets?

-- Nous voulons calculer un ratio, l'idée est d'avoir le nombre de conducteurs qui acceptent les animaux, le nombre de conducteurs, puis d'en calculer le rapport
-- Commençons par le plus facile : le nombre de conducteurs, nous l'avons déjà presque fait auparavant : 
SELECT count(*) -- count(*) permet de compter le nombre de lignes d'une table, count(n_colonne) permet de compter les lignes d'une colonne en excluant les valeurs NULL
FROM members
WHERE is_ride_owner = 1;

-- Maintenant comptons le nombre de conducteurs qui acceptent les animaux 
-- les membres que l'on sélectionne doivent respecter deux conditions portant sur deux colonnes distinctes, le mot clé AND permet de préciser plusieurs pré-requis 
SELECT count(*)
from members
WHERE is_ride_owner = 1 AND pet_preference = 'yes';

-- A ce stade il est possible de faire les deux requêtes, de noter les résultats et de faire le rapport à la main, mais on peut faire tout ça en une seule requête !
-- chaque requête ci-dessus renvoie un nombre, en SQL il suffit donc de "diviser" le résultat de chaque requête puis de l'afficher comme ci-dessous : 

SELECT
	(SELECT COUNT(*) 
	FROM `members` m 
	WHERE pet_preference = 'yes' AND is_ride_owner = 1) / -- le '/' pour diviser le résultat de l'un par l'autre , chaque expression entre parenthèse est complétée avant
	(SELECT COUNT(*) 
	FROM `members` m2
	WHERE is_ride_owner = 1) as likes_pets;

--2.2 What is the mean rating of all reviews ?

-- La moyenne demande une nouvelle fonction d'agrégation : AVG()
-- Les notes des reviews sont disponibles dans la table ratings, à l'attribut grades

SELECT AVG(grades) as average_grade
FROM ratings  ;

--2.3 What is the mean rating of each driver

-- Nous allons à nouveau devoir utiliser la fonction AVG, mais nous devons cette fois-ci calculer cette moyenne pour chaque conducteur
-- Il faut donc grouper les notes par conducteur et calculer les moyennes de chacun de ces groupes, comme en 1.6 il va falloir faire un group by
-- Dans la table ratingss, nous avons accès aux notes, et aux ids des membres notés
-- Attention, tous les membres sont notés, pas seulement les conducteurs.
-- On peut commencer par calculer et afficher la note moyenne de chaque membre : 

SELECT AVG(grades) as average_grade, rating_receiver_id
FROM ratings 
GROUP BY rating_receiver_id;

-- Maintenant que c'est fait il ne faut garder que les conducteurs
-- Problème : l'information n'est pas accessible dans la table ratings
-- La seule table où l'information est accessible est la table members par l'attribut is_ride_owner
-- il nous faut donc réaliser un INNER JOIN pour réunir les deux tables
-- Il faut spécifier les attributs de chaque table sur lequel réaliser la jointure.
-- On va pouvoir lier les deux tables par l'ID des personnes que l'on retrouve dans les deux tables,
-- on va donc lier l'attribut rating_receiver_id de la table ratings et l'attribut id de la table members

-- Avec l'inner join il est possible de sélectionner les notes qui appartiennent uniquement à des conducteurs :
SELECT grades, rating_receiver_id
FROM ratings r  						-- Pour facilier la syntaxe on peut donner un alias à sa table pour raccourcir son nom
INNER JOIN members on members.member_id = r.rating_receiver_id  -- on lie les deux tables grâce aux ids des membres et aux ids des receveurs de note qui se recoupent 
WHERE members.is_ride_owner = '1'						-- On joint uniquement pour les ids qui correspondent à des conducteurs

-- Il ne nous reste plus qu'à entremêler ces deux requêtes : faire la jointure puis utiliser la fonction d'agrégation : 


SELECT AVG(grades) as average_grade, rating_receiver_id
FROM ratings r
INNER JOIN `members`on `members`.member_id = r.rating_receiver_id
WHERE `members`.is_ride_owner = '1'
GROUP BY rating_receiver_id;


