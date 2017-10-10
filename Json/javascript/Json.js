// JavaScript Document
function validateLogin(formLogin)
{
	//if( validateEmail(document.getElementById("txtLogin").value) )
	//{
		BUNELI.url = "../php/Json.php";
		BUNELI.action = 1;
		BUNELI.reqForm = formLogin;
		BUNELI.postBackAction();
	//}
}

function restoreSession(response)
{
	BUNELI.url = "../php/Json.php";
	BUNELI.action = 1;
	BUNELI.postBackAction();
}

function validateNewUserInfo(formLogin)
{
	//if( validateEmail(document.getElementById("txtLogin").value) )
	//{
		BUNELI.url = "../php/Json.php";
		BUNELI.action = 19;
		BUNELI.reqForm = formLogin;
		BUNELI.postBackAction();
	//}
}

function resetUserPassword(formLogin)
{
	if( validateEmail(document.getElementById("txtLogin").value) )
	{
		BUNELI.url = "../php/Json.php";
		BUNELI.action = 20;
		BUNELI.reqForm = formLogin;
		BUNELI.postBackAction();
	}
}

function newUserStarts(response)
{

	forma = document.getElementById("frmMainApp");
			//alert("ACAZZZ>>>>>"+response);	
	//adminSuccesAjax(response);
	validateLogin(forma);
}

function displayJsonInterface(response)
{
	var mainArea = new buneli_custom_object(document.getElementById("divMainWorkMarea"));
	mainArea.cust_obj.innerHTML = "";
	var divUserMsgBoxesContainer = mainArea.giveBirth("div",null,"divMsgBoxes");
	var divUserContactsContainer = mainArea.giveBirth("div",null,"divCtsContainer");
	mainArea.carrySon(divUserMsgBoxesContainer);
	mainArea.carrySon(divUserContactsContainer);
	//Defining height and width to boxes and contacts containers
	divUserMsgBoxesContainer.setClass("msjBoxes");
	divUserContactsContainer.setClass("usrContacts");
	//
	divUserMsgBoxesContainer.setWidth(parseInt(mainArea.width)*0.78)
	divUserContactsContainer.setWidth(parseInt(mainArea.width)*0.20)
	//
	divUserMsgBoxesContainer.setMinHeight(parseInt(mainArea.height))
	//divUserContactsContainer.cust_obj.style.height ="100%";//setMinHeight(parseInt(mainArea.height))
	setCenterInnerHTML(response[0]);
	//Load conversations
	BUNELI.action = 8;
	BUNELI.personalCode = response[1];
	BUNELI.postBackAction();
}

function callOption(opt)
{
	BUNELI.action = opt;
	BUNELI.postBackAction();
}

function restartApplication(response)
{
	BUNELI.startApplication();
}

var idProcess = 0;
var countToNext = 0;

function startNewMessagesAscProcess(response)
{
	var chatbox;
	//console.log(response);
	setInnerHTML(response[0]);
	//Goes trhough all opened chat boxes and sets the scroll to the bottom
	if(response[1].length > 0){
		for(i=0;i<response[1].length;i++){
			//console.log(response[1][i]);
			chatbox = document.getElementById(response[1][i]);
			if(chatbox !== undefined){
				chatbox.scrollTop = chatbox.scrollHeight;
			}
		}
	}
	
	startBackProcess();
}

function startBackProcess(){
	//alert("ARRANCA ASINCRONO");
	idProcess = setInterval("JsonSaysPickTextFrom()",5000);
}

function endBackProcess()
{
	if(idProcess>0)
		clearInterval(idProcess);
}

function JsonSaysPickTextFrom()
{
	countToNext++;
	//alert(countToNext);
	if(countToNext==3)
	{
		callOption(16);
		countToNext = 0;
	}
	else
	{
		callOption(9);
	}
}

function manageNewMessages(response)
{
	var usrMessages = null;
	var dateShort = null;
	var dateFull = null;
	var dateMessage = null;
	var usrChatBox = null;
	var mainChatBox = null;
	//Roll over the object and get the main keys that are the usrCodes
	for (codUser in response)
	{
		usrChatBox = null;
		usrMessages = response[codUser]["messages"];
		for(codMessage in usrMessages)
		{
			dateShort = usrMessages[codMessage]["sentDateShort"];
			dateFull = usrMessages[codMessage]["sentDate"];
			dateMessage = usrMessages[codMessage]["message"];
			//
			drawMessageOnMessagesBox(codUser,codMessage,dateMessage,dateShort,dateFull,"#E9FFBF","JsonSaysRecibido");
		}
	}
}

