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
			//print_r($form);die();
			$txtLogin = $form["txtEmailDelete"]; 

			$userLogin = $_SESSION["buneli_user_data"]["TXT_EMAIL"];
			
			$ret = true;
			if($txtLogin=="" || $txtLogin <> $userLogin)
			{
				trigger_error("identi_validat",E_USER_ERROR); ///
				$ret = false;
			}
			
			return $ret;
		}
	}
?>