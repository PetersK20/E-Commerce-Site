//Redirects to the selected info page
function changeInfoPage(id){
	var element=document.getElementById(id);
	if(element==document.getElementById("aboutUs")){
		window.location.href = "AboutUsPage.jsp";
	}else if(element==document.getElementById("privacyPolicy")){
		window.location.href = "PrivacyPolicy.jsp";
	}else if(element==document.getElementById("ProductGuarantee")){
		window.location.href = "ProductGuarantee.jsp";
	}else if(element==document.getElementById("terms")){
		window.location.href = "Terms.jsp";
	}else if(element==document.getElementById("shippingRates")){
		window.location.href = "ShippingRates.jsp";
	}
}