function MetFocus(indice)
{
	switch(indice)
	{
		case 1: var Bouton=document.getElementById('boitier');
				break;
		case 2: var Bouton=document.getElementById('letype');
				break;
		case 3: var Bouton=document.getElementById('nomfilm');
				break;				
	}
	Bouton.checked=true;
}