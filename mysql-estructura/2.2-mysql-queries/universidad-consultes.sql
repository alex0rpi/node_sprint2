SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2, telefono FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;
SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = 1999;
SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND nif LIKE('%K');
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT prof.apellido1, prof.apellido2, prof.nombre AS nombre_profesor, dept.nombre AS departamento FROM profesor JOIN departamento dept ON profesor.id_departamento = dept.id JOIN (SELECT * FROM persona WHERE tipo="profesor") prof ON prof.id = profesor.id_profesor ORDER BY prof.apellido1 ASC, prof.apellido2 ASC, nombre_profesor ASC;
SELECT nombre FROM asignatura;