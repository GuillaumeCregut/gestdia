function traite(action)
{
	var LAction=document.getElementById('action');
	LAction.value=action;
	formulaire=document.getElementsByTagName('FORM')[0];
	if(action==1)
	{
		if(confirm('Voulez vous supprimer cette photo ?'))
		{
			formulaire.submit();
		}
	}
	else
	{
		formulaire.submit();
	}
}