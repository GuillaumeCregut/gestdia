<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos -</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<script src="scripts/recherche_photo.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Recherche de photo</h2>
		</header>
		<main>
			<form name="cherchephoto" action="recherche_photo.php" method="post">
			<p><input type="radio" name="action" value="1" id="film"><label for=id="film">Film : </label>
				<select onchange="change(1)" name="id_film">
					<option value=-"1"> - </option>
				{if isset($Tab_Film)}
					{foreach from=$Tab_Film item=film}
						<option value="{$film.id_film}">{$film.nom_film}</option>
					{/foreach}
				{else}
					<option value=-"1"> - </option>
				{/if}
				</select></p>
				<p><input type="radio" name="action" value="2" id="categorie"><label for=id="categorie">Catégorie :</label>
				<select onchange="change(2)"  name="id_cat">
					<option value=-"1"> - </option>
				{if isset($tabcat)}
					{foreach from=$tabcat item=categorie}
						<option value="{$categorie.numcat}">{$categorie.nomcat}</option>
					{/foreach}
				{else}
					<option value=-"1"> - </option>
				{/if}
				</select></p>
				<div id="rechcritere">
					<p><input type="radio" name="action" value="3" id="nom"><label for=id="nom">nom de la photo contient</label></p>
					<p><input type="radio" name="action" value="4" id="desc"><label for=id="desc">La description de la photo contient</label></p>
					<p><input type="radio" name="action" value="5" id="com"><label for=id="com">Le commentaire de la photo contient</label></p>
					<p><input type="text" name="texte" oninput="change(3)"></p>
				</div>
				<p><input type="submit" value="Rechercher"></p>	
			</form>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>