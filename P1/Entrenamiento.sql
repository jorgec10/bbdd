--Ejercicio 3
SELECT nombre, telefono
from empleado
where idcasa IN (
  SELECT IDCASA
  from casa
  WHERE ciudad='MORATALLA');


--Ejercicio 4
SELECT nombre, ciudad
FROM CASA
WHERE idcasa IN (
  SELECT idcasa
  from dormitorio
  where precio<20
);

--Ejercicio 4. 
SELECT nombre, contratado, sueldo
FROM empleado
where (sueldo >= 1000)
  and (((SYSDATE-contratado)/365) >5);


--Ejercicio 5.
SELECT idcasa, nombre
FROM casa
WHERE idcasa not in(
  SELECT casa
  FROM plan
);



--Ejercicio 6.
SELECT C.nombre, C.ciudad, C.telefono, T.descripcion, T.nivel, P.diasemana
FROM CASA C, TIPOPLAN T, PLAN P
WHERE (P.casa=C.idcasa AND T.idtipo=P.tipoplan) AND (P.diasemana='DOMINGO' OR P.diasemana='SABADO')
ORDER BY diasemana DESC, nivel DESC;

--Ejercicio 7. 
SELECT DISTINCT E.nombre, E.telefono
FROM EMPLEADO E, PLAN P, CASA C
WHERE (E.dni=P.monitor AND E.idcasa=P.casa)
ORDER BY nombre;

--Ejercicio 8.
SELECT C.nombre, C.ciudad
FROM CASA C 
WHERE c.idcasa NOT IN (
        SELECT P.casa
        FROM PLAN P, TIPOPLAN T
        WHERE (P.tipoplan=T.idtipo AND T.nivel<=2));
        
--Ejercicio 9.
SELECT C.nombre, C.ciudad
FROM CASA C 
WHERE c.idcasa IN (
        SELECT P.casa
        FROM PLAN P, TIPOPLAN T
        WHERE (P.tipoplan=T.idtipo AND T.nivel=5 AND p.turno='T'))
ORDER BY C.nombre;

--Ejercicio 10
SELECT T.DESCRIPCION, T.NIVEL
FROM TIPOPLAN T
WHERE T.IDTIPO IN (
      SELECT P.TIPOPLAN
      FROM PLAN P, CASA C
      WHERE P.CASA=C.IDCASA AND C.CIUDAD='MORATALLA' AND ( (SELECT COUNT(D.IDDORM)
                                                           FROM DORMITORIO D
                                                           WHERE C.IDCASA=D.IDCASA) >4
                                                          )
                  )
ORDER BY T.DESCRIPCION;
        


