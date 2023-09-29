SELECT id_produit, SUM(qstock) as 'Total_quantité'
from PRODUIT
GROUP by qstock
ORDER by Total_quantité;

select *
from PRODUIT

select *
from DETAIL

