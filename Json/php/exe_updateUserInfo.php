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
			
			if( $ret = $bd->updateUserInfo($form) )
				trigger_error("success",E_USER_NOTICE);
			else
				trigger_error("failure",E_USER_WARNING);

			return $ret;
		}
	}
	
?>
