<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			//Build the user's HTML response
		
			$boxes = "";
			
			//print_r($contact);die("<<<<<<<<");
			//print("OKKKKKKKKKKKKKK");die(">>>>".$form["txtAcceptOrDiscard"]);
			if($form["txtAcceptOrDiscard"]==1)
			{
				$smarty = new json_Smarty();
				$smarty->assign("COD_USER_GUEST",$form["txtUser"]);
				$smarty->assign("TXT_NAME",$form["txtUserName"]);
				$smarty->assign("TXT_SURNAME",$form["txtUserFamName"]);
				$boxes = $smarty->fetch("singleContact.tpl.html");
				//$boxes = utf8_encode($boxes);
			}
			
			$newContact = 0;
			if($boxes)
				$newContact = 1;
			
			//print(">>>".$boxes);die();
			
			$response->setFunctionExc("JsonDrawAnser");
			
			$response->setResponse( 
									array(	
											$form["txtUser"],
											$newContact,
											array(
													array("divContacsContainer",$boxes,"divContact".$form["txtUser"])
												)
											//$boxes
										)
									);
			//print_r($response);die();
			return $response;
		}
	}
?>
