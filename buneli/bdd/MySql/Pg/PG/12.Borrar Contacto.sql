CREATE OR REPLACE FUNCTION PR_DELETECONTACTINFORMATION
(
    IN pty_contact_delete   integer,
    IN pty_user     		integer
)
RETURNS VOID AS
$BODY$
BEGIN
    -- Borramos todos los mensajes entre los dos contactos
	DELETE FROM JSON_MESSAGE
	where		from_user = pty_contact_delete
	and			to_user = pty_user
	;

	-- Borramos todos los mensajes entre los dos contactos
	DELETE FROM JSON_MESSAGE
	where		from_user = pty_user
	and			to_user = pty_contact_delete
	;

	DELETE FROM JSON_CONTACT
	WHERE	( 
				(cod_user_host = pty_user and cod_user_guest = pty_contact_delete) 
				or 
				(cod_user_host = pty_contact_delete and cod_user_guest = pty_user) 
			);

EXCEPTION
  WHEN OTHERS THEN
    RAISE EXCEPTION '%',FN_GETMESSAGE(1,'eng','error_deletecon');
END
$BODY$
LANGUAGE PLPGSQL;
