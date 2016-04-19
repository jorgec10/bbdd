-- ONG (codigo, nombre, email, telf, provincia, campo, responsable) 

ALTER TABLE ONG DISABLE CONSTRAINT ong_fk_tabajador;

INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O01', 'MEDICOS SIN FRONTERAS', 'medicossinfronteras@ong.com', 964730362, 'Castellon', 'asistencia sanitaria', '90929946V');
INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O02', 'OXFAM INTERNATIONAL', 'oxfaminternational@ong.com', 986730362, 'Pontevedra', 'pobreza', '43201623P');
INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O03', 'BRAC', 'brac@ong.com', 958730362, 'Sevilla', 'desarrollo', '64225506C');
INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O04', 'THE WIKIMEDIA FOUNDATION', 'thewikimediafoundation@ong.com', 949730362, 'Vizcaya', 'conocimiento', '22060512A');
INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O05', 'ACUMEN FUND', 'acumenfund@ong.com', 945730362, 'Alava', 'desarrollo', '97425834G');
INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O06', 'DANISH REFUGEE COUNCIL', 'danishrefugeecouncil@ong.com', 923730362, 'Salamanca', 'ayuda humanitaria', '51130653Y');
INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O07', 'PARTNERS IN HEALTH', 'partnersinhealth@ong.com', 977730362, 'Tarragona', 'asistencia sanitaria', '23037540E');
INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O08', 'CERES', 'ceres@ong.com', 938730362, 'Barcelona', 'medio ambiente', '35518940B');
INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O09', 'CARE INTERNATIONAL', 'careinternational@ong.com', 968730362, 'Murcia', 'ayuda humanitaria', '86439637L');
INSERT INTO ONG (codigo, nombre, email, telf, provincia, campo, responsable)
VALUES ('O10', 'MERCY CORPS', 'mercycorps@ong.com', 987730362, 'Leon', 'ayuda humanitaria', '67618541B');
COMMIT;




-- TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
--Responsables
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('90929946V', 'Pepe Perez Martinez', 'O01', TO_DATE('28/02/1999', 'dd/mm/yyyy'), 'N', TO_DATE('10/08/1970', 'dd/mm/yyyy'), 'arquitecto', 30, 2000);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('43201623P', 'Jose Maria Lozano Cañizares', 'O02', TO_DATE('02/05/2001', 'dd/mm/yyyy'), 'N', TO_DATE('19/01/1981', 'dd/mm/yyyy'), 'veterinario', 25, 1700);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('64225506C', 'Maria Teresa Salamanca Torrao', 'O03', TO_DATE('30/07/1997', 'dd/mm/yyyy'), 'N', TO_DATE('04/03/1962', 'dd/mm/yyyy'), 'abogado', 10, 2500);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('22060512A', 'Antonio Ruiz Hidalgo', 'O04', TO_DATE('22/04/1998', 'dd/mm/yyyy'), 'N', TO_DATE('21/11/1971', 'dd/mm/yyyy'), 'escritor', 36, 2300);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('97425834G', 'Maria Del Monte Fernandez Castillo',  'O05', TO_DATE('13/10/1989', 'dd/mm/yyyy'), 'N', TO_DATE('10/08/1970', 'dd/mm/yyyy'), 'periodista', 26, 1850);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('51130653Y', 'Rocio Salvadora Peña', 'O06', TO_DATE('12/09/1984', 'dd/mm/yyyy'), 'N', TO_DATE('27/04/1956', 'dd/mm/yyyy'), 'arquitecto', 18, 1500);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('23037540E', 'Carmen Lomana De Los Santos', 'O07', TO_DATE('13/06/1992', 'dd/mm/yyyy'), 'N', TO_DATE('17/10/1962', 'dd/mm/yyyy'), 'actriz', 28, 2800);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('35518940B', 'Jose Antoño Perez Fulgencio', 'O08', TO_DATE('26/04/2013', 'dd/mm/yyyy'), 'N', TO_DATE('10/08/1970', 'dd/mm/yyyy'), 'cocinero', 15, 1400);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('86439637L', 'Belen Lopez Lopez', 'O09', TO_DATE('23/06/1995', 'dd/mm/yyyy'), 'N', TO_DATE('05/05/1973', 'dd/mm/yyyy'), 'albañil', 29, 1400);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('67618541B', 'Eduardo Sierra Belmonte', 'O10', TO_DATE('13/10/2014', 'dd/mm/yyyy'), 'N', TO_DATE('28/02/1986', 'dd/mm/yyyy'), 'informatico', 32, 3000);
--10
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('11376993S', 'Pedro Luis Sanchez Hidalgo', 'O01', TO_DATE('12/09/2015', 'dd/mm/yyyy'), 'N', TO_DATE('11/09/1972', 'dd/mm/yyyy'), 'arquitecto', 37, 3300);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('98344693R', 'Maria Jesus Fernandez Costa', 'O01', TO_DATE('12/05/2013', 'dd/mm/yyyy'), 'N', TO_DATE('25/08/1989', 'dd/mm/yyyy'), 'dentista', 12, 900);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('97285751A', 'Victor Almansa Jimenez', 'O01', TO_DATE('12/04/2005', 'dd/mm/yyyy'), 'N', TO_DATE('11/09/1976', 'dd/mm/yyyy'), 'futbolista', 14, 1000);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('98742638P', 'Antonio Martinez Menarguez', 'O04', TO_DATE('27/12/2003', 'dd/mm/yyyy'), 'S', TO_DATE('10/09/1989', 'dd/mm/yyyy'), 'informatico', 5, 0);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('87454153C', 'David Nortes Madrid', 'O10', TO_DATE('05/04/2008', 'dd/mm/yyyy'), 'S', TO_DATE('10/03/1980', 'dd/mm/yyyy'), 'barrendero', 3, 0);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('88692703S', 'Jose Teron Lopez', 'O05', TO_DATE('19/06/2000', 'dd/mm/yyyy'), 'N', TO_DATE('10/10/1970', 'dd/mm/yyyy'), 'abogado', 20, 1000);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('35469075Q', 'Javier Sanchez Rodriguez', 'O08', TO_DATE('12/10/1980', 'dd/mm/yyyy'), 'S', TO_DATE('20/01/1960', 'dd/mm/yyyy'), 'notario', 5, 0);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('44814049N', 'Maria Gomez Lorenzo', 'O02', TO_DATE('26/05/1999', 'dd/mm/yyyy'), 'S', TO_DATE('13/07/1988', 'dd/mm/yyyy'), 'repartidor', 10, 0);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('24971685G', 'Lorena Garcia Marin', 'O03', TO_DATE('09/10/2005', 'dd/mm/yyyy'), 'N', TO_DATE('29/08/1975', 'dd/mm/yyyy'), 'profesor', 15, 700);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('71295094G', 'Pedro Lopez Ballester', 'O07', TO_DATE('30/12/2001', 'dd/mm/yyyy'), 'N', TO_DATE('08/10/1985', 'dd/mm/yyyy'), 'atleta', 15, 700);
--20
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('83548716A', 'Laura Godoy Moreno', 'O06', TO_DATE('14/04/1984', 'dd/mm/yyyy'), 'S', TO_DATE('11/11/1960', 'dd/mm/yyyy'), 'contable', 4, 0);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('31913327S', 'Arturo Serrano Navas', 'O05', TO_DATE('04/10/1990', 'dd/mm/yyyy'), 'S', TO_DATE('11/11/1979', 'dd/mm/yyyy'), 'abogado', 2, 0);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('73710346E', 'Sara Lopez Fernandez', 'O10', TO_DATE('24/02/2004', 'dd/mm/yyyy'), 'S', TO_DATE('26/01/1979', 'dd/mm/yyyy'), 'contable', 7, 0);
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('27012870W', 'Enrique Perez Roldan', 'O02', TO_DATE('04/10/2000', 'dd/mm/yyyy'), 'S', TO_DATE('05/03/1973', 'dd/mm/yyyy'), 'jardinero', 6, 0);
--24
COMMIT;

ALTER TABLE ONG ENABLE CONSTRAINT ong_fk_tabajador;
  
ALTER TABLE TRABAJADOR ADD CONSTRAINT trabajador_esvoluntario CHECK ((esvoluntario ='S' AND sueldo=0) 
                                                                    OR (esvoluntario='N' AND sueldo>0));
ALTER TABLE TRABAJADOR ADD  CONSTRAINT trabajador_horas CHECK (horas>0);
        -- on delete y on update 





