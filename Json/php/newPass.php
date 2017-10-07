<?php
	//
	//die("ACAAAAA");
	//define('__ROOT__', dirname(dirname(__FILE__))); 
	//include_once(__ROOT__."/admin/json_Smarty.php");
	include_once("../../buneli/php/admin/AjaxResponse.inc.php");
	include_once("admin/json_Smarty.php");
	//
	require_once('../../buneli/libs/adodb5/adodb.inc.php');  // Libreria de abstraccion de la base de datos
	require_once("admin/json_bdd_acces.php");

	/////////////////Always use this to get the tittle of the option ////////////////
	$bd = new bdd_access("_SEGURO");
	$tittle = $bd->getSingleMessage($_REQUEST["lang"],'tittle_pass');
	
	$buttonText = $bd->getSingleMessage($_REQUEST["lang"],'accept');
	$userText = $bd->getSingleMessage($_REQUEST["lang"],'user_text');
	$friendText = $bd->getSingleMessage($_REQUEST["lang"],'friend_text');
	
	
	//die("FIRST>>>".' > '.$userText.' > '.$buttonText.' > '.$tittle);
	/////////////////////////////////////////////////////////////////////////////////
	
	$smarty = new json_Smarty();
	
	//die(">>>>>".$contriesCombo);

	$smarty->assign("buttonText",$buttonText);
	$smarty->assign("userText",$userText);
	$smarty->assign("friendText",$friendText);
	
	
	$html = $smarty->fetch("newPass.tpl.html");
	//$html = utf8_encode($html);

	$response = new AjaxResponse();
	$response->setFunctionExc("setCenterInnerHTML");

	$response->setResponse(array
							(
								array(
										"divMainWorkMarea","divNewPass"
									),
								array(
										array("divMainWorkMarea",$html),
										array("divMessagesContainer",""),
										//Here goes the title,
										array("divTextTitle",$tittle)
									)
							)
						   );

	print(utf8_encode(json_encode($response)));
?>
