<?php
	/*
	-- 	Documentation ON LINE
	-- 	07/2013
	-- 	Guillermo Hernandez
	-- 	First version:
		-- This option allows the application to load all those unread messages stored on the database
		-- while the user was offline, this option displays a chatbox for every user that
		-- sent a message to the user, as this is the first time the user in on line, the application
		-- doesn't ask the user if this wants or not to read the unread messages. The user is free to close every chat window
		-- if its not intereted in getting messages automatically.
	*/
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
			
			//print_r($unreadMessages);
			//die(">>>".$OptTittle);
			$messagesFound = array();
			//Create an array that contains the id's of the chat boxes's text containers so the scroll ca easilly be placed at the end
			foreach($unreadMessages AS $userId => $messageObj){
				$messagesFound[] = "textingWith".$userId;
			}
			//print_r($messagesFound);
			//die(">>>".$OptTittle);
			//textingWith2
			//textingWith4
			//User Account
			$smarty->assign("messages",$unreadMessages);
			$boxes = $smarty->fetch("unreadBoxes.tpl.html");
			//$boxes = utf8_encode($boxes);

			$response->setFunctionExc("startNewMessagesAscProcess");
			
			/////////////////Always use this to get the tittle of the option ////////////////
			$tittle = $bd->getSingleMessage($_REQUEST["lang"],'unread_messages');
			/////////////////////////////////////////////////////////////////////////////////
			
			$response->setResponse( array(
										array(
											array("divMsgBoxes",$boxes),
											array("divTextTitle",$tittle)
										),
										$messagesFound
										)
									);
			
			// 
			
			return $response;
		}
	}
?>
