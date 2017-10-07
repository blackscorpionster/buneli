<?php
	/***************************************************************************************************************
	 * 14/06/2012.
	 * Guillermo Hernandez.
	 * Validatig forms process is suppossed not to access the database, they only validate how acurrate the data are.
	 * All rights reserved.
	 * buneli.com, buneli, JSON SAYS are trademarks, patent under revision.
	 ***************************************************************************************************************/
	class buneli_form
	{
		function buneli_form_validate(&$form)
		{
			$ret = true;
			
			//print_r($_SESSION["buneli_user_data"]); 
			
			if(!isset($_SESSION["buneli_user_data"]))
			{
				$login = $form["txtLogin"];
				$pass =  $form["txtPass"];
				if($login=="" || $pass=="")
				{
					trigger_error("login_data_miss",E_USER_ERROR);
					$ret = false;
				}
				else
				{
					$form["txtPassCoded"]=md5($form["txtPass"]);
					unset($form["txtPass"]);
				}
			}
			
			//die("VALIDANDO okk");
			
			return $ret;
		}
	}
?>