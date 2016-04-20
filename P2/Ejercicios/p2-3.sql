
COMMENT ON TABLE ong IS 'Tabla ONG';
COMMENT ON COLUMN ONG.codigo IS 'Código identificador de cada ONG';
COMMENT ON COLUMN ONG.nombre IS 'Nombre de cada ONG';
COMMENT ON COLUMN ONG.email IS 'Correo electrónico de cada ONG';
COMMENT ON COLUMN ONG.telf IS 'Teléfono de cada ONG';
COMMENT ON COLUMN ONG.provincia IS 'Provincia de cada ONG';
COMMENT ON COLUMN ONG.campo IS 'Campo de acción de cada ONG';
COMMENT ON COLUMN ONG.responsable IS 'Responsable a cargo de cada ONG';

SELECT * FROM USER_TAB_COMMENTS WHERE TABLE_NAME='ONG';
SELECT * FROM USER_COL_COMMENTS WHERE TABLE_NAME='ONG';