<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos - Catégorie</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<script src="../scripts/categorie.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Gestion des types de catégories</h2>
		</header>
		<main>
			<div>
				<div id="conteneur_liste">
					<p>Liste des catégories existantes  :</p>
					<form name="Supp_Mod" method="post" action="categorie.php">
					{if isset($tabcat)}
						<input type="hidden" name="action" value=-1" id="ActionSuppMod">
						<input type="hidden" name="num_cat" id="num_cat" value="-1">
						<div id="liste_item">
							<ul>
							{foreach from=$tabcat item=info}
								<li><input type="radio" name="id_cat" value="{$info.numcat}" onclick="surligne()">&nbsp;{$info.nomcat} <input type="button" value="supprimer" onclick="SuppVal({$info.numcat})"</li>
							{/foreach}
							</ul>
						</div>
						<div id="modif_liste">
							<p>Modifier le nom</p>
							<p><label for="nouv_nom">Nouveau nom : </label><input type="text" name="nouv_nom" id="nouv_nom"></p>
							<p><input type="button" name="mod" value="modifier" onclick="ModifNom()"></p>
						</div>
					{else}
						<p>Aucune catégories</p>
					{/if}
					</form>
				</div>	
				<div id="add_item">
					<form name="add_type" method="post" action="categorie.php">
						<input type="hidden" name="action" value="2">
						<p>Ajouter une catégorie :</p>
						<p><label for="nom">Nom  : </label><input type="text" id="nom" name="nom_cat"></p>
						<p><input type="button" onclick="AddCat()" value="Ajouter"></p>
					</form>
				</div>	
			</div>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>