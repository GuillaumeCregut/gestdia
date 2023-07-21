<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	categorie_css.php								 *
 * Date création :	08/01/2021										 *
 * Date Modification : 08/01/2021									 *
 * Créateur : Guillaume Crégut										 *					 *																	 *		
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos										 *
 *	                              									 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
//Inclusion des fichiers nécessaires
	header("Content-type: text/css; charset=UTF-8"); 
	include "../include/config.inc.php";
	include "../include/db.inc.php";
	include "../include/sql.inc.php";
//Déclaration des variables	
//Assignations des objets utiles
	$Conn=new connect_base($DataBaseServeur,$DataBaseName,$DataBaseUser,$DataBasePass);
	//On récupère la liste des catégories
	$SQLS=$SelListeCat;
	$Result=$Conn->sql_query($SQLS);
	while($row=$Conn->sql_fetchrow())
	{
		$texte='.'.$row['nomcat'].'{';
		//Génération du code couleur 
		$texte.="border-style : solid;";
		$texte.="border-color : ".$row['couleur'].";";
		
		$texte.="}";
		echo $texte;
	}
?>
