delimiter //
CREATE PROCEDURE PR_DELETEACCOUNT
(
  p_codUser INT,
  p_email   VARCHAR(100),
  p_emailConf VARCHAR(100)
)
BEGIN

  declare lnuuser integer;

  select  cod_user
  into  lnuuser
  from  BUNELI_USER
	WHERE	cod_user = p_codUser
  and  txt_email	= p_email
  and   txt_email	= p_emailConf
  ;

  IF lnuuser THEN

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

  END IF;
END;