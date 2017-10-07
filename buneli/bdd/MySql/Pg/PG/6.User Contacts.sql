CREATE OR REPLACE FUNCTION FN_USERCONTACTS
(
    pty_usuer INT,
    pty_lang  varchar(3)
)
RETURNS TABLE(COD_USER_HOST INTEGER, 
                COD_USER_GUEST INTEGER, 
                TXT_NAME VARCHAR,  
                TXT_SURNAME VARCHAR, 
                LINK_MESSAGE VARCHAR, 
                FEC_START DATE, 
                COD_STATE SMALLINT,
                REQUEST_TYPE VARCHAR, 
                CONTACT_TYPE VARCHAR) AS
$BODY$
	select	datos.*
	from	(
			select          a.cod_user_host  	COD_USER_HOST, 
					a.cod_user_guest 	COD_USER_GUEST, 
					b.txt_name 			TXT_NAME,  
					b.txt_surname 		TXT_SURNAME, 
					a.link_message 		LINK_MESSAGE, 
					a.fec_start 		FEC_START, 
					a.cod_state 		COD_STATE,
					'OUT' 				REQUEST_TYPE, 
					COALESCE(d.txt_translation,c.txt_name) CONTACT_TYPE
			from    JSON_CONTACT 		a,
					BUNELI_USER 		b,
					JSON_CONTACT_TYPE 	c
					LEFT JOIN BUNELI_OPTION_DICTIONARY d 
							ON 		d.txt_option 	= c.txt_name
							and     d.cod_language 	= pty_lang
			where   a.cod_user_host = pty_usuer
			and     b.cod_user 		= a.cod_user_guest
			and     c.cod_type 		= a.cod_type 
			union
			select  a.cod_user_guest 	COD_USER_HOST, 
					a.cod_user_host 	COD_USER_GUEST , 
					b.txt_name 			TXT_NAME, 
					b.txt_surname 		TXT_SURNAME, 
					a.link_message 		LINK_MESSAGE, 
					a.fec_start 		FEC_START, 
					a.cod_state 		COD_STATE,
					'IN' 				REQUEST_TYPE, 
					COALESCE(d.txt_translation,c.txt_name) CONTACT_TYPE
			from    JSON_CONTACT 		a,
					BUNELI_USER 		b,
					JSON_CONTACT_TYPE 	c
					LEFT JOIN BUNELI_OPTION_DICTIONARY d 
							ON		d.txt_option 	= c.txt_name
							and     d.cod_language 	= pty_lang
			where   cod_user_guest 	= pty_usuer
			and     b.cod_user 		= a.cod_user_host
			and     c.cod_type 		= a.cod_type
		) datos
		ORDER BY COD_STATE, TXT_NAME
	;
$BODY$
LANGUAGE SQL STABLE
ROWS 100;