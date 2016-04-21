--Ejercicio 7. Crear y manipular una vista.

--Definimos la vista VOLUNTARIO con las columnas nombre, ong, profesion y horas
--de la tabla trabajador. Solo incluimos los trabajadores voluntarios.
CREATE VIEW VOLUNTARIO
AS SELECT NOMBRE, ONG, PROFESION, HORAS
FROM TRABAJADOR
WHERE ESVOLUNTARIO='S';

--Mostramos el contenido de la tabla ordenado por ong y voluntario (nombre).
SELECT * 
FROM VOLUNTARIO
ORDER BY ONG, NOMBRE;

--Eliminamos de la vista la columna profesion
CREATE OR REPLACE VIEW VOLUNTARIO
AS SELECT NOMBRE, ONG, HORAS
FROM TRABAJADOR
WHERE ESVOLUNTARIO='S';

--Comprobamos que se ha realizado el cambio.
SELECT * 
FROM VOLUNTARIO
ORDER BY ONG, NOMBRE;

--Actualizamos los valores de la columna horas.
UPDATE VOLUNTARIO
SET HORAS=HORAS+2;

--Comprobamos que se han actualizado.
SELECT * 
FROM VOLUNTARIO
ORDER BY ONG, NOMBRE;

--Fijándonos en la tabla trabajador, nos damos cuenta que realmente los datos se 
--han modificado en ésta. Esto se debe a que el SGDB traduce cualquier sentencia
--sobre la vista a una expresión equivalente sobre su tabla base, que en este caso
--es la tabla TRABAJADOR.
SELECT * FROM TRABAJADOR;

--Insertamos un nuevo voluntario
INSERT INTO TRABAJADOR (dni, nombre, ong, fechaingreso, esvoluntario, nacimiento, profesion, horas, sueldo)
VALUES ('11112222C', 'Alvaro Lopez Ayllon', 'O10', TO_DATE('01/06/2006', 'dd/mm/yyyy'), 'S', TO_DATE('21/06/1985', 'dd/mm/yyyy'), 'futbolista', 10, 0);

--Comprobamos si se ha aplicado el cambio. Como podemos ver, aparece el nuevo voluntario
--que acabamos de añadir. Esto ocurre porque una vista no contiene información, sino que
--deja ver la información seleccionada de sus tablas base (TRABAJADOR).
SELECT * 
FROM VOLUNTARIO
ORDER BY ONG, NOMBRE;