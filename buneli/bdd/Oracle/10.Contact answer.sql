create or replace PROCEDURE PR_CONTACTANSWER
(
    pty_user number,
    pty_amswer number,
    pty_me  number,
    pty_type number
)
IS
BEGIN
    -- I am the host
    IF pty_type = 1 THEN
        update  JSON_CONTACT
        set     cod_state = pty_amswer
        WHERE   COD_USER_HOST = pty_me
        and     COD_USER_GUEST = pty_user
        ;
    ELSE -- I am the guest
        update  JSON_CONTACT
        set     cod_state = pty_amswer
        WHERE   COD_USER_HOST = pty_user
        and     COD_USER_GUEST = pty_me
        ;
    END IF;   
END;