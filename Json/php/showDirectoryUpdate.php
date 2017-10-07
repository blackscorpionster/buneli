<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			//Build the user's HTML response
			$userContacts= $_SESSION["buneli_all_contacts"];
			
			//print_r($userContacts);die();
			$bd = new bdd_access("_SEGURO");
		
			$smarty = new json_Smarty();
			$smarty->assign("deleteContact",$bd->getSingleMessage( $form["lang"],"delete_contact" ));
			$smarty->assign("directory",$userContacts);
			$boxes = $smarty->fetch("usersDirectoryList.tpl.html");
			
			//$boxes = utf8_encode($boxes);
			//print($boxes);die();
			$response->setFunctionExc("udpateList");
			
			$response->setResponse( 
									array(
											array("JsonSaysDirectoryBox",$boxes)
										 )
									);
			
			return $response;
		}
	}
?>
