
SELECT * FROM COMMANDE ;

--

SELECT * FROM COMMANDE limit 1 ;

--

SELECT DISTINCT datecom FROM COMMANDE ;

--

Select nom
From CLIENT
Where localite = 'Toulouse' ;

--

SELECT id_commande
FROM DETAIL
WHERE QCOM > 20 AND QCOM < 100 ; 

--

SELECT id_commande
FROM DETAIL
WHERE QCOM > 20 OR QCOM < 100; 

--

SELECT id_produit
FROM PRODUIT
WHERE QSTOCK IS NULL ;

--

Select nom
From CLIENT
Where localite in ('Toulouse','Lyon'); 

--

Select NOM
From CLIENT
Where localite in ('Toulouse','Lille','Bruxelles'); 

--

SELECT id_commande
FROM DETAIL
WHERE QCOM BETWEEN 20 AND 100; 

--

Select id_produit
From PRODUIT
Where DESCRIPTION_PRODUIT LIKE '%brosse%'; 

--

Select id_produit
From PRODUIT
Where DESCRIPTION_PRODUIT LIKE '%UBrush%'; 

--

SELECT *
FROM DETAIL
ORDER BY QCOM DESC;

-- 

Select id_client , NOM , SOLDE
FROM CLIENT
ORDER BY NOM , SOLDE DESC

--

Select id_client , NOM , SOLDE
FROM CLIENT
ORDER BY 2 , 3 DESC

--

SELECT count(*),localite
FROM CLIENT
GROUP BY localite 

--
SELECT avg(PRIX) as prix_moyen
FROM PRODUIT
ORDER BY prix_moyen DESC;

--

SELECT avg(PRIX) as prix_moyen
FROM PRODUIT p
ORDER BY prix_moyen DESC;

--

SELECT sum(solde) as Solde_total, LOCALITE 
FROM CLIENT
GROUP BY LOCALITE
ORDER By Solde_total ASC ;

--

SELECT sum(QCOM) as Total_quantity, id_produit
FROM DETAIL
GROUP BY id_produit
ORDER By Total_quantity DESC ;

--

SELECT sum(QCOM) as Total_quantity, id_produit
FROM DETAIL
GROUP BY id_produit
HAVING Total_quantity > 100
ORDER By Total_quantity DESC ;

-- 

SELECT COUNT(*) AS total , localite
FROM CLIENT 
GROUP BY localite 
HAVING total BETWEEN 3 AND 5

--

SELECT localite, SUM(solde) AS solde_par_localite
FROM CLIENT
GROUP BY localite 
HAVING solde_par_localite < 0

--

select   p.qstock , d.qcom  
from DETAIL d
inner join PRODUIT p
	on d.id_produit = p.id_produit

--

select  p.DESCRIPTION_PRODUIT, p.qstock - d.qcom   as stock_residuel
from DETAIL d
inner join PRODUIT p
	on d.id_produit = p.id_produit
	
--

SELECT sum(D.QCOM*P.PRIX) as montant
FROM DETAIL D
INNER JOIN PRODUIT P
    ON D.id_produit = P.id_produit 
WHERE P.description_produit like 'Brosse%';