function drawMessageOnMessagesBox(codUser,codMessage,message,dateShort,dateFull,backGr,classC)
{
	//Set the message onto the respective user chatBox, if it doen't exist, put a red
	//indicator next the user name contact row
	var divInterfaz = document.getElementById("textingWith"+codUser);
	try
	{
		//mainChatBox = document.getElementById("divMainChatBox_user"+codUser);
		usrChatBox = new buneli_custom_object(divInterfaz);
		
		//mainChatBox.style.backgroundColor=backGr;
		checkAlertBox("divMainChatBox_user"+codUser,backGr);
		
		//Message
		usrMessageNew = usrChatBox.giveBirth("div",null,codMessage);
		usrMessageNew.setClass(classC);
		console.log(message);
		console.log(htmlEntities(message))
		usrMessageNew.cust_obj.innerHTML = htmlEntities(message);
		
		//Message Date
		usrMessDate = usrMessageNew.giveBirth("div",null,"date"+codMessage);
		usrMessDate.setClass("JsonSaysMessageDate");
		usrMessDate.cust_obj.innerHTML = dateShort;
		usrMessDate.cust_obj.title = dateFull;
		
		usrMessageNew.carrySon(usrMessDate);
		usrChatBox.carrySon(usrMessageNew);
		divInterfaz.scrollTop = divInterfaz.scrollHeight;
	}
	catch(e)
	{
		//The chatbox doesn't exist
		//Set the red mark net the user's name
		usrChatBox = document.getElementById("divContact"+codUser);
		usrChatBox.className = "contactOptionOn";
	}
}

function checkAlertBox(idObj,backGr)
{
	// Modificar el BUNELI y agragarle el parametro de tomar la forma temporal y crear un metodo para agregar los objetos a esta, eliminarlos etc
	mainChatBox = document.getElementById(idObj);
	//mainChatBox.style.backgroundColor="";
	mainChatBox.style.backgroundColor=backGr;
}

function checkReadBox(idObj)
{
	// Modificar el BUNELI y agragarle el parametro de tomar la forma temporal y crear un metodo para agregar los objetos a esta, eliminarlos etc
	mainChatBox = document.getElementById(idObj);
	mainChatBox.style.backgroundColor="";
}

function JsonSaysSendTextTo(idUserTo)
{
	var localDate = new sysdate();
	var messageId = null;
	var divInterfaz = document.getElementById("textingWith"+idUserTo);
	var txtMessageCont = document.getElementById("txtMsjTo"+idUserTo);
	var btTo = document.getElementById("btSendTo"+idUserTo);
	var txtMessage = document.getElementById("txtMsjTo"+idUserTo).value;
	if(txtMessage.replace(/\s/g, '')!="")
	{
		btTo.disabled = true;
		BUNELI.reqForm = BUNELI.auxForm;
		BUNELI.setTempValue("txtMessageTo",idUserTo);
		BUNELI.setTempValue("txtMessageText",txtMessage);
		BUNELI.setTempValue("txtMessageSysdate",localDate.getFullDate());
		messageId = "COM_"+idUserTo+"_"+localDate.getDateCode();
		BUNELI.setTempValue("txtMessageId",messageId );
		callOption(10);
		btTo.disabled = false;
		drawMessageOnMessagesBox(idUserTo,messageId,txtMessage,localDate.getShortDate(),localDate.getFullDate(),"",'JsonSaysEnviado');
		divInterfaz.scrollTop = divInterfaz.scrollHeight;
		document.getElementById("txtMsjTo"+idUserTo).focus();
	}
	txtMessageCont.value = "";
}

function JsonShowContacChatWindow(user,name,fullName)
{
	try
	{
		var windowExists = document.getElementById("txtMsjTo"+user);
		windowExists.focus();
	}
	catch(e)
	{
		//Stops the asinchronous process in order to be able to get the use's particular messages
		endBackProcess();
		BUNELI.reqForm = BUNELI.auxForm;
		BUNELI.setTempValue("txtUserBoxCod",user);
		BUNELI.setTempValue("txtUserBoxName",name);
		BUNELI.setTempValue("txtUserBoxFullName",fullName);
		callOption(11);
	}
}

function JsonSingleContacBox(response)
{
	var contact = document.getElementById("divContact"+response[0]);
	try
	{
		var messagesWindow, windowExists;
		setObjectAsANewSon(response[1])
		contact.className = "contactOption";
		windowExists = document.getElementById("txtMsjTo"+response[0]);
		windowExists.focus()
		//console.log("textingWith"+response[0])
		messagesWindow  = document.getElementById("textingWith"+response[0]);
		if(messagesWindow !== undefined){
			messagesWindow.scrollTop = messagesWindow.scrollHeight;
		}
		startBackProcess();
	}
	catch(e)
	{
		alert("ERROR USER WINDOW");
	}
}

