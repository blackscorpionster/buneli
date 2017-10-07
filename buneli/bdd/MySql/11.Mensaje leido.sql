delimiter //
CREATE PROCEDURE PR_SETMESSAGEREAD
(
    IN pty_from_user   integer,
    IN pty_to_user     integer,
    IN pty_date_str    varchar(20)
)
BEGIN
    UPDATE  JSON_MESSAGE
    set     ind_read = 1
    WHERE   fec_message = STR_TO_DATE(pty_date_str,'%d%m%Y%H%i%S')
    and     from_user 	= pty_from_user
    and     to_user 	= pty_to_user
    ;
    commit;
END;
