<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos -Consultation</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<link type="text/css" rel="stylesheet" href="../styles/consultation.css">
		<script src="scripts/consultation_boitier.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Consultation des boitiers.</h2>
		</header>
		<main>
			<div id="ensemble">
				<div id="gauche">
					{if isset($TabBoitier)}
						<p>Liste des boitiers :</p>
						<div id="ListeConsult">
							{foreach from=$TabBoitier item=info}
								<p onclick="affiche({$info.numboitier},'{$info.nommarque}','{$info.nomboitier}')"class="row_list">{$info.nomboitier}</p>
							{/foreach}
						</div>
					{else}
						<p>Il n'y a aucun boitier</p>
					{/if}	
				</div>
				<div id="droite">
					<p>Informations sur le boitier : </p>
					<div id="infos">	
						<p>Nom du boitier : <span id="nom_boitier"></span></p>
						<p>Marque du boitier : <span id="nom_marque"></span></p>
					</div>
					<div id="cont_liste">
						<p>Liste des films :</p>
						<div id="listes">
							<form name="affiche_film" id="form_affiche" action="voir_film.php" method="post">
							</form>
						</div>	
					</div>	
				</div>	
			</div>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>