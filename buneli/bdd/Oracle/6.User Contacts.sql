CREATE OR REPLACE FUNCTION FN_USERCONTACTS
(
    pty_usuer BUNELI_USER.COD_USER%TYPE,
    pty_lang  BUNELI_OPTION_DICTIONARY.COD_LANGUAGE%type
)
RETURN BUNELI_TYPES.TYPE_CURSOR
IS
    ltc_data BUNELI_TYPES.TYPE_CURSOR;
BEGIN
    OPEN ltc_data FOR
        select  a.COD_USER_HOST, a.COD_USER_GUEST, b.txt_name, b.TXT_SURNAME, a.link_message, a.FEC_START, a.COD_STATE,
                'OUT' REQUEST_TYPE, nvl(d.TXT_TRANSLATION,c.txt_name) contact_type
        from    JSON_CONTACT a,
                BUNELI_USER b,
                JSON_CONTACT_TYPE c,
                BUNELI_OPTION_DICTIONARY d
        where   a.cod_user_host = pty_usuer
        and     b.cod_user = a.cod_user_guest
        and     c.cod_type = a.cod_type 
        and     D.TXT_OPTION(+) = c.txt_name
        and     D.COD_LANGUAGE(+) = pty_lang
        union
        select  a.COD_USER_GUEST COD_USER_HOST, a.COD_USER_HOST COD_USER_GUEST , b.txt_name, b.TXT_SURNAME, a.link_message, a.FEC_START, a.COD_STATE,
                'IN' REQUEST_TYPE, nvl(d.TXT_TRANSLATION,c.txt_name) contact_type
        from    JSON_CONTACT a,
                BUNELI_USER b,
                JSON_CONTACT_TYPE c,
                BUNELI_OPTION_DICTIONARY d
        where   cod_user_guest = pty_usuer
        and     b.cod_user = a.cod_user_host
        and     c.cod_type = a.cod_type
        and     D.TXT_OPTION(+) = c.txt_name
        and     D.COD_LANGUAGE(+) = pty_lang
        ;

    RETURN ltc_data;
END;