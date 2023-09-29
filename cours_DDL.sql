DROP TABLE if EXISTS clients;	-- chaque requête finit par un " ; "

CREATE TABLE clients (			-- Pensez à écrire des commentairesdemo
  id_client VARCHAR(255),		-- Une requête est composé de multiples instructions,
  name VARCHAR(255),			-- séparées par " , "
  first_name VARCHAR(255),
  email VARCHAR(255),
  home VARCHAR(255),
  phone VARCHAR(255),
  PRIMARY KEY(id_client)		-- Il faut définir nos clés
  );			


DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
  id_order INTEGER NOT NULL AUTO_INCREMENT,
  id_client varchar(255) NOT NULL,
  date_order DATE NULL DEFAULT NULL,
  PRIMARY KEY (id_order),
  FOREIGN KEY (id_client) REFERENCES clients (id_client)
  ON DELETE CASCADE
  ON UPDATE CASCADE
);

DROP TABLE IF EXISTS shipping;

CREATE TABLE shipping(
  id_shipping INTEGER NOT NULL AUTO_INCREMENT,
  id_order INTEGER NOT NULL,
  shipping_date DATE NULL DEFAULT NULL,
  shipping_price INTEGER NOT NULL,
  total_price INTEGER NOT NULL,
  PRIMARY KEY (id_shipping),
  CHECK(shipping_price < total_price), -- check s'applique à toutes les lignes
  FOREIGN KEY(id_order) REFERENCES orders(id_order)
  ON DELETE CASCADE
  ON UPDATE CASCADE
  );

ALTER TABLE orders ADD FOREIGN KEY(id_client) REFERENCES clients(id_client);

ALTER TABLE clients MODIFY COLUMN first_name CHAR(100);

ALTER TABLE clients ADD tel CHAR(100);

ALTER TABLE clients DROP tel; 


INSERT INTO clients values ('B062','GOFFIN','Raphael',
                            'raphael.goffin@gmail.com','72 r. de la Gare', '0632432325');


INSERT INTO orders values(30678,
                          'B078',
                          date('20181201'));
                          


INSERT INTO orders values(30678,
                          'B062',
                          date('20181201'));

UPDATE clients SET name = 'TARTAMPION' where id_client = 'B062'

DELETE FROM clients where name = 'TARTAMPION'


DELETE FROM orders where id_client = 'B062';
DELETE FROM clients where name = 'TARTAMPION';

                          


  