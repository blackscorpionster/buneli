<?php
	require_once("../../buneli/php/admin/buneli_connect.php");
	class bdd_access extends buneli_connect
	{	
		function __construct($definitionName)
		{
			$def = $this->getBdDefinition($definitionName);
			$this->hostDb = $def[0];
			$this->usuAutocom = $def[1];
			$this->passAutocom = $def[2];
			$this->bddAutocom = $def[3];
			$this->dbm = $def[4];
			$this->app = _JSON;
		}

		function getUserMessages($touser, $action, $fromuser)
		{
			$plsql = "";
			if($action == 8 || $action == 11){
				$this->build_sql("FN_USERMESSAGES","{$touser},".($fromuser?$fromuser:"null"),$plsql);
			} else {
				$this->build_sql("FN_UNREADUSERMESSAGES","{$touser}",$plsql);
			}
			
			//die($plsql);
			
			$data = $this->mdr_function($plsql);
			return $data;
		}

		function setMessageRead($codMessage)
		{
			$plsql = "";
			$messagePK = explode('_',$codMessage);
			//print($codMessage);
			//print_r($messagePK);die();
			$this->build_sql_pr("PR_SETMESSAGEREAD","{$messagePK[0]},{$messagePK[1]},'{$messagePK[2]}'",$plsql);
			//die(">>>>".$plsql);
			$data = $this->transaction($plsql);
			return $data;
		}

		function sendMessage($from,$to,$message,$lang)
		{
			//$plsql = "";
			//die(">>>>".$plsql."::::".$message);
			//$this->build_sql_pr("PR_SENDMESSAGE","{$from},{$to},'{$message}','{$lang}'",$plsql);
			$data = $this->transaction_param("SELECT PR_SENDMESSAGE(?::integer,?::integer,?::character varying ,?::character varying)",array($from,$to,$message,$lang));
			
			//die(">>>>".$plsql);
			
			//$data = $this->transaction($plsql);
			return $data;
		}

		function getPendingRequests($usr)
		{
			$plsql = "";
			$this->build_sql("FN_USERREQUESTS","{$usr}",$plsql);
			$data = $this->mdr_function($plsql);
			return $data;
		}

		function setContactAnswer($usr,$answer,$me,$type)
		{
			$plsql = "";
			$this->build_sql_pr("PR_CONTACTANSWER","{$usr},{$answer},{$me},{$type}",$plsql);
			
			//die(">>>>".$plsql);
			
			$data = $this->transaction($plsql);
			return $data;
		}
		
		function getAllContacts($usr)
		{
			$plsql = "";
			$this->build_sql("FN_USERMESSAGES","{$user}",$plsql);
			$data = $this->mdr_function($plsql);
			return $data;
		}
		
		function deleteContactInformation($userDelete, $me)
		{
			$plsql = "";
			$this->build_sql_pr("PR_DELETECONTACTINFORMATION","{$userDelete},{$me}",$plsql);
			//die(">>>>>".$plsql);
			$data = $this->transaction($plsql);
			return $data;
		}
		
		function findUser($userEmail)
		{
			$plsql = "";
			$this->build_sql("FN_FINDUSER","'{$userEmail}'",$plsql);
			//die(">>>>>".$plsql);
			$data = $this->mdr_function($plsql);
			//die("RETORNO>>>".$data);
			return $data;
		}
		
		function saveContactRequest($user, $message, $me, $lang)
		{
			$plsql = "";
			$this->build_sql_pr("PR_SAVECONTACTREQUEST","{$me},{$user},'{$message}','{$lang}'",$plsql);
			//die(">>>>>".$plsql);
			$data = $this->transaction($plsql);
			return $data;
		}
		
		function getComboCountries()
		{
			$plsql = "";
			$this->build_sql("FN_COMBOCOUNTRIES","",$plsql);
			//die(">>>>>".$plsql);
			$data = $this->mdr_function($plsql);
			return $data;
		}

		function saveNewUser($form)
		{
			$plsql = "";
			$txtLogin = $form["txtLogin"]; 
		    $txtPass = $form["txtPassCoded"];
		    $txtUserName = $form["txtUserName"]; 
		    $txtFamName = $form["txtFamName"]; 
		    $cmbCountries = $form["cmbCountries"];
			$this->build_sql_pr("PR_SAVENEWUSER","'{$txtLogin}','{$txtPass}','{$txtUserName}','{$txtFamName}','{$cmbCountries}'",$plsql);
			//die(">>>>>".$plsql);
			$data = $this->transaction($plsql);
			return $data;
		}
		
		function updateUserPass($login, $pass)
		{
			//die(">>>>>>>".$login.' '.$pass);
			$this->build_sql_pr("PR_CHANGEPASSWORD","'{$login}','{$pass}'",$plsql);
			//die(">>>>>".$plsql);
			$data = $this->transaction($plsql);
			return $data;
		}
		
		function deleteUserAccount($codUser,$email,$emailConf)
		{
			//die("BORRANDO>>>>".$codUser." -- ".$email." -- ".$emailConf);
			$plsql = "";
			$this->build_sql_pr("PR_DELETEACCOUNT","{$codUser},'{$email}','{$emailConf}'",$plsql);
			//die(">>>>>".$plsql);
			$data = $this->transaction($plsql);
			return $data;
		}

	}
?>
