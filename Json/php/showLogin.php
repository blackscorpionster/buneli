<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
									
			$response->setFunctionExc("restartApplication");
						
			return $response;
		}
	}
?>