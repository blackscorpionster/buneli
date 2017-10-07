<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
					
			//User Account
									
			$response->setFunctionExc("newUserStarts");
			
			//print_r($_SESSION);
			//print_r($response);die();
			return $response;
		}
	}
?>