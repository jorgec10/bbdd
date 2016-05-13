CREATE OR REPLACE TRIGGER T_ONG_2 
  BEFORE UPDATE ON TRABAJADOR 
  REFERENCING NEW AS newRow 
  FOR EACH ROW
DECLARE
  b NUMBER;
BEGIN
  SELECT COUNT(*) INTO b
  FROM PARTICIPACION P
  WHERE (P.trabajador=:newRow.dni);
  IF (b<>0) THEN
    RAISE_APPLICATION_ERROR(-20998, 'Un trabajador no puede cambiarse de ONG si participa en proyectos de la actual');
  END IF;
END;