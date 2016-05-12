SET SERVEROUTPUT ON;
DECLARE
  CURSOR trabajadores IS
    SELECT NOMBRE FROM TRABAJADOR
    ORDER BY NOMBRE;
  CURSOR socios IS
    SELECT NOMBRE FROM SOCIO
    ORDER BY NOMBRE;
    
    trabajadorActual TRABAJADOR.nombre%TYPE;
    socioActual SOCIO.nombre%TYPE;
    
    trabajadoresFin BOOLEAN:= false;
    sociosFin BOOLEAN:= false;
    
    finBucle2 BOOLEAN := false;
  
BEGIN
  OPEN trabajadores;
  OPEN socios;
  
  LOOP
    FETCH trabajadores INTO trabajadorActual;
    FETCH socios INTO socioActual;
    
    IF (trabajadores%NOTFOUND) THEN 
      trabajadoresFin := true;
    ELSIF (socios%NOTFOUND) THEN 
      sociosFin := true;
    END IF;
    
    EXIT WHEN trabajadoresFin OR sociosFin;
    
    DBMS_OUTPUT.PUT_LINE(RPAD(trabajadorActual, 50) || socioActual);
  END LOOP;
  
  LOOP
    EXIT WHEN finbucle2;
    IF (trabajadoresFin = true) THEN
      FETCH trabajadores INTO trabajadorActual;
      DBMS_OUTPUT.PUT_LINE(RPAD(trabajadorActual, 50) || ' ');
    ELSIF (sociosFin = true) THEN
      FETCH socios INTO socioActual;
      DBMS_OUTPUT.PUT_LINE(RPAD(' ', 50) || socioActual);
    END IF;
  END LOOP;
END;
/