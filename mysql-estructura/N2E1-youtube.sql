-- Active: 1675358553965@@127.0.0.1@3306@youtube
DROP DATABASE youtube;
CREATE SCHEMA IF NOT EXISTS youtube;
USE youtube;
CREATE TABLE IF NOT EXISTS usuaris (
    usuari_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    nom_usuari VARCHAR(100) NOT NULL,
    data_naixement DATE NOT NULL,
    sexe ENUM('femení', 'masculí', 'no_binari') NOT NULL,
    pais VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(100) NOT NULL
);
CREATE TABLE etiquetes (
    tag_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom_tag VARCHAR(50) NOT NULL
);
CREATE TABLE canals (
    canal_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_usuari INT UNSIGNED,
    FOREIGN KEY(id_usuari) REFERENCES usuaris(usuari_id),
    nom_canal VARCHAR(100) NOT NULL,
    descripcio VARCHAR(500) NOT NULL,
    data_creacio DATE NOT NULL
);
CREATE TABLE playlists (
    playlist_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    id_usuari INT UNSIGNED,
    FOREIGN KEY (id_usuari) REFERENCES usuaris(usuari_id),
    nom_playlist VARCHAR(100) NOT NULL,
    data_creacio DATE NOT NULL,
    estat ENUM('PUBLICA', 'PRIVADA')
);
CREATE TABLE comentaris (
    coment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `text` TEXT NOT NULL,
    data_hora_coment DATETIME NOT NULL
);
CREATE TABLE videos (
    video_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuari_id INT UNSIGNED,
    FOREIGN KEY (usuari_id) REFERENCES usuaris(usuari_id),
    titol VARCHAR(100) NOT NULL,
    descripcio VARCHAR(500) NOT NULL,
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
CREATE TABLE video_es_etiquetat (
    video_id INT UNSIGNED,
    tag_id INT UNSIGNED,
    PRIMARY KEY (video_id, tag_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id),
    FOREIGN KEY (tag_id) REFERENCES etiquetes(tag_id)
);
CREATE TABLE usuari_suscriu_canal (
    id_usuari_suscrit INT UNSIGNED,
    canal_id INT UNSIGNED,
    PRIMARY KEY (id_usuari, canal_id),
    FOREIGN KEY (id_usuari) REFERENCES usuaris(usuari_id),
    FOREIGN KEY (canal_id) REFERENCES canals(canal_id)
);
CREATE TABLE usuari_reacciona_video (
    id_usuari INT UNSIGNED,
    video_id INT UNSIGNED,
    reaccio ENUM('like','dislike'),
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuari, video_id),
    FOREIGN KEY (id_usuari) REFERENCES usuaris(usuari_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);
CREATE TABLE usuari_comenta (
    id_usuari INT UNSIGNED,
    video_id INT UNSIGNED,
    coment_id INT UNSIGNED,
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(id_usuari, video_id, coment_id),
    FOREIGN KEY(id_usuari) REFERENCES usuaris(usuari_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id),
    FOREIGN KEY(coment_id) REFERENCES comentaris(coment_id)
);
CREATE TABLE usuari_reacciona_comentari (
    coment_id INT UNSIGNED,
    id_usuari INT UNSIGNED,
    reaccio ENUM('magrada','no_magrada'),
    data_hora DATETIME DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (coment_id, id_usuari),
    FOREIGN KEY (coment_id) REFERENCES comentaris(coment_id),
    FOREIGN KEY (id_usuari) REFERENCES usuaris(usuari_id)
);

-- *----------------------------------------
-- *Algunes queries de comprovació
-- *----------------------------------------

-- *Seleccionar tots els videos a on un usuari ha comentat
 SELECT vid.titol, usucom.coment_id
 FROM usuaris usu
 JOIN videos vid
 ON usu.usuari_id = vid.usuari_id
 JOIN usuari_comenta usucom
 ON usu.usuari_id = usucom.id_usuari;

-- *Seleccionar tots els videos a on un usuari ha fet like
SELECT vid.video_id
FROM videos vid
JOIN usuari_reacciona_video reacvid
ON vid.video_id = reacvid.video_id
JOIN usuaris usu
ON usu.usuari_id = reacvid.id_usuari WHERE usu.nom_usuari = "Pepito";
    
-- *Seleccionar tots els CANALS a on un usuari està suscrit
SELECT can.nom_canal
FROM canals can
JOIN usuari_suscriu_canal usus
ON can.canal_id = usus.canal_id
JOIN usuaris us
ON usus.id_usuari = us.usuari_id WHERE us.nom_usuari = "Pepito";