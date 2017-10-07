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
			//print_r($form);die();
			
			//  [txtContactMessage] => Le envio la invitacion
    		//[txtContactUser] => 5
			//[txtUserToFind] => h.aia@a.
			
			$userData = $_SESSION["buneli_user_data"];
			$codUser = $userData["COD_USER"];
			
			$bd = new bdd_access("_SEGURO");
			$ret = $bd->saveContactRequest($form["txtContactUser"],$form["txtContactMessage"],$codUser, $form["lang"]);
			
			//Contacts and pending requests..
			$userContacts = $bd->getUserContacs($codUser, $form["lang"]);
			
			if($ret)
			{
				$contacts = array();
				foreach($userContacts as $pos => $arrContact)
				{
					if($arrContact["COD_STATE"] == 1)
					{
						$contacts[$pos] = $arrContact;
					}
				}
				$_SESSION["buneli_user_contacts"] = $contacts;
				$_SESSION["buneli_all_contacts"] = $userContacts;
			}
			
			return $ret;
		}
	}
?>