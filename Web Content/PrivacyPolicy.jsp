<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="InfoStyleSheet.css">
	<link rel="stylesheet" type="text/css" href="TopStyleSheet.css">
	<link rel="stylesheet" type="text/css" href="footerStyleSheet.css">
	<script type="text/javascript" src="TopInteractor.js"></script>
	<script type="text/javascript" src="InfoInteractor.js"></script>
	<title>Privacy Policy</title>
</head>
<body>
	<!-- creates the navigationPanel -->
	<topPanel>
			<div id="centeredDiv" align="center" style="margin-bottom:100px;">
				<div id="topPanelDiv">
					<strong id="home" onClick="mouseTopClicked('home');" onMouseOver="mouseTopHovered('home');" onMouseOut="mouseTopBlured('home');">Home</strong>
					<strong id="searchTitle" onClick="mouseTopClicked('searchTitle');" onMouseOver="mouseTopHovered('searchTitle');" onMouseOut="mouseTopBlured('searchTitle');">Search</strong>
					<strong id="info" onClick="mouseTopClicked('info');" onMouseOver="mouseTopHovered('info');" onMouseOut="mouseTopBlured('info');"
					style="color:rgb(0, 204, 0);">Shop Info</strong>
					<strong id="cart" onClick="mouseTopClicked('cart');" onMouseOver="mouseTopHovered('cart');" onMouseOut="mouseTopBlured('cart');">Cart(0)</strong>
					<div id="searchPanel">
						<form method="get" action="WareHouse">
							<input type="hidden" name="type" value="byName">
							<input id="search" name="search" type="text" size="20"></input>
							<button id="searchButton" type="submit" value="">
							<img src="http://icons.iconarchive.com/icons/icons8/windows-8/512/Very-Basic-Search-icon.png" width="20px" height="20px"></button>

						</form>
					</div>
				</div>
			</div>
	</topPanel>
	<!--creates the links to the other info panels and provides the info for About Us-->
	<main>
		<div id="holderDiv">
			<div id="LinkBoxDiv">
				<div style="border: 1px solid rgb(192,192,192);background:rgb(192,192,192);">
					<Strong id="linkBoxTitle">More Info</Strong>
				</div>
				<h4 class="infoLink" id="aboutUs" onClick="changeInfoPage('aboutUs');">About Our Shop</h4>
				<div style="background:rgb(0,154,0);">
						<h4 class="infoLink" id="privacyPolicy" style="color:white;" onClick="changeInfoPage('privacyPolicy');">Privacy Policy</h4>
				</div>
				<h4 class="infoLink" id="ProductGuarantee" onClick="changeInfoPage('ProductGuarantee');">Product Guarantee</h4>
				<h4 class="infoLink" id="terms" onClick="changeInfoPage('terms');">Terms & Conditions</h4>
				<h4 class="infoLink" id="shippingRates" onClick="changeInfoPage('shippingRates');">Shipping Rates</h4>	
			</div>
		<div id="infoDisplayDiv">
			<div align=center>
				<strong id="aboutTitle">Our Privacy Policy</strong>
			</div>
				<p>Nature Hills Nursery respects the privacy of visitors to our website and the privacy of our customers. We take your privacy seriously. We will not collect personal information about any visitor on our website, unless the visitor is made aware that we are collecting such information. We ensure that any information that is collected is collected in a secure and safe encrypted manner.</p>

				<p>Currently, we would collect personal information for the following reasons:
				We receive and store certain types of activity whenever you interact with us. Just like many web site, we use "cookies," and obtain certain types of information when your web browser accesses NatureHills.com or advertisements and other content served by or on behalf of NatureHills.com on other Web sites.</p>
				
				<ul style="list-style-type:disc">
					<li>Product Purchase: We will use your information ONLY to process your order, ship your order, answer questions about products, and advise you of other product related information.</li>
					<li>Newsletter Registration: We will use your information ONLY to email you our newsletter. To assist us in making email more useful, we often receive a confirmation when you open an email from us.</li>
					<li>Promotional Material/Specials: We will use your information ONLY to email you promotions/specials that we may be offering from time to time.</li>
				</ul>
				<p>We would/will collect the following kinds of information:
				Your name, address, email address, phone number(s), credit card number and/or billing information. This information is used ONLY to process your order, charge your debit/credit card for payment and ship your order.</p>

				<p>We will not make personal information available to outside organizations, except for organizations that work with us on Nature Hills Nursery promotions. In such case, such personal information is used only for purposes related to the administration of the promotions.</p>

				<p>When requested, we will remove a person from our email list or mailing list.</p>
			</div>
		</div>
	</main>
		<!--creates the footer that every panel has-->
		<footer>
			<div id="footerDiv" align="center">
				<br>
				<a id="pageTop" href=#>Top of Page</a>
				<br><br>
				<div id="mainFooterHolder" style="display: inline-block"align="center">
					<div id="contactInfo">
						<b class="titles">Contact Info</b>
						<br><br>
						<b class="subTitles">Address</b>
						<br>
						<b class="info">9910 N 48TH ST SUITE 200�OMAHA, NEBRASKA�68152</b>
						<br>
						<b class="subTitles">Phone</b>
						<br>
						<b class="info">1(444) 555-4433</b>
						<br>
						<b class="subTitles">Email</b>
						<br>
						<b class="info">joyplantshop@yahoo.com</b>
					</div>
					<div id="Resources">
						<b class="titles">Resources</b>
						<br><br>
						<a class="infoLinks" href="AboutUsPage.jsp">About us</a>
						<br>
						<a class="infoLinks" href="ProductGuarantee.jsp">Product Guarantee</a>
						<br>
						<a class="infoLinks" href="PrivacyPolicy.jsp">Privacy Policy</a>
						<br>
						<a class="infoLinks" href="Terms.jsp">Terms and Conditions</a>
						<br>
						<a class="infoLinks" href="ShippingRates.jsp">Shipping Rates</a>
					</div>
				</div>
				<br><br>
				<b class="info" style="text-align:center">� Joy Pant Shop. All Rights Reserved</b>
				<br><br>
			</div>
		</footer>

</body>
</html>