delimiter //
CREATE PROCEDURE PR_CHANGEPASSWORD
(
    IN pty_email   		varchar(100),
    IN pty_pass     	varchar(33)
)
BEGIN

	UPDATE SEGURO.BUNELI_USER
	set	txt_pass = pty_pass
	WHERE	txt_email = pty_email
	;

END;