function checkMessageLength(idUser,obj)
{
	var divCaracteres = document.getElementById("divCuentaLetras"+idUser);
	var cantCaracteres = obj.value.length;
	divCaracteres.innerHTML = cantCaracteres;
	if(cantCaracteres >= 100 && cantCaracteres <= 140)
	{
		divCaracteres.style.color="#EB9D39";
	}
	else if(cantCaracteres >= 140)
	{
		divCaracteres.style.color="#FF0000";
	}
	else
	{
		divCaracteres.style.color="#000000";
	}
	///
	if(cantCaracteres = 150)
	{
		obj.value = obj.value.substr(0,149)
	}
}

function askAcceptOrDiscard(state,user)
{
	var accept = document.getElementById("acceptUser"+user);
	var discard = document.getElementById("discardUser"+user);
	if(state=="on")
	{
		try{
			accept.style.display="block";
			discard.style.display="block";
		}catch(e)
		{
			discard.style.display="block";
		}
	}
	else
	{
		try{
			accept.style.display="none";
			discard.style.display="none";
		}catch(e)
		{
			discard.style.display="none";
		}
	}
}

function acceptOrDiscardContact(yesOrnot, user, type, name, famname)
{
	BUNELI.reqForm = BUNELI.auxForm;
	BUNELI.setTempValue("txtAcceptOrDiscard",yesOrnot);
	BUNELI.setTempValue("txtUser",user);
	BUNELI.setTempValue("txtTypeRequest",type);
	BUNELI.setTempValue("txtUserName",name);
	BUNELI.setTempValue("txtUserFamName",famname);
	callOption(12);
}

function drawPendingRequests(opt)
{
	//Gets the requests div
	try
	{
		var div = document.getElementById("divMainRequestsBox");
		div.focus();
		//Call option update requests Box
	}
	catch(e)
	{
		callOption(opt);
	}
}

function drawYourInfo(opt)
{
	//Gets the requests div
	try
	{
		var div = document.getElementById("divYourInfo");
		div.focus();
		//Call option update requests Box
	}
	catch(e)
	{
		callOption(opt);
	}
}

function JsonDrawAnser(response)
{
	//Se como sea, el contacto se debe borrar
	var divContactReq = new buneli_custom_object(document.getElementById( "divRequestUser"+response[0]) );
	var requestBox = new buneli_custom_object( document.getElementById( "divMainRequestsBox" ) );
	//divMainRequestsBox
	if(response[1]==1)
	{
		setObjectAsANewSon(response[2]);
	}

	divContactReq.sayGoodBye();
	
	var requestContainer = document.getElementById("JsonSaysRequestsBox").innerHTML;
	
	//alert(">>>>>"+requestContainer);
	
	//Si el div que contiene las solicitudes de contacto queda vacio, entonces destruirlo
	if(requestContainer.replace(/\s/g, '')=="")
	{
		requestBox.sayGoodBye();
		//Quitar la marca de solicitudes pendientes
		document.getElementById("DivAppPpt7").className = "menuOption";
	}	

	ReloadDirectoryAndRequests(response);
	
	
}

function AlterMessage(response)
{
	document.getElementById(response[0]).className = response[1];
}

function drawDirectory(opt)
{
		//Gets the requests div
	try
	{
		var div = document.getElementById("divMainDirectoryBox");
		document.getElementById("txtFindMe").focus();
		//div.focus();
		//Call option update requests Box
	}
	catch(e)
	{
		callOption(opt);
	}
}

function userDirectory(response)
{
	//null;
	//alert(response);
	setObjectAsANewSon(response);
	document.getElementById("txtFindMe").focus();
}


function deleteContact(user,opt,name)
{
	var objQuest = document.getElementById("JsonSaysConactOPtion");
	var question = BUNELI.getinfo("delete_question");
	var yes = BUNELI.getinfo("yes");
	var no = BUNELI.getinfo("no");
	if(opt == 1 )
	{
		BUNELI.reqForm = BUNELI.auxForm;
		BUNELI.setTempValue("txtUserToDelete",user);
		objQuest.innerHTML = "";
		callOption(13);
	}
	else
	{
		if(opt == 0)
		{
			//alert(">>>>>"+question);
			objQuest.innerHTML = '<div> '+
										'<div style="margin-bottom:5px;font-weight:bold;">'+question+'</div>'+
										'('+name+')'+
										'<div style="cursor:pointer;position:relative;left:20px;margin-bottom:5px;margin-top:5px;" onclick="deleteContact('+user+','+'1'+')">'+yes+'</div>'+
										'<div style="cursor:pointer;position:relative;left:40px;" onclick="deleteContact('+user+','+'2'+')">'+no+'</div>'+
								"</div>";
		}
		else
		{
			objQuest.innerHTML = "";
		}
	}
}

function JsonFindUser()
{
	document.getElementById("JsonSaysConactOPtion").innerHTML = "";
	var valor = document.getElementById("txtFindMe");
	//if(validateEmail(valor.value))
	//{
		BUNELI.reqForm = BUNELI.auxForm;
		BUNELI.setTempValue("txtUserToFind",valor.value);
		callOption(14);
	//}
}

