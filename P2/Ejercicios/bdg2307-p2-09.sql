--Ejercicio 9. Restricciones de integridad.

--En oracle no se pueden crear asertos, que es el mecanismo necesario para resolver
--este ejercicio de manera pr�ctica. Por tanto, se presentan en cada apartado la
--forma en la que se har�a el aserto y, a continuaci�n, una sentencia select que muestra
--las filas que violan la restricci�n de integridad correspondiente.

--RI1. Un trabajador s�lo puede participar en proyectos de su ONG.
--Simulaci�n del aserto.
CREATE ASSERTION RI1
  CHECK (NOT EXISTS(  SELECT *
                      FROM TRABAJADOR T, PARTICIPACION P
                      WHERE P.TRABAJADOR=T.DNI AND P.ONG <> T.ONG
                   )
        )
;
--Sentencia select que muestra las filas que violan RI1
SELECT *
FROM TRABAJADOR T, PARTICIPACION P
WHERE P.TRABAJADOR=T.DNI AND P.ONG <> T.ONG
;

--RI2. Una persona no puede ser socio y trabajador de la misma ONG.
--Simulaci�n del aserto.
CREATE ASSERTION RI2
  CHECK (NOT EXISTS(  SELECT *
                      FROM COLABORACION C, TRABAJADOR T
                      WHERE T.DNI=C.SOCIO AND T.ONG=C.ONG                     
                   )
        )
;

--Sentencia select que muestra las filas que violan RI2
SELECT DISTINCT NOMBRE
FROM COLABORACION C, TRABAJADOR T
WHERE T.DNI=C.SOCIO AND T.ONG=C.ONG
;

--RI3. Un trabajador no puede ser responsable de m�s de una ONG.
--Esta restricci�n se puede implementar con una sentencia CONSTRAINT .. UNIQUE
--de la siguiente forma. Esta restricci�n ya est� implementada en el ejercicio
--n�1, en la creaci�n de las tablas, justamente despu�s de activar la clave ajena
--trabajador en ONG.
ALTER TABLE ONG ADD CONSTRAINT unico_responsable UNIQUE (RESPONSABLE);

--RI4. El responsable de una ONG ha de ser uno de entre los trabajadores contratados por tal ONG.
--Simulaci�n del aserto.
CREATE ASSERTION RI2
  CHECK (NOT EXISTS(  SELECT *
                      FROM ONG G, TRABAJADOR T
                      WHERE G.RESPONSABLE=T.DNI AND G.CODIGO<>T.ONG                    
                   )
        )
;

--Sentencia select que muestra las filas que violan RI4
SELECT *
FROM ONG G, TRABAJADOR T
WHERE G.RESPONSABLE=T.DNI AND G.CODIGO<>T.ONG
;

--RI5. Un socio debe serlo al menos de una ONG.
--Simulaci�n del aserto.
CREATE ASSERTION RI2
  CHECK (NOT EXISTS(  SELECT *
                      FROM COLABORACION 
                      WHERE SOCIO NOT IN( SELECT DNI
                                        FROM SOCIO
                                        )                  
                   )
        )
;

--Sentencia select que muestra las filas que violan RI5
SELECT *
FROM COLABORACION 
WHERE SOCIO NOT IN( SELECT DNI
                  FROM SOCIO
                  )
;