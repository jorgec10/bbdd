SET SERVEROUTPUT ON;
DECLARE
  CURSOR cOng IS
    SELECT NOMBRE, CODIGO, RESPONSABLE FROM ONG
    ORDER BY NOMBRE;
  CURSOR cTrabajadores (codOng ONG.CODIGO%TYPE) IS
    SELECT NOMBRE, DNI FROM TRABAJADOR
    WHERE ong = codOng
    ORDER BY NOMBRE;
  CURSOR cParticipacion (trab PARTICIPACION.trabajador%TYPE) IS
    SELECT IDPROYECTO FROM PARTICIPACION
    WHERE trabajador = trab
    ORDER BY IDPROYECTO;
    
    numTrabajadores NUMBER;
    numPro NUMBER;
    numAcc NUMBER;

BEGIN
   
  FOR o IN cOng
  LOOP
     DBMS_OUTPUT.PUT_LINE('ONG ' || o.NOMBRE || ' ');
     SELECT COUNT(*) INTO numTrabajadores
     FROM TRABAJADOR T
     WHERE o.CODIGO = T.ONG
     GROUP BY T.ONG;
     DBMS_OUTPUT.PUT_LINE('--- ' || numTrabajadores || ' TRABAJADORES:');
     
     FOR t IN cTrabajadores (o.CODIGO)
     LOOP
      IF (t.DNI = o.RESPONSABLE) THEN 
        DBMS_OUTPUT.PUT_LINE('------ ' || t.NOMBRE || ' ES EL RESPONSABLE');
      ELSE
        DBMS_OUTPUT.PUT_LINE('------ ' || t.NOMBRE);
      END IF;
      
      SELECT COUNT(*) INTO numPro
      FROM PARTICIPACION P
      WHERE P.TRABAJADOR=t.DNI;
      DBMS_OUTPUT.PUT_LINE('-------- ' || numPro || ' PROYECTOS');
      
      FOR p IN cParticipacion (t.DNI)
      LOOP
        SELECT COUNT(*) INTO numAcc
        FROM ACCION C
        WHERE C.IDPROYECTO=p.IDPROYECTO
        GROUP BY IDPROYECTO;
        DBMS_OUTPUT.PUT_LINE('--------- ' || p.IDPROYECTO || '. ACCIONES: ' || numAcc);
      END LOOP;
     END LOOP;         
  END LOOP;
END;
/