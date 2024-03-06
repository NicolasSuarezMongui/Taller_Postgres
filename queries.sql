-- consulta 3.1
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'Alumno' ORDER BY apellido1, apellido2, nombre;

-- consulta 3.2
SELECT nombre, apellido1, apellido2 FROM persona WHERE tipo = 'Alumno' AND telefono IS NULL;

-- consulta 3.3
SELECT * FROM persona WHERE tipo ='Alumno' AND EXTRACT(year FROM fecha_nacimiento) = 1999;

-- consulta 3.4
SELECT * FROM persona WHERE tipo = 'Profesor' AND nif LIKE '%K' AND telefono IS NULL;

-- consulta 3.5
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;

-- consulta 4.1
SELECT * FROM persona p 
INNER JOIN alumno_se_matricula_asignatura m ON p.id = m.id_alumno 
INNER JOIN asignatura a ON a.id = m.id_asignatura
INNER JOIN grado g ON a.id_grado = g.id
INNER JOIN curso_escolar c ON c.id = m.id_curso_escolar
WHERE EXTRACT(year FROM c.anyo_inicio) = 2015
AND g.nombre = 'Ingeniería en Informática'
AND p.tipo = 'Alumno'
AND p.sexo = 'H';

-- consulta 4.2
SELECT * FROM asignatura a
INNER JOIN grado g ON a.id_grado = g.id
AND g.nombre = 'Ingeniería en Informática';

-- conulta 4.3
SELECT p.apellido1, p.apellido2, p.nombre, d.nombre FROM persona p
INNER JOIN profesor t ON p.id = t.id_profesor
INNER JOIN departamento d ON d.id = t.id_departamento
ORDER BY p.apellido1, p.apellido2, p.nombre;

-- consulta 4.4
SELECT a.nombre, c.anyo_inicio, c.anyo_fin FROM asignatura a
INNER JOIN alumno_se_matricula_asignatura m ON a.id = m.id_asignatura
INNER JOIN curso_escolar c ON c.id = m.id_curso_escolar
INNER JOIN persona p ON p.id = m.id_alumno
WHERE p.nif = '45678901C';

-- consulta 4.5
SELECT d.nombre FROM departamento d
INNER JOIN profesor p ON p.id_departamento = d.id
INNER JOIN asignatura a ON a.id_profesor = p.id_profesor
INNER JOIN grado g ON g.id = a.id_grado
WHERE g.nombre = 'Ingeniería en Informática';

-- consulta 4.6
SELECT DISTINCT p.apellido1, p.apellido2, p.nombre FROM persona p
INNER JOIN alumno_se_matricula_asignatura m ON m.id_alumno = p.id
INNER JOIN curso_escolar c ON c.id = m.id_curso_escolar
WHERE EXTRACT(year FROM c.anyo_inicio) = 2014;
