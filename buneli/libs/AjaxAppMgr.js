// JavaScript Document
function callAjaxApp(forma, accion, urlDestino)
{
	/*if(accion)
		forma.action.value = accion;
	*/
	//Instanciamos la forma en el XHTMLHTTPREQUEST para enviarla al php
	if(forma)
		YAHOO.util.Connect.setForm(forma);
	
	//Defiminos el objeto callback que manejara la respuesta del servidor
	var callback = 	{ 
					  success: adminSuccesAjax,
					  failure: adminFailureAjax
					};
					
	//Hacemos un llamado asincronico al servidor con el mentodo POST
	var request = YAHOO.util.Connect.asyncRequest('POST', urlDestino, callback);
	
	// Activamos el indicador de procesando
	procesando(1);
}

//Esta funcion activa o desactiva el gif de procesando en la pantalla, si es 1 = activar, si no desactivar
function procesando(ind)
{
	//Verificamos que la imagen haya sido creada en la pantalla
	try
	{
		var imgProcesando = document.getElementById('div_loading');
		var imgLogo  = document.getElementById('div_Logo');
	}
	catch(error)
	{
		//Creamos el div llamando la imagen y dejando activa, despues que la imagen sea creada, se controla desde el try
		alert('The "Loading..." div object is missing');
	}

	//Si la imagen ya fue pintada en la pantalla
	if(imgProcesando)
	{
		if(ind == 1)
		{
			imgProcesando.style.display = 'block';
			imgLogo.style.display = 'none';
		}
		else
		{
			//Ocultamos el gif de procesando de la pantalla
			imgProcesando.style.display = 'none';
			imgLogo.style.display = 'block';
		}
	}
}

function adminSuccesAjax(response)
{
	try//se evalua si va por Ajax
	{
		var resultado = YAHOO.lang.JSON.parse(response.responseText);
	}
	catch(error)
	{
		try
		{	//se evalua si va por iframe
			var resultado = YAHOO.lang.JSON.parse(response);
			//var resultado = eval("(" + response + ")");
		}
		catch(error)
	    {
			procesando(0);
			alert('Error en la respuesta del servidor, informacion no reconocida por JS '+"\n"+error+"\n"+response.responseText);
		}
	}
	//
	procesando(0);

	var errores = resultado.errors;
	var mensajes = resultado.messages;
	var respuesta = resultado.response;
	var funcion = resultado.functionExc;

	YUIResponseManagger(funcion,respuesta);
	
	YUIErrorManagger(mensajes,errores);
}

function adminFailureAjax(response)
{
	alert('El servidor respondio con un error '+"\n"+response.responseText);
	procesando(0);
}

function YUIResponseManagger(funcion,respuesta)
{
	if (funcion != null)
	{
		YUIExecuteFuncion(funcion,respuesta);
	}
}

function YUIExecuteFuncion(funcion,respuesta)
{
	if(funcion != null)
	{
		var ejecuta = eval(funcion);
		eval(ejecuta(respuesta));
	}
}

/* Manejador de mensajes de error y alertas generaos en la ejecucion de la aplicacion.
   Guillermo hernandez
   11-10-2008
*/
function YUIErrorManagger(mensajes, errores)
{
	procesando(0);

	var msg = '';
	var appMsg = "";
	var cantMsgs = 0;
	
	var notes = BUNELI.getinfo("notes");
	var problems = BUNELI.getinfo("problems");
	
	if(mensajes != null)
	{
		msg = notes+': '+"\n"+"\n";

		cantMsgs = mensajes.length;

		for(i=0; i<cantMsgs; i++)
		{
			appMsg = BUNELI.getinfo(mensajes[i]);
			if(!appMsg)
			{
				appMsg = mensajes[i];
			}
			msg = msg+'- '+appMsg+"\n";
		}
		msg = msg+"\n"+"\n";
	}
	
	cantMsgs = 0;
	msgCod = null;

	if(errores != null)
	{
		cantMsgs = errores.length;

		msg = msg+problems+': '+"\n"+"\n";

		for(i=0; i<cantMsgs; i++)
		{
			appMsg = BUNELI.getinfo(errores[i]);
			if(!appMsg)
			{
				appMsg = errores[i];
			}
			msg = msg+'- '+appMsg+"\n";
		}
	}
	
	if(msg != "")
		alert(msg);
	
}

