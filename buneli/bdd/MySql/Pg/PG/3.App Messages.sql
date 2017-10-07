CREATE OR REPLACE FUNCTION FN_APP_MESSAGES
(
    IN pty_app int,
    IN pty_lang varchar(3)
)
RETURNS TABLE (COD_MESSAGE VARCHAR, TXT_MESSAGE VARCHAR) AS
$BODY$
    --
    select  cod_message as COD_MESSAGE,
            txt_message as TXT_MESSAGE
    from    BUNELI_MESSAGES a
    where   a.cod_app = pty_app
    and     a.cod_language = pty_lang
	and     ind_application = 1
	;
    --
$BODY$
LANGUAGE SQL STABLE
ROWS 200;