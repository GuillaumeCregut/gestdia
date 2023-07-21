<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	types.php										 *
 * Date création :	04/01/2021										 *
 * Date Modification : 04/01/2021									 *
 * Créateur : Guillaume Crégut										 *													
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos Marques								 *
 *	 Version non corrigée          									 *
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
	if(isset($_POST['action']))
	{
		$action=intval($_POST['action']);
		switch ($action)
		{
			case 0 : //on supprime
					if (isset($_POST['id_type']))
					{
						$Id_Type=intval($_POST['id_type']);
						$SQLS=$SuppType;
						$TabVal=array(':id_type'=>$Id_Type);
						$Result=$Conn->ExecProc($TabVal, $SQLS);
					}
			
					break;
			case 1 : //On modifie
					if (isset($_POST['id_type']) and isset($_POST['nouv_nom']) and(isset($_POST['id_NouvMarque'])))
					{
						$Id_Type=intval($_POST['id_type']);
						$Id_Marque=intval($_POST['id_NouvMarque']);
						$NouvNom=htmlspecialchars($_POST['nouv_nom'], ENT_NOQUOTES, "UTF-8");
						$SQLS=$ModifType;
						$TabVal=array(':id_type'=>$Id_Type, ':nouvMarque'=>$Id_Marque, ':nouvNom'=>$NouvNom);
						$Result=$Conn->ExecProc($TabVal, $SQLS);
					}
					break;
			case 2 : //On ajoute
					if(isset($_POST['marque_type']) &&isset($_POST['nom_type']))
					{
						$Id_Marque=intval($_POST['marque_type']);
						$Nom_Type=htmlspecialchars($_POST['nom_type'], ENT_NOQUOTES, "UTF-8");
						$SQLS=$AddType;
						$TabVal=array(':num_marque'=>$Id_Marque,':nom_Type'=>$Nom_Type);
						$Result=$Conn->ExecProc($TabVal, $SQLS);
					}
					break;
			default :
		}
	}
    //Récupération des types existants 
	$SQLS=$SelTypeMarque;
	$Result=$Conn->sql_query($SQLS);
	$i=0;
	while($row=$Conn->sql_fetchrow())
	{
		$TabRes[$i]['IdType']=$row['numtype'];
		$TabRes[$i]['NomType']=$row['nomtype'];
		$TabRes[$i]['NomMarque']=$row['nommarque'];
		$i++;
	}
	if(isset($TabRes))
	{
		$moteur->assign('tabTypes',$TabRes);
	}
	//Récupération des noms de marque
	$SQLS=$SelListeMarques;
	$Result=$Conn->sql_fetch_all($SQLS);
	$moteur->assign('TabMarques',$Result);
	$Result=$Conn->sql_fetch_all($SQLS);
	$moteur->assign('tabmarque',$Result);
	$moteur->display($CheminTpl.'types.tpl');
?>
