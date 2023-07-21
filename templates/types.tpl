<!DOCTYPE HTML>
<html lang="fr">
	<head>
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<title>Gestion des photos - Types de film</title>
		<link type="text/css" rel="stylesheet" href="../styles/general.css">
		<script src="../scripts/types.js"></script>
	</head>
	<body>
		<header>
			<h1>GESTDIA</h1>
			<p>Version Web 1.0 PHP/Mysql</p>
			<h2>Gestion des types de film</h2>
		</header>
		<main>
			<div>
				<div id="conteneur_liste">
					<p>Liste des types existants  :
					<form name="Supp_Mod" method="post" action="types.php">
						<input type="hidden" name="action" value=-1" id="ActionSuppMod">
						<input type="hidden" name="id_type" id="id_type" value="-1">
						<input type="hidden" name="id_NouvMarque" value="-1" id="id_NouvMarque">
					{if isset($tabTypes)}
						<div id="liste_item">
							<ul>
							{foreach from=$tabTypes item=info}
								<li><input type="radio" name="idType" value="{$info.IdType}" onclick="surligne()">&nbsp;{$info.NomType} - {$info.NomMarque} <input type="button" value="supprimer" onclick="SuppVal({$info.IdType})"</li>
							{/foreach}
							</ul>
						</div>	
						<div id="modif_liste">
							<p>Modifier le nom<br>
							<label for="nouv_nom">Nouveau nom : </label><input type="text" name="nouv_nom" id="nouv_nom" onkeyup="surligne()"><br>
							Selectionner la marque dans le menu déroulant ci dessous dans la rubrique nouveau boitier<br>
							<input type="button" name="mod" value="modifier" onclick="ModifNom()"></p>
						</div>
						
					{else}
						<p>Aucun type</p>
					{/if}
					</form>
				</div>
				<div id="add_item">
					<form name="add_type" method="post" action="types.php">
						<input type="hidden" name="action" value="2">
						<p>Ajouter un type :</p>
						<p><label for="nom">Nom  : </label><input type="text" id="nom" name="nom_type"></p>
						<p>Marque : <select name="marque_type"  id="listetypes">
							{if isset($TabMarques)}
								{foreach from=$TabMarques item=infos2}
									<option value="{$infos2.num_marque}">{$infos2.nommarque}</option>
								{/foreach}
							{else}
							<option value="-1">-</option>
							{/if}
							</select></p>
						<p><input type="button" onclick="addtype()" value="Ajouter"></p>
					</form>
				</div>	
			</div>
		</main>
		<footer>
			<p><a href="index.php">Retour à l'accueil</a></p>
		</footer>
	</body>
</html>