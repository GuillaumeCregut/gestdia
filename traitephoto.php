<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	traitephoto.php									 *
 * Date création :	06/01/2021										 *
 * Date Modification : 06/01/2021									 *
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
	//print_r($_POST);
	if(isset($_POST['action'])&& isset($_POST['id_photo']))
	{
		$action=intval($_POST['action']);
		$id_photo=htmlspecialchars($_POST['id_photo'], ENT_NOQUOTES, "UTF-8");
		$tabVal=array(':id_photo'=>$id_photo);
		switch($action)
		{
			case 1 : //On suprime
					//On récupére le chemin de la photo
					
					//On supprime la photo sur le disque
					
					//On supprime de la base
					$SQLS=$SuppPhoto;
					$Result=$Conn->ExecProc($tabVal, $SQLS);
					$moteur->display($CheminTpl.'index.tpl'); //Changer le tpl ?
					break;
			case 2 :  //On demande la modification
					$SQLS=$SelToutPhoto;
					$Result=$Conn->ExecProc($tabVal, $SQLS);
					//Affectation des champs
					if($Result=1)
					{
						$row=$Conn->sql_fetchrow();
						$moteur->assign('TabPhoto',$row);
					}
					$AncienChemin=$CheminAlbum.$row['chemin'];
					$DatePhoto=convertDate($row['datephoto'],1);
					$moteur->assign('DatePhoto',$DatePhoto);
					//Récupération du nom du film
					$SQLS=$SelDetailPhoto;
					$tabId=array(':id_photo'=>$id_photo);
					$Result=$Conn->ExecProc($tabId, $SQLS);
					if($Result==1)
					{
						$row=$Conn->sql_fetchrow();
						$NomFilm=$row['nomfilm'];
						$moteur->assign('NomFilm',$NomFilm);
					}
					$Chemin=$CheminAlbum.$row['chemin'];
					$moteur->assign('chemin',$Chemin);
					//récupération des catégories
					$SQLS=$SelListeCat;
					$ResultCat=$Conn->sql_fetch_all($SQLS);
					if(isset($ResultCat))
					{
						$moteur->assign('TabCat',$ResultCat);
					}
					//On affiche
					$moteur->display($CheminTpl.'editphoto.tpl');
					break;
			case 3 : //On modifie
					/*print_r($_POST);
					print_r($_FILES);*/
					//On efface la photo précédente
					if(isset($_POST['nom_photo']) and
					isset($_POST['desc']) and
					isset($_POST['com']) and
					isset($_POST['categorie'] )and
					isset($_POST['nomFilm']) and
					isset($_POST['date_photo']))
					{
						$categorie=intval($_POST['categorie']);
						$Nom=htmlspecialchars($_POST['nom_photo'], ENT_NOQUOTES, "UTF-8");
						$DatePhoto=convertDate($_POST['date_photo'], 0);
						$Desc=htmlspecialchars($_POST['desc'], ENT_NOQUOTES, "UTF-8");
						$Com=htmlspecialchars($_POST['com'], ENT_NOQUOTES, "UTF-8");
						$NomFilm=htmlspecialchars($_POST['nomFilm'], ENT_NOQUOTES, "UTF-8");
						$Chemin=$NomFilm.'/'.$id_photo.'.jpg';
						$TabVal=array(':id_photo'=>$id_photo,':date_photo'=>$DatePhoto,':nom'=>$Nom,':categorie'=>$categorie,':desc'=>$Desc,':com'=>$Com,':chemin'=>$Chemin);
						$SQLS=$ModPhoto;
						$Result=$Conn->ExecProc($TabVal, $SQLS);
						if($Result==1) //Si on a bien modifié la ligne
						{
							if(isset($_FILES['svg_file'])) //on a un fichier a enregistrer
							{
								$AncienChemin=$_POST['chemin'];//On récupére l'ancien chemin
								if(is_file($AncienChemin))
								{
									unlink($AncienChemin); //Et si c'est un fichier on supprime
								}
								//On enregistre é la place le nouveau fichier
								$NouveauChemin=$CheminAlbum.$Chemin;
								if(move_uploaded_file($_FILES['svg_file']['tmp_name'],$NouveauChemin))
								{
									//On a bien sauvegardé le fichier
									$moteur->display($CheminTpl.'photo_modif_ok.tpl');
								}
							}
							else
								$moteur->display($CheminTpl.'erreur.tpl');
						}
						else
							$moteur->display($CheminTpl.'erreur.tpl');
					}
					break;
			default :
					$moteur->display($CheminTpl.'erreur.tpl');
		}
	}
	else
		$moteur->display($CheminTpl.'index.tpl');
    
?>
