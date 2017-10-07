CREATE OR REPLACE FUNCTION FN_USERREQUESTS
(
    IN ptyuser INTEGER
)
RETURNS TABLE ( TIPO SMALLINT, 
                USER_NAME VARCHAR, 
                FEC_START VARCHAR, 
                LINK_MESSAGE VARCHAR,
                COD_USER INTEGER, 
                TXT_NAME VARCHAR,
                TXT_SURNAME VARCHAR) AS
$BODY$
	select  x.*
	from    (
				select  1::SMALLINT TIPO, 
						concat_ws(' ',b.txt_name ,b.txt_surname) USER_NAME, 
						TO_CHAR(fec_start,'DD/MM/YYYY') FEC_START, 
						link_message LINK_MESSAGE,
						b.cod_user COD_USER, 
						b.txt_name TXT_NAME, b.txt_surname TXT_SURNAME
				from    JSON_CONTACT a,
						BUNELI_USER b
				where   a.cod_user_host = ptyuser -- WHEN I AM THE HOST
				and     a.cod_user_guest = b.cod_user 
				and     a.cod_state = 2
				union all
				select  2::SMALLINT TIPO, 
						concat_ws(' ',b.txt_name, b.txt_surname) USER_NAME, 
						TO_CHAR(fec_start,'DD/MM/YYYY') FEC_START, 
						link_message LINK_MESSAGE,
						b.cod_user COD_USER, 
						b.txt_name TXT_NAME, 
						b.txt_surname TXT_SURNAME
				from    JSON_CONTACT a,
						BUNELI_USER b
				where   a.cod_user_guest = ptyuser -- WHEN I AM THE GUEST
				and     a.cod_user_host = b.cod_user
				and     a.cod_state = 2
			 ) x
	order by 1
	;
$BODY$
LANGUAGE SQL STABLE
ROWS 10;