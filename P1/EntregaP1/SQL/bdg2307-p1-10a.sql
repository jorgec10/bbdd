--10
SELECT C.IDCASA, C.NOMBRE
FROM CASA C
WHERE NOT EXISTS (  SELECT T.IDTIPO
                    FROM TIPOPLAN T
                    WHERE T.NIVEL=5 AND NOT EXISTS (  SELECT P.TIPOPLAN
                                                      FROM PLAN P
                                                      WHERE P.CASA=C.IDCASA
                                                      AND P.TIPOPLAN=T.IDTIPO
                                                      )                            
                  )
ORDER BY C.IDCASA;