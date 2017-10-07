<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			//print_r($form);die("<<<<<<<<<<<<<<VISTA>>>>>>>>>>>vxc>>");
			
			$response = new AjaxResponse();
			
			if( $form["message_not_sent"] )
			{
				// $form["txtMessageId"];
				
				$response->setFunctionExc("AlterMessage");
				
				//Hacer funcion de javascript para eliminar estos id de la pantalla de forma masiva
				$response->setResponse( 
										array(	
												$form["txtMessageId"],"messageNotSent"
											)
										);
										
				//print_r($response);die();
			}
			return $response;
		}
	}
?>