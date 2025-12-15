--DML(DATA MANIPULATION LANGUAGE)---

--DROP TABLES--

USE ac518;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE CLIENTE;
TRUNCATE TABLE LOCAL;
TRUNCATE TABLE ACCEDER;
TRUNCATE TABLE MAQUINA;
TRUNCATE TABLE BARRA;
TRUNCATE TABLE BEBIDA;
TRUNCATE TABLE EMPLEADO;
TRUNCATE TABLE CRUPIER;
TRUNCATE TABLE CAMARERO;
TRUNCATE TABLE JUEGO;

SET FOREIGN_KEY_CHECKS = 1;

-- CLIENTE
INSERT INTO CLIENTE (identificacion, nombre, apellido1, apellido2, dineroCuenta, fnac, genero, vip) VALUES
(NULL,'Juan','Pérez',NULL,120.50,'1990-05-12','H',1),
('12345678A','Ana','Gómez','Ruiz',80.00,'1988-11-20','M',0),
('Y2345678C',NULL,'Martín',NULL,45.75,'2001-03-02','H',0),
('X3456789D','Marta','López','Santos',60.00,'1995-07-18',NULL,1),
('Z4567890E','Carlos',NULL,NULL,300.00,'1982-01-10','H',0),
('87654321F','Laura','Moreno','Gil',150.00,'1999-09-09','M',0),
('P2345678G','Pablo','Navarro',NULL,60.00,'2003-12-01',NULL,0),
('D3456789H','Elena','Ortega','Vega',75.00,'1985-06-30','M',1),
('1234ABCD','Diego','Ramírez',NULL,25.00,NULL,'H',0),
('P3456789K','Sofía','Cruz','Luna',1.00,'1992-08-21','M',0);


-- LOCAL
INSERT INTO LOCAL (nombre, aforo, horaApertura, horaCierre, calle, portal, codigoPostal) VALUES
('Casino Norte',300,NULL,'03:00','Gran Vía','12','28013'),
(NULL,200,'11:00',NULL,'Atocha','5','28045'),
('Casino Centro',500,'09:00','04:00','Alcalá','22','28014'),
('Casino Este',150,'12:00','01:00',NULL,NULL,NULL),
('Casino Oeste',250,'10:00','03:00','Princesa','8',NULL),
('Casino Playa',400,'16:00','05:00','Marítimo','1','08001'),
('Casino Montaña',120,NULL,NULL,'Sierra','7','18001'),
('Casino Puerto',350,'14:00','03:00',NULL,'10','46001'),
('Casino Isla',220,'15:00','02:00','Central',NULL,NULL),
('Casino Urbano',280,'10:00','01:00','Mayor','15','50001');


-- ACCEDER
INSERT INTO ACCEDER (nCliente, nLocal, fechaAcceso, horaEntrada, horaSalida) VALUES
(1, 1, '2025-01-10', '18:00', '20:00'),
(2, 1, '2025-01-11', '19:00', NULL),
(3, 2, '2025-01-12', '21:00', '23:00'),
(4, 3, NULL, '20:30', NULL),
(5, 4, '2025-01-14', NULL, '01:00'),
(6, 5, '2025-01-15', '17:00', '19:00'),
(7, 6, '2025-01-16', '18:30', NULL),
(8, 7, '2025-01-17', '16:00', '18:00'),
(9, 8, '2025-01-18', '20:00', '22:30'),
(10, 9, '2025-01-19', '21:00', NULL);


-- MAQUINA
INSERT INTO MAQUINA (fechaInstalacion, tipo, fabricante, estado, nLocal) VALUES
('2025-01-01', 'Slot', 'IGT', 'Activa', 1),
('2025-02-15', 'VideoRodillo', 'Aristocrat', 'EnMantenimiento', 2),
('2025-03-10', NULL, 'Bally', 'FueraDeServicio', 3),
('2025-03-20', 'RuletaElectronica', NULL, 'EnMantenimiento', 4),
(NULL, 'Slot', 'Konami', 'Activa', 5),
('2025-04-10', 'BlackjackElectronico', 'PlayTech', 'Activa', 6),
(NULL, 'Slot', 'IGT', 'Activa', 7),
('2025-05-05', NULL, 'IGT', 'Activa', 8),
('2025-06-01', 'RuletaElectronica', 'Bally', 'FueraDeServicio', NULL),
('2025-06-15', NULL, 'Aristocrat', 'Activa', 10);


