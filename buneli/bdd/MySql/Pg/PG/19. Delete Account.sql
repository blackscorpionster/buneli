CREATE OR REPLACE FUNCTION PR_DELETEACCOUNT
(
  p_codUser INT,
  p_email   VARCHAR(100),
  p_emailConf VARCHAR(100)
)
RETURNS VOID AS
$BODY$

declare 
  lnuuser integer;

BEGIN

  select  cod_user
  into  lnuuser
  from  BUNELI_USER
	WHERE	cod_user = p_codUser
  and  txt_email	= p_email
  and   txt_email	= p_emailConf
  ;

  IF lnuuser IS NOT NULL THEN
    BEGIN
      DELETE FROM JSON_MESSAGE
      where		from_user = p_codUser
      ;

      -- Borramos todos los mensajes entre los dos contactos
      DELETE FROM JSON_MESSAGE
      where		to_user = p_codUser
      ;

      DELETE FROM JSON_CONTACT
      WHERE	cod_user_host = p_codUser
      ;
      
      DELETE FROM JSON_CONTACT
      WHERE	cod_user_guest = p_codUser
      ;
      
      DELETE FROM BUNELI_USER
      WHERE	cod_user = p_codUser
      ;
     EXCEPTION
      WHEN OTHERS THEN
        ROLLBACK;
        RAISE EXCEPTION '%',FN_GETMESSAGE(1,'eng',error_deleteacc);
     END;
  ELSE
     RAISE EXCEPTION '%',FN_GETMESSAGE(1,'eng',identi_validat);
  END IF;
END
$BODY$
LANGUAGE PLPGSQL;