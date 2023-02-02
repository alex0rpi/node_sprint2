-- Active: 1675352630913@@127.0.0.1@3306@pizzeria
DROP DATABASE pizzeria;
CREATE SCHEMA IF NOT EXISTS pizzeria;
USE pizzeria;
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per ESBORRAR les taules en cas necessari
-- *--------------------------------------------------------------------------------------------
-- DROP TABLE clients;
-- DROP TABLE botigues;
-- DROP TABLE empleats;
-- DROP TABLE categories;
-- DROP TABLE productes;
-- DROP TABLE comandes;
-- DROP TABLE client_demana_producte;
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per crear les taules
-- *--------------------------------------------------------------------------------------------
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_client VARCHAR(100) NOT NULL,
    cognoms_client VARCHAR(100) NOT NULL,
    adreça VARCHAR(100) NOT NULL,
    codi_postal VARCHAR(50) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    telefon VARCHAR(100) NOT NULL
);
CREATE TABLE botigues (
    botiga_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    adreça VARCHAR(100) NOT NULL,
    codi_postal VARCHAR(50) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL
);

CREATE TABLE empleats (
    empleat_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    botiga_id INT,
    FOREIGN KEY (botiga_id) REFERENCES botigues(botiga_id),
    nif VARCHAR(50) NOT NULL,
    telefon VARCHAR(100) NOT NULL UNIQUE,
    rol ENUM('cuiner', 'repartidor')
);
CREATE TABLE categories (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_categoria VARCHAR(20) NOT NULL
);
CREATE TABLE productes (
    producte_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipus_producte ENUM ('pizza', 'hamburguesa', 'beguda'),
    id_categoria_pizza INT,
    FOREIGN KEY (id_categoria_pizza) REFERENCES categories(categoria_id),
    nom VARCHAR(50) NOT NULL,
    descripcio VARCHAR(200) NOT NULL,
    imatge VARCHAR(200),
    preu NUMERIC(5, 2) NOT NULL
);
CREATE TABLE comandes (
    comanda_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    data_hora DATETIME NOT NULL,
    modalitat ENUM('repartiment','domicili','recollida'),
    preu_total NUMERIC(5, 2) NOT NULL,
    botiga_id INT,
    repartidor_id INT,
    FOREIGN KEY (repartidor_id) REFERENCES empleats(empleat_id),
    hora_repartiment TIME NOT NULL
);

CREATE TABLE client_demana_producte (
    id_producte INT REFERENCES productes,
    id_comanda INT REFERENCES comandes,
    quantitat INT,
    PRIMARY KEY (id_producte, id_comanda),
    FOREIGN KEY (id_producte) REFERENCES productes(producte_id),
    FOREIGN KEY (id_comanda) REFERENCES comandes(comanda_id)
);
/* He decidit no incloure l'id client en la taula intermitja, a fi que una mateixa
comanda no pugui albergar més d'un unic client, tal com demana l'enunciat. */

-- *--------------------------------------------------------------------------------------------
-- *QUERIES per poblar les taules
-- *--------------------------------------------------------------------------------------------
INSERT INTO clients (nom_client, cognoms_client, adreça, codi_postal, localitat, provincia, telefon)
VALUES
    ("Mario", "Kart", "Acorn Plains 2", "08019", "Hospitalet", "BCN", "999999999"),
    ("Luigi", "Land", "Soda Jungle 3", "08018", "Hospitalet", "BCN", "899999999"),
    ("Toad", "Bros", "Lyer Cake Desert 4", "08017", "Hospitalet", "BCN", "799999999"),
    ("Bowser", "Galaxy", "Frosted Glacier 6", "08016", "Cornella", "BCN", "699999999"),
    ("Goomba", "World", "Sparkling Waters 8", "08015", "Palamos", "BCN", "599999999"),
    ("Turtle", "Stars", "Peach Castle 10", "08014", "Calonge", "GIR", "499999999");

INSERT INTO botigues (adreça, codi_postal, localitat, provincia)
VALUES
    ("Borrell 11", "08015", "Barcelona", "BCN"),
    ("Molist 16", "08008", "Abrera", "BCN"),
    ("Cuba 20", "08015", "Vilassar", "BCN");

INSERT INTO empleats (nom, cognoms, botiga_id, nif, telefon, rol)
VALUES
    ("Fox", "McCloud", 1, "47872216Q", "666666666", "cuiner"),
    ("James", "McCloud", 1, "47872216J", "666666661", "repartidor"),
    ("Falco", "Lomardi", 2, "47872216S", "666666665", "cuiner"),
    ("Peppy", "Hare", 2, "47872216P", "666666664", "repartidor"),
    ("Pigma", "Dengar", 3, "47872216I", "666666663", "cuiner"),
    ("Rob", "rob64", 3, "47872216R", "666666662", "repartidor");

