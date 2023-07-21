function getXhr()
{
	var xhr = null; 
	if(window.XMLHttpRequest) // Firefox et autres
	   xhr = new XMLHttpRequest(); 
	else if(window.ActiveXObject){ // Internet Explorer 
	   try {
                xhr = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                xhr = new ActiveXObject("Microsoft.XMLHTTP");
            }
	}
	else { // XMLHttpRequest non supporté par le navigateur 
	   alert("Votre navigateur ne supporte pas les objets XMLHTTPRequest..."); 
	   xhr = false; 
	}
	return xhr;
}
function affiche(indice,marque,boitier)
{
	var LabelNom=document.getElementById('nom_boitier');
	LabelNom.innerHTML=boitier;
	var LabelMarque=document.getElementById('nom_marque');
	LabelMarque.innerHTML=marque;
	//On va remplir le formulaire, on le vide avant
	var formulaire=document.getElementById('form_affiche');
	while(formulaire.hasChildNodes())
	{
		formulaire.removeChild(formulaire.firstChild);
	}
	//On envoie la requête ajax pour récupérer les films du boitier
	var xhr=getXhr();
	xhr.onreadystatechange=function()
	{
		if(xhr.readyState==4 && xhr.status==200)
		{
			//Fonction de traitement de l'information
			//On utilise xhr.responseText
			reponse=xhr.responseText;
			//On traduit le json
			tabRetour=JSON.parse(reponse);
			
			for(i=0;i<tabRetour.length;i++)
			{
				//On créé les entrées dans le formulaire
				var LeLabel=document.createElement("label");
				LeLabel.style.display="block";
				var TitreLabel=document.createTextNode(tabRetour[i].nom_film);
				var NewRadio=document.createElement("input");
				NewRadio.type="radio";
				NewRadio.value=tabRetour[i].id_film;
				NewRadio.name="id_film";
				NewRadio.className="VoirDetail";
				LeLabel.appendChild(NewRadio);
				LeLabel.appendChild(TitreLabel);
				formulaire.appendChild(LeLabel);	
			}
			var DivListeStyle=document.getElementById('listes').style;
			if(tabRetour.length>0)
			{
				var Liste=formulaire.firstChild;
				var RadioList=Liste.firstChild;
				RadioList.checked=true;
				console.log(RadioList);
				var NewButton=document.createElement('input');
				NewButton.type="submit";
				NewButton.value="Voir le film";
				NewButton.className="VoirDetail";
				formulaire.appendChild(NewButton);	
				DivListeStyle.display='block';
			}
			else
			{
				DivListeStyle.display='none';
			}
		}
		
	}
	xhr.open("POST","ajax_films.php",true); //on appelle la page avec la méthode post en asychrone
	xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	xhr.send("Id_boitier="+indice);  //ID post sera le $_POST[''] et ValuePost sa valeur	
}