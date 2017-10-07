<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			//Build the user's HTML response
			//$requests = $_SESSION;//["unreadMessages"][$form["txtUserBoxCod"]];
			//print_r($form);die();
			$userData = $_SESSION["buneli_user_data"];
			$codUser = $userData["COD_USER"];
			
			$bd = new bdd_access("_SEGURO");
			
			$contactRequests = $bd->getPendingRequests($codUser);
			//print_r($contactRequests);die();
			
			/*
			
			    [0] => Array
					(
						[TIPO] => 1
						[USER_NAME] => KATE PICAZO
						[FEC_START] => 2013-08-13
						[LINK_MESSAGE] => Hola Kate
					)

				[1] => Array
					(
						[TIPO] => 2
						[USER_NAME] => INGRID MORA
						[FEC_START] => 2013-06-17
						[LINK_MESSAGE] => Hola Amor
					)
			
			*/
			if($contactRequests)
			{
				$accept = $bd->getSingleMessage($_REQUEST["lang"],'accept');
				$discard = $bd->getSingleMessage($_REQUEST["lang"],'discard');
				
				$smarty = new json_Smarty();
				$smarty->assign("cantidad", count($contactRequests) );
				$smarty->assign("tittle", $bd->getSingleMessage( $form["lang"],"new_requests" ) );
				$smarty->assign("solicitudes",$contactRequests);
				$smarty->assign("optionAccept",$accept);
				$smarty->assign("optionDiscard",$discard);
				$boxes = $smarty->fetch("requestsBox.tpl.html");
				
				//$boxes = utf8_encode($boxes);
				//print($boxes);die();
				$response->setFunctionExc("setObjectAsANewSon");
				
				$response->setResponse( 
										array(
												array("divMsgBoxes",$boxes,"divMainRequestsBox")
											 )
										);
			}
			else
			{
				trigger_error("no_pend_request",E_USER_NOTICE);
			}

			return $response;
		}
	}
?>
