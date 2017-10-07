CREATE OR REPLACE FUNCTION FN_USERMESSAGES
(
    pty_user BUNELI_USER.COD_USER%type
)
return BUNELI_TYPES.TYPE_CURSOR
IS

    ltc_data BUNELI_TYPES.TYPE_CURSOR;
    
BEGIN

    OPEN ltc_data FOR

        SELECT  FROM_USER||'_'||TO_USER||'_'||to_char(FEC_MESSAGE,'ddmmyyyyhh24miss') id_message,
                TXT_MESSAGE
        FROM    JSON_MESSAGE a,
                JSON_CONTACT b
        WHERE   a.TO_USER = pty_user
        and     a.ind_read is null
        -- Y que el contacto de los dos usuarios este activo
        and     ( (b.COD_USER_HOST = a.TO_USER and b.COD_USER_GUEST = a.FROM_USER and b.COD_STATE = 1) OR (b.COD_USER_GUEST = a.TO_USER and b.COD_USER_HOST = a.FROM_USER and b.COD_STATE = 1) )
        order by FEC_MESSAGE
        ;

    return ltc_data;
END;