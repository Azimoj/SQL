
	------ Morning class --------

SELECT m.member_id, maker
FROM cars as c 
INNER JOIN member_car as m 
ON c.car_id = m.car_id

SELECT m.member_id, maker
FROM cars as c 
LEFT JOIN member_car as m 
ON c.car_id = m.car_id


SELECT m.member_id, maker
FROM cars as c 
RIGHT JOIN member_car as m 
ON c.car_id = m.car_id 


SELECT m.last_name , message_id , body
FROM members m
LEFT JOIN  messages ms
ON m.member_id = ms.sender_id


-- Attention : full join ne s'éxécute pas code à illustrer pas exécuter : 

SELECT m.member_id, maker
FROM cars as c 
FULL JOIN member_car as m 
ON c.car_id = m.car_id 

-- simple illustration :

LEFT JOIN member_car AS m
RIGHT JOIN member_car AS m
FULL JOIN member_car AS m
INNER JOIN member_car AS m
ON c.car_id = m.car_id; 
ON c.car_id = m.car_id AND c.type = m.TypeCar; 

-------- 

SELECT c.car_id, maker 
FROM cars as c 
LEFT JOIN member_car AS m  
on c.car_id = m.car_id

UNION 

SELECT c.car_id, maker 
FROM cars as c 
LEFT JOIN member_car AS m  
on c.car_id = m.car_id;


SELECT *
FROM cars as c
WHERE c.car_id < 5

UNION 

SELECT *
FROM cars as c
where c.car_id > 10;



SELECT *
FROM cars as c
WHERE c.car_id < 5

UNION ALL 

SELECT *
FROM cars as c
where c.car_id > 10;


SELECT DISTINCT * FROM `cars` c
WHERE c.car_id IN (
  SELECT c.car_id
  FROM `cars` c
);

-- Why it worked without aliasing?
SELECT * 
FROM cars c 
WHERE c.`year` > (SELECT avg(`year`) from cars c2);



-- Why it doesn't work?
SELECT * 
FROM(SELECT maker, car_id 
     FROM cars c);

-- Why it worked?
SELECT * 
FROM(SELECT Maker, car_id
     FROM cars c) as sb;


SELECT COUNT(maker) AS nb_maker, (SELECT COUNT(car_id)FROM cars) AS nb_cars
FROM cars  
GROUP BY maker;


SELECT *
FROM cars c 
WHERE c.year > (SELECT AVG('year') from cars c2);




-- How to read this query?
SELECT * 
FROM cars c 
WHERE maker IN (SELECT DISTINCT sb.maker 
				FROM (SELECT * 
						FROM cars c3 
						WHERE c3.`year` >(SELECT avg(c2.`year`)
								   FROM cars c2)) as sb);


SELECT DISTINCT *
FROM cars c 
WHERE c.car_id IN (SELECT c2.car_id
					FROM cars c2
					WHERE c2.colour = 'red'
					);

SELECT DISTINCT * 
FROM cars c
WHERE EXISTS (SELECT c2.car_id
				FROM cars c2
				WHERE c2.colour = 'red');
				
				
select id_client
from CLIENT c
where exists (select *
              from COMMANDE cm
              where c.id_client = cm.id_client);






