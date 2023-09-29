-- Create a new database and create these tables

DROP TABLE IF EXISTS CLIENT;
create table CLIENT
(id_client char(4) not null,
 NOM  varchar(12) not null,
 ADRESSE varchar(20) not null,
 LOCALITE varchar(12) not null,
 SOLDE decimal(9,2) not null,
 primary key (id_client));

DROP TABLE IF EXISTS COMMANDE;
create TABLE COMMANDE
(id_commande char(5) not null,
id_client char(4) not null,
DATECOM date not null,
primary key (id_commande));
alter table COMMANDE add foreign key (id_client) references CLIENT (id_client);

DROP TABLE IF EXISTS PRODUIT;
create TABLE PRODUIT
(id_produit char(5) not null,
DESCRIPTION_PRODUIT varchar (20) not null,
PRIX decimal (5,0) not null,
QSTOCK decimal (6,0),
primary key (id_produit));

DROP TABLE IF EXISTS DETAIL;
create TABLE DETAIL
(id_commande char(5) not null,
id_produit char(5) not null,
QCOM decimal (4,0) not null,
primary key (id_commande,id_produit));
alter table DETAIL add foreign key (id_commande) references COMMANDE (id_commande);
alter table DETAIL add foreign key (id_produit) references PRODUIT (id_produit);

-- Insert data

insert into CLIENT values ('B062','GOFFIN'      ,'72, r. de la Gare'   ,'Lyon' ,-3200);
insert into CLIENT values ('B112','HANSENNE'    ,'23, a. Dumont'       ,'Poitiers' ,1250.00);
insert into CLIENT values ('B332','MONTI'       ,'112, r. Neuve'       ,'Geneve'   ,0);
insert into CLIENT values ('B512','GILLET'      ,'14, r. de l''Ete'    ,'Toulouse' ,-8700);
insert into CLIENT values ('C003','AVRON'       ,'8, ch. de la Cure'   ,'Toulouse' ,-1700);
insert into CLIENT values ('C123','MERCIER'     ,'25, r. Lemaitre'     ,'Lyon'    ,-2300);
insert into CLIENT values ('C400','FERARD'      ,'65, r. du Tertre'    ,'Poitiers' ,350);
insert into CLIENT values ('D063','MERCIER'       ,'201, bvd du Nord'  ,'Toulouse' ,-2250);
insert into CLIENT values ('F010','TOUSSAINT'   ,'5, r. Godefroid'     ,'Poitiers' ,0);
insert into CLIENT values ('F011','PONCELET'    ,'17, Clos des Erables','Toulouse' ,0);
insert into CLIENT values ('F400','JACOB'       ,'78, ch. du Moulin'   ,'Bruxelles',0);
insert into CLIENT values ('K111','VANBIST'     ,'180, r. Florimont'   ,'Lille'    ,720);
insert into CLIENT values ('K729','NEUMAN'      ,'40, r. Bransart'     ,'Toulouse' ,0);
insert into CLIENT values ('L422','FRANCK'      ,'60, r. de Wepion'    ,'Lyon'    ,0);
insert into CLIENT values ('S127','VANDERKA'    ,'3, av. des Roses'    ,'Lyon'    ,-4580);
insert into CLIENT values ('S712','GUILLAUME'   ,'14a, ch. des Roses'  ,'Paris'    ,0);

insert into PRODUIT values ('CS262','Brosse_dent_2018',  300,  45);
insert into PRODUIT values ('CS264','Brosse_dent_2019', 320,269);
insert into PRODUIT values ('CS464','Brosse_dent_2020', 400, 450);
insert into PRODUIT values ('PA45' ,'Cable_alim',5, 50);
insert into PRODUIT values ('PA60' ,'Dentifrice', 10, 10340);
insert into PRODUIT values ('PH222','UBrush_enfant',  30, 782);
insert into PRODUIT values ('PS222','UBrush_adulte',  60,1220);

insert into COMMANDE values ('30178','K111','20181201');
insert into COMMANDE values ('30179','C400','20181202');
insert into COMMANDE values ('30189','K111','20181220');
insert into COMMANDE values ('30182','S127','20181223');
insert into COMMANDE values ('30184','C400','20181223');
insert into COMMANDE values ('30186','C400','20181231');
insert into COMMANDE values ('30185','F011','20190102');
insert into COMMANDE values ('30188','B512','20190103');


insert into DETAIL values ('30178','CS464',25);
insert into DETAIL values ('30179','PA60',20);
insert into DETAIL values ('30179','CS262',60);
insert into DETAIL values ('30182','PA60',30);
insert into DETAIL values ('30184','CS464',120);
insert into DETAIL values ('30184','PA45',20);
insert into DETAIL values ('30185','PA60',15);
insert into DETAIL values ('30185','PS222',60);
insert into DETAIL values ('30185','CS464',260);
insert into DETAIL values ('30186','PA45',3);
insert into DETAIL values ('30188','PA60',70);
insert into DETAIL values ('30188','PH222',92);
insert into DETAIL values ('30188','CS464',180);
insert into DETAIL values ('30188','PA45',22);
insert into DETAIL values ('30189','CS464',10);
insert into DETAIL values ('30189','PA60',50);
