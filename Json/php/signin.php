<?php
	//
	//define('__ROOT__', dirname(dirname(__FILE__))); 
	//include_once(__ROOT__."/admin/json_Smarty.php");
	include_once("../../buneli/php/admin/AjaxResponse.inc.php");
	include_once("admin/json_Smarty.php");
	//
	require_once('../../buneli/libs/adodb5/adodb.inc.php');  // Libreria de abstraccion de la base de datos
	require_once("admin/json_bdd_acces.php");

	/////////////////Always use this to get the tittle of the option ////////////////
	$bd = new bdd_access("_SEGURO");
	$tittleMain = $bd->getSingleMessage($_REQUEST["lang"],'tittle_signin');
	$comboCountry = $bd->getComboCountries();
	
	//print_r($comboCountry);die();
	

	
	$buttonText = $bd->getSingleMessage($_REQUEST["lang"],'sign_in');
	$userText = $bd->getSingleMessage($_REQUEST["lang"],'user_text');
	$passText = $bd->getSingleMessage($_REQUEST["lang"],'pass_txt');
	$newuser = $bd->getSingleMessage($_REQUEST["lang"],'newuser_txt');
	
	$nameText = $bd->getSingleMessage($_REQUEST["lang"],'user_fname');
	$fnameText = $bd->getSingleMessage($_REQUEST["lang"],'user_lname');
	$countryText = $bd->getSingleMessage($_REQUEST["lang"],'country');
	
	$oldUsers = $bd->getSingleMessage($_REQUEST["lang"],'registered_user');
	$newUsers = $bd->getSingleMessage($_REQUEST["lang"],'new_users');
	$newPass = $bd->getSingleMessage($_REQUEST["lang"],'new_pass');
	
	//die("FIRST>>>".$newuser.' > '.$nameText.' > '.$fnameText.' > '.$countryText.' > '.$oldUsers.' > '.$newUsers);
	/////////////////////////////////////////////////////////////////////////////////
	
	$smarty = new json_Smarty();

	$contriesCombo = $smarty->combo($comboCountry,"cmbCountries","COD_COUNTRY","TXT_COUNTRY");
	
	//die(">>>>>".$contriesCombo);

	$smarty->assign("buttonText",$buttonText);
	$smarty->assign("userText",$userText);
	$smarty->assign("passText",$passText);
	
	$smarty->assign("newuser",$newuser);
	$smarty->assign("nameText",$nameText);
	$smarty->assign("lastNameText",$fnameText);
	$smarty->assign("country",$countryText);
	
	$smarty->assign("oldUsers",$oldUsers);
	$smarty->assign("newUsers",$newUsers);
	$smarty->assign("countriesCombo",$contriesCombo);
	
	//die(">>>"."terms_".$_REQUEST["lang"].".tpl.html");
	$tittle = $bd->getSingleMessage($_REQUEST["lang"],'terms');
	$closeX = $bd->getSingleMessage($_REQUEST["lang"],'close_click');

	$smarty->assign("close", $closeX);
	$smarty->assign("tittle", $tittle);
	$smarty->assign("fileTerms", "terms_".$_REQUEST["lang"].".tpl.html");
	$html = $smarty->fetch("signin.tpl.html");
	$html = utf8_encode($html);

	$response = new AjaxResponse();
	$response->setFunctionExc("setCenterInnerHTML");

	$signIn = '<div id="DivAppPptShowLogIn" class="menuOptionOn" onclick="restartApplication()">'.$oldUsers.'</div>';
	$signIn .= '<div id="DivAppPptShowSingIn" class="menuOptionOn" onclick="BUNELI.newUser()">'.$newUsers.'</div>';
	$signIn .= '<div id="DivAppPptShowSingIn" class="menuOptionOn" onclick="BUNELI.newPassWord()">'.$newPass.'</div>';

	$response->setResponse(array
							(
								array(
										"divMainWorkMarea","divSignin"
									),
								array(
										array("divMainWorkMarea",$html),
										array("divAccountInfo",""),
										array("divMenuOptions",$signIn),
										array("divMessagesContainer",""),
										//Here goes the title,
										array("divTextTitle",utf8_encode($tittleMain))
									)
							)
						   );

	print(utf8_encode(json_encode($response)));
?>