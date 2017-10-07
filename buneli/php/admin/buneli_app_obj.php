<?php
	define("ACCION_DEFAULT",'1');
	define("ACCION_VER_LOGIN",'2');
	require_once("../../buneli/php/admin/buneli_connect.php");
	class buneli_app_obj
	{
		var $obj_validate;
		var $obj_execute;
		var $obj_show;
		var $obj_show_default = "../../buneli/php/admin/buneli_default_show_obj.php";
		var $form;
		var $flg_validate = false;
		var $flg_execution  = false;
		var $flg_action = false;
		function __construct($actionArray,$data)
		{
			if(count($actionArray)>0)
			{
				try 
				{
					$this->obj_validate = $actionArray["URL_VALIDATE"];
					$this->obj_execute = $actionArray["URL_EXECUTE"];
					$this->obj_show = $actionArray["URL_DRAW"];
					$this->form = $data;
					$this->flg_action = true;
				} catch (Exception $e) 
				{
					trigger_error("empty_option",E_USER_ERROR);
				}
			}
		}
		function validate_form()
		{
			if($this->obj_validate)
			{
				require_once($this->obj_validate);
				$external_form = new buneli_form();
				$this->flg_validate = $external_form->buneli_form_validate($this->form);
			}
			else
				$this->flg_validate = true;
		}
		function execute_action()
		{
			if($this->obj_execute && $this->flg_validate===true)
			{
				require_once($this->obj_execute);
				$action_rules = new buneli_execution();
				$this->flg_execution = $action_rules->buneli_execute($this->form);
			}
			else
			{
				if(!$this->obj_execute && $this->flg_validate===true)
					$this->flg_execution = true;
			}
		}
		function show_response()
		{
			if($this->obj_show && $this->flg_execution===true)
			{
				require_once($this->obj_show);
			}
			else
			{
				require_once($this->obj_show_default);
			}
			$user_response = new buneli_show();
			$response = $user_response->show_response($this->form);
			return $response;
		}
	}
?>