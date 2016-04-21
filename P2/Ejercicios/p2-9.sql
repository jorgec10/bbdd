--RI1. Un trabajador sólo puede participar en proyectos de su ONG.
-- Select: trabajadores que participan en proyectos de otras ongs
CREATE ASSERTION RI1
  CHECK (NOT EXISTS(  SELECT *
                      FROM TRABAJADOR T, PARTICIPACION P
                      WHERE P.TRABAJADOR=T.DNI AND P.ONG <> T.ONG
                   )
        )
;
SELECT *
FROM TRABAJADOR T, PARTICIPACION P
WHERE P.TRABAJADOR=T.DNI AND P.ONG <> T.ONG
;
--RI2. Una persona no puede ser socio y trabajador de la misma ONG.
--Select: personas que son socios y no trabajan una misma ONG
CREATE ASSERTION RI2
  CHECK (NOT EXISTS(  SELECT *
                      FROM COLABORACION C, TRABAJADOR T
                      WHERE T.DNI=C.SOCIO AND T.ONG=C.ONG                     
                   )
        )
;
SELECT DISTINCT NOMBRE
FROM COLABORACION C, TRABAJADOR T
WHERE T.DNI=C.SOCIO AND T.ONG=C.ONG
;
--RI3. Un trabajador no puede ser responsable de más de una ONG.
ALTER TABLE ONG ADD CONSTRAINT unico_responsable UNIQUE (RESPONSABLE);

--RI4. El responsable de una ONG ha de ser uno de entre los trabajadores contratados por tal ONG.
CREATE ASSERTION RI2
  CHECK (NOT EXISTS(  SELECT *
                      FROM ONG G, TRABAJADOR T
                      WHERE G.RESPONSABLE=T.DNI AND G.CODIGO<>T.ONG                    
                   )
        )
;
SELECT *
FROM ONG G, TRABAJADOR T
WHERE G.RESPONSABLE=T.DNI AND G.CODIGO<>T.ONG
;
--RI5. Un socio debe serlo al menos de una ONG.
CREATE ASSERTION RI2
  CHECK (NOT EXISTS(  SELECT *
                      FROM COLABORACION 
                      WHERE SOCIO NOT IN( SELECT DNI
                                        FROM SOCIO
                                        )                  
                   )
        )
;

SELECT *
FROM COLABORACION 
WHERE SOCIO NOT IN( SELECT DNI
                  FROM SOCIO
                  )
;