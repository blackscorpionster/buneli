CREATE OR REPLACE FUNCTION FN_VALIDATE_USER
(
    pty_user    BUNELI_USER.TXT_EMAIL%type,            
    pty_pass    BUNELI_USER.TXT_PASS%type            
)
RETURN BUNELI_TYPES.TYPE_CURSOR
IS
    ltc_Data BUNELI_TYPES.TYPE_CURSOR;
BEGIN
    OPEN ltc_data for 
        select  *
        from    BUNELI_USER a
        where   A.TXT_EMAIL = pty_user
        and     A.TXT_PASS = pty_pass;
        
        return ltc_data;
END;