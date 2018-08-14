<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@page import ="java.util.ArrayList"%>
   <%@page import ="java.util.Collections"%>
   <%@page import ="ProductPackage.PlantProduct"%>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<%ArrayList<PlantProduct> productList=(ArrayList<PlantProduct>)request.getAttribute("queryResults");
	int pageNumber=(int)request.getAttribute("pageNumber");%>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="styleSheet" type="text/css" href="TopStyleSheet.css">
	<link rel="styleSheet" type="text/css" href="SearchStyleSheet.css">
	<link rel="stylesheet" type="text/css" href="footerStyleSheet.css">
	<script type="text/javascript" src="TopInteractor.js"></script>
	<script type="text/javascript" src="SearchInteractor.js"></script>
	<script type="text/javascript" src="jquery-3.2.1.js"></script>
	<script type="text/javascript" src="Filter.js"></script>
	<script type="text/javascript" src="Cart.js"></script>
	<title>Search Results</title>
</head>
<body onload="setSelected(false,true,false,false,'<%=productList%>');">
	<!-- creates the navigationPanel -->
	<topPanel>
			<div id="centeredDiv" align="center">
				<div id="topPanelDiv">
					<strong id="home" onClick="mouseTopClicked('home');" onMouseOver="mouseTopHovered('home');" onMouseOut="mouseTopBlured('home');">Home</strong>
					<strong id="searchTitle" onClick="mouseTopClicked('searchTitle');" onMouseOver="mouseTopHovered('searchTitle');" onMouseOut="mouseTopBlured('searchTitle');"
					style="color:rgb(0, 204, 0);">Search</strong>
					<strong id="info" onClick="mouseTopClicked('info');" onMouseOver="mouseTopHovered('info');" onMouseOut="mouseTopBlured('info');">Shop Info</strong>
					<strong id="cart" onClick="mouseTopClicked('cart');" onMouseOver="mouseTopHovered('cart');" onMouseOut="mouseTopBlured('cart');">Cart(0)</strong>
					<div id="searchPanel">
						<form method="get" action="WareHouse">
							<input type="hidden" name="type" value="byName">
							<input id="search" name="search" type="text" size="20" maxlength="20" value="<%=request.getAttribute("textSearch")%>" >
							<button id="searchButton" type="submit" value="">
							<img src="http://icons.iconarchive.com/icons/icons8/windows-8/512/Very-Basic-Search-icon.png" width="20px" height="20px"></button>

						</form>
					</div>
				</div>
			</div>
		</topPanel>
		<!-- creates the page header -->
		<header>
			<h1 id="header"><%=request.getAttribute("name") %></h1>
		</header>
		<!-- creates the filterPanel -->
		<filterPanel>
			<div id="centeredDiv" align="center">
				<div id="filterDiv">
					<b class=filter id="searchFilter">Advanced Search Filter</b>
					<i>Sort By:</i>
					<Select id="sortText">
						<option onclick="popularity('<%=productList.size()%>');">
							Most Popular</option>
						<option onclick="alphabetical('<%=productList.size()%>');">
							Alphabetical</option>
							<option onclick="reverseAlphabetical('<%=productList.size()%>');">
							Reverse Alphabetical</option>
						<option onclick="lowToHigh('<%=productList.size()%>');">
							Price: Low to High</option>
						<option onclick="highToLow('<%=productList.size()%>');">
							Price: High to Low</option>				
					</Select>
					<i>View : </i>
					<b id="list" class=filter onClick="mouseFilterClicked('list',<%=productList.size()%>);" onMouseOver="mouseFilterHovered('list');" onMouseOut="mouseFilterBlured('list');">List</b>
					<b id="grid" class=filter onClick="mouseFilterClicked('grid',<%=productList.size()%>);" onMouseOver="mouseFilterHovered('grid');" onMouseOut="mouseFilterBlured('grid');">Grid</b>
				</div>	
			</div>
		</filterPanel>
		<!-- creates the plantPanels -->
		<main id="main">
			<%Collections.sort(productList,(a,b)->b.getPopularity().compareTo(a.getPopularity()));
			for(PlantProduct plantProduct:productList){ %>
				<div class="columnDiv">
					<div class="pictureDiv"> 
						<img id="<%= plantProduct.getPlantId()%>" src="<%= plantProduct.getImgLink() %>" width="320" height="200">
						<br/>
						<span class="span1" style="background:url(<%= plantProduct.getImgLink() %>)no-repeat center; background-size: cover;"
						onclick="setImage('<%= plantProduct.getImgLink() %>','<%= plantProduct.getPlantId() %>');"></span>
						<span class="span2" style="background:url(<%= plantProduct.getImgLink2() %>)no-repeat center; background-size: cover;"
						onclick="setImage('<%= plantProduct.getImgLink2() %>','<%= plantProduct.getPlantId() %>');"></span>
						<span class="span3" style="background:url(<%=plantProduct.getImgLink3()%>)no-repeat center; background-size: cover;"
						onclick="setImage('<%= plantProduct.getImgLink3() %>','<%= plantProduct.getPlantId()%>');"></span>
					</div>
				<%if(plantProduct.getStock()>=1){ %>
					<div class="attributeDiv">
						<br/>
						<!-- aligns the elements with the other div in the else statement for the ordering function -->
						<b></b>
						<div>
							<strong class="attributes">Quantity</strong>
							<input type="text" value="1" size="1" class="<%=plantProduct.getPlantId()%>">
							<input type="submit" value="Add to Cart" class="submit" onClick="addToCart('<%=plantProduct.getPlantId()%>','<%=plantProduct.getImgLink()%>',
							'<%=plantProduct.getPlantName()%>','<%=plantProduct.getDiscountPrice()%>','<%=plantProduct.getStock()%>')">
						</div><br/>
						<strong class="attributes">Name: <%=plantProduct.getPlantName()%></strong><br/><br/>
						<strong class="attributes">Price: </strong>
						<strong class="discount">$</strong>
						<strong class="discount"> <%=plantProduct.getDiscountPrice()%></strong>
						<strong class="price">   $<%=plantProduct.getPrice()%></strong> <br/><br/>
						<strong class="attributes">Plant Id: <%=plantProduct.getPlantId()%></strong> <br/><br/>
						<input type=hidden value='<%=plantProduct.getPopularity()%>'>
					</div>
				<%}else{%>
					<div class="attributesDiv">
					<br/>
						<strong class="attributes" style="color:red;">Out Of Stock</strong><br/><br/>
						<strong class="attributes">Name: <%=plantProduct.getPlantName()%></strong><br/><br/>
						<strong class="attributes">Price: </strong>
						<strong class="discount">$</strong>
						<strong class="discount"> <%=plantProduct.getDiscountPrice()%></strong>
						<strong class="price">   $<%=plantProduct.getPrice()%></strong> <br/><br/>
						<strong class="attributes">Plant Id: <%=plantProduct.getPlantId()%></strong><br/><br/>
						<input type=hidden value='<%=plantProduct.getPopularity()%>'>
					</div>
				<%}%>
					 <div class="attribute2">
					 <br/>
						<strong class="attributes">Plant Type: <%=plantProduct.getPlantType()%></strong> <br/><br/>
						<strong class="attributes">Height Now: <%=(int)Math.floor(plantProduct.getHeightNow()/12)%> feet, <%=(int)plantProduct.getHeightNow()%12%> inches</strong> <br/><br/>
						<strong class="attributes">Full Height: <%=(int)Math.floor(plantProduct.getFullHeight()/12)%> feet, <%=(int)plantProduct.getFullHeight()%12%> inches</strong> <br/><br/>
						<strong class="attributes">Stock: <%=plantProduct.getStock()%></strong> <br/><br/>
					</div>
			</div>
			<%}%>
		</main>
			<!-- creates the navigationPanel -->
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