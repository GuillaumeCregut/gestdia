<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	index.php										 *
 * Date création :	08/01/2021										 *
 * Date Modification : 08/01/2021									 *
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
	//On traite les infos du formulaire
	if(isset($_POST['id_film']))
	{
		//On affiche les catégories dans la légende 
		$SQLS=$SelListeCat;
		$row=$Conn->sql_fetch_all($SQLS);
		$moteur->assign('TabCategorie',$row);
		$Id_Film=intval($_POST['id_film']);
		//Récupére le nom du film
		$SQLS=$SelFilmByID;
		$TabVal=array(':id_film'=>$Id_Film);
		$row=$Conn->sql_fetch_all_prepared($TabVal,$SQLS);
		$NomFilm=$row[0]['nomfilm']; //row est un tableau de tableau
		$moteur->assign('Nom_Film',$NomFilm);
		//Récupére les photos du film
		$SQLS=$SelListePhotoFilm;
		$Result=$Conn->ExecProc($TabVal,$SQLS);
		if($Result>0)
		{
			$i=0;
			while($row=$Conn->sql_fetchrow())
			{
				$TabPhoto[$i]['Id_Photo']=$row['id_photo'];
				$TabPhoto[$i]['Nom_Photo']=$row['nom'];
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
			$moteur->assign('TabPhotos',$TabPhoto);
		}
		$moteur->display($CheminTpl.'voir_film.tpl');
    }
	else
	{
		$moteur->display($CheminTpl.'index.tpl');
	}
?>
