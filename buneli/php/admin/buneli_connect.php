<?php
//
define("_JSON",1);
if(!defined('ADODB_ASSOC_CASE')){
	define('ADODB_ASSOC_CASE',1); // 1 UpperCase, 0 LowerCase, 2 As written on the SQL sentence
}
//include_once('adodb5/adodb.inc.php');  // Libreria de abstraccion de la base de datos
// Declaramos la funcion de conexion a la base de datos.
class buneli_connect
{
	var $hostDb;
	var $usuAutocom;
	var $passAutocom;
	var $bddAutocom;
	var $app;
	var $dbm;
	function Conectarse($host,$user,$pass,$bdd,$dbm) 
	{
		//$dbconexion = ADONewConnection($dbm);
		//$dbconexion->SetFetchMode(ADODB_FETCH_ASSOC);//Arreglo asociativo
		$dbconexion = ADONewConnection($dbm);
		$dbconexion->setFetchMode(ADODB_FETCH_ASSOC);
		$dbconexion->Connect($host, $user,$pass,$bdd);
		$dbconexion->EXECUTE("set names 'utf8'");
		return $dbconexion;
	}
	///Single data Return
	function sdr_function($statement)
	{
		$info = null;
		$db = $this->Conectarse($this->hostDb, $this->usuAutocom, $this->passAutocom, $this->bddAutocom, $this->dbm);
		if($this->dbm == "oci8" || $this->dbm == "oci8po")
		{
			$stmt = $db->PrepareSP($statement);
			$db->Parameter($stmt, $info, 'info', false);
			$rs = $db->Execute($stmt);
		}
		else
		{
			/*if($this->dbm == "mysql")
			{*/
				$statement = "SELECT ".$statement." as RESPONSE";
				$rs = $db->Execute($statement);
				//print_r($rs);
				//die("OKKK >> ".$statement." >> ".ADODB_ASSOC_CASE);
				$info = $rs->GetRows();
				//print_r($info);
				//die("OKKK >> ".$statement." >> ".ADODB_ASSOC_CASE);
				$info = $info[0]["RESPONSE"];
				
				//die(">>>".$statement."??? RS>>>".$info);
			//}
		}
		if(!$rs)
		{
			trigger_error('Problems trying to execute function :: '.$db->ErrorMsg(),E_USER_WARNING);
			$db->Close();
			return false;
		}
		else
		{
			$db->Close();
			return $info;
		}
	}
	///Multi data Return
	function mdr_function($statement)
	{
		$res = "";
		$db = $this->Conectarse($this->hostDb, $this->usuAutocom, $this->passAutocom, $this->bddAutocom, $this->dbm);
		if($this->dbm == "oci8" || $this->dbm == "oci8po")
		{
			$stmt = $db->PrepareSP($statement);
			$db->Parameter($stmt, $info, 'info', false, -1, OCI_B_CURSOR);
		}
		else
		{
			//die("HERE>>>"."call ".$statement);
			
			if($this->dbm == "mysql")
				$statement = "call ".$statement;
			else
				$statement = "SELECT * FROM ".$statement;
			$stmt = $db->Prepare($statement);
		}
		//print_r($stmt);die();
		$rs = $db->Execute($stmt);
		if(!$rs)
		{
			trigger_error('Problems trying to execute function :: '.$db->ErrorMsg(),E_USER_WARNING);
			$db->Close();
			return false;
		}
		else
		{
			$res = $rs->GetRows();
			$db->Close();
			return $res;
		}
	}
	
	///Transactions executer
	function transaction($statement)
	{
		$info = true;
		$db = $this->Conectarse($this->hostDb, $this->usuAutocom, $this->passAutocom, $this->bddAutocom, $this->dbm);
		if($this->dbm == "oci8" || $this->dbm == "oci8po")
		{
			$stmt = $db->PrepareSP($statement);
		}
		else
		{
			$stmt = $db->Prepare($statement);
		}
		//print_r($stmt);die();
		$rs = $db->Execute($stmt);
		if(!$rs)
		{
			trigger_error('Problems trying to execute procedure :: '.$db->ErrorMsg(),E_USER_WARNING);
			$db->Close();
			return false;
		}
		else
		{
			//die(">>>>OK>>".$info);
			$db->Close();
			return $info;
		}
	}
	
	///Transactions executer
	function transaction_param($statement, $params)
	{
		$info = true;
		$db = $this->Conectarse($this->hostDb, $this->usuAutocom, $this->passAutocom, $this->bddAutocom, $this->dbm);
		if($this->dbm == "oci8" || $this->dbm == "oci8po")
		{
			$stmt = $db->PrepareSP($statement);
		}
		else
		{
			$stmt = $db->Prepare($statement);
		}
		//print_r($stmt);die();
		$rs = $db->Execute($stmt, $params);
		if(!$rs)
		{
			trigger_error('Problems trying to execute procedure :: '.$db->ErrorMsg(),E_USER_WARNING);
			$db->Close();
			return false;
		}
		else
		{
			//die(">>>>OK>>".$info);
			$db->Close();
			return $info;
		}
	}
	
