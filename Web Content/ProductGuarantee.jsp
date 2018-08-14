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
	<title>Product Guarantee</title>
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
				<div style="background:rgb(0,154,0);">
					<h4 class="infoLink" id="ProductGuarantee" style="color:white;" onClick="changeInfoPage('ProductGuarantee');">Product Guarantee</h4>
				</div>
				<h4 class="infoLink" id="terms" onClick="changeInfoPage('terms');">Terms & Conditions</h4>
				<h4 class="infoLink" id="shippingRates" onClick="changeInfoPage('shippingRates');">Shipping Rates</h4>	
			</div>
		<div id="infoDisplayDiv">
			<div align=center>
				<strong id="aboutTitle">Our Guarantee to You</strong>
			</div>
				<p>Damaged In Transit: We guarantee that every plant we ship is of the finest quality and that your order will be carefully handled and shipped to ensure that you receive a healthy product. If your product arrives damaged, please contact customer service at Nature Hills Nursery, Inc. and a claim will be initiated with the carrier. You will need to retain the package(s) for a minimum of 7 days, as the parcel company may want to inspect the damaged product. We will reship the damaged replacement product after the delivering carrier has approved the damage claim. If we are currently out of stock of that item, we will gladly offer a substitute, or you may wait until the next shipping season for your area. We are not responsible for shipping delays or damage in shipment. We will not honor claims that are made more than 24 hours after receipt of the damaged product.</p>
				<p>Healthy Plants: As with all living plants, containerized or bare root, death loss is possible. It is virtually impossible to achieve a 100% survival rate. If you have properly cared for (as posted on our site) your newly purchased plants and you experience a loss during the first year, either write to Nature Hills Nursery, Inc., 9910 North 48th Street, Suite 200, Omaha, Nebraska 68152 or send an email to replacements@naturehills.com detailing your loss. Nature Hills Nursery, Inc. will replace any plant that dies during the first year upon payment of one-half of the current selling price plus normal shipping and handling as posted on our web site. Nature Hills Nursery, Inc. will only replace the plants one time. Nature Hills Nursery, Inc. reserves the right to request a soil sample for evaluation. In the event that the plants were planted in an environment that is not conducive to that plant's health, i.e., poor soil conditions, high mineral levels etc. our guarantee is null and void. We do not refund money, but we will gladly replace the plant(s) per our guarantee if all warranty conditions are met.
				 Nature Hills Nursery, Inc. must receive all warranty claims within one year from the date of delivery of your plants to the address specified on the order. Claims received by Nature Hills Nursery, Inc. after one year of delivery will not be honored. Product replacement will only be sent to the original shipping address. Claims will not be accepted if the shipping address is different than the original shipping address. If we are currently out of the plant, we will gladly offer a substitute, or you may wait until the next shipping season for your area. You will be responsible for payment as set forth above.Our guarantee does not cover plants planted in fill, scraped ground, or ground unsuitable for those species as outlined in the informational material contained on this web site. pertaining to particular species of plants. Any destruction of plants resulting from weather, livestock, drought, insecticides or herbicides, fires, floods, etc. are not covered by this guarantee. Our guarantee does not cover plants that are planted in a Zone(s) not recommended for the plant. Zones are posted on each product page. In the event of multiple claims or excessive losses, we may require a soil test to determine soil compatibility problems.</p>
				<p>EXCEPT AS SET FORTH ABOVE, NATURE HILLS NURSERY, INC. DOES NOT MAKE ANY REPRESENTATIONS OR WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF FITNESS OR MERCHANTABILITY, REGARDING ANY PRODUCT PURCHASED FROM NATURE HILLS NURSERY, INC., AND NATURE HILLS NURSERY, INC. SPECIFICALLY DISCLAIMS ANY AND ALL SUCH WARRANTIES. THE REMEDIES SET FORTH ABOVE CONSTITUTE THE SOLE AND EXCLUSIVE REMEDIES AVAILABLE TO YOU. NATURE HILLS NURSERY, INC. SHALL NOT, IN ANY EVENT, BE LIABLE FOR DAMAGES IN AN AMOUNT GREATER THAN THE ORIGINAL PURCHASE PRICE OF ANY PLANT.</p>
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