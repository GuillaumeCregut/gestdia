<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	categorie_css.php								 *
 * Date cr�ation :	08/01/2021										 *
 * Date Modification : 08/01/2021									 *
 * Cr�ateur : Guillaume Cr�gut										 *					 *																	 *		
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos										 *
 *	                              									 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
//Inclusion des fichiers n�cessaires
	header("Content-type: text/css; charset=UTF-8"); 
	include "../include/config.inc.php";
	include "../include/db.inc.php";
	include "../include/sql.inc.php";
//D�claration des variables	
//Assignations des objets utiles
	$Conn=new connect_base($DataBaseServeur,$DataBaseName,$DataBaseUser,$DataBasePass);
	//On r�cup�re la liste des cat�gories
	$SQLS=$SelListeCat;
	$Result=$Conn->sql_query($SQLS);
	while($row=$Conn->sql_fetchrow())
	{
		$texte='.'.$row['nomcat'].'{';
		//G�n�ration du code couleur 
		$texte.="border-style : solid;";
		$texte.="border-color : ".$row['couleur'].";";
		
		$texte.="}";
		echo $texte;
	}
?>
