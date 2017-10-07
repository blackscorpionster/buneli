<?php
	/***************************************************************************************************************
	 * 14/06/2012.
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

			$bd = new bdd_access("_SEGURO");
			$userData = $bd->findUser($form["txtLogin"]);
			//print_r($userData);die();
			if($userData)
			{
				trigger_error("usr_alredy_exis",E_USER_ERROR);
				$ret = false;
			}
			else
			{
				//print_r($form);
				//die("USUARIO OKKKK");
				if($ret = $bd->saveNewUser($form))
					trigger_error("user_success",E_USER_NOTICE);
				else
					trigger_error("user_failure",E_USER_WARNING);
			}
			return $ret;
		}
	}
	
?>
