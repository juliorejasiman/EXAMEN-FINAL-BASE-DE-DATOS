
--Poner en uso master
use master
GO

-- Creacion de Base de Datos:
CREATE DATABASE dbMESAJIL
GO

--Uso de Base de datos:
USE dbMESAJIL
GO

-- Creacion de tablas
-- Tabla: Administrador
CREATE TABLE Administrador (
    DNIADM char(8)  NOT NULL,
    NOMADM varchar(50)  NOT NULL,
    APEADM varchar(50)  NOT NULL,
    CELADM char(9)  NOT NULL,
    CONSTRAINT Administrador_pk PRIMARY KEY  (DNIADM)
);

-- Tabla: JefeSurcursal
CREATE TABLE JefeSurcursal (
    DNIJEF char(8)  NOT NULL,
    NOMJEF varchar(50)  NOT NULL,
    APEJEF varchar(50)  NOT NULL,
    CELJEF char(9)  NOT NULL,
    DNIADM char(8)  NOT NULL,
    CONSTRAINT JefeSurcursal_pk PRIMARY KEY  (DNIJEF)
);

-- Tabla: Productos
CREATE TABLE Productos (
    CODPROD int  NOT NULL IDENTITY (1,1),
    NOMPROD varchar(60)  NOT NULL,
    PREPROD decimal(10,2)  NOT NULL,
    STOPROD int  NOT NULL,
    DATTECPROD varchar(30)  NOT NULL,
    CATPROD varchar(50)  NOT NULL,
    DNIJEF char(8)  NOT NULL,
    DNIVEN char(8)  NOT NULL,
    CONSTRAINT Productos_pk PRIMARY KEY  (CODPROD)
);

-- Tabla: Sucursal
CREATE TABLE Sucursal (
    CODSUC int  NOT NULL IDENTITY (1,1),
    LUGSUC varchar(20)  NOT NULL,
    DNIADM char(8)  NOT NULL,
    CONSTRAINT Sucursal_pk PRIMARY KEY  (CODSUC)
);

-- Tabla: Vendedores
CREATE TABLE Vendedores (
    DNIVEN char(8)  NOT NULL,
    NOMVEN varchar(50)  NOT NULL,
    APEVEN varchar(50)  NOT NULL,
    CELVEN char(9)  NOT NULL,
    DNIADM char(8)  NOT NULL,
    DNIJEF char(8)  NOT NULL,
    CONSTRAINT Vendedores_pk PRIMARY KEY  (DNIVEN)
);

-- Tabla: Venta
CREATE TABLE Venta (
    CODVENT int  NOT NULL IDENTITY (1,1),
    TOTVENT decimal(10,2)  NOT NULL,
    CANPROVENT char(4)  NOT NULL,
    FECVEN date  NOT NULL,
    DNIADM char(8)  NOT NULL,
    DNIJEF char(8)  NOT NULL,
    CODSUC int  NOT NULL,
    DNIVEN char(8)  NOT NULL,
    CONSTRAINT Venta_pk PRIMARY KEY  (CODVENT)
);

-- Tabla: Venta_Detalle
CREATE TABLE Venta_Detalle (
    CODVEDE int  NOT NULL IDENTITY (1,1),
    CODVENT int  NOT NULL,
    CODPROD int  NOT NULL,
    CONSTRAINT Venta_Detalle_pk PRIMARY KEY  (CODVEDE)
);

-- foreign keys
-- Referencia: JefeSurcursal_Administrador (Tabla: JefeSurcursal)
ALTER TABLE JefeSurcursal ADD CONSTRAINT JefeSurcursal_Administrador
    FOREIGN KEY (DNIADM)
    REFERENCES Administrador (DNIADM);

-- Referencia: Producto_JefeSurcursal (Tabla: Productos)
ALTER TABLE Productos ADD CONSTRAINT Producto_JefeSurcursal
    FOREIGN KEY (DNIJEF)
    REFERENCES JefeSurcursal (DNIJEF);

-- Referencia: Productos_Vendedores (Tabla: Productos)
ALTER TABLE Productos ADD CONSTRAINT Productos_Vendedores
    FOREIGN KEY (DNIVEN)
    REFERENCES Vendedores (DNIVEN);

-- Referencia: Sucursal_Administrador (Tabla: Sucursal)
ALTER TABLE Sucursal ADD CONSTRAINT Sucursal_Administrador
    FOREIGN KEY (DNIADM)
    REFERENCES Administrador (DNIADM);

-- Referencia: Vendedores_Administrador (Tabla: Vendedores)
ALTER TABLE Vendedores ADD CONSTRAINT Vendedores_Administrador
    FOREIGN KEY (DNIADM)
    REFERENCES Administrador (DNIADM);

-- Referencia: Vendedores_JefeSurcursal (Tabla: Vendedores)
ALTER TABLE Vendedores ADD CONSTRAINT Vendedores_JefeSurcursal
    FOREIGN KEY (DNIJEF)
    REFERENCES JefeSurcursal (DNIJEF);