	//This functions builts the SQL sentence, depending on the db driver selected
	function build_sql($f_name,$param,&$sql)
	{
		if($this->dbm == "oci8" || $this->dbm == "oci8po")
			$sql = "BEGIN :info := ".$f_name."(".$param."); END;";
		else
		{
			if($this->dbm == "postgres")
				$sql = "SELECT * FROM ".$f_name."(".$param.")";
			else
				$sql = $f_name."(".$param.")";
		}
	}
	
	//This functions builts the  Procedure SQL sentence, depending on the db driver selected
	function build_sql_pr($f_name,$param,&$sql)
	{
		if($this->dbm == "oci8" || $this->dbm == "oci8po")
		{
			$sql = "BEGIN ".$f_name."(".$param."); END;";
		}
		else
		{
			
			if($this->dbm == "mysql")
				$sql = "call ".$f_name."(".$param.")";
			else
				$sql = "SELECT ".$f_name."(".$param.")";
		}
	}
	function getBdDefinition($defName)
	{
		$buneli_conect_def = array(
				"_SEGURO"=>array(false,"postgres","NewLife2014","SEGURO",'postgres9'),
				//"_SEGURO"=>array(false,"blackscorpion","6s6k6pion","SEGURO",'mysqli'),//This is the last used with mysql
				//"_SEGURO"=>array(false,"seguro","rammstein","seguro",'mysql'),
				"_JSON"=>array(false,"nalgahernandez","compensacion","super"),
				"_ACC"=>array(false,"nalgahernandez","compensacion","super"),
				"_UTIL"=>array(false,"nalgahernandez","compensacion","super")
		);
		return $buneli_conect_def[$defName];
	}
	
	// FUNCIONES DE FUNCIONAMIENTO GENERAL
	function validateUser($u,$p)
	{
		$plsql = "";
		$this->build_sql('FN_VALIDATE_USER',"'{$u}','{$p}'",$plsql);
		$data = $this->mdr_function($plsql);
		return $data;
	}

	function getAppOptions($lang)
	{
		$plsql = "";
		$this->build_sql("FN_APPOPTIONS","'{$this->app}','{$lang}'",$plsql);
		$data = $this->mdr_function($plsql);
		return $data;
	}
	
	function getSingleMessage($lang,$mesCod)
	{
		$plsql = "";
		$this->build_sql("FN_GETMESSAGE","'{$this->app}','{$lang}','{$mesCod}'",$plsql);
		$data = $this->sdr_function($plsql);
		//die("RETORNO>>>".$data." >> ".$plsql);
		return $data;
	}
	
	function getUserContacs($user,$lang)
	{
		$plsql = "";
		$this->build_sql("FN_USERCONTACTS","{$user},'{$lang}'",$plsql);
		$data = $this->mdr_function($plsql);
		return $data;
	}
	
}

/*function Conectarse($user,$pass,$bdd,$dbm)
{
$dbconexion = ADONewConnection('oci8po');
print_r($_SESSION);die("XXXX>>>>>>>".$user.' '.$pass.' '.$bdd.' '.$dbm); ///EL ERROR OCURRE CON LA LIBRERIA DE PHP 4
/*
 * 2.  take the .tgz file and put it in the openchat/include directory
3.  unpack the file with: 
gunzip -c adodb510.tgz | tar -xvf -
mv adodb adodb_old
mv adodb5 adodb

4.  Edit class.Chat.inc
vi class.Chat.inc 
Find:
    //create a database object
    $this->db = &NewADOConnection( DATABASE_DRIVER );

Replace with:

    //create a database object
    $this->db = NewADOConnection( DATABASE_DRIVER );
 * */
/*$dbconexion -> SetFetchMode(ADODB_FETCH_ASSOC);//Arreglo asociativo
$dbconexion->Connect(false, $user,$pass,$bdd);
//$dbconexion->Connect(false, 'epsis', 'epsis', 'desa');
//$dbconexion->Connect(false, 'estadistica', 'esta.3ps09', 'super');
return $dbconexion;
}*/
/*
$buneli_conect_def = array(
	"_SEGURO"=>array(false,"nalgahernandez","compensacion","super",'oci8'),
	//"_SEGURO"=>array(false,"seguro","rammstein","seguro",'mysql'),
	"_JSON"=>array(false,"nalgahernandez","compensacion","super"),
	"_ACC"=>array(false,"nalgahernandez","compensacion","super"),
	"_UTIL"=>array(false,"nalgahernandez","compensacion","super")
);*/
?>
