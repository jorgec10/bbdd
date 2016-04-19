--4
SELECT *
FROM (
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
ORDER BY IDCASA;