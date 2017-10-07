function buneli(lang, app, w, h, m)
{
	this.language = lang;
	this.application = app;
	this.menuPosition = m;
	this.width = w;
	this.height = h;
	this.master = null;
	this.mainForm = null;
	this.auxForm = null;
	this.reqForm = null;
	this.menu = null;
	this.workArea = null;
	this.action = null;
	this.url = null;
	this.msg = null;
	this.personalCode = null;
	this.tmpFormContainer = null;
	this.showinfo = function(indMsg)
	{
		var usrMsg = null;
		try
		{
			usrMsg = eval("this.msg."+indMsg);
		}
		catch(e)
		{
			usrMsg = "Error: Message "+indMsg+" NOT FOUND";
		}
		alert(usrMsg);
	}
	this.getinfo = function(indMsg)
	{
		var usrMsg = null;
		try
		{
			usrMsg = eval("this.msg."+indMsg);
		}
		catch(e)
		{
			usrMsg = null;
		}
		return usrMsg;
	}
	this.buildApplication = function()
	{
		//if(this.menuPosition=='L')//||this.menuPosition=='T')
		//{
			this.buildMenu();
			this.buildWorkArea();
		//}
		/*else
		{
			this.buildWorkArea();
			this.buildMenu();
		}*/
		this.startApplication();
	}
	this.buildMenu = function()
	{
		var divMenu = this.master.giveBirth("div",null,"divMainMenu");
		this.menu = divMenu;
		this.menu.setClass("menu");
		this.master.carrySon(divMenu);
		
		//Height and Width depend on the position given by the menuPosistion Parameter
		this.menu.setMinHeight(parseInt(this.master.height));
		this.menu.setWidth(parseInt(this.master.width)*0.14);
		
		//Divisiones para las opciones visibles del menu
		var divEmail = this.menu.giveBirth("div",null,"divAccountInfo");
		var divOptions = this.menu.giveBirth("div",null,"divMenuOptions");
		var divMsg = this.menu.giveBirth("div",null,"divMessagesContainer");
		
		divEmail.setClass("accountInfo");divOptions.setClass("menuOptions");divMsg.setClass("messageBox");
		
		//Crear Divisiones Utiles al menu vertical
		divEmail.setHeight(parseInt(this.menu.height)*0.05);
		divOptions.setMinHeight(parseInt(this.menu.height)*0.60);
		divMsg.setMinHeight(parseInt(this.menu.height)*0.351);
		//Orden de las divisiones
		this.menu.carrySon(divEmail);this.menu.carrySon(divOptions);this.menu.carrySon(divMsg);
		
	}
	this.buildWorkArea = function()
	{
		var mainContainer = this.master.giveBirth("div",null,"divMainContainer");
		this.master.carrySon(mainContainer);
		this.workArea = mainContainer;
		this.workArea.setClass('main_container');
		
		//Height and Width depend on the position given by the menuPosistion Parameter
		this.workArea.setMinHeight(parseInt(this.master.height));
		this.workArea.setWidth(parseInt(this.master.width)*0.858);
		
		// Las divisiones del area principal de trabajo//The title of the curren menu
		var divArea = this.workArea.giveBirth("div",null,"divMainWorkMarea");
		var divTitle = this.workArea.giveBirth("div",null,"divOptionInfo");
		
		divArea.setClass("workArea");divTitle.setClass("optionTitle");
		//
		this.workArea.carrySon(divTitle);
		this.workArea.carrySon(divArea);

		divTitle.setHeight(parseInt(this.workArea.height)*0.05);
		//divTitle.setWidth(parseInt(this.master.width)*0.853);
		divArea.setMinHeight(parseInt(this.workArea.height)*0.95);
		//divArea.setWidth(parseInt(this.workArea.width));

		//Extra div in order to keep the text tittle centered
		var divTextTitle = this.menu.giveBirth("div",null,"divTextTitle");
		divTextTitle.setWidth(divTitle.width);
		divTextTitle.setHeight(20);
		divTextTitle.setClass("textTittle");
		divTitle.carrySon(divTextTitle);
		divTextTitle.inMiddleOf(divTitle);
		//Another div to contain
	}
	this.loadMessages = function()
	{
		this.url = "../../buneli/php/admin/buneli_load_messages.php";//?app="+this.application+"&lan="+this.language;
		this.postBackAction();
	}
	this.startApplication = function()
	{
		endBackProcess();
		this.url = "login.php";
		this.postBackAction();
	}
	this.newUser = function()
	{
		this.url = "signin.php";
		this.postBackAction();
	}
	this.newPassWord = function()
	{
		this.url = "newPass.php";
		this.postBackAction();
	}
	this.newUserForm = function()
	{
		this.url = "newUserForm.php";
		this.postBackAction();
	}
	this.postBackAction = function()
	{
		//this.url = this.url+"?lang="+this.language+"&app="+this.application;
		var urlAction = this.url+"?lang="+this.language+"&app="+this.application;
		if(this.action)
			urlAction = urlAction+"&action="+this.action;
		if(!this.reqForm)
			this.reqForm = this.mainForm;
		callAjaxApp(this.reqForm,this.action,urlAction);
		this.action = null;
		this.reqForm = this.mainForm;
		//Clean the tmp div
		if(this.tmpFormContainer)
			this.tmpFormContainer.cust_obj.innerHTML = "";
	}
	this.start = function()
	{
		var divMaster = document.getElementById("div_master");
		var divTmp = document.getElementById("div_main_form");
		if(!divMaster||!divTmp)
		{
			this.showinfo("div_master_ad");
		}
		else
		{
			divMaster = new buneli_custom_object(divMaster);
			divTmpForm = new buneli_custom_object(divTmp);
			var mainFormDoc = document.forms[0];
			var auxFormDoc = document.forms[1];
			if(auxFormDoc&&mainFormDoc)
			{
				this.auxForm = auxFormDoc;
				this.mainForm = mainFormDoc;
				this.tmpFormContainer = divTmpForm;
				divMaster.setWidth(this.width);
				divMaster.setMinHeight(this.height);
				this.master = divMaster;
				this.buildApplication();
			}
			else
			{
				this.showinfo("frm_error");
			}
		}
	}
	this.setTempValue = function(name,txtvalue)
	{
		var tmpValue = this.tmpFormContainer.giveBirth("input","text",name);
		this.tmpFormContainer.carrySon(tmpValue);
		tmpValue.cust_obj.value = txtvalue;
	}
}

