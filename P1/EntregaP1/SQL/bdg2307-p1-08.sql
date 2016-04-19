--8
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