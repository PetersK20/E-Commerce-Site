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
	<title>Shipping Rates</title>
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
				<h4 class="infoLink" id="privacyPolicy" onClick="changeInfoPage('privacyPolicy');">Privacy Policy</h4>
				<h4 class="infoLink" id="ProductGuarantee" onClick="changeInfoPage('ProductGuarantee');">Product Guarantee</h4>
				<h4 class="infoLink" id="terms" onClick="changeInfoPage('terms');">Terms & Conditions</h4>
				<div style="background:rgb(0,154,0);">
					<h4 class="infoLink" id="shippingRates" style="color:white;" onClick="changeInfoPage('shippingRates');">Shipping Rates</h4>	
				</div>	
			</div>
		<div id="infoDisplayDiv">
			<div align=center>
				<strong id="aboutTitle">Shipping Rates</strong>
			</div>
				<p>At Nature Hills we handle, package and ship the products you order with the utmost care to ensure healthy delivery. Shipping and handling charges are calculated based on the tables below. Please note that some items include an additional handling surcharge, these will be noted on the item's product page.</p>
				<table>
					<tr>	
						<th>Order Total</th>
						<th>S&H</th>
					</tr>
					<tr>	
						<td>Up to $14.99l</td>
						<td>$    12.95</td>
					</tr>
					<tr>	
						<td>$15 - $29.99</td>
						<td>$    14.95</td>
					</tr>
					<tr>	
						<td>$30.00 - $44.99</td>
						<td>$    17.95</td>
					</tr>	
					<tr>	
						<td>$45 - $59.99</td>
						<td>$    20.95</td>
					</tr>			
					<tr>	
						<td>$60 - $74.99</td>
						<td>$    22.95</td>
					</tr>
					<tr>	
						<td>$75 - $89.99</td>
						<td>$    24.95</td>
					</tr>
					<tr>	
						<td>$90 - $119.99</td>
						<td>$    29.95</td>
					</tr>
					<tr>	
						<td>Over $120 </td>
						<td>Approx.25%</td>
					</tr>
				</table>
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
						<b class="info">9910 N 48TH ST SUITE 200 OMAHA, NEBRASKA 68152</b>
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
				<b class="info" style="text-align:center">© Joy Pant Shop. All Rights Reserved</b>
				<br><br>
			</div>
		</footer>
</body>
</html>