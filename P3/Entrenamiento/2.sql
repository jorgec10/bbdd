CREATE OR REPLACE PROCEDURE equipo_trabajador (
  dni_ IN trabajador.dni%type;
)
IS 
  x trabajador.nombre%type);
  cod TRABAJADOR.ONG%TYPE;
  numtrabajadores integer;
  dni trbajador.dni%type;
  nom trabajador.nombre%type;
  vol trabajador.esvoluntario%type;
BEGIN
  SELECT NOMBRE, ONG INTO x, cod FROM TRABAJADOR WHERE DNI = dni_;
  SELECT COUNT(*) INTO numtrabajadores where ONG = cod;
  DBMS_OUTPUT.PUT_LINE(x || ' es responsable de ' || numtrabajadores || ' trabajadores:');
  SELECT DNI, NOMBRE, ESVOLUNTARIO INTO dni, nom, vol FROM TRABAJADOR WHERE ONG=cod;
  DBMS_OUTPUT.PUT_LINE('\t- <' || dni || '. ' || nom || '. ' || vol || ' ES VOLUNTARIO>.');
  EXCEPTION
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('TRABAJADOR INEXISTENTE');
END;
/
CALL  equipo_trabajador('90929946V');s
/

SELECT * FROM ONG;
