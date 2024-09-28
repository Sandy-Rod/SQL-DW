INSERT INTO alumnos (nombre, apellido, fecha_nacimiento, email, fecha_matricula) VALUES
('Juan', 'Pérez', '1990-01-15', 'juan.perez@gmail.com', '2023-01-10'),
('María', 'García', '1992-02-20', 'maria.garcia@gmail.com', '2023-02-15'),
('Luis', 'Martínez', '1988-03-10', 'luis.martinez@gmail.com', '2023-03-20'),
('Ana', 'López', '1995-04-05', 'ana.lopez@gmail.com', '2023-04-25'),
('Carlos', 'Hernández', '1991-05-30', 'carlos.hernandez@gmail.com', '2023-05-12'),
('Laura', 'González', '1987-06-22', 'laura.gonzalez@gmail.com', '2023-06-18'),
('Pedro', 'Ramírez', '1993-07-11', 'pedro.ramirez@gmail.com', '2023-07-15'),
('Sofía', 'Jiménez', '1990-08-23', 'sofia.jimenez@gmail.com', '2023-08-20'),
('Diego', 'Molina', '1985-09-14', 'diego.molina@gmail.com', '2023-09-25'),
('Valeria', 'Reyes', '1994-10-02', 'valeria.reyes@gmail.com', '2023-10-05');


INSERT INTO profesores (nombre, apellido, fecha_nacimiento, email) VALUES
('Fernando', 'Díaz', '1980-01-05', 'fernando.diaz@gmail.com'),
('Claudia', 'Santos', '1982-02-14', 'claudia.santos@gmail.com'),
('Mario', 'Cruz', '1975-03-23', 'mario.cruz@gmail.com'),
('Patricia', 'Castillo', '1990-04-30', 'patricia.castillo@gmail.com'),
('Javier', 'Mora', '1988-05-21', 'javier.mora@gmail.com'),
('Elena', 'Vega', '1986-06-09', 'elena.vega@gmail.com'),
('Andrés', 'Paredes', '1992-07-13', 'andres.paredes@gmail.com'),
('Gabriela', 'Salas', '1984-08-17', 'gabriela.salas@gmail.com'),
('Ricardo', 'Rojas', '1978-09-28', 'ricardo.rojas@gmail.com'),
('Verónica', 'Téllez', '1981-10-06', 'veronica.tellez@gmail.com');


INSERT INTO bootcamps (nombre, nivel, duracion, descripcion) VALUES
('Bootcamp de Desarrollo Web', 'Intermedio', 12, 'Aprende a crear aplicaciones web desde cero.'),
('Bootcamp de Data Science', 'Avanzado', 16, 'Sumérgete en el análisis de datos y machine learning.'),
('Bootcamp de Diseño UX/UI', 'Básico', 10, 'Introducción al diseño centrado en el usuario.'),
('Bootcamp de Programación en Python', 'Intermedio', 8, 'Domina la programación con Python.'),
('Bootcamp de Marketing Digital', 'Básico', 6, 'Fundamentos del marketing en la era digital.'),
('Bootcamp de Ciberseguridad', 'Avanzado', 14, 'Protege sistemas y redes de ataques cibernéticos.'),
('Bootcamp de Desarrollo Móvil', 'Intermedio', 12, 'Desarrolla aplicaciones para dispositivos móviles.'),
('Bootcamp de Inteligencia Artificial', 'Avanzado', 16, 'Aprende sobre IA y sus aplicaciones prácticas.'),
('Bootcamp de Gestión de Proyectos', 'Básico', 4, 'Conceptos clave en la gestión de proyectos.'),
('Bootcamp de Blockchain', 'Avanzado', 10, 'Conoce el funcionamiento de la tecnología blockchain.');


INSERT INTO modulos (id_bootcamp, id_profesor, nombre, descripcion) VALUES
(1, 1, 'Introducción a HTML y CSS', 'Aprende los fundamentos de HTML y CSS.'),
(1, 1, 'JavaScript Avanzado', 'Domina JavaScript para crear aplicaciones interactivas.'),
(2, 2, 'Estadística para Data Science', 'Conocimientos básicos de estadística.'),
(2, 2, 'Machine Learning', 'Introducción al aprendizaje automático.'),
(3, 3, 'Principios de UX', 'Conceptos fundamentales del diseño de experiencia de usuario.'),
(4, 4, 'Programación en Python', 'Introducción a la programación en Python.'),
(5, 5, 'SEO y SEM', 'Optimización en motores de búsqueda.'),
(6, 6, 'Redes y Seguridad', 'Fundamentos de ciberseguridad.'),
(7, 7, 'Desarrollo de Aplicaciones Android', 'Creación de aplicaciones para Android.'),
(8, 8, 'Deep Learning', 'Profundiza en el aprendizaje profundo.');


INSERT INTO clases (id_modulo, dia_semana, hora, link_plataforma) VALUES
(1, 'Lunes', '09:00:00', 'https://plataforma1.com/clase1'),
(1, 'Miércoles', '11:00:00', 'https://plataforma1.com/clase2'),
(2, 'Martes', '14:00:00', 'https://plataforma1.com/clase3'),
(2, 'Jueves', '16:00:00', 'https://plataforma1.com/clase4'),
(3, 'Lunes', '10:00:00', 'https://plataforma1.com/clase5'),
(4, 'Martes', '15:00:00', 'https://plataforma1.com/clase6'),
(5, 'Miércoles', '13:00:00', 'https://plataforma1.com/clase7'),
(6, 'Jueves', '09:00:00', 'https://plataforma1.com/clase8'),
(7, 'Viernes', '12:00:00', 'https://plataforma1.com/clase9'),
(8, 'Sábado', '11:00:00', 'https://plataforma1.com/clase10');


INSERT INTO calificaciones (id_alumno, id_modulo, id_bootcamp, nota) VALUES
(1, 1, 1, 8.5),
(1, 2, 1, 9.0),
(2, 3, 2, 7.5),
(2, 4, 2, 8.0),
(3, 5, 3, 9.5),
(4, 6, 4, 6.0),
(5, 7, 5, 7.0),
(6, 8, 6, 8.8),
(7, 1, 7, 5.5),
(8, 2, 8, 10.0);



INSERT INTO alumnos_modulos (id_alumno, id_modulo, fecha_inicio_modulo) VALUES
(1, 1, '2023-01-15'),
(1, 2, '2023-01-20'),
(2, 3, '2023-02-01'),
(2, 4, '2023-02-05'),
(3, 5, '2023-03-01'),
(4, 6, '2023-04-01'),
(5, 7, '2023-05-01'),
(6, 1, '2023-06-01'),
(7, 2, '2023-07-01'),
(8, 3, '2023-08-01');
