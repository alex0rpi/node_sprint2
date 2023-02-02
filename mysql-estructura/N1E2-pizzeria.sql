-- Active: 1675335306434@@127.0.0.1@3306@pizzeria
DROP DATABASE pizzeria;
CREATE SCHEMA IF NOT EXISTS pizzeria;
USE pizzeria;
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per ESBORRAR les taules en cas necessari
-- *--------------------------------------------------------------------------------------------
DROP TABLE clients;
DROP TABLE botigues;
DROP TABLE comandes;
DROP TABLE empleats;
DROP TABLE pizzes;
DROP TABLE categories;
DROP TABLE hamburgueses;
DROP TABLE begudes;
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per crear les taules
-- *--------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_client VARCHAR(100) NOT NULL,
    cognoms_client VARCHAR(100) NOT NULL,
    adreça VARCHAR(100) NOT NULL,
    codi_postal VARCHAR(50) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    telefon VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS botigues (
    botiga_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    adreça VARCHAR(100) NOT NULL,
    codi_postal VARCHAR(50) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS empleats (
    empleat_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    botiga_id INT,
    FOREIGN KEY (botiga_id) REFERENCES botigues(botiga_id),
    nif VARCHAR(50) NOT NULL,
    telefon VARCHAR(100) NOT NULL UNIQUE,
    rol ENUM('cuiner', 'repartidor')
);
CREATE TABLE IF NOT EXISTS categories (
    categoria_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_categoria VARCHAR(20) NOT NULL
);
CREATE TABLE IF NOT EXISTS productes (
    producte_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipus_producte ENUM ('pizza', 'hamburguesa', 'beguda'),
    id_categoria_pizza INT,
    FOREIGN KEY (id_categoria_pizza) REFERENCES categories(categoria_id),
    nom VARCHAR(50) NOT NULL,
    descripcio VARCHAR(200) NOT NULL,
    imatge VARCHAR(200),
    preu NUMERIC(5, 2) NOT NULL
);
CREATE TABLE IF NOT EXISTS comandes (
    comanda_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    client_id INT,
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    data_hora DATETIME NOT NULL,
    modalitat ENUM('repartiment','domicili','recollida'),
    id_pizza INT,
    FOREIGN KEY (id_pizza) REFERENCES productes(producte_id),
    id_hamburguesa INT,
    FOREIGN KEY (id_hamburguesa) REFERENCES productes(producte_id),
    id_beguda INT,
    FOREIGN KEY (id_beguda) REFERENCES productes(producte_id),
    preu_total NUMERIC(5, 2) NOT NULL,
    botiga_id INT,
    repartidor_id INT,
    FOREIGN KEY (repartidor_id) REFERENCES empleats(empleat_id),
    hora_repartiment TIME NOT NULL
);

CREATE TABLE IF NOT EXISTS client_demana_producte (
    producte_id INT UNSIGNED NOT NULL,
    client_id INT UNSIGNED NOT NULL,
    PRIMARY KEY (producte_id, client_id),
    FOREIGN KEY (producte_id) REFERENCES productes(producte_id),
    FOREIGN KEY (client_id) REFERENCES clients(client_id),
    quantitat INT UNSIGNED NOT NULL
);

-- falta una tabla many to many (tabla intermedia)

-- *--------------------------------------------------------------------------------------------
-- *QUERIES per poblar les taules
-- *--------------------------------------------------------------------------------------------
INSERT INTO comandes (client_id, data_hora, modalitat, num_pizzes, num_hamburg, num_begudes, preu_total, botiga_id, repartidor_id, hora_repartiment)
VALUES
    (1, "2023-01-01 22:10:10", "repartiment", 2, 0, 1, 20.00, 1, 2, "11:00:00"),
    (1, "2023-01-02 21:10:10", "recollida", 0, 1, 2, 20.00, 1, null, "11:00:00"),
    (1, "2023-01-03 20:10:10", "recollida", 1, 1, 2, 20.00, 1, null, "11:00:00"),
    (2, "2023-01-04 19:10:10", "domicili", 2, 0, 3, 20.00, 2, null, "11:00:00"),
    (3, "2023-01-04 20:10:10", "repartiment", 2, 1, 3, 20.00, 2, 4, "11:00:00"),
    (3, "2023-01-02 20:10:10", "repartiment", 2, 2, 1, 20.00, 2, 4, "11:00:00"),
    (4, "2023-01-04 18:10:10", "recollida", 4, 0, 6, 20.00, 3, null, "11:00:00"),
    (4, "2023-01-05 21:10:10", "domicili", 3, 0, 2, 20.00, 3, null, "11:00:00"),
    (5, "2023-01-02 20:30:10", "recollida", 0, 1, 1, 20.00, 3, null, "11:00:00"),
    (6, "2023-01-03 21:30:10", "repartiment", 0, 3, 3, 20.00, 3, 6, "11:00:00");
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
INSERT INTO begudes (nom, descripcio, imatge, preu)
VALUES
    ("estrella", "regular lager beer", null, 2.10),
    ("volldum", "joviejos beer", null, 2.10),
    ("cola", "soda sugar black water", null, 2.50),
    ("water", "plastic bottle water 75cl", null, 3);
INSERT INTO hamburgueses (nom, descripcio, imatge, preu)
VALUES
    ("tofu_burguer", "for anyone who likes this kind of thing", null, 10.90),
    ("chicken burguer", "the healthiest one, you get thinner garanteed", null, 10.90),
    ("250g good burger", "from happy cows", null, 10.90);
INSERT INTO pizzes (nom, descripcio, id_categoria, imatge, preu)
VALUES
    ("manchego", "all the cheese in the world", 1, "C/users/pepito/documents/img/pizzes/manchego.png", 8.90),
    ("boloñesa", "dont have macarroni but at least youll be happy", 1, "C/users/pepito/documents/img/pizzes/boloñesa.png", 6.90),
    ("tomatini", "tasty delicious local vegetables", 2, "C/users/pepito/documents/img/pizzes/tomatini.png", 14.90),
    ("tofu", "not so tasty but some people order this", 2, "C/users/pepito/documents/img/pizzes/tofu.png", 12.90),
    ("gorlomi", "this is the one", 3, "C/users/pepito/documents/img/pizzes/gorlomi.png", 13.90),
    ("decoco", "for hipsters who have extra cash", 3, "C/users/pepito/documents/img/pizzes/decoco.png", 16.90);
-- *--------------------------------------------------------------------------------------------
-- *QUERIES de comprovació
-- *--------------------------------------------------------------------------------------------
-- *Llista quants productes de tipus "Begudes" s'han venut en una determinada localitat.
SELECT * FROM comandes WHERE num_begudes > 0;
-- *Llista quantes comandes ha efectuat un determinat empleat.
/* Entenc que ha de tractar-se d'un empleat repartidor, ja que només emmagatzemo el nom del 
repartidor quan es tracta d'una comanda de lliurament a domicili. */
SELECT COUNT(comanda_id) FROM comandes WHERE repartidor = "Peppy";

