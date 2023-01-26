-- DROP DATABASE optica_cul_ampolla;
-- CREATE SCHEMA IF NOT EXISTS optica_cul_ampolla;
USE optica_cul_ampolla;
-- -- *--------------------------------------------------------------------------------------------
-- -- *QUERIES per ESBORRAR les taules en cas necessari
-- -- *--------------------------------------------------------------------------------------------
DROP TABLE proveïdors;
DROP TABLE ulleres;
DROP TABLE clients;
DROP TABLE vendes;
-- -- *--------------------------------------------------------------------------------------------
-- -- *QUERIES per crear les taules
-- -- *--------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS proveïdors (
    proveidor_id SERIAL PRIMARY KEY,
    nom_proveïdor VARCHAR(100) NOT NULL,
    adreça VARCHAR(200) NOT NULL,
    telefon VARCHAR(100) NOT NULL UNIQUE,
    fax VARCHAR(100) UNIQUE,
    nif VARCHAR(100) NOT NULL UNIQUE
);
-- *--------------------------------------------------------------------------------------------
CREATE TABLE ulleres (
    ulleres_id SERIAL PRIMARY KEY,
    nom_proveïdor VARCHAR(100) REFERENCES proveïdors(nom_proveïdor) ON DELETE CASCADE,
    marca VARCHAR(100) NOT NULL,
    graduacio VARCHAR(50) NOT NULL,
    tipus_muntura ENUM('flotant', 'pasta', 'metàl·lica') NOT NULL,
    color_muntura VARCHAR(50) NOT NULL,
    color_vidres VARCHAR(50) NOT NULL,
    preu FLOAT(5,2) NOT NULL
);
-- *--------------------------------------------------------------------------------------------
CREATE TABLE clients (
    client_id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    adreça VARCHAR(200) NOT NULL,
    telefon VARCHAR(100) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    nif VARCHAR(100) NOT NULL UNIQUE,
    client_recomanador VARCHAR(100),
    data_registre TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- *--------------------------------------------------------------------------------------------
CREATE TABLE vendes (
    venda_id SERIAL PRIMARY KEY,
    empleat_venedor VARCHAR(100) NOT NULL,
    data_venda DATE NOT NULL,
    marca_venuda VARCHAR(100) REFERENCES ulleres(marca) ON DELETE CASCADE,
    client VARCHAR(100) REFERENCES clients(nom)
);
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per poblar les taules
-- *--------------------------------------------------------------------------------------------
INSERT INTO vendes (empleat_venedor, data_venda, marca_venuda, client)
VALUES
    ("Mario", '2022-11-10', "TomFord", "Mercuri"),
    ("Mario", '2023-10-09', "Vogue", "Venus"),
    ("Mario", '2023-12-08', "PRADA", "Mart"),
    ("Mario", '2022-11-10', "PRADA", "Mart"),
    ("Luigi", '2023-07-10', "Emporio", "Venus"),
    ("Luigi", '2022-09-10', "Emporio", "Mercuri");
-- -- *--------------------------------------------------------------------------------------------
INSERT INTO proveïdors (nom_proveïdor, adreça, telefon, fax, nif)
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
INSERT INTO ulleres (nom_proveïdor, marca, graduacio, tipus_muntura, color_muntura, color_vidres, preu)
VALUES 
    ("Alfa", "TomFord", "2.5,3.5", "metàl·lica", "blau", "blanc", 180.99),
    ("Alfa", "TomFord", "2.5,3.5", "pasta", "groc", "blanc", 90.99),
    ("Alfa", "TomFord", "2.5,3.5", "flotant", "lila", "blanc", 70.99),
    ("Bravo", "PRADA", "-2,-2", "metàl·lica", "vermell", "daurat", 150.99),
    ("Bravo", "PRADA", "-2,-2", "pasta", "negre", "daurat", 125.99),
    ("Charly", "Vogue", "-4,-3.5", "pasta", "blau", "platejat", 200.99),
    ("Charly", "Vogue", "-4,-3.5", "flotant", "coral", "platejat", 190.99),
    ("Delta", "Emporio", "-3.5,-3.5", "metàl·lica", "sepia", "negre", 50.99),
    ("Delta", "Emporio", "-3.5,-3.5", "flotant", "taronja", "negre", 60.99),
    ("Echo", "Reebock", "-8.5,-2.5", "pasta", "negre", "negre", 60.99),
    ("Echo", "Reebock", "-1.5,-0.5", "flotant", "blanc", "negre", 60.99);
-- *--------------------------------------------------------------------------------------------
-- *QUERIES de comprovació
-- *--------------------------------------------------------------------------------------------
-- *Llista el total de compres d’un client/a.
SELECT * FROM vendes WHERE client="venus" ORDER BY empleat_venedor ASC;

-- *Llista les diferents ulleres que ha venut un empleat durant un any.
SELECT * FROM vendes WHERE empleat_venedor = "Mario" AND `data_venda` <= '2022-12-31';

-- *Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.
-- Entenc que he de fer INNER JOIN entre la taula proveidors i vendes

CREATE TABLE proveïdors_vendes (
    ulleres_id INT REFERENCES ulleres ON DELETE CASCADE,
    proveidor_id INT REFERENCES proveïdors ON DELETE CASCADE,
    PRIMARY KEY(ulleres_id, proveidor_id)
);

SELECT proveïdors.nom_proveïdor, proveïdors.proveidor_id
FROM proveïdors
INNER JOIN proveïdors ON ulleres.ulleres_id;

