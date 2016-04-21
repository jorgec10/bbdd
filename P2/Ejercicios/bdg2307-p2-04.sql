--Ejercicio 4. Modificar una clave primaria de manera ordenada: cambiar el DNI de una persona.

--Como el dni de un trabajador es la clave primaria de TRABAJADOR, desactivamos
--las claves ajenas de las tablas done es referenciada.
ALTER TABLE PARTICIPACION DISABLE CONSTRAINT participacion_fk_trabajador;
ALTER TABLE COLABORACION DISABLE CONSTRAINT colaboracion_fk_socio;

--Actualizamos el valor del DNI por uno nuevo
UPDATE TRABAJADOR
SET DNI= '00000000D'
WHERE DNI = '65772743Q';
UPDATE COLABORACION
SET SOCIO= '00000000D'
WHERE SOCIO = '65772743Q';
UPDATE SOCIO
SET DNI= '00000000D'
WHERE DNI = '65772743Q';
UPDATE PARTICIPACION
SET TRABAJADOR= '00000000D'
WHERE TRABAJADOR = '65772743Q';

--Reactivamos las claves ajenas desactivadas anteriormente
ALTER TABLE PARTICIPACION ENABLE CONSTRAINT participacion_fk_trabajador;
ALTER TABLE COLABORACION ENABLE CONSTRAINT colaboracion_fk_socio;