-- Bases de datos. Práctica P1. Consultas en SQL 
-- SCRIPT de CREACIÓN del esquema ECOTURISMO
-- e INSERCIÓN de datos 

-- Para ejecutar desde Oracle SQL Developer

-- **NO** ejecutar en los laboratorios, 
-- sino SÓLO vía Oracle Express Edition, en el PC propio**

-- SENTENCIAS DE CREACIÓN DE ELEMENTOS DEL ESQUEMA
-- Ejecutable varias veces: las DROP fallan la primera vez (normal)
DROP TABLE PLAN; 
DROP TABLE TIPOPLAN; 
DROP TABLE EMPLEADO; 
DROP TABLE DORMITORIO; 
DROP TABLE CASA;

-- CASA (idcasa, nombre, ciudad, telefono)
-- Alojamientos: casas rurales, fincas, albergues, etc.
CREATE TABLE CASA (
  idcasa	CHAR(4),
  nombre	VARCHAR(30) NOT NULL,
  ciudad	VARCHAR(30) NOT NULL,
  telefono	NUMBER(9) NOT NULL,
  CONSTRAINT casa_pk PRIMARY KEY(idcasa)
);

-- DORMITORIO (idcasa, iddorm, numcamas, wc, precio)

CREATE TABLE DORMITORIO (
  idcasa	CHAR(4), 
  iddorm	CHAR(2), 
  numcamas	NUMBER(2) DEFAULT 2 NOT NULL, 
  wc		CHAR(1) DEFAULT 'N' NOT NULL, 
  precio	NUMBER(5,2) NOT NULL,
  CONSTRAINT dormitorio_pk PRIMARY KEY(idcasa, iddorm),
  CONSTRAINT dormitorio_fk_casa FOREIGN KEY(idcasa) 
	REFERENCES CASA(idcasa)
	ON DELETE CASCADE, -- debil en identificacion
  CONSTRAINT dormitorio_numcamas CHECK (numcamas IN (1, 2, 3)),
  CONSTRAINT dormitorio_wc CHECK (wc IN ('S', 'N')),
  CONSTRAINT dormitorios_precio CHECK (precio > 0)
);

-- EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)

CREATE TABLE EMPLEADO (
  dni		 CHAR(9),
  nombre	 VARCHAR(15) NOT NULL,
  telefono	 NUMBER(9)	NULL,
  contratado DATE NOT NULL,
  sueldo	 NUMBER(6,2) NOT NULL,
  idcasa	 CHAR(4) NOT NULL,
  CONSTRAINT empleados_pk PRIMARY KEY(dni), 
  CONSTRAINT empleados_fk_casa FOREIGN KEY(idcasa) 
	REFERENCES CASA(idcasa) 
);

-- TIPOPLAN (idtipo, descripcion, nivel)
-- Posibles planes que las casas pueden organizar
CREATE TABLE TIPOPLAN (
  idtipo		NUMBER(4),
  descripcion	VARCHAR(40) NOT NULL, 
  nivel			NUMBER(1) DEFAULT 1 NOT NULL,
  CONSTRAINT tipoplan_pk PRIMARY KEY(idtipo),
  CONSTRAINT tipoplan_nivel CHECK (nivel IN (1, 2, 3, 4, 5))
);

-- PLAN (casa, tipoplan, diasemana, turno, monitor)
-- Planes de actividades ofertados por las casas
CREATE TABLE PLAN (
  casa		CHAR(4), 
  tipoplan	NUMBER(4), 
  diasemana	VARCHAR(9) NOT NULL, 
  turno		CHAR(1) NOT NULL, 
  monitor	CHAR(9) NOT NULL,
  CONSTRAINT plan_pk PRIMARY KEY(casa,tipoplan,diasemana),
  CONSTRAINT plan_fk_casa FOREIGN KEY(casa) 
	REFERENCES CASA(idcasa) 
	ON DELETE CASCADE,
  CONSTRAINT plan_fk_tipoactividad FOREIGN KEY(tipoplan) 
	REFERENCES TIPOPLAN(idtipo),
  CONSTRAINT plan_fk_empleado FOREIGN KEY(monitor) 
	REFERENCES EMPLEADO(dni),
  CONSTRAINT plan_turno CHECK (turno IN ('M', 'T')),
  CONSTRAINT plan_diasemana CHECK 
     (diasemana IN ('LUNES','MARTES','MIERCOLES','JUEVES','VIERNES','SABADO','DOMINGO'))
);