//Global object manager.
var BUNELI = null;

function buneli_build(app,lang,width,height,mpos)
{
	//General Settings
	BUNELI = new buneli(lang,app,width,height,mpos);
	BUNELI.loadMessages();
}
//------------------------------------------//
//Esta clase se encarga de obtener o
//establecer una propiedad dada a un objeto 
//en la pantalla
//------------------------------------------//
function buneli_custom_object(obj)
{
	//Properties
	this.cust_obj 	= obj;
	this.id 		= this.cust_obj.id;
	this.width		= (parseInt(this.cust_obj.style.width)>0) ? this.cust_obj.style.width : this.cust_obj.offsetWidth;
	this.height		= (parseInt(this.cust_obj.style.height)>0) ? this.cust_obj.style.height : this.cust_obj.offsetHeight;
	this.top		= (parseInt(this.cust_obj.style.top)>0) ? this.cust_obj.style.top : this.cust_obj.offsetTop;
	this.left		= (parseInt(this.cust_obj.style.left)>0) ? this.cust_obj.style.left : this.cust_obj.offsetLeft;
	//Methods
	this.setId = function(value)
	{
		this.cust_obj.id = value;this.id = value;
	}
	this.setWidth = function(value)
	{
		value = parseInt(value);
		this.cust_obj.style.width = value+"px";this.width = value+"px";
	}
	this.setHeight = function(value)
	{
		value = parseInt(value);
		this.cust_obj.style.height = value+"px";this.height = value+"px";
	}
	this.setMinHeight = function(value)
	{
		value = parseInt(value);
		this.cust_obj.style.minHeight = value+"px";this.height = value+"px";
	}
	this.setClass = function(value)
	{
		this.cust_obj.className = value;
	}
	this.inMiddleOf = function(parentObj)
	{	// Si hay problemas, revisar el ancho y alto del hijo
		var xMax=browser_size(1);
		var yMax=browser_size(0);
		if(parentObj != "")
		{
			var xMax=parseInt(parentObj.width);
			var yMax=parseInt(parentObj.height);
		}
		nTop = ((yMax-parseInt(this.height))/2)+'px';
		nLeft = ((xMax-parseInt(this.width))/2)+'px';
		this.cust_obj.style.left = nLeft;this.left = nLeft;
		this.cust_obj.style.top = nTop;this.top = nTop;
		}
	this.carrySon = function(sonObj)
	{
		this.cust_obj.appendChild(sonObj.cust_obj);
	}
	this.giveBirth = function(type,subType,id)
	{
		var def_object = null;
		if(!id || !type)
		{
			alert("Type and id are required to create a new son object.");
		}
		else
		{
			def_object = document.createElement(type);
			def_object.setAttribute("id",id);
			def_object.setAttribute("name",id);
			if(subType)
			{
				try{
					def_object.setAttribute("type",subType);
				}
				catch(e){
					alert("The defined SubType "+subType+" is incorrect Howerver, The son object will be created, please check the definition.");
				}
			}
			var ret_obj = new buneli_custom_object(def_object);
		}
		return ret_obj;
	}
	this.sayGoodBye = function()
	{
		father = this.cust_obj.parentNode;
		father.removeChild(this.cust_obj);
	}
}

