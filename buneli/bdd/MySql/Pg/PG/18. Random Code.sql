CREATE OR REPLACE FUNCTION FN_RNDCODE()
RETURNS BIGINT AS
$BODY$
DECLARE 

  lnu_curNumber SMALLINT;
  lnu_longitud intEGER;
  lvc_Acomula varchar(10);
  lvc_error varchar(400);
  
BEGIN
  --
  lvc_Acomula = '';
  
  lnu_curNumber =  FLOOR(1 + (RANDOM() * 10)); -- ROUND(1.0 + 9.0 * RAND());
  
  lvc_Acomula = lnu_curNumber;

  lnu_longitud = CHAR_LENGTH(lvc_Acomula);
  
  lvc_error = CONCAT('LINI>>>',lnu_longitud,'<ACINI>',lvc_Acomula);
   -- select lnu_longitud;
   -- select lvc_Acomula;
  
  WHILE lnu_longitud < 10 LOOP
  
    lnu_curNumber = FLOOR(0 + (RANDOM() * 10)); -- ROUND(1.0 + 9.0 * RAND());
 
    lvc_error = CONCAT(lvc_error,'N',lnu_curNumber);
 
    IF POSITION(lnu_curNumber::VARCHAR in  lvc_Acomula::VARCHAR) = 0 THEN
       lvc_Acomula = CONCAT(lvc_Acomula,lnu_curNumber);
    END IF;
    
    lnu_longitud = CHAR_LENGTH(lvc_Acomula);

    /*IF lnu_longitud = 10 THEN
      SET lvc_error = CONCAT(lvc_error,'<LG>',lnu_longitud,'<CA>',lvc_Acomula);
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = lvc_error;
    END IF;*/
  
  END LOOP;
  
  RETURN (lvc_Acomula::BIGINT+0);
    
END$BODY$
LANGUAGE PLPGSQL;