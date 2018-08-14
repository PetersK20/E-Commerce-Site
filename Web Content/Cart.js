//Adds a plant to the sessionStorage with the key as the id of the plant
function addToCart(key,image,name,discountPrice,stock){
	var value=document.getElementsByClassName(key)[0].value;
	
	if(!checkQuantity(value,stock)){
		return;
	}	
	
	var beforeValue=getValueBefore(key);
	
	var totalPlants=Number(value)+Number(beforeValue);	
	var array=[image,totalPlants,name,discountPrice,key,stock];
	sessionStorage.setItem(key,array);
	alert("You have "+totalPlants+" plant(s) of this type in your cart");
}
//gets the number of a certain waned plant before the user asked for more of that plant
function getValueBefore(key){
	var beforeValue=sessionStorage.getItem(key);
	if(beforeValue==null){
		beforeValue=0;
	}else{
		var arrayFromString=beforeValue.split(",");
		beforeValue=arrayFromString[1];

	}
	return beforeValue;
}
//Checks if the number of wanted plants is a number an their is enough in stock
function checkQuantity(quantity,stock){
	if(isNaN(quantity)){
		alert("The number you entered is not a number");
		return false;
	}else if(Number(quantity)>Number(stock)){
		alert("their is only "+stock+" plants in stock");
		return false;
	}else if(quantity<=0){
		alert("The number you entered is not greater than 0");
		return false;
	}else if(quantity%1!==0){
		alert("The number you entered is not an integer");
		return false;
	}else{
		return true;
	}
}
//Deletes an element in session storage
function deleteElement(id){
	sessionStorage.removeItem(id);
	window.location.replace("CartPage.jsp");
}
//creates the plant panels at the cartPage
function createPlantDivs(array,total){
	var cartArray=array.split(",");
	var id=cartArray[4];
	$('#productListDiv').append("<div class='plantProduct' id='"+id+"'></div>");
	$("#"+id).append("<span id='imageSpan' style='background:url("+cartArray[0]+")no-repeat center; background-size: cover;'></span>");
	$("#"+id).append("<strong class='plantStrongTag'>"+cartArray[2]+"</strong>");
	
	$("#"+id).append("<span>" +
	"<strong class='plantStrongTag'>Quantity : </strong>" +
	"<input size='1' class='quantityTextBox' type='text'" +"value='"+cartArray[1]+"' id='"+cartArray[2]+"'"+
	"onBlur=changeQuantity('"+id+"','"+array+"');></span>");
	
	$("#"+id).append("<strong class='plantStrongTag'>Price : $"+cartArray[3]*cartArray[1]+"</strong>");
	$("#"+id).append("<br/>");
	$("#"+id).append("<button class='"+id+"' id='deleteButton' onClick=deleteElement('"+id+"');>Remove From Cart</button>");
	return total+Number(cartArray[3]*cartArray[1]);
}
//creates the total,shipping and plantCost Labels for the cartPage
function createTotal(total){
	var shipping=Number(getShipping(total));
	var mainDiv=document.getElementById("productListDiv");
	mainDiv.appendChild(document.createElement("hr"));
	
	var plantCostElement=document.createElement("aside");
	plantCostElement.innerHTML="Plant cost : $"+total;
	plantCostElement.setAttribute("Class","cost");
	
	var shippingElement=document.createElement("aside");
	shippingElement.innerHTML="Shipping : $"+shipping;
	shippingElement.setAttribute("Class","cost");
	
	var totalElement=document.createElement("aside");
	totalElement.innerHTML="Total : $"+Number(Number(total)+Number(shipping));
	totalElement.setAttribute("Class","cost");
	
	mainDiv.appendChild(plantCostElement);
	mainDiv.appendChild(shippingElement);
	mainDiv.appendChild(document.createElement("br"));
	mainDiv.appendChild(totalElement);
}
//calculates shipping
function getShipping(price){
	var shipping=0;
	if(price<=15&&price>0){
		shipping=12.95;		
	}else if(price>15&&price<=30){
		shipping=14.95;		
	}else if(price>30&&price<=45){
		shipping=17.95;		
	}else if(price>45&&price<=60){
		shipping=20.95;		
	}else if(price>60&&price<=75){
		shipping=22.95;		
	}else if(price>75&&price<=90){
		shipping=24.95;		
	}else if(price>90&&price<=120){
		shipping=29.95;		
	}else{
		shipping=price*.25;
	}
	return shipping;
}
//changes the number of plants purchased at the cartPage by changing the quantity in a textField
function changeQuantity(id,array){
	var cartArray=array.split(",");
	var image=cartArray[0];
	var name=cartArray[2];
	var price=cartArray[3];
	var stock=cartArray[5];
	changeItemQuantity(id,image,name,price,stock);
	window.location.replace("CartPage.jsp");
}
//changes the number of plants purchased at the cartPage by changing the quantity in a textField
function changeItemQuantity(key,image,name,discountPrice,stock){
	var totalPlants=document.getElementById(name).value;
	if(!checkQuantity(totalPlants,stock)){
		return;
	}	
	sessionStorage.removeItem(key);
	var array=[image,totalPlants,name,discountPrice,key,stock];
	sessionStorage.setItem(key,array);
}
//returns an array of everything in the sessionStorage
function getAll(){
	var array=new Array(sessionStorage.length);
	for(var x=0;x<sessionStorage.length;x++){
		array[x]=sessionStorage.getItem(sessionStorage.key(x));
	}
	return array;
}
//redirects to the checkOutPage from the cart page if items are present in Session Storage
function checkOut(){
	if(sessionStorage.length>=1){
		window.location.href("CheckOutPage.jsp");
	}else{
		alert("You Have no Items");
	}
}