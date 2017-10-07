CREATE OR REPLACE FUNCTION FN_APPOPTIONS
(
    pty_app BUNELI_APP.COD_APP%type,
    pty_lang BUNELI_LANGUAGES.COD_LANGUAGE%type
)
RETURN BUNELI_TYPES.type_cursor
IS
    ltc_return BUNELI_TYPES.type_cursor;
BEGIN
    OPEN ltc_return FOR
        SELECT  a.COD_APP, a.TXT_NAME, a.COD_STATE, a.DAT_BEGIN, a.DAT_END,
                b.COD_APP, b.COD_OPTION, nvl(C.TXT_TRANSLATION,b.TXT_OPTION) TXT_OPTION, 
                b.URL_VALIDATE, b.URL_EXECUTE, b.URL_DRAW, b.OPT_MENU, b.OPT_FATHER_MENU, b.IMG_USER, b.POP_UP,
                b.TXT_COMMAND
        FROM    BUNELI_APP a,
                BUNELI_OPTION b,
                BUNELI_OPTION_DICTIONARY c
        where   a.COD_APP = pty_app
        and     C.COD_LANGUAGE(+) = pty_lang
        and     B.COD_APP = A.COD_APP
        and     C.TXT_OPTION(+) = B.TXT_OPTION
        ;
    RETURN ltc_return;
END FN_APPOPTIONS;