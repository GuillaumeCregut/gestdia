<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos -</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<link type="text/css" rel="stylesheet" href="../styles/editphoto.css">
		<link type="text/css" rel="stylesheet" href="../styles/design.css">
		<script src="scripts/jquery.js"></script>
		<script src="scripts/editphoto.js"></script>
		<script src="scripts/calendrier.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Modification de la photo</h2>
		</header>
		<main>
			<form name="modif_photo" action="traitephoto.php" method="post" id="svg_f1" enctype="multipart/form-data">
				<input type="hidden" name="action" value="3">
				{if isset($TabPhoto)}
				<input type="hidden" name="id_photo" value="{$TabPhoto.codephoto}">
				<input type="hidden" name="nomFilm" value="{$NomFilm}">
				<input type="hidden" name="chemin" value="{$chemin}">
				<p>Cette photo fait partie du film : {$NomFilm}</p>
				<p><img src="{$chemin}" alt="photo"></p>
				<div id="cont2">
						<div id="dash2">
						Glisser la photo ici
							<input type="file" id="inputImg" name="svg_file" />
							<SCRIPT TYPE="text/javascript">
								//détection d'un event sur l'input du formulaire
								$("#inputImg").on("change", function(e) {

								//création d'un objet FileReader
								var reader = new FileReader();

								//déclenchement de l'affichage du fichier dans #tt
								reader.onload = function (event) {
								$("#tt").html("<img src='"+event.target.result+"' style='width:150px;height:100px;margin-left:3px;'/>");
								}

								//lecture du fichier FileList envoyé par le formulaire
								reader.readAsDataURL(e.target.files[0]);

								});
							</SCRIPT>
							<div id="tt"></div>
						</div>
						
					</div>
				<p><label for="nom_photo">Nom de la photo</label><input type="text" name="nom_photo" id="nom_photo" value="{$TabPhoto.nomphoto}"><br>
					<label for="date_photo">Date de prise de vue</label><input type="text" name="date_photo" id="date_photo" value="{$DatePhoto}" onclick="ds_sh(this);">
					<!-- Tableau obligatoire ! C'est lui qui contiendra le calendrier ! -->
					<table class="ds_box"  id="ds_conclass" style="display: none;">
						<tr>
							<td id="ds_calclass"></td>
						</tr>
					</table><br>
					
					<label for="">Description : </label><textarea name="desc" id="">{$TabPhoto.description}</textarea><br>
					<label for="">Commentaire : </label><textarea name="com" id="">{$TabPhoto.commentaire}</textarea><br>
					<label for="liste_cat">Catégorie</label>
					<select name="categorie" id="liste_cat">
						{if isset($TabCat)}
							{foreach from=$TabCat item=info}
								<option value="{$info.numcat}"{if $info.numcat==$TabPhoto.numcphoto} selected{/if}>{$info.nomcat}</option>
							{/foreach}
						{else}
							<option value="-1"> - </option>
						{/if}	
					</select>
				</p>
				<p><input type="button" value="Enregistrer" onclick="envoi()"></p>
				{else}
					<p>Il n'y a aucune photo à éditer</p>
				{/if}
			</form>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>