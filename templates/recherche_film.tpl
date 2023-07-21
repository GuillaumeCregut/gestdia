<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos -</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<script src="scripts/recherche_film.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Recherche des films.</h2>
		</header>
		<main>
			<form name="search_film" action="recherche_film.php" method="post">
				<p>
					<input type="radio" name="action" id="boitier" value="1"><label for="nom_boitier">Nom du boitier : </label>
					<select name="nom_boitier"onchange="MetFocus(1)">
					{if isset($tabBoitiers)}
						{foreach from=$tabBoitiers item=boitier}
							<option value="{$boitier.IdBoitier}">{$boitier.NomBoitier}</option>
						{/foreach}
					{else}
						<option value="-1"> - </option>
					{/if}
					</select></p>
					<p><input type="radio" name="action" id="letype" value="2"><label for="nom_type">Type de film : </label>
					<select name="nom_type" onchange="MetFocus(2)">
					{if isset($tabTypes)}
						{foreach from=$tabTypes item=letype}
							<option value="{$letype.IdType}">{$letype.NomType}</option>
						{/foreach}
					{else}
						<option value="-1"> - </option>
					{/if}
					</select></p>
					<p><input type="radio" name="action" id="nomfilm" value="3"><label for="nom_film">Nom du boitier : </label><input type="text" name="nom_film" id="nom_film" onchange="MetFocus(3)"> </p>
					<p><input type="submit" value="Rechercher"></p>
			</form>	
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>