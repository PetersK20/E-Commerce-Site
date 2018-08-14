<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="styleSheet" type="text/css" href="CheckOutStyleSheet.css">
<script type="text/javascript" src="CheckOutValidator.js"></script>
<script type="text/javascript" src="jquery-3.2.1.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Check Out</title>
</head>
<body>
	<!-- Allows the user to return to the cart -->
	<a href=CartPage.jsp>Return</a>
	<h1>Check Out</h1>
	<hr>
	<!--allows user to type in his information-->
	<form id=checkOutForm method=post action=WareHouse>
		<h2 id=fullName>Full Name : </h2>	
		<input type=text name=fullName size=60 id=fullNameBox>
		<h2 id=address>Address : </h2>	
		<input type=text name=address size=60 id=addressBox>
		<h2 id=city>City : </h2>	
		<input type=text name=city size=60 id=cityBox>
		<h2 id=state>State : </h2>	
		<input type=text name=state size=60 id=stateBox>
		<h2 id=email>Email Address : </h2>	
		<input type=text name=emailAddress size=60 id=emailBox>
		<h2 id=phone>Phone Number : </h2>	
		<input type=text name=phoneNumber size=60 id=phoneBox>
		<h2 id=creditCard>Credit Card Number : </h2>	
		<input type=password name=cardNumber size=60 id=creditCardBox>
		<br/><br/>
		<input type=button value="Check Out" onClick="validate();">
	</form>
</body>
</html>










