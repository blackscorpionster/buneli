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
			
			$userData = $_SESSION["buneli_user_data"];
			//print_r($userData);die();
			$codUser = $userData["COD_USER"];
			$code = $userData["CODE"];

			$bd = new bdd_access("_SEGURO");
			
			//die("ACA>>>".$form["txtMessageText"]);
			
			$messageTxt = encrypt($form["txtMessageText"],$code);
			
			//die("MESG::".$messageTxt."::".$form["txtMessageText"]." >> ".$code);
			//$messageTxt = decrypt($messageTxt,$code);
			//$messageTxt = array($form["txtMessageSysdate"],$form["txtMessageText"]);
			$messageTxt = array($form["txtMessageSysdate"],$messageTxt);
			
			$messageTxt = json_encode($messageTxt);
			//die("MESG::".$messageTxt."::".$form["txtMessageText"]." >> ".$code);
			$ret = $bd->sendMessage($codUser,$form["txtMessageTo"],$messageTxt,$form["lang"]);

			if(!$ret)
			{
				$form["message_not_sent"] = 1;
			}
			$ret = true;
			return $ret;
		}
	}
	
	function encrypt($message,$code)
	{
		$lower = $_SESSION["LowerCaseString"];
		$upper = $_SESSION["UpperCaseString"];
		
		$lowerCr = $_SESSION["LowerCaseCryptoString"];
		$upperCr = $_SESSION["UpperCaseCrypyoString"];

		$arrMsg = str_split($message);
		$arrMsgEnc = array();
		
		$inicia = 10;
		$partOne= array_slice($arrMsg,0,10);
        $partTwo= array_slice($arrMsg,$inicia);
		$codeArr = str_split($code);
		
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
					$posChar = array_search($caracterBuscar,$upper);
					if($posChar===0 || $posChar>=1)
					{
						$replaceChar = $upperCr[$posChar];
						$partOne[$value] = $replaceChar;
					}
				}
				if(ctype_lower($caracterBuscar))
				{
					$posChar = array_search($caracterBuscar,$lower);
					if($posChar===0 || $posChar>=1)
					{
						$replaceChar = $lowerCr[$posChar];
						$partOne[$value] = $replaceChar;
					}
				}
			}
			$arrMsgEnc = array_merge($arrMsgEnc, $partOne);
			$inicia=$inicia+10;
			$partOne= array_slice($partTwo,0,10);
			$partTwo= array_slice($arrMsg,$inicia);
        }
		$encrypted = implode($arrMsgEnc);
		return $encrypted;
	}
	
	function decrypt($message,$code)
	{
		//die("Desencriptar>>>".$message."<<<>>>".$code);
		$lower = $_SESSION["LowerCaseString"];
		$upper = $_SESSION["UpperCaseString"];
		
		$lowerCr = $_SESSION["LowerCaseCryptoString"];
		$upperCr = $_SESSION["UpperCaseCrypyoString"];

		$arrMsg = str_split($message);
		$arrMsgEnc = array();
		
		$inicia = 10;
		$partOne= array_slice($arrMsg,0,10);
        $partTwo= array_slice($arrMsg,$inicia);
		$codeArr = str_split($code);
		
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
		$decrypted = implode($arrMsgEnc);
		return $decrypted;
	}
	
	//function encontrarPos
	
?>