-- Referencia: Venta_Administrador (Tabla: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Administrador
    FOREIGN KEY (DNIADM)
    REFERENCES Administrador (DNIADM);

-- Referencia: Venta_Detalle_Productos (Tabla: Venta_Detalle)
ALTER TABLE Venta_Detalle ADD CONSTRAINT Venta_Detalle_Productos
    FOREIGN KEY (CODPROD)
    REFERENCES Productos (CODPROD);

-- Referencia: Venta_Detalle_Venta (Tabla: Venta_Detalle)
ALTER TABLE Venta_Detalle ADD CONSTRAINT Venta_Detalle_Venta
    FOREIGN KEY (CODVENT)
    REFERENCES Venta (CODVENT);

-- Referencia: Venta_JefeSurcursal (Tabla: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_JefeSurcursal
    FOREIGN KEY (DNIJEF)
    REFERENCES JefeSurcursal (DNIJEF);

-- Referencia: Venta_Sucursal (Tabla: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Sucursal
    FOREIGN KEY (CODSUC)
    REFERENCES Sucursal (CODSUC);

-- Referencia: Venta_Vendedores (Tabla: Venta)
ALTER TABLE Venta ADD CONSTRAINT Venta_Vendedores
    FOREIGN KEY (DNIVEN)
    REFERENCES Vendedores (DNIVEN);

-- End of file.




--Insertando registros de las tablas 
USE master

USE dbMESAJIL;
GO

-- Insertar Datos del Administrador
INSERT INTO Administrador
	(DNIADM, NOMADM, APEADM, CELADM) 
	VALUES 
('79245673','Julio','Perez','935356254')
GO
SELECT * FROM Administrador
GO

-- Insertar Datos del JefeSurcursal

 INSERT INTO JefeSurcursal
  (DNIJEF, NOMJEF, APEJEF, CELJEF, DNIADM) 
	VALUES 
('75245674','Julio','Perez','935356254','79245673'),
('74275873','Juan','Silva','985346254','79245673'),
('73244669','Lidia','Uribe','965386254','79245673')
GO
SELECT * FROM JefeSurcursal
GO

-- Insertar Datos de los Vendedores
INSERT INTO Vendedores
 (DNIVEN, NOMVEN, APEVEN, CELVEN, DNIADM, DNIJEF)
	VALUES
('15245673','Ruben','Venegas','935356254','79245673','75245674'),
('14275873','Julian','Gutierrez','985346254','79245673','74275873'),
('15245643','Roberto','Garcia','935356254','79245673','73244669')
GO

SELECT * FROM Vendedores
GO


-- Insertar Datos de los Productos
 INSERT INTO Productos
  ( NOMPROD, PREPROD, STOPROD, DATTECPROD , CATPROD, DNIJEF, DNIVEN) 
	VALUES 
('Cooler','127.68','10','70x60','Accesorios','75245674','15245673'),
('EstucheCase','39.90','15','50x50','Accesorios','75245674','15245643'),
('Funda Klip','29.30','10','60x50','Accesorios','75245674','15245673'),
('Cable Fuente Poder','7.98','20','2M','AdaptadoresyCables','75245674','15245673'),
('Cargador de corriente','71.82','10','1.50M','AdaptadoresyCables','75245674','14275873'),
('Adaptador HP','135.66','10','1M','AdaptadoresyCables','75245674','15245643'),
('Case Antryx RX','335.16','10','1 kg','ComponentesPC','75245674','15245643'),
('HP 200 G4 Intel','2054.85','20','8ram1TR','Computadoras','75245674','15245643'),
('Impresora BIXOLON','957.90','5','BluetoothUSB','Impresoras','75245674','15245673'),
('Impresora CANON','794.01','8','SistemaContinuo','Impresoras','75245674','15245673'),
('Impresora HP','422.94','11','Multifuncional','Impresoras','75245674','15245643'),
('All In One HP','100.01','12','8RAM','Computadoras','75245674','15245673')
GO

SELECT * FROM Productos
GO


-- Insertar Datos de la Sucursal
 INSERT INTO Sucursal
  (LUGSUC, DNIADM ) 
	VALUES 
('Lima','79245673'),
('Cañete','79245673'),
('Chincha','79245673')
GO

SELECT * FROM Sucursal
GO


-- Formato de fecha 


SET DATEFORMAT dmy 
GO

-- Insertar Datos de la Venta
INSERT INTO Venta
 (TOTVENT, CANPROVENT, FECVEN, DNIADM, DNIJEF, CODSUC, DNIVEN)
	VALUES


('1000','12','21/07/10', '79245673', '75245674','01','15245673'),
('900','8','21/08/01', '79245673', '73244669','02','14275873'),
('1200','2','21/09/20', '79245673', '74275873','03','15245643')
GO

SELECT * FROM Venta
GO


-- Insertar Datos de la Venta_Detalle
INSERT INTO Venta_Detalle
 (CODVENT, CODPROD)
	VALUES
('2','3'),
('3','9'),
('1','8')
GO

SELECT * FROM Venta_Detalle
GO





-- Creando Vistas 
-- Vista 1




CREATE VIEW vwAdministrador
AS
SELECT 
	V.CANPROVENT AS 'Equipos Vendidos',
	(V.CANPROVENT * V.TOTVENT) AS 'Monto de Venta',
	S.LUGSUC AS 'Sucursal'
FROM dbo.Vendedores AS VE
INNER JOIN dbo.Venta AS V
ON VE.DNIVEN = V.DNIVEN
INNER JOIN dbo.Sucursal AS S
ON V.CODSUC = S.CODSUC
GO



-- Vista 2

CREATE VIEW vwVendedor
AS
SELECT 
(VE.NOMVEN) + ', ' + (VE.APEVEN) AS 'Vendedor',
V.CANPROVENT AS 'Rankig de Vendedores'
FROM dbo.Vendedores AS VE
INNER JOIN dbo.Venta AS V
ON VE.DNIVEN = V.DNIVEN
GO

-- Vista 3


CREATE VIEW vwVendedores
AS
SELECT 
(VE.NOMVEN) + ', ' + (VE.APEVEN) AS 'Vendedor',
	V.FECVEN AS 'Fecha de Venta',
	V.CANPROVENT AS 'Equipos Vendidos'
FROM dbo.Vendedores AS VE
INNER JOIN dbo.Venta AS V
ON VE.DNIVEN = V.DNIVEN

GO