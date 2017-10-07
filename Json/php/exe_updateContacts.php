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
			$userData = $_SESSION["buneli_user_data"];
			$codUser = $userData["COD_USER"];
			
			$bd = new bdd_access("_SEGURO");

			//Contacts and pending requests..
			$userContacts = $bd->getUserContacs($codUser, $form["lang"]);
			
			//print_r($userContacts);die();
			
			//Split the information between actual Contacts and pending requests
			$contacts = array();
			$requests = array();
			
			foreach($userContacts as $pos => $arrContact)
			{
				if($arrContact["COD_STATE"] == 1)
				{
					$contacts[$pos] = $arrContact;
				}
				elseif($arrContact["COD_STATE"] == 2)
				{
					$requests[$pos] = $arrContact;
				}
			}
			
			$_SESSION["buneli_user_contacts"] = $contacts;
			$form["contactRequests"] = $requests;
			$_SESSION["buneli_all_contacts"] = $userContacts;

			return $ret;
		}
	}
?>