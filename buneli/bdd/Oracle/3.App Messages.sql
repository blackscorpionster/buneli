create or replace function FN_APP_MESSAGES
(
    pty_app BUNELI_APP.COD_APP%type,
    pty_lang BUNELI_LANGUAGES.cod_language%type
)
RETURN BUNELI_TYPES.type_cursor
IS
    ltc_data BUNELI_TYPES.type_cursor;
BEGIN
OPEN ltc_data FOR
    --
    select  COD_MESSAGE,
            TXT_MESSAGE
    from    buneli_messages a
    where   a.COD_APP = pty_app
    and     a.COD_LANGUAGE = pty_lang
    and     IND_APPLICATION = 1
    ;
    --
    return ltc_data;
    --
END;