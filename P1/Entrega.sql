--EJERCICIO 1
SELECT C.NOMBRE, C.TELEFONO, C.IDCASA
FROM CASA C
WHERE C.IDCASA IN (
            SELECT P.CASA
            FROM PLAN P
            WHERE (P.TURNO='T' OR P.TURNO='M')         
);

/*SELECT C.IDCASA, P.TURNO
FROM CASA C, PLAN P
WHERE C.IDCASA=P.CASA
GROUP BY C.IDCASA, P.TURNO
;*/



--EJERCICIO 2
SELECT C.NOMBRE, AVG(D.PRECIO)
FROM CASA C, DORMITORIO D
WHERE C.IDCASA=D.IDCASA AND D.NUMCAMAS=2
GROUP BY C.NOMBRE
HAVING (AVG(D.PRECIO)>=15 AND AVG(D.PRECIO)<=25);

--EJERCICIO 3
SELECT E.DNI, T.IDTIPO, COUNT(E.DNI)
FROM EMPLEADO E, TIPOPLAN T, PLAN P
WHERE P.MONITOR=E.DNI AND P.TIPOPLAN=T.IDTIPO
GROUP BY E.DNI, T.IDTIPO
;


--EJERCICIO 4

--EJERCICIO 5
SELECT E.NOMBRE, E.TELEFONO
FROM EMPLEADO E
WHERE E.IDCASA IN (
              SELECT D.IDCASA
              FROM DORMITORIO D
);






