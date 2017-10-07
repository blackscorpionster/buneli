<?php
	require_once("../../buneli/libs/Smarty/libs/Smarty.class.php");
	class json_Smarty extends Smarty
	{
		function __construct()
		{
			parent::__construct();
			/**
			 * The name of the directory where templates are located.
			 *
			 * @var string
			 */
			//$this->template_dir = "../html/templates";
	
			/**
			 * The directory where compiled templates are located.
			 *
			 * @var string
			 */
			//$this->compile_dir = "../html/templates_c";
		
			/**
			 * The directory where config files are located.
			 *
			 * @var string
			 */
			//$this->config_dir = "../html/templates_conf";
				
			/**
			 * The name of the directory for cache files.
			 *
			 * @var string
			 */
			//$this->cache_dir = "../html/templates_cache";
		
			$this->setTemplateDir('../html/templates/');
			$this->setCompileDir('../html/templates_c/');
			$this->setConfigDir('../html/templates_conf/');
			$this->setCacheDir('../html/templates_cache/');

			//$this->caching = Smarty::CACHING_LIFETIME_CURRENT;
			$this->assign('app_name', 'Json Says');
		}
		function combo($data,$cmbName,$optCod,$optTxt,$event=null)
		{
			//die(">".$cmbName.">".$optCod.">".$optTxt);
			$this->assign("datos",$data);
			$this->assign("name",$cmbName);
			$this->assign("cod",$optCod);
			$this->assign("desc",$optTxt);
			$this->assign("event",$event);
			//print_r($this);
			//die("ACA<>".$cmbName.">".$optCod.">".$optTxt);
			$html = $this->fetch("combo.tpl.html");
			//die('>>>>>>>'.$html);
			$html = utf8_encode($html);
			return $html;
		}
	}
?>