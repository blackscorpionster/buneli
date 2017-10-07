<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			//print_r($form);die("VISTA>>>>>");
		
			$response->setFunctionExc("ReloadDirectoryAndRequests");
			/*
			$response->setResponse( 
									array(
											array("divContactsFindingResults")
										 )
									);*/
		

			return $response;
		}
	}
?>