function sendContactRequest(codUser)
{
	var txtMessage = document.getElementById("txtContactMessage");
	if(txtMessage.value.length > 50)
		txtMessage.value = txtMessage.value.substring(1, 50);
	//alert(txtMessage.value.length);
	BUNELI.reqForm = BUNELI.auxForm;
	BUNELI.setTempValue("txtContactMessage",txtMessage.value);
	BUNELI.setTempValue("txtContactUser",codUser);
	callOption(15);
}

function ReloadDirectoryAndRequests(response)
{
	try{
		var div = document.getElementById("divMainRequestsBox");
		callOption(18);
	}catch (error)
	{
		null;
	}
	try{
		var div = document.getElementById("divMainDirectoryBox");
		document.getElementById("JsonSaysConactOPtion").innerHTML = "";
		document.getElementById("txtFindMe").value = "";
		callOption(17);
	}catch (error)
	{
		null;
	}
}

function udpateList(response)
{
	try
	{
		setInnerHTML(response);
	}
	catch(error)
	{
		null;
	}
}


function updateContactsAndRequests(response)
{
	var currentContact, contacClass, currentContactsNumber;
	//console.log("Send simply the array with the contacts and if exists, do not replace it just in case the user has sent a message")
	if(response[0]>0)
	{
		document.getElementById("DivAppPpt7").className = "menuOptionOn";
	}
	else
	{
		document.getElementById("DivAppPpt7").className = "menuOption";
	}
	
	//Gets the current class for each contact existing in the response[2]
	//console.log(response[2]);
	contacClass = {};
	currentContactsNumber = 0;
	if(response[2].length > 0){
		for(i=0;i<response[2].length;i++){
			try{
				currentContact = document.getElementById("divContact"+response[2][i])
				if(currentContact !== undefined && currentContact != null){
					currentContactsNumber++;
					contacClass["divContact"+response[2][i]] = currentContact.className;
				}
			} catch(e){
				console.log("Contact not found on the original list")
				null;//This will probably happen when the user has just been accepted as a contact
			}
		}
	}
	//console.log(currentContactsNumber);
	setInnerHTML(response[1]);
	
	//Set the class back to the contact
	if(currentContactsNumber > 0){
		for (var key in contacClass) {
			//console.log("Setting class >> "+contacClass[key]+" >> for "+key)
			currentContact = document.getElementById(key);
			if(currentContact !== undefined){
				currentContact.className = contacClass[key];
			}
		}
	}
	
	try{
		var buscando = document.getElementById("txtFindMe").value;
	}
	catch(error)
	{
		buscando = "";
	}
	
	
	if(buscando == "")
		ReloadDirectoryAndRequests(response);
}

function deleteUserAcount(email,opt)
{
	var objQuest = document.getElementById("divDeleteQuestion");
	var question = BUNELI.getinfo("delete_accnt");
	var yes = BUNELI.getinfo("yes");
	var no = BUNELI.getinfo("no");
	if(opt == 1 )
	{
		BUNELI.reqForm = BUNELI.auxForm;
		BUNELI.setTempValue("txtEmailDelete",email);
		objQuest.innerHTML = "";
		objQuest.style.display="none";
		callOption(22);
	}
	else
	{
		if(opt == 0)
		{
			objQuest.innerHTML = '<div> '+
										'<div style="margin-bottom:5px;font-weight:bold;">'+question+'</div>'+
										'<div style="cursor:pointer;position:relative;left:20px;margin-bottom:5px;margin-top:5px;" onclick="deleteUserAcount('+"'"+email+"'"+','+'1'+')">'+yes+'</div>'+
										'<div style="cursor:pointer;position:relative;left:40px;" onclick="deleteUserAcount('+"'"+email+"'"+','+'2'+')">'+no+'</div>'+
								"</div>";
			objQuest.style.display="block";
		}
		else
		{
			objQuest.innerHTML = "";
			objQuest.style.display="none";
		}
	}
}

function fn_showImportantInfo(id, url)
{
	if(!document.getElementById(id))
	{
		BUNELI.url=url;
		BUNELI.postBackAction();
	}
}

function fn_displayHelp(id)
{
	var divHelp = document.getElementById(id);
	if(divHelp.style.display=="none")
	{
		divHelp.style.display="block";
	}
	else
	{
		divHelp.style.display="none";
	}
}

function drawImportantInfo(response)
{
	var divBoxes = document.getElementById("divMsgBoxes");
	if(divBoxes)
	{
		response[0][0][0] = "divMsgBoxes";
		setObjectAsANewSon(response[0]);
	}
	else
	{
		setInnerHTML(response[0]);
	}
	BUNELI.url = "../php/Json.php";
}
