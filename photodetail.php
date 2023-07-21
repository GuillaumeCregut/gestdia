<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	photodetail.php									 *
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
	if (isset($_POST['id_photo']))
	{
		$Code_Photo=htmlspecialchars($_POST['id_photo'], ENT_NOQUOTES, "UTF-8");
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
		}
	}
	$moteur->display($CheminTpl.'photo_detail.tpl');
    
?>
