<?php
	class buneli_show
	{
		function show_response(&$form)
		{
			$response = new AjaxResponse();
			
			//Build the user's HTML response
			
			$userData = $_SESSION["buneli_user_data"];
			
			$userOptions = $_SESSION["buneli_user_options"];
			
			$appOptions = $_SESSION["buneli_app_options"];

			$userRequest = $form["contactRequests"];
			
			$bd = new bdd_access("_SEGURO");
			
			$ConTittle = $bd->getSingleMessage($_REQUEST["lang"],'tittle_contacts');
			$OptTittle = $bd->getSingleMessage($_REQUEST["lang"],'tittle_options');
			//die(">>>>".$ConTittle.">>>".$OptTittle.">>>".$_REQUEST["lang"]);
			$smarty = new json_Smarty();
			
			$lbAbout = $bd->getSingleMessage($_REQUEST["lang"],'about');
			$lbTerms = $bd->getSingleMessage($_REQUEST["lang"],'terms');
			$lbHelp = $bd->getSingleMessage($_REQUEST["lang"],'help');
						
			//User Account
			//die("USER>>>".$userData["TXT_NAME"]);
			$smarty->assign("accountName",$userData["TXT_NAME"]);
			$email = $smarty->fetch("userAccount.tpl.html");
			//die(">>>".$email);
			//$email = utf8_encode($email);
			
			// Menu
			$smarty->assign("requests",count($userRequest));
			$smarty->assign("menu",$appOptions);
			$smarty->assign("optTittle",$OptTittle);
			$html = $smarty->fetch("JsonAppMenu.tpl.html");
			//$html = utf8_encode($html);
			
			//Contacts
			$smarty->assign("contacts",$_SESSION["buneli_user_contacts"]);
			$smarty->assign("conTittle",$ConTittle);
			$contacts = $smarty->fetch("contacts.tpl.html");
			//$contacts = utf8_encode($contacts);
			
			/*$arrLowerCase = "";
			$arringUpperCase = "";*/
			fn_calculateStrings($form["code"]);
									
			$response->setFunctionExc("displayJsonInterface");
			
			/////////////////Always use this to get the tittle of the option ////////////////
			$tittle = $bd->getSingleMessage($_REQUEST["lang"],'tittle_welcome');
			/////////////////////////////////////////////////////////////////////////////////
			//die(">>>>>CODE>A>>".$form["code"]);
			$response->setResponse( array(
											array(
													array("divAccountInfo","sessionInfo"),
													array(
															array("divAccountInfo",$email),
															array("divMenuOptions",$html),
															array("divCtsContainer",$contacts),
															array("divTextTitle",$tittle),
															//Conditions
															array("divAbout",$lbAbout),
															array("divConditions",$lbTerms),
															array("divHelp",$lbHelp),
														 )
												),
												$form["code"]
										)
									);
			
			// 
			
			return $response;
		}
	}
	function fn_calculateStrings($code)
	{
		$arrLo = array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
        $arrUp = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
        $inicia = substr($code,0,1) + substr($code,-1);
        
		$partFinal= array_slice($arrLo,0,$inicia);
        $partInicial= array_slice($arrLo,$inicia);
		$arrLo = array_merge($partInicial,$partFinal);

		$partFinal= array_slice($arrLo,0,$inicia);
        $partInicial= array_slice($arrLo,$inicia);
		$arrLoCr = array_merge($partInicial,$partFinal);

		$_SESSION["LowerCaseString"] = $arrLo;
		$_SESSION["LowerCaseCryptoString"] = $arrLoCr;
		
        $partFinal= array_slice($arrUp,0,$inicia);
        $partInicial= array_slice($arrUp,$inicia);
        $arrUp = array_merge($partInicial,$partFinal);

		$partFinal= array_slice($arrUp,0,$inicia);
        $partInicial= array_slice($arrUp,$inicia);
		$arrUpCr = array_merge($partInicial,$partFinal);

		$_SESSION["UpperCaseString"] = $arrUp;
		$_SESSION["UpperCaseCrypyoString"] = $arrUpCr;
		
		/*print_r($arrLo);
		print_r($arrLoCr);
		print_r($arrUp);
		print_r($arrUpCr);
		die(">>>>>>>>>>".$inicia);
		*/
	}
	
?>
