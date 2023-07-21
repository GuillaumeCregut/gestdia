function addBoitier()
{
	console.log("ajout");
	//On verifie le nom du boitier et on envoi si ok
	var NomBoitier=document.getElementById('nom_boitier').value;
	if((NomBoitier.length>20) ||(NomBoitier.length==0))
	{
		alert('Le nom est trop long ou interdit');
		return false;
	}
	var leForm=document.getElementsByTagName('form')[1];
	var toto=leForm[0].name;
	console.log(toto);
	leForm.submit();
}
function SupprimeBoitier(idBoitier)
{
	//Récupère les input
	console.log("suppression");
	var InputId=document.getElementById('id_boitier');
	InputId.value=idBoitier;
	if(confirm('Voulez vous supprimer ce boitier ?'))
	{
		var LeForm=document.getElementsByTagName('FORM')[0];
		var LAction=document.getElementById('action');
		LAction.value=0;
		LeForm.submit();
	}
}
function modifboitier()
{
	//Récupère l'id du boitier
	var IdBoitier=-1;
	var ListeChoix=document.getElementsByName('idBoitier');
	for (i=0;i<ListeChoix.length;i++)
	{
		if(ListeChoix[i].checked)
		{
			IdBoitier=ListeChoix[i].value;
		}
	}
	console.log('Id choisi : '+IdBoitier);
	if(IdBoitier==-1)
	{
		alert('Veuillez selectionner un boitier');
		return false;
	}
	var InputId=document.getElementById('id_boitier');
	InputId.value=IdBoitier;
	console.log(IdBoitier);
	//Récupère la marque dans la liste
	var ListeMarque=document.getElementsByName('marque_boitier')[0];
	var Indice=ListeMarque.selectedIndex;
	var IdMarque=ListeMarque.options[Indice].value;
	//On affecte la marque
	var Id_NouvMarque=document.getElementById('id_NouvMarque');
	Id_NouvMarque.value=IdMarque;
	console.log('Marque : '+IdMarque);
	//récupère le nouveau nom :
	var NouvNom=document.getElementById('nouvNom').value;
	console.log(NouvNom);
	if((NouvNom.length>20) || (NouvNom.length==0))
	{
		alert('Le nom est trop long ou interdit');
		return false;
	}
	if(confirm('Voulez vous modifier le boitier ?'))
	{
		LeForm=document.getElementsByTagName('FORM')[0];
		var LAction=document.getElementById('action');
		LAction.value=1;
		LeForm.submit();
	}
}
function surligne()
{
	var leselect=document.getElementById('listemarques');
	leselect.className="surligner";
	
}