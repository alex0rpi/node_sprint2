-- Active: 1675239530001@@127.0.0.1@3306@universidad
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2, telefono FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE('%K');
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT prof.apellido1, prof.apellido2, prof.nombre AS nombre_profesor, dept.nombre AS departamento FROM profesor JOIN departamento dept ON profesor.id_departamento = dept.id JOIN (SELECT * FROM persona WHERE tipo="profesor") prof ON prof.id = profesor.id_profesor ORDER BY prof.apellido1 ASC, prof.apellido2 ASC, nombre_profesor ASC;
SELECT asig.nombre AS nom_asignatura, curs.anyo_inicio, curs.anyo_fin FROM (SELECT * FROM persona WHERE nif = "26902806M") pers JOIN alumno_se_matricula_asignatura al ON al.id_alumno = pers.id JOIN asignatura asig ON asig.id = al.id_asignatura JOIN curso_escolar curs ON curs.id = al.id_curso_escolar;
SELECT DISTINCT pers.nombre AS nombre_profesor FROM asignatura asig JOIN (SELECT * FROM grado WHERE nombre = "Grado en Ingeniería Informática (Plan 2015)") grado ON grado.id = asig.id_grado JOIN persona pers ON pers.id = asig.id_profesor;
SELECT DISTINCT pers.nombre AS alumne FROM (SELECT * FROM curso_escolar WHERE anyo_inicio = 2018 AND anyo_fin = 2019) curs JOIN alumno_se_matricula_asignatura al ON al.id_curso_escolar = curs.id JOIN persona pers ON pers.id = al.id_alumno;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.
SELECT dep.nombre AS departament, pers.apellido1 AS cognom1, pers.apellido2 AS cognom2, pers.nombre AS nom_professor FROM profesor pro JOIN persona pers ON pers.id = pro.id_profesor LEFT JOIN departamento dep ON dep.id = pro.id_departamento ORDER BY departament ASC, cognom1 ASC, cognom2 ASC, nom_professor ASC;
SELECT * FROM profesor pro JOIN persona pers ON pers.id = pro.id_profesor WHERE pro.id_departamento IS NULL;
SELECT dep.nombre FROM profesor pro RIGHT JOIN departamento dep ON dep.id = pro.id_departamento WHERE pro.id_departamento IS NULL;
SELECT pro.id_profesor, pers.nombre AS nom_profe_sense_assignatura FROM asignatura asig RIGHT JOIN profesor pro ON asig.id_profesor = pro.id_profesor JOIN persona pers ON pers.id = pro.id_profesor WHERE asig.nombre IS NULL;
SELECT asig.id AS id_assignatura, asig.nombre AS nom_assignatura, asig.id_profesor AS id_professor FROM asignatura asig LEFT JOIN profesor pro ON asig.id_profesor = pro.id_profesor WHERE asig.id_profesor IS NULL ORDER BY asig.nombre ASC;
SELECT dep.nombre AS departament_que_no_ha_impartit FROM curso_escolar curs JOIN alumno_se_matricula_asignatura al ON curs.id = al.id_curso_escolar JOIN asignatura asig ON al.id_asignatura = asig.id JOIN profesor pro ON asig.id_profesor = pro.id_profesor RIGHT JOIN departamento dep ON pro.id_departamento = dep.id WHERE curs.anyo_inicio IS NULL;

-- Consultes resum
SELECT COUNT(id) FROM persona WHERE tipo ="alumno";
SELECT COUNT(id) FROM persona WHERE tipo ="alumno" AND YEAR(fecha_nacimiento) = 1999;
SELECT dep.nombre, COUNT(prof.id_profesor) AS nombre_professors FROM profesor prof LEFT JOIN departamento dep ON prof.id_departamento = dep.id GROUP BY dep.id ORDER BY nombre_professors DESC;
SELECT dep.nombre, COUNT(prof.id_profesor) FROM profesor prof RIGHT JOIN departamento dep ON prof.id_departamento = dep.id GROUP BY dep.nombre;
SELECT grado.nombre, COUNT(asig.id) AS nombre_assignatures FROM grado grado LEFT JOIN asignatura asig ON grado.id = asig.id_grado GROUP BY grado.nombre ORDER BY nombre_assignatures DESC;

-- ***Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades ↓↓↓.
SELECT grado.nombre, COUNT(asig.id) AS nombre_assignatures FROM grado grado LEFT JOIN asignatura asig ON grado.id = asig.id_grado GROUP BY grado.nombre ORDER BY nombre_assignatures DESC WHERE nombre_assignatures >;

-- ***Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus ↓↓↓.
SELECT grado.nombre, asig.tipo AS tipus_assignatura, SUM(asig.creditos) AS nombre_assignatures
FROM asignatura asig
JOIN grado grado
ON asig.id_grado = grado.id GROUP BY asig.tipo;

SELECT curs.anyo_inicio, COUNT(al.id_alumno) AS num_alumnos FROM alumno_se_matricula_asignatura al RIGHT JOIN curso_escolar curs ON al.id_curso_escolar = curs.id GROUP BY curs.anyo_inicio;
SELECT pro.id_profesor AS `id`, pers.nombre, pers.apellido1, pers.apellido2, COUNT(asig.id) AS nombre_assignatures FROM persona pers JOIN profesor pro ON pers.id = pro.id_profesor LEFT JOIN asignatura asig ON pro.id_profesor = asig.id_profesor GROUP BY pro.id_profesor;
SELECT * FROM persona ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT * FROM persona pers JOIN profesor pro ON pers.id = pro.id_profesor JOIN departamento dep ON dep.id = pro.id_departamento LEFT JOIN asignatura asig ON asig.id_profesor = pro.id_profesor WHERE asig.id_profesor IS NULL;