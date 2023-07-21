<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos - Boitiers</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<script src="scripts/boitier.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Gestion des boitiers.</h2>
		</header>
		<main>
			<div>
				<div id="conteneur_liste">
					<p>Liste des boitiers</p>
					<form name="Add_Supp_Form" action="boitier.php" method="post">
						{if isset($tabBoitiers)}
							<input type="hidden" name="action" value="-1" id="action">
							<input type="hidden" name="id_boitier" value="-1" id="id_boitier">
							<input type="hidden" name="id_NouvMarque" value="-1" id="id_NouvMarque">
							<div id="liste_item">
								<ul>
								{foreach from=$tabBoitiers item=infos}
									<li><input type="radio" name="idBoitier" value="{$infos.IdBoitier}">{$infos.NomBoitier} - {$infos.NomMarque} <input type="button" value="Supprimer" onclick="SupprimeBoitier({$infos.IdBoitier})"></li>
										
								{/foreach}
								</ul>
							</div>
							<div id="modif_liste">
								<p><label for="nouvNom">Nouveau nom : </label><input type="text" name="nouvNom" id="nouvNom" onkeyup="surligne()"><br>
								Selectionner la marque dans le menu déroulant ci dessous dans la rubrique nouveau boitier<br>
								<input type="button" value="Modifier" onclick="modifboitier()"></p>
							</div>
						{else}
							<p>Il n'y a aucun boitier</p>
						{/if}
						
					</form>
				</div>	
				<div id="add_item">
					<form name="add_boitier" method="post" action="boitier.php">
					<input type="hidden" name="action" value="2">
					<p>Ajouter un boitier<br>
					<label for="nom_boitier">Nom du boitier : </label><input type="text" name="nom_boitier" id="nom_boitier"></p>
					<p><select name="marque_boitier" id="listemarques">
					{if isset($TabMarques)}
						{foreach from=$TabMarques item=infos2}
							<option value="{$infos2.num_marque}">{$infos2.nommarque}</option>
						{/foreach}
					{else}
					<option value="-1">-</option>
					{/if}
					</select></p>
					<p><input type="button" name="Ajouter" value="ajouter" onclick="addBoitier()">
					</p>
					</form>
				</div>
			</div>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>