-- Active: 1675153068653@@127.0.0.1@3306@tienda
/* Base de dades Tienda
Tenim les taules producto i fabricador, cadascuna amb els següents camps:
- producto (codigo, nombre, precio, codigo_fabricante)
- fabricante (codigo, nombre)
El camp 'codigo_fabricante' de l'entitat producto es relaciona amb el camp 'codi' de l'entitat fabricante.
Si us plau, efectua les següents consultes: */

/* CREATE SCHEMA IF NOT EXISTS tienda;
USE tienda;
DROP TABLE producto;
DROP TABLE fabricador;
CREATE TABLE producto (
codigo SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DECIMAL(5,2),
codigo_fabricante INT REFERENCES fabricador );
CREATE TABLE fabricador (
codigo SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL );

INSERT into fabricador (nombre)
VALUES ("Siemens"), ("Airbus"), ("Leuce");

INSERT INTO producto (nombre, precio)
VALUES
    ("abrelatas", 10.90),
    ("sacapuntas", 8.90),
    ("tenedor", 6.90); */