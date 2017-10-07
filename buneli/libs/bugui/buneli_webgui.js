//Object definition
function buneli(lang, app, w, h, m)
{
	this.language = lang;
	this.application = app;
	this.menuPosition = m;
	this.width = w;
	this.height = h;
	this.msg = function(indMsg)
	{
		var eng = {
			"browser_advise":"The browser maximized, will perform the User experience.",
			"mobile_advise":"If you are using a mobile device, please, make sure of use the mobile web version."
		}
		var esp = {
			"browser_advise":"Si maximiza el navegador, podra tener una mejor experiencia de usuario.",
			"mobile_advise":"Si esta utilizando un dispositivo movil, asegurese de usar la version para moviles."
		}
		var user_msg = eval(this.language+"."+indMsg);
		alert(user_msg);
	}
	this.apps = {
		"_JSON":	"../../Json/php/index.php"
	}
	this.url = function()
	{
		return eval("this.apps."+this.application);
	}
	this.load_app = function(form){
		this.width = this.width*0.98;
		this.height = this.height;
		goUrl = this.url();
		/*form.action*/goUrl=goUrl+"?width="+this.width+"&height="+this.height+"&language="+this.language+"&menuPosition="+this.menuPosition;
		//form.submit();
		window.open(goUrl,"_self");
	}
};

/*buneli_start*/
function buneli_start(app,lang,menu)
{
	var defbBuneli = new buneli(lang,app,browser_size(1),browser_size(0),menu);
	//if(user_resolition_advise(defbBuneli))
	//{
		var form = document.getElementById("frmBuneli");
		defbBuneli.load_app(form);
	//}
}
function user_resolition_advise(c){if(c.width<800||c.height<600){c.msg("browser_advise");c.msg("mobile_advise");return false;}else{return true;}}
function browser_size(a){var b;var c;if(typeof window.innerWidth=="number"){b=window.innerWidth;c=window.innerHeight}else if(document.documentElement&&(document.documentElement.clientWidth||document.documentElement.clientHeight)){b=document.documentElement.clientWidth;c=document.documentElement.clientHeight}else if(document.body&&(document.body.clientWidth||document.body.clientHeight)){b=document.body.clientWidth;c=document.body.clientHeight}if(a==1){return b}else{return c}}
function screen_size(pos){if(pos==1){return screen.availWidth;}else{return screen.availHeight;}}

var step=0

var slideimages = new Array() // create new array to preload images
slideimages[0] = new Image() // create new instance of image object
slideimages[0].src = "../image/banner1.PNG"
slideimages[1] = new Image()
slideimages[1].src = "../image/banner2.PNG"
slideimages[2] = new Image()
slideimages[2].src = "../image/banner3.PNG"

function slideit(){
 //if browser does not support the image object, exit.
 if (!document.images)
  return
 document.getElementById('slide').src = slideimages[step].src
 if (step<2)
  step++
 else
  step=0
 //call function "slideit()" every 2.5 seconds
 setTimeout("slideit()",5000)
}

slideit();