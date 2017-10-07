delimiter //
CREATE PROCEDURE PR_SENDMESSAGE
(
    IN pty_from   integer,
    IN pty_to     integer,
    IN pty_message    varchar(178),
	IN pty_lang  varchar(3)
)
BEGIN

	DECLARE lty_state TINYINT default null;
	DECLARE lty_message VARCHAR(120);

	set lty_state = null;

	-- Validating the users relation
	select	cod_state
	into	lty_state
	from	JSON_CONTACT
	where   (
				cod_user_host = pty_from and cod_user_guest = pty_to 
				or cod_user_host = pty_to and cod_user_guest = pty_from
			)
	;

	IF lty_state <> 1 or lty_state IS NULL THEN
		SET lty_message = FN_GETMESSAGE(1,pty_lang,'message_not_sen');
		SIGNAL SQLSTATE VALUE '99999'
		SET MESSAGE_TEXT = lty_message;
	END IF;

    INSERT INTO JSON_MESSAGE values (NOW(),pty_from,pty_to,pty_message,null);
    commit;
END;
