-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS keepcoding;
USE keepcoding;

-- Tabla alumnos
CREATE TABLE alumnos (
    id_alumno INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(100) NOT NULL,
    fecha_matricula DATE NOT NULL,
    UNIQUE(nombre, apellido, fecha_nacimiento) -- Evitar duplicados exactos
);
CREATE INDEX idx_alumno_email ON alumnos(email);

-- Tabla profesores
CREATE TABLE profesores (
    id_profesor INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE,
    email VARCHAR(100) NOT NULL,
    UNIQUE(email) -- Un profesor no puede tener emails duplicados
);
CREATE INDEX idx_profesor_email ON profesores(email);

-- Tabla bootcamps
CREATE TABLE bootcamps (
    id_bootcamp INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nivel ENUM('Básico', 'Intermedio', 'Avanzado'),
    duracion INT NOT NULL, -- Duración en semanas
    descripcion TEXT
);

-- Tabla módulos
CREATE TABLE modulos (
    id_modulo INT AUTO_INCREMENT PRIMARY KEY,
    id_bootcamp INT,
    id_profesor INT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    FOREIGN KEY (id_bootcamp) REFERENCES bootcamps(id_bootcamp),
    FOREIGN KEY (id_profesor) REFERENCES profesores(id_profesor)
);

-- Tabla clases (horarios)
CREATE TABLE clases (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    id_modulo INT,
    dia_semana ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo') NOT NULL,
    hora TIME NOT NULL,
    link_plataforma VARCHAR(255),
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo)
);

-- Tabla calificaciones
CREATE TABLE calificaciones (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_alumno INT,
    id_modulo INT,
    id_bootcamp INT, -- Campo para el Bootcamp
    nota DECIMAL(3, 1) NOT NULL, -- Nota sobre 10, con un decimal
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo),
    FOREIGN KEY (id_bootcamp) REFERENCES bootcamps(id_bootcamp) -- Clave foránea al bootcamp
);

-- Relación entre alumnos y módulos (muchos a muchos)
CREATE TABLE alumnos_modulos (
    id_alumno INT,
    id_modulo INT,
    fecha_inicio_modulo DATE NOT NULL,
    PRIMARY KEY (id_alumno, id_modulo),
    FOREIGN KEY (id_alumno) REFERENCES alumnos(id_alumno),
    FOREIGN KEY (id_modulo) REFERENCES modulos(id_modulo)
);



Descripción del diagrama entidad-relación (ERD):


incluyendo las tablas y sus relaciones:

    Alumnos: Datos de los estudiantes, como nombre, apellido, fecha de nacimiento, y fecha de matrícula. Teniendo en cuenta que un alumno puede matricularse en un bootcamp por año.
    Profesores: Información de los profesores, incluyendo sus datos personales. Teniendo en cuenta que un profesor puede estar asociado a varios módulos.
    Bootcamps: Cursos disponibles en el Keepcoding, que pueden ser de distintos niveles o duraciones. Cada bootcamp puede tener varios módulos.
    Módulos: donde cada Bootcamps tiene varios módulos. Cada módulo tiene un profesor asignado. Teniendo en cuenta que un módulo puede tener varios alumnos.
    Calificaciones: Notas de los alumnos en los módulos correspondientes. La suma de las notas de los módulos es la nota final del bootcamp.
    Clases: Horarios de las clases para los módulos, incluyendo el link de la plataforma y el día de la semana.

