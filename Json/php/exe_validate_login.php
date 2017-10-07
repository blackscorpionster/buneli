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
			//print_r($_SESSION["buneli_user_data"]);die("SESSION >>>".$form["txtLogin"]." >>> ".$form["txtPassCoded"]);
			//The user object is built with the most relevant information
			if(!isset($_SESSION["buneli_user_data"]))
			{
				$txtLogin = $form["txtLogin"];
				$txtPass = $form["txtPassCoded"];
				$userData = $bd->validateUser($txtLogin,$txtPass);
				$code = $userData[0]["CODE"];
			}
			else
			{
				$userData = $_SESSION["buneli_user_data"];
				$code = $userData["CODE"];
			}
			
			//print_r($userData);die();
			
			//
			//unset($userData[0]["CODE"]);
			//
			//print_r($userData);die(">>>>".$code);
			if($userData)
			{
				if(!isset($_SESSION["buneli_user_data"]))
				{
					$_SESSION["buneli_user_data"] = $userData[0];
				}
				//The app option are recoverd tocreate the application menu
				$options = $_SESSION["buneli_json_options"];
				$userMenu = array();
				$appMenu = array();
				//
				//print_r($options);die(); ///TXT_COMMAND
				foreach($options as $pos => $arrOpt)
				{
					if($arrOpt["OPT_MENU"])
					{
						//if OPT_MENU = 1 then, it's a main option menu, but if it is 2, is session option
						if($arrOpt["OPT_MENU"]==2)
						{
							$userMenu[$arrOpt["TXT_OPTION"]]["OPT_COD"] = $arrOpt["COD_OPTION"];
							if($arrOpt["POP_UP"])
							{
								$userMenu[$arrOpt["TXT_OPTION"]]["COMMAND"] = command($arrOpt["COD_OPTION"],$arrOpt["TXT_COMMAND"],'P');//"popUpWindow(".$arrOpt["COD_OPTION"].")";
							}
							else {
								$userMenu[$arrOpt["TXT_OPTION"]]["COMMAND"] = command($arrOpt["COD_OPTION"],$arrOpt["TXT_COMMAND"],null);//"callOption(".$arrOpt["COD_OPTION"].")";
							}
						}
						else
						{
							$appMenu[$arrOpt["TXT_OPTION"]]["OPT_COD"] = $arrOpt["COD_OPTION"];
							$appMenu[$arrOpt["TXT_OPTION"]]["ICO"] = $arrOpt["IMG_USER"];
							if($arrOpt["POP_UP"])
							{
								$appMenu[$arrOpt["TXT_OPTION"]]["COMMAND"] = command($arrOpt["COD_OPTION"],$arrOpt["TXT_COMMAND"],'P');//"popUpWindow(".$arrOpt["COD_OPTION"].")";
							}
							else {
								$appMenu[$arrOpt["TXT_OPTION"]]["COMMAND"] = command($arrOpt["COD_OPTION"],$arrOpt["TXT_COMMAND"],null);//"callOption(".$arrOpt["COD_OPTION"].")";
							}
						}
					}
				}
				if(!$userMenu || !$appMenu)
				{
					trigger_error("menu_not_found",E_USER_ERROR);
					$ret = false;
				}
				else
				{
					//Contacts and pending requests..
					$userContacts = $bd->getUserContacs($_SESSION["buneli_user_data"]["COD_USER"], $form["lang"]);
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
					$form["code"] = $code;
					$_SESSION["buneli_user_options"] = $userMenu;
					$_SESSION["buneli_app_options"] = $appMenu;
					$_SESSION["buneli_all_contacts"] = $userContacts;
				}
			}
			else
			{
				trigger_error("user_not_found",E_USER_ERROR);
				$ret = false;
			}
			return $ret;
		}
	}
	
	function command($cod,$com,$opt)
	{
		if( $com )
			return $com;
		else
		{
			if($opt == 'P')
				return "popUpWindow(".$cod.")";
			else
				return "callOption(".$cod.")";
		}
	}
	
?>