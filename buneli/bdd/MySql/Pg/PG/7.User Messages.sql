DROP FUNCTION IF EXISTS FN_USERMESSAGES(integer);

CREATE OR REPLACE FUNCTION FN_USERMESSAGES
(
    IN pty_user integer,
    IN pty_fromuser integer DEFAULT NULL
    
)
RETURNS TABLE (ID_MESSAGE VARCHAR, TXT_MESSAGE VARCHAR, CODE BIGINT, CLASSNAME VARCHAR, fec_message TIMESTAMP WITHOUT TIME ZONE) AS
$BODY$
    --
        WITH receivedMessages AS (
          
            SELECT  from_user||'_'||to_user||'_'||TO_CHAR(fec_message,'DDMMYYYYHH24MISS') as ID_MESSAGE,
                    txt_message AS TXT_MESSAGE,
                    (
                      SELECT  code
                      FROM  BUNELI_USER f
                      WHERE f.cod_user = a.from_user
                    ) CODE, -- El codigo de quien envia el message para la decodificacion
                    fec_message,
                    from_user,
                    to_user,
                    a.ind_read
            FROM    JSON_MESSAGE a,
                    JSON_CONTACT b
            WHERE   a.to_user = pty_user -- Los mensajes para el usuatio
            AND CASE WHEN pty_fromuser IS NOT NULL THEN a.from_user = pty_fromuser ELSE true end
            --and     (a.ind_read is null or a.ind_read = 0)
            -- Y que el contacto de los dos usuarios este activo
            and     (  
              (b.cod_user_host = a.to_user and b.cod_user_guest = a.from_user and b.cod_state = 1) 
              OR 
              (b.cod_user_guest = a.to_user and b.cod_user_host = a.from_user and b.cod_state = 1) 
            )
            --order by fec_message
            
         ), sentToMessages AS ( -- These are the messages i sent to the user who send me messages so the conversation can be fully loaded
         
            SELECT  to_user||'_'||from_user||'_'||TO_CHAR(fec_message,'DDMMYYYYHH24MISS') as ID_MESSAGE,
                    txt_message AS TXT_MESSAGE,
                    (
                      SELECT  code
                      FROM  BUNELI_USER f
                      WHERE f.cod_user = a.from_user
                    ) CODE,
                    fec_message
            FROM    JSON_MESSAGE a
            WHERE   a.from_user = pty_user
            AND CASE WHEN pty_fromuser IS NOT NULL THEN a.to_user = pty_fromuser ELSE true end
            AND a.to_user IN (SELECT distinct from_user FROM receivedMessages) -- Any message that I have sent to the users who sent me messages
    
         ), markMessagesAsRead AS (

            UPDATE JSON_MESSAGE Y
            SET ind_read = 1
            FROM receivedMessages X
            WHERE Y.fec_message = X.fec_message
            AND Y.from_user = X.from_user
            AND Y.to_user = X.to_user
            AND (X.ind_read is null OR X.ind_read = 0)

         )
         SELECT ID_MESSAGE, TXT_MESSAGE, CODE, 'JsonSaysRecibido'::varchar as CLASSNAME, fec_message
         FROM receivedMessages 
         UNION ALL 
         SELECT ID_MESSAGE, TXT_MESSAGE, CODE, 'JsonSaysEnviado'::varchar as CLASSNAME, fec_message
         FROM sentToMessages 
         ORDER BY fec_message
        ;
    --
$BODY$
LANGUAGE SQL VOLATILE
ROWS 10;