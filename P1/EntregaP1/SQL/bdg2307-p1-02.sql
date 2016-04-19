--2
SELECT C.NOMBRE, TRUNC(AVG(D.PRECIO),2) AS PRECIOMEDIO
FROM CASA C, DORMITORIO D
WHERE C.IDCASA=D.IDCASA AND C.IDCASA IN ( SELECT C.IDCASA
                                          FROM CASA C, DORMITORIO D
                                          WHERE C.IDCASA=D.IDCASA AND D.NUMCAMAS=2
                                          GROUP BY C.IDCASA
                                          HAVING (AVG(D.PRECIO)>=15 AND AVG(D.PRECIO)<=25)
                                        )
GROUP BY C.NOMBRE
ORDER BY C.NOMBRE;