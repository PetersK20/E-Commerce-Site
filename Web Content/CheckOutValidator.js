//validates if info is in proper form then calls the servlet to be stored in the dataBase
function validate(){
	var name=validateName();
	var address=validateAddress();
	var city=validateCity();
	var state=validateState();
	var email=validateEmail();
	var phone=validatePhoneNumber();
	var card=validateCreditCard();
//	if(	name && address && city && state && email && phone && card){
		var itemString=getAllKeys();
		var price=getPrice();
		var shipping=getShipping(price);
		$('#checkOutForm').append("<input type='hidden' name='plantItems' value='"+itemString+"'>");
		$('#checkOutForm').append("<input type='hidden' name='plantPrice' value='"+price+"'>");
		$('#checkOutForm').append("<input type='hidden' name='plantShipping' value='"+shipping+"'>");
		sessionStorage.clear();
		document.getElementById('checkOutForm').submit();
	//}else{
		//alert("invalid data");
	//}
}
//Gets a string of the id of the plant with a space then the Quantity: A1 2
function getAllKeys(){
	
	var array=new Array(sessionStorage.length);
	for(var x=0;x<sessionStorage.length;x++){
		array[x]=sessionStorage.getItem(sessionStorage.key(x));
	}
	var itemString;
	var firstTime=true;
	for(var y=0;y<array.length;y++){
		var itemArray=array[y].split(",");
		if(firstTime){
			itemString=itemArray[4]+" "+itemArray[1];
			firstTime=false;
		}else{
			itemString+=","+itemArray[4]+" "+itemArray[1];
		}
	}
	
	return itemString;
}
//Gets the price of the items
function getPrice(){
	var array=new Array(sessionStorage.length);
	for(var x=0;x<sessionStorage.length;x++){
		array[x]=sessionStorage.getItem(sessionStorage.key(x));
	}
	var plantPrice;
	var firstTime=true;
	for(var y=0;y<array.length;y++){
		var itemArray=array[y].split(",");
		if(firstTime){
			plantPrice=Number(itemArray[3])*Number(itemArray[1]);
			firstTime=false;
		}else{
			plantPrice+=Number(itemArray[3])*Number(itemArray[1]);
		}
	}
	return plantPrice;
}
//Gets the cost of shipping
function getShipping(price){
	var shipping=0;
	if(price<=15){
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
function validateName(){
	var regexExp=/^[a-zA-Z0-9\s]{2,}$/;
	var elementText=document.getElementById("fullNameBox");
	var elementHeader=document.getElementById("fullName");
	if(regexExp.test(elementText.value)){
		elementText.style.borderColor="green";
		elementHeader.style.color="green";
		return true;
	}else{
		elementText.style.borderColor="red";
		elementHeader.style.color="red";
		return false;
	}
}
function validateAddress(){
	var regexExp=/^[0-9]{4}[a-zA-Z]{4,}$/;
	var elementText=document.getElementById("addressBox");
	var elementHeader=document.getElementById("address");
	if(regexExp.test(elementText.value)){
		elementText.style.borderColor="green";
		elementHeader.style.color="green";
		return true;
	}else{
		elementText.style.borderColor="red";
		elementHeader.style.color="red";
		return false;
	}
}
function validateCity(){
	var regexExp=/^[a-zA-Z0-9]{2,}$/;
	var elementText=document.getElementById("cityBox");
	var elementHeader=document.getElementById("city");
	if(regexExp.test(elementText.value)){
		elementText.style.borderColor="green";
		elementHeader.style.color="green";
		return true;
	}else{
		elementText.style.borderColor="red";
		elementHeader.style.color="red";
		return false;
	}
}
function validateState(){
	var regexExp=/^A[LKSZRAEP]|C[AOT]|D[EC]|F[LM]|G[AU]|HI|I[ADLN]|K[SY]|LA|M[ADEHINOPST]|N[CDEHJMVY]|O[HKR]|P[ARW]|RI|S[CD]|T[NX]|UT|V[AIT]|W[AIVY]$/i;
	var elementText=document.getElementById("stateBox");
	var elementHeader=document.getElementById("state");
	if(regexExp.test(elementText.value)){
		elementText.style.borderColor="green";
		elementHeader.style.color="green";
		return true;
	}else{
		elementText.style.borderColor="red";
		elementHeader.style.color="red";
		return false;
	}
}
function validateEmail(){
	var regexExp=/^\w+@\w+\.[a-zA-Z]{2,4}$/;
	var elementText=document.getElementById("emailBox");
	var elementHeader=document.getElementById("email");
	if(regexExp.test(elementText.value)){
		elementText.style.borderColor="green";
		elementHeader.style.color="green";
		return true;
	}else{
		elementText.style.borderColor="red";
		elementHeader.style.color="red";
		return false;
	}
}
function validatePhoneNumber(){
	var regexExp=/^([0-9]( |-)?)?((\(?[0-9]{3}\)?|[0-9]{3})( |-)?)?([0-9]{3}( |-)?[0-9]{4}|[0-9A-Za-z]{7})$/;
	var elementText=document.getElementById("phoneBox");
	var elementHeader=document.getElementById("phone");
	if(regexExp.test(elementText.value)){
		elementText.style.borderColor="green";
		elementHeader.style.color="green";
		return true;
	}else{
		elementText.style.borderColor="red";
		elementHeader.style.color="red";
		return false;
	}
}
function validateCreditCard(){
	var regexExp=/^[0-9]{16}$/;
	var elementText=document.getElementById("creditCardBox");
	var elementHeader=document.getElementById("creditCard");
	if(regexExp.test(elementText.value)){
		elementText.style.borderColor="green";
		elementHeader.style.color="green";
		return true;
	}else{
		elementText.style.borderColor="red";
		elementHeader.style.color="red";
		return false;
	}
}