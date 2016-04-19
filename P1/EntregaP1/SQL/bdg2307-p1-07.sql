--7
SELECT C.IDCASA, COUNT(DISTINCT E.DNI) AS NUMEMPMONIT
FROM CASA C, EMPLEADO E, PLAN P
WHERE C.IDCASA=E.IDCASA AND P.CASA=E.IDCASA AND E.DNI=P.MONITOR
GROUP BY C.IDCASA
ORDER BY C.IDCASA;