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

SELECT * FROM CONTRATADO;

ALTER TABLE CONTRATADO ADD jefe VARCHAR(40) DEFAULT 'SIN JEFE';

UPDATE CONTRATADO
SET JEFE = (SELECT T.NOMBRE
            FROM ONG G, TRABAJADOR T
            WHERE G.RESPONSABLE=T.DNI AND CONTRATADO.ONG=T.ONG                
            ) 
WHERE JEFE='SIN JEFE'
;
SELECT * FROM CONTRATADO;

ALTER TABLE CONTRATADO
DROP COLUMN JEFE;

SELECT * FROM CONTRATADO;