-- BARRA
INSERT INTO BARRA (capacidad, nLocal) VALUES
(50, 1),
(30, 2),
(50, 2),
(40, NULL),
(25, 4),
(60, 5),
(35, NULL),
(45, 7),
(50, 8),
(20, NULL),
(55, 10);


-- BEBIDA
INSERT INTO BEBIDA (nomBebida, codigoBarra) VALUES
('Cerveza', 1),
('Vino', 1),
('Refresco', 1),
('Refresco', 2),
('Agua', 3),
('Ron', 4),
('Whisky', 5),
('Tequila', 6),
('Cerveza', 7),
('Refresco', 8),
('Agua', 10);


-- EMPLEADO  (CARLES)
INSERT INTO EMPLEADO (experencia, nombre, apellido1, apellido2, nSeguridadSocial, sueldo, turno, fechaInicio, fechaFin, nLocal) VALUES
('3 años en casinos', 'Juan', 'Pérez', 'García', 'SS001', 1500.00, 'Manyana', '2023-01-10 09:00:00', '2025-12-31 18:00:00', 1),
(NULL, 'Ana', 'Gómez', 'Ruiz', 'SS002', 1800.50, 'Tarde', '2022-03-15 14:00:00', '2025-01-01 00:00:00', 2),
('5 años', NULL, 'Martín', NULL, 'SS003', 2000.00, 'Noche', '2021-07-20 18:00:00', NULL, 3),
('Experto en juegos de mesa', 'Marta', NULL, 'Santos', 'SS004', 1700.00, 'Manyana', '2020-11-05 08:00:00', NULL, 4),
(NULL, 'Carlos', 'López', NULL, 'SS005', 1600.00, NULL, '2023-05-10 13:00:00', '2024-12-31 00:00:00', 5),
('Capacitación en tragaperras', 'Laura', 'Moreno', NULL, 'SS006', 1900.00, 'Noche', '2022-09-01 17:00:00', NULL, NULL),
('Experiencia en coctelería', 'Pablo', 'Navarro', 'García', 'SS007', 1550.00, 'Manyana', '2021-02-20 09:00:00', NULL, 7),
(NULL, 'Elena', 'Ortega', 'Vega', 'SS008', 2100.00, 'Tarde', '2020-08-15 14:00:00', NULL, 8),
('Formación blackjack', 'Diego', 'Ramírez', NULL, 'SS009', 1750.00, 'Noche', '2023-06-01 18:00:00', '2025-06-30 00:00:00', 9),
(NULL, 'Sofía', 'Cruz', 'Luna', 'SS010', 1650.00, 'Manyana', '2022-12-01 08:00:00', NULL, 10);


-- CRUPIER  (CARLES)
INSERT INTO CRUPIER (nEmpleado, puesto) VALUES
(1, 'Jefe de mesa'),
(2, NULL),
(3, 'Supervisor'),
(4, NULL),
(5, 'Croupier senior'),
(6, NULL),
(7, 'Blackjack'),
(8, NULL),
(9, 'Ruleta'),
(10, NULL);


-- CAMARERO  (CARLES)
INSERT INTO CAMARERO (nEmpleado, especializacion, fechaServicio, codigoBarra) VALUES
(1, 'Coctelería clásica', '2025-01-10', 1),
(2, NULL, '2025-01-11', 2),
(3, 'Cervezas artesanas', NULL, 3),
(4, 'Vinos y licores', '2025-01-13', NULL),
(5, NULL, NULL, 5),
(6, 'Cocktails modernos', '2025-01-15', 6),
(7, 'Bebidas sin alcohol', NULL, 7),
(8, NULL, '2025-01-17', 8),
(9, 'Cócteles internacionales', '2025-01-18', 9),
(10, NULL, NULL, NULL);


-- JUEGO
INSERT INTO JUEGO (tipo, capacidad, nEmpleado, comienzoSesion, finSesion, nLocal) VALUES
('BlackJack', 5, 1, '18:00:00', '22:00:00', 1),
(NULL, 6, 2, '19:00:00', '23:00:00', 2),
('Poker', 4, 3, NULL, '21:00:00', 3),
('Ruleta', 8, 4, '17:00:00', NULL, 4),
(NULL, 7, 5, '20:00:00', '23:30:00', 5),
('BlackJack', 5, 6, '18:30:00', '22:30:00', NULL),
('Poker', 6, 7, NULL, NULL, 6),
('Ruleta', 4, 8, '19:30:00', '23:00:00', 7),
(NULL, 5, 9, '20:00:00', '22:30:00', 8),
('BlackJack', 7, 10, NULL, NULL, NULL);

