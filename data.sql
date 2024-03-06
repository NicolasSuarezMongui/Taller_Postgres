-- Creación de la base de datos
CREATE TABLE IF NOT EXISTS departamento  (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(50)
);

CREATE TYPE sexo AS ENUM('H','M');
CREATE TYPE tipo AS ENUM('Alumno','Profesor');

CREATE TABLE IF NOT EXISTS persona (
	id SERIAL PRIMARY KEY,
	nif VARCHAR(9),
	nombre VARCHAR(25),
	apellido1 VARCHAR(50),
	apellido2 VARCHAR(50),
	ciudad VARCHAR(25),
	direccion VARCHAR(50),
	telefono VARCHAR(9),
	fecha_nacimiento DATE,
	sexo sexo,
	tipo tipo
);

CREATE TABLE IF NOT EXISTS grado (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS profesor (
	id_profesor INTEGER REFERENCES persona(id) UNIQUE,
	id_departamento INTEGER REFERENCES departamento(id)
);

CREATE TYPE tipo_asignatura AS ENUM('Básica','Obligatoria','Optativa');

CREATE TABLE IF NOT EXISTS asignatura (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(100),
	creditos FLOAT,
	tipo tipo_asignatura,
	curso INTEGER,
	cuatrimestre INTEGER,
	id_profesor INTEGER REFERENCES profesor(id_profesor),
	id_grado INTEGER REFERENCES grado(id)
);

CREATE TABLE IF NOT EXISTS curso_escolar (
	id SERIAL PRIMARY KEY,
	anyo_inicio DATE,
	anyo_fin DATE
);

CREATE TABLE IF NOT EXISTS alumno_se_matricula_asignatura (
	id_alumno INTEGER REFERENCES persona(id),
	id_asignatura INTEGER REFERENCES asignatura(id),
	id_curso_escolar INTEGER REFERENCES curso_escolar(id)
);

-- Población de Tablas
INSERT INTO departamento (nombre) VALUES
    ('Departamento de Matemáticas'),
    ('Departamento de Informática'),
    ('Departamento de Física'),
    ('Departamento de Química'),
    ('Departamento de Biología'),
    ('Departamento de Ingeniería Civil'),
    ('Departamento de Ingeniería Eléctrica'),
    ('Departamento de Historia'),
    ('Departamento de Literatura'),
    ('Departamento de Economía'),
    ('Departamento de Psicología'),
    ('Departamento de Lingüística'),
    ('Departamento de Arquitectura'),
    ('Departamento de Filosofía'),
    ('Departamento de Medicina');

INSERT INTO grado (nombre) VALUES
    ('Licenciatura en Matemáticas'),
    ('Ingeniería en Informática'),
    ('Licenciatura en Física'),
    ('Licenciatura en Química'),
    ('Licenciatura en Biología'),
    ('Ingeniería Civil'),
    ('Ingeniería Eléctrica'),
    ('Licenciatura en Historia'),
    ('Licenciatura en Literatura'),
    ('Licenciatura en Economía'),
    ('Licenciatura en Psicología'),
    ('Licenciatura en Lingüística'),
    ('Licenciatura en Arquitectura'),
    ('Licenciatura en Filosofía'),
    ('Medicina');

INSERT INTO persona (nif, nombre, apellido1, apellido2, ciudad, direccion, telefono, fecha_nacimiento, sexo, tipo) VALUES
    ('12345678A', 'Juan', 'González', 'López', 'Madrid', 'Calle Mayor 123', '912345678', '1990-05-15', 'H', 'Alumno'),
    ('45678901C', 'Pedro', 'Fernández', 'Sánchez', 'Sevilla', 'Avenida Andalucía 67', '955678901', '1988-03-08', 'H', 'Alumno'),
    ('23456789D', 'Ana', 'López', 'García', 'Valencia', 'Plaza del Ayuntamiento 22', '963456789', '1992-07-12', 'M', 'Alumno'),
    ('89012345E', 'David', 'Martínez', 'Pérez', 'Málaga', 'Calle Larios 34', '951234567', '1987-11-25', 'H', 'Alumno'),
    ('45678901G', 'Sergio', 'Díaz', 'Hernández', 'Zaragoza', 'Paseo Independencia 78', '976345678', '1991-02-18', 'H', 'Alumno'),
    ('34567890H', 'Elena', 'Gómez', 'Rodríguez', 'Alicante', 'Avenida de Maisonnave 99', '965678901', '1989-06-23', 'M', 'Alumno'),
    ('12345678I', 'Pablo', 'Jiménez', 'López', 'Murcia', 'Calle Trapería 12', '968123456', '1994-08-14', 'H', 'Alumno'),
    ('78901234K', 'Daniel', 'Vázquez', 'Gómez', 'Valladolid', 'Calle Santiago 33', '983456789', '1986-12-03', 'H', 'Alumno'),
    ('56789012L', 'Lucía', 'Hernández', 'Fernández', 'Salamanca', 'Paseo de la Estación 14', '923567890', '1990-04-17', 'M', 'Alumno'),
    ('34567890M', 'Carlos', 'García', 'Martínez', 'Toledo', 'Calle Comercio 21', '925678901', '1995-11-22', 'H', 'Alumno'),
	('90123456O', 'Javier', 'López', 'Gómez', 'Pamplona', 'Calle Estafeta 5', '948234567', '1988-09-10', 'H', 'Alumno'),
    ('12345678N', 'Sara', 'Pérez', 'Sánchez', 'Córdoba', 'Calle Gondomar 8', '957123456', '1993-07-28', 'M', 'Alumno'),
    ('90123456O', 'Javier', 'López', 'Gómez', 'Pamplona', 'Calle Estafeta 5', '948234567', '1988-09-10', 'H', 'Alumno'),
    ('34567890M', 'Carlos', 'García', 'Martínez', 'Toledo', 'Calle Comercio 21', '925678901', '1995-11-22', 'H', 'Alumno'),
    ('12345678N', 'Sara', 'Pérez', 'Sánchez', 'Córdoba', 'Calle Gondomar 8', '957123456', '1993-07-28', 'M', 'Alumno'),
	('98765432B', 'María', 'Rodríguez', 'Martínez', 'Barcelona', 'Carrer Gran 45', '934567890', '1995-10-20', 'M', 'Profesor'),
	('67890123F', 'Laura', 'Sánchez', 'Fernández', 'Bilbao', 'Calle Gran Vía 56', '944567890', '1993-09-30', 'M', 'Profesor'),
	('90123456J', 'Carmen', 'Ruiz', 'Martín', 'Granada', 'Calle Navas 7', '958234567', '1996-01-05', 'M', 'Profesor'),
	('12345678A', 'Juan', 'González', 'López', 'Madrid', 'Calle Mayor 123', '912345678', '1990-05-15', 'H', 'Profesor'),
    ('98765432B', 'María', 'Rodríguez', 'Martínez', 'Barcelona', 'Carrer Gran 45', '934567890', '1995-10-20', 'M', 'Profesor'),
    ('45678901C', 'Pedro', 'Fernández', 'Sánchez', 'Sevilla', 'Avenida Andalucía 67', '955678901', '1988-03-08', 'H', 'Profesor'),
    ('23456789D', 'Ana', 'López', 'García', 'Valencia', 'Plaza del Ayuntamiento 22', '963456789', '1992-07-12', 'M', 'Profesor'),
    ('89012345E', 'David', 'Martínez', 'Pérez', 'Málaga', 'Calle Larios 34', '951234567', '1987-11-25', 'H', 'Profesor'),
    ('67890123F', 'Laura', 'Sánchez', 'Fernández', 'Bilbao', 'Calle Gran Vía 56', '944567890', '1993-09-30', 'M', 'Profesor'),
    ('45678901G', 'Sergio', 'Díaz', 'Hernández', 'Zaragoza', 'Paseo Independencia 78', '976345678', '1991-02-18', 'H', 'Profesor'),
    ('34567890H', 'Elena', 'Gómez', 'Rodríguez', 'Alicante', 'Avenida de Maisonnave 99', '965678901', '1989-06-23', 'M', 'Profesor'),
    ('12345678I', 'Pablo', 'Jiménez', 'López', 'Murcia', 'Calle Trapería 12', '968123456', '1994-08-14', 'H', 'Profesor'),
    ('90123456J', 'Carmen', 'Ruiz', 'Martín', 'Granada', 'Calle Navas 7', '958234567', '1996-01-05', 'M', 'Profesor'),
    ('78901234K', 'Daniel', 'Vázquez', 'Gómez', 'Valladolid', 'Calle Santiago 33', '983456789', '1986-12-03', 'H', 'Profesor'),
    ('56789012L', 'Lucía', 'Hernández', 'Fernández', 'Salamanca', 'Paseo de la Estación 14', '923567890', '1990-04-17', 'M', 'Profesor');
	
INSERT INTO profesor (id_profesor, id_departamento) VALUES
	(16, 1),
	(17, 2),
	(18, 3),
	(19, 4),
	(20, 1),
	(21, 2),
	(22, 3),
	(23, 4),
	(24, 1),
	(25, 2),
	(26, 3),
	(27, 4),
	(28, 1),
	(29, 2),
	(30, 3);
	
INSERT INTO asignatura (nombre, creditos, tipo, curso, cuatrimestre, id_profesor, id_grado) VALUES
    ('Cálculo I', 6.0, 'Básica', 1, 1, 16, 1),
    ('Algoritmos y Estructuras de Datos', 6.0, 'Obligatoria', 1, 2, 17, 2),
    ('Física I', 6.0, 'Obligatoria', 1, 3, 18, 3),
    ('Química General', 6.0, 'Obligatoria', 1, 2, 19, 4),
    ('Biología Celular', 6.0, 'Obligatoria', 1, 3, 20, 5),
    ('Ingeniería Civil I', 6.0, 'Obligatoria', 1, 2, 21, 6),
    ('Electromagnetismo', 6.0, 'Obligatoria', 1, 3, 22, 7),
    ('Historia Antigua', 6.0, 'Básica', 1, 1, 23, 8),
    ('Literatura Universal', 6.0, 'Básica', 1, 1, 24, 9),
    ('Economía Básica', 6.0, 'Básica', 1, 2, 25, 10),
    ('Psicología General', 6.0, 'Optativa', 1, 3, 26, 11),
    ('Lingüística Teórica', 6.0, 'Optativa', 1, 1, 27, 12),
    ('Diseño Arquitectónico', 6.0, 'Básica', 1, 2, 28, 13),
    ('Filosofía Antigua', 6.0, 'Obligatoria', 1, 3, 29, 14),
    ('Anatomía Humana', 6.0, 'Básica', 1, 3, 30, 15);

INSERT INTO curso_escolar (anyo_inicio, anyo_fin)
SELECT
    to_date((2010 + seq) || '-01-01', 'YYYY-MM-DD') as anyo_inicio,
    to_date((2010 + seq) || '-12-31', 'YYYY-MM-DD') as anyo_fin
FROM generate_series(0, 14) as seq;

INSERT INTO alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) VALUES
	(1, 1, 5),
	(1, 2, 5),
	(1, 3, 5),
	(1, 4, 5),
	(1, 5, 5),
	(2, 1, 7),
	(2, 2, 7),
	(2, 3, 7),
	(2, 4, 7),
	(2, 5, 7),
	(3, 1, 12),
	(3, 2, 12),
	(3, 3, 12),
	(3, 4, 12),
	(3, 5, 12);
