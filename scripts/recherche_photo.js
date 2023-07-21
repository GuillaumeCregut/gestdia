function change(indice)
{
	switch(indice)
	{
		case 1: var Bouton=document.getElementById('film');
				break;
		case 2: var Bouton=document.getElementById('categorie');
				break;
		case 3: var Bouton=document.getElementById('nom');
				break;				
	}
	Bouton.checked=true;
}