INSERT INTO categories (nom_categoria) VALUES ("KIDS"), ("VEGGIE"), ("CARNIVORS");
INSERT INTO productes (tipus_producte, id_categoria_pizza, nom, descripcio, imatge, preu)
VALUES
    ("beguda",NULL,"estrella", "regular lager beer", "C/users/pepito/documents/img/pizzes/estrella.png", 2.10),
    ("beguda",NULL,"volldum", "joviejos beer", "C/users/pepito/documents/img/pizzes/volldum.png", 2.10),
    ("beguda",NULL,"cola", "soda sugar black water", "C/users/pepito/documents/img/pizzes/cola.png", 2.50),
    ("beguda",NULL,"water", "plastic bottle water 75cl", "C/users/pepito/documents/img/pizzes/water.png", 3),
    ("hamburguesa", NULL, "tofu_burguer", "for anyone who likes this kind of thing", "C/users/pepito/documents/img/pizzes/tofu.png", 10.90),
    ("hamburguesa", NULL, "chicken burguer", "the healthiest one, you get thinner garanteed", "C/users/pepito/documents/img/pizzes/chicken.png", 10.90),
    ("hamburguesa", NULL, "250g good burger", "from happy cows", "C/users/pepito/documents/img/pizzes/good.png", 10.90),
    ("pizza", 1, "manchego", "all the cheese in the world", "C/users/pepito/documents/img/pizzes/manchego.png", 8.90),
    ("pizza", 1, "boloñesa", "dont have macarroni but at least youll be happy", "C/users/pepito/documents/img/pizzes/boloñesa.png", 6.90),
    ("pizza", 2, "tomatini", "tasty delicious local vegetables", "C/users/pepito/documents/img/pizzes/tomatini.png", 14.90),
    ("pizza", 2, "tofu", "not so tasty but some people order this", "C/users/pepito/documents/img/pizzes/tofu.png", 12.90),
    ("pizza", 3, "gorlomi", "this is the one", "C/users/pepito/documents/img/pizzes/gorlomi.png", 13.90),
    ("pizza", 3, "decoco", "for hipsters who have extra cash", "C/users/pepito/documents/img/pizzes/decoco.png", 16.90);
INSERT INTO comandes (client_id, data_hora, modalitat, preu_total, botiga_id, repartidor_id, hora_repartiment)
VALUES
    (1, "2023-01-01 22:10:10", "repartiment", 20.00, 1, 2, "11:00:00"),
    (1, "2023-01-02 21:10:10", "recollida", 20.00, 1, null, "11:00:00"),
    (1, "2023-01-03 20:10:10", "recollida", 20.00, 1, null, "11:00:00"),
    (2, "2023-01-04 19:10:10", "domicili", 20.00, 2, null, "11:00:00"),
    (3, "2023-01-04 20:10:10", "repartiment", 20.00, 2, 4, "11:00:00"),
    (3, "2023-01-02 20:10:10", "repartiment", 20.00, 2, 4, "11:00:00"),
    (4, "2023-01-04 18:10:10", "recollida", 20.00, 3, null, "11:00:00"),
    (4, "2023-01-05 21:10:10", "domicili", 20.00, 3, null, "11:00:00"),
    (5, "2023-01-02 20:30:10", "recollida", 20.00, 3, null, "11:00:00"),
    (6, "2023-01-03 21:30:10", "repartiment", 20.00, 3, 6, "11:00:00");
INSERT INTO client_demana_producte (id_producte, id_comanda, quantitat)
VALUES
    (12,1,2),
    (2,1,2),
    (8,2,1),
    (9,2,2),
    (10,2,3),
    (13,3,1),
    (1,4,2),
    (2,4,3),
    (5,4,1),
    (6,5,2),
    (7,5,3),
    (2,5,4),
    (3,6,4),
    (4,6,2),
    (11,6,3);
-- *--------------------------------------------------------------------------------------------
-- *QUERIES de comprovació
-- *--------------------------------------------------------------------------------------------
-- *Llista quants productes de tipus "Begudes" s'han venut en una determinada localitat.
SELECT SUM(cli.quantitat) AS nombre_begudes_hospitalet FROM (SELECT * FROM productes WHERE tipus_producte = "beguda") pro JOIN client_demana_producte cli ON pro.producte_id = cli.id_producte JOIN comandes com ON cli.id_comanda = com.comanda_id JOIN clients clients ON com.client_id = clients.client_id WHERE clients.localitat = "hospitalet";

-- *Llista quantes comandes ha efectuat un determinat empleat.
/* Entenc que ha de tractar-se d'un empleat repartidor, ja que només emmagatzemo el nom del 
repartidor quan es tracta d'una comanda de lliurament a domicili. */
SELECT COUNT(com.comanda_id) AS nombre_comandes_fetes_per_un_repartidor FROM comandes com JOIN empleats emp ON com.repartidor_id = emp.empleat_id WHERE emp.nom = "Peppy";