--EJERCICIO 1
SELECT * FROM(
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
);
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
--Para  cada  casa  mostrar  cuántos  de  sus  dormitorios  tienen  baño  en  su  interior,  cuántos  no  lo 
--tienen, y el precio totalde la casa, es decir, lo que costaría alquilar todos sus dormitorios (idcasa, 
--nombre, dormconwc, dormsinwc, preciocasa). Mostrar ordenado por identificador de la casa.

--Dormitorios con baño interior
SELECT COUNT(D.IDDORM)
FROM CASA C FULL OUTER JOIN DORMITORIO D ON C.IDCASA=D.IDCASA
WHERE D.WC<>'N'
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;
--Dormitorios sin baño interior
SELECT COUNT(D.IDDORM)
FROM CASA C, DORMITORIO D
WHERE C.IDCASA=D.IDCASA AND D.WC='N'
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;
--Precio alquiler casa
SELECT SUM(D.PRECIO) AS PRECIOCASA
FROM CASA C, DORMITORIO D
WHERE C.IDCASA=D.IDCASA
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;

--Solucion:
SELECT *
FROM
(
    SELECT C.IDCASA, C.NOMBRE, COUNT(D.IDDORM) AS DORMSCONWC
    FROM CASA C LEFT OUTER JOIN DORMITORIO D
    ON D.WC='S' AND C.IDCASA=D.IDCASA
    GROUP BY C.IDCASA, C.NOMBRE
) 
NATURAL JOIN (  
    SELECT C.IDCASA, C.NOMBRE, COUNT(D.IDDORM) AS DORMSINWC
    FROM CASA C LEFT OUTER JOIN DORMITORIO D
    ON D.WC='N' AND C.IDCASA=D.IDCASA
    GROUP BY C.IDCASA, C.NOMBRE
)
NATURAL JOIN (  
    SELECT C.IDCASA, C.NOMBRE, SUM(D.PRECIO) AS PRECIOCASA
    FROM CASA C, DORMITORIO D
    WHERE C.IDCASA=D.IDCASA
    GROUP BY C.IDCASA, C.NOMBRE
)
ORDER BY IDCASA
;
------------------------------------------------------------------
--EJERCICIO 5
SELECT * FROM
(SELECT DISTINCT E.NOMBRE, E.TELEFONO
FROM EMPLEADO E, PLAN P
WHERE E.IDCASA IN ( SELECT D.IDCASA
                    FROM DORMITORIO D
                    GROUP BY D.IDCASA
                    HAVING SUM(NUMCAMAS)>4 
                   )
INTERSECT
SELECT DISTINCT E.NOMBRE, E.TELEFONO
FROM EMPLEADO E, PLAN P
WHERE E.IDCASA=P.CASA AND E.DNI=P.MONITOR AND TIPOPLAN IN ( SELECT TIPOPLAN
                                        FROM PLAN
                                        GROUP BY TIPOPLAN
                                        HAVING COUNT(DISTINCT DIASEMANA) = 1
                                      )
)
ORDER BY NOMBRE
;       


------------------------------------------------------------------------
--EJERCICIO 6
--SIN CASAS CON 0 PLANES
/*SELECT C.IDCASA, C.NOMBRE, COUNT(P.TIPOPLAN) AS NUMPLANES
FROM CASA C, PLAN P
WHERE P.CASA=C.IDCASA
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;*/
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
--Casas con más de tres dormitorios
SELECT C.IDCASA
FROM CASA C, DORMITORIO D
WHERE C.IDCASA=D.IDCASA
GROUP BY C.IDCASA
HAVING COUNT(IDDORM)>3
;
--Empleados por casa
SELECT C.IDCASA, COUNT(DISTINCT E.DNI) AS NUMEMPLEADOS
FROM CASA C, EMPLEADO E
WHERE C.IDCASA=E.IDCASA
GROUP BY C.IDCASA
ORDER BY C.IDCASA
;

--Planes por casa
SELECT C.IDCASA, C.NOMBRE, COUNT(P.TIPOPLAN) AS NUMPLANES
FROM CASA C LEFT OUTER JOIN PLAN P ON P.CASA=C.IDCASA
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;

--Ratio empleados/planes
--NVL(nombrecolumna, valor que quieres poner en los null)
SELECT C.IDCASA,  B.NUMEMPLEADOS, A.NUMPLANES, NVL(ROUND(B.NUMEMPLEADOS/NULLIF(A.NUMPLANES,0),2),-1) AS RATIO
FROM CASA C, (SELECT C.IDCASA,COUNT(P.TIPOPLAN) AS NUMPLANES
              FROM CASA C LEFT OUTER JOIN PLAN P ON CASA=IDCASA
              GROUP BY C.IDCASA) A,
             (SELECT C.IDCASA, COUNT(DISTINCT E.DNI) AS NUMEMPLEADOS
              FROM CASA C, EMPLEADO E
              WHERE C.IDCASA=E.IDCASA
              GROUP BY C.IDCASA) B