-- SENTENCIAS DE INTRODUCCIÓN DE DATOS EN LAS TABLAS

DELETE FROM PLAN;
DELETE FROM TIPOPLAN;
DELETE FROM EMPLEADO;
DELETE FROM DORMITORIO;
DELETE FROM CASA;

-- CASA (idcasa, nombre, ciudad, telefono)

INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C01', 'LOS CUATRO VIENTOS', 'MORATALLA', 968730362);
INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C02', 'VILLA ARRIBA', 'PLIEGO', 968667220);
INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C03', 'EL CARAVACON', 'CARAVACA DE LA CRUZ', 626708827);
INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C04', 'EL VIEJO ESTABLO', 'LA MATANZA', 670345326);
INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C05', 'CASA DULCE', 'CARAVACA DE LA CRUZ', 968708689);
INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C06', 'FUENTE DEL PINAR', 'YECLA', 670264962);
INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C07', 'LA CUEVA DEL GRILLO', 'ALHAMA DE MURCIA', 968633438);
INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C08', 'CASA DEL SAUCE', 'MORATALLA', 968736396);
INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C09', 'CASA DEL BUITRE', 'MORATALLA', 968736396);
INSERT INTO CASA (idcasa, nombre, ciudad, telefono)
VALUES ('C10', 'CASA DEL GAÑAN', 'MORATALLA', 968736396);

-- EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('11111111A', 'HERMINIA', 611111111, TO_DATE('10/01/2002', 'dd/mm/yyyy'), 1000, 'C01');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('22222222B', 'ANACLETA', 622222222, TO_DATE('01/03/1999', 'dd/mm/yyyy'), 600, 'C01');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('33333333C', 'HONORATO', 633333333, TO_DATE('09/05/1988', 'dd/mm/yyyy'), 700, 'C01');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('44444444D', 'JACINTA', 644444444, TO_DATE('01/01/2000', 'dd/mm/yyyy'), 900, 'C01');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('55555555E', 'ARCADIO', 655555555, TO_DATE('01/01/2010', 'dd/mm/yyyy'), 350, 'C01');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('66666666F', 'LIBORIA', 666666666, TO_DATE('03/12/1989', 'dd/mm/yyyy'), 1020, 'C01');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('77777777G', 'LEOPOLDO', 677777777, TO_DATE('01/12/2011', 'dd/mm/yyyy'), 600, 'C01');

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('12121212T', 'TOLENTINA', 121212121, TO_DATE('19/03/2011', 'dd/mm/yyyy'), 900, 'C02');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('21212121E', 'EUSEBIO', 212121212, TO_DATE('17/06/2013', 'dd/mm/yyyy'), 800, 'C02');

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('88888888H', 'BALDOMERO', 688888888, TO_DATE('19/03/2009', 'dd/mm/yyyy'), 450, 'C03');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('99999999I', 'CASILDA', 699999999, TO_DATE('28/02/1999', 'dd/mm/yyyy'), 820, 'C03');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('11223344J', 'MODESTA', 611223344, TO_DATE('21/03/2014', 'dd/mm/yyyy'), 1000, 'C03');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('22334455K', 'MARCIAL', 622334455, TO_DATE('18/04/2012', 'dd/mm/yyyy'), 350, 'C03');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('33445566L', 'TEOBALDO', 633445566, TO_DATE('26/02/2013', 'dd/mm/yyyy'), 620, 'C03');

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('44556677M', 'FLORENTINA', 644556677, TO_DATE('01/01/2002', 'dd/mm/yyyy'), 1000, 'C04');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('55667788N', 'VISITACION', 655667788, TO_DATE('15/05/2004', 'dd/mm/yyyy'), 700, 'C04');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('66778899O', 'FILOMENO', 666778899, TO_DATE('13/03/2007', 'dd/mm/yyyy'), 600, 'C04');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('77889900P', 'VICTORIANO', 677889900, TO_DATE('20/08/2007', 'dd/mm/yyyy'), 550, 'C04');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('88990011Q', 'GUMERSINDA', 688990011, TO_DATE('07/07/2010', 'dd/mm/yyyy'), 700, 'C04');

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('99001122R', 'ZACARIAS', 699001122, TO_DATE('13/01/2008', 'dd/mm/yyyy'), 350, 'C05');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('11112222S', 'GERVASIO', 611112222, TO_DATE('09/10/2009', 'dd/mm/yyyy'), 800, 'C05');

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('22223333T', 'NICANOR', 622223333, TO_DATE('28/07/1999', 'dd/mm/yyyy'), 1020, 'C06');

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('33334444U', 'DESIDERIA', 633334444, TO_DATE('08/08/2010', 'dd/mm/yyyy'), 1000, 'C07');

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('44445555V', 'POLONIA', 644445555, TO_DATE('03/09/2008', 'dd/mm/yyyy'), 1020, 'C08');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('55556666W', 'CONRADO', 655556666, TO_DATE('09/10/2005', 'dd/mm/yyyy'), 900, 'C08');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('66667777X', 'POLICARPO', 666667777, TO_DATE('11/05/2005', 'dd/mm/yyyy'), 720, 'C08');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('77778888Y', 'DAMASO', 677778888, TO_DATE('06/04/2015', 'dd/mm/yyyy'), 1000, 'C08');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('88889999Z', 'ELPIDIA', 688889999, TO_DATE('22/01/2014', 'dd/mm/yyyy'), 600, 'C08');

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('99990000A', 'SINFOROSA', 699990000, TO_DATE('30/01/2012', 'dd/mm/yyyy'), 700, 'C09');
INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('12345678B', 'RUPERTO', 612345678, TO_DATE('01/11/2010', 'dd/mm/yyyy'), 900, 'C09');

