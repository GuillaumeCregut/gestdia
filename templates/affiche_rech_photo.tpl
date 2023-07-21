<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos -</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<link type="text/css" rel="stylesheet" href="../styles/voir_film.css">
		<link type="text/css" rel="stylesheet" href="../styles/categorie_css.php">
		<script src="scripts/voir_film.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Résultat de la recherche</h2>
		</header>
		<main>
		<p>Legende :</p>
		<div id="legende">
		{if isset($TabCategorie)}
			{foreach from=$TabCategorie item=categorie}
				<p><span class="{$categorie.nomcat} plegende">{$categorie.nomcat}</span></p>
			{/foreach}
		{/if}
		</div>
		<table>
			{if isset($TabPhoto)}
			<form name="voirphoto" id=="formVoir" action="photodetail.php" method="post">
			<input type="hidden" name="id_photo" value="-1" id="idPhoto">
				{foreach from=$TabPhoto item=info}
				{if $info@first}
					<tr>
				{/if}
				
						<td class="{$info.categorie}" onclick="affiche('{$info.Id_Photo}')">
							<p><img src="{$info.chemin}" alt="{$info.nomphoto}" class="laphoto"></p>
							<p>Nom : {$info.nomphoto}<br>
							Code : {$info.Id_Photo}</p>
						</td>
					{if $info@iteration is div by 6}
						</tr>
						<tr>
					{/if}
				{if $info@last}
					</tr>
				{/if}	
				{/foreach}
			{else}
				<tr><td>Aucune photo trouvée</td></tr>
			{/if}	
		</table>
		</main>
		<footer>
			<p><a href="recherche_photo.php">Retour à la recherche</a></p>
		</footer>
	</body>
</html>