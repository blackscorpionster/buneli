<?php
require_once("buneli_connect.php");
class buneli_bdd_access extends buneli_connect
{
	function __construct($definitionName,$appl=null)
	{
		$def = $this->getBdDefinition($definitionName);
		$this->hostDb = $def[0];
		$this->usuAutocom = $def[1];
		$this->passAutocom = $def[2];
		$this->bddAutocom = $def[3];
		$this->dbm = $def[4];
		$this->app = $appl;
	}
	function getAppMessages($lan)
	{
		$plsql = "";
		$this->build_sql("FN_APP_MESSAGES","'{$this->app}','{$lan}'",$plsql);
		//print(">>>>>>>>>>|".$plsql);die("|>>>>>");
		$data = $this->mdr_function($plsql);
		return $data;
	}
}
?>