-- SOCIO (dni, nombre)
INSERT INTO SOCIO (dni, nombre)
VALUES ('65772743Q', 'Raul Roldan Fandiño');
INSERT INTO SOCIO (dni, nombre)
VALUES ('52837421C', 'Julio Guillamon Fornes');
INSERT INTO SOCIO (dni, nombre)
VALUES ('24338549P', 'Concepcion Velasco Criado');
INSERT INTO SOCIO (dni, nombre)
VALUES ('33083395Y', 'Antonia Hernan Queralt');
INSERT INTO SOCIO (dni, nombre)
VALUES ('33450672P', 'Francisca Mejia Sanguino');
INSERT INTO SOCIO (dni, nombre)
VALUES ('18046019X', 'Eva Parraga Rosas');
INSERT INTO SOCIO (dni, nombre)
VALUES ('53723858F', 'Albert Perez Monje');
INSERT INTO SOCIO (dni, nombre)
VALUES ('23553298F', 'Adrian Muñoz Calatayud');
INSERT INTO SOCIO (dni, nombre)
VALUES ('44048986M', 'Mariano Quiles de los Rios');
INSERT INTO SOCIO (dni, nombre)
VALUES ('35334097W', 'Ismael Ibañez Lluch');
--10
INSERT INTO SOCIO (dni, nombre)
VALUES ('26758712W', 'Adrian Jarque Marquez');
INSERT INTO SOCIO (dni, nombre)
VALUES ('63735745M', 'Maria Teresa Belda Guardiola');
INSERT INTO SOCIO (dni, nombre)
VALUES ('96221688P', 'Carmen Gongora Salgado');
INSERT INTO SOCIO (dni, nombre)
VALUES ('37412388C', 'Aitor Ayllon Sanjuan');
INSERT INTO SOCIO (dni, nombre)
VALUES ('89116783T', 'Alejandro Bastida Ramos');
INSERT INTO SOCIO (dni, nombre)
VALUES ('12692795R', 'Mario Berenguer Leyva');
INSERT INTO SOCIO (dni, nombre)
VALUES ('65233400G', 'Jose Carlos Paz Cardoso');
INSERT INTO SOCIO (dni, nombre)
VALUES ('73786870N', 'Samuel Morante Tinoco');
INSERT INTO SOCIO (dni, nombre)
VALUES ('58792660X', 'Juan Hussain Teixeira');
INSERT INTO SOCIO (dni, nombre)
VALUES ('78815166E', 'Carlos Nicolau Cardoso');
--20
INSERT INTO SOCIO (dni, nombre)
VALUES ('46364223N', 'Santiago Moya Pardo');
INSERT INTO SOCIO (dni, nombre)
VALUES ('29346993B', 'Gonzalo Bustamante Quilez');
INSERT INTO SOCIO (dni, nombre)
VALUES ('65896087A', 'Rafael Nicolau Rozas');
INSERT INTO SOCIO (dni, nombre)
VALUES ('43687995P', 'Daniel Cabrero Amoros');
INSERT INTO SOCIO (dni, nombre)
VALUES ('91677090C', 'Mariano Alguacil Galisteo');
INSERT INTO SOCIO (dni, nombre)
VALUES ('53927862N', 'Mario Esteban Cespedes');
INSERT INTO SOCIO (dni, nombre)
VALUES ('91015380N', 'Jose Angel Casanova Sala');
INSERT INTO SOCIO (dni, nombre)
VALUES ('56999932H', 'Luis Miguel Chinea Comino');
INSERT INTO SOCIO (dni, nombre)
VALUES ('79065140R', 'Fernando Real Collado');
INSERT INTO SOCIO (dni, nombre)
VALUES ('19652585K', 'Antonio Marcos Rangel');
--30
COMMIT;

