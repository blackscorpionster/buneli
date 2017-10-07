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
			$actionMessage = $form["action"];
			$getMessagesFrom = null;
			if(isset($form["txtUserBoxCod"])){
				$getMessagesFrom = $form["txtUserBoxCod"];
			}
			
			// 
			//print_r($form);
			//print_r($_SESSION["readMessages"]);
			//die("MASIVO >> ".$getMessagesFrom);
			$userData = $_SESSION["buneli_user_data"];
			//
			$bd = new bdd_access("_SEGURO");
			//
			$codUser = $userData["COD_USER"];
			//print_r($userData);die();
			//print_r($_SESSION["readMessages"]);die("PRIMERA");
			//$oldMessages = $_SESSION["readMessages"];
			$codUserForm = "";
			//Check the new messages in the form, then mark them like read
			//If this occurs, means that is the firt time the automaic process is going to get the new messages
			/*if(count($oldMessages) > 0)
			{
				//print_r($form);
				//print_r($_SESSION["readMessages"]);
				//die("MASIVO <<<");
				//Go through the form array and get the chatting boxes displayed
				foreach($form as $pos=>$nameObject)
				{
					//If the form object is a chatting box, then look for the codes belonging to it
					if( strpos($pos,'MsjTo')>0 )
					{
						$codUserForm = substr($pos,8);
						//die(">>>>".$pos.">>>".$codUserForm);
						///Go through the messages previously retreived, and gets the codes of those that
						//must be marked as read
						foreach($oldMessages as $posa=>$codMessage)
						{
							//die( ">>>".$pos.">>".$codMessage.">>>".substr( $codMessage,0, strpos($codMessage,'_') ) );
							if( substr( $codMessage,0, strpos($codMessage,'_') ) == $codUserForm )
							{
								//die("MENSAJE DE ".$codUserForm." >>> ".$codMessage." >>> LEIDO");
								//$arrReadMessages[$codUserForm][$posa]=$codMessage;
								//
								$bd->setMessageRead($codMessage);
							}
						}
					}
					//die("<<<<<<<<<<<".strpos($pos,'MsjTo'));
				}
				unset($_SESSION["readMessages"]);
			}*/
			
			//print_r($oldMessages);
			//print">>>>>>";
			//print_r($_SESSION);
			//die(">>>>");

			$messages = $bd->getUserMessages($codUser,$actionMessage,$getMessagesFrom);
			//
			//print_r($messages);die("X MESSAE >> ".$actionMessage." ** ".$codUser);
			
			//Creates a new chatbox with every different user who has sent a message to the user
			$sentMessages = array();
			$codUnreadMessage = array();
			//print_r($messages);die();
			if($messages)
			{
				foreach($messages as $pos => $arrMEssage)
				{
					array_push($codUnreadMessage,$arrMEssage["ID_MESSAGE"]);
					$decodedId = explode('_',$arrMEssage["ID_MESSAGE"]);
					//print_r($decodedId);die("ID << ");
					//$decodedMessage = json_decode(decrypt($arrMEssage["TXT_MESSAGE"]),$arrMEssage["CODE"]);//decrypt(utf8_decode(,$arrMEssage["CODE"]));
					$decodedMessage = decrypt($arrMEssage["TXT_MESSAGE"],$arrMEssage["CODE"]);
					//die("MENSAJE >> ".$decodedMessage);
					//$decodedMessage = json_decode($decodedMessage);
					//print_r($decodedMessage);die("Entregar:::".json_last_error());
					$name = fn_findFromName($decodedId[0],$_SESSION["buneli_user_contacts"]);
					////----------
					if($actionMessage==8 || $actionMessage==11) {
						$sentMessages[$decodedId[0]]["name"] = $name[0];
						$sentMessages[$decodedId[0]]["familyName"] = $name[1];
					}
					////----------
					$sentMessages[$decodedId[0]]["messages"][$arrMEssage["ID_MESSAGE"]]["sentDate"] = $decodedMessage[0];
					$sentMessages[$decodedId[0]]["messages"][$arrMEssage["ID_MESSAGE"]]["sentDateShort"] = substr(substr($decodedMessage[0],-8),0,5);
					$sentMessages[$decodedId[0]]["messages"][$arrMEssage["ID_MESSAGE"]]["message"] = $decodedMessage[1];
					$sentMessages[$decodedId[0]]["messages"][$arrMEssage["ID_MESSAGE"]]["class"] = $arrMEssage["CLASSNAME"];
				}
				//print_r($sentMessages);die();
				////Adicionar que cuente los mensajes y los acomule para guardarls en la session una ves haya
				//iniciado para mostrar la cantidad de nuevos mensajes por cada usuario a la izquierda del contacto
				//$form["unreadMessages"] = $sentMessages;
				//$_SESSION["unreadMessages"] = $sentMessages;
			} elseif($getMessagesFrom) {//If there are not messages available from this user, creates an empty array with the basic structure but no messages
				$name = fn_findFromName($getMessagesFrom,$_SESSION["buneli_user_contacts"]);
				$sentMessages[$getMessagesFrom]["name"] = $name[0];
				$sentMessages[$getMessagesFrom]["familyName"] = $name[1];
				$sentMessages[$getMessagesFrom]["messages"] = array();
			}
			$form["unreadMessages"] = $sentMessages;
			//else
			//{
			//	trigger_error("no_new_messages",E_USER_NOTICE);
			//	$ret = false;
			//}
			//if(count($codUnreadMessage)>0)
			//	$_SESSION["readMessages"] = $codUnreadMessage;
			//print_r($form["unreadMessages"]);die();
			
			return $ret;
		}
	}
	//
	//
	function fn_findFromName($fromUser,$contacts)
	{
		$arrReturn = array();
		$lnuIter = 0;
		foreach($contacts as $pos => $contacData)
		{
			$lnuIter++;
			if($contacData["COD_USER_HOST"]==$fromUser || $contacData["COD_USER_GUEST"]==$fromUser)
			{
				$arrReturn[0] = $contacData["TXT_NAME"];
				$arrReturn[1] = $contacData["TXT_SURNAME"];
				break;
			}
		}
		return $arrReturn;
	}
	
	function decrypt($message,$code)
	{
		//print_r(json_decode($message));
		//die("HEREEE>>".$message." >> ".$code." >> " );
		fn_calculateStrings($code,$lower,$upper,$lowerCr,$upperCr);
		//print_r($lower);die();
		$message = json_decode($message);//This converts any set of encoded chars into actual letters
		$arrMsg = str_split($message[1]);
		$arrMsgEnc = array();
		
		$inicia = 10;
		$partOne= array_slice($arrMsg,0,10);
        $partTwo= array_slice($arrMsg,$inicia);
		$codeArr = str_split($code);
		//print_r($partOne);
		//die(">>".$message[1]);
		while(count($partOne) > 0)
		{
			foreach($codeArr as $pos=>$value)
			{
				// Buscamos cada parte del codigo como una posicion en el mensaje, tomamos el caracter y lo buscamos en el arreglo
				// de control
				$caracterBuscar = $partOne[$value];
				//Si es mayuscula
				if(ctype_upper($caracterBuscar))
				{
					$posChar = array_search($caracterBuscar,$upperCr);
					if($posChar===0 || $posChar>=1)
					{
						$replaceChar = $upper[$posChar];
						$partOne[$value] = $replaceChar;
					}
				}
				if(ctype_lower($caracterBuscar))
				{
					$posChar = array_search($caracterBuscar,$lowerCr);
					if($posChar===0 || $posChar>=1)
					{
						$replaceChar = $lower[$posChar];
						$partOne[$value] = $replaceChar;
					}
				}
			}
			$arrMsgEnc = array_merge($arrMsgEnc, $partOne);
			$inicia=$inicia+10;
			$partOne= array_slice($partTwo,0,10);
			$partTwo= array_slice($arrMsg,$inicia);
        }
		//print_r($arrMsgEnc);die("ZZ");
		$decrypted = implode($arrMsgEnc);
		//die("MENSAJE >> ".$decrypted);
		return array($message[0],$decrypted);
	}
	
	function fn_calculateStrings($code,&$arrLo,&$arrUp,&$arrLoCr,&$arrUpCr)
	{
		$arrLo = array('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
        $arrUp = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');
        $inicia = substr($code,0,1) + substr($code,-1);
        
		$partFinal= array_slice($arrLo,0,$inicia);
        $partInicial= array_slice($arrLo,$inicia);
		$arrLo = array_merge($partInicial,$partFinal);

		$partFinal= array_slice($arrLo,0,$inicia);
        $partInicial= array_slice($arrLo,$inicia);
		$arrLoCr = array_merge($partInicial,$partFinal);

        $partFinal= array_slice($arrUp,0,$inicia);
        $partInicial= array_slice($arrUp,$inicia);
        $arrUp = array_merge($partInicial,$partFinal);

		$partFinal= array_slice($arrUp,0,$inicia);
        $partInicial= array_slice($arrUp,$inicia);
		$arrUpCr = array_merge($partInicial,$partFinal);
	}
	
?>
