--Ejercicio 9. Restricciones de integridad.

--En oracle no se pueden crear asertos, que es el mecanismo necesario para resolver
--este ejercicio de manera práctica. Por tanto, se presentan en cada apartado la
--forma en la que se haría el aserto y, a continuación, una sentencia select que muestra
--las filas que violan la restricción de integridad correspondiente.

--RI1. Un trabajador sólo puede participar en proyectos de su ONG.
--Simulación del aserto.
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
--Simulación del aserto.
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

--RI3. Un trabajador no puede ser responsable de más de una ONG.
--Esta restricción se puede implementar con una sentencia CONSTRAINT .. UNIQUE
--de la siguiente forma. Esta restricción ya está implementada en el ejercicio
--nº1, en la creación de las tablas, justamente después de activar la clave ajena
--trabajador en ONG.
ALTER TABLE ONG ADD CONSTRAINT unico_responsable UNIQUE (RESPONSABLE);

--RI4. El responsable de una ONG ha de ser uno de entre los trabajadores contratados por tal ONG.
--Simulación del aserto.
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
--Simulación del aserto.
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