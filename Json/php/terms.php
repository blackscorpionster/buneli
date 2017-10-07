<?php
	if(!$_REQUEST["lang"])
		die("Access denied!!");
	else
	{
		//print_r($_REQUEST);die();
		//die("ACAAAA");
		header("Cache-Control: max-age=2592000");
		//define('__ROOT__', dirname(dirname(__FILE__))); 
		//include_once(__ROOT__."/admin/json_Smarty.php");
		include_once("../../buneli/php/admin/AjaxResponse.inc.php");
		include_once("admin/json_Smarty.php");
		//
		require_once('../../buneli/libs/adodb5/adodb.inc.php');  // Libreria de abstraccion de la base de datos
		require_once("admin/json_bdd_acces.php");

		/////////////////Always use this to get the tittle of the option ////////////////
		$lang = $_REQUEST["lang"];
		$bd = new bdd_access("_SEGURO");
		
		$tittle = $bd->getSingleMessage($_REQUEST["lang"],'terms');
		
		//die("FIRST>>>".$tittle);
		/////////////////////////////////////////////////////////////////////////////////
		
		//die("ACAA>>>>"."about_{$lang}.tpl.html");
		
		$smarty = new json_Smarty();

		$smarty->assign("tittle", $tittle);
		$html = $smarty->fetch("terms_{$lang}.tpl.html");
		//$html = utf8_encode($html);

		$response = new AjaxResponse();
		$response->setFunctionExc("drawImportantInfo");

		$response->setResponse(	array
									(
										array(
												array("divMainWorkMarea",$html,"divTermsKellkCenter")
											)
									)
							   );


		print(utf8_encode(json_encode($response)));
	}
?>
