<?php
	header("Cache-Control: max-age=2592000");
	//define('__ROOT__', dirname(dirname(__FILE__))); 
	//include_once(__ROOT__."/admin/json_Smarty.php");
	include_once("../../buneli/php/admin/AjaxResponse.inc.php");
	include_once("admin/json_Smarty.php");
	//
	require_once('../../buneli/libs/adodb5/adodb.inc.php');  // Libreria de abstraccion de la base de datos
	require_once("admin/json_bdd_acces.php");
	
	session_start();
	//set_error_handler("JsonErrorHandler");
	$response = new AjaxResponse();
	
	if(!isset($_SESSION["buneli_user_data"]))//;die("<<<<<<<<<<<<<");
	{
		/////////////////Always use this to get the tittle of the option ////////////////
		$bd = new bdd_access("_SEGURO");
		$tittle = $bd->getSingleMessage($_REQUEST["lang"],'tittle_login');
		
		$buttonText = $bd->getSingleMessage($_REQUEST["lang"],'log_in');
		$userText = $bd->getSingleMessage($_REQUEST["lang"],'user_text');
		$passText = $bd->getSingleMessage($_REQUEST["lang"],'pass_txt');
		$newuser = $bd->getSingleMessage($_REQUEST["lang"],'newuser_txt');
		
		$nameText = $bd->getSingleMessage($_REQUEST["lang"],'user_fname');
		$fnameText = $bd->getSingleMessage($_REQUEST["lang"],'user_lname');
		$countryText = $bd->getSingleMessage($_REQUEST["lang"],'country');
		
		$oldUsers = $bd->getSingleMessage($_REQUEST["lang"],'registered_user');
		$newUsers = $bd->getSingleMessage($_REQUEST["lang"],'new_users');
		$newPass = $bd->getSingleMessage($_REQUEST["lang"],'new_pass');
		
		
		$lbAbout = $bd->getSingleMessage($_REQUEST["lang"],'about');
		$lbTerms = $bd->getSingleMessage($_REQUEST["lang"],'terms');
		$lbHelp = $bd->getSingleMessage($_REQUEST["lang"],'help');
		
		//die("FIRST>>>".$newuser.' '.$nameText.' '.$fnameText.' '.$countryText.' '.$oldUsers.' '.$newUsers);
		/////////////////////////////////////////////////////////////////////////////////
		
		$smarty = new json_Smarty();

		$smarty->assign("buttonText",$buttonText);
		$smarty->assign("userText",$userText);
		$smarty->assign("passText",$passText);
		
		$smarty->assign("newuser",$newuser);
		$smarty->assign("nameText",$nameText);
		$smarty->assign("lastNameText",$fnameText);
		$smarty->assign("country",$countryText);
		
		$smarty->assign("oldUsers",$oldUsers);
		$smarty->assign("newUsers",$newUsers);
		//$smarty->assign("changePass",$newPass);
		
		$html = $smarty->fetch("login.tpl.html");
		//$html = utf8_encode($html);
		$response->setFunctionExc("setCenterInnerHTML");

		$signIn = '<div id="DivAppPptShowLogIn" class="menuOptionOn" onclick="restartApplication()">'.$oldUsers.'</div>';
		$signIn .= '<div id="DivAppPptShowSingIn" class="menuOptionOn" onclick="BUNELI.newUser()">'.$newUsers.'</div>';
		$signIn .= '<div id="DivAppPptShowSingIn" class="menuOptionOn" onclick="BUNELI.newPassWord()">'.$newPass.'</div>';

		$response->setResponse(array
								(
									array(
											"divMainWorkMarea","divLogin"
										),
									array(
											array("divMainWorkMarea",$html),
											array("divAccountInfo",""),
											array("divMenuOptions",$signIn),
											array("divMessagesContainer",""),
											//Conditions
											array("divAbout",$lbAbout),
											array("divConditions",$lbTerms),
											array("divHelp",$lbHelp),
											//Here goes the title,
											array("divTextTitle",$tittle)
										)
								)
							   );
		
	}
	else
	{
		$response->setFunctionExc("restoreSession");
	}

	print(json_encode($response));
?>
