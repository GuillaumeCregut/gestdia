<?php
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 * 																	 *
 * Nom de la page :	sql.inc.php										 *
 * Date création :	04/01/2021										 *
 * Date Modification : 05/01/2021									 *
 * Créateur : Guillaume Crégut										 *													
 * Version :	0.1A												 *
 * Objet et notes :													 *
 *	Gestion des stocks photos Marques								 *
 *	                              									 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
 //Liste des définitions de requêtes SQL
	//Opérations sur les marques 
	$SelListeMarques="SELECT num_marque, nommarque FROM t_marque ORDER BY nommarque";
	$AddMarque="CALL p_add_marque(:nom_marque)";
	$SuppMarque="CALL p_Supp_Marque(:Id_Marque)";
	$ModifMarque="CALL P_Mod_Marque(:Id_Marque,:nom_marque)";
	
	//Opérations sur les catégories
	$SelListeCat="SELECT numcat, nomcat, couleur FROM t_categorie ORDER BY nomcat";
	$AddCat="CALL P_Add_Cat(:Nom_Cat,:LaCouleur)";
	$SuppCat="CALL P_Supp_Cat(:Id_Cat)";
	$ModifCat="CALL P_Mod_Cat(:Id_Cat,:Nom_Cat)";
	
	//Opérations sur les boitiers
	$SelBoitierMarque="SELECT nomboitier,numboitier, nommarque FROM v_boitier_marque ORDER BY nomboitier";
	$AddBoitier="CALL P_Add_Boitier(:num_marque, :nom_boitier)";
	$SuppBoitier='CALL P_Supp_Boitier(:id_boitier)';
	$ModifBoitier='CALL P_Mod_Boitier(:id_boitier, :nouvMarque, :nouvNom)';
	
	//Opérations sur les types :
	$SelTypeMarque="SELECT numtype, nomtype,nommarque FROM V_Type_Marque";
	$AddType="CALL P_Add_Type(:num_marque,:nom_Type)";
	$SuppType="CALL P_Supp_Type(:id_type)";
	$ModifType="CALL P_Mod_Type(:id_type,:nouvMarque, :nouvNom)";
	
	//Opérations sur les films
	$SelFilm="SELECT id_film, nom_film, nom_boitier, nom_type FROM v_film_boitier_type ORDER BY nom_film";
	$SelFilmBoitierTableID="SELECT numfilm, nomfilm FROM t_film WHERE numbfilm=:id_boitier ORDER BY nomfilm";
	$SelFilmTypeTableID="SELECT numfilm, nomfilm FROM t_film WHERE numtfilm=:id_type";
	$Add_Film="CALL P_Add_Film(:id_boitier,:id_type,:nomfilm)";
	$SuppFilm='CALL P_Supp_Film(:id_film)';
	$ModifFilm='CALL P_Mod_Film(:id_film,:id_boitier,:id_type,:nouvnom)';
	$SelFilmByID='SELECT nomfilm FROM t_film WHERE numfilm=:id_film';
	//Requetes pour la recherche :
	$EnteteRechFilm="SELECT nomfilm, numfilm FROM t_film WHERE ";
	$RechBoitier="numbfilm=:id_rech";
	$RechType="numtfilm=:id_rech";
	$RechNom="nomfilm like :id_rech";
	$FinalRech=" ORDER BY nomfilm";
	//Opération sur les photos
	$Add_Photo='CALL P_Add_Photo(:id_film,:cat,:code,:nom,:datep,:desc,:comm,:chemin)';
	$SELECT_Photo_By_Film='SELECT codephoto, nomphoto, chemin FROM t_photo WHERE numfphoto=:id_Film ORDER BY codephoto';
	$SelDetailPhoto="SELECT codephoto,chemin, commentaire, description, nomphoto, datephoto, nomboitier, nomfilm, nomcat, nomtype FROM v_detail_photo WHERE codephoto=:id_photo";
	$SelPhotoFilmTableID="SELECT codephoto,nomphoto FROM t_photo WHERE numfphoto=:id_film ORDER BY codephoto";
	$SuppPhoto="CALL P_Sup_Photo(:id_photo)";
	$SelToutPhoto="SELECT codephoto,numcphoto,nomphoto,datephoto,commentaire,description,chemin FROM t_photo WHERE codephoto=:id_photo";
	$ModPhoto="CALL P_Mod_Photo(:id_photo,:categorie,:nom,:date_photo,:com,:desc,:chemin)";
	$SelListePhotoFilm='SELECT id_photo, nom,chemin, categorie FROM v_photo_idfilm_cat WHERE  id_film=:id_film';
	//Requetes pour recherche :
	$EnteteRechPhoto="SELECT Id_Photo, nomphoto, chemin, categorie FROM v_photo_rech WHERE ";
	$RechFilmPhoto="numfphoto=:id_recherche ";
	$RechCatPhoto="numcphoto=:id_recherche ";
	$RechNomPhoto="nomphoto like :id_recherche ";
	$rechDescPhoto="description like :id_recherche";
	$RechComPhoto="commentaire like :id_recherche ";
	$FinalRechPhoto="ORDER BY Id_Photo";
 ?>
 