<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	ajax_filmstype.php								 *
 * Date création :	04/01/2021										 *
 * Date Modification : 04/01/2021									 *
 * Créateur : Guillaume Crégut										 *													
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos										 *
 *	                              									 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
//Inclusion des fichiers nécessaires
	include "include/config.inc.php";
	include "include/db.inc.php";
	include "include/sql.inc.php";
//Déclaration des variables	
//Assignations des objets utiles
	$Conn=new connect_base($DataBaseServeur,$DataBaseName,$DataBaseUser,$DataBasePass);
    if(isset($_POST['Id_Type']))
	{
		$id_type=intval($_POST['Id_Type']);
		$SQLS=$SelFilmTypeTableID;
		$TabVal=array(':id_type'=>$id_type);
		$Result=$Conn->ExecProc($TabVal,$SQLS);
		$ValJSon=array();
		while($row=$Conn->sql_fetchrow())
		{
			array_push($ValJSon,array('nom_film'=>$row['nomfilm'],'id_film'=>$row['numfilm']));
		}
		echo json_encode($ValJSon);
	}
	else
	{
		header("HTTP/1.0 404 Not Found");
	}
?>