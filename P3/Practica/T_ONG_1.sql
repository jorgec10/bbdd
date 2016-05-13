CREATE OR REPLACE TRIGGER T_ONG_1
  BEFORE INSERT ON PARTICIPACION
  REFERENCING NEW AS newRow
  FOR EACH ROW
DECLARE
   a number;
BEGIN
  SELECT COUNT(*) INTO a
  FROM TRABAJADOR T
  WHERE (T.dni=:newRow.trabajador) and (T.ong <> :newRow.ong);
  IF (a<>0) THEN
    RAISE_APPLICATION_ERROR(-20999, 'No se puede insertar una participacion de un trabajador que no sea de la ong');
  END IF;
END;