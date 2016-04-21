--Ejercicio 8. Crear y cargar una tabla, y modificar su estructura.

--Creamos la tabla contratado con las columnas solicitadas.
CREATE TABLE CONTRATADO
AS (SELECT T.DNI, T.NOMBRE, T.ONG, T.FECHAINGRESO, T.SUELDO, COUNT(*) AS NUMPARTICIPACIONES
    FROM PARTICIPACION P, TRABAJADOR T
    WHERE P.TRABAJADOR=T.DNI AND P.ONG=T.ONG AND T.DNI IN (SELECT C.SOCIO
                                                          FROM COLABORACION C
                                                          GROUP BY C.SOCIO
                                                          HAVING COUNT(DISTINCT C.ONG) < 3                                                   
                                                          )
    GROUP BY T.DNI, T.NOMBRE, T.ONG, T.FECHAINGRESO, T.SUELDO
);

--Comprobamos que se ha creado correctamente.
SELECT * FROM CONTRATADO;

--Añadimos la columna jefe a la tabla, con el valor por defecto 'SIN JEFE'
ALTER TABLE CONTRATADO ADD jefe VARCHAR(40) DEFAULT 'SIN JEFE';

--Actualizamos el valor de la columna jefe con los responsables de las ONGs 
--en las que trabaja cada contratado.
UPDATE CONTRATADO
SET JEFE = (SELECT T.NOMBRE
            FROM ONG G, TRABAJADOR T
            WHERE G.RESPONSABLE=T.DNI AND CONTRATADO.ONG=T.ONG                
            ) 
WHERE JEFE='SIN JEFE'
;

--Comprobamos que los datos son correctos.
SELECT * FROM CONTRATADO;

--Eliminamos la columna jefe.
ALTER TABLE CONTRATADO DROP COLUMN JEFE;