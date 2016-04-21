--Ejercicio 5. Intercambiar los socios de dos ONG.

--Elegimos la O01 y la O02
--Comprobamos la clave primaria, nombre y nº de socios (10)
SELECT *
FROM ( SELECT O.CODIGO, O.NOMBRE, COUNT(S.DNI) AS NUM_SOCIOS 
        FROM ONG O, SOCIO S
        WHERE S.DNI IN( SELECT C.SOCIO
                        FROM COLABORACION C
                        WHERE O.CODIGO=C.ONG)
        GROUP BY O.CODIGO, O.NOMBRE)
WHERE CODIGO='O01';
--Comprobamos la clave primaria, nombre y nº de socios (6)
SELECT *
FROM ( SELECT O.CODIGO, O.NOMBRE, COUNT(S.DNI) AS NUM_SOCIOS 
        FROM ONG O, SOCIO S
        WHERE S.DNI IN( SELECT C.SOCIO
                        FROM COLABORACION C
                        WHERE O.CODIGO=C.ONG)
        GROUP BY O.CODIGO, O.NOMBRE)
WHERE CODIGO='O02';

--Desactivamos en primer lugar la clave ajena de colaboracion.
ALTER TABLE COLABORACION DISABLE CONSTRAINT colaboracion_fk_ong;

--Intercambiamos los socios de ambas ONG con ayuda de una variable temporal.
UPDATE COLABORACION
SET ONG='TMP'
WHERE ONG='O01';
UPDATE COLABORACION
SET ONG='O01'
WHERE ONG='O02';
UPDATE COLABORACION
SET ONG='O02'
WHERE ONG='TMP';
--Reactivamos la clave ajena.
ALTER TABLE COLABORACION ENABLE CONSTRAINT colaboracion_fk_ong;

--Comprobamos que se ha realizado el intercambio.
--Comprobamos la clave primaria, nombre y nº de socios (6, antes 10)
SELECT *
FROM ( SELECT O.CODIGO, O.NOMBRE, COUNT(S.DNI) AS NUM_SOCIOS 
        FROM ONG O, SOCIO S
        WHERE S.DNI IN( SELECT C.SOCIO
                        FROM COLABORACION C
                        WHERE O.CODIGO=C.ONG)
        GROUP BY O.CODIGO, O.NOMBRE)
WHERE CODIGO='O01';
--Comprobamos la clave primaria, nombre y nº de socios (10, antes 6)
SELECT *
FROM ( SELECT O.CODIGO, O.NOMBRE, COUNT(S.DNI) AS NUM_SOCIOS 
        FROM ONG O, SOCIO S
        WHERE S.DNI IN( SELECT C.SOCIO
                        FROM COLABORACION C
                        WHERE O.CODIGO=C.ONG)
        GROUP BY O.CODIGO, O.NOMBRE)
WHERE CODIGO='O02';

--Hacemos rollback
ROLLBACK;

--Comprobamos la clave primaria, nombre y nº de socios (6, antes 6)
SELECT *
FROM ( SELECT O.CODIGO, O.NOMBRE, COUNT(S.DNI) AS NUM_SOCIOS 
        FROM ONG O, SOCIO S
        WHERE S.DNI IN( SELECT C.SOCIO
                        FROM COLABORACION C
                        WHERE O.CODIGO=C.ONG)
        GROUP BY O.CODIGO, O.NOMBRE)
WHERE CODIGO='O01';
--Comprobamos la clave primaria, nombre y nº de socios (10, antes 10)
SELECT *
FROM ( SELECT O.CODIGO, O.NOMBRE, COUNT(S.DNI) AS NUM_SOCIOS 
        FROM ONG O, SOCIO S
        WHERE S.DNI IN( SELECT C.SOCIO
                        FROM COLABORACION C
                        WHERE O.CODIGO=C.ONG)
        GROUP BY O.CODIGO, O.NOMBRE)
WHERE CODIGO='O02';

--Como podemos observar, el rollback no ha funcionado. Esto se debe a que rollback
--solo funciona con los datos que son modificados haciendo uso de sentencias DML.
--No tiene efecto ninguno sobre modificaciones hechas mediante sentencias DDL, como
--en este caso.