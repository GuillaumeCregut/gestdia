<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	film.php										 *
 * Date création :	05/01/2021										 *
 * Date Modification : 05/01/2021									 *
 * Créateur : Guillaume Crégut										 *													
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos - Films								 *
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
	//Traitement des retour formulaires
	if(isset($_POST['action']))
	{
		$action=intval($_POST['action']);
		switch ($action)
		{
			case 1 : //Suppression
					if (isset($_POST['id_Film_Form']))
					{
						$Id_Film=intval($_POST['id_Film_Form']);
						$TabSQL=array(':id_film'=>$Id_Film);
						$SQLS=$SuppFilm;
						$Res=$Conn->ExecProc($TabSQL, $SQLS);
					}
					break;
			case 2 : //On modifie
					if (isset($_POST['id_Film_Form'])&&isset($_POST['id_Boitier_Form'])&&isset($_POST['id_Type_Form'])&&isset($_POST['Nouv_Nom_Form']))
					{
						$Id_Film=intval($_POST['id_Film_Form']);
						$Id_Boitier=intval($_POST['id_Boitier_Form']);
						$Id_Type=intval($_POST['id_Type_Form']);
						$Nom_Film=htmlspecialchars($_POST['Nouv_Nom_Form'], ENT_NOQUOTES, "UTF-8");
						$TabSQL=array(':id_film'=>$Id_Film,':id_boitier'=>$Id_Boitier,':id_type'=>$Id_Type,':nouvnom'=>$Nom_Film);
						$SQLS=$ModifFilm;
						$Res=$Conn->ExecProc($TabSQL, $SQLS);
					}
					break;
			case 3 : //Ajout
					if(isset($_POST['nom_Film_Form'])&&isset($_POST['Boitier_Form'])&&isset($_POST['Type_Form']))
					{
						$Id_Boitier=intval($_POST['Boitier_Form']);
						$Id_Type=intval($_POST['Type_Form']);
						$Nom_Film=htmlspecialchars($_POST['nom_Film_Form'], ENT_NOQUOTES, "UTF-8");
						$TabSQL=array(':id_boitier'=>$Id_Boitier,':id_type'=>$Id_Type,':nomfilm'=>$Nom_Film);
						$SQLS=$Add_Film;
						$Res=$Conn->ExecProc($TabSQL, $SQLS);
						if($Res==1)
						{
							//Création du répertoire
							if(!is_dir($CheminAlbum.$Nom_Film))
							{
								mkdir($CheminAlbum.$Nom_Film);
							}
						}
					}
					break;	
			default :
		}
	}
	//Récupération de la liste des films
	$SQLS=$SelFilm;
	$Result=$Conn->sql_query($SQLS);
	$i=0;
	$Tabresult=array();
	while($row=$Conn->sql_fetchrow())
	{
		$Tabresult[$i]['id_film']=$row['id_film'];
		$Tabresult[$i]['nom_film']=$row['nom_film'];
		$Tabresult[$i]['nom_boitier']=$row['nom_boitier'];
		$Tabresult[$i]['nom_type']=$row['nom_type'];
		$i++;
	}
	if (isset($Tabresult))
	{
		$moteur->assign('Tab_Film',$Tabresult);
	}
	//Récupérations de la liste des boitiers
	$SQLS=$SelBoitierMarque;
	$Result=$Conn->sql_query($SQLS);
	$i=0;
	while($row=$Conn->sql_fetchrow())
	{
		$TabBoit[$i]['NomBoitier']=$row['nomboitier'];
		$TabBoit[$i]['IdBoitier']=$row['numboitier'];
		$i++;
	}
	if(isset($TabBoit))
	{
		$moteur->assign('tabBoitiers',$TabBoit);
	}
	//récupération de la liste des types
	$SQLS=$SelTypeMarque;
	$Result=$Conn->sql_query($SQLS);
	$i=0;
	while($row=$Conn->sql_fetchrow())
	{
		$TabRes[$i]['IdType']=$row['numtype'];
		$TabRes[$i]['NomType']=$row['nomtype'];
		$i++;
	}
	if(isset($TabRes))
	{
		$moteur->assign('tabTypes',$TabRes);
	}
	//Affichage de la page
	$moteur->display($CheminTpl.'film.tpl');
    
?>
