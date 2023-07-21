<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos -Consultation</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<link type="text/css" rel="stylesheet" href="../styles/consultation.css">
		<script src="scripts/consultation_type.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Consultation des type de film.</h2>
		</header>
		<main>
			<div id="ensemble">
				<div id="gauche">
					{if isset($TabType)}
						<p>Liste des types :</p>
						<div id="ListeConsult">
							{foreach from=$TabType item=info}
								<p onclick="affiche({$info.numtype},'{$info.nomtype}','{$info.nommarque}')"class="row_list">{$info.nomtype}</p>
							{/foreach}
						</div>
					{else}
						<p>Il n'y a aucun type</p>
					{/if}	
				</div>
				<div id="droite">
					<p>Informations sur le type de film : </p>
					<div id="infos">
						<p>Nom du type de film : <span id="nom_type"></span></p>
						<p>Marque du type de film : <span id="nom_marque"></span></p>
					</div>
					<div id="cont_liste">
						<p>Liste des films</p>
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