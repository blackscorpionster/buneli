delimiter //
CREATE PROCEDURE FN_USERMESSAGES
(
    IN pty_user integer
)
BEGIN
    --
		SELECT  CONCAT_WS( '_',from_user,to_user,DATE_FORMAT(fec_message,'%d%m%Y%H%i%S') ) as ID_MESSAGE,
                txt_message TXT_MESSAGE,
                (
                  SELECT  code
                  FROM  BUNELI_USER f
                  WHERE f.cod_user = a.from_user
                ) CODE
        FROM    JSON_MESSAGE a,
                JSON_CONTACT b
        WHERE   a.to_user = pty_user
        and     (a.ind_read is null or a.ind_read = 0)
        -- Y que el contacto de los dos usuarios este activo
        and     (  
					(b.cod_user_host = a.to_user and b.cod_user_guest = a.from_user and b.cod_state = 1) 
					OR 
					(b.cod_user_guest = a.to_user and b.cod_user_host = a.from_user and b.cod_state = 1) 
				)
        order by fec_message
        ;
    --
END;