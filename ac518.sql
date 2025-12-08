CREATE DATABASE ac518;

USE ac518;

CREATE TABLE CLIENTE (
    nCliente INT auto_increment,
    identificacion VARCHAR(64),
    nombre VARCHAR(128),
    apellido1 VARCHAR(128),
    apellido2 VARCHAR(128) NULL,
    dineroCuenta DECIMAL(6,2),
    fnac DATE,
    genero ENUM('m', 'f', 'o'),
    -- Si fuse VIP pondríamos el valor 1 al insertar el dato
    vip TINYINT(1) DEFAULT 0,
    CONSTRAINT PK_CLIENTE PRIMARY KEY (nCliente),
    CONSTRAINT UQ_ID UNIQUE KEY (identificacion),

    -- Calculamos la edad 
    edad INT AS (
        datediff(current_date, fnac)
    ) VIRTUAL
); 

CREATE TABLE LOCAL (
    nLocal INT AUTO_INCREMENT,
    nombre VARCHAR(64),
    aforo INT,
    horaApertura TIME,
    horaCierre TIME,
    calle VARCHAR(128),
    portal CHAR(4),
    codigoPostal CHAR(5),
    CONSTRAINT PK_LOCAL PRIMARY KEY (nLocal)
);

CREATE TABLE ACCEDER ( 
    nCliente INT,
    nLocal INT,
    fechaAcceso DATE,
    horaEntrada TIME,
    horaSalida TIME,
    CONSTRAINT PK_ACCEDER PRIMARY KEY (nCliente, nLocal), 
    CONSTRAINT FK_ACC_CLI FOREIGN KEY (nCliente) REFERENCES CLIENTE(nCliente)  
        ON UPDATE CASCADE
        ON DELETE NO ACTION, 
    CONSTRAINT FK_ACC_LOC FOREIGN KEY (nLocal) REFERENCES LOCAL(nLocal)  
        ON UPDATE CASCADE
        ON DELETE NO ACTION
); 

CREATE TABLE MAQUINA (
    codigoMaquina INT AUTO_INCREMENT,
    fechaInstalacion DATE,
    tipo ENUM ('Slot', 'VideoRodillo', 'JackpotProgresivo', 'RuletaElectronica', 'BlackjackElectronico'),
    fabricante VARCHAR(128),
    estado ENUM ('Activa', 'FueraDeServicio') NOT NULL DEFAULT 'Activa',
    nLocal INT,
    CONSTRAINT PK_MAQUINA PRIMARY KEY (codigoMaquina),
    CONSTRAINT FK_MAQ_LOCAL FOREIGN KEY (nLocal) REFERENCES LOCAL(nLocal)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

CREATE TABLE EMPLEADO( 
    nEmpleado INT AUTO_INCREMENT, 
    experencia TEXT NOT NULL, 
    nombre VARCHAR(128), 
    apellido1 VARCHAR(128), 
    apellido2 VARCHAR(128) NULL, 
    nSeguridadSocial INT, 
    sueldo DECIMAL(10,2), 
    turno ENUM('Manyana', 'Tarde', 'Noche'), 
    fechaInicio DATETIME, 
    fechaFin DATETIME, 
    nLocal INT, 
    CONSTRAINT PK_EMPLEADO PRIMARY KEY (nEmpleado), 
    CONSTRAINT UK_nSeguridadSocial UNIQUE KEY (nSeguridadSocial), 
    CONSTRAINT FK_EMPLEADO_LOCAL FOREIGN KEY (nLocal) REFERENCES LOCAL (nLocal) 
        ON UPDATE CASCADE 
        ON DELETE NO ACTION
); 

CREATE TABLE CRUPIER( 
    nEmpleado INT, 
    puesto VARCHAR(32), 
    CONSTRAINT PK_CRUPIER PRIMARY KEY (nEmpleado), 
    CONSTRAINT FK_CRU_EMP FOREIGN KEY (nEmpleado) REFERENCES EMPLEADO (nEmpleado) 
        ON UPDATE CASCADE
        ON DELETE NO ACTION
); 

CREATE TABLE BARRA (
    codigoBarra INT AUTO_INCREMENT,
    capacidad INT NOT NULL,
    nLocal INT,
    CONSTRAINT PK_BARRA PRIMARY KEY (codigoBarra),
    CONSTRAINT FK_BAR_LOCAL FOREIGN KEY (nLocal) REFERENCES LOCAL (nLocal)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

CREATE TABLE BEBIDA (
    nomBebida VARCHAR(64),
    codigoBarra INT,
    CONSTRAINT PK_BEBIDA PRIMARY KEY (nomBebida, codigoBarra),
    CONSTRAINT FK_BARRA FOREIGN KEY (codigoBarra) REFERENCES BARRA(codigoBarra)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);

CREATE TABLE CAMARERO( 
    nEmpleado INT,
    especialiada VARCHAR(128),
    fechaServicio DATE,
    codigoBarra INT,
    CONSTRAINT PK_CAMARERO PRIMARY KEY (nEmpleado),
    CONSTRAINT FK_CAM_EMP FOREIGN KEY (nEmpleado) REFERENCES EMPLEADO (nEmpleado)
        ON UPDATE CASCADE 
        ON DELETE NO ACTION,
    CONSTRAINT FK_CAM_BAR FOREIGN KEY (codigoBarra) REFERENCES BARRA (codigoBarra)
        ON UPDATE CASCADE 
        ON DELETE NO ACTION
); 

CREATE TABLE JUEGO (
    nMesa INT AUTO_INCREMENT,
    tipo ENUM('BlackJack', 'Poker', 'Ruleta'),
    capacidad INT NOT NULL,
    nEmpleado INT NOT NULL,
    comienzoSesion TIME,
    finSesion TIME,
    CONSTRAINT PK_JUEGO PRIMARY KEY (nMesa),
    CONSTRAINT FK_JUE_CRU FOREIGN KEY (nEmpleado) REFERENCES CRUPIER (nEmpleado)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT UQ_EMP UNIQUE KEY (nEmpleado)
);

CREATE TABLE CONTENER (
    nLocal INT,
    nMesa INT,
    CONSTRAINT PK_CONTENER PRIMARY KEY (nLocal, nMesa),
    CONSTRAINT FK_CON_LOCAL FOREIGN KEY (nLocal) REFERENCES LOCAL(nLocal)
        ON UPDATE CASCADE
        ON DELETE NO ACTION,
    CONSTRAINT FK_CON_JUEGO FOREIGN KEY (nMesa) REFERENCES JUEGO(nMesa)
        ON UPDATE CASCADE
        ON DELETE NO ACTION
);