DROP FUNCTION IF EXISTS PR_UPDATE(in_userId integer, in_updatedData Json);

CREATE OR REPLACE FUNCTION PR_UPDATE(in_userId integer, in_updatedData Json)
RETURNS VOID AS
$BODY$

DECLARE

  l_validUser integer;
  lty_message CHARACTER VARYING;

BEGIN

  UPDATE buneli_user U
  SET txt_name = in_updatedData->>'txtNameUpdate',
      txt_surname = in_updatedData->>'txtSurNameUpdate',
      pass_recovery_email = in_updatedData->>'txtEmailUpdate'
  WHERE cod_user = in_userId
  AND txt_email = in_updatedData->>'txtLogin'
  RETURNING cod_user INTO l_validUser;

  IF COALESCE(l_validUser,0) <= 0 then
 		lty_message = FN_GETMESSAGE(1,in_updatedData->>'lang','failure');
		RAISE EXCEPTION '%',lty_message;
  END IF;
  
END;
 
$BODY$
LANGUAGE PLPGSQL VOLATILE
COST 100
;

/*

select *
FROM json_each_text('{"lang":"esp","app":"_JSON","action":"24","txtLogin":"litza","txtNameUpdate":"litza","txtSurNameUpdate":"marin","txtEmailUpdate":""}'::json)



select '{"lang":"esp","app":"_JSON","action":"24","txtLogin":"litza","txtNameUpdate":"litza","txtSurNameUpdate":"marin","txtEmailUpdate":""}'::json->>'txtNameUpdasdate'
a
*/