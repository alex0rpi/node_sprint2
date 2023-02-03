-- Active: 1675420343906@@127.0.0.1@3306@spotify
DROP DATABASE spotify;
CREATE SCHEMA IF NOT EXISTS spotify;
USE spotify;
CREATE TABLE IF NOT EXISTS usuaris (
    usuari_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipus_user ENUM('free', 'premium'),
    email VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    nom_usuari VARCHAR(100) NOT NULL,
    data_naixement DATE NOT NULL,
    sexe ENUM('femení', 'masculí', 'no_binari') NOT NULL,
    pais VARCHAR(50) NOT NULL,
    codi_postal VARCHAR(100) NOT NULL
);
CREATE TABLE targetes_credit (
    card_id INT UNSIGNED AUTO_INCREMENT,
    usuari_id INT UNSIGNED,
    PRIMARY KEY (card_id, usuari_id),
    FOREIGN KEY (usuari_id) REFERENCES usuaris(usuari_id) ON DELETE CASCADE,
    numero_tarjeta INT NOT NULL,
    mes_caducitat TINYINT UNSIGNED NOT NULL, 
    CHECK (mes_caducitat >=1 AND mes_caducitat <= 12),
    any_caducitat TINYINT UNSIGNED NOT NULL, 
    codi_seguretat INT(3) UNSIGNED NOT NULL
);

CREATE TABLE paypals (
    paypal_id INT UNSIGNED AUTO_INCREMENT NOT NULL,
    user_id INT UNSIGNED,
    paypal_username VARCHAR(100),
    PRIMARY KEY (paypal_id, user_id),
    FOREIGN KEY (user_id) REFERENCES usuaris(usuari_id) ON DELETE CASCADE
);

CREATE TABLE usuari_fa_subscripcio (
    suscripcio_id INT UNSIGNED AUTO_INCREMENT,
    user_id INT UNSIGNED,
    PRIMARY KEY (suscripcio_id, user_id),
    FOREIGN KEY (user_id) REFERENCES usuaris(usuari_id) ON DELETE CASCADE,
    data_inici DATE NOT NULL,
    data_renovacio DATE NOT NULL,
    forma_pagament ENUM('targeta de credit', 'paypal'),
    targeta_credit INT REFERENCES targetes_credit(numero_tarjeta)
);

CREATE TABLE pagaments(
    payment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY NOT NULL,
    user_id INT UNSIGNED,
    FOREIGN KEY (user_id) REFERENCES usuaris(usuari_id),
    pay_date DATE NOT NULL,
    total NUMERIC(5,2) NOT NULL
);

CREATE TABLE playlists(
    playlist_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    creador INT REFERENCES usuaris,
    titol VARCHAR(100) NOT NULL,
    num_cançons INT NOT NULL,
    data_creacio DATE,
    tipus_playlist ENUM('activa', 'esborrada')
);

CREATE TABLE usuari_esborra_playlist(
    playlist_id INT UNSIGNED,
    user_id INT UNSIGNED,
    date_deleted DATE NOT NULL,
    PRIMARY KEY (playlist_id, user_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (user_id) REFERENCES usuaris(usuari_id)
);

CREATE TABLE usuari_modifica_playlist(
    playlist_id INT UNSIGNED,
    user_id INT UNSIGNED,
    date_modif DATE NOT NULL,
    PRIMARY KEY (playlist_id, user_id),
    FOREIGN KEY (playlist_id) REFERENCES playlists(playlist_id),
    FOREIGN KEY (user_id) REFERENCES usuaris(usuari_id)
);

CREATE TABLE artistes(
    artist_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    imatge BLOB
);
CREATE TABLE albums(
    album_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    artist_id INT UNSIGNED,
    FOREIGN KEY (artist_id) REFERENCES artistes(artist_id),
    titol VARCHAR(100) NOT NULL,
    any_pub INT(4) NOT NULL,
    imatge BLOB
);
CREATE TABLE canciones(
    song_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    album_id INT UNSIGNED,
    FOREIGN KEY (album_id) REFERENCES albums(album_id),
    titol VARCHAR(100) NOT NULL,
    durada TIME NOT NULL,
    reproduccions INT
);

CREATE TABLE usuari_segueix_artista (
    user_id INT UNSIGNED,
    artist_id INT UNSIGNED,
    PRIMARY KEY (user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES usuaris(usuari_id),
    FOREIGN KEY (artist_id) REFERENCES artistes(artist_id)
);

CREATE TABLE user_marca_album_favorit(
    user_id INT UNSIGNED,
    album_id INT UNSIGNED,
    PRIMARY KEY (user_id, album_id),
    FOREIGN KEY (user_id) REFERENCES usuaris(usuari_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);
CREATE TABLE user_marca_cancion_favorita(
    user_id INT UNSIGNED,
    song_id INT UNSIGNED,
    PRIMARY KEY (user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES usuaris(usuari_id),
    FOREIGN KEY (song_id) REFERENCES canciones(song_id)
);
CREATE TABLE artista_relacionat (
    artista_seguit_id INT UNSIGNED,
    artista_relacionat INT UNSIGNED,
    PRIMARY KEY (artista_seguit_id,artista_relacionat),
    FOREIGN KEY(artista_seguit_id) REFERENCES usuari_segueix_artista(artist_id),
    FOREIGN KEY(artista_relacionat) REFERENCES artistes(artist_id)
);