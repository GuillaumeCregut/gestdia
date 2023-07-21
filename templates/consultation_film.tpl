<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos -Consultation</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<link type="text/css" rel="stylesheet" href="../styles/consultation.css">
		<script src="scripts/consultation_film.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Consultation des de films.</h2>
		</header>
		<main>
			<div id="ensemble">
				<div id="gauche">
					{if isset($TabFilm)}
						<p>Liste des films : </p>
						<div id="ListeConsult">
							{foreach from=$TabFilm item=info}
								<p onclick="affiche({$info.id_film},'{$info.nom_film}','{$info.nom_boitier}','{$info.nom_type}')"class="row_list">{$info.nom_film}</p>
							{/foreach}
						</div>
					{else}
						<p>Il n'y a aucun type</p>
					{/if}	
				</div>
				<div id="droite">
					<p>Informations sur le film : </p>
					<div id="infos">
						<p>Nom du film : <span id="nom_film"></span></p>
						<p>Type de film : <span id="nom_type"></span></p>
						<p>Boitier : <span id="nom_boitier"></span></p>
					</div>
					<div id="cont_liste">
						<p>Liste des photos :</p>
						<div id="listes">
							<form name="affiche_film" id="form_affiche" action="photodetail.php" method="post">
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