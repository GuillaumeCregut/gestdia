<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos - Détail photo</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<link type="text/css" rel="stylesheet" href="../styles/photo_detail.css">
		<script src="scripts/photodetail.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Détail de la photo.</h2>
		</header>
		<main>
		{if isset($TabDonnees)}
			<p>
			<img src="{$TabDonnees.CheminAlbum}{$TabDonnees.Nom_Film}/{$TabDonnees.Code_Photo}.jpg" alt="photo"></p>
			<p>Code photo : <span class="reponse">{$TabDonnees.Code_Photo}</span> </p>
			<p>Nom de la photo : <span class="reponse">{$TabDonnees.Nom_Photo}</span></p>
			<p>Nom du film : <span class="reponse">{$TabDonnees.Nom_Film}</span></p>
			<p>Date de prise de vue : <span class="reponse">{$TabDonnees.Date_Photo}</span></p>
			<p>Catégorie : <span class="reponse">{$TabDonnees.Nom_Categorie}</span></p>
			<p>Boitier utilisé : <span class="reponse">{$TabDonnees.Nom_Boitier}</span></p>
			<p>Type de film : <span class="reponse">{$TabDonnees.nom_Type}</span></p>
			<p class="toto">Description :<br>
			<div id="description">
			{$TabDonnees.Description}
			</div></p>
			<p class="toto">Commentaires :<br>
			<div id="commentaire">
			{$TabDonnees.Commentaire}
			</div>
			</p>
			<form name="modif_photo" action="traitephoto.php" method="post">
				<input type="hidden" value="{$TabDonnees.Code_Photo}" name="id_photo">
				<input type="hidden" value="-1" name="action" id="action">
				<p><input type="button" value="Modifier" onclick="traite(2)" class="BtnPhoto"><input type="button" value="supprimer" onclick="traite(1)" class="BtnPhoto"></p>
			</form>
		{/if}
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>