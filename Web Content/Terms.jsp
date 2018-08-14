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
	<title>Terms and Conditions</title>
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
				<div style="background:rgb(0,154,0);">
					<h4 class="infoLink" id="terms" style="color:white;" onClick="changeInfoPage('terms');">Terms & Conditions</h4>				
				</div>
				<h4 class="infoLink" id="shippingRates" onClick="changeInfoPage('shippingRates');">Shipping Rates</h4>		
			</div>
		<div id="infoDisplayDiv">
			<div align=center>
				<strong id="aboutTitle">Terms and Conditions</strong>
			</div>
				<p>Customer Agrees: Customer hereby agrees to and acknowledges the following terms: Nature Hills Nursery, Inc. guarantees that all orders are carefully packed, packaged and containerized in a manner that optimizes the safe delivery of the plant products to your location. The majority of our shipments are made via FedEx. NATURE HILLS NURSERY, INC. IS NOT LIABLE FOR DAMAGE THAT YOUR PLANTS OR CONTAINERS MAY SUSTAIN WHILE IN TRANSIT, PACKAGES LOST IN TRANSIT, OR STOLEN FROM THEIR DESTINATION. If your product arrives damaged, please contact customer service at Nature Hills Nursery, Inc. within 48 hours of receipt and a claim will be initiated with the carrier. You will need to retain the package(s) for a minimum of 7 days, as the parcel company may want to inspect the damaged product. We will reship the damaged replacement product after the delivering carrier has approved the damage claim. If we are currently out of stock of that item, we will gladly offer a substitute, or you may wait until the next shipping season for your area.</p>
				<p>Condition of Sale: After you submit your order and the checkout process is completed, your order is taken from inventory and your credit card is charged immediately. Customer agrees that their order will be delivered without requiring a signature. Our carrier will leave the package(s) unsupervised unless other arrangements are made with us by the customer.</p>
				<p>Wrong Item: We are very careful to label varieties true to name, and we will replace the product if we have sent the incorrect plant. We will not refund the purchase price of the plant, but we will replace the plant at our expense. Customer acknowledges that they understand the plant type they are purchasing as posted on each product page at www.naturehills.com. Nature Hills Nursery, Inc. will not replace or refund any items where the customer purchased the wrong plant type. In the unlikely event that your order arrives missing an item please contact Nature Hills Nursery within 48 hours of receipt of said order and we will reship. We don't offer refunds, but if the missing item is out of stock customer may substitute for a tree or shrub of comparable value.</p>
				<p>Canceling An Order: Requests for cancellation must be made by calling 1-888-864-7663 during normal business hours. Orders cancelled prior to shipment will be charged the greater of a $10.00 cancellation fee or 10% of the purchase price. Large orders and/or freight shipped orders may incur a higher cancellation fee. Orders CANNOT be cancelled after the order is shipped or if the order is in the packaging process.</p>
				<p>Returns: All sales are final. In the event that a shipment is refused, Nature Hills Nursery, Inc. may, in its sole and absolute discretion, accept the returned merchandise, provided, that the same is in "like-new condition," and is saleable. We do not refund or pay shipping costs to customers to return their plants to us. In the event that Nature Hills Nursery, Inc. accepts returned merchandise, it will assess a restocking fee equal to 40% of the purchase price for the order, together with all shipping charges. Nature Hills Nursery, Inc. shall not, in any event, be required to grant a credit for merchandise returned to it if such merchandise is not, in the sole and absolute discretion of Nature Hills Nursery, Inc., re-saleable. Since plants are perishable, no returns will be accepted past two weeks from delivery or on material that has been planted.</p>
				<p>Optional Purchased 1 Year Plant Guarantee: As with all living plants, it is virtually impossible to achieve a 100% survival rate. That's why Nature Hills offers a 1 year replacement warranty. All we ask is a picture of the plants to verify they are dead. Upon receipt of picture(s), we will issue a 100% store credit (valid for one year) for the cost of the plants only. Garden Center products do not qualify. Any destruction of plants resulting from livestock, drought, insecticides or herbicides, fires, floods, etc. are not covered. Guarantee does not include shipping cost. Warranty credit must be used in its entirety in a single transaction. Customer must call 888-864-7663 to access credit. It will not be applied to on line orders. It cannot be used towards shipping and no additional promotions apply.</p>
				<p>Plant Information: Growth rates that are listed on our web site are estimates based upon historical data and assume optimum growing conditions. NATURE HILLS NURSERY, INC. DOES NOT MAKE ANY WARRANTY, EXPRESS OR IMPLIED, AS TO THE PRODUCTIVITY OF OUR PRODUCTS, AND NATURE HILLS NURSERY IS NOT RESPONSIBLE FOR NORMAL CROP FAILURES, DAMAGE WHILE IN STORAGE IN YOUR POSSESSION, INJURY DUE TO FROST OR NATURAL CAUSES BEYOND OUR CONTROL. Growing plants require a suitable site, compatible environment, and care to prosper, and these are conditions beyond our control. Customer agrees, by accepting these terms and conditions, that the images used on www.naturehills.com product pages, are representative of what the product they purchased will look like when it reaches the age of maturity, and is not what they will be receiving with their order.</p>
				<p>Loss Claims: If your order arrives damaged, you must contact Nature Hills within 48 hours as stated above. If you have properly cared for (as posted on our site) your newly transplanted trees, shrubs or plants, did NOT purchase the optional 1 year plant guarantee, and you experience a loss within one year from the date of delivery of such product, either write to Nature Hills Nursery, Inc., 9910 Nth 48th Street, Suite 200, Omaha, Nebraska 68152 or send an email to replacements@naturehills.com. Nature Hills Nursery, Inc. will, upon receipt of payment of one-half of the current price of the replacement plant, plus regular shipping (excludes flat rate and free ship promotions) as currently posted at www.naturehills.com, replace any plant or tree that died during said first year. Nature Hills Nursery, Inc. will only replace the plants or trees one time. In the event that the plant, tree or shrub that you purchased is not available, Nature Hills Nursery, Inc. will provide a similar categorized item (ie. tree for tree, shrub for shrub, perennial for perennial, etc), upon receipt of payment as provided above. Nature Hills Nursery, Inc. will not, in any event, refund the purchase price for the original product. Nature Hills Nursery may require that all plants and trees that are being claimed as a loss must be returned to our company address, at the purchasers' expense, to validate the claim, or we may request pictures (print or digital) of the claimed materials. NOTE: Our guarantee does not cover plants that are planted in a Growing Zone not recommended for the plant. Zones are posted on each product page.</p>
				<p>Dormant Plant Material: Nature Hills Nursery, Inc. will send out viable dormant plant materials early in the spring or late in the fall seasons. The plants are 100% healthy but may exhibit dormancy. Dormancy can include browning of the leafy materials or the plant may not have any leaves at all. All of this is very normal for a plant either moving into dormancy or if the plant is dormant. Nature Hills Nursery, Inc. will not accept a claim of a plant as a death loss until the customer plants them and the allowable time (up to 60 days) has been given for the plant to exit dormancy in the plant's normal cycle.</p>
				<p>EXCEPT AS SET FORTH ABOVE, NATURE HILLS NURSERY, INC. DOES NOT MAKE ANY REPRESENTATIONS OR WARRANTIES, EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, WARRANTIES OF FITNESS OR MERCHANTABILITY, REGARDING ANY PRODUCT PURCHASED FROM NATURE HILLS NURSERY, INC., AND NATURE HILLS NURSERY, INC. SPECIFICALLY DISCLAIMS ANY AND ALL SUCH WARRANTIES. THE REMEDIES SET FORTH ABOVE CONSTITUTE THE SOLE AND EXCLUSIVE REMEDIES AVAILABLE TO YOU. NATURE HILLS NURSERY, INC. SHALL NOT, IN ANY EVENT, BE LIABLE FOR DAMAGES IN AN AMOUNT GREATER THAN THE ORIGINAL PURCHASE PRICE OF ANY PLANT.</p>
				<p>All prices are subject to change without notice.</p>
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