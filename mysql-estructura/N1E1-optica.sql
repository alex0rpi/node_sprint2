-- DROP DATABASE optica_cul_ampolla;
-- CREATE SCHEMA IF NOT EXISTS optica_cul_ampolla;
USE optica_cul_ampolla;
DROP TABLE proveïdors;
CREATE TABLE IF NOT EXISTS proveïdors (
    id SERIAL PRIMARY KEY,
    nom_proveïdor VARCHAR(100) NOT NULL,
    adreça VARCHAR(200) NOT NULL,
    telefon VARCHAR(100) NOT NULL,
    fax VARCHAR(100),
    nif VARCHAR(100) NOT NULL
);
INSERT INTO proveïdors (nom, adreça, telefon, fax, nif)
VALUES 
    ("Alfa", "Carrer 3 num 5 08085 TER SPAIN", "932093129", "934054844", "47872216W"),
    ("Bravo", "Carrer 7 num 1 08090 BAD SPAIN", "932043129", "935054844", "47872211X"),
    ("Charly", "Carrer 1 num 3 08081 BCN SPAIN", "932092129", "932054844", "47872216Q"),
    ("Delta", "Carrer 2 num 4 08082 SAB SPAIN", "932092120", "932054845", "47872216Y");
-- *--------------------------------------------------------------------------------------------
DROP TABLE ulleres;
CREATE TABLE ulleres (
    id SERIAL PRIMARY KEY,
    nom_proveïdor VARCHAR(100) REFERENCES proveïdors(nom_proveïdor) ON DELETE CASCADE,
    marca VARCHAR(100) NOT NULL,
    graduacio VARCHAR(50) NOT NULL,
    tipus_muntura ENUM('flotant', 'pasta', 'metàl·lica') NOT NULL,
    color_muntura VARCHAR(50) NOT NULL,
    color_vidres VARCHAR(50) NOT NULL,
    preu FLOAT(5,2) NOT NULL
);
INSERT INTO ulleres (nom_proveïdor, marca, graduacio, tipus_muntura, color_muntura, color_vidres, preu)
VALUES 
    ("Alfa", "TomFord", "2.5,3.5", "metàl·lica", "blau", "blanc", 180.99),
    ("Alfa", "TomFord", "2.5,3.5", "pasta", "groc", "blanc", 90.99),
    ("Alfa", "TomFord", "2.5,3.5", "flotant", "lila", "blanc", 70.99),
    ("Bravo", "PRADA", "-2,-2", "metàl·lica", "vermell", "daurat", 150.99),
    ("Bravo", "PRADA", "-2,-2", "pasta", "negre", "daurat", 125.99),
    ("Charly", "Vogue", "-4,-3.5", "pasta", "blau", "platejat", 200.99),
    ("Charly", "Vogue", "-4,-3.5", "flotant", "coral", "platejat", 190.99),
    ("Delta", "Emporio", "-3.5,-3.5", "metàl·lica", "sepia", "negre", 50.99);
    ("Delta", "Emporio", "-3.5,-3.5", "flotant", "taronja", "negre", 60.99);
-- *--------------------------------------------------------------------------------------------
CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    adreça VARCHAR(200) NOT NULL,
    telefon VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    nif VARCHAR(100) NOT NULL,
    client_recomanador VARCHAR(100),
    data_creacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
-- *--------------------------------------------------------------------------------------------
-- CREATE TABLE vendes (
--     empleat_venedor VARCHAR(100),
--     model_ullera ,
--     client,
--     data TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- )