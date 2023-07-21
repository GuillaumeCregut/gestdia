var NomFilmPhoto;
var NumeroPhoto;
var Id_Photo_OK;
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
function voirphoto()
{
	//On récupère le nom du film
	var LeFilm=-1;
	var ListeFilm=document.getElementsByName('liste_film')[0];
	var IndiceFilm=ListeFilm.selectedIndex;
	var LeFilm=ListeFilm.options[IndiceFilm].value;
	var NomFilm=ListeFilm.options[IndiceFilm].innerHTML;
	console.log(LeFilm);
	console.log(NomFilm);
	if(LeFilm==-1)
	{
		alert('Veuillez selectionner un film');
		return false;
	}
	//Ici on lance une requete ajax
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
			var i;
			var out="";
			//On efface la liste existante
			var ListePhoto=document.getElementById('listephoto');
			while(ListePhoto.hasChildNodes())
			{
				ListePhoto.removeChild(ListePhoto.firstChild);
			}
			//On supprime le bouton
			var ConteneurPhoto=document.getElementById('ConteneurPhoto');
			ConteneurPhoto.style.display="none";
			if (ConteneurPhoto.childElementCount>1)
				ConteneurPhoto.removeChild(ConteneurPhoto.lastChild);
			for(i=0;i<tabRetour.length;i++)
			{
				/*out+="<p>"+tabRetour[i].Nom+" => "+tabRetour[i].code+" "+tabRetour[i].chemin+"</p>";*/
				var nouvelleEntree=document.createElement("li");
				var inputRadio=document.createElement("input");
				inputRadio.type="radio";
				inputRadio.name="radio_photo_form";
				
				inputRadio.value=tabRetour[i].code;
				var NewLabel=document.createElement("label");
				var TitreLabel=document.createTextNode(tabRetour[i].code+' - '+tabRetour[i].Nom);
				NewLabel.appendChild(TitreLabel);
				NewLabel.appendChild(inputRadio);
				nouvelleEntree.appendChild(NewLabel);
				
				ListePhoto.appendChild(nouvelleEntree);
			}
			//on affiche dans le document
			
			var newBouton=document.createElement('input');
			newBouton.type="button";
			newBouton.value="détail";
			newBouton.id="Bouton1";
			newBouton.onclick= function()
			{
				//On passe l'action à 1
				var LAction=document.getElementById('action_form');
				LAction.value=1;
				var LeCodeDyn=document.getElementById('code_photo_form');
				//On récupère le code de la photo a afficher
				var ListPhotoFilm=document.getElementsByName('radio_photo_form');
				var Id_Photo=-1;
				for (i=0;i<ListPhotoFilm.length;i++)
				{
					if (ListPhotoFilm[i].checked)
					{
						Id_Photo=ListPhotoFilm[i].value;
					}
				}
				LeCodeDyn.value=Id_Photo;
				//On valide le formulaire
				var Formulaire=document.getElementsByTagName('FORM')[0];
				Formulaire.submit();
			}
			console.log('Taille :'+tabRetour.length);
			if(tabRetour.length>0)
			{
				ConteneurPhoto.appendChild(newBouton);
				ConteneurPhoto.style.display="inline-block";
				console.log (ConteneurPhoto.style.display);
			}
		}
	}
	xhr.open("POST","ajax_photos.php",true); //on appelle la page avec la méthode post en asychrone
	xhr.setRequestHeader('Content-Type','application/x-www-form-urlencoded');
	xhr.send("Id_Film="+LeFilm);  //ID post sera le $_POST[''] et ValuePost sa valeur	
	//On affiche le nom du film selectionné dans ajouter
	var LeSpan=document.getElementById('NomFilmSelect');
	LeSpan.innerHTML=NomFilm;
	LeSpan.style.color='green';
	NomFilmPhoto=NomFilm;
	//On positionne l'ID du film pour PHP
	var Id_Film=document.getElementById('id_film_form');
	Id_Film.value=LeFilm;
}
function setVarFilm()
{
	
}
function ajoutPhoto()
{
	console.log('on passe par ajout');
	//Formatage des sorties vers le formulaire
	if(!Id_Photo_OK)
	{
		alert('Veuillez selectionner un film');
		return false;
	}
	var LeCode=document.getElementById('code_photo_form');
	LeCode.value=Id_Photo_OK;
	//On vérifie si le nom n'est pas vide
	var LeNom=document.getElementById('photonom').value;
	var longueur=LeNom.length;
	console.log('Taille du nom '+longueur);
	if(LeNom.length==0)
	{
		alert('veuillez remplir le Nom');
		return false;
	}
	//On vérifie si le commentaire n'est pas vide
	var LeComm=document.getElementById('commentaire_photo').value;
	console.log(LeComm.length);
	if(LeComm.length==0)
	{
		alert('veuillez remplir le commentaire');
		return false;
	}
	//On verifie si la description n'est pas vide
	var LaDesc=document.getElementById('description_photo').value;
	if(LaDesc.length==0)
	{
		alert('veuillez remplir la description');
		return false;
	}
	//On vérifie la date
	var LaDate=document.getElementById('date_photo').value;
	if(LaDate.length==0)
	{
		alert('veuillez remplir la date');
		return false;
	}
	var format = /^(\d{1,2}\/){2}\d{4}$/;
	if(!format.test(LaDate))
	{
		alert('veuillez remplir la date correctement');
		return false;
	}
	//On attribue le nom du film au chemin 
	var LeChemin=document.getElementById('chemin_form');
	LeChemin.value=NomFilmPhoto;
	//On valide le formulaire
	var Formulaire=document.getElementsByTagName('FORM')[0];
	Formulaire.submit();
}
function setcode(LeSelect)
{
	var indexPhoto=LeSelect.selectedIndex;
	var NumPhoto=LeSelect[indexPhoto].value;
	if(NumPhoto<10)
	{
		NumeroPhoto='0'+NumPhoto;
	}
	else
	{
		NumeroPhoto=NumPhoto;
	}
	console.log('Numéro photo : '+NumeroPhoto);
	var LeSpan2=document.getElementById('RacineNom');
	Id_Photo_OK=NomFilmPhoto+NumeroPhoto;
	LeSpan2.innerHTML=Id_Photo_OK;
	LeSpan2.style.color='red';
}
function init()
{
	var ConteneurPhoto=document.getElementById('ConteneurPhoto');
	ConteneurPhoto.style.display="none";
	var ListeFilm=document.getElementsByName('liste_film')[0];
	var IndiceFilm=ListeFilm.selectedIndex;
	var LeFilm=ListeFilm.options[IndiceFilm].value;
	var NomFilm=ListeFilm.options[IndiceFilm].innerHTML;
	NomFilmPhoto=NomFilm;
	//On positionne l'ID du film pour PHP
	var Id_Film=document.getElementById('id_film_form');
	Id_Film.value=LeFilm;
	var LeSpan=document.getElementById('NomFilmSelect');
	LeSpan.innerHTML=NomFilm;
	LeSpan.style.color='green'
}
function changeNomFilm(leSelectFilm)
{
	var IndiceFilm=leSelectFilm.selectedIndex;
	var NomFilm=leSelectFilm.options[IndiceFilm].innerHTML;
	var LeFilm=leSelectFilm.options[IndiceFilm].value;
	NomFilmPhoto=NomFilm;
	var LeSpan=document.getElementById('NomFilmSelect');
	LeSpan.innerHTML=NomFilm;
	LeSpan.style.color='green';
	//On positionne l'ID du film pour PHP
	var Id_Film=document.getElementById('id_film_form');
	Id_Film.value=LeFilm;
	
}