



INSERT INTO EMPLEADO (experencia, nombre, apellido1, apellido2, nSeguridadSocial, sueldo, turno, fechaInicio, fechaFin, nLocal) VALUES
('5 años en hostelería', 'Ana', 'López', NULL, 11111111, 1400.00, 'Mañana', '2025-01-01 08:00:00', NULL, 1),
('3 años en casinos', 'Luis', 'Martínez', 'García', 22222222, 1500.00, 'Noche', '2025-02-01 22:00:00', NULL, 1),
('2 años en restauración', 'María', 'Fernández', NULL, 33333333, 1350.00, 'Tarde', '2025-03-01 16:00:00', NULL, 2),
('10 años experiencia', 'Pedro', 'Casas', 'Ruiz', 44444444, 1600.00, 'Mañana', '2025-04-01 08:00:00', NULL, 2),
('1 año aprendiz', 'Laura', 'Gómez', NULL, 55555555, 1200.00, 'Noche', '2025-05-01 22:00:00', NULL, 3),
('4 años en hostelería', 'Jorge', 'Sánchez', 'Pérez', 66666666, 1450.00, 'Tarde', '2025-06-01 16:00:00', NULL, 3),
('6 años en casinos', 'Marta', 'Torres', NULL, 77777777, 1550.00, 'Mañana', '2025-07-01 08:00:00', NULL, 1),
('8 años experiencia', 'Carlos', 'Ruiz', 'Moreno', 88888888, 1650.00, 'Noche', '2025-08-01 22:00:00', NULL, 2),
('2 años en barra', 'Sofía', 'Navarro', NULL, 99999999, 1300.00, 'Tarde', '2025-09-01 16:00:00', NULL, 3),
('7 años en hostelería', 'David', 'López', 'Gil', 10101010, 1500.00, 'Mañana', '2025-10-01 08:00:00', NULL, 1);

INSERT INTO CAMARERO (nEmpleado, especialiada) VALUES
(1, 'Coctelería'),
(3, 'Servicio de mesas'),
(5, 'Barra de vinos'),
(7, 'Cocktails internacionales'),
(9, 'Atención terraza');

INSERT INTO CRUPIER (nEmpleado, funcionalidad, puesto) VALUES
(2, 'Mesa de ruleta', 'Crupier principal'),
(4, 'Mesa de póker', 'Crupier auxiliar'),
(6, 'Blackjack', 'Crupier senior'),
(8, 'Dados', 'Crupier nocturno'),
(10, 'Baccarat', 'Crupier VIP');
