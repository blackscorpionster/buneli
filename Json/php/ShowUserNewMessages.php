<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			$unreadMessages = $form["unreadMessages"];
			
			//Build the user's HTML response
			//print_r($_SESSION);die();
			$bd = new bdd_access("_SEGURO");
			
			$smarty = new json_Smarty();
			
			//print_r($_SESSION["readMessages"]);
			$newMessages = $form["unreadMessages"];
			//print_r($newMessages);
			//die(">>>");
			
			//User Account
			//$smarty->assign("messages",$unreadMessages);
			//$boxes = $smarty->fetch("unreadBoxes.tpl.html");
			//$boxes = utf8_encode($boxes);
			
			//print($boxes);die(">>>>>>>>>");

			$response->setFunctionExc("manageNewMessages");
			
			/////////////////Always use this to get the tittle of the option ////////////////
			$tittle = $bd->getSingleMessage($_REQUEST["lang"],'unread_messages');
			/////////////////////////////////////////////////////////////////////////////////
			
			$response->setResponse( $newMessages );
			
			// 
			
			return $response;
		}
	}
?>