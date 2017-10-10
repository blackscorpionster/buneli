CREATE OR REPLACE FUNCTION PR_SAVENEWUSER
(
    IN pty_email   		varchar(100),
    IN pty_pass     	varchar(33),
    IN pty_userName    	varchar(100),
	IN pty_famName		varchar(100),
	IN pty_country		varchar(2)
)
RETURNS VOID AS 
$BODY$

DECLARE 
  lty_codUser INTEGER;
  lnu_cod BIGINT;

 BEGIN

  lnu_cod := FN_RNDCODE();

	select	MAX(COD_USER)
	into	lty_codUser
	from	BUNELI_USER
	;

	if lty_codUser is null THEN
		SET lty_codUser = 1;
	END IF;

	lty_codUser = lty_codUser + 1;

	INSERT INTO BUNELI_USER
	(cod_user,
	txt_name,
	txt_surname,
	txt_email,
	txt_pass,
	dat_singup,
	cod_state,
	cod_country,
  code
	)
	VALUES
	(
		lty_codUser,
		pty_userName,
		pty_famName,
		pty_email,
		pty_pass,
		CURRENT_DATE,-- Fecha
		1,
		pty_country,
    lnu_cod
	);


END;

$BODY$
LANGUAGE PLPGSQL
COST 100;