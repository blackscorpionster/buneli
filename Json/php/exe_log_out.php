<?php
	/***************************************************************************************************************
	 * 14/06/2012.
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
			session_start();
			session_unset();
			session_destroy() or die("Error");
			if(isset($_COOKIE[session_name()]))
			{
				setcookie(session_name(), '', time()-3600, '/');
			}
			return $ret;
		}
	}
?>