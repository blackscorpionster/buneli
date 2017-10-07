<?php
	//define('__ROOT__', dirname(dirname(__FILE__))); 
	//include_once(__ROOT__."/admin/json_Smarty.php");
	include_once("../../buneli/php/admin/AjaxResponse.inc.php");
	include_once("admin/json_Smarty.php");
	//
	require_once('../../buneli/libs/adodb5/adodb.inc.php');  // Libreria de abstraccion de la base de datos
	require_once("admin/json_bdd_acces.php");

	/////////////////Always use this to get the tittle of the option ////////////////
	$bd = new bdd_access("_SEGURO");
	
	$nameText = $bd->getSingleMessage($_REQUEST["lang"],'user_fname');
	$fnameText = $bd->getSingleMessage($_REQUEST["lang"],'user_lname');
	$countryText = $bd->getSingleMessage($_REQUEST["lang"],'country');
	
	
	
	
	
	
	
	//die("FIRST>>>".$tittle);
	/////////////////////////////////////////////////////////////////////////////////
	
	$smarty = new json_Smarty();

	$smarty->assign("buttonText",$buttonText);
	$smarty->assign("userText",$userText);
	$smarty->assign("passText",$passText);
	$smarty->assign("newuser",$newuser);
	
	$html = $smarty->fetch("login.tpl.html");
	//$html = utf8_encode($html);

	$response = new AjaxResponse();
	$response->setFunctionExc("setCenterInnerHTML");

	$response->setResponse(array
							(
								array(
										"divMainWorkMarea","divLogin"
									),
								array(
										array("divMainWorkMarea",$html),
										array("divAccountInfo",""),
										array("divMenuOptions",""),
										array("divMessagesContainer",""),
										//Here goes the title,
										array("divTextTitle",$tittle)
									)
							)
						   );

	print(json_encode($response));
?>