function setInnerHTML(datos)
{
	var cantDatos = datos.length;
	for(i=0;i<cantDatos;i++)
	{
		arrDatos = datos[i];
		//Elemento donde vamos a pintar la respuesta del servidor
		contenido = document.getElementById(arrDatos[0]);
		contenido.innerHTML = arrDatos[1];
	}
}


function setCenterInnerHTML(datos)
{
	/*
		Para que funcione correctamente, el objeto a centrar (Hijo), debe ser definido
		pon posicion relative, para que se ubico respecto de su padre y no de la pantalla,
		adicionalmente, el objeto debe tener un ancho y alto inicial
	*/
	var cantDatos = datos[1].length;
	for(i=0;i<cantDatos;i++)
	{
		arrDatos = datos[1][i];
		//Elemento donde vamos a pintar la respuesta del servidor
		contenido = document.getElementById(arrDatos[0]);
		contenido.innerHTML = arrDatos[1];
	}
	//alert(datos[0]+' '+datos[0].length);
	var divPapaCentrar = datos[0][0];
	var divHijoCentrar = datos[0][1];
	papa = document.getElementById(divPapaCentrar);
	hijo = document.getElementById(divHijoCentrar);
	//alert(papa);
	papa = new buneli_custom_object(papa);
	hijo = new buneli_custom_object(hijo);
	hijo.inMiddleOf(papa);
}

function setObjectAsANewSon(datos)
{
	//alert(datos);
	var divTmp = BUNELI.tmpFormContainer.cust_obj;//document.getElementById("div_main_form");
	var cantDatos = datos.length;
	for(i=0;i<cantDatos;i++)
	{
		arrDatos = datos[i];
		// Se coloca el objeto en el tmp, para luego tomarlo como un objeto y ubicarlo en el destino final
		divTmp.innerHTML = arrDatos[1];
		//
		//Elemento donde vamos a pintar la respuesta del servidor
		contenido = document.getElementById(arrDatos[0]);
		papa = new buneli_custom_object(contenido);
		resultado = document.getElementById(arrDatos[2]);
		hijo = new buneli_custom_object(resultado);
		papa.carrySon(hijo);
	}
}

function AppDeleteSons(datos)
{
	var cantDatos = datos.length;
	for(i=0;i<cantDatos;i++)
	{
		//Elemento donde vamos a pintar la respuesta del servidor
		try
		{
			objBorrar = document.getElementById(datos[i]);
			objBorrar = new buneli_custom_object(objBorrar);
			objBorrar.sayGoodBye();
		}
		catch(error)
		{
			null;
		}
	}
}

function cargarArchivo(forma)
{
	switch (opcion){
	        case 'Archivo':
				formaoriginal = forma;	
				tipoArchivo = document.getElementById('cmbTipoMovimento').value;
				if (tipoArchivo != '') {
					var target_tem = forma.target;
					var accion_tem = forma.action.value;
					forma.target = "iframeUpload";
					forma.action.value="cargarMovilidadRevalidaciones";
					forma.submit();
					forma.target=target_tem;
					forma.action.value=accion_tem;	
					recargar(formaoriginal);	
					}else{alert('Debe Seleccionar un Tipo de Movimiento');
					}
				break;
			case 'Buscar':
				urlDestino = "../../../afiliacion.php";
				block = 0;
	    		callAjaxApp(forma, "buscaMovilidadRevalidaciones", urlDestino, block);
				break;
			default : alert("hola");
	}
}

function validateEmail(txtEmail)
{
	var posArroba = 0 ;
	var ret = true;
	if(txtEmail=="")
	{
		BUNELI.showinfo("type_correct_em");
		ret = false;
	}
	else
	{
		posArroba = txtEmail.indexOf("@");
		if( txtEmail.indexOf("@",1) < 0 )
		{
			BUNELI.showinfo("type_correct_em");
			ret = false;
		}	
		else
		{
			//alert("POSSS>>>"+posArroba);
			if( txtEmail.lastIndexOf(".") < (posArroba+2) )
			{
				BUNELI.showinfo("type_correct_em");
				ret = false;
			}
		}
	}
	return ret;
}

function editInfo(type,value,id)
{
	null;
}
