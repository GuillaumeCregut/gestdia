function ajoutefilm()
{
	//Vérification de la longueur du nom
	var LeNom=document.getElementById('nom_Film_Form').value;
	if(LeNom.length>20 ||LeNom.length==0)
	{
		alert('Le nom est trop long ou non conforme');
		return false;
	}
	Leform=document.getElementsByTagName('FORM')[1];
	Leform.submit();
}
function suppfilm(id_film)
{
	LAction=document.getElementById('action');
	LAction.value=1;
	if (confirm('Voulez vous supprimer ce film ?'))
	{
		Leform=document.getElementsByTagName('FORM')[0];
		LeId=document.getElementById('id_Film_Form');
		LeId.value=id_film;
		Leform.submit();
	}
}
function modifFilm()
{
	//On verifie si on a bien selectionner un film
	var LeFilm=-1;
	var ListeFilm=document.getElementsByName('id_film');
	for (i=0;i<ListeFilm.length;i++)
	{
		if(ListeFilm[i].checked)
		{
			LeFilm=ListeFilm[i].value;
		}
	}
	if(LeFilm==-1)
	{
		alert('Veuillez selectionner un film');
		return false;
	}
	//On verifie la longueur du nom
	var LeNom=document.getElementById('Nouv_Nom_Form').value;
	if(LeNom.length>20 ||LeNom.length==0)
	{
		alert('Le nom est trop long ou non conforme');
		return false;
	}
	//On change l'action
	var LAction=document.getElementById('action');
	LAction.value=2;
	//On set la valeur id du film 
	var LeId=document.getElementById('id_Film_Form');
	LeId.value=LeFilm;
	//On récupère l'ID du boitier :
	var ListeBoitier=document.getElementsByName('Boitier_Form')[0];
	var IndiceBoitier=ListeBoitier.selectedIndex;
	var IdBoitier=ListeBoitier.options[IndiceBoitier].value;
	//On le set pour PHP
	var LeBoitier=document.getElementById('id_Boitier_Form');
	LeBoitier.value=IdBoitier;
	//De même pour le type de film
	var ListeTypes=document.getElementsByName('Type_Form')[0];
	var IndiceType=ListeTypes.selectedIndex;
	var IdType=ListeTypes.options[IndiceType].value;
	//On le set pour PHP
	var LeType=document.getElementById('id_Type_Form');
	LeType.value=IdType;
	if (confirm('Voulez vous modifier ce film ?'))
	{
		Leform=document.getElementsByTagName('FORM')[0];
		Leform.submit();
	}
}
function surligne()
{
	var leselectBoitier=document.getElementById('Boitier_Fom');
	var leselectType=document.getElementById('Type_Fom');
	leselectBoitier.className="surligner";
	leselectType.className="surligner";
}