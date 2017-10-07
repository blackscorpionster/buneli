<?php
	require_once("../libs/Smarty/libs/Smarty.class.php");
	class buneli_Smarty extends Smarty
	{
		function __Construct()
		{
			// Class Constructor.
			// These automatically get set with each new instance.

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
			$this->assign('app_name', 'Buneli');
		}
	}
?>