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
    
    numTrabajadores NUMBER:= 0;
    numSocios NUMBER:= 0;
    
    finBucle2 BOOLEAN := false;
  
BEGIN
  OPEN trabajadores;
  OPEN socios;
  
  DBMS_OUTPUT.PUT_LINE(RPAD('TRABAJADORES', 50) || 'SOCIOS');
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------');
  
  LOOP
    
    FETCH trabajadores INTO trabajadorActual;
    FETCH socios INTO socioActual;
        
    EXIT WHEN trabajadores%NOTFOUND OR socios%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE(RPAD(trabajadorActual, 50) || socioActual);
    
    numTrabajadores := numTrabajadores + 1;
    numSocios := numSocios + 1;
  END LOOP;
  
  LOOP
    EXIT WHEN finbucle2;  
    
    FETCH trabajadores INTO trabajadorActual;
    FETCH socios INTO socioActual;    
      
    IF (trabajadores%FOUND) THEN      
      DBMS_OUTPUT.PUT_LINE(RPAD(trabajadorActual, 50) || ' ');
      numTrabajadores := numTrabajadores + 1;
    ELSIF (socios%FOUND) THEN     
      DBMS_OUTPUT.PUT_LINE(RPAD(' ', 50) || socioActual);
      numSocios := numSocios + 1;
    ELSE 
      finbucle2 := true;
    END IF;   
  END LOOP;
  
  DBMS_OUTPUT.PUT_LINE('-------------------------------------------------------------------------');
  DBMS_OUTPUT.PUT_LINE('TOTAL: ' || numTrabajadores || ' TRABAJADORES Y ' || numSocios || ' SOCIOS');
  
  CLOSE trabajadores;
  CLOSE socios;
  
END;
