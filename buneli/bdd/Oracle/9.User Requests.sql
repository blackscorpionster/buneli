CREATE OR REPLACE FUNCTION FN_USERREQUESTS
(
    ptyuser number
)
RETURN BUNELI_TYPES.TYPE_CURSOR 
IS
    ltbreturn BUNELI_TYPES.TYPE_CURSOR;
BEGIN
    open ltbreturn for
        select  *
        from    (
                    select  1 TIPO, b.TXT_NAME ||' '|| b.TXT_SURNAME USER_NAME, to_CHAR(FEC_START,'dd/mm/yyyy') FEC_START, LINK_MESSAGE,
                            B.COD_USER, b.TXT_NAME, b.TXT_SURNAME
                    from    json_contact a,
                            buneli_user b
                    where   a.COD_USER_HOST = ptyuser -- WHEN I AM THE HOST
                    and     a.COD_USER_GUEST = b.cod_user 
                    and     a.COD_STATE = 2
                    union all
                    select  2 tipo, b.TXT_NAME ||' '|| b.TXT_SURNAME USER_NAME, to_CHAR(FEC_START,'dd/mm/yyyy') FEC_START, LINK_MESSAGE,
                            B.COD_USER, b.TXT_NAME, b.TXT_SURNAME
                    from    json_contact a,
                            buneli_user b
                    where   a.COD_USER_GUEST = ptyuser -- WHEN I AM THE GUEST
                    and     a.COD_USER_HOST = b.cod_user
                    and     a.COD_STATE = 2
                 )
        order by 1
        ;
    return  ltbreturn;
END;