WHERE C.IDCASA=A.IDCASA AND C.IDCASA=B.IDCASA AND C.IDCASA IN ( SELECT C.IDCASA
                                                                FROM CASA C, DORMITORIO D
                                                                WHERE C.IDCASA=D.IDCASA
                                                                GROUP BY C.IDCASA
                                                                HAVING COUNT(IDDORM)>3
                                                              )
GROUP BY C.IDCASA, A.NUMPLANES, B.NUMEMPLEADOS
ORDER BY C.IDCASA;
;

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

--SOLUCION mala:
/*SELECT COUNT(DISTINCT E.DNI) AS NUMEMPLEADOS, C.IDCASA, C.NOMBRE, COUNT(DISTINCT P.TIPOPLAN) AS NUMPLANES
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
*/
--Solución:
SELECT *
FROM(
      SELECT C.IDCASA,C.NOMBRE, COUNT(DISTINCT E.DNI) AS NUMEMPLEADOS
      FROM CASA C, EMPLEADO E
      WHERE C.IDCASA=E.IDCASA
      GROUP BY C.IDCASA, C.NOMBRE
      ORDER BY C.IDCASA
)      
NATURAL JOIN(      
      SELECT C.IDCASA, C.NOMBRE, COUNT(P.TIPOPLAN) AS NUMPLANES
      FROM CASA C, PLAN P
      WHERE P.CASA=C.IDCASA
      GROUP BY C.IDCASA, C.NOMBRE
      HAVING COUNT(*)=( SELECT MIN(COUNT(*))
                        FROM CASA C, PLAN P
                        WHERE P.CASA=C.IDCASA
                        GROUP BY C.IDCASA
                      )
      )

;


--------------------------------------------------------------------------------
--EJERCICIO 10
--RESPUESTA= C06, C08
--Casas (idcasa,  nombre) para las que se ha organizado al menos una vez cada uno de los tipos de 
--plan de nivel de dificultad muy alto. Es decir, aquellas casas que cumplen que entre sus planes 
--organizados están incluidos planes de todos y cada uno de los tipos de plan de nivel 5. 

--Contar los planes de nivel 5 y coger casa cuyo num total de planes de nvl.5 sea igual al total.

--Numero de planes de nivel 5
/*SELECT COUNT(*)
FROM(
SELECT P.TIPOPLAN, T.DESCRIPCION, T.NIVEL
FROM PLAN P, TIPOPLAN T
WHERE P.TIPOPLAN=T.IDTIPO AND T.NIVEL=5
GROUP BY P.TIPOPLAN, T.DESCRIPCION, T.NIVEL)
;
--Num de planes distintos de nivel 5 por casa
SELECT C.IDCASA, C.NOMBRE, COUNT(DISTINCT T.IDTIPO) AS NUMPLAN5DIST
FROM CASA C, PLAN P, TIPOPLAN T
WHERE C.IDCASA=P.CASA AND P.TIPOPLAN=T.IDTIPO AND T.NIVEL=5
GROUP BY C.IDCASA, C.NOMBRE
ORDER BY C.IDCASA
;*/
--Solucion con count
SELECT C.IDCASA, C.NOMBRE
FROM CASA C, PLAN P, TIPOPLAN T
WHERE C.IDCASA=P.CASA AND P.TIPOPLAN=T.IDTIPO AND T.NIVEL=5
GROUP BY C.IDCASA, C.NOMBRE
HAVING COUNT(DISTINCT P.TIPOPLAN) =  
                (SELECT COUNT(*)
                   FROM(
                      SELECT P.TIPOPLAN, T.DESCRIPCION, T.NIVEL
                      FROM PLAN P, TIPOPLAN T
                      WHERE P.TIPOPLAN=T.IDTIPO AND T.NIVEL=5
                      GROUP BY P.TIPOPLAN, T.DESCRIPCION, T.NIVEL))
ORDER BY IDCASA
;

--Solucion con division
SELECT C.IDCASA, C.NOMBRE
FROM CASA C
WHERE NOT EXISTS ( SELECT T.IDTIPO
                      FROM TIPOPLAN T
                      WHERE T.NIVEL=5 AND NOT EXISTS ( SELECT P.TIPOPLAN
                                          FROM PLAN P
                                          WHERE P.CASA=C.IDCASA
                                          AND P.TIPOPLAN=T.IDTIPO
                                          )
                                
                    )
ORDER BY C.IDCASA;
;