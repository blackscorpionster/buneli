<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			
			$userData = $_SESSION["buneli_user_data"];
			
			//print_r($userData);die();
			
			$response = new AjaxResponse();
			
			
			//print_r($userContacts);die();
			$bd = new bdd_access("_SEGURO");
		
			$tittle = $bd->getSingleMessage( $form["lang"],"updateinfo_titl" );

			$smarty = new json_Smarty();
			
			// Obtiene las etiquetas para la informacion
			//$emailLbl = $bd->getSingleMessage( $form["lang"],"user_text" );
			$nameLbl =$bd->getSingleMessage( $form["lang"],"user_fname" );
			$surnameLbl =$bd->getSingleMessage( $form["lang"],"user_lname" );
			//$mobNumberLbl =$bd->getSingleMessage( $form["lang"],"mobile_number" );
			$email_label =$bd->getSingleMessage( $form["lang"],"email_label" );
			$saveLbl =$bd->getSingleMessage( $form["lang"],"accept" );
			

			//Titulo
			$smarty->assign("tittle", $tittle);
			//Etiquetas
			//$smarty->assign("emailLbl", $emailLbl);
			$smarty->assign("nameLbl", $nameLbl);
			$smarty->assign("surnameLbl", $surnameLbl);
			//$smarty->assign("mobNumberLbl", $mobNumberLbl);
			//$smarty->assign("countryLbl", $countryLbl);
			$smarty->assign("saveLbl", $saveLbl);
			$smarty->assign("email_label", $email_label);
			
			
			//Datos
			$smarty->assign("userData", $userData);
			$boxes = $smarty->fetch("updateYourInformation.tpl.html");
			
			//$boxes = utf8_encode($boxes);
			//print($boxes);die();
			$response->setFunctionExc("setObjectAsANewSon");
			
			$response->setResponse( 
									array(
											array("divMsgBoxes",$boxes,"divUpdateYourInfo")
										 )
									);
			
			return $response;
		}
	}
?>
