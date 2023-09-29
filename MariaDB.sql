ALTER TABLE orders ADD FOREIGN KEY(id_client) REFERENCES clients(id_client);

ALTER TABLE clients MODIFY COLUMN first_name CHAR(100);

ALTER TABLE clients ADD tel CHAR(100);

ALTER TABLE clients DROP tel; 




INSERT INTO clients values ('B062','GOFFIN','Raphael',
                            'raphael.goffin@gmail.com','72 r. de la Gare', '0632432325');
SELECT *
from clients

INSERT INTO orders values(30678,
                          'B078',
                          date('20181201'));
                          