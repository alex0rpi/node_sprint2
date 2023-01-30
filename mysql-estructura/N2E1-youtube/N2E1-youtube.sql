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
    email VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    nom_usuari VARCHAR(100) NOT NULL,
    data_naixement DATE NOT NULL,
    sexe ENUM('femení', 'masculí', 'no_binari') NOT NULL,
    pais VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(100) NOT NULL
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
    estat ENUM('public', 'ocult', 'privat') NOT NULL
);
CREATE TABLE playlists (
    playlist_id SERIAL PRIMARY KEY,
    nom_playlist VARCHAR(100) NOT NULL,
    user_playlist INT REFERENCES usuaris(ususari_id) ON DELETE CASCADE,
    data_creacio DATE NOT NULL,
    estat ENUM('PUBLICA', 'PRIVADA')
);
CREATE TABLE comentaris (
    coment_id SERIAL PRIMARY KEY,
    usuari VARCHAR(100) REFERENCES usuaris(nom_usuari) ON DELETE CASCADE,
    video_id INT REFERENCES videos(video_id),
    `text` VARCHAR(500) NOT NULL,
    data_hora_coment DATETIME NOT NULL
);

-- *----------------------------------------
-- *Taules intermitges ⬇ ⬇ ⬇ ⬇ ⬇
-- *----------------------------------------

CREATE TABLE likes (
    video_id INT REFERENCES videos ON DELETE CASCADE,
    user_id INT REFERENCES usuaris ON DELETE CASCADE,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(video_id, user_id)
);
CREATE TABLE dislikes (
    video_id INT REFERENCES videos ON DELETE CASCADE,
    user_id INT REFERENCES usuaris ON DELETE CASCADE,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(video_id, user_id)
);
CREATE TABLE magrada (
    coment_id INT REFERENCES comentaris ON DELETE CASCADE,
    user_id INT REFERENCES usuaris ON DELETE CASCADE,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(coment_id, user_id)
);
CREATE TABLE no_magrada (
    coment_id INT REFERENCES comentaris ON DELETE CASCADE,
    user_id INT REFERENCES usuaris ON DELETE CASCADE,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(coment_id, user_id)
);
CREATE TABLES suscripcions (
    canal_id INT REFERENCES canals,
    usuari_id INT REFERENCES usuaris,
    PRIMARY KEY(canal_id, usuari_id)
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
SELECT *
FROM (SELECT * FROM suscripcions WHERE ) sus
JOIN usuaris usu
    ON 
