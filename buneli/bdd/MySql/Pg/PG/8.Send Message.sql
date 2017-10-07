CREATE OR REPLACE FUNCTION PR_SENDMESSAGE
(
    IN pty_from   integer,
    IN pty_to     integer,
    IN pty_message    varchar(178),
	IN pty_lang  varchar(3)
)
RETURNS VOID AS
$BODY$
DECLARE 
        lty_state SMALLINT default null;
        lty_message VARCHAR(120);

BEGIN
        lty_state = null;

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
                lty_message = FN_GETMESSAGE(1,pty_lang,'message_not_sen');
                RAISE EXCEPTION '%',lty_message;
        END IF;

    BEGIN
        INSERT INTO JSON_MESSAGE values (date_trunc('second', NOW()::timestamp without time zone),pty_from,pty_to,pty_message,null);
        --commit;
    EXCEPTION
        WHEN OTHERS THEN
                RAISE EXCEPTION '%',FN_GETMESSAGE(1,pty_lang,'error_msg');
    END;
END;
$BODY$
LANGUAGE PLPGSQL;
