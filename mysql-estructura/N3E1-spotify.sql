-- Active: 1675420343906@@127.0.0.1@3306@spotify
DROP DATABASE spotify;
CREATE SCHEMA IF NOT EXISTS spotify;
USE spotify;
CREATE TABLE IF NOT EXISTS usuaris (
    usuari_id SERIAL PRIMARY KEY,
    tipus_user ENUM('free', 'premium'),
    email VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    nom_usuari VARCHAR(100) NOT NULL,
    data_naixement DATE NOT NULL,
    sexe ENUM('femení', 'masculí', 'no_binari') NOT NULL,
    pais VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(100) NOT NULL
);
CREATE TABLE targetes_credit(
    tarjeta_user_id INT REFERENCES usuaris,
    numero_tarjeta INT NOT NULL,
    mes_caducitat INT, 
    any_caducitat INT, 
    codi_seguretat INT(3) NOT NULL,
    CHECK (mes_caducitat >=1), CHECK (mes_caducitat <= 12)
    -- No aconsegueixo fer el check del year >= any actual
);

CREATE TABLE paypals (
    paypal_user_id INT REFERENCES usuaris,
    paypal_username VARCHAR(100)
);

CREATE TABLE suscripcions (
    premium_user INT REFERENCES usuaris(usuari_id),
    data_inici DATE NOT NULL,
    data_renovacio DATE NOT NULL,
    forma_pagament ENUM('targeta de credit', 'paypal'),
    targeta_credit INT REFERENCES targetes_credit(numero_tarjeta)
);

-- Taula de paagaments (intermitja?)
CREATE TABLE pagaments(
    payment_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES usuaris,
    payment_date DATE NOT NULL,
    total FLOAT(5,2) NOT NULL
);

CREATE TABLE playlists(
    playlist_id SERIAL PRIMARY KEY,
    creador INT REFERENCES usuaris ON DELETE,
    titol VARCHAR(100) NOT NULL,
    num_cançons INT NOT NULL,
    data_creacio DATE,
    type ENUM('ACTIVA', 'ESBORRADA')
);

CREATE TABLE deleted_playlists(
    play_id INT REFERENCES playlists,
    user_id INT REFERENCES usuaris,
    date_deleted DATE NOT NULL,
    PRIMARY KEY(play_id, user_id)
);


-- *--------------------------------------------------------------------------------------------
-- *QUERIES de comprovació
-- *--------------------------------------------------------------------------------------------
-- *Llista quants productes de tipus "Begudes" s'han venut en una determinada localitat.
SELECT SUM(num_begudes) AS total_begudes FROM comandes co INNER JOIN(SELECT * FROM clients cli WHERE localitat = "Hospitalet") cli ON cli.nom_client = co.nom_client;

-- Número de localitats diferents on hi ha clients
-- SELECT COUNT(DISTINCT localitat) from clients;

-- Número clients en una determinada localitat
-- SELECT COUNT(nom_client) FROM clients WHERE localitat = "Hospitalet";


-- *Llista quantes comandes ha efectuat un determinat empleat.
/* Entenc que ha de tractar-se d'un empleat repartidor, ja que només emmagatzemo el nom del 
repartidor quan es tracta d'una comanda de lliurament a domicili. */
SELECT COUNT(comanda_id) FROM comandes WHERE repartidor = "Peppy";

-- Script per saber QUINES COMANDES
-- SELECT comanda_id FROM comandes WHERE repartidor = "Peppy";
-- Script per saber QUANTES ha efectuat (la suma)

