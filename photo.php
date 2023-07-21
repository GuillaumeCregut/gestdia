<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	photo.php										 *
 * Date création :	05/01/2021										 *
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
	include "include/functions.inc.php";
//Déclaration des variables	
//Assignations des objets utiles
	$moteur=new Smarty();
	$Conn=new connect_base($DataBaseServeur,$DataBaseName,$DataBaseUser,$DataBasePass);
	//Traitement des retours formulaire
	//print_r($_POST);
	if(isset($_POST['action']))
	{
		$Action=intval($_POST['action']);
		switch ($Action)
		{
			case 1 : //On affiche le détail d'une photo
					if(isset($_POST['code_photo_form']))
					{
						$Code_Photo=htmlspecialchars($_POST['code_photo_form'], ENT_NOQUOTES, "UTF-8");
						$SQLS=$SelDetailPhoto;
						$TabVal=array(':id_photo'=>$Code_Photo);
						$Conn->ExecProc($TabVal, $SQLS);
						//On récupére la photo
						$row=$Conn->sql_fetchrow();
						if(isset($row))
						{
							$TabDonnees=array();
							$TabDonnees['Code_Photo']=$row['codephoto'];
							$TabDonnees['Chemin']=$row['chemin'];
							$TabDonnees['Commentaire']=$row['commentaire'];
							$TabDonnees['Description']=$row['description'];
							$TabDonnees['Nom_Photo']=$row['nomphoto'];
							$TabDonnees['Date_Photo']=convertDate($row['datephoto'],1);
							$TabDonnees['Nom_Boitier']=$row['nomboitier'];
							$TabDonnees['Nom_Film']=$row['nomfilm'];
							$TabDonnees['Nom_Categorie']=$row['nomcat'];
							$TabDonnees['nom_Type']=$row['nomtype'];
							$TabDonnees['CheminAlbum']=$CheminAlbum;
							$moteur->assign('TabDonnees',$TabDonnees);
							$moteur->display($CheminTpl.'photo_detail.tpl');
							
						}
						else
						 $moteur->display($CheminTpl.'erreur.tpl');
						die(); 
					}
					break;
			case 2 :
					break;
			case 3 : //On ajoute un film
					if(
						isset($_POST['id_film_form'])&&
						isset($_POST['code_photo_form'])&&
						isset($_POST['Nom_Photo_Form'])&&
						isset($_POST['Date_Form'])&&
						isset($_POST['cat_form'])&&
						isset($_POST['description_form']) &&
						isset($_POST['commentaire_form'])&&
						isset($_POST['chemin_form']))
					{
						$id_film=intval($_POST['id_film_form']);
						$code_photo=htmlspecialchars($_POST['code_photo_form'], ENT_NOQUOTES, "UTF-8");
						$nom=htmlspecialchars($_POST['Nom_Photo_Form'], ENT_NOQUOTES, "UTF-8");
						$NlleDate=convertDate($_POST['Date_Form'],0);
						$categorie=intval($_POST['cat_form']);
						$desc=htmlspecialchars($_POST['description_form'], ENT_NOQUOTES, "UTF-8");
						$comm=htmlspecialchars($_POST['commentaire_form'], ENT_NOQUOTES, "UTF-8");
						$chemin=htmlspecialchars($_POST['chemin_form'], ENT_NOQUOTES, "UTF-8").'/'.$code_photo.".jpg";
						$TabVal=array(':id_film'=>$id_film,':cat'=>$categorie,':code'=>$code_photo,':nom'=>$nom,':datep'=>$NlleDate,':desc'=>$desc,':comm'=>$comm,':chemin'=>$chemin);
						$SQLS=$Add_Photo;
						//Création du chemin pour la photo
						$CheminPhoto=$CheminAlbum.$chemin;
						if(move_uploaded_file($_FILES['svg_file']['tmp_name'],$CheminPhoto))
						{
							$Result=$Conn->ExecProc($TabVal, $SQLS);;
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
		$i++;
	}
	if (isset($Tabresult))
	{
		$moteur->assign('TabFilm',$Tabresult);
	}
	//Récupération des catégories
	$SQLS=$SelListeCat;
	$ResultCat=$Conn->sql_fetch_all($SQLS);
	if(isset($ResultCat))
	{
		$moteur->assign('TabCat',$ResultCat);
	}
	//Affichage de la page
	$moteur->display($CheminTpl.'photo.tpl');
    
?>
