delimiter //

CREATE FUNCTION FN_RNDCODE()
RETURNS BIGINT
BEGIN

  DECLARE lnu_curNumber tinyint;
  DECLARE lnu_longitud int;
  DECLARE lvc_Acomula varchar(10);
  DECLARE lvc_error varchar(400);
  
  --
  SET lvc_Acomula = '';
  
  -- DECLARE specialty CONDITION FOR SQLSTATE '45000';
  
  SET lnu_curNumber =  FLOOR(0 + (RAND() * 10)); -- ROUND(1.0 + 9.0 * RAND());
  
  SET lvc_Acomula = lnu_curNumber;

  SET lnu_longitud = CHAR_LENGTH(lvc_Acomula);
  
  SET lvc_error = CONCAT('LINI>>>',lnu_longitud,'<ACINI>',lvc_Acomula);
   -- select lnu_longitud;
   -- select lvc_Acomula;
  
  WHILE lnu_longitud < 10 DO
  
    SET lnu_curNumber = FLOOR(0 + (RAND() * 10)); -- ROUND(1.0 + 9.0 * RAND());
 
    SET lvc_error = CONCAT(lvc_error,'N',lnu_curNumber);
 
    IF INSTR(  lvc_Acomula, lnu_curNumber ) = 0 THEN
       SET  lvc_Acomula = CONCAT(lvc_Acomula,lnu_curNumber);
    END IF;
    
    SET lnu_longitud = CHAR_LENGTH(lvc_Acomula);

    /*IF lnu_longitud = 10 THEN
      SET lvc_error = CONCAT(lvc_error,'<LG>',lnu_longitud,'<CA>',lvc_Acomula);
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = lvc_error;
    END IF;*/
  
  END WHILE;
  
  RETURN (lvc_Acomula+0);
    
END;