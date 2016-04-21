--Ejercicio 6. Borrar una ONG.

--Vamos a borrar la ONG O01
--Para hacerlo hay que desactivar las claves ajenas que hagan referencia a ONG,
--de esta manera podemos borrar los datos, teniendo en cuenta dichas referencias
ALTER TABLE TRABAJADOR DISABLE CONSTRAINT trabajador_fk_ong;
ALTER TABLE COLABORACION DISABLE CONSTRAINT colaboracion_fk_ong;
ALTER TABLE PROYECTO DISABLE CONSTRAINT proyecto_fk_ong;
ALTER TABLE PARTICIPACION DISABLE CONSTRAINT participacion_fk_ong;
ALTER TABLE ACCION DISABLE CONSTRAINT accion_fk_ong;

--Borramos manualmente las filas de todas las tablas donde se haga referencia a 
--la ONG O01
DELETE FROM ONG
WHERE codigo='O01';
DELETE FROM PARTICIPACION
WHERE ong='O01';
DELETE FROM ACCION
WHERE ong='O01';
DELETE FROM PROYECTO
WHERE ong='O01';
DELETE FROM COLABORACION
WHERE ong='O01';
DELETE FROM TRABAJADOR
WHERE ong='O01';

--Reactivamos las claves ajenas desactivadas anteriormente
ALTER TABLE ACCION ENABLE CONSTRAINT accion_fk_ong;
ALTER TABLE PARTICIPACION ENABLE CONSTRAINT participacion_fk_ong;
ALTER TABLE PROYECTO ENABLE CONSTRAINT proyecto_fk_ong;
ALTER TABLE COLABORACION ENABLE CONSTRAINT colaboracion_fk_ong;
ALTER TABLE TRABAJADOR ENABLE CONSTRAINT trabajador_fk_ong;