var gridSelected = false;
var listSelected = true;
var index=0;
//when grid or list are hovered
function mouseFilterHovered(id) {
	var element = document.getElementById(id);
	element.style.color = "rgb(0, 204, 0)";
	return true;
}
//when grid or list are blured
function mouseFilterBlured(id) {
	var element = document.getElementById(id);
	if (!gridSelected && element == document.getElementById("grid")) {
		element.style.color = "rgb(51,153,255)";
	} else if (!listSelected && element == document.getElementById("list")) {
		element.style.color = "rgb(51,153,255)";
	}
	return true;
}
//when grid or list are clicked
function mouseFilterClicked(id,size) {
	setAllToFalse();
	setColorsToDefault();
	var element = document.getElementById(id);
	if (element == document.getElementById("grid")) {
		gridSelected=true;
		changeToGrid(size);
	} else if (element == document.getElementById("list")) {
		listSelected=true;
		changeToList(size);
	}
	element.style.color="rgb(0, 204, 0)";
	return true;
}
//sets grid and list to false
function setAllToFalse() {
	gridSelected = false;
	listSelected = false;
	return true;
}
//sets colors of grid and list back to default
function setColorsToDefault(){
	document.getElementById("grid").style.color="rgb(51,153,255)";
	document.getElementById("list").style.color="rgb(51,153,255)";
	return true;
}
















