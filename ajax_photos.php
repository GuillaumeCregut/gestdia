<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	ajax_photos.php									 *
 * Date création :	05/01/2021										 *
 * Date Modification : 05/01/2021									 *
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
	if(isset($_POST['Id_Film']))
	{
		$id_Film=intval($_POST['Id_Film']);
		$SQLS=$SELECT_Photo_By_Film;
		$TabVal=array(':id_Film'=>$id_Film);
		$Result=$Conn->ExecProc($TabVal,$SQLS);
	}
    $TabPhoto=array();
	$i=0;
	while($row=$Conn->sql_fetchrow())
	{
		array_push($TabPhoto,array('code'=>$row['codephoto'],'Nom'=>$row['nomphoto'],'chemin'=>$row['chemin']));
	}
	echo json_encode($TabPhoto);
?>
