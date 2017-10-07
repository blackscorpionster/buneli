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
			
			$codUser = $form["txtLogin"];
			
			//print("DATOS QUERY>>".$contactToDelete." ".$codUser);die();
			
			$bd = new bdd_access("_SEGURO");
			$userData = $bd->findUser($form["txtLogin"]);
			$friendData =  $bd->findUser($form["txtFriendCheck"]);
			
			//print_r($userData);
			//print_r($friendData);
			//die();
			
			if($userData)
			{
				//die(">>>>>".$userData[0]["COD_USER"]);
				//Check if the user has contatacs
				$userContacts = $bd->getUserContacs($userData[0]["COD_USER"], $form["lang"]);
				
				//print_r($userContacts);die();
				if($userContacts)
				{
					//check if the contact exists on the contacts list or if the field is empty
					if($form["txtFriendCheck"])
					{
						//die("HERER>>>");
						if($friendData)
							$ret = fn_findEmailInContacts($userData[0]["COD_USER"],$friendData[0]["COD_USER"],$userContacts);
						else
						{
							trigger_error("friend_not_exis",E_USER_ERROR);
							$ret = false;
						}
					}
					else
					{
						trigger_error("friend_text",E_USER_ERROR);
						$ret = false;
					}
				}
				if($ret)
				{
					$newPass = getNewPassword();
					//die(">>>>>NEW PASS>>>>".$newPass);
					//$txtFriend = $form["txtFriendCheck"]; 
					$ret = $bd->updateUserPass($form["txtLogin"],md5($newPass));
					if($ret)
					{
						//enviar correo
						//print(">>>>>>NEW PASS:".$newPass);
						//die();
						//null;
						
						$to = $form["txtLogin"];
						   $subject = "litzys says: New Password";
						   $message = $bd->getSingleMessage($_REQUEST["lang"],'new_pass_mail')." ".$newPass;
						   $header = "From:admin@litzys.com \r\n";
						   $retval = mail ($to,$subject,$message,$header);
						   /*if( $retval == true )  
						   {
						      echo "Message sent successfully...";
						   }
						   else
						   {
						      echo "Message could not be sent...";
						   }*/
					}
					else
					{
						trigger_error("pass_no_change",E_USER_ERROR);
						$ret = false;
					}
				}
			}
			else
			{
				trigger_error("user_not_found",E_USER_ERROR);
				$ret = false;
			}

			return $ret;
		}
	}
	
	function getNewPassword()
	{
		$cadena = null;
		for($i=0;$i<11;$i++)
		{
			$cod = mt_rand(50,90);
			$cadena .= chr($cod);
		}
		return $cadena;
	}
	
	function fn_findEmailInContacts($usrCod, $usrFrd, $conts)
	{
		//print_r($conts);die(">>>>>".$usrCod.">>>".$usrFrd);
		 //[COD_USER_HOST] => 1
            //[COD_USER_GUEST] => 3
        $ret = false;
        foreach($conts as $posArr => $usrData)
        {
        	//die(">>>>DATOS>>>>".$usrData["COD_USER_HOST"].">>>>>".$usrData["COD_USER_GUEST"]);
        	if( ($usrData["COD_USER_HOST"]==$usrFrd || $usrData["COD_USER_GUEST"]==$usrFrd) && ($usrData["COD_USER_HOST"]==$usrCod || $usrData["COD_USER_GUEST"]==$usrCod) )
        		$ret = true;
        }

        if(!ret)
        	trigger_error("friend_not_exis",E_USER_ERROR);

        return $ret;
	}
?>