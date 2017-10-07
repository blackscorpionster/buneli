delimiter //
CREATE PROCEDURE FN_VALIDATE_USER
(
    IN pty_user    varchar(100),            
    IN pty_pass    varchar(33)
)
BEGIN
	select  cod_user as COD_USER, 
			txt_name as TXT_NAME, 
			txt_surname as TXT_SURNAME, 
			txt_email as TXT_EMAIL, 
			txt_pass as TXT_PASS, 
			mob_number as MOB_NUMBER, 
			dat_singup as DAT_SINGUP, 
			dat_singaway as DAT_SINGAWAY, 
			cod_state as COD_STATE, 
			cod_country as COD_COUNTRY, 
			img_user as IMG_USER, 
			com_file as COM_FILE,
      code       as CODE
	from    BUNELI_USER a
	where   a.txt_email = pty_user
	and     a.txt_pass = pty_pass
	;
        
END;