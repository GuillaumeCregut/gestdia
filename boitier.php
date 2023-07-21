<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	boitier.php										 *
 * Date création :	04/01/2021										 *
 * Date Modification : 05/01/2021									 *
 * Créateur : Guillaume Crégut										 *													
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos										 *
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
	//Traitement des retours de formulaires
	if(isset($_POST['action']))
	{
		$action=intval($_POST['action']);
		switch ($action)
		{
			case 0 : //on supprime
					if (isset($_POST['id_boitier']))
					{
						$Id_Boitier=intval($_POST['id_boitier']);
						$SQLS=$SuppBoitier;
						$TabVal=array(':id_boitier'=>$Id_Boitier);
						$Result=$Conn->ExecProc($TabVal, $SQLS);
					}
			
					break;
			case 1 : //On modifie
					if (isset($_POST['id_boitier']) and isset($_POST['nouvNom']) and(isset($_POST['id_NouvMarque'])))
					{
						$Id_Boitier=intval($_POST['id_boitier']);
						$Id_Marque=intval($_POST['id_NouvMarque']);
						$NouvNom=htmlspecialchars($_POST['nouvNom'], ENT_NOQUOTES, "UTF-8");
						$SQLS=$ModifBoitier;
						$TabVal=array(':id_boitier'=>$Id_Boitier, ':nouvMarque'=>$Id_Marque, ':nouvNom'=>$NouvNom);
						$Result=$Conn->ExecProc($TabVal, $SQLS);
					}
					break;
			case 2 : //On ajoute
					if(isset($_POST['marque_boitier']) &&isset($_POST['nom_boitier']))
					{
						$Id_Marque=intval($_POST['marque_boitier']);
						$Nom_Boitier=htmlspecialchars($_POST['nom_boitier'], ENT_NOQUOTES, "UTF-8");
						$SQLS=$AddBoitier;
						$TabVal=array(':num_marque'=>$Id_Marque,':nom_boitier'=>$Nom_Boitier);
						$Result=$Conn->ExecProc($TabVal, $SQLS);
					}
					break;
			default :
		}
	}
	
	//R�cup�ration des noms de boitiers
	$SQLS=$SelBoitierMarque;
	$Result=$Conn->sql_query($SQLS);
	$i=0;
	while($row=$Conn->sql_fetchrow())
	{
		$TabRes[$i]['NomBoitier']=$row['nomboitier'];
		$TabRes[$i]['NomMarque']=$row['nommarque'];
		$TabRes[$i]['IdBoitier']=$row['numboitier'];
		$i++;
	}
	if(isset($TabRes))
	{
		$moteur->assign('tabBoitiers',$TabRes);
	}
	//R�cup�ration des noms de marque
	$SQLS=$SelListeMarques;
	$Result=$Conn->sql_fetch_all($SQLS);
	$moteur->assign('TabMarques',$Result);
	//Affichage de la page
	$moteur->display($CheminTpl.'boitier.tpl');
    
?>
