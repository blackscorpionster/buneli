<?php
	//die("ACA");
	header("Cache-Control: max-age=2592000");
	require_once("admin/json_Smarty.php");
	$app="_JSON";
	$lan=$_REQUEST["language"];
	$wid=$_REQUEST["width"];
	$hei=$_REQUEST["height"];
	$mpo=$_REQUEST["menuPosition"];
	$onLoad = 'onLoad="buneli_build('."'{$app}','{$lan}',{$wid},{$hei},'{$mpo}'".')"';
	$smarty = new json_Smarty();
	$smarty->assign("onload",$onLoad);
	$smarty->display("index.tpl.html");
?>