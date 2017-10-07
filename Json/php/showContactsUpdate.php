<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			$bd = new bdd_access("_SEGURO");
			
			$ConTittle = $bd->getSingleMessage($_REQUEST["lang"],'tittle_contacts');
			//die(" >> ".$ConTittle);
			$smarty = new json_Smarty();
			//Contacts
			//print_r($_SESSION["buneli_user_contacts"]);die("<<");
			$contactList = array();
			foreach($_SESSION["buneli_user_contacts"] as $key => $contactData){
				$contactList[] = $contactData["COD_USER_GUEST"];
			}
			//print_r($contactList);die(" << ");
			$smarty->assign("contacts",$_SESSION["buneli_user_contacts"]);
			$smarty->assign("conTittle",$ConTittle);
			$contacts = $smarty->fetch("contacts.tpl.html");
			//$contacts = utf8_encode($contacts);
			
			//print($contacts);die("SOLICITUDES>>>>".count($form["contactRequests"]));
			$response->setFunctionExc("updateContactsAndRequests");
			
			$response->setResponse( 
									array(
											count($form["contactRequests"]),
											array(
													array("divCtsContainer",$contacts)
												),
												$contactList
										 )
									);
			//print_r($response);die();
			return $response;
		}
	}
?>
