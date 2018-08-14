//redirects to the search panel when one of the plant type divs is clicked
function typeButtonClicked(id){
	var type;
	var element = document.getElementById(id);
	if (element == document.getElementById("allDiv")) {
		document.body.innerHTML+='<form id="formToSubmit" action="WareHouse" method="get"><input type="hidden" name="type" value=all /></form>';
	} else if (element == document.getElementById("flowerDiv")) {
		document.body.innerHTML+='<form id="formToSubmit" action="WareHouse" method="get"><input type="hidden" name="type" value=Flowers /></form>';
	} else if (element == document.getElementById("bushDiv")) {
		document.body.innerHTML+='<form id="formToSubmit" action="WareHouse" method="get"><input type="hidden" name="type" value=Bushes /></form>';
	} else if (element == document.getElementById("cropDiv")) {
		document.body.innerHTML+='<form id="formToSubmit" action="WareHouse" method="get"><input type="hidden" name="type" value=Crops /></form>';
	}else if (element == document.getElementById("treeDiv")) {
		document.body.innerHTML+='<form id="formToSubmit" action="WareHouse" method="get"><input type="hidden" name="type" value=Trees /></form>';
	}
	document.getElementById('formToSubmit').submit();
}