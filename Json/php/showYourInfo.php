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
		
			$tittle = $bd->getSingleMessage( $form["lang"],"your_account" );

			$smarty = new json_Smarty();
			
			// Obtiene las etiquetas para la informacion
			$emailLbl = $bd->getSingleMessage( $form["lang"],"user_text" );
			$nameLbl =$bd->getSingleMessage( $form["lang"],"user_fname" );
			$surnameLbl =$bd->getSingleMessage( $form["lang"],"user_lname" );
			$mobNumberLbl =$bd->getSingleMessage( $form["lang"],"mobile_number" );
			$countryLbl =$bd->getSingleMessage( $form["lang"],"country" );
			$dropLbl =$bd->getSingleMessage( $form["lang"],"drop_account" );

			//Titulo
			$smarty->assign("tittle", $tittle);
			//Etiquetas
			$smarty->assign("emailLbl", $emailLbl);
			$smarty->assign("nameLbl", $nameLbl);
			$smarty->assign("surnameLbl", $surnameLbl);
			$smarty->assign("mobNumberLbl", $mobNumberLbl);
			$smarty->assign("countryLbl", $countryLbl);
			$smarty->assign("dropLbl", $dropLbl);
			
			//Datos
			$smarty->assign("userData", $userData);
			$boxes = $smarty->fetch("yourInformation.tpl.html");
			
			//$boxes = utf8_encode($boxes);
			//print($boxes);die();
			$response->setFunctionExc("setObjectAsANewSon");
			
			$response->setResponse( 
									array(
											array("divMsgBoxes",$boxes,"divYourInfo")
										 )
									);
			
			return $response;
		}
	}
?>
