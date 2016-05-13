create or replace
PACKAGE BODY P_ONG IS

  FUNCTION quien_es(trab TRABAJADOR.DNI%TYPE) RETURN VARCHAR IS
    nom VARCHAR(40);
  BEGIN
    SELECT T.NOMBRE INTO nom
    FROM TRABAJADOR T, SOCIO S
    WHERE T.DNI=trab AND S.DNI=trab;
    RETURN 'TRABAJADOR/SOCIO';
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        DECLARE
          ong VARCHAR(40);
        BEGIN
          SELECT O.NOMBRE INTO ong
          FROM ONG O, TRABAJADOR T
          WHERE O.CODIGO=T.ONG AND T.DNI=trab;          
          SELECT T.NOMBRE INTO nom
          FROM TRABAJADOR T
          WHERE T.DNI=trab;
          RETURN ('TRABAJADOR DE ' || ong);
          EXCEPTION
            WHEN NO_DATA_FOUND THEN
              DECLARE
                numOngs NUMBER;
                nom VARCHAR(40);
              BEGIN
                SELECT NOMBRE INTO nom
                FROM SOCIO
                WHERE DNI=trab;
                SELECT COUNT(*) INTO numOngs
                FROM COLABORACION C, SOCIO S
                WHERE C.SOCIO=trab AND S.DNI=trab;
                RETURN ('SOCIO DE ' || numOngs || ' ONG');
                EXCEPTION
                  WHEN NO_DATA_FOUND THEN
                    RETURN ('PERSONA NO ENCONTRADA');
              END;
        END;
  END;

END P_ONG;