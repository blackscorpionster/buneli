delimiter //
CREATE PROCEDURE FN_APP_MESSAGES
(
    IN pty_app int,
    IN pty_lang varchar(3)
)
BEGIN
    --
    select  cod_message as COD_MESSAGE,
            txt_message as TXT_MESSAGE
    from    BUNELI_MESSAGES a
    where   a.cod_app = pty_app
    and     a.cod_language = pty_lang
	and     ind_application = 1
	;
    --
END;