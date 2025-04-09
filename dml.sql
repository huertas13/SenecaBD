USE seneca;

-- PROFESOR
INSERT INTO profesor (nombre, apellidos, email)
VALUES
('Elena', 'Gómez Torres', 'elena.gomez@seneca.edu'),
('Javier', 'Moreno Ruiz', 'javier.moreno@seneca.edu'),
('Carlos', 'Sánchez Pérez', 'carlos.sanchez@seneca.edu'),
('Ana', 'García Gómez', 'ana.garcia@seneca.edu'),
('Lucía', 'Navarro López', 'lucia.navarro@seneca.edu'),
('David', 'Ortega Ramos', 'david.ortega@seneca.edu'),
('Marta', 'Ruiz Salas', 'marta.ruiz@seneca.edu');

-- CENTRO
INSERT INTO centro (nombre, direccion, tlf, id_profe)
VALUES
('IES Los Alcores', 'Avda. Juan de Mairena', '600112233', 1),
('IES La Cañada', 'Calle de la Cañada', '600334455', 3),
('IES El Prado', 'Calle del Prado', '600223344', 4),
('IES San Isidro', 'Calle Real 10', '600556677', 5),
('IES Montequinto', 'Avda. de Europa 7', '600778899', 6);

-- ASIGNATURA
INSERT INTO asignatura (nombre, curso, id_profe)
VALUES
('Desarrollo Web en Entorno Cliente', '2º DAW', 1),
('Desarrollo Web en Entorno Servidor', '2º DAW', 2),
('Bases de datos','1º DAW',1),
('Diseño de Interfaces Web', '2º DAW', 1),
('Programación en Java', '2º DAW', 3),
('Desarrollo de Aplicaciones en Entorno Web', '1º DAW', 4),
('Redes y Sistemas Operativos', '2º DAW', 3),
('Gestión de Bases de Datos', '1º DAW', 4),
('Fundamentos de Programación', '1º DAW', 5),
('Seguridad en Sistemas', '2º DAW', 6),
('Integración de Sistemas', '2º DAW', 7);

-- RA
INSERT INTO ra (criterio, descripcion, id_asig)
VALUES
('RA1', 'Manipula el DOM con JavaScript', 1),
('RA2', 'Crea APIs REST con Node.js y Express', 2),
('RA3', 'Diseña prototipos funcionales en Figma', 3),
('RA1', 'Diseña y normaliza bases de datos relacionales', 3),
('RA1', 'Programación orientada a objetos en Java', 5),
('RA2', 'Desarrolla aplicaciones web con Java', 6),
('RA3', 'Diseño de redes de ordenadores', 7),
('RA1', 'Administración de bases de datos en MySQL', 8),
('RA2', 'Aplicación de buenas prácticas de codificación', 9),
('RA3', 'Configuración de firewalls y antivirus', 10),
('RA1', 'Automatización de procesos con scripts', 11);

-- CRITERIO EVALUACIÓN
INSERT INTO criterio_evaluacion (nombre, descripcion, ponderacion, id_ra)
VALUES
('DOM Interactivo', 'Uso correcto del DOM y eventos', 40.00, 1),
('Backend REST', 'Creación de API REST funcional', 60.00, 2),
('Modelo E-R', 'Capacidad para interpretar y construir modelos entidad-relación', 50.00, 4),
('Prototipado', 'Diseño con usabilidad y accesibilidad', 50.00, 3),
('POO Java', 'Uso de la programación orientada a objetos en Java', 40.00, 5),
('Aplicaciones Web', 'Desarrollo de aplicaciones en Java', 60.00, 6),
('Redes', 'Diseño de redes de ordenadores y configuración', 50.00, 7),
('Bases de Datos', 'Capacidad para diseñar y administrar bases de datos', 50.00, 8),
('Buenas prácticas', 'Escribe código limpio y mantenible', 40.00, 9),
('Seguridad básica', 'Configura sistemas seguros en entornos locales', 50.00, 10),
('Automatización', 'Automatiza tareas administrativas con scripts', 60.00, 11);

-- ALUMNO
INSERT INTO alumno (nombre, apellidos, dni, fecha_nac)
VALUES
('Lucas', 'Pérez Fernández', '44901234A', '2004-03-15'),
('Sara', 'Martín López', '44905678B', '2003-11-05'),
('María', 'Rodríguez López', '44907890C', '2004-06-25'),
('José', 'Fernández Martín', '44911234D', '2003-07-14'),
('Claudia', 'Santos Díaz', '44922334E', '2004-08-18'),
('Álvaro', 'Núñez Gil', '44933445F', '2003-09-09'),
('Laura', 'Morales Vega', '44944556G', '2004-02-02'),
('Hugo', 'Campos Nieto', '44955667H', '2004-05-23');

