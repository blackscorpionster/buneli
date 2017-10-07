<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			$response->setFunctionExc("AppDeleteSons");
			
			//Hacer funcion de javascript para eliminar estos id de la pantalla de forma masiva
			$response->setResponse( 
									array(	
											"contactFomDirectory".$form["txtUserToDelete"],///Id Son
											"divContact".$form["txtUserToDelete"],///Id Son
											"divMainChatBox_user".$form["txtUserToDelete"]
										)
									);
									
			//print_r($response);die();
			return $response;
		}
	}
?>