SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2, telefono FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE('%K');
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT prof.apellido1, prof.apellido2, prof.nombre AS nombre_profesor, dept.nombre AS departamento FROM profesor JOIN departamento dept ON profesor.id_departamento = dept.id JOIN (SELECT * FROM persona WHERE tipo="profesor") prof ON prof.id = profesor.id_profesor ORDER BY prof.apellido1 ASC, prof.apellido2 ASC, nombre_profesor ASC;
SELECT asig.nombre AS nom_asignatura, curs.anyo_inicio, curs.anyo_fin FROM (SELECT * FROM persona WHERE nif = "26902806M") pers JOIN alumno_se_matricula_asignatura al ON al.id_alumno = pers.id JOIN asignatura asig ON asig.id = al.id_asignatura JOIN curso_escolar curs ON curs.id = al.id_curso_escolar;
SELECT DISTINCT pers.nombre AS nombre_profesor FROM asignatura asig JOIN (SELECT * FROM grado WHERE nombre = "Grado en Ingeniería Informática (Plan 2015)") grado ON grado.id = asig.id_grado JOIN persona pers ON pers.id = asig.id_profesor;
SELECT DISTINCT pers.nombre AS alumne FROM (SELECT * FROM curso_escolar WHERE anyo_inicio = 2018 AND anyo_fin = 2019) curs JOIN alumno_se_matricula_asignatura al ON al.id_curso_escolar = curs.id JOIN persona pers ON pers.id = al.id_alumno;
SELECT dep.nombre AS departament, pers.apellido1 AS cognom1, pers.apellido2 AS cognom2, pers.nombre AS nom_professor FROM profesor pro JOIN persona pers ON pers.id = pro.id_profesor LEFT JOIN departamento dep ON dep.id = pro.id_departamento ORDER BY departament ASC, cognom1 ASC, cognom2 ASC, nom_professor ASC;
SELECT * FROM profesor pro JOIN persona pers ON pers.id = pro.id_profesor WHERE pro.id_departamento IS NULL;
SELECT dep.nombre FROM profesor pro RIGHT JOIN departamento dep ON dep.id = pro.id_departamento WHERE pro.id_departamento IS NULL;
SELECT pro.id_profesor, pers.nombre AS nom_profe_sense_assignatura FROM asignatura asig RIGHT JOIN profesor pro ON asig.id_profesor = pro.id_profesor JOIN persona pers ON pers.id = pro.id_profesor WHERE asig.nombre IS NULL;
SELECT asig.id AS id_assignatura, asig.nombre AS nom_assignatura, asig.id_profesor AS id_professor FROM asignatura asig LEFT JOIN profesor pro ON asig.id_profesor = pro.id_profesor WHERE asig.id_profesor IS NULL ORDER BY asig.nombre ASC;
SELECT dep.nombre AS departament_que_no_ha_impartit FROM curso_escolar curs JOIN alumno_se_matricula_asignatura al ON curs.id = al.id_curso_escolar JOIN asignatura asig ON al.id_asignatura = asig.id JOIN profesor pro ON asig.id_profesor = pro.id_profesor RIGHT JOIN departamento dep ON pro.id_departamento = dep.id WHERE curs.anyo_inicio IS NULL;

-- Hola