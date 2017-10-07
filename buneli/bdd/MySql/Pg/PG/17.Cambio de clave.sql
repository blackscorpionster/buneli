CREATE OR REPLACE FUNCTION PR_CHANGEPASSWORD
(
    IN pty_email   		varchar(100),
    IN pty_pass     	varchar(33)
)
RETURNS VOID AS
$BODY$
BEGIN

	UPDATE SEGURO.BUNELI_USER
	set	txt_pass = pty_pass
	WHERE	txt_email = pty_email
	;
EXCEPTION
  WHEN OTHERS THEN
    RAISE EXCEPTION '%',FN_GETMESSAGE(1,'eng','error_passchang');
END
$BODY$
LANGUAGE PLPGSQL;
