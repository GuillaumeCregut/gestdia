<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	recherche_photo.php								 *
 * Date création :	08/01/2021										 *
 * Date Modification : 08/01/2021									 *
 * Créateur : Guillaume Crégut										 * *																   *
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
	//On traite les entrée formulaire
	if(isset($_POST['action']))
	{
		//print_r($_POST);
		$action=intval($_POST['action']);
		$Ok=false;
		switch($action)
		{
			case 1 : //Recherche par film
					if(isset($_POST['id_film']))
					{
						$Id_Film=intval($_POST['id_film']);
						$SQLSInt=$RechFilmPhoto;
						$TabVal=array(':id_recherche'=>$Id_Film);
						$Ok=true;
					}
					break;
			case 2 : //Recherche par catégorie
					if(isset($_POST['id_cat']))
					{
						$Id_Cat=intval($_POST['id_cat']);
						$SQLSInt=$RechCatPhoto;
						$TabVal=array(':id_recherche'=>$Id_Cat);
						$Ok=true;
					}
					break;
			case 3 : //Recherche par nom
					if(isset($_POST['texte']))
					{
						$Texte='%'.htmlspecialchars($_POST['texte'], ENT_NOQUOTES, "UTF-8").'%';
						$SQLSInt=$RechNomPhoto;
						$TabVal=array(':id_recherche'=>$Texte);
						$Ok=true;
					}
					break;
			case 4 : //Recherche par description
					if(isset($_POST['texte']))
					{
						$Texte='%'.htmlspecialchars($_POST['texte'], ENT_NOQUOTES, "UTF-8").'%';
						$SQLSInt=$rechDescPhoto;
						$TabVal=array(':id_recherche'=>$Texte);
						$Ok=true;
					}
					break;
			case 5 : //Recherche par commentaire
					if(isset($_POST['texte']))
					{
						$Texte='%'.htmlspecialchars($_POST['texte'], ENT_NOQUOTES, "UTF-8").'%';
						$SQLSInt=$RechComPhoto;
						$TabVal=array(':id_recherche'=>$Texte);
						$Ok=true;
					}
					break;
			default :
	
		}
		if($Ok)
		{
			//Affichage des legendes
			$SQLS=$SelListeCat;
			$row=$Conn->sql_fetch_all($SQLS);
			$moteur->assign('TabCategorie',$row);
			$Id_Film=intval($_POST['id_film']);
			//Affichage des résultats
			$SQLS=$EnteteRechPhoto.$SQLSInt.$FinalRechPhoto;
			$ResultPhoto=$Conn->ExecProc($TabVal,$SQLS);
			if ($ResultPhoto>0)
			{
				$i=0;
				while($row=$Conn->sql_fetchrow())
				{
					$TabPhoto[$i]['Id_Photo']=$row['Id_Photo'];
					$TabPhoto[$i]['nomphoto']=$row['nomphoto'];
					$CheminPhoto=$CheminAlbum.$row['chemin'];
					if(is_file($CheminPhoto))
					{
						$TabPhoto[$i]['chemin']=$CheminPhoto;
					}
					else
						$TabPhoto[$i]['chemin']='images/no_photo.jpg';
					$TabPhoto[$i]['categorie']=$row['categorie'];
					$i++;
				}
				$moteur->assign('TabPhoto',$TabPhoto);
			}
			$moteur->display($CheminTpl.'affiche_rech_photo.tpl');
		}
		else
		{
			//Récupération de la liste des films
			$SQLS=$SelFilm;
			$Result=$Conn->sql_query($SQLS);
			$i=0;
			$Tabresult=array();
			while($row=$Conn->sql_fetchrow())
			{
				$Tabresult[$i]['id_film']=$row['id_film'];
				$Tabresult[$i]['nom_film']=$row['nom_film'];
				$i++;
			}
			if (isset($Tabresult))
			{
				$moteur->assign('Tab_Film',$Tabresult);
			}
			//Récupération des catégories existantes 
			$SQLS=$SelListeCat;
			$Result=$Conn->sql_fetch_all($SQLS);
			$moteur->assign('tabcat',$Result);
			//On affiche la page
			$moteur->display($CheminTpl.'recherche_photo.tpl');
		}
	}
		else
		{
		//Récupération de la liste des films
		$SQLS=$SelFilm;
		$Result=$Conn->sql_query($SQLS);
		$i=0;
		$Tabresult=array();
		while($row=$Conn->sql_fetchrow())
		{
			$Tabresult[$i]['id_film']=$row['id_film'];
			$Tabresult[$i]['nom_film']=$row['nom_film'];
			$i++;
		}
		if (isset($Tabresult))
		{
			$moteur->assign('Tab_Film',$Tabresult);
		}
		//Récupération des catégories existantes 
		$SQLS=$SelListeCat;
		$Result=$Conn->sql_fetch_all($SQLS);
		$moteur->assign('tabcat',$Result);
		//On affiche la page
		$moteur->display($CheminTpl.'recherche_photo.tpl');
	}
    
?>
