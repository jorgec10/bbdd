SET SERVEROUTPUT ON;
BEGIN
  --DBMS_OUTPUT.PUT_LINE(p_ong.quien_es('65772743Q'));
  P_ONG.cooperacion('65772743Q'); --Trabajador/socio
END;

SET SERVEROUTPUT ON;
BEGIN
  --DBMS_OUTPUT.PUT_LINE(p_ong.quien_es('90929946V'));
  P_ONG.cooperacion('90929946V'); --Trabajador
END;

SET SERVEROUTPUT ON;
BEGIN
  --DBMS_OUTPUT.PUT_LINE(p_ong.quien_es('19652585K'));
  P_ONG.cooperacion('19652585K'); --Socio
END;

SET SERVEROUTPUT ON;
BEGIN
  --DBMS_OUTPUT.PUT_LINE(p_ong.quien_es('00000000K'));
  P_ONG.cooperacion('00000000K'); --Persona no encontrada
END;


create or replace
PACKAGE P_ONG IS
  FUNCTION  quien_es(trab TRABAJADOR.DNI%TYPE) RETURN VARCHAR;
  PROCEDURE cooperacion(trab TRABAJADOR.DNI%TYPE);
END P_ONG;

create or replace
PACKAGE BODY P_ONG IS
  
  --Funcion quien_es
  FUNCTION quien_es(trab TRABAJADOR.DNI%TYPE) RETURN VARCHAR IS
    nom TRABAJADOR.NOMBRE%TYPE;
  BEGIN
    --Comprobamos si está tanto en trabajador como en socio
    SELECT T.NOMBRE INTO nom
    FROM TRABAJADOR T, SOCIO S
    WHERE T.DNI=trab AND S.DNI=trab;
    RETURN 'TRABAJADOR/SOCIO';
    
    --Si no, capturamos la excepción
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DECLARE
          ongNom ONG.NOMBRE%TYPE;
        BEGIN
          --Comprobamos si está en trabajador
          SELECT O.NOMBRE INTO ongNom
          FROM ONG O, TRABAJADOR T
          WHERE O.CODIGO=T.ONG AND T.DNI=trab; 
          RETURN ('TRABAJADOR DE ' || ongNom);
          
          --Si no, capturamos la excepción
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              DECLARE
                numOngs NUMBER;
              BEGIN
                --Comprobamos si está en socio
                SELECT NOMBRE INTO nom
                FROM SOCIO
                WHERE DNI=trab;
                --Calculamos el número de ONGs donde participa
                SELECT COUNT(*) INTO numOngs
                FROM COLABORACION C, SOCIO S
                WHERE C.SOCIO=trab AND S.DNI=trab;
                RETURN ('SOCIO DE ' || numOngs || ' ONG');
                
                --Si no, capturamos la excepción
                EXCEPTION
                  WHEN NO_DATA_FOUND THEN
                    RETURN ('PERSONA NO ENCONTRADA');
              END;
        END;
  END;
  
  --Procedimiento cooperacion
  PROCEDURE cooperacion(trab TRABAJADOR.DNI%TYPE) IS  
    --Variables necesarias para la parte de trabajador
    nom TRABAJADOR.NOMBRE%type;
    responsable TRABAJADOR.NOMBRE%type;
    dniResponsable TRABAJADOR.DNI%type;
    codOng ONG.NOMBRE%type;
    numPro NUMBER;
    esVol TRABAJADOR.ESVOLUNTARIO%TYPE;
    
    --Variables necesarias para la parte de socio
    numOngs NUMBER;
    nomOng ONG.NOMBRE%TYPE;
    cuotaSoc COLABORACION.CUOTA%TYPE;
    --Cursor para recorrer las ONGs de cada socio
    CURSOR cOngs (dniSocio SOCIO.DNI%TYPE) IS
      SELECT ONG, CUOTA FROM COLABORACION
      WHERE SOCIO = dniSocio
      ORDER BY ONG;   
  BEGIN
    --Datos para imprimir parte trabajador
    SELECT T.NOMBRE, O.NOMBRE, O.RESPONSABLE, T.ESVOLUNTARIO INTO nom, codOng, dniResponsable,  esVol
    FROM ONG O, TRABAJADOR T, SOCIO S
    WHERE (O.CODIGO = T.ONG) AND T.DNI=trab AND S.DNI=trab;
    --Nombre responsable
    SELECT T.NOMBRE INTO responsable
    FROM TRABAJADOR T
    WHERE T.DNI=dniResponsable;
    --Número de proyectos en los que participa
    SELECT COUNT(*) INTO numPro
    FROM PARTICIPACION P
    WHERE P.TRABAJADOR=trab;  
    
    --Impresión de los datos del trabajador
    DBMS_OUTPUT.PUT_LINE('TRABAJADOR ' || nom);
    DBMS_OUTPUT.PUT_LINE('  ONG ' || codOng || '.');
    DBMS_OUTPUT.PUT_LINE('  CON RESPONSABLE: ' || responsable || '.');
    DBMS_OUTPUT.PUT_LINE('  PARTICIPA EN ' || numPro || ' PROYECTOS.');
    IF (esVol='S') THEN
      DBMS_OUTPUT.PUT_LINE('  ES VOLUNTARIO');
    ELSIF (esVol='N') THEN
      DBMS_OUTPUT.PUT_LINE('  NO ES VOLUNTARIO');
    END IF;
    
    --Linea en blanco separadora
    DBMS_OUTPUT.PUT_LINE('');
    
    --Datos para imprimir la parte de socio
    --Numero de ONGs de las que es socio
    SELECT COUNT(*) INTO numOngs
    FROM COLABORACION C
    WHERE C.SOCIO=trab;
    
    --Imprimimos los primeros datos
    DBMS_OUTPUT.PUT_LINE('SOCIO ' || nom);
    DBMS_OUTPUT.PUT_LINE('  DE ' || numOngs || ' ONG:');
    
    --Recorremos las ONGs en las que colabora el socio
    FOR c in cOngs (trab)
    LOOP
      --Nombre de la ONG
      SELECT O.NOMBRE INTO nomOng
      FROM ONG O
      WHERE O.CODIGO=c.ONG;
      --Cuota
      cuotaSoc := c.CUOTA;
      
      --Imprimimos los datos de la ONG
      DBMS_OUTPUT.PUT_LINE('   - ONG: ' || nomOng || '; CUOTA: ' || cuotaSoc || ' €.');
    END LOOP;
    
    --Si no es trabajador/socio, capturamos la excepción
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        BEGIN
          --Nombre del trabajador
          SELECT T.NOMBRE, O.NOMBRE, O.RESPONSABLE, T.ESVOLUNTARIO INTO nom, nomOng, dniResponsable, esVol
          FROM TRABAJADOR T, ONG O
          WHERE T.DNI=trab AND O.CODIGO=T.ONG;      
          --Nombre responsable
          SELECT T.NOMBRE INTO responsable
          FROM TRABAJADOR T
          WHERE T.DNI=dniResponsable;
          --Numero de proyectos en los que participa
          SELECT COUNT(*) INTO numPro
          FROM PARTICIPACION P
          WHERE P.TRABAJADOR=trab;
          
          --Imprimimos los datos
          DBMS_OUTPUT.PUT_LINE('TRABAJADOR ' || nom);
          DBMS_OUTPUT.PUT_LINE('  ONG ' || nomOng || '.');
          DBMS_OUTPUT.PUT_LINE('  CON RESPONSABLE: ' || responsable || '.');
          DBMS_OUTPUT.PUT_LINE('  PARTICIPA EN ' || numPro || ' PROYECTOS.');
          IF (esVol='S') THEN
            DBMS_OUTPUT.PUT_LINE('  ES VOLUNTARIO');
          ELSIF (esVol='N') THEN
            DBMS_OUTPUT.PUT_LINE('  NO ES VOLUNTARIO');
          END IF;
          
          --Si no es trabajador/socio ni trabajador, capturamos la excepción
          EXCEPTION   
            WHEN NO_DATA_FOUND THEN
              BEGIN
                --Nombre del socio
                SELECT S.NOMBRE INTO nom
                FROM SOCIO S
                WHERE S.DNI=trab; 
                --Numero de ONGs de las que es socio
                SELECT COUNT(*) INTO numOngs
                FROM COLABORACION C
                WHERE C.SOCIO=trab;
                
                --Imprimimos los primeros datos
                DBMS_OUTPUT.PUT_LINE('SOCIO ' || nom);
                DBMS_OUTPUT.PUT_LINE('  DE ' || numOngs || ' ONG:');
                
                --Recorremos las ONGs en las que colabora el socio
                FOR c in cOngs (trab)
                LOOP
                  --Nombre de la ONG
                  SELECT O.NOMBRE INTO nomOng
                  FROM ONG O
                  WHERE O.CODIGO=c.ONG;
                  --Cuota
                  cuotaSoc := c.CUOTA;
                  
                  --Imprimimos los datos de la ONG
                  DBMS_OUTPUT.PUT_LINE('   - ONG: ' || nomOng || '; CUOTA: ' || cuotaSoc || ' €.');
                END LOOP;
                
                EXCEPTION 
                  WHEN NO_DATA_FOUND THEN
                    DBMS_OUTPUT.PUT_LINE('PERSONA NO ENCONTRADA');                
              END;
      END;        
  END;
END P_ONG;