--5
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
ORDER BY NOMBRE;       