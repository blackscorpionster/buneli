<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			//Build the user's HTML response
			$bd = new bdd_access("_SEGURO");
			
			$gotEmail = $bd->getSingleMessage($_REQUEST["lang"],'got_pass_email');
			$about = $bd->getSingleMessage($_REQUEST["lang"],'about');
		
			//die(">>>>>".$gotEmail);
		
			$smarty = new json_Smarty();
			
			$smarty->assign("about",$about);
			$smarty->assign("message",$gotEmail);
			$html = $smarty->fetch("passOptions.tpl.html");
			
			//$html = utf8_encode($html);
			//print($html);die();
			$response->setFunctionExc("setCenterInnerHTML");
			
			$response->setResponse( array(
											array(
														"divMainWorkMarea","divPassOptions"
													),
											array(
													array("divMainWorkMarea",$html),
												 )
										)
									);
			
			return $response;
		}
	}
?>
