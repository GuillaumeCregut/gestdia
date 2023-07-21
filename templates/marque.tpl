<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<script src="../scripts/marque.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Gestion des marques</h2>
		</header>
		<main>
		<div>
			<div id="conteneur_liste">
			<p>Liste des marques existantes  :</p>
				<form name="Supp_Mod" method="post" action="marque.php">
				{if isset($tabmarque)}
					<input type="hidden" name="action" value=-1" id="ActionSuppMod">
					<input type="hidden" name="num_marque" id="num_marque" value="-1">
					<div id="liste_item">
						<ul>
						{foreach from=$tabmarque item=info}
							<li><input type="radio" name="id_marque" value="{$info.num_marque}" onclick="surligne()">&nbsp;{$info.nommarque} <input type="button" value="supprimer" onclick="SuppVal({$info.num_marque})"</li>
						{/foreach}
						</ul>
					</div>
					<div id="modif_liste">
						<p>Modifier le nom</p>
						<p><label for="nouv_nom">Nouveau nom : </label><input type="text" name="nouv_nom" id="nouv_nom"></p>
						<p><input type="button" name="mod" value="modifier" onclick="ModifNom()"></p>
					</div>	
				{else}
					<p>Aucune marque</p>
				{/if}
				</form>
			</div>
			<div id="add_item">
				<form name="add_marque" method="post" action="marque.php">
					<input type="hidden" name="action" value="2">
					<p>Ajouter une marque :</p>
					<p><label for="nom">Nom de la marque : </label><input type="text" id="nom" name="nom_marque"></p>
					<p><input type="button" onclick="addmarque()" value="Ajouter" class="bouton_general"></p>
				</form>
			</div>
		</div>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>