--EJERCICIO 1
SELECT C.IDCASA, C.NOMBRE, C.TELEFONO
FROM CASA C
WHERE C.IDCASA IN (
            SELECT P.CASA
            FROM PLAN P
            WHERE (P.TURNO='M')         
)
INTERSECT
SELECT C.IDCASA, C.NOMBRE, C.TELEFONO
FROM CASA C
WHERE C.IDCASA IN (
            SELECT P.CASA
            FROM PLAN P
            WHERE (P.TURNO='T'))        
;
------------------------------------------------------------
--EJERCICIO 2
SELECT C.NOMBRE, AVG(D.PRECIO)
FROM CASA C, DORMITORIO D
WHERE C.IDCASA=D.IDCASA AND D.NUMCAMAS=2
GROUP BY C.NOMBRE
HAVING (AVG(D.PRECIO)>=15 AND AVG(D.PRECIO)<=25);
----------------------------------------------------------------
--EJERCICIO 3
SELECT E.DNI, E.NOMBRE, T.IDTIPO, T.DESCRIPCION
FROM EMPLEADO E, TIPOPLAN T, PLAN P
WHERE P.MONITOR=E.DNI AND P.TIPOPLAN=T.IDTIPO
GROUP BY E.DNI, E.NOMBRE, T.IDTIPO, T.DESCRIPCION
HAVING COUNT(*)=( SELECT MAX( COUNT(*))
            FROM PLAN
            GROUP BY MONITOR, TIPOPLAN
);
------------------------------------------------------------------
--EJERCICIO 4


------------------------------------------------------------------
--EJERCICIO 5
--SE HACE POR CASA
SELECT DISTINCT NOMBRE, TELEFONO
FROM EMPLEADO E
WHERE IDCASA IN (
                    SELECT IDCASA
                    FROM DORMITORIO
                    GROUP BY IDCASA
                    HAVING SUM(NUMCAMAS)>=5
                  )
GROUP BY NOMBRE, TELEFONO

;
SELECT C.IDCASA, P.TIPOPLAN, P.DIASEMANA
FROM CASA C, PLAN P
WHERE C.IDCASA=P.CASA
;
SELECT COUNT(DIASEMANA)
FROM PLAN P, CASA C
WHERE C.IDCASA=P.CASA
;


------------------------------------------------------------------------
--EJERCICIO 6
--SIN CASAS CON 0 PLANES
SELECT C.IDCASA, C.NOMBRE, COUNT(P.TIPOPLAN) AS NUMPLANES
FROM CASA C, PLAN P
WHERE P.CASA=C.IDCASA
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;
--DEFINITIVO
SELECT C.IDCASA, C.NOMBRE, COUNT(DISTINCT P.TIPOPLAN) AS NUMPLANES
FROM (CASA C LEFT OUTER JOIN PLAN P ON CASA=IDCASA)
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;
----------------------------------------------------------------------
--EJERCICIO 7
--Para toda casa (idcasa) calcular el total de empleados (numempmonit) que trabajan y son monitores 
--de planes organizados en la misma casa. Presentar ordenado por casa. 
SELECT C.IDCASA, COUNT(DISTINCT E.DNI) AS NUMEMPMONIT
FROM CASA C, EMPLEADO E, PLAN P
WHERE C.IDCASA=E.IDCASA AND P.CASA=E.IDCASA AND E.DNI=P.MONITOR
GROUP BY C.IDCASA
ORDER BY C.IDCASA
;


--------------------------------------------------------------------------
--EJERCICIO 8
-------------------------------------------------------------------------
--EJERCICIO 9
--Cuántos empleados (numempleados) tiene la casa (idcasa, nombre) que menos planes ha organizado 
--y cuántos han sido (numplanes). No considerar las casas que no ofrecen ningún plan.

--EMPLEADOS POR CASA
SELECT C.IDCASA,C.NOMBRE, COUNT(DISTINCT E.DNI) AS NUMEMPLEADOS
FROM CASA C, EMPLEADO E
WHERE C.IDCASA=E.IDCASA
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;
--CASAS CON MENOS PLANES
SELECT C.IDCASA, C.NOMBRE, COUNT(P.TIPOPLAN) AS NUMPLANES
FROM CASA C, PLAN P
WHERE P.CASA=C.IDCASA
GROUP BY C.IDCASA, C.NOMBRE
HAVING COUNT(*)=( SELECT MIN(COUNT(*))
                  FROM CASA C, PLAN P
                  WHERE P.CASA=C.IDCASA
                  GROUP BY C.IDCASA
                )
;

--SOLUCION:
SELECT COUNT(DISTINCT E.DNI) AS NUMEMPLEADOS, C.IDCASA, C.NOMBRE, COUNT(DISTINCT P.TIPOPLAN) AS NUMPLANES
FROM CASA C, EMPLEADO E, PLAN P
WHERE C.IDCASA IN ( SELECT C.IDCASA
                    FROM CASA C, PLAN P
                    WHERE P.CASA=C.IDCASA
                    GROUP BY C.IDCASA
                    HAVING COUNT(*)=( SELECT MIN(COUNT(*))
                                      FROM CASA C, PLAN P
                                      WHERE P.CASA=C.IDCASA
                                      GROUP BY C.IDCASA
                                    )
                  )
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;


--------------------------------------------------------------------------------
--EJERCICIO 10
--RESPUESTA= C06, C08
SELECT C.IDCASA, C.NOMBRE
FROM CASA C, PLAN P, TIPOPLAN T
WHERE P.CASA=C.IDCASA AND P.TIPOPLAN=T.IDTIPO AND T.DESCRIPCION='PARAPENTE DESDE LA CIMA DEL MONTE'
INTERSECT
SELECT C.IDCASA, C.NOMBRE
FROM CASA C, PLAN P, TIPOPLAN T
WHERE P.CASA=C.IDCASA AND P.TIPOPLAN=T.IDTIPO AND T.DESCRIPCION='ESCALADA'
INTERSECT
SELECT C.IDCASA, C.NOMBRE
FROM CASA C, PLAN P, TIPOPLAN T
WHERE P.CASA=C.IDCASA AND P.TIPOPLAN=T.IDTIPO AND T.DESCRIPCION='PUENTING'
;





