<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<link type="text/css" rel="stylesheet" href="../styles/index.css">
		<script src="scripts/index.js"></script>
	</head>
	<body>
		<h1>GESTDIA</h1>
		<p>Version Web 1.0 PHP/Mysql</p>
		<h2>Logiciel de gestion et de consultation des diapositives.</h2>
		<div id="menu">
			<div class="sousmenu">
				<p class="titre_menu" onmouseover="Voir('num1')" onmouseleave="Cacher('num1')">Gestion</p>
				<div id="num1" class="contMenu">
					<ul onmouseover="Voir('num1')" onmouseleave="Cacher('num1')">
						<li><a href="marque.php">marque</a></li>
						<li><a href="boitier.php">Boitier</a></li>
						<li><a href="types.php">Type</a></li>
						<li><a href="film.php">Film</a></li>
						<li><a href="categorie.php">Catégorie</a></li>
						<li><a href="photo.php">Photo</a>
					</ul>
				</div>
			</div>
			<div class="sousmenu">
				<p class="titre_menu" onmouseover="Voir('num2')" onmouseleave="Cacher('num2')">Consultation</p>
				<div id="num2" class="contMenu">
					<ul onmouseover="Voir('num2')" onmouseleave="Cacher('num2')">
						<li><a href="consultation_boitier.php">Boitier</a></li>
						<li><a href="consultation_film.php">Film</a></li>
						<li><a href="consultation_type.php">Type de film</a></li>
					</ul>
				</div>
			</div>
			<div class="sousmenu">
				<p class="titre_menu"  onmouseover="Voir('num3')" onmouseleave="Cacher('num3')">Recherche</p>
				<div id="num3" class="contMenu">
					<ul onmouseover="Voir('num3')" onmouseleave="Cacher('num3')">
						<li><a href="recherche_film.php">Film</a></li>
						<li><a href="recherche_photo.php">Photo</a></li>
					</ul>
				</div>
			</div>
			<div class="sousmenu">
				<p class="titre_menu"><a href="configuration.php">Configuration</a></p>
			</div>
		</div>
	</body>
</html>