function addmarque()
{
	console.log('on y est');
	var nouv_nom=document.getElementById('nom').value;
	console.log(nouv_nom);
	//Si la taille dépasse la longueur de la bdd
	if ((nouv_nom.length>20) || (nouv_nom.length==0))
	{
		alert('Le nom saisi est trop long ou invalide');
		return false;
	}
	var formulaire=document.getElementsByTagName('FORM')[1];
	formulaire.submit();
}
function SuppVal(NumVal)
{
	console.log("On supprime");
	if(confirm('Supprimer cette marque ?'))
	{
		//On affecte les différents variables pour le PHP
		var laction=document.getElementById('ActionSuppMod');
		console.log(laction.value);
		laction.value=0;
		var LeId=document.getElementById('num_marque');
		LeId.value=NumVal;
		var formulaire=document.getElementsByTagName('FORM')[0];
		formulaire.submit();
	}
}
//Fonction surligne qui met en évidence le nouveau de la marque
function surligne()
{
	
}

//Fonction de modification du nom
function ModifNom()
{
	console.log('Modifie');
	//récupération de l'ID
	var TabChoix=document.getElementsByName('id_marque');
	var Id_Marque;
	for (i=0;i<TabChoix.length;i++)
	{
		if (TabChoix[i].checked)
		{
			Id_Marque=TabChoix[i].value;
		}
	}
	console.log(Id_Marque);
	//Récupération du nouveau nom
	var Nouveau_Nom=document.getElementById('nouv_nom').value;
	if ((Nouveau_Nom.length>20) || (Nouveau_Nom.length==0))
	{
		alert('Le nom saisi est trop long ou invalide');
		return false;
	}
	if(confirm('Voulez vous remplacer cette marque par : '+Nouveau_Nom+' ?'))
	{
		var laction=document.getElementById('ActionSuppMod');
		console.log(laction.value);
		laction.value=1;
		var formulaire=document.getElementsByTagName('FORM')[0];
		formulaire.submit();
	}
}