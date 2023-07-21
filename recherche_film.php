<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	recherche_film.php								 *
 * Date création :	06/01/2021										 *
 * Date Modification : 09/01/2021									 *
 * Créateur : Guillaume Crégut										 *													
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos -Recherche de film					 *
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
	//On traite l'arrivée formulaire
	if(isset($_POST['action']))
	{
		$action=intval($_POST['action']);
		//print_r($_POST);
		switch($action)
		{
			case 1 : //Recherche par boitier
					if(isset($_POST['nom_boitier']))
					{
						$SQLInt=$RechBoitier;
						$LaRech=intval($_POST['nom_boitier']);
					}
					else
						$page='recherche_film.tpl';
					break;
			case 2 : //Recherche par type de film
					if(isset($_POST['nom_type']))
					{
						$SQLInt=$RechType;
						$LaRech=intval($_POST['nom_type']);
					}
					else
						$page='recherche_film.tpl';
					break;
			case 3 : //Recherche par nom de film
					if(isset($_POST['nom_film']))
					{
						$SQLInt=$RechNom;
						$LaRech='%'.htmlspecialchars($_POST['nom_film'], ENT_NOQUOTES, "UTF-8").'%';
						
					}
					else
						$page='recherche_film.tpl';
					break;
			default : //Erreur
					$page='erreur.tpl';
					$moteur->display($CheminTpl.$page);
					die();
		}
		//On effectue la recherche
		if(isset($SQLInt))
		{
			$page='affiche_rech_film.tpl';
			$TabVal=array(':id_rech'=>$LaRech);
			$SQLS=$EnteteRechFilm.$SQLInt.$FinalRech;
			//On l'affiche
			$Result=$Conn->ExecProc($TabVal, $SQLS);
			if($Result>0)
			{
				$i=0;
				while($row=$Conn->sql_fetchrow())
				{
					$TabFilm[$i]['id_film']=$row['numfilm'];
					$TabFilm[$i]['nom_film']=$row['nomfilm'];
					$i++;
				}
				$moteur->assign('TabFilm',$TabFilm);
			}
			//On affiche la page
		}
		else
		{
			//On récupére la liste des boitiers
			$SQLS=$SelBoitierMarque;
			$Result=$Conn->sql_query($SQLS);
			$i=0;
			while($row=$Conn->sql_fetchrow())
			{
				$TabRes[$i]['NomBoitier']=$row['nomboitier'];
				$TabRes[$i]['IdBoitier']=$row['numboitier'];
				$i++;
			}
			if(isset($TabRes))
			{
				$moteur->assign('tabBoitiers',$TabRes);
			}
			//On récupére la liste des types
			$SQLS=$SelTypeMarque;
			$Result=$Conn->sql_query($SQLS);
			$i=0;
			while($row=$Conn->sql_fetchrow())
			{
				$TabType[$i]['IdType']=$row['numtype'];
				$TabType[$i]['NomType']=$row['nomtype'];
				$i++;
			}
			if(isset($TabType))
			{
				//var_dump(
				$moteur->assign('tabTypes',$TabType);
			}
		}
		$moteur->display($CheminTpl.$page);
	}
	else
	{
		//On récupére la liste des boitiers
		$SQLS=$SelBoitierMarque;
		$Result=$Conn->sql_query($SQLS);
		$i=0;
		while($row=$Conn->sql_fetchrow())
		{
			$TabRes[$i]['NomBoitier']=$row['nomboitier'];
			$TabRes[$i]['IdBoitier']=$row['numboitier'];
			$i++;
		}
		if(isset($TabRes))
		{
			$moteur->assign('tabBoitiers',$TabRes);
		}
		//On récupére la liste des types
		$SQLS=$SelTypeMarque;
		$Result=$Conn->sql_query($SQLS);
		$i=0;
		while($row=$Conn->sql_fetchrow())
		{
			$TabType[$i]['IdType']=$row['numtype'];
			$TabType[$i]['NomType']=$row['nomtype'];
			$i++;
		}
		if(isset($TabType))
		{
			//var_dump(
			$moteur->assign('tabTypes',$TabType);
		}
		//On affiche la page
		$moteur->display($CheminTpl.'recherche_film.tpl');
    }
?>
