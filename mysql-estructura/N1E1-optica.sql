-- Active: 1675784715320@@127.0.0.1@3306@optica_cul_ampolla
DROP DATABASE optica_cul_ampolla;
CREATE SCHEMA IF NOT EXISTS optica_cul_ampolla;
USE optica_cul_ampolla;
-- -- *--------------------------------------------------------------------------------------------
-- -- *QUERIES per ESBORRAR les taules en cas necessari
-- -- *--------------------------------------------------------------------------------------------
-- DROP TABLE proveidors;
-- DROP TABLE ulleres;
-- DROP TABLE clients;
-- DROP TABLE vendes;
-- -- *--------------------------------------------------------------------------------------------
-- -- *QUERIES per crear les taules
-- -- *--------------------------------------------------------------------------------------------
CREATE TABLE proveidors (
    proveidor_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom_proveidor VARCHAR(100) NOT NULL,
    adreça VARCHAR(200) NOT NULL,
    telefon VARCHAR(100) NOT NULL UNIQUE,
    fax VARCHAR(100) UNIQUE,
    nif VARCHAR(100) NOT NULL UNIQUE
);
-- *--------------------------------------------------------------------------------------------
CREATE TABLE marques (
    id_marca INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom_marca VARCHAR(50) NOT NULL UNIQUE,
    id_proveidor INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_proveidor) REFERENCES proveidors(proveidor_id) ON DELETE CASCADE
);
-- *--------------------------------------------------------------------------------------------
CREATE TABLE ulleres (
    ulleres_id INT AUTO_INCREMENT PRIMARY KEY not NULL,
    marca_id INT UNSIGNED,
    FOREIGN KEY(marca_id) REFERENCES marques(id_marca),
    graduacio_esq DECIMAL(4,2) NOT NULL,
    graduacio_dret DECIMAL(4,2) NOT NULL,
    tipus_muntura ENUM('flotant', 'pasta', 'metàl·lica') NOT NULL,
    color_muntura VARCHAR(50) NOT NULL,
    color_vidre_esq VARCHAR(50) NOT NULL,
    color_vidre_dret VARCHAR(50) NOT NULL,
    preu NUMERIC(5,2) NOT NULL
);
-- *--------------------------------------------------------------------------------------------
CREATE TABLE clients (
    client_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom VARCHAR(100) NOT NULL,
    adreça VARCHAR(200) NOT NULL,
    telefon VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    nif VARCHAR(100) NOT NULL UNIQUE,
    client_recomanador VARCHAR(100),
    data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- *--------------------------------------------------------------------------------------------
CREATE TABLE vendes(
    venda_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    empleat_venedor VARCHAR(100) NOT NULL,
    data_venda DATE NOT NULL,
    id_ullera_venuda INT,
    id_client INT,
    FOREIGN KEY (id_ullera_venuda) REFERENCES ulleres(ulleres_id),
    FOREIGN KEY (id_client) REFERENCES clients(client_id)
);
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per poblar les taules
-- *--------------------------------------------------------------------------------------------
INSERT INTO proveidors (nom_proveidor, adreça, telefon, fax, nif)
VALUES 
    ("Alfa", "Carrer 3 num 5 08085 TER SPAIN", "932093129", "934054844", "47872216W"),
    ("Bravo", "Carrer 7 num 1 08090 BAD SPAIN", "932043129", "935054844", "47872211X"),
    ("Charly", "Carrer 1 num 3 08081 BCN SPAIN", "932092129", "932054844", "47872216Q"),
    ("Delta", "Carrer 2 num 4 08082 SAB SPAIN", "932092120", "932054845", "47872216Y"),
    ("Echo", "Carrer 9 num 10 08070 GIR SPAIN", "952052120", "952054845", "47872216E");
-- -- *--------------------------------------------------------------------------------------------
INSERT INTO clients (nom, adreça, telefon, email, nif, client_recomanador)
VALUES 
    ("Mercuri", "Tallers 10, num 5 08012 BCN SPAIN", "913185677", "mercuri@mercuri.com", "47872216M", null),
    ("Venus", "Tigre 8, num 9 08019 BCN SPAIN", "913155577", "venus@venus.com", "47872216V", "Mercuri"),
    ("Mart", "Joaquim Costa 20, num 7 08013 BCN SPAIN", "913185977", "mart@mart.com", "47872216x", null),
    ("Saturn", "Elisabeths 30, num 2 08014 BCN SPAIN", "913185570", "saturn@saturn.com", "47872216S", "Mart");
-- -- *--------------------------------------------------------------------------------------------
INSERT INTO marques(nom_marca, id_proveidor)
VALUES
    ("TomFord",1),
    ("PRADA",1),
    ("Boss",2),
    ("Vogue",3),
    ("Emporio",4),
    ("Reebok",5);
INSERT INTO ulleres (marca_id, graduacio_esq, graduacio_dret, tipus_muntura, color_muntura, color_vidre_esq, color_vidre_dret, preu)
VALUES 
    (1, 2.5, 3.5, "metàl·lica", "blau", "blanc","verd fosc", 180.99),
    (1, 2.5, 3.5, "pasta", "groc", "blanc","gris clar", 90.99),
    (1, 2.5, 3.5, "flotant", "lila", "blanc","verd fosc", 70.99),
    (2, -2,-2, "metàl·lica", "vermell", "daurat","verd clar", 150.99),
    (2, -2,-2, "pasta", "negre", "daurat","groc clar", 125.99),
    (3, -4,-3.25, "pasta", "blau", "platejat","blau clar", 200.99),
    (3, -4,-3.75, "flotant", "coral", "platejat","verd fosc", 190.99),
    (4, -3.5,-3.5, "metàl·lica", "sepia", "negre","blau fosc", 50.99),
    (4, -3.5,-3.5, "flotant", "taronja", "negre","verd fosc", 60.99),
    (5, -8.5,-2.5, "pasta", "negre", "negre","blau fosc", 60.99),
    (5, -1.5,-0.5, "flotant", "blanc", "negre","gris clar", 60.99);
-- *--------------------------------------------------------------------------------------------
INSERT INTO vendes (empleat_venedor, data_venda, id_ullera_venuda, id_client)
VALUES
    ("Mario", '2022-11-10', 1, 1),
    ("Mario", '2023-10-09', 5, 2),
    ("Mario", '2023-12-08', 2, 3),
    ("Mario", '2022-11-10', 3, 3),
    ("Luigi", '2023-07-10', 3, 2),
    ("Luigi", '2022-09-10', 4, 1);
-- *--------------------------------------------------------------------------------------------
-- *QUERIES de comprovació
-- *--------------------------------------------------------------------------------------------
-- *Llista el total de compres d’un client/a.
SELECT ven.venda_id, cli.nom AS nom_client, ven.data_venda, ven.id_ullera_venuda, ven.empleat_venedor FROM vendes ven JOIN clients cli ON ven.id_client=cli.client_id WHERE cli.nom="Mercuri";

-- *Llista les diferents ulleres que ha venut un empleat durant un any.
SELECT * FROM vendes WHERE empleat_venedor = "Mario" AND YEAR(data_venda) = 2022;
SELECT * FROM vendes WHERE empleat_venedor = "Luigi" AND YEAR(data_venda) = 2023;

-- *Llista els diferents proveidors que han subministrat ulleres venudes amb èxit per l'òptica.
SELECT DISTINCT pro.nom_proveidor, ven.data_venda, mar.nom_marca, ull.ulleres_id
FROM vendes ven
JOIN ulleres ull
ON ven.id_ullera_venuda = ull.ulleres_id
JOIN marques mar
ON ull.marca_id
JOIN proveidors pro
ON mar.id_proveidor = pro.proveidor_id GROUP BY pro.nom_proveidor;