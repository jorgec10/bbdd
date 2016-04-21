--Ejercicio 3. Insertar comentarios en una tabla y en una columna.

--Creamos el comentario de la tabla
COMMENT ON TABLE ong IS 'Tabla ONG';

--Creamos los comentarios de las columnas
COMMENT ON COLUMN ONG.codigo IS 'C�digo identificador de cada ONG';
COMMENT ON COLUMN ONG.nombre IS 'Nombre de cada ONG';
COMMENT ON COLUMN ONG.email IS 'Correo electr�nico de cada ONG';
COMMENT ON COLUMN ONG.telf IS 'Tel�fono de cada ONG';
COMMENT ON COLUMN ONG.provincia IS 'Provincia de cada ONG';
COMMENT ON COLUMN ONG.campo IS 'Campo de acci�n de cada ONG';
COMMENT ON COLUMN ONG.responsable IS 'Responsable a cargo de cada ONG';

--Comprobamos que se han creado los comentarios correctamente
SELECT * FROM USER_TAB_COMMENTS WHERE TABLE_NAME='ONG';
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME='ONG';