INSERT INTO EMPLEADO (dni, nombre, telefono, contratado, sueldo, idcasa)
VALUES ('23456789C', 'SATURNINO', 623456789, TO_DATE('01/12/1998', 'dd/mm/yyyy'), 1000, 'C10');

-- DORMITORIO (idcasa, iddorm, numcamas, wc, precio)

INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C01', 'D1', 2, 'N', 105);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C01', 'D2', 3, 'N', 15);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C01', 'D3', 3, 'N', 15);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C01', 'D4', 2, 'N', 110);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C01', 'D5', 2, 'S', 150);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C01', 'D6', 3, 'N', 25);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C01', 'D7', 1, 'S', 10);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C01', 'D8', 1, 'N', 80);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C01', 'D9', 1, 'N', 128);

INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C02', 'D1', 2, 'N', 20);

INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C03', 'D1', 2, 'N', 150);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C03', 'D2', 3, 'N', 20);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C03', 'D3', 1, 'S', 55);

INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C04', 'D1', 2, 'N', 30);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C04', 'D2', 2, 'S', 135);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C04', 'D3', 2, 'N', 30);

INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C05', 'D1', 1, 'N', 20);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C05', 'D2', 2, 'N', 105);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C05', 'D3', 3, 'N', 20);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C05', 'D4', 3, 'N', 20);

INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C06', 'D1', 1, 'N', 115);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C06', 'D2', 1, 'N', 105);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C06', 'D3', 2, 'S', 25);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C06', 'D4', 3, 'N', 25);


INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C07', 'D1', 3, 'N', 20);

INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C08', 'D1', 1, 'S', 35);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C08', 'D2', 1, 'N', 35);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C08', 'D3', 2, 'N', 30);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C08', 'D4', 3, 'S', 140);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C08', 'D5', 3, 'N', 115);

INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C09', 'D1', 2, 'N', 100);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C09', 'D2', 2, 'N', 110);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C09', 'D3', 2, 'S', 20);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C09', 'D4', 2, 'N', 30);

INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C10', 'D1', 2, 'N', 120);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C10', 'D2', 1, 'S', 10);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C10', 'D3', 3, 'S', 20);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C10', 'D4', 2, 'N', 110);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C10', 'D5', 2, 'S', 25);
INSERT INTO DORMITORIO (idcasa, iddorm, numcamas, wc, precio)
VALUES ('C10', 'D6', 1, 'N', 35);

-- TIPOPLAN (idtipo, descripcion, nivel)

INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(0, 'EXCURSION POR EL MONTE', 3);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(1, 'EXCURSION POR EL MARGEN DEL RIO', 2);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(2, 'DESCENSO EN BARCA POR EL RIO', 4);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(3, 'EXCURSION POR EL VALLE', 1);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(4, 'ESCALADA', 5);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(5, 'ASCENSO A LA CIMA DE LA MONTAÑA', 4);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(6, 'PARAPENTE DESDE LA CIMA DEL MONTE', 5);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(7, 'SENDERISMO', 3);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(8, 'PASEO POR EL PUEBLO', 1);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(9, 'VISITA AL MUSEO ARQUEOLOGICO', 1);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(10, 'PUENTING', 5);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(11, 'PASEO POR EL BOSQUE', 1);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(12, 'RECOLECCION DE FRUTOS SILVESTRES', 2);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(13, 'RECOLECCION DE CARACOLES', 1);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(14, 'PASEO EN BARCA POR EL LAGO', 3);
INSERT INTO TIPOPLAN (idtipo, descripcion, nivel)
VALUES(15, 'AVISTAMIENTO DE AVES', 2);

-- PLAN (casa, tipoplan, diasemana, turno, monitor)

INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C01', 6, 'DOMINGO', 'M', '22222222B');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C01', 3, 'SABADO', 'M', '44444444D');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C01', 8, 'SABADO', 'T', '33333333C');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C01', 11, 'DOMINGO', 'M', '55555555E');

INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C03', 4, 'MARTES', 'T', '33445566L');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C03', 4, 'JUEVES', 'T', '33445566L');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C03', 7, 'SABADO', 'M', '99999999I');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C03', 10, 'DOMINGO', 'M', '99999999I');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C03', 12, 'DOMINGO', 'T', '33445566L');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C03', 9, 'VIERNES', 'T', '88888888H');

INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 0, 'MARTES', 'T', '55667788N');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 4, 'SABADO', 'T', '88990011Q');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 12, 'VIERNES', 'T', '88990011Q');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 8, 'MIERCOLES', 'T', '55667788N');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 11, 'DOMINGO', 'M', '55667788N');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 6, 'JUEVES', 'T', '88990011Q');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 4, 'VIERNES', 'T', '55667788N');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 6, 'SABADO', 'M', '88990011Q');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 4, 'DOMINGO', 'M', '44556677M');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 6, 'MARTES', 'T', '66778899O');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 14, 'MARTES', 'T', '66778899O');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C04', 7, 'MARTES', 'M', '66778899O');

INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C06', 10, 'VIERNES', 'M', '22223333T');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C06', 4, 'JUEVES', 'T', '22223333T');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C06', 10, 'SABADO', 'T', '22223333T');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C06', 6, 'LUNES', 'M', '22223333T');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C06', 3, 'SABADO', 'M', '22223333T');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C06', 6, 'MIERCOLES', 'M', '22223333T');

INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C07', 3, 'LUNES', 'M', '33334444U');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C07', 5, 'MIERCOLES', 'M', '33334444U');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C07', 5, 'SABADO', 'M', '33334444U');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C07', 9, 'VIERNES', 'M', '33334444U');

INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C08', 4, 'SABADO', 'T', '88889999Z');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C08', 10, 'DOMINGO', 'T', '55556666W');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C08', 6, 'DOMINGO', 'T', '88889999Z');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C08', 6, 'SABADO', 'T', '55556666W');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C08', 9, 'VIERNES', 'T', '88889999Z');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C08', 13, 'VIERNES', 'M', '88889999Z');

INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C09', 8, 'LUNES', 'M', '12345678B');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C09', 8, 'MIERCOLES', 'T', '99990000A');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C09', 8, 'VIERNES', 'M', '12345678B');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C09', 10, 'SABADO', 'T', '99990000A');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C09', 10, 'MARTES', 'M', '99990000A');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C09', 12, 'MARTES', 'T', '12345678B');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C09', 12, 'JUEVES', 'T', '99990000A');

INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C10', 0, 'LUNES', 'M', '23456789C');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C10', 0, 'MARTES', 'M', '23456789C');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C10', 0, 'VIERNES', 'T', '23456789C');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C10', 6, 'LUNES', 'T', '23456789C');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C10', 6, 'JUEVES', 'M', '23456789C');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES('C10', 13, 'VIERNES', 'M', '23456789C');
INSERT INTO PLAN (casa, tipoplan, diasemana, turno, monitor)
VALUES ('C10', 7, 'MARTES', 'T', '23456789C');

-- confirmación de los datos introducidos en las tablas:
COMMIT;
