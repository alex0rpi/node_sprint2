DROP DATABASE youtube;
CREATE SCHEMA IF NOT EXISTS youtube;
USE youtube;
-- *-------------------------------------------------------------
-- *QUERIES per ESBORRAR les taules en cas necessari
-- *-------------------------------------------------------------
DROP TABLE usuaris;
DROP TABLE videos;
-- *-------------------------------------------------------------
-- *QUERIES per crear les taules
-- *-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS usuaris (
    ususari_id SERIAL PRIMARY KEY,
    nom_usuari VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    data_naixement DATE NOT NULL,
    sexe ENUM('femení', 'masculí', 'no_binari') NOT NULL,
    pais VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(100) NOT NULL,
);
CREATE TABLE etiquetes (
    tag_id SERIAL PRIMARY KEY,
    nom_tag VARCHAR(50) NOT NULL
);
CREATE TABLE canals (
    canal_id SERIAL PRIMARY KEY,
    usuari_canal VARCHAR(100) REFERENCES usuaris(nom_usuari) ON DELETE CASCADE,
    nom_canal VARCHAR(100) NOT NULL,
    descripcio VARCHAR(500) NOT NULL,
    data_creacio DATE NOT NULL
);
CREATE TABLE videos (
    video_id SERIAL PRIMARY KEY,
    titol VARCHAR(100) NOT NULL,
    descripcio VARCHAR(500) NOT NULL,
    usuari_video VARCHAR(100) REFERENCES usuaris(nom_usuari),
    tags JSON DEFAULT ('[""]'),
    -- Afegir FOREIGN KEY als tags? ES UN SET O UNA STRING?
    data_hora DATETIME NOT NULL,
    grandaria INT NOT NULL,
    nom_arxiu VARCHAR(100) NOT NULL,
    durada TIME,
    thumbnail BLOB,
    reproduccions INT NOT NULL,
    likes INT NOT NULL,
    dislikes INT NOT NULL,
    estat ENUM('public', 'ocult', 'privat') NOT NULL,
    comentaris JSON DEFAULT ('[""]')
);
CREATE TABLE playlists (
    playlist_id SERIAL PRIMARY KEY,
    nom_playlist VARCHAR(100) NOT NULL,
    user_playlist INT REFERENCES usuaris(ususari_id) ON DELETE CASCADE
    data_creacio DATE NOT NULL,
    estat ENUM('PUBLICA', 'PRIVADA')
);
CREATE TABLE comentaris (
    coment_id SERIAL PRIMARY KEY,
    usuari VARCHAR(100) REFERENCES usuaris(nom_usuari) ON DELETE CASCADE,
    video_id INT REFERENCES videos(video_id),
    `text` VARCHAR(500) NOT NULL,
    data_hora_coment DATETIME NOT NULL,
);
-- *-------------------------------------------------------------
-- *QUERIES per poblar les taules
-- *-------------------------------------------------------------
INSERT INTO comandes (nom_client, data_hora, modalitat, num_pizzes, num_hamburg, num_begudes, preu_total, botiga, repartidor, hora_repartiment)
VALUES
    ("Mario", "2023-01-01 22:10:10", "repartiment", 2, 0, 1, 20.00, 1, "James", "11:00:00"),
-- *-------------------------------------------------------------
-- *QUERIES de comprovació
-- *-------------------------------------------------------------
-- *
SELECT SUM(num_begudes) AS total_begudes FROM comandes co INNER JOIN(SELECT * FROM clients cli WHERE localitat = "Hospitalet") cli ON cli.nom_client = co.nom_client;
-- *
SELECT COUNT(comanda_id) FROM comandes WHERE repartidor = "Peppy";


