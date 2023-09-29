# 1:Trouver toutes les informations des membres qui sont conducteurs.

SELECT *
from members
where is_ride_owner = 1



#2:Compter le nombre de villes d’où sont parties des courses.
SELECT count(DISTINCT starting_city_id) as 'Total_cities_dep'
from rides



#3:Afficher les informations sur les courses en les classant selon le prix de la course par passager (par ordre décroissant). 
-- 1.3 Show information of all trips in descending order of price
select *
from rides
ORDER by contribution_per_passenger DESC;


#4:Afficher les informations des voitures dont la plaque d’immatriculation commence par un 9.
select *
from cars
where plate like '9%'


#5:Afficher les informations des voitures fabriquées avant 2000.
select *
from cars
where year <2000


#6:Quelle est la couleur de voiture la plus représentée ?
SELECT colour , COUNT(*) as 'total_num_color'
from cars
GROUP by colour
ORDER by total_num_color DESC;



#7:Afficher les informations des voitures de constructeurs françaisratings
SELECT DISTINCT maker
FROM cars

SELECT *
from cars
WHERE maker in ('Citroen','Renault');



#8:Quelle est la plus grande contribution par passager demandée ? La plus petite ?
SELECT min(contribution_per_passenger) as min_price, max(contribution_per_passenger) as max_price
from rides;


#9. Afficher les ids de chaque ville d’où sont parties des courses ?
select DISTINCT(starting_city_id)
from rides




# 2. Niveau intermédiaire
#1. Quelle est la proportion de conducteurs qui aiment les animaux ?
select
  (SELECT COUNT(*) as total_pet_pref
  from members
  WHERE pet_preference = 'yes' and is_ride_owner= 1)
/
  (SELECT COUNT(*) as driver
  from members
  where is_ride_owner =1) as ratio_pet_pref_tot_driver;
  
  
    
#2. Quelle est la note moyenne de chaque review ?
SELECT AVG(grades) as note_moyenne
from ratings



#3. Quelle est la note moyenne de chaque conducteur ?

SELECT rating_receiver_id,AVG(grades) as Avg, is_ride_owner
from ratings r
left join members m
	on r.rating_receiver_id= m.member_id
WHERE is_ride_owner=1
GROUP by rating_receiver_id




