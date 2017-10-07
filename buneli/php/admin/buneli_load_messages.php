<?php
	define('ADODB_ASSOC_CASE', 1);// 1 UpperCase, 0 LowerCase, 2 As written on the SQL sentence
	require_once('../../libs/adodb5/adodb.inc.php');  // Libreria de abstraccion de la base de datos
	require_once("AjaxResponse.inc.php");
	require_once("buneli_bdd_acces.php");
	
	//restartSystem();
	//print_r($_SESSION);
	//die("NO SESION");
	//
	$apps = array(
			"_JSON"=>1
			);
	//
	$app = $_REQUEST["app"];
    $lan = $_REQUEST["lang"];
    $app = $apps[$app];
	//print_r($_REQUEST);die("<<<>>>".$app.' >>> '.$lan);
	$bdObj = new buneli_bdd_access("_SEGURO",$app);
	//print_r($bdObj);die("<<<>>>".$app.' >>> '.$lan);
	$msgs = $bdObj->getAppMessages($lan);
	//print_r($msgs);die("<<<");
	//$obj = new stdClass();
	$obj = array();
	if($msgs)
	{
		foreach($msgs as $pos => $arrMsg)
		{
			//die("HERE>>"+$pos);
			//print_r($arrMsg);
			//die(">>>>>".$arrMsg["TXT_MESSAGE"]." >> ".$arrMsg["COD_MESSAGE"]);
			//try{
				$obj[$arrMsg["COD_MESSAGE"]] = utf8_encode($arrMsg["TXT_MESSAGE"]);
			//}catch(Exception $e)
			//{
			//	die("Error decodificando los mensajes! \n"+$e->getMessage());
			//}
		}
	}
	else
	{
		die("Los mensaje no pudieron ser cargados!");
	}
	//print_r($obj);die("<<<");
	$response = new AjaxResponse();
	$response->setResponse($obj);
	$response->setFunctionExc("set_app_messages");
	//print_r($response);die();
	//die(">>".json_encode($response));
	/*
	 *             [div_master_ad] => El div div_master es requerido
            [frm_error] => Ambas Formas, main y aux, deben ser declaradas
	 * */
	print(utf8_encode(json_encode($response)));
	
	function restartSystem()
	{
		session_start();
		session_unset();
		session_destroy() or die("Error");
		if(isset($_COOKIE[session_name()]))
		{
			setcookie(session_name(), '', time()-3600, '/');
		}
	}
?>