delimiter //
CREATE PROCEDURE PR_CONTACTANSWER
(
    IN pty_user integer,
    IN pty_amswer integer,
    IN pty_me  integer,
    IN pty_type integer
)
BEGIN
        -- I am the host
	IF pty_amswer = 1 THEN
		IF pty_type = 1 THEN
			update  JSON_CONTACT
			set     cod_state = pty_amswer
			WHERE   cod_user_host = pty_me
			and     cod_user_guest = pty_user
			;
		ELSE -- I am the guest
			update  JSON_CONTACT
			set     cod_state = pty_amswer
			WHERE   cod_user_host = pty_user
			and     cod_user_guest = pty_me
			;
		END IF; 
	ELSE
		IF pty_type = 1 THEN
			DELETE FROM JSON_CONTACT
			WHERE   cod_user_host = pty_me
			and     cod_user_guest = pty_user
			;
		ELSE -- I am the guest
			DELETE FROM JSON_CONTACT
			WHERE   cod_user_host = pty_user
			and     cod_user_guest = pty_me
			;
		END IF; 
	END IF;
END;
