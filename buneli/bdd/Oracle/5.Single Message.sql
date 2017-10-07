CREATE OR REPLACE FUNCTION FN_GETMESSAGE
(
    pty_app  BUNELI_APP.COD_APP%type,
    pty_lang BUNELI_LANGUAGES.COD_LANGUAGE%type,
    pty_codmsg BUNELI_MESSAGES.COD_MESSAGE%type
)
RETURN BUNELI_MESSAGES.TXT_MESSAGE%type
IS
    lvcmsg BUNELI_MESSAGES.TXT_MESSAGE%type;
BEGIN
    select  TXT_MESSAGE
    into    lvcmsg
    from    BUNELI_MESSAGES
    where   cod_app = pty_app
    and     cod_language = pty_lang
    and     cod_message = pty_codmsg;
    RETURN lvcmsg;
END;