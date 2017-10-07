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
			$smarty->assign("tittle", $bd->getSingleMessage( $form["lang"],"users_directory" ) );
			$smarty->assign("directory",$userContacts);
			$smarty->assign("findLbl",$bd->getSingleMessage( $form["lang"],"find_usr_lbl" ));
			$smarty->assign("findContact",$bd->getSingleMessage( $form["lang"],"find_contact" ));
			$smarty->assign("deleteContact",$bd->getSingleMessage( $form["lang"],"delete_contact" ));
			$smarty->assign("sendRequest",$bd->getSingleMessage( $form["lang"],"send_frequest" ));
			$boxes = $smarty->fetch("usersDirectory.tpl.html");
			
			//$boxes = utf8_encode($boxes);
			//print($boxes);die();
			$response->setFunctionExc("userDirectory");//("setObjectAsANewSon");
			
			$response->setResponse( 
									array(
											array("divMsgBoxes",$boxes,"divMainDirectoryBox")
										 )
									);
			
			return $response;
		}
	}
?>
