function addtype()
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
	if(confirm('Supprimer ce type ?'))
	{
		//On affecte les différents variables pour le PHP
		var laction=document.getElementById('ActionSuppMod');
		console.log(laction.value);
		laction.value=0;
		var LeId=document.getElementById('id_type');
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
	var TabChoix=document.getElementsByName('idType');
	var Id_Type=-1;
	for (i=0;i<TabChoix.length;i++)
	{
		if (TabChoix[i].checked)
		{
			Id_Type=TabChoix[i].value;
		}
	}
	console.log(Id_Type);
	if(Id_Type==-1)
	{
		alert('Veuillez selectionner un type.');
		return false;
	}
	//Récupération du nouveau nom
	var Nouveau_Nom=document.getElementById('nouv_nom').value;
	if ((Nouveau_Nom.length>20) || (Nouveau_Nom.length==0))
	{
		alert('Le nom saisi est trop long ou invalide');
		return false;
	}
	if(confirm('Voulez vous remplacer ce type par : '+Nouveau_Nom+' ?'))
	{
		var laction=document.getElementById('ActionSuppMod');
		console.log(laction.value);
		laction.value=1;
		//On set la valeur pour le php de l'ID type
		var LeId=document.getElementById('id_type');
		LeId.value=Id_Type;
		//On récupère la valeur de la marque sélectionnée.
		var ListeMarque=document.getElementsByName('marque_type')[0];
		var Indice=ListeMarque.selectedIndex;
		var IdMarque=ListeMarque.options[Indice].value;
		//On set pour PHP le ID nouvelle marque
		var nouvMarque=document.getElementById('id_NouvMarque');
		nouvMarque.value=IdMarque;
		console.log('On envoie : ID type : '+Id_Type+', Nouveau Nom : '+Nouveau_Nom+', Nouvelle marque : '+IdMarque);
		var formulaire=document.getElementsByTagName('FORM')[0];
		formulaire.submit();
	}
}
function surligne()
{
	var leselect=document.getElementById('listetypes');
	leselect.className="surligner";
}