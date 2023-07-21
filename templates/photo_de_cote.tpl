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
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Gestion des photos.</h2>
		</header>
		<main>
		<form name="add_photo" method="post" action="photo.php">
		<input type="hidden" name="action" id="action_form" value="3">
		<input type="hidden" name="id_film_form" id="id_film_form" value="-1">
		<input type="hidden" name="code_photo_form" id="code_photo_form" value="-1">
		<input type="hidden" name="chemin_form" id="chemin_form" value="-1">
			<div id="listefilm">
				<p>Liste des films<br>
					<select name="liste_film">
						{if isset($TabFilm)}
							{foreach from=$TabFilm item=info}
								<option value="{$info.id_film}">{$info.nom_film}</option>
							{/foreach}
						{else}
							<option value="-1"> - </option>
						{/if}
					</select>	<br>
					<input type="button" value="voir les photos" onclick="voirphoto()"></p>
			</div>
			<div>
				<div id="ConteneurPhoto">
					<ul id="listephoto">
					
					</ul>
				</div>
			</div>
			<div id="divNewPhoto">
				Ajouter une photo au film : <span id="NomFilmSelect"></span><br>
					<label for="id_photo">Numéro de la photo : </label>
					<select name="NumPhoto" id="id_photo" onchange="setcode(this)">
					<option value="-1"> - </option>
					{for $i=1 to 37}
						<option value="{$i}">{$i}</option>
					{/for}
					</select><br>
					Code photo :<span id="RacineNom"></span><br>
					<div id="bloc_page">
						<div id="dropfile">Glisser image depuis le PC</div>
						<SCRIPT TYPE="text/javascript">
						$(function() {

							//Initialiser tous les évènements liés au drag et au drop, afin d’éviter la propagation des évènements.
							//https://api.jquery.com/on/
							$(document).on('dragenter', '#dropfile', function() {
										$(this).css('border', '3px dashed red');
										return false;
							});
							 
							$(document).on('dragover', '#dropfile', function(e){
										e.preventDefault();
										e.stopPropagation();
										$(this).css('border', '3px dashed red');
										return false;
							});
							 
							$(document).on('dragleave', '#dropfile', function(e) {
										e.preventDefault();
										e.stopPropagation();
										$(this).css('border', '3px dashed #BBBBBB');
										return false;
							});				
			
			
			
							//Traitement de l’événement drop, qui va lancer toutes les actions à faire au moment où on va lâcher notre image dans la dropbox.
							$(document).on('drop', '#dropfile', function(e) {
										if(e.originalEvent.dataTransfer){
												   if(e.originalEvent.dataTransfer.files.length) {
															   // Stop the propagation of the event
															   e.preventDefault();
															   e.stopPropagation();
															   $(this).css('border', '3px dashed green');
															   // Main function to upload
															   upload(e.originalEvent.dataTransfer.files);
												   }  
										}
										else {
												   $(this).css('border', '3px dashed #BBBBBB');
										}
										return false;
							});	
			
							//La fonction principale pour l’upload de l'image
							//Elle commence par effectuer un contrôle sur le type de fichier, puis elle utilise FileReader, un objet d’une API disponible avec HTML5 : File.
							//https://developer.mozilla.org/fr/docs/Web/API/FileReader/FileReader
							
							//Cet objet va permettre de lire directement le fichier depuis le navigateur.
							//La chose importante à comprendre avec la lecture de fichier depuis le navigateur, c’est que le traitement est asynchrone.
							//C’est normal, le temps que la lecture de l’image se fasse, le script continu de tourner.
							//Donc lorsque l’image sera chargée l'évènement reader.onload va se déclencher et lancer l’exécution de la fonction handleReaderLoad
							function upload(files) {
										var f = files[0] ;
							 
										// Only process image files.
										if (!f.type.match('image/jpeg')) {
											alert('The file must be a jpeg image');
											return false ;
										}
										var reader = new FileReader(); //Objet d’une API disponible avec HTML5 : File.
							 
										// Quand l'image sera chargé, on déclenchera cette fonction
										reader.onload = handleReaderLoad;
							 
										//Lecture du fichier. Donc quand cela sera terminé, cela reader.onload qui appelera la fonction handleReaderLoad
										//La méthode readAsDataURL permet de lire le contenu de l’objet  Blob ou File spécifié. À la fin de l’opération de lecture, la propriété readyState renvoie l’état DONE, et l’évènement loadend se déclenche. À ce moment-là, l’attribut result contient les données dans une URL représentant les données du fichier sous forme de chaîne encodée en base64
										reader.readAsDataURL(f);            
							}	

							function handleReaderLoad(evt) {
										var pic = {}; //On déclare un nouvel objet. Cf https://api.jquery.com/Types/
										pic.file = evt.target.result.split(',')[1];
							 
										var str = jQuery.param(pic); //jQuery.param transforme l'image en une ligne de data que l'on peut poster dans une URL
										//Ajout Guillaume
										var toto=new FormData();
										toto.append('chemin_form','1234');
										toto.append('file',str);
										
										
										
										
										//Fin Ajout
										$.ajax({
												   type: 'POST',
												   url: 'pagephpcible.php',
												   enctype: 'multipart/form-data', //ajout
												   //data: str,
												   data: toto,  //Modif
												   success: function(response) {
															   console.log( "Image postée");
												   },
													error: function( response ) {
														console.log('Erreur pour poster l image : '+ response.status + " " + response.statusText);
													}										   
										});
							}	
			
						
						});		  
					</SCRIPT>
					</div>
					<label for="photonom">Nom de la photo : </label><input type="text" name="Nom_Photo_Form" id="photonom"><br>
					<label for="date_photo">Date de prise de vue : </label><input name="Date_Form" id="date_photo" type="text" onclick="ds_sh(this);"><br>
					<!-- Tableau obligatoire ! C'est lui qui contiendra le calendrier ! -->
					<table class="ds_box"  id="ds_conclass" style="display: none;">
						<tr>
							<td id="ds_calclass"></td>
						</tr>
					</table>
					<label for="cat_photo">Catégorie de la photo</label>
					<select name="cat_form" id="cat_photo">
						{if isset($TabCat)}
							{foreach from=$TabCat item=info_cat}
								<option value="{$info_cat.numcat}">{$info_cat.nomcat}</option>
							{/foreach}
						{else}
							<option value="-1"> - </option>
						{/if}
					</select><br>
					<label for="description_photo">Description </label><textarea name="description_form" id="description_photo"></textarea><br>
					<label for="commentaire_photo">Commentaire </label><textarea name="commentaire_form" id="commentaire_photo"></textarea><br>
					<input type="button" value="Ajouter" onclick="ajoutPhoto()">
				
			</div>
		</form>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>