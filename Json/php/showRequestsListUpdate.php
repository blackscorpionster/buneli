<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();

			$userData = $_SESSION["buneli_user_data"];
			$codUser = $userData["COD_USER"];
			
			$bd = new bdd_access("_SEGURO");
			
			$accept = $bd->getSingleMessage($_REQUEST["lang"],'accept');
			$discard = $bd->getSingleMessage($_REQUEST["lang"],'discard');
			
			$contactRequests = $bd->getPendingRequests($codUser);
		
			$smarty = new json_Smarty();
			
			$smarty->assign("cantidad", count($contactRequests) );
			$smarty->assign("optionAccept",$accept);
			$smarty->assign("optionDiscard",$discard);
		
			$smarty->assign("solicitudes",$contactRequests);
			$boxes = $smarty->fetch("requestsBoxList.tpl.html");
			
			//$boxes = utf8_encode($boxes);
			//print($boxes);die();
			$response->setFunctionExc("udpateList");
				
			$response->setResponse( 
									array(
											array("JsonSaysRequestsBox",$boxes),
											array("divCuentaSolicutudes",count($contactRequests) )
										 )
									);
			return $response;
		}
	}
?>
