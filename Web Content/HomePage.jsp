<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="keywords"
		content="plant shop,bush,tree,plant,flower,garden,store,crop,green">
		<meta name="description"
		content="Plant Shop is an E-Commerce websites for users to browse our extensive inventory of trees,bushes,crops,flowers,etc">
		
		<link rel="styleSheet" type="text/css" href="HomeStyleSheet.css">
		<link rel="stylesheet" type="text/css" href="TopStyleSheet.css">
		<link rel="stylesheet" type="text/css" href="InfoStyleSheet.css">
		<link rel="stylesheet" type="text/css" href="footerStyleSheet.css">
		
		<script type="text/javascript" src="TopInteractor.js"></script>
		<script type="text/javascript" src="HomeInteractor.js"></script>
		<script type="text/javascript" src="InfoInteractor.js"></script>
		<title>Plant Shop</title>
	</head>
	<body style="background:url(http://www.agprofessional.com/sites/protein/files/field/image/farm_RF_20049175_1.jpg) repeat;" onload=setSelected(true,false,false,false);>
		<!-- creates the navigationPanel -->
		<topPanel>
			<div id="centeredDiv" align="center">
				<div id="topPanelDiv">
					<strong id="home" onClick="mouseTopClicked('home');" onMouseOver="mouseTopHovered('home');" onMouseOut="mouseTopBlured('home');"
					style="color:rgb(0, 204, 0);">Home</strong>
					<strong id="searchTitle" onClick="mouseTopClicked('searchTitle');" onMouseOver="mouseTopHovered('searchTitle');" onMouseOut="mouseTopBlured('searchTitle');">Search</strong>
					<strong id="info" onClick="mouseTopClicked('info');" onMouseOver="mouseTopHovered('info');" onMouseOut="mouseTopBlured('info');">Shop Info</strong>
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
		<header>
		
		
			<img src="http://floranextproductionimages.s3.amazonaws.com/instances/myjoyflowershop_com/logos/x800_1458777429_JOY.png"
			 id="logo">
			 
			 <h1 id="slogan">Putting People & Plants Together</h1>
			<br/>	
		</header>
			<!--creates the 5 plant type divs that redirect to the search page on click-->
		<main>
		<div class="mainHolder" align="center">
			<div id="allDiv" name="group" onclick="typeButtonClicked('allDiv');">
				<h2>All</h2>
				<img id="allImage" src="http://2.bp.blogspot.com/-2zk7jNtndZk/Tr47Vf4XwOI/AAAAAAAAAic/0ZqTHnlUJjo/s1600/%2528South+America%2529+-+Amazon.jpg">		
			</div>
			<div id="flowerDiv"  name="group" onclick="typeButtonClicked('flowerDiv');">
				<h2>Flowers</h2>
				<img id="flowerImage" src="http://3.bp.blogspot.com/-z_RMLlorz1E/TuGhCazgYII/AAAAAAAABZA/H1PF2q4qQWo/s1600/flowers+with+high+quality.jpg">		
			</div>
			<div id="bushDiv" name="group" onclick="typeButtonClicked('bushDiv');">
				<h2>Bushes</h2>
				<img id="bushImage" src="http://landscapee.com/images/photos/landscaping/shrubs-2/photo-1.jpg">
			</div>
			<div id="cropDiv" name="group" onclick="typeButtonClicked('cropDiv');">
				<h2>Crops</h2>
				<img id="cropImage" src="http://assets.inhabitat.com/wp-content/blogs.dir/1/files/2013/07/n-fix-crops.jpg">		
			</div>
			<div id="treeDiv" name="group" onclick="typeButtonClicked('treeDiv');">
				<h2>Trees</h2>
				<img id="treeImage" src="http://www.advancetreepros.com/wp-content/uploads/2013/01/Bright_green_tree_-_Waikato.jpg">		
			</div>
		</div>
		</main>
		<!--creates the About Us info div-->
		<info>
			<div id="holderDiv">
				<div id="LinkBoxDiv">
					<div style="border: 1px solid rgb(192,192,192);background:rgb(192,192,192);">
						<Strong id="linkBoxTitle">More Info</Strong>
					</div>
					<div style="background:rgb(0,154,0);">
						<h4 class="infoLink" id="aboutUs" style="color:white;" onClick="changeInfoPage('aboutUs');">About Our Shop</h4>
					</div>
					<h4 class="infoLink" id="privacyPolicy" onClick="changeInfoPage('privacyPolicy');">Privacy Policy</h4>
					<h4 class="infoLink" id="ProductGuarantee" onClick="changeInfoPage('ProductGuarantee');">Product Guarantee</h4>
					<h4 class="infoLink" id="terms" onClick="changeInfoPage('terms');">Terms & Conditions</h4>
					<h4 class="infoLink" id="shippingRates" onClick="changeInfoPage('shippingRates');">Shipping Rates</h4>	
				</div>
				<div id="infoDisplayDiv">
					<div align=center>
						<strong id="aboutTitle">About Joy Flower Shop</strong>
					</div>
						<p>Joy Flower Shop was originally founded in 2001 as a conifer and deciduous tree nursery. Joy Flower Shop started as a local tree nursery serving a limited geographic area. Our company has evolved and responded to our customers' demand of quality nursery products. 
							We continue to improve our on-line capabilities and expand our product offerings.</p>
						<p>We have extended our offerings outside the tree and shrub products, to include perennials, rose bushes and other plants, as well as flower bulbs, seeds and a complete garden center. We plan to continue to expand products to meet the needs of our customers.	</p>
						<p>Our growth over the years has remained tied to the Joy Flower Shop mission:</p>
						<p>Our mission is to continually improve all aspects of our business in order to exceed our nationwide customers' expectations. Joy Flower Shop strives to offer one of the largest selections of high quality live plants and related products, complete with extensive plant information, while maintaining an exceptional level of customer service. We will not sacrifice the personal attention we give our customers for our expanded growth.</p>		
						<p>While we are still mostly a family operation, we are proud of the strides we have made in customer satisfaction through expanded offerings and enhanced capabilities. Our successes are attributed to marketing healthy and competitively priced products as well as making sure each item shipped comes complete with planting, care and storage instructions. We even guarantee our products.</p>
						<p>Please take a minute and browse our site even if you are not in the buying mood today; we enjoy visitors, and are happy that you have chosen to visit Joy Flower Shop!</p>
					</div>
				</div>
		</info>
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