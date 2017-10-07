CREATE OR REPLACE FUNCTION FN_FINDUSER
(
    pty_email varchar(100)
)RETURNS TABLE(COD_USER INTEGER,
			TXT_NAME VARCHAR,
			TXT_SURNAME VARCHAR,
			TXT_EMAIL VARCHAR,
			TXT_COUNTRY VARCHAR) AS
$BODY$

    select  cod_user COD_USER,
			txt_name TXT_NAME,
			txt_surname TXT_SURNAME,
			txt_email TXT_EMAIL,
			txt_country TXT_COUNTRY
    from    BUNELI_USER A,
			BUNELI_COUNTRY B
    where   A.txt_email = pty_email
	and		B.cod_country = A.cod_country
	;
	
$BODY$
LANGUAGE SQL STABLE
ROWS 1;