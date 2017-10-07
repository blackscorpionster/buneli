delimiter //
CREATE PROCEDURE FN_COMBOCOUNTRIES()
BEGIN

    select  cod_country COD_COUNTRY,
			txt_country TXT_COUNTRY
    from    BUNELI_COUNTRY B
	;
	

END;