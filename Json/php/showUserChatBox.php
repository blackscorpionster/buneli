<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			//Build the user's HTML response
			$messages = $form["unreadMessages"];//$_SESSION["unreadMessages"][$form["txtUserBoxCod"]];
			//print_r($messages);die("To show");
			$smarty = new json_Smarty();
			//$smarty->assign("messages",$messages[$form["txtUserBoxCod"]]["messages"]);
			$smarty->assign("messages",$messages);
			//$smarty->assign("codUser",$form["txtUserBoxCod"]);
			//$smarty->assign("nombUsuario",$form["txtUserBoxName"]);
			//$smarty->assign("nombUsuarioCompleto",$form["txtUserBoxFullName"]);
			
			//$boxes = $smarty->fetch("singleBox.tpl.html");
			$boxes = $smarty->fetch("unreadBoxes.tpl.html");
			//$boxes = utf8_encode($boxes);
			//print($boxes);die(" <<< ");
			
			$response->setFunctionExc("JsonSingleContacBox");
			
			$response->setResponse( 
									array(	
											$form["txtUserBoxCod"],
											array(
													array("divMsgBoxes",$boxes,"divMainChatBox_user".$form["txtUserBoxCod"])
												 )
										)
									);
					
			return $response;
		}
	}
?>
