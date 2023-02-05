-- Active: 1675153068653@@127.0.0.1@3306@tienda
-- Llista el nom de tots els productes que hi ha en la taula producto.
-- Llista els noms i els preus de tots els productes de la taula producto.
-- Llista totes les columnes de la taula producto.
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD).
-- Llista el nom dels productes, el preu en euros i el preu en dòlars estatunidencs (USD). Utilitza els següents àlies per a les columnes: nom de producto, euros, dòlars.
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a majúscula.
-- Llista els noms i els preus de tots els productes de la taula producto, convertint els noms a minúscula.
-- Llista el nom de tots els fabricants en una columna, i en una altra columna obtingui en majúscules els dos primers caràcters del nom del fabricant.
-- Llista els noms i els preus de tots els productes de la taula producto, arrodonint el valor del preu.
-- Llista els noms i els preus de tots els productes de la taula producto, truncant el valor del preu per a mostrar-lo sense cap xifra decimal.
-- Llista el codi dels fabricants que tenen productes en la taula producto.
-- Llista el codi dels fabricants que tenen productes en la taula producto, eliminant els codis que apareixen repetits.
-- Llista els noms dels fabricants ordenats de manera ascendent.
-- Llista els noms dels fabricants ordenats de manera descendent.
-- Llista els noms dels productes ordenats, en primer lloc, pel nom de manera ascendent i, en segon lloc, pel preu de manera descendent.
-- Retorna una llista amb les 5 primeres files de la taula fabricante.
-- Retorna una llista amb 2 files a partir de la quarta fila de la taula fabricante. La quarta fila també s'ha d'incloure en la resposta.
-- Llista el nom i el preu del producte més barat. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MIN(preu), necessitaria GROUP BY.
-- Llista el nom i el preu del producte més car. (Utilitza solament les clàusules ORDER BY i LIMIT). NOTA: Aquí no podria usar MAX(preu), necessitaria GROUP BY.
-- Llista el nom de tots els productes del fabricant el codi de fabricant del qual és igual a 2.
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades.
-- Retorna una llista amb el nom del producte, preu i nom de fabricant de tots els productes de la base de dades. Ordena el resultat pel nom del fabricant, per ordre alfabètic.
-- Retorna una llista amb el codi del producte, nom del producte, codi del fabricador i nom del fabricador, de tots els productes de la base de dades.
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més barat.
-- Retorna el nom del producte, el seu preu i el nom del seu fabricant, del producte més car.
-- Retorna una llista de tots els productes del fabricant Lenovo.
-- Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Sense utilitzar l'operador IN.
-- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard y Seagate. Fent servir l'operador IN.
-- Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.
-- Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el caràcter w en el seu nom.
-- Retorna un llistat amb el nom de producte, preu i nom de fabricant, de tots els productes que tinguin un preu major o igual a 180 €. Ordena el resultat, en primer lloc, pel preu (en ordre descendent) i, en segon lloc, pel nom (en ordre ascendent).
-- Retorna un llistat amb el codi i el nom de fabricant, solament d'aquells fabricants que tenen productes associats en la base de dades.
-- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d'ells. El llistat haurà de mostrar també aquells fabricants que no tenen productes associats.
-- Retorna un llistat on només apareguin aquells fabricants que no tenen cap producte associat.
-- Retorna tots els productes del fabricador Lenovo. (Sense utilitzar INNER JOIN).
-- Retorna totes les dades dels productes que tenen el mateix preu que el producte més car del fabricant Lenovo. (Sense usar INNER JOIN).
-- Llista el nom del producte més car del fabricant Lenovo.
-- Llista el nom del producte més barat del fabricant Hewlett-Packard.
-- Retorna tots els productes de la base de dades que tenen un preu major o igual al producte més car del fabricant Lenovo.
-- Llesta tots els productes del fabricant Asus que tenen un preu superior al preu mitjà de tots els seus productes.
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT nombre, precio, ROUND(precio*1.05, 2) AS precio_en_$ FROM producto;
SELECT nombre AS `nom de producto`, precio AS euros, ROUND(precio*1.05, 2) AS `dòlars` FROM producto;
SELECT (UPPER(nombre)) AS NOMBRE, precio FROM producto;
SELECT (LOWER(nombre)) AS nombre, precio FROM producto;
SELECT nombre, UPPER(LEFT(nombre, 2)) AS abreviado  FROM fabricante;
SELECT nombre, ROUND(precio) AS precio FROM producto;
SELECT nombre, FLOOR(precio) AS precio FROM producto;
SELECT fab.codigo FROM fabricante fab JOIN producto prod ON prod.codigo_fabricante = fab.codigo;
SELECT DISTINCT fab.codigo FROM fabricante fab JOIN producto prod ON prod.codigo_fabricante = fab.codigo;
SELECT nombre FROM fabricante ORDER BY nombre ASC;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM producto ORDER BY nombre ASC, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante WHERE codigo BETWEEN 4 AND 5;
SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto prod JOIN (SELECT * FROM fabricante WHERE codigo=2) fab ON fab.codigo = prod.codigo_fabricante;
SELECT prod.nombre AS nom_producte, prod.precio, fab.nombre AS fabricant FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo;
SELECT prod.nombre AS nom_producte, prod.precio, fab.nombre AS fabricant FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo ORDER BY fabricant ASC;
SELECT prod.codigo AS codi_producte, prod.nombre, fab.codigo AS codi_fabricant, fab.nombre AS fabricant FROM producto prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo;
SELECT prod.nombre AS nom_producte, prod.precio, fab.nombre AS fabricante FROM fabricante fab JOIN (SELECT * FROM producto ORDER BY precio ASC LIMIT 1) prod ON fab.codigo = prod.codigo_fabricante;
SELECT prod.nombre AS nom_producte, prod.precio, fab.nombre AS fabricante FROM fabricante fab JOIN (SELECT * FROM producto ORDER BY precio DESC LIMIT 1) prod ON fab.codigo = prod.codigo_fabricante;
SELECT * FROM producto prod JOIN (SELECT * FROM fabricante WHERE nombre ="Lenovo") fab ON prod.codigo_fabricante = fab.codigo;
SELECT * FROM (SELECT * FROM producto WHERE precio > 200) prod JOIN (SELECT * FROM fabricante WHERE nombre ="Crucial") fab ON prod.codigo_fabricante = fab.codigo;
SELECT * FROM producto prod JOIN (SELECT * FROM fabricante WHERE nombre ="Asus" OR nombre = "Hewlett-Packard" OR nombre = "Seagate") fab ON prod.codigo_fabricante = fab.codigo;
SELECT * FROM producto prod JOIN (SELECT * FROM fabricante WHERE nombre IN ("Asus","Hewlett-Packard","Seagate")) fab ON prod.codigo_fabricante = fab.codigo;
SELECT prod.nombre AS producto, prod.precio, fab.nombre FROM producto prod JOIN (SELECT * FROM fabricante WHERE nombre LIKE('%e')) fab ON prod.codigo_fabricante = fab.codigo;
SELECT prod.nombre AS producto, prod.precio, fab.nombre FROM producto prod JOIN (SELECT * FROM fabricante WHERE nombre LIKE('%w%')) fab ON prod.codigo_fabricante = fab.codigo;
SELECT prod.nombre AS producto, prod.precio, fab.nombre AS fabricante FROM (SELECT * FROM producto WHERE precio >= 180) prod JOIN fabricante fab ON prod.codigo_fabricante = fab.codigo ORDER BY prod.precio DESC, prod.nombre ASC;
SELECT fab.codigo AS codi_fabricant, fab.nombre AS nom_fabricant FROM fabricante fab JOIN producto prod ON fab.codigo = prod.codigo_fabricante;
SELECT * FROM fabricante fab LEFT JOIN producto prod ON prod.codigo_fabricante = fab.codigo;
SELECT * FROM fabricante fab LEFT JOIN producto prod ON prod.codigo_fabricante = fab.codigo WHERE prod.codigo_fabricante IS NULL;
SELECT * FROM producto WHERE codigo_fabricante = (SELECT codigo FROM fabricante WHERE nombre = "Lenovo");
SELECT * FROM producto WHERE precio = (SELECT prod.precio from (SELECT * FROM producto WHERE codigo_fabricante=(SELECT codigo FROM fabricante WHERE nombre = "Lenovo") ORDER BY precio DESC LIMIT 1) prod);
SELECT * FROM producto WHERE codigo_fabricante=(SELECT codigo FROM fabricante WHERE nombre = "Lenovo") ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto WHERE codigo_fabricante=(SELECT codigo FROM fabricante WHERE nombre = "Hewlett-Packard") ORDER BY precio ASC LIMIT 1;
SELECT * FROM producto WHERE precio >= (SELECT prod.precio FROM producto prod WHERE codigo_fabricante=(SELECT codigo FROM fabricante WHERE nombre = "Lenovo") ORDER BY precio DESC LIMIT 1 ) ORDER BY precio DESC;
SELECT * FROM producto prod JOIN (SELECT * FROM fabricante WHERE nombre = "Asus") fab ON prod.codigo_fabricante = fab.codigo WHERE prod.precio > (SELECT AVG(prod.precio) FROM producto);