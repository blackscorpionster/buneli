CREATE OR REPLACE PROCEDURE PR_SENDMESSAGE
(
    pty_from    number,
    pty_to      number,
    pty_message varchar2
)
IS
BEGIN
    INSERT INTO JSON_MESSAGE values (SYSDATE,pty_from,pty_to,pty_message,null);
END PR_SENDMESSAGE;