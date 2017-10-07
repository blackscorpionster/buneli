delimiter //
CREATE PROCEDURE FN_APPOPTIONS
(
    IN pty_app INT,
	IN pty_lang VARCHAR(3)
)
BEGIN

        SELECT  a.cod_app as COD_APP, 
				a.txt_name as TXT_NAME, 
				a.cod_state as COD_STATE, 
				a.dat_begin as DAT_BEGIN, 
				a.dat_end as DAT_END,
				b.cod_app as COD_APP, 
				b.cod_option as COD_OPTION, 
				IFNULL(BUNELI_OPTION_DICTIONARY.txt_translation,b.txt_option) as TXT_OPTION, 
				b.url_validate as URL_VALIDATE, 
				b.url_execute as URL_EXECUTE, 
				b.url_draw as URL_DRAW, 
				b.opt_menu as OPT_MENU, 
				b.opt_father_menu as OPT_FATHER_MENU, 
				b.img_option as IMG_USER, 
				b.pop_up as POP_UP,
				b.txt_command as TXT_COMMAND
		FROM    BUNELI_APP a,
				BUNELI_OPTION b
				LEFT JOIN BUNELI_OPTION_DICTIONARY ON 
				BUNELI_OPTION_DICTIONARY.cod_language = pty_lang
				and BUNELI_OPTION_DICTIONARY.txt_option = b.txt_option
		where   a.cod_app = pty_app
		and     b.cod_app = a.cod_app
		;

END;