CREATE OR REPLACE FUNCTION PR_SETMESSAGEREAD
(
    IN pty_from_user   integer,
    IN pty_to_user     integer,
    IN pty_date_str    varchar(20)
)
RETURNS VOID AS
$BODY$
BEGIN
    RAISE NOTICE 'Message data:: %',to_timestamp(pty_date_str,'ddmmyyyyhh24miss')::timestamp without time zone;
    UPDATE  JSON_MESSAGE
    set     ind_read = 1
    WHERE   fec_message = to_timestamp(pty_date_str,'ddmmyyyyhh24miss')::timestamp without time zone
    and     from_user 	= pty_from_user
    and     to_user 	= pty_to_user
    ;
EXCEPTION
  WHEN OTHERS THEN
    RAISE EXCEPTION '%',FN_GETMESSAGE(1,'eng','error_markasrea');
END
$BODY$
LANGUAGE PLPGSQL;
