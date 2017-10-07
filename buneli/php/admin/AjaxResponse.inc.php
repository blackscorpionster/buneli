<?php
/**
 * Esta clase se utiliza para generar la repuesta a una peticion por Ajax
 * La clase se compone de 3 atributos estandar para manejar la respuesta
 * Los Errores que generen el la ejecucion del programa decidiran si la respuesta Response
 * va nula o con la estructura deseada, los Mensajes y Errores no son excluyentes.
 *
 * @author Guillermo Hernandez Diaz <guillermoa_hernandez@coomeva.com.co>
 *
 * @date 10 de Octubre del 2008
 * @version 
 */
class AjaxResponse
{
	/**
	 * Errores Genrado al momento de la ejecucion del programa
	 *
	 * @var array
	 * @access private
	 */
	var $errors;
	
	/**
	 * Errores Genrado al momento de la ejecucion del programa
	 *
	 * @var array
	 * @access private
	 */
	var $messages;

	/**
	 * Errores Genrado al momento de la ejecucion del programa
	 *
	 * @var array
	 * @access private
	 */
	var $response;
	
	/**
	 * Errores Genrado al momento de la ejecucion del programa
	 *
	 * @var array
	 * @access private
	 */
	var $functionExc;
	
	
	/**
	 * Constructor
	 */
	function __construct() {
		$this->errors = null;
		$this->messages = null;
		$this->response = null;
		$this->functionExc = null;
	}
	
	/**
	 * Asigna el arreglo con los mensajes de error almacenados en la session
	 *
	 * @param array Arreglo con los mensajes de error
	 * @return void
	 * @access public
	 */
	 function setErrors($msgsErrors)
	 {
	 	$this->errors = $msgsErrors;
	 }
	 
	/**
	 * Asigna el arreglo con los mensajes de error almacenados en la session
	 *
	 * @param array Arreglo con los mensajes de error
	 * @return void
	 * @access public
	 */
	 function getErrors()
	 {
	 	return $this->errors;
	 }
	 
	/**
	 * Asigna el arreglo con los mensajes almacenados en la session
	 *
	 * @param array Arreglo con los mensajes generados en la ejecucion del programa
	 * @return void
	 * @access public
	 */
	 function setMessages($appMessages)
	 {
	 	$this->messages = $appMessages;
	 }
	 
	/**
	 * Asigna el arreglo con los mensajes de error almacenados en la session
	 *
	 * @param array Arreglo con los mensajes de error
	 * @return void
	 * @access public
	 */
	 function getMessages()
	 {
	 	return $this->messages;
	 }
	 
	/**
	 * Asigna el arreglo con la respuesta para el Ajax, esta respuesta debe ser en formato JavasCript - Html - Texto Plano
	 *
	 * @param array Arreglo con las estructuras de datos para el javascript
	 * @return void
	 * @access public
	 */
	 function setResponse($appResponse)
	 {
	 	$this->response = $appResponse;
	 }
	 
	/**
	 * Asigna el arreglo con los mensajes de error almacenados en la session
	 *
	 * @param array Arreglo con los mensajes de error
	 * @return void
	 * @access public
	 */
	 function getResponse()
	 {
	 	return $this->response;
	 }
	 
	/**
	 * Asigna la funcion de Javascript que debe ejcutar despues de hacer el response
	 *
	 * @param string nombre de la funcion
	 * @return void
	 * @access public
	 */
	 function setFunctionExc($funcion)
	 {
	 	$this->functionExc = $funcion;
	 }
	 
	/**
	 * Asigna el arreglo con los mensajes de error almacenados en la session
	 *
	 * @param array Arreglo con los mensajes de error
	 * @return void
	 * @access public
	 */
	 function getFunctionExc()
	 {
	 	return $this->functionExc;
	 }
}
?>