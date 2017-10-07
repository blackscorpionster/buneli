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
			//print_r($_SESSION["buneli_all_contacts"]);die();
			//print_r($form);die();
			
			$contactToDelete = $form["txtUserToDelete"];
			$userData = $_SESSION["buneli_user_data"];
			$codUser = $userData["COD_USER"];
			
			//print("DATOS QUERY>>".$contactToDelete." ".$codUser);die();
			
			$bd = new bdd_access("_SEGURO");
			$ret = $bd->deleteContactInformation($contactToDelete,$codUser);
			
			//If evererything ends ok, the user contacts session array must be updated

			//Contacts and pending requests..
			$userContacts = $bd->getUserContacs($codUser, $form["lang"]);
			//print_r($userContacts);die();
			
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
			
			return $ret;
		}
	}
?>