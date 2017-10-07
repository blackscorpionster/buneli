delimiter //
CREATE PROCEDURE FN_USERREQUESTS
(
    IN ptyuser INTEGER
)
BEGIN
	select  x.*
	from    (
				select  1 TIPO, 
						CONCAT_WS(' ',b.txt_name ,b.txt_surname) USER_NAME, 
						DATE_FORMAT(fec_start,'%d/%m/%Y') FEC_START, 
						link_message LINK_MESSAGE,
						b.cod_user COD_USER, 
						b.txt_name TXT_NAME, b.txt_surname TXT_SURNAME
				from    JSON_CONTACT a,
						BUNELI_USER b
				where   a.cod_user_host = ptyuser -- WHEN I AM THE HOST
				and     a.cod_user_guest = b.cod_user 
				and     a.cod_state = 2
				union all
				select  2 TIPO, 
						CONCAT_WS(' ',b.txt_name, b.txt_surname) USER_NAME, 
						DATE_FORMAT(fec_start,'%d/%m/%Y') FEC_START, 
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
END;