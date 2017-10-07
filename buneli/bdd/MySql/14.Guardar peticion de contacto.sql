delimiter //
CREATE PROCEDURE PR_SAVECONTACTREQUEST
(
    IN pty_from   integer,
    IN pty_to     integer,
    IN pty_message    varchar(178),
	IN pty_lang			varchar(3)
)
BEGIN

	DECLARE lty_state TINYINT default null;
	DECLARE lty_message VARCHAR(120);

	set lty_state = null;

	IF pty_from = pty_to THEN
		SET lty_message = FN_GETMESSAGE(1,pty_lang,'same_contact');
		SIGNAL SQLSTATE VALUE '99999'
		SET MESSAGE_TEXT = lty_message;
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
			INSERT INTO JSON_CONTACT values (pty_from,pty_to,2,NOW(),pty_message,1);
			commit;
		ELSE
			SET lty_message = FN_GETMESSAGE(1,pty_lang,'contact_exists');
			SIGNAL SQLSTATE VALUE '99999'
			SET MESSAGE_TEXT = lty_message;
		END IF;
	END IF;
END;
