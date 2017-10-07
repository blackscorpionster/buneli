<?php
	/***************************************************************************************************************
	 * 15/06/2012.
	* Guillermo Hernandez.
	* This object contains the rules to be exeuted, this is the core of the action itself.
	* All rights reserved.
	* buneli.com, buneli, JSON SAYS are trademarks, patent under revision.
	*************************************************************************************************************** */
	class buneli_execution
	{
		function buneli_execute(&$form)
		{
			$ret = true;
			//print_r($form);die();
			
			//[txtUserToFind] => h.aia@a.
			
			$bd = new bdd_access("_SEGURO");
			$ret = $bd->findUser($form["txtUserToFind"]);
			
			//print_r($ret);die();
			
			$form["contactInformation"] = $ret;
			
			if($ret)
				$ret = true;
			
			return $ret;
		}
	}
?>