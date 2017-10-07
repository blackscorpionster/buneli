<?php
	/***************************************************************************************************************
	 * 15/06/2012.
	* Guillermo Hernandez.
	* This object contains the rules to be exeuted, this is the core of the action itself.
	* All rights reserved.
	* buneli.com, buneli, JSON SAYS are trademarks, patent under revision.
	*************************************************************************************************************** */
	class buneli_execution
	{
		function buneli_execute(&$form)
		{
			$ret = true;
			
			$userData = $_SESSION["buneli_user_data"];
			$codUser = $userData["COD_USER"];
			$email = $userData["TXT_EMAIL"];
			
			//die(">>>>>".$codUser."<<>>".$email."<<>>".$form["txtEmailDelete"]);
			
			$bd = new bdd_access("_SEGURO");
			$ret = $bd->deleteUserAccount($codUser,$email,$form["txtEmailDelete"]);
			
			if($ret)
			{
				$userDataAfter = $bd->findUser($email);
				if($userDataAfter)
				{
					$ret = false;
					trigger_error("no_deletion",E_USER_WARNING);
				}
				else
				{
					restartSystem();
				}
			}
			
			return $ret;
		}
	}
	
	function restartSystem()
	{
		session_start();
		session_unset();
		session_destroy() or die("Error");
		if(isset($_COOKIE[session_name()]))
		{
			setcookie(session_name(), '', time()-3600, '/');
		}
	}
	
?>