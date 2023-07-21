<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos -</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Affichage de la recherche des films</h2>
		</header>
		<main>
			<p>Résultat de la recherche : </p>
			{if isset($TabFilm)}
			<div id="ResRech">
				<form name="affiche_film" action="voir_film.php" method="post">
					{foreach from=$TabFilm item=info}
						<p><input type="radio" name="id_film" value="{$info.id_film}">{$info.nom_film}</p>
					{/foreach}	
					<input type="submit" value="Voir le film">
				</form>
			</div>	
			{else}
				<p>Il n'y a aucun film</p>
			{/if}
		</main>
		<footer>
			<p><a href="recherche_film.php">Retour à la recherche</a></p>
		</footer>
	</body>
</html>