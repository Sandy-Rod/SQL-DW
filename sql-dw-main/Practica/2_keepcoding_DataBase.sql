-- Tabla alumnos
CREATE OR REPLACE TABLE keepcoding.alumnos (
    id_alumno INT64 NOT NULL,
    nombre STRING(50) NOT NULL,
    apellido STRING(50) NOT NULL,
    fecha_nacimiento DATE,
    email STRING(100) NOT NULL,
    fecha_matricula DATE NOT NULL
);

-- Tabla profesores
CREATE OR REPLACE TABLE keepcoding.profesores (
    id_profesor INT64 NOT NULL,
    nombre STRING(50) NOT NULL,
    apellido STRING(50) NOT NULL,
    fecha_nacimiento DATE,
    email STRING(100) NOT NULL
);

-- Tabla bootcamps
CREATE OR REPLACE TABLE keepcoding.bootcamps (
    id_bootcamp INT64 NOT NULL,
    nombre STRING(100) NOT NULL,
    nivel STRING(20), -- Usa STRING en lugar de ENUM
    duracion INT64 NOT NULL, -- Duración en semanas
    descripcion STRING
);

-- Tabla módulos
CREATE OR REPLACE TABLE keepcoding.modulos (
    id_modulo INT64 NOT NULL,
    id_bootcamp INT64,
    id_profesor INT64,
    nombre STRING(100) NOT NULL,
    descripcion STRING
);

-- Tabla clases (horarios)
CREATE OR REPLACE TABLE keepcoding.clases (
    id_clase INT64 NOT NULL,
    id_modulo INT64,
    dia_semana STRING(20) NOT NULL, -- Usa STRING en lugar de ENUM
    hora TIME NOT NULL,
    link_plataforma STRING(255)
);

-- Tabla calificaciones
CREATE OR REPLACE TABLE keepcoding.calificaciones (
    id_nota INT64 NOT NULL,
    id_alumno INT64,
    id_modulo INT64,
    id_bootcamp INT64, -- Campo para el Bootcamp
    nota FLOAT64 NOT NULL -- Nota sobre 10, con un decimal
);

-- Relación entre alumnos y módulos (muchos a muchos)
CREATE OR REPLACE TABLE keepcoding.alumnos_modulos (
    id_alumno INT64,
    id_modulo INT64,
    fecha_inicio_modulo DATE NOT NULL
);
