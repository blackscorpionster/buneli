DROP FUNCTION IF EXISTS FN_VALIDATE_USER(varchar, varchar);
CREATE OR REPLACE FUNCTION FN_VALIDATE_USER
(
    IN pty_user    varchar(100),            
    IN pty_pass    varchar(33)
)RETURNS TABLE(COD_USER INTEGER,
               TXT_NAME VARCHAR,
               TXT_SURNAME VARCHAR,
               TXT_EMAIL VARCHAR,
               TXT_PASS VARCHAR,
               MOB_NUMBER VARCHAR,
               DAT_SINGUP DATE, 
               DAT_SINGAWAY DATE,
               COD_STATE SMALLINT,
               COD_COUNTRY VARCHAR,
               IMG_USER VARCHAR,
               COM_FILE VARCHAR,
               CODE BIGINT,
                PASS_RECOVERY_EMAIL VARCHAR
               ) AS
 $BODY$
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
                code       as CODE,
                PASS_RECOVERY_EMAIL
	from    BUNELI_USER a
	where   a.txt_email = pty_user
	and     a.txt_pass = pty_pass
	;
        
$BODY$
LANGUAGE SQL STABLE
ROWS 1;