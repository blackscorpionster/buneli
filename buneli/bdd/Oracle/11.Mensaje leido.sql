CREATE OR REPLACE procedure NALGAHERNANDEZ.PR_SETMESSAGEREAD
(
    pty_from_user   number,
    pty_to_user     number,
    pty_date_str    varchar2
)
IS
BEGIN
    UPDATE  JSON_MESSAGE
    set     IND_READ = 1
    WHERE   FEC_MESSAGE = to_date(pty_date_str,'ddmmyyyyhh24miss')
    and     FROM_USER = pty_from_user
    and     TO_USER = pty_to_user
    ;
    commit;
END PR_SETMESSAGEREAD;
/
