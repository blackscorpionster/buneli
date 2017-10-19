<?php
	/***************************************************************************************************************
	 * 18/10/2017.
	* Guillermo Hernandez.
	* This executes the update of the user's info
	* All rights reserved.
	* buneli.com, buneli, JSON SAYS are trademarks, patent under revision.
	*************************************************************************************************************** */
	class buneli_execution
	{
		function buneli_execute(&$form)
		{
			$ret = true;

			$bd = new bdd_access("_SEGURO");
			
			$userData = $_SESSION["buneli_user_data"];
			
			$ret = $bd->updateUserInfo($userData["COD_USER"], $form);
			
			if( !$ret )
				trigger_error("failure",E_USER_WARNING);
			else {
				//UPdates the session with the new info
				$_SESSION["buneli_user_data"]["TXT_NAME"] = $form['txtNameUpdate'];
				$_SESSION["buneli_user_data"]["TXT_SURNAME"] = $form['txtSurNameUpdate'];
				$_SESSION["buneli_user_data"]["PASS_RECOVERY_EMAIL"] = $form['txtEmailUpdate'];
			}
			return $ret;
		}
	}
	
?>
