DROP DATABASE pizzeria;
USE pizzeria;
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
    client_id SERIAL PRIMARY KEY,
    nom_client VARCHAR(100) NOT NULL,
    cognoms_client VARCHAR(100) NOT NULL,
    adreça VARCHAR(100) NOT NULL,
    codi_postal VARCHAR(50) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL,
    telefon VARCHAR(100) NOT NULL
);
CREATE TABLE IF NOT EXISTS botigues (
    botiga_id SERIAL PRIMARY KEY,
    adreça VARCHAR(100) NOT NULL,
    codi_postal VARCHAR(50) NOT NULL,
    localitat VARCHAR(50) NOT NULL,
    provincia VARCHAR(50) NOT NULL
);
CREATE TABLE IF NOT EXISTS empleats (
    empleat_id SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(100) NOT NULL,
    nif VARCHAR(50) NOT NULL,
    telefon VARCHAR(100) NOT NULL UNIQUE,
    rol ENUM('cuiner', 'repartidor')
);
CREATE TABLE IF NOT EXISTS comandes (
    comanda_id SERIAL PRIMARY KEY,
    nom_client VARCHAR(100) REFERENCES clients(nom_client) ON DELETE CASCADE,
    data_hora DATETIME NOT NULL,
    modalitat ENUM('repartiment','domicili','recollida'),
    -- Una comanda pot constar d'un o diversos productes.
    num_pizzes INT,
    num_hamburg INT,
    num_begudes INT,
    preu_total FLOAT(5, 2) NOT NULL,
    botiga VARCHAR(20) REFERENCES botigues(nom_botiga) ON DELETE CASCADE,
    repartidor VARCHAR(100) REFERENCES empleats(nom) ON DELETE CASCADE,
    hora_repartiment DATETIME
);
CREATE TABLE IF NOT EXISTS categories (
    categoria_id SERIAL PRIMARY KEY,
    nom_categoria VARCHAR(20) NOT NULL
);
CREATE TABLE pizzes (
    pizzes_id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    descriccio VARCHAR(200) NOT NULL,
    categoria VARCHAR(20) REFERENCES categories(nom) ON DELETE CASCADE,
    imatge MEDIUMBLOB,
    preu FLOAT(5,2) NOT NULL
);
CREATE TABLE IF NOT EXISTS hamburgueses (
    hamburgueses_id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    description VARCHAR(200) NOT NULL,
    imatge MEDIUMBLOB,
    preu FLOAT(5, 2) NOT NULL
);
CREATE TABLE IF NOT EXISTS begudes (
    begudes_id SERIAL PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    description VARCHAR(200) NOT NULL,
    imatge MEDIUMBLOB,
    preu FLOAT(5, 2) NOT NULL
);
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per poblar les taules
-- *--------------------------------------------------------------------------------------------



-- *--------------------------------------------------------------------------------------------
-- *QUERIES de comprovació
-- *--------------------------------------------------------------------------------------------
-- *Llista quants productes de tipus "Begudes" s'han venut en una determinada localitat.
-- clients i comandes
-- Un número, un nom de localitat
-- Cal esbrinar QUINS clients pertanyen a una determinada localitat
-- Cal realitzar SUMA de num_begudes en cada comanda d'aquests clients d'aquesta localitat

SELECT comandes.num_begudes
FROM SELECT nom_client FROM clients WHERE localitat="Hospitalet";
JOIN SELECT comandes.num_begudes
    ON cli.nom_client = com.nom_client;



-- *Llista quantes comandes ha efectuat un determinat empleat.
