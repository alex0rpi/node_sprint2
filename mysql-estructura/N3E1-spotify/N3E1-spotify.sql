DROP DATABASE spotify;
CREATE SCHEMA IF NOT EXISTS spotify;
USE spotify;
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per ESBORRAR les taules en cas necessari
-- *--------------------------------------------------------------------------------------------
DROP TABLE usuaris;
DROP TABLE videos;
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per crear les taules
-- *--------------------------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS usuaris (
    ususari_id SERIAL PRIMARY KEY,
    nom_usuari VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    data_naixement DATE NOT NULL,
    sexe ENUM('femení', 'masculí', 'no_binari') NOT NULL,
    pais VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(100) NOT NULL
);
CREATE TABLE etiquetes (
    tag_id SERIAL PRIMARY KEY,
    nom_tag VARCHAR(50) NOT NULL
);

CREATE TABLE videos (
    video_is SERIAL PRIMARY KEY,
    titol VARCHAR(100) NOT NULL,
    descripcio VARCHAR(500) NOT NULL,
    usuari_video VARCHAR(100) REFERENCES usuaris(nom_usuari),
    tags SET('') NOT NULL,
    -- Afegir FOREIGN KEY als tags? ES UN SET O UNA STRING?
    data_hora DATETIME NOT NULL,
    grandaria INT NOT NULL,
    nom_arxiu VARCHAR(100) NOT NULL,
    durada TIME,
    thumbnail BLOB,
    reproduccions INT NOT NULL,
    likes INT NOT NULL,
    dislikes INT NOT NULL,
    estat ENUM('public', 'ocult', 'privat') NOT NULL
);

CREATE TABLE canals (
    canal_id SERIAL PRIMARY KEY,
    usuari_canal VARCHAR(100) REFERENCES usuaris(nom_usuari),
    nom_canal VARCHAR(100) NOT NULL,
    descripcio VARCHAR(500) NOT NULL,
    data_creacio DATE NOT NULL
)
-- *--------------------------------------------------------------------------------------------
-- *QUERIES per poblar les taules
-- *--------------------------------------------------------------------------------------------
INSERT INTO comandes (nom_client, data_hora, modalitat, num_pizzes, num_hamburg, num_begudes, preu_total, botiga, repartidor, hora_repartiment)
VALUES
    ("Mario", "2023-01-01 22:10:10", "repartiment", 2, 0, 1, 20.00, 1, "James", "11:00:00"),

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

