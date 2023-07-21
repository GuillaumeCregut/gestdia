function ShowHide(id)
{
	var SousMenu=document.getElementById(id);
	var SousMenuStyle=window.getComputedStyle(SousMenu);
	console.log(SousMenuStyle);
	if (SousMenuStyle.display=='none')
	{
		SousMenu.style.display='inline-block';
	}
	else
	{
		SousMenu.style.display='none';
	}
}
function Voir(id)
{
	var SousMenu=document.getElementById(id);
	var SousMenuStyle=window.getComputedStyle(SousMenu);
	SousMenu.style.display='inline-block';
}
function Cacher(id)
{
	var SousMenu=document.getElementById(id);
	var SousMenuStyle=window.getComputedStyle(SousMenu);
	SousMenu.style.display='none';
}