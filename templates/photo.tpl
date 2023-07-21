<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos - Photos</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<link type="text/css" rel="stylesheet" href="../styles/photo.css">
		<link type="text/css" rel="stylesheet" href="../styles/design.css">
		<script src="scripts/photo.js"></script>
		<script src="scripts/jquery.js"></script>
		<script src="scripts/calendrier.js"></script>
	</head>
	<body onload="init()">
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Gestion des photos.</h2>
		</header>
		<main>
		<form name="add_photo" method="post" action="photo.php" id="svg_f1" enctype="multipart/form-data">
		<input type="hidden" name="action" id="action_form" value="3">
		<input type="hidden" name="id_film_form" id="id_film_form" value="-1">
		<input type="hidden" name="code_photo_form" id="code_photo_form" value="-1">
		<input type="hidden" name="chemin_form" id="chemin_form" value="-1">
			<div id="listefilm">
				<p>Liste des films</p>
					<p><select name="liste_film" onchange="changeNomFilm(this)">
						{if isset($TabFilm)}
							{foreach from=$TabFilm item=info}
								<option value="{$info.id_film}">{$info.nom_film}</option>
							{/foreach}
						{else}
							<option value="-1"> - </option>
						{/if}
					</select>	</p>
					<p><input type="button" value="voir les photos" onclick="voirphoto()"></p>
					<div id="ConteneurPhoto">
						<ul id="listephoto">
						</ul>
					</div>
			</div>
			<div id="divNewPhoto">
				<p>Ajouter une photo au film : <span id="NomFilmSelect"></span></p>
					<p><label for="id_photo">Numéro de la photo : </label>
					<select name="NumPhoto" id="id_photo" onclick="setcode(this)">
					<option value="-1"> - </option>
					{for $i=1 to 37}
						<option value="{$i}">{$i}</option>
					{/for}
					</select></p>
					<p>Code photo :<span id="RacineNom"></span></p>
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
					<p><label for="photonom">Nom de la photo : </label><input type="text" name="Nom_Photo_Form" id="photonom"></p>
					<p><label for="date_photo">Date de prise de vue : </label><input name="Date_Form" id="date_photo" type="text" onclick="ds_sh(this);"></p>
					<!-- Tableau obligatoire ! C'est lui qui contiendra le calendrier ! -->
					<table class="ds_box"  id="ds_conclass" style="display: none;">
						<tr>
							<td id="ds_calclass"></td>
						</tr>
					</table>
					<p><label for="cat_photo">Catégorie de la photo</label>
					<select name="cat_form" id="cat_photo">
						{if isset($TabCat)}
							{foreach from=$TabCat item=info_cat}
								<option value="{$info_cat.numcat}">{$info_cat.nomcat}</option>
							{/foreach}
						{else}
							<option value="-1"> - </option>
						{/if}
					</select></p>
					<div id="CommDesc">
						<p><label for="description_photo">Description </label><textarea name="description_form" id="description_photo"></textarea></p>
						<p><label for="commentaire_photo">Commentaire </label><textarea name="commentaire_form" id="commentaire_photo"></textarea></p>
					</div>	
					<p><input type="button" value="Ajouter" onclick="ajoutPhoto()"></p>
			</div>
		</form>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>