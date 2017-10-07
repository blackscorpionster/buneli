<?php
// error handler function
function JsonErrorHandler($errno, $errstr, $errfile, $errline)
{
	if(!array_key_exists('_ERRORES',$_SESSION))
	{
		$_SESSION['_ERRORES'] = array();
	}
	
	if(!array_key_exists('_MENSAJES',$_SESSION))
	{
		$_SESSION['_MENSAJES'] = array();
	}

    switch ($errno) 
	{
		case E_USER_ERROR:
			array_push($_SESSION['_ERRORES'],utf8_encode($errstr));
			break;
	
		case E_USER_WARNING:
			array_push($_SESSION['_MENSAJES'],utf8_encode($errstr));
			break;
	
		case E_USER_NOTICE:
			array_push($_SESSION['_MENSAJES'],utf8_encode($errstr));
			break;
	
		default:
			null;//array_push($_SESSION['_ERRORES'],'Unknown error: '.utf8_encode($errstr));
			break;
    }

    /* Don't execute PHP internal error handler */
    return true;
}
?>