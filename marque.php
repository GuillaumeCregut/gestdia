<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	marque.php										 *
 * Date création :	04/01/2021										 *
 * Date Modification : 04/01/2021									 *
 * Créateur : Guillaume Crégut										 *													
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos Marques								 *
 *	                              									 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
//Inclusion des fichiers nécessaires
	include "include/config.inc.php";
	include "include/Smarty.class.php";
	include "include/db.inc.php";
	include "include/sql.inc.php";
//Déclaration des variables	
//Assignations des objets utiles
	$moteur=new Smarty();
	$Conn=new connect_base($DataBaseServeur,$DataBaseName,$DataBaseUser,$DataBasePass);
	//Traitement du retour des formulaires
	if (isset($_POST['action']))
	{
		//Récupération de l'action :
		$action=intval($_POST['action']);
		switch($action)
		{
			//Si on supprime une marque
			case 0 : 
				//On récupére l'ID de la marque é supprimer
				$LeId=intval($_POST['num_marque']);
				$SQLS=$SuppMarque;
				$tabNom=array(':Id_Marque'=>$LeId);
				$Result=$Conn->ExecProc($tabNom, $SQLS);
			break;
			//Si on modifie une marque
			case 1 :
				$LeId=intval($_POST['id_marque']);
				$NomMarque=htmlspecialchars($_POST['nouv_nom'], ENT_NOQUOTES, "UTF-8");
				$SQLS=$ModifMarque;
				$tabNom=array(':Id_Marque'=>$LeId,':nom_marque'=>$NomMarque);
				$Result=$Conn->ExecProc($tabNom, $SQLS);
			break;
			//Si on ajoute une marque
			case 2 :
				//On récupére le nom de la marque :
				$NomMarque=htmlspecialchars($_POST['nom_marque'], ENT_NOQUOTES, "UTF-8");
				$SQLS=$AddMarque;
				$tabNom=array(':nom_marque'=>$NomMarque);
				$Result=$Conn->ExecProc($tabNom, $SQLS);
			break;
			//Sinon
			default :
			
			break;
		}
	}
	//Si on a modifier ou supprimer une marque
	
	
	
	
    //Récupération des marques existantes 
	$SQLS=$SelListeMarques;
	$Result=$Conn->sql_fetch_all($SQLS);
	$moteur->assign('tabmarque',$Result);
	$moteur->display($CheminTpl.'marque.tpl');
?>