-- COLABORACION (ong, socio, fechaalta, cuota)
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O01', '65772743Q', TO_DATE('21/09/2015', 'dd/mm/yyyy'), 103);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O02', '52837421C', TO_DATE('10/12/2015', 'dd/mm/yyyy'), 15);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O03', '24338549P', TO_DATE('16/10/2015', 'dd/mm/yyyy'), 153);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O01', '33083395Y', TO_DATE('07/12/2014', 'dd/mm/yyyy'), 392);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O03', '33450672P', TO_DATE('22/03/2013', 'dd/mm/yyyy'), 168);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O08', '18046019X', TO_DATE('18/05/2014', 'dd/mm/yyyy'), 703);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O02', '53723858F', TO_DATE('09/03/2013', 'dd/mm/yyyy'), 556);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O07', '23553298F', TO_DATE('05/06/2015', 'dd/mm/yyyy'), 166);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O07', '44048986M', TO_DATE('20/12/2011', 'dd/mm/yyyy'), 24);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O01', '35334097W', TO_DATE('05/05/2011', 'dd/mm/yyyy'), 571);
--10
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O10', '26758712W', TO_DATE('30/09/2011', 'dd/mm/yyyy'), 73);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O03', '63735745M', TO_DATE('17/03/2012', 'dd/mm/yyyy'), 908);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O06', '96221688P', TO_DATE('19/02/2015', 'dd/mm/yyyy'), 473);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O07', '37412388C', TO_DATE('30/12/2014', 'dd/mm/yyyy'), 240);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O01', '89116783T', TO_DATE('26/05/2014', 'dd/mm/yyyy'), 513);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O05', '12692795R', TO_DATE('13/06/2012', 'dd/mm/yyyy'), 846);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O08', '65233400G', TO_DATE('24/07/2014', 'dd/mm/yyyy'), 653);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O10', '73786870N', TO_DATE('27/12/2014', 'dd/mm/yyyy'), 515);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O05', '58792660X', TO_DATE('07/08/2015', 'dd/mm/yyyy'), 948);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O10', '78815166E', TO_DATE('15/01/2011', 'dd/mm/yyyy'), 960);
--20
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O09', '46364223N', TO_DATE('23/08/2014', 'dd/mm/yyyy'), 498);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O05', '29346993B', TO_DATE('28/12/2011', 'dd/mm/yyyy'), 31);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O10', '65896087A', TO_DATE('07/09/2012', 'dd/mm/yyyy'), 256);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O05', '43687995P', TO_DATE('13/09/2011', 'dd/mm/yyyy'), 317);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O06', '91677090C', TO_DATE('04/04/2012', 'dd/mm/yyyy'), 381);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O10', '53927862N', TO_DATE('26/09/2013', 'dd/mm/yyyy'), 640);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O02', '91015380N', TO_DATE('12/06/2011', 'dd/mm/yyyy'), 954);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O08', '56999932H', TO_DATE('08/08/2015', 'dd/mm/yyyy'), 303);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O03', '79065140R', TO_DATE('09/05/2014', 'dd/mm/yyyy'), 220);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O06', '19652585K', TO_DATE('24/05/2015', 'dd/mm/yyyy'), 229);
--30
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O04', '73786870N', TO_DATE('07/06/2011', 'dd/mm/yyyy'), 272);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O03', '33083395Y', TO_DATE('14/12/2013', 'dd/mm/yyyy'), 799);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O05', '65772743Q', TO_DATE('29/08/2015', 'dd/mm/yyyy'), 942);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O01', '53927862N', TO_DATE('20/05/2015', 'dd/mm/yyyy'), 569);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O01', '19652585K', TO_DATE('02/08/2014', 'dd/mm/yyyy'), 868);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O09', '78815166E', TO_DATE('02/09/2015', 'dd/mm/yyyy'), 309);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O01', '96221688P', TO_DATE('13/03/2011', 'dd/mm/yyyy'), 537);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O07', '33083395Y', TO_DATE('22/11/2012', 'dd/mm/yyyy'), 667);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O01', '52837421C', TO_DATE('28/10/2014', 'dd/mm/yyyy'), 515);
INSERT INTO COLABORACION (ong, socio, fechaalta, cuota)
VALUES('O01', '65896087A', TO_DATE('24/06/2015', 'dd/mm/yyyy'), 765);
--40
COMMIT;

ALTER TABLE COLABORACION ADD CONSTRAINT colaboracion_cuota CHECK (cuota>0);



-- PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O01', '07', 'Vacunación', 'Zambia', 'Sur', 91);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O01', '11', 'Vacunacion', 'Burkina Faso', 'Oeste', 702);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O02', '06', 'Hogar para personas sin techo', 'Perú', 'Norte', 675);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O02', '12', 'Hogar para personas sin techo', 'Somalia', 'Sur', 703);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O03', '08', 'Construir escuelas', 'Ecuador', 'Oeste', 539);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O04', '03', 'Investigación historia del pais', 'Angola', 'Sur', 230);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O05', '05', 'Construcción de infraestructuras', 'Nigeria', 'Este', 187);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O05', '08', 'Construir escuelas', 'Costa Rica', 'Este', 161);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O07', '04', 'Construir hospitales', 'Colombia', 'Sur', 635);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O06', '10', 'Comida para personas sin recursos', 'Chad', 'Norte', 386);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O06', '13', 'Comida para personas sin recursos', 'Nicaragua', 'Oeste', 429);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O06', '09', 'Ropa para personas sin recursos', 'Haití', 'Norte', 368);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O08', '01', 'Reforestación', 'Brasil', 'Sur', 641);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O08', '14', 'Reforestación', 'El Salvador', 'Sur', 622);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O09', '09', 'Ropa para personas sin recursos', 'Mali', 'Sur', 533);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O09', '02', 'Asitencia en desastres naturales', 'Bolivia', 'Este', 912);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O10', '02', 'Asitencia en desastres naturales', 'Ecuador', 'Oeste', 100);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O10', '09', 'Ropa para personas sin recursos', 'Paraguay', 'Oeste', 140);
INSERT INTO PROYECTO (ong, idproyecto, objetivo, pais, zona, numbeneficiarios)
VALUES('O10', '15', 'Asitencia en desastres naturales', 'Nepal', 'Sur', 957);
COMMIT;

ALTER TABLE PROYECTO ADD CONSTRAINT proyecto_numbeneficiarios CHECK (numbeneficiarios>0);

--ACCION (ong, idproyecto, idaccion, descripcion)
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O01', '07', '1', 'Fabricación de las vacunas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O01', '07', '2', 'Distribución de las vacunas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O01', '11', '1', 'Fabricación de las vacunas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O01', '11', '2', 'Distribución de las vacunas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O01', '07', '3', 'Aplicación de las vacunas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O02', '06', '1', 'Búsqueda de hogares disponibles');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O02', '06', '2', 'Asignación a las familias');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O02', '12', '1', 'Búsqueda de hogares disponibles');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O02', '12', '2', 'Asignación a las familias');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O03', '08', '1', 'Diseño y conseguir materiales');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O03', '08', '2', 'Construcción');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O04', '03', '1', 'Recabar información');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O04', '03', '2', 'Contraste de fuentes');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O05', '05', '1', 'Diseño y conseguir materiales');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O05', '05', '2', 'Construcción');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O05', '08', '1', 'Diseño y conseguir materiales');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O05', '08', '2', 'Construcción');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O06', '09', '1', 'Recogida de ropa en contenedores especiales');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O06', '09', '2', 'Reparto de las prendas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O06', '10', '1', 'Recolección de alimentos');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O06', '10', '2', 'Reparto a la población');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O06', '13', '1', 'Recolección de alimentos');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O06', '13', '2', 'Reparto a la población');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O07', '04', '1', 'Diseño y conseguir materiales');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O07', '04', '2', 'Construcción');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O08', '01', '1', 'Conseguir semillas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O08', '01', '2', 'Plantar semillas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O08', '14', '1', 'Conseguir semillas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O08', '14', '2', 'Plantar semillas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O09', '09', '1', 'Recogida de ropa en contenedores especiales');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O09', '09', '2', 'Reparto de las prendas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O09', '02', '1', 'Formación equipos y transporte');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O09', '02', '2', 'Asignación de tareas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O10', '02', '1', 'Formación equipos y transporte');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O10', '02', '2', 'Asignación de tareas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O10', '09', '1', 'Recogida de ropa en contenedores especiales');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O10', '09', '2', 'Reparto de las prendas');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O10', '15', '1', 'Formación equipos y transporte');
INSERT INTO ACCION (ong, idproyecto, idaccion, descripcion)
VALUES('O10', '15', '2', 'Asignación de tareas');
COMMIT;

-- PARTICIPACION (ong, idproyecto, idaccion, trabajador)
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O06', '09', '2', '83548716A');
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O04', '03', '1', '98742638P');
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O01', '07', '2', '11376993S');
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O01', '07', '1', '98344693R');
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O10', '02', '1', '87454153C');
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O05', '08', '2', '88692703S');
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O08', '01', '2', '35469075Q');
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O02', '06', '1', '44814049N');
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O03', '08', '1', '24971685G');
INSERT INTO PARTICIPACION (ong, idproyecto, idaccion, trabajador)
VALUES ('O07', '04', '2', '71295094G');
--10
COMMIT;



SELECT * FROM ACCION;
SELECT * FROM COLABORACION;
SELECT * FROM ONG;
SELECT * FROM PARTICIPACION;
SELECT * FROM PROYECTO;
SELECT * FROM SOCIO;
SELECT * FROM TRABAJADOR;
























