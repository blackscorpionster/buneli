<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			//die(">>>>>>>>>VISTAAAAA>>>>>>>>>>>>");
			
			//Build the user's HTML response
			$userInfo= $form["contactInformation"];
			
			//print_r($userInfo);die();
			
			$bd = new bdd_access("_SEGURO");
		
			$smarty = new json_Smarty();
			$smarty->assign("resultado",$userInfo);
			$smarty->assign("sendRequest",$bd->getSingleMessage( $form["lang"],"contact_request" ));
			$smarty->assign("contactMessage",$bd->getSingleMessage( $form["lang"],"link_message" ));
			
			$boxes = $smarty->fetch("userFindingResult.tpl.html");
			
			//$boxes = utf8_encode($boxes);
			//print($boxes);die("<<<<<");
			$response->setFunctionExc("setInnerHTML");
			
			$response->setResponse( 
									array(
											array("JsonSaysConactOPtion",$boxes)
										 )
									);
			
			return $response;
		}
	}
?>
