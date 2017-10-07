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
		    $txtPass = $form["txtPass"];
		    $txtUserName = $form["txtUserName"]; 
		    $txtFamName = $form["txtFamName"]; 
		    $cmbCountries = $form["cmbCountries"];
			$ret = true;
			if($txtLogin=="" || $txtPass=="" || $txtUserName=="" || $txtFamName="" || $cmbCountries=='0')
			{
				trigger_error("new_user_valida",E_USER_ERROR);
				$ret = false;
			}
			else
			{
				$form["txtPassCoded"]=md5($form["txtPass"]);
				unset($form["txtPass"]);
				///print_r($form);die(">>>>>>>>>>>>>>>>>>>>>>>");
			}
			return $ret;
		}
	}
?>