-- FALTA ASISTENCIA
INSERT INTO falta_asistencia (fecha, motivo, id_alumno)
VALUES
('2025-03-01', 'Fiebre', 1),
('2025-03-03', 'Examen de conducir', 2),
('2025-03-10', 'Problemas de salud', 3),
('2025-03-12', 'Enfermedad', 4),
('2025-03-15', 'Dolor de cabeza', 5),
('2025-03-17', 'Consulta médica', 6),
('2025-03-20', 'Migraña', 7),
('2025-03-22', 'Enfermedad viral', 8);

-- MATRÍCULA
INSERT INTO matricula (id_alumno, id_asig, fecha_matricula)
VALUES
(1, 1, '2024-09-15'),
(1, 2, '2024-09-15'),
(1, 3, '2024-09-15'),
(1, 4, '2024-09-15'),
(2, 1, '2024-09-15'),
(2, 2, '2024-09-15'),
(2, 3, '2024-09-15'),
(2, 4, '2024-09-15'),
(3, 5, '2024-09-15'),
(3, 6, '2024-09-15'),
(3, 7, '2024-09-15'),
(3, 8, '2024-09-15'),
(4, 5, '2024-09-15'),
(4, 6, '2024-09-15'),
(4, 7, '2024-09-15'),
(4, 8, '2024-09-15'),
(5, 9, '2024-09-16'),
(5, 10, '2024-09-16'),
(5, 11, '2024-09-16'),
(6, 9, '2024-09-16'),
(6, 10, '2024-09-16'),
(7, 10, '2024-09-16'),
(7, 11, '2024-09-16'),
(8, 11, '2024-09-16');

-- TAREA
INSERT INTO tarea (nombre, tipo, fecha, estado)
VALUES
('Formulario dinámico con JS', 'Práctica', '2025-02-10', 'Entregada'),
('API RESTful en Express', 'Proyecto', '2025-02-25', 'Pendiente'),
('Mockup Figma e interfaz final', 'Diseño', '2025-03-02', 'Entregada'),
('Clases de Java orientado a objetos', 'Práctica', '2025-03-05', 'Entregada'),
('Proyecto de desarrollo en Java', 'Proyecto', '2025-03-10', 'Pendiente'),
('Diseño de red para pequeña empresa', 'Diseño', '2025-03-20', 'Entregada'),
('Código limpio en JavaScript', 'Práctica', '2025-02-12', 'Entregada'),
('Configuración básica de Firewall', 'Práctica', '2025-03-15', 'Pendiente'),
('Script de backup automático', 'Proyecto', '2025-03-25', 'Pendiente');

-- NOTA (APROBADOS)
INSERT INTO nota (valor_nota, id_alumno, id_tarea, id_ce)
VALUES
(8.75, 1, 1, 1),
(9.20, 1, 2, 2),
(8.5, 1, 1, 3),
(7.25, 2, 1, 3),
(7.80, 2, 1, 1),
(8.50, 2, 3, 3),
(7.50, 3, 4, 5),
(8.10, 3, 5, 6),
(6.80, 3, 6, 7),
(9.00, 3, 7, 8),
(5.50, 4, 4, 5),
(7.30, 4, 5, 6),
(6.00, 4, 6, 7),
(6.90, 4, 7, 8),
(9.1, 5, 7, 9),
(8.4, 5, 8, 10),
(7.2, 5, 9, 11),
(7.9, 6, 7, 9),
(8.0, 6, 8, 10),
(9.3, 7, 8, 10),
(8.8, 7, 9, 11),
(9.5, 8, 9, 11);

-- NOTA (SUSPENSOS ORIGINALES)
INSERT INTO nota (valor_nota, id_alumno, id_tarea, id_ce)
VALUES
(4.2, 1, 1, 1),
(3.5, 2, 1, 3),
(2.8, 3, 6, 7),
(4.0, 4, 4, 5);

-- NOTA (SUSPENSOS NUEVOS)
INSERT INTO nota (valor_nota, id_alumno, id_tarea, id_ce)
VALUES
(3.8, 5, 7, 9),
(4.0, 6, 8, 10),
(3.5, 7, 9, 11),
(2.9, 8, 9, 11);
