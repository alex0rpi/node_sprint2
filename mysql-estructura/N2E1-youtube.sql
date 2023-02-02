-- Active: 1675358553965@@127.0.0.1@3306@youtube
DROP DATABASE youtube;
CREATE SCHEMA IF NOT EXISTS youtube;
USE youtube;
-- *-------------------------------------------------------------
-- *QUERIES per ESBORRAR les taules en cas necessari
-- *-------------------------------------------------------------
DROP TABLE usuaris;
DROP TABLE videos;
DROP TABLE canals;
-- *-------------------------------------------------------------
-- *QUERIES per crear les taules
-- *-------------------------------------------------------------
CREATE TABLE IF NOT EXISTS usuaris (
    usuari_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    email VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    nom_usuari VARCHAR(100) NOT NULL,
    data_naixement DATE NOT NULL,
    sexe ENUM('femení', 'masculí', 'no_binari') NOT NULL,
    pais VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(100) NOT NULL
);
CREATE TABLE etiquetes (
    tag_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_tag VARCHAR(50) NOT NULL
);
CREATE TABLE canals (
    canal_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    id_usuari INT,
    FOREIGN KEY(id_usuari) REFERENCES usuaris(usuari_id),
    nom_canal VARCHAR(100) NOT NULL,
    descripcio VARCHAR(500) NOT NULL,
    data_creacio DATE NOT NULL
);
CREATE TABLE videos (
    video_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    titol VARCHAR(100) NOT NULL,
    descripcio VARCHAR(500) NOT NULL,
    usuari_video VARCHAR(100) REFERENCES usuaris(nom_usuari),
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
CREATE TABLE playlists (
    playlist_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nom_playlist VARCHAR(100) NOT NULL,
    id_usuari INT,
    FOREIGN KEY (id_usuari) REFERENCES usuaris(usuari_id),
    data_creacio DATE NOT NULL,
    estat ENUM('PUBLICA', 'PRIVADA')
);
CREATE TABLE comentaris (
    coment_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    usuari_id INT,
    FOREIGN KEY(usuari_id) REFERENCES usuaris(usuari_id),
    video_id INT REFERENCES videos(video_id),
    `text` VARCHAR(500) NOT NULL,
    data_hora_coment DATETIME NOT NULL
);

-- *----------------------------------------
-- *Taules intermitges ⬇ ⬇ ⬇ ⬇ ⬇
-- *----------------------------------------
CREATE TABLE usuari_fa_like (
    video_id INT REFERENCES videos ON DELETE CASCADE,
    user_id INT REFERENCES usuaris ON DELETE CASCADE,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(video_id, user_id)
);
CREATE TABLE usuari_fa_dislike (
    video_id INT REFERENCES videos ON DELETE CASCADE,
    user_id INT REFERENCES usuaris ON DELETE CASCADE,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(video_id, user_id)
);
CREATE TABLE usuari_magrada_coment (
    coment_id INT REFERENCES comentaris ON DELETE CASCADE,
    user_id INT REFERENCES usuaris ON DELETE CASCADE,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(coment_id, user_id)
);
CREATE TABLE usuari_no_magrada_coment (
    coment_id INT REFERENCES comentaris ON DELETE CASCADE,
    user_id INT REFERENCES usuaris ON DELETE CASCADE,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(coment_id, user_id)
);
CREATE TABLES usuari_suscriu_canal (
    id_canal INT REFERENCES canals,
    id_usuari INT REFERENCES usuaris,
    PRIMARY KEY(id_canal, id_usuari)
);

/* 
➡ Cada "like"/"dislike" pot tenir un identificador únic
 compost pel (video_id i l'usuari_id).
➡ De la mateixa manera, cada "m'agrada" o "no m'agrada"
 pot tenir un identificador únic compost per:
 (coment_id, user_id).
➡ Quan llegeixo "portar un registre" interpreto que he d'unir taules.
 */

-- *----------------------------------------
-- *Algunes queries de comprovació
-- *----------------------------------------

-- *Seleccionar tots els videos a on un usuari ha comentat
 SELECT co.coment_id, co.video_id, co.data_hora_coment
 FROM comentaris co
 JOIN 
    (SELECT * FROM usuaris WHERE nom_usuari = "pepito") usu
    ON co.usuari = usu.nom_usuari;

-- *Seleccionar tots els videos a on un usuari ha fet like
 SELECT v.titol, l.data_hora
 FROM (SELECT * FROM usuaris WHERE nom_usuari = "pepito") u
 JOIN likes l
    ON l.user_id = u.ususari_id
    JOIN videos v
        ON v.video_id = l.video_id;
    
-- *Seleccionar tots els CANALS a on un usuari està suscrit