CREATE OR REPLACE FUNCTION PR_SAVECONTACTREQUEST
(
    IN pty_from   integer,
    IN pty_to     integer,
    IN pty_message    varchar(178),
	IN pty_lang			varchar(3)
)
RETURNS VOID AS
$BODY$
DECLARE 
  lty_state SMALLINT default null;
	lty_message VARCHAR(120);
BEGIN

	lty_state = null;

	IF pty_from = pty_to THEN
		lty_message = FN_GETMESSAGE(1,pty_lang,'same_contact');
		RAISE EXCEPTION '%',lty_message;
	ELSE
		-- Validating the users relation
		select	cod_state
		into	lty_state
		from	JSON_CONTACT
		where   (
					cod_user_host = pty_from and cod_user_guest = pty_to 
					or cod_user_host = pty_to and cod_user_guest = pty_from
				)
		;

		IF lty_state IS NULL THEN
      BEGIN
        INSERT INTO JSON_CONTACT values (pty_from,pty_to,2,NOW(),pty_message,1);
      EXCEPTION
        WHEN OTHERS THEN
          lty_message = FN_GETMESSAGE(1,pty_lang,'error_request');
          RAISE EXCEPTION '%',lty_message;
      END;
		ELSE
			lty_message = FN_GETMESSAGE(1,pty_lang,'contact_exists');
			RAISE EXCEPTION '%',lty_message;
		END IF;
	END IF;
END
$BODY$
LANGUAGE PLPGSQL;