function browser_size(a){var b;var c;if(typeof window.innerWidth=="number"){b=window.innerWidth;c=window.innerHeight}else if(document.documentElement&&(document.documentElement.clientWidth||document.documentElement.clientHeight)){b=document.documentElement.clientWidth;c=document.documentElement.clientHeight}else if(document.body&&(document.body.clientWidth||document.body.clientHeight)){b=document.body.clientWidth;c=document.body.clientHeight}if(a==1){return b}else{return c}}

function set_app_messages(response)
{
	BUNELI.msg = response;
	BUNELI.start();
}

function sysdate(format)
{
	var localDate = new Date();
	this.day = localDate.getDate()+"";
	this.month = ((localDate.getMonth())+1)+"";
	this.year = localDate.getFullYear();
	this.hours = localDate.getHours()+"";
	this.minutes = localDate.getMinutes()+"";
	this.seconds = localDate.getSeconds()+"";
	this.getFullDate = function()
	{
		if(this.day.length==1)
			this.day = "0"+this.day+'';
		//
		if(this.month.length==1)
			this.month = "0"+this.month+'';
		//
		if(this.hours.length==1)
			this.hours = "0"+this.hours+'';
		//
		if(this.minutes.length==1)
			this.minutes = "0"+this.minutes+'';
		//
		if(this.seconds.length==1)
			this.seconds = "0"+this.seconds+'';
		//
		return this.day+"/"+this.month+"/"+this.year+" "+this.hours+":"+this.minutes+":"+this.seconds;
	}
	this.getShortDate = function()
	{
		if(this.hours.length==1)
			this.hours = "0"+this.hours+'';
		//
		if(this.minutes.length==1)
			this.minutes = "0"+this.minutes+'';
		//
		return this.hours+":"+this.minutes;
	}
	this.getDateCode = function()
	{
		if(this.day.length==1)
			this.day = "0"+this.day+'';
		//
		if(this.month.length==1)
			this.month = "0"+this.month+'';
		//
		if(this.hours.length==1)
			this.hours = "0"+this.hours+'';
		//
		if(this.minutes.length==1)
			this.minutes = "0"+this.minutes+'';
		//
		if(this.seconds.length==1)
			this.seconds = "0"+this.seconds+'';
		//
		return this.day+this.month+this.year+this.hours+this.minutes+this.seconds;
	}
}

function byebye(idToDissapear)
{
	var objToDis = document.getElementById(idToDissapear);
	var obj = new buneli_custom_object(objToDis);
	obj.sayGoodBye();
}

//https://css-tricks.com/snippets/javascript/htmlentities-for-javascript/
function htmlEntities(str) {
	return String(str).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g,'&apos;');
}