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
-- Table structure for table `BUNELI_MESSAGES`
--

DROP TABLE IF EXISTS `BUNELI_MESSAGES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BUNELI_MESSAGES` (
  `cod_app` tinyint(4) NOT NULL DEFAULT '0',
  `cod_message` varchar(15) NOT NULL DEFAULT '',
  `cod_language` varchar(3) NOT NULL DEFAULT '',
  `txt_message` varchar(120) DEFAULT NULL,
  `ind_application` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`cod_app`,`cod_message`,`cod_language`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BUNELI_MESSAGES`
--

LOCK TABLES `BUNELI_MESSAGES` WRITE;
/*!40000 ALTER TABLE `BUNELI_MESSAGES` DISABLE KEYS */;
INSERT INTO `BUNELI_MESSAGES` VALUES (1,'about','eng','About Kellk',0),(1,'about','esp','Acerca de Kellk',0),(1,'accept','eng','Accept',0),(1,'accept','esp','Aceptar',0),(1,'close_click','eng','Click X to close',0),(1,'close_click','esp','Clic en la X para cerrar',0),(1,'contact_exists','eng','The contact alredy exists on your contact list, or there is a contact request pending',0),(1,'contact_exists','esp','El contacto ya existe en su lista de contactos o ya hay una peticion pendiente',0),(1,'contact_request','eng','Send contact request',0),(1,'contact_request','esp','Enviar solicitud de contacto',0),(1,'country','eng','Where are you?',0),(1,'country','esp','Donde se encuentra?',0),(1,'delete_accnt','eng','Are you sure to delete your account?',1),(1,'delete_accnt','esp','Esta seguro de borrar su cuenta de usuario?',1),(1,'delete_contact','eng','Delete Contact',0),(1,'delete_contact','esp','Borrar Contacto',0),(1,'delete_question','eng','Sure to delete the contact?',1),(1,'delete_question','esp','Desea borrar el contacto?',1),(1,'discard','eng','Discard',0),(1,'discard','esp','Descartar',0),(1,'div_master_ad','eng','The div_master div object is required.',1),(1,'div_master_ad','esp','El div div_master es requerido',1),(1,'drop_account','eng','Drop user\'s account',0),(1,'drop_account','esp','Borrar cuenta de usuario',0),(1,'empty_option','eng','There are not settings stablished for this action',1),(1,'empty_option','esp','La opcion no tiene ninguna configuracion establecida',1),(1,'find_contact','eng','Find user using the email',0),(1,'find_contact','esp','Encontrar usuario por email',0),(1,'find_usr_lbl','eng','Find users',0),(1,'find_usr_lbl','esp','Buscar usuarios',0),(1,'friend_not_exis','eng','The contac\'s email typed is not on you contacts list',1),(1,'friend_not_exis','esp','El correo del contacto digitado, no existe en tu lista de contactos',1),(1,'friend_text','eng','Type one of your contacts\' email to double-check your information',1),(1,'friend_text','esp','Digite el email de uno de sus contactos para verificar su informacion',1),(1,'frm_error','eng','Both Forms, main and aux, must be declared',1),(1,'frm_error','esp','Ambas Formas, main y aux, deben ser declaradas',1),(1,'got_pass_email','eng','didn\'t you receive an email with a new password?',1),(1,'got_pass_email','esp','¿no recibiste un correo con la nueva clave?',1),(1,'help','eng','Help',0),(1,'help','esp','Ayuda',0),(1,'identi_validat','eng','The user\'s identity couldn\'t be certified. Restartar the application and try again.',1),(1,'identi_validat','esp','No se pudo certificar la identidad del usuario. Intenetelo nuevamente reiniciando la aplicacion.',1),(1,'link_message','eng','Contact Message',0),(1,'link_message','esp','Mensaje para el contacto',0),(1,'login_data_miss','eng','Both fields, user and pass must be filled',1),(1,'login_data_miss','esp','Ambos Campos, usuario y password beden ser diligenciados',1),(1,'log_in','eng','Login',0),(1,'log_in','esp','Ingresar',0),(1,'menu_not_found','eng','There isn\'t an available menu, please contact the service administrator',1),(1,'menu_not_found','esp','No hay un menu relacionado, porfavor, contacte el administrador del servicio',1),(1,'message_not_sen','eng','Message not delivered, user not longer on your contacts list.',0),(1,'message_not_sen','esp','Mensaje no entregado, el usuario ya no esta en sus contactos.',0),(1,'mobile_number','eng','Mobile number',1),(1,'mobile_number','esp','Numero celular',1),(1,'newuser_txt','eng','Create new account',0),(1,'newuser_txt','esp','Abrir cuenta Nueva',0),(1,'new_pass','eng','Forgot your password?',0),(1,'new_pass','esp','Olvido su calve?',0),(1,'new_pass_mail','eng','Esta es la nueva clave de su cuenta',1),(1,'new_pass_mail','esp','This is your new account password',1),(1,'new_requests','eng','Contact requests',0),(1,'new_requests','esp','Solicitudes de contacto',0),(1,'new_users','eng','Create an account',0),(1,'new_users','esp','Registrarse',0),(1,'new_user_valida','eng','All fields must be filled',1),(1,'new_user_valida','esp','Todos los campos con obligatorios',1),(1,'no','eng','NO',1),(1,'no','esp','NO',1),(1,'notes','eng','Notes',1),(1,'notes','esp','Notas',1),(1,'no_deletion','eng','Error when trying to delete the account, try againg later.',1),(1,'no_deletion','esp','Error al intentar borrar la cuenta, intentelo nuevamente.',1),(1,'no_new_messages','eng','There are no new messages!',1),(1,'no_new_messages','esp','No hay mensajes nuevos!',1),(1,'no_pend_request','eng','You don\'t have any pending requests',1),(1,'no_pend_request','esp','No tiene solicitudes pendientes',1),(1,'opt_not_found','eng','Option nof found, contact the service Administrator',1),(1,'opt_not_found','esp','Opcion no encontrada, contacte el administrador del sistema',1),(1,'pass_no_change','eng','Problems occurred when changing the user\'s password',1),(1,'pass_no_change','esp','Problemas al cambiar la clave del usuario',1),(1,'pass_txt','eng','Password',0),(1,'pass_txt','esp','Clave',0),(1,'problems','eng','Problems',1),(1,'problems','esp','Problemas',1),(1,'registered_user','eng','Signin',0),(1,'registered_user','esp','Ingresar',0),(1,'same_contact','eng','Can\'t send a request to yourself',0),(1,'same_contact','esp','No puede solicitar un contacto a usted mismo',0),(1,'send_frequest','eng','Frienship request',0),(1,'send_frequest','esp','Solicitud de amistad',0),(1,'sign_in','eng','Signin',0),(1,'sign_in','esp','Registrarse',0),(1,'terms','eng','Terms and coditions',0),(1,'terms','esp','Terminos y condiciones',0),(1,'tittle_contacts','eng','Contacts',0),(1,'tittle_contacts','esp','Contactos',0),(1,'tittle_login','eng','Start Here',0),(1,'tittle_login','esp','Inicio de sesión',0),(1,'tittle_options','eng','Options',0),(1,'tittle_options','esp','Opciones',0),(1,'tittle_pass','eng','Password recovery',0),(1,'tittle_pass','esp','Recuperar Clave',0),(1,'tittle_signin','eng','Create New Account',0),(1,'tittle_signin','esp','Crear nueva Cuenta',0),(1,'tittle_welcome','eng','Welcome, on your left you will find the available options',0),(1,'tittle_welcome','esp','Bienvenido, a su izquierda encontrara la opciones disponibles',0),(1,'type_correct_em','eng','Type a correct email address',1),(1,'type_correct_em','esp','Digite una direccion de email valida',1),(1,'unread_messages','eng','Unread Messages',0),(1,'unread_messages','esp','Mensajes sin leer',0),(1,'users_directory','eng','Users directory',0),(1,'users_directory','esp','Directorio de usuarios',0),(1,'user_failure','eng','User not registered',1),(1,'user_failure','esp','No se pudo registrar el usuario',1),(1,'user_fname','eng','First Name(s)',0),(1,'user_fname','esp','Nombre(s)',0),(1,'user_lname','eng','Family Name(s)',0),(1,'user_lname','esp','Apellido(s)',0),(1,'user_not_found','eng','Data given doesn\'t exist, please check the given information.',1),(1,'user_not_found','esp','Los datos ingresados no existen, verifique la informacion suministrada.',1),(1,'user_success','eng','User registered successfully. Welcome, enjoy!',1),(1,'user_success','esp','Su registro ha sido exitoso. Bienvenido, disfruta la aplicacion.',1),(1,'user_text','eng','Nickname',0),(1,'user_text','esp','Usuario',0),(1,'usr_alredy_exis','eng','The associated email is already registered.',1),(1,'usr_alredy_exis','esp','El correo electronico ingresado ya existe. Recupere su clave por la opcion del menu',1),(1,'yes','eng','YES',1),(1,'yes','esp','SI',1),(1,'your_account','eng','Your information',0),(1,'your_account','esp','Su información',0);
/*!40000 ALTER TABLE `BUNELI_MESSAGES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-26 20:56:14
