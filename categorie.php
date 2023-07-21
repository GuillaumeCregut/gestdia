<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	categorie.php									 *
 * Date création :	04/01/2021										 *
 * Date Modification : 08/01/2021									 *
 * Créateur : Guillaume Crégut										 *													
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos Catégories							 *
 *	  					          									 *
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
			//Si on supprime une categorie
			case 0 : 
				//On récupére l'ID de la catégorie à supprimer
				if (isset($_POST['id_cat']))
				{
					$LeId=intval($_POST['id_cat']);
					$SQLS=$SuppCat;
					$tabNom=array(':Id_Cat'=>$LeId);
					$Result=$Conn->ExecProc($tabNom, $SQLS);
				}
			break;
			//Si on modifie une catégorie
			case 1 :
				if ((isset($_POST['id_cat'])) && (isset($_POST['nouv_nom'])))
				{
					$LeId=intval($_POST['id_cat']);
					$NomCat=htmlspecialchars($_POST['nouv_nom'], ENT_NOQUOTES, "UTF-8");
					$SQLS=$ModifCat;
					$tabNom=array(':Id_Cat'=>$LeId,':Nom_Cat'=>$NomCat);
					$Result=$Conn->ExecProc($tabNom, $SQLS);
				}
			break;
			//Si on ajoute une catégorie
			case 2 :
				//On récupère le nom de la catégorie :
				if (isset($_POST['nom_cat']))
				{
					$NomCat=htmlspecialchars($_POST['nom_cat'], ENT_NOQUOTES, "UTF-8");
					//Génération de la couleur associée
					$Rouge=dechex (rand(0,255));
					$Vert=dechex (rand(0,255));
					$Bleu=dechex (rand(0,255));
					$Couleur="#$Rouge$Vert$Bleu";
					$SQLS=$AddCat;
					$tabNom=array(':Nom_Cat'=>$NomCat,':LaCouleur'=>$Couleur);
					$Result=$Conn->ExecProc($tabNom, $SQLS);
				}
			break;
			//Sinon
			default :
			
			break;
		}
	}
    //Récupèration des catégories existantes 
	$SQLS=$SelListeCat;
	$Result=$Conn->sql_fetch_all($SQLS);
	$moteur->assign('tabcat',$Result);
	$moteur->display($CheminTpl.'categorie.tpl');
?>
