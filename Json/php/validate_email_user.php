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
			
			$txtLogin = $form["txtLogin"]; 
			
			$ret = true;
			if($txtLogin=="")
			{
				trigger_error("new_user_valida",E_USER_ERROR);
				$ret = false;
			}
			
			return $ret;
		}
	}
?>