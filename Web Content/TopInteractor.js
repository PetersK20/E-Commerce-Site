var homeSelected = true;
var searchSelected = false;
var infoSelected = false;
var cartSelected = false;
//mouse goes over the navigation div
function mouseTopHovered(id) {	
	var element = document.getElementById(id);
	element.style.color = "rgb(0, 204, 0)";
}
//set the selected section of the navigation div
function setSelected(home,searchTitle,info,cart){
	 homeSelected = home;
	 searchSelected = searchTitle;
	 infoSelected = info;
	 cartSelected = cart;
}
//mouse goes out of the navigation div
function mouseTopBlured(id) {
	var element = document.getElementById(id);
	if (!homeSelected && element == document.getElementById("home")) {
		element.style.color = "white";
	}else if (!searchSelected&& element == document.getElementById("searchTitle")) {
		element.style.color = "white";
	} else if (!infoSelected && element == document.getElementById("info")) {
		element.style.color = "white";
	} else if (!cartSelected && element == document.getElementById("cart")) {
		element.style.color = "white";
	}
}
//mouse clicks navigation div
function mouseTopClicked(id) {
	var element = document.getElementById(id);
	element.style.color="rgb(0, 204, 0)";
	if (element == document.getElementById("home")) {
		homeSelected=true; window.location.href = "HomePage.jsp";
	} else if (element == document.getElementById("searchTitle")) {
		searchSelected=true;
		document.body.innerHTML+='<form id="formToSubmit" action="WareHouse" method="get"><input type="hidden" name="type" value=all /></form>';
		document.getElementById('formToSubmit').submit();
	} else if (element == document.getElementById("info")) {
		infoSelected=true; window.location.href = "AboutUsPage.jsp";
	} else if (element == document.getElementById("cart")) {
		cartSelected=true;  window.location.href = "CartPage.jsp";
	}
}
//redirects to the searchPage
function search(){
	window.location.href = "SearchPage.jsp";
}