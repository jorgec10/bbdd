--Ejercicio 1. Creación de las tablas.

-- ONG (codigo, nombre, email, telf, provincia, campo, responsable) 
CREATE TABLE ONG (
  codigo            CHAR(3),
  nombre            VARCHAR(30) NOT NULL,
  email             VARCHAR(30) NULL,
  telf             NUMBER(9)	NULL,
  provincia         VARCHAR(20) NULL,
  campo             VARCHAR(40) NULL,
  responsable       CHAR(9) NOT NULL,
  
  CONSTRAINT ong_pk PRIMARY KEY(codigo)
  --ON DELETE CASCADE
  --ON UPDATE CASCADE
);

-- TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas,
-- sueldo)
CREATE TABLE TRABAJADOR (
  dni               CHAR(9),
  nombre            VARCHAR(40) NOT NULL,
  ong               CHAR(3) NOT NULL,
  fechaingreso      DATE NULL,
  esvoluntario      CHAR(1) NOT NULL,
  nacimiento        DATE NULL,
  profesion         VARCHAR(20) NULL,
  horas             NUMBER(3,1) NULL,
  sueldo            NUMBER(6,1) NULL,
  
  CONSTRAINT trabajador_pk PRIMARY KEY(dni),
  CONSTRAINT trabajador_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo),
  CONSTRAINT trabajador_rangovoluntario CHECK (esvoluntario IN ('S','N')),
  CONSTRAINT trabajador_sueldovoluntario CHECK ((esvoluntario ='S' AND sueldo=0) 
                                                OR (esvoluntario='N' AND sueldo>0)),
  CONSTRAINT trabajador_fechascorrectas CHECK (nacimiento < fechaingreso),
  CONSTRAINT trabajador_horas CHECK (horas>0)
  --ON DELETE CASCADE
  --ON UPDATE CASCADE  
);

--Añadimos la fk a ong, ahora que ya esta creada la tabla trabajador
ALTER TABLE ONG ADD CONSTRAINT ong_fk_tabajador
  FOREIGN KEY(responsable) REFERENCES TRABAJADOR(dni);

--Añadimos la restriccion para que cada ong tenga un único responsable
ALTER TABLE ONG ADD CONSTRAINT unico_responsable UNIQUE (responsable);
  
-- SOCIO (dni, nombre)
CREATE TABLE SOCIO (
  dni               CHAR(9),
  nombre            VARCHAR(30) NOT NULL,
 
  CONSTRAINT socio_pk PRIMARY KEY(dni)
  --ON DELETE CASCADE
  --ON UPDATE CASCADE
);

-- COLABORACION (ong, socio, fechaalta, cuota)
CREATE TABLE COLABORACION (
  ong               CHAR(3),
  socio             CHAR(9),
  fechaalta         DATE NULL,
  cuota             NUMBER(4,1) NULL,
  
  CONSTRAINT colaboracion_pk PRIMARY KEY(ong, socio),
  CONSTRAINT colaboracion_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo),
  CONSTRAINT colaboracion_fk_socio FOREIGN KEY(socio) 
        REFERENCES SOCIO(dni),
  CONSTRAINT colaboracion_cuota CHECK (cuota>0)
  --ON DELETE CASCADE
  --ON UPDATE CASCADE
);

-- PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
CREATE TABLE PROYECTO (
  ong               CHAR(3),
  idproyecto        CHAR(2),
  objetivo          VARCHAR(40) NULL,
  pais              VARCHAR(20) NULL,
  zona              VARCHAR(20) NULL,
  numbeneficiarios  NUMBER(4,1) NULL,
  
  CONSTRAINT proyecto_pk PRIMARY KEY(ong, idproyecto),
  CONSTRAINT proyecto_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo),
  CONSTRAINT proyecto_numbeneficiarios CHECK (numbeneficiarios>0)
  --ON DELETE CASCADE
  --ON UPDATE CASCADE
);


-- ACCION (ong, idproyecto, idaccion, descripcion)
CREATE TABLE ACCION (
  ong               CHAR(3),
  idproyecto        CHAR(2),
  idaccion          CHAR(5),
  descripcion       VARCHAR(50) NULL,
  
  CONSTRAINT accion_pk PRIMARY KEY(ong, idproyecto, idaccion),
  CONSTRAINT accion_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo),
  CONSTRAINT accion_fk_proyecto FOREIGN KEY(ong, idproyecto) 
        REFERENCES PROYECTO(ong, idproyecto)
  --ON DELETE CASCADE
  --ON UPDATE CASCADE
);

-- PARTICIPACION (ong, idproyecto, idaccion, trabajador)
CREATE TABLE PARTICIPACION (
  ong               CHAR(3),
  idproyecto        CHAR(2),
  idaccion          CHAR(5),
  trabajador        CHAR(9),
  
  CONSTRAINT participacion_pk PRIMARY KEY(ong, idproyecto, idaccion, trabajador),
  CONSTRAINT participacion_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo),
  CONSTRAINT participacion_fk_idproyecto FOREIGN KEY(ong, idproyecto) 
        REFERENCES PROYECTO(ong, idproyecto),
  CONSTRAINT participacion_fk_idaccion FOREIGN KEY(ong, idproyecto, idaccion) 
        REFERENCES ACCION(ong, idproyecto, idaccion),   
  CONSTRAINT participacion_fk_trabajador FOREIGN KEY(trabajador) 
        REFERENCES TRABAJADOR(dni)
  --ON DELETE NO ACTION
  --ON UPDATE NO ACTION
);