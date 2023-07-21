function affiche(indice)
{
	var Formulaire=document.getElementsByTagName('FORM')[0];
	var IdPhoto=document.getElementById('idPhoto');
	console.log(IdPhoto.value);
	IdPhoto.value=indice;
	Formulaire.submit();
}