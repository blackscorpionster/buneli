<?php
	/*
		NOTA: Si se quiere independizar la aplicacion, simplemente hay que traer al proyecto los scripts que estan en buneli/
		y pegarlos en la ruta admin y actualizar las rutas de estos mismos, por eso todos los include, se dejan
		en este solo archivo manejador
	*/
	define('ADODB_ASSOC_CASE', 1); //It is defined that every record retreived from the database will be identified in UPPER CASE,
									//This is because, oci8 driver, doesn't support the ADODB_ASSOC_CASE sentence
									//But the rest of databases does, so UPPER CASE is general in this project
	require_once('../../buneli/libs/adodb5/adodb.inc.php');  // Libreria de abstraccion de la base de datos
	require_once("../../buneli/php/admin/AjaxResponse.inc.php");
	require_once("../../buneli/php/admin/buneli_app_obj.php");
    require_once("admin/json_Smarty.php");
	require_once("admin/error_handler.php");
	require_once("admin/json_bdd_acces.php");
	
	session_start();
	set_error_handler("JsonErrorHandler");

	/*
	///Accion por defecto al f5
	if($action == 1 and count($_SESSION["buneli_user_data"]) > 0)
	{
		$action = ACCION_DEFAULT;
	}
	//
	// Si la session ya se cerro se invoca la accion de cerrar session y la accion es diferente de validar login
	//
	if(!$_SESSION and $action != ACCION_DEFAULT)
	{
		$action = ACCION_VER_LOGIN;
	}*/

	//print_r($_SESSION);
	//die();
	
	$buneli_action=$_REQUEST["action"];
	$buneli_curr_action = array();
	
	//The first time the user is logged in into the system, all the user opction are recorded onto the curren session to keep then
	//in memory allowing a faster access.
	if(!$_SESSION)
	{
		$bd = new bdd_access("_SEGURO");
		$userData = $bd->getAppOptions($_REQUEST["lang"]);
		//print_r($userData);
		//die("ACA");
		$_SESSION["buneli_json_options"] = $userData;
	}

	$buneli_curr_action = obtainCurrentAction($buneli_action);
	//print_r($buneli_curr_action);die(">>>>".$buneli_action);
	$buneli_obj = new buneli_app_obj($buneli_curr_action,$_REQUEST);
	
	$response = null;

	//               BEGIN             ///
	
	//Main Framework Function
	if($buneli_obj->flg_action)
    {
        $buneli_obj->validate_form();

        $buneli_obj->execute_action();

        $response = $buneli_obj->show_response();
    }
    else
    {
    	$response = new AjaxResponse();
        trigger_error("opt_not_found",E_USER_ERROR);
    }

    //User Messages and Error are verified and moved into the response
    manageMessages($response);
    
    restore_error_handler();
    
	//print(json_encode($response));die(">>>>");
	
    //Send the user's response
    print(/*utf8_encode(*/json_encode($response));//);

    //            END             //

	//Check whether menssages or errores exist or not in the session
	function manageMessages(&$response)
	{
		if(array_key_exists("_ERRORES",$_SESSION))
		{
			if (count($_SESSION["_ERRORES"])>0)
			{
				$response->setErrors($_SESSION["_ERRORES"]);
				unset($_SESSION["_ERRORES"]);
			}
		}

		if(array_key_exists("_MENSAJES",$_SESSION))
		{
			if (count($_SESSION["_MENSAJES"])>0)
			{
				$response->setMessages($_SESSION["_MENSAJES"]);
				unset($_SESSION["_MENSAJES"]);
			}
		}
	}

	//Get the option information
	function obtainCurrentAction($opt)
	{
		$arrReturn = array();
		$options = $_SESSION["buneli_json_options"];
		foreach($options as $key => $arrOpt)
		{
			if($arrOpt["COD_OPTION"]==$opt)
			{
				$arrReturn = $arrOpt;
			}
		}
		return $arrReturn;
	}
?>
