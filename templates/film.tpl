<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos - Films</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<script src="scripts/film.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Gestion des films.</h2>
		</header>
		<main>
		<div>
			<div id="conteneur_liste">
				<p>Liste de films</p>
				<form name="modif_supp_film" action="film.php" method="post">
					<input type="hidden" name="id_Film_Form" id="id_Film_Form" value="-1">
					<input type="hidden" name="id_Boitier_Form" id="id_Boitier_Form" value="-1">
					<input type="hidden" name="id_Type_Form" id="id_Type_Form" value="-1">
					<input type="hidden" name="action" id="action" value="-1">
						{if isset($Tab_Film)}
							<div id="liste_item">
								<ul>
									{foreach from=$Tab_Film item=infos}
										<li><input type="radio" name="id_film" value="{$infos.id_film}">{$infos.nom_film} - {$infos.nom_boitier} - {$infos.nom_type} <input type="button" value="supprimer" onclick="suppfilm({$infos.id_film})"></li>
									{/foreach}
								</ul>
						{else}
							<p>Aucun film</p>
						{/if}
							</div>
					<div id="modif_liste">
						<p><label for="Nouv_Nom_Form">Nouveau nom : </label><input type="text" name="Nouv_Nom_Form" id="Nouv_Nom_Form" onkeyup="surligne()"><br>
						Veuillez sélectionner le boitier et le film dans la liste ci dessous<br>
						<input type="button" value="modifier" onclick="modifFilm()"></p>
					</div>
				</form>	
			</div>	
			<div id="add_item">
				<form name="Add_Film" method="post" action="film.php">
					<input type="hidden" name="action" value="3">
					<p>Ajouter un film<br>
						<label for="nom_Film_Form">Nom du film : </label><input type="text" name="nom_Film_Form" id="nom_Film_Form"></p>
					<div>
						<p>Boitier utilisé :<br>
						<select name="Boitier_Form" id="Boitier_Fom">
							{if isset($tabBoitiers)}
								{foreach from=$tabBoitiers item=info_boitier}
									<option value="{$info_boitier.IdBoitier}">{$info_boitier.NomBoitier}</option>
								{/foreach}
							{else}
								<option value="-1"> - </option>
							{/if}	
						</select>
					</div>	
					<div>
						<p>Type de film :<br>
						<select name="Type_Form" id="Type_Fom">
							{if isset($tabTypes)}
								{foreach from=$tabTypes item=info_type}
									<option value="{$info_type.IdType}">{$info_type.NomType}</option>
								{/foreach}
							{else}
								<option value="-1"> - </option>
							{/if}	
						</select>
					</div>	
					<p>	<input type="button" value="Ajouter" onclick="ajoutefilm()"></p>
				</form>
			</div>
		</div>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>