<?php
	/***************************************************************************************************************
	 * 18/10/2017.
	 * Guillermo Hernandez.
	 * Validating the new user's info (Update info option)
	 * All rights reserved.
	 * buneli.com, buneli, JSON SAYS are trademarks, patent under revision.
	 ***************************************************************************************************************/
	class buneli_form
	{
		function buneli_form_validate(&$form)
		{
			//print_r($form);die("VALIDATE");
			
			$userData = $_SESSION["buneli_user_data"];
			if(count($userData) <= 0 ){
				trigger_error("wrong_session",E_USER_ERROR);
				return false;
			}
			
			
			$txtLogin = $form["txtLogin"];
		    $txtUserName = $form["txtNameUpdate"]; 
		    $txtFamName = $form["txtSurNameUpdate"]; 
		    $email = $form["txtEmailUpdate"];
			
			$ret = true;
			
			
			if($userData["TXT_EMAIL"] != $txtLogin ){
				trigger_error("wrong_session",E_USER_ERROR);
				return false;
			}
			
			if($txtLogin=="" || $txtUserName=="" || $txtFamName="")
			{
				trigger_error("new_user_valida",E_USER_ERROR);
				$ret = false;
			}
			
			return $ret;
		}
	}
?>