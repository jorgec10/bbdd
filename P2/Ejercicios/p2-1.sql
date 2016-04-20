DROP TABLE PARTICIPACION;
DROP TABLE ACCION;
DROP TABLE PROYECTO;
DROP TABLE COLABORACION; 
DROP TABLE SOCIO;
DROP TABLE TRABAJADOR CASCADE CONSTRAINT;
DROP TABLE ONG;


-- ONG (codigo, nombre, email, telf, provincia, campo, responsable) 
CREATE TABLE ONG (
  codigo            CHAR(5) NOT NULL,
  nombre            VARCHAR(30) NOT NULL,
  email             VARCHAR(30) NOT NULL,
  telf             NUMBER(9)	NULL,
  provincia         VARCHAR(20) NOT NULL,
  campo             VARCHAR(40) NOT NULL,
  responsable       CHAR(9) NULL,
  
  CONSTRAINT ong_pk PRIMARY KEY(codigo)
);
-- TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas,
-- sueldo)
CREATE TABLE TRABAJADOR (
  dni               CHAR(9),
  nombre            VARCHAR(50) NOT NULL,
  ong               CHAR(5) NOT NULL,
  fechaingreso      DATE NOT NULL,
  esvoluntario      CHAR(1) NOT NULL,
  nacimiento        DATE NOT NULL,
  profesion         VARCHAR(20) NULL,
  horas             NUMBER(3,1) NOT NULL,
  sueldo            NUMBER(6,1) NULL,
  
  CONSTRAINT trabajador_pk PRIMARY KEY(dni),
  CONSTRAINT trabajador_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo)
        -- on delete y on update  
);

--Añadimos la fk a ong, ahora que ya esta creada la tabla trabajador
ALTER TABLE ONG ADD CONSTRAINT ong_fk_tabajador
  FOREIGN KEY(responsable) REFERENCES TRABAJADOR(dni);


-- SOCIO (dni, nombre)
CREATE TABLE SOCIO (
  dni               CHAR(9) NOT NULL,
  nombre            VARCHAR(30) NOT NULL,
 
  CONSTRAINT socio_pk PRIMARY KEY(dni)
);


-- COLABORACION (ong, socio, fechaalta, cuota)
CREATE TABLE COLABORACION (
  ong               CHAR(5) NOT NULL,
  socio             CHAR(9) NOT NULL,
  fechaalta         DATE NOT NULL,
  cuota             NUMBER(4,1),
  
  CONSTRAINT colaboracion_pk PRIMARY KEY(ong, socio),
  CONSTRAINT colaboracion_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo),
        -- on delete y on update
  CONSTRAINT colaboracion_fk_socio FOREIGN KEY(socio) 
        REFERENCES SOCIO(dni)
        -- on delete y on update
);

-- PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
CREATE TABLE PROYECTO (
  ong               CHAR(5) NOT NULL,
  idproyecto        CHAR(5) NOT NULL,
  objetivo          VARCHAR(50) NOT NULL,
  pais              VARCHAR(20) NOT NULL,
  zona              VARCHAR(20) NOT NULL,
  numbeneficiarios  NUMBER(4,1),
  
  CONSTRAINT proyecto_pk PRIMARY KEY(ong, idproyecto),
  CONSTRAINT proyecto_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo)
        -- on delete y on update
);


-- ACCION (ong, idproyecto, idaccion, descripcion)
CREATE TABLE ACCION (
  ong               CHAR(5) NOT NULL,
  idproyecto        CHAR(5) NOT NULL,
  idaccion          CHAR(5) NOT NULL,
  descripcion       VARCHAR(50) NOT NULL,
  
  CONSTRAINT accion_pk PRIMARY KEY(ong, idproyecto, idaccion),
  CONSTRAINT accion_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo),
        -- on delete y on update
  CONSTRAINT accion_fk_proyecto FOREIGN KEY(ong, idproyecto) 
        REFERENCES PROYECTO(ong, idproyecto)
        --on delete y on update
);


-- PARTICIPACION (ong, idproyecto, idaccion, trabajador)
CREATE TABLE PARTICIPACION (
  ong               CHAR(5) NOT NULL,
  idproyecto        CHAR(5) NOT NULL,
  idaccion          CHAR(5) NOT NULL,
  trabajador        CHAR(9) NOT NULL,
  
  CONSTRAINT participacion_pk PRIMARY KEY(ong, idproyecto, idaccion, trabajador),
  CONSTRAINT participacion_fk_ong FOREIGN KEY(ong) 
        REFERENCES ONG(codigo),
        -- on delete y on update
  CONSTRAINT participacion_fk_idproyecto FOREIGN KEY(ong, idproyecto) 
        REFERENCES PROYECTO(ong, idproyecto),
        -- on delete y on update
  CONSTRAINT participacion_fk_idaccion FOREIGN KEY(ong, idproyecto, idaccion) 
        REFERENCES ACCION(ong, idproyecto, idaccion),
        -- on delete y on update      
  CONSTRAINT participacion_fk_trabajador FOREIGN KEY(trabajador) 
        REFERENCES TRABAJADOR(dni)
        -- on delete y on update
);



























