CREATE DATABASE  IF NOT EXISTS `SEGURO` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `SEGURO`;
-- MySQL dump 10.13  Distrib 5.6.26, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: SEGURO
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'SEGURO'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_GETMESSAGE` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` FUNCTION `FN_GETMESSAGE`(
    pty_app  INT,
    pty_lang varchar(3),
    pty_codmsg varchar(15)
) RETURNS varchar(120) CHARSET latin1
BEGIN
	DECLARE lvc_message varchar(120);

	SET lvc_message = null;

    select  txt_message TXT_MESSAGE
	INTO	lvc_message
    from    BUNELI_MESSAGES
    where   cod_app 		= pty_app
    and     cod_language 	= pty_lang
    and     cod_message 	= pty_codmsg
	;
	
	return lvc_message;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP FUNCTION IF EXISTS `FN_RNDCODE` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` FUNCTION `FN_RNDCODE`() RETURNS bigint(20)
BEGIN

  DECLARE lnu_curNumber tinyint;
  DECLARE lnu_longitud int;
  DECLARE lvc_Acomula varchar(10);
  DECLARE lvc_error varchar(400);
  
  --
  SET lvc_Acomula = '';
  
  -- DECLARE specialty CONDITION FOR SQLSTATE '45000';
  
  SET lnu_curNumber =  FLOOR(0 + (RAND() * 10)); -- ROUND(1.0 + 9.0 * RAND());
  
  SET lvc_Acomula = lnu_curNumber;

  SET lnu_longitud = CHAR_LENGTH(lvc_Acomula);
  
  SET lvc_error = CONCAT('LINI>>>',lnu_longitud,'<ACINI>',lvc_Acomula);
   -- select lnu_longitud;
   -- select lvc_Acomula;
  
  WHILE lnu_longitud < 10 DO
  
    SET lnu_curNumber = FLOOR(0 + (RAND() * 10)); -- ROUND(1.0 + 9.0 * RAND());
 
    SET lvc_error = CONCAT(lvc_error,'N',lnu_curNumber);
 
    IF INSTR(  lvc_Acomula, lnu_curNumber ) = 0 THEN
       SET  lvc_Acomula = CONCAT(lvc_Acomula,lnu_curNumber);
    END IF;
    
    SET lnu_longitud = CHAR_LENGTH(lvc_Acomula);

    /*IF lnu_longitud = 10 THEN
      SET lvc_error = CONCAT(lvc_error,'<LG>',lnu_longitud,'<CA>',lvc_Acomula);
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = lvc_error;
    END IF;*/
  
  END WHILE;
  
  RETURN (lvc_Acomula+0);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `FN_APPOPTIONS` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `FN_APPOPTIONS`(
    IN pty_app INT,
	IN pty_lang VARCHAR(3)
)
BEGIN

        SELECT  a.cod_app as COD_APP, 
				a.txt_name as TXT_NAME, 
				a.cod_state as COD_STATE, 
				a.dat_begin as DAT_BEGIN, 
				a.dat_end as DAT_END,
				b.cod_app as COD_APP, 
				b.cod_option as COD_OPTION, 
				IFNULL(BUNELI_OPTION_DICTIONARY.txt_translation,b.txt_option) as TXT_OPTION, 
				b.url_validate as URL_VALIDATE, 
				b.url_execute as URL_EXECUTE, 
				b.url_draw as URL_DRAW, 
				b.opt_menu as OPT_MENU, 
				b.opt_father_menu as OPT_FATHER_MENU, 
				b.img_option as IMG_USER, 
				b.pop_up as POP_UP,
				b.txt_command as TXT_COMMAND
		FROM    BUNELI_APP a,
				BUNELI_OPTION b
				LEFT JOIN BUNELI_OPTION_DICTIONARY ON 
				BUNELI_OPTION_DICTIONARY.cod_language = pty_lang
				and BUNELI_OPTION_DICTIONARY.txt_option = b.txt_option
		where   a.cod_app = pty_app
		and     b.cod_app = a.cod_app
		;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `FN_APP_MESSAGES` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `FN_APP_MESSAGES`(
    IN pty_app int,
    IN pty_lang varchar(3)
)
BEGIN
    --
    select  cod_message as COD_MESSAGE,
            txt_message as TXT_MESSAGE
    from    BUNELI_MESSAGES a
    where   a.cod_app = pty_app
    and     a.cod_language = pty_lang
	and     ind_application = 1
	;
    --
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `FN_COMBOCOUNTRIES` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `FN_COMBOCOUNTRIES`()
BEGIN

    select  cod_country COD_COUNTRY,
			txt_country TXT_COUNTRY
    from    BUNELI_COUNTRY B
	;
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `FN_FINDUSER` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `FN_FINDUSER`(
    pty_email varchar(100)
)
BEGIN

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
	

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `FN_USERCONTACTS` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `FN_USERCONTACTS`(
    pty_usuer INT,
    pty_lang  varchar(3)
)
BEGIN
	select	datos.*
	from	(
			select  a.cod_user_host  	COD_USER_HOST, 
					a.cod_user_guest 	COD_USER_GUEST, 
					b.txt_name 			TXT_NAME,  
					b.txt_surname 		TXT_SURNAME, 
					a.link_message 		LINK_MESSAGE, 
					a.fec_start 		FEC_START, 
					a.cod_state 		COD_STATE,
					'OUT' 				REQUEST_TYPE, 
					IFNULL(d.txt_translation,c.txt_name) CONTACT_TYPE
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
					IFNULL(d.txt_translation,c.txt_name) CONTACT_TYPE
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

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `FN_USERMESSAGES` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `FN_USERMESSAGES`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `FN_USERREQUESTS` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `FN_USERREQUESTS`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `FN_VALIDATE_USER` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `FN_VALIDATE_USER`(
    IN pty_user    varchar(100),            
    IN pty_pass    varchar(33)
)
BEGIN
	select  cod_user as COD_USER, 
			txt_name as TXT_NAME, 
			txt_surname as TXT_SURNAME, 
			txt_email as TXT_EMAIL, 
			txt_pass as TXT_PASS, 
			mob_number as MOB_NUMBER, 
			dat_singup as DAT_SINGUP, 
			dat_singaway as DAT_SINGAWAY, 
			cod_state as COD_STATE, 
			cod_country as COD_COUNTRY, 
			img_user as IMG_USER, 
			com_file as COM_FILE,
      code       as CODE
	from    BUNELI_USER a
	where   a.txt_email = pty_user
	and     a.txt_pass = pty_pass
	;
        
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_CHANGEPASSWORD` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `PR_CHANGEPASSWORD`(
    IN pty_email   		varchar(100),
    IN pty_pass     	varchar(33)
)
BEGIN

	UPDATE SEGURO.BUNELI_USER
	set	txt_pass = pty_pass
	WHERE	txt_email = pty_email
	;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_CONTACTANSWER` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `PR_CONTACTANSWER`(
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
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_DELETEACCOUNT` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `PR_DELETEACCOUNT`(
  p_codUser INT,
  p_email   VARCHAR(100),
  p_emailConf VARCHAR(100)
)
BEGIN

  declare lnuuser integer;

  select  cod_user
  into  lnuuser
  from  BUNELI_USER
	WHERE	cod_user = p_codUser
  and  txt_email	= p_email
  and   txt_email	= p_emailConf
  ;

  IF lnuuser THEN

    DELETE FROM JSON_MESSAGE
  	where		from_user = p_codUser
  	;

  	-- Borramos todos los mensajes entre los dos contactos
  	DELETE FROM JSON_MESSAGE
  	where		to_user = p_codUser
  	;

  	DELETE FROM JSON_CONTACT
  	WHERE	cod_user_host = p_codUser
    ;
    
    DELETE FROM JSON_CONTACT
  	WHERE	cod_user_guest = p_codUser
    ;
    
    DELETE FROM BUNELI_USER
  	WHERE	cod_user = p_codUser
    ;

  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_DELETECONTACTINFORMATION` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `PR_DELETECONTACTINFORMATION`(
    IN pty_contact_delete   integer,
    IN pty_user     		integer
)
BEGIN
    -- Borramos todos los mensajes entre los dos contactos
	DELETE FROM JSON_MESSAGE
	where		from_user = pty_contact_delete
	and			to_user = pty_user
	;

	-- Borramos todos los mensajes entre los dos contactos
	DELETE FROM JSON_MESSAGE
	where		from_user = pty_user
	and			to_user = pty_contact_delete
	;

	DELETE FROM JSON_CONTACT
	WHERE	( 
				(cod_user_host = pty_user and cod_user_guest = pty_contact_delete) 
				or 
				(cod_user_host = pty_contact_delete and cod_user_guest = pty_user) 
			);

    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_SAVECONTACTREQUEST` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `PR_SAVECONTACTREQUEST`(
    IN pty_from   integer,
    IN pty_to     integer,
    IN pty_message    varchar(178),
	IN pty_lang			varchar(3)
)
BEGIN

	DECLARE lty_state TINYINT default null;
	DECLARE lty_message VARCHAR(120);

	set lty_state = null;

	IF pty_from = pty_to THEN
		SET lty_message = FN_GETMESSAGE(1,pty_lang,'same_contact');
		SIGNAL SQLSTATE VALUE '99999'
		SET MESSAGE_TEXT = lty_message;
	ELSE
		-- Validating the users relation
		select	cod_state
		into	lty_state
		from	JSON_CONTACT
		where   (
					cod_user_host = pty_from and cod_user_guest = pty_to 
					or cod_user_host = pty_to and cod_user_guest = pty_from
				)
		;

		IF lty_state IS NULL THEN
			INSERT INTO JSON_CONTACT values (pty_from,pty_to,2,NOW(),pty_message,1);
			commit;
		ELSE
			SET lty_message = FN_GETMESSAGE(1,pty_lang,'contact_exists');
			SIGNAL SQLSTATE VALUE '99999'
			SET MESSAGE_TEXT = lty_message;
		END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_SAVENEWUSER` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `PR_SAVENEWUSER`(
    IN pty_email   		varchar(100),
    IN pty_pass     	varchar(33),
    IN pty_userName    	varchar(100),
	IN pty_famName		varchar(100),
	IN pty_country		varchar(2)
)
BEGIN

	DECLARE lty_codUser INT default null;
  DECLARE lnu_cod BIGINT default null;
  
  SET lnu_cod = FN_RNDCODE();

	select	MAX(COD_USER)
	into	lty_codUser
	from	BUNELI_USER
	;

	if lty_codUser is null THEN
		SET lty_codUser = 1;
	END IF;

	SET lty_codUser = lty_codUser + 1;

	INSERT INTO SEGURO.BUNELI_USER
	(cod_user,
	txt_name,
	txt_surname,
	txt_email,
	txt_pass,
	dat_singup,
	cod_state,
	cod_country,
  code
	)
	VALUES
	(
		lty_codUser,
		pty_userName,
		pty_famName,
		pty_email,
		pty_pass,
		CURDATE(),-- Fecha
		1,
		pty_country,
    lnu_cod
	);

	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_SENDMESSAGE` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `PR_SENDMESSAGE`(
    IN pty_from   integer,
    IN pty_to     integer,
    IN pty_message    varchar(178),
	IN pty_lang  varchar(3)
)
BEGIN

	DECLARE lty_state TINYINT default null;
	DECLARE lty_message VARCHAR(120);

	set lty_state = null;

	-- Validating the users relation
	select	cod_state
	into	lty_state
	from	JSON_CONTACT
	where   (
				cod_user_host = pty_from and cod_user_guest = pty_to 
				or cod_user_host = pty_to and cod_user_guest = pty_from
			)
	;

	IF lty_state <> 1 or lty_state IS NULL THEN
		SET lty_message = FN_GETMESSAGE(1,pty_lang,'message_not_sen');
		SIGNAL SQLSTATE VALUE '99999'
		SET MESSAGE_TEXT = lty_message;
	END IF;

    INSERT INTO JSON_MESSAGE values (NOW(),pty_from,pty_to,pty_message,null);
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!50003 DROP PROCEDURE IF EXISTS `PR_SETMESSAGEREAD` */;
ALTER DATABASE `SEGURO` CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`blackscorpion`@`%` PROCEDURE `PR_SETMESSAGEREAD`(
    IN pty_from_user   integer,
    IN pty_to_user     integer,
    IN pty_date_str    varchar(20)
)
BEGIN
    UPDATE  JSON_MESSAGE
    set     ind_read = 1
    WHERE   fec_message = STR_TO_DATE(pty_date_str,'%d%m%Y%H%i%S')
    and     from_user 	= pty_from_user
    and     to_user 	= pty_to_user
    ;
    commit;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
ALTER DATABASE `SEGURO` CHARACTER SET utf8 COLLATE utf8_general_ci ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-26 20:56:15
