//Drops down the Advanced Filter Panel
$(document).ready(function(){
	//When document is ready and the Advanced Filter was clicked
	$("#searchFilter").click(function(){
		//Checks that the panel has not yet been created
		if (document.getElementById("filterSearchDiv")==null) {
			$('body').append('<div id="filterSearchDiv"></div');
			createPrice();
			createFullHeight();
			createColor();
			createType();
			$("#filterSearchDiv").append('<br/> <br/> <button id="filterSearchButton">Search</button>');
			$("#filterSearchDiv").append('<input type="checkbox" id="useName"> <strong class="checkboxes"> Search with name');
			styleElements();
			animateDiv();
		}else{
			$("#filterSearchDiv").css({
				height:"0px",
				opacity:".5",
				position:"absolute",
				top:"250px"
			});	
			animateDiv();
			$("#filterSearchDiv").show();
		}
	});		
	//if anyType is clicked the other checkBoxes should be unchecked
	$(document).on('click','#anyType', function(){
		var columnDivElement=document.getElementsByClassName("type");
		for(var x=0;x<4;x++){
			columnDivElement[x].checked=false;
		}
	});
	//if a type check box is clicked except for anyType is clicked the anyType check box should be unchecked
	$(document).on('click','.type', function(){
		document.getElementById("anyType").checked=false;
	});	
	//if anyColor is clicked the other checkBoxes should be unchecked
	$(document).on('click','#anyColor', function(){
		var columnDivElement=document.getElementsByClassName("color");
		for(var x=0;x<11;x++){
			columnDivElement[x].checked=false;
		}
	});
	//if a color check box is clicked except for anyColor is clicked the anyColor check box should be unchecked
	$(document).on('click','.color', function(){
		document.getElementById("anyColor").checked=false;
	});
	
	//occurs when the user wants to use the custom search that he created
	$(document).on('click','#filterSearchButton', function(){
		var query="SELECT * from inventory where";
		var textBoxValue=document.getElementById("search").value;
		if(document.getElementById("useName").checked && !textBoxValue==""){
			query+=" plant_name like '%"+textBoxValue+"%'"+" and ";
		}	
		query=addPrice(query);
		query=addHeight(query); 	
		query=addColor(query);
		query=addType(query);
		document.body.innerHTML+='<form id="formToSubmit" action="WareHouse" method="get">'+
		'<input type="hidden" name="type" value="customSearch">  <input type="hidden" name="search" value="'+query+'">'+
		'<input type="hidden" name="textBoxValue" value="'+textBoxValue+'"> </form>';
		document.getElementById('formToSubmit').submit();
	});
	//add Price to the query
	function addPrice(query){
		query+="(";
		var minPrice,maxPrice;
		var price1=(Number)(document.getElementById("priceSelect").value);
		var price2=(Number)(document.getElementById("priceSelect2").value);
		
			 minPrice=(price1<price2)?price1:price2;
			 maxPrice=(price1>price2)?price1:price2;
			 if(minPrice==10000 && maxPrice==10000){
				minPrice=100;
			 }
		 query+=" price>="+minPrice+" and price<="+maxPrice;
		 query+=")";
		 return query;
	}
	//adds height to the query
	function addHeight(query){
		var minHeight,maxHeight;
		query+="and (";
		var height1=(Number)(document.getElementById("fullHeightSelect").value);
		var height2=(Number)(document.getElementById("fullHeightSelect2").value);
			
			 minHeight=(height1<height2)?height1:height2;
			 maxHeight=(height1>height2)?height1:height2;
			 if(minHeight==10000 && maxHeight==10000){
				minHeight=2400;
			}
		query+="full_height>="+minHeight+" and full_height<="+maxHeight;
		query+=")";
		return query
	}
	//adds color to the query
	function addColor(query){
		if(!document.getElementById("anyColor").checked){
			var columnDivElement=document.getElementsByClassName("color");
			var firstTime=true;
			for(var x=0;x<10;x++){
				if(columnDivElement[x].checked){
						if(firstTime){
							query+="and (";
							query+=" color='"+columnDivElement[x].value+"'";
								firstTime=false;
						}else{
							query+=" or color='"+columnDivElement[x].value+"'";
						}
				}
			}
			if(!firstTime){
			query+=")";
			}
		}
		return query;
	}	
	//adds type to the query
	function addType(query){
		if(!document.getElementById("anyType").checked){
			var columnDivElement=document.getElementsByClassName("type");
			var firstTime=true;
			for(var x=0;x<4;x++){
				if(columnDivElement[x].checked){
						if(firstTime){
							query+="and (";
							query+=" plant_type='"+columnDivElement[x].value+"'";
								firstTime=false;
						}else{
							query+=" or plant_type='"+columnDivElement[x].value+"'";
						}
				}
			}
			if(!firstTime){
				query+=")";
			}
		}
		return query;
	}
	
	
	
	//gets rid of the advanced filter div when the user clicks on something else
	$('body').click(function(event) {
	    if (!$(event.target).closest('#filterSearchDiv').length && !$(event.target).closest('#searchFilter').length) {
	    	$("#filterSearchDiv").animate({	opacity:"0.1"},"slow",function(){
	    		$("#filterSearchDiv").hide();
	    	});
	    };
	});
	
});
//Animates the Advanced filter div onto the screen
	function animateDiv(){
		$("#filterSearchDiv").animate({
			down:"190px",
			opacity:"1",
			height:"190px"
		},"slow");
	}
	//styles the elements on the Advanced Filter div
	function styleElements(){
		$("#filterSearchDiv").css({
			height:"0px",
			opacity:".5",
			position:"absolute",
			top:"250px",
			left:"7%",
			font_size:"15pt",
			padding:"20px",
			background: "rgb(80,80,80)",
			border:"7px solid black"
		});		
		$("#priceSelect,#priceSelect2,#fullHeightSelect,#fullHeightSelect2").css({
			cursor:"pointer",
			color:"rgb(51,153,255)",
			background: "rgb(80,80,80)",
			color:"rgb(51,153,255)",
			border:"3px solid black",
			width:"140px",
			margin:"10px"
		});
			
		$(".title").css({
			font_size:"40pt",		
			font:"Serif",
			margin_top:"10px",
			white_space:"pre",
			color:"rgb(220,220,220)"
		});
		$(".checkboxes").css({
			font_size:"40pt",		
			font:"Serif",
			margin_top:"10px",
			white_space:"pre",
			color:"rgb(51,153,255)"
		});
		$("#filterSearchDiv").css({
			background:"rgb(80,80,80)"
		});
		$("button").css({
			background:"rgb(220,220,220)"
		});
	}
	//Creates the price elements
	function createPrice(){
		$("#filterSearchDiv").html('<strong class="title">Price : Between</strong>');
		$("#filterSearchDiv").append('<select id="priceSelect"></select>');
			$("#priceSelect").append('<option value="0">Any</option>');
			$("#priceSelect").append('<option value="0">$0</option>');
			$("#priceSelect").append('<option value="5">$5</option>');
			$("#priceSelect").append('<option value="10">$10</option>');
			$("#priceSelect").append('<option value="20">$20</option>');
			$("#priceSelect").append('<option value="30">$30</option>');
			$("#priceSelect").append('<option value="40">$40</option>');
			$("#priceSelect").append('<option value="50">$50</option>');
			$("#priceSelect").append('<option value="60">$60</option>');
			$("#priceSelect").append('<option value="70">$70</option>');
			$("#priceSelect").append('<option value="80">$80</option>');
			$("#priceSelect").append('<option value="$90">$90</option>');
			$("#priceSelect").append('<option value="10000">$100+</option>');
		$("#filterSearchDiv").append('<strong class="title"> And <strong>');
		$("#filterSearchDiv").append('<select id="priceSelect2"></select>');
			$("#priceSelect2").append('<option value="10000">Any</option>');
			$("#priceSelect2").append('<option value="0">$0</option>');
			$("#priceSelect2").append('<option value="5">$5</option>');
			$("#priceSelect2").append('<option value="10">$10</option>');
			$("#priceSelect2").append('<option value="20">$20</option>');
			$("#priceSelect2").append('<option value="30">$30</option>');
			$("#priceSelect2").append('<option value="40">$40</option>');
			$("#priceSelect2").append('<option value="50">$50</option>');
			$("#priceSelect2").append('<option value="60">$60</option>');
			$("#priceSelect2").append('<option value="70">$70</option>');
			$("#priceSelect2").append('<option value="80">$80</option>');
			$("#priceSelect2").append('<option value="$90">$90</option>');
			$("#priceSelect2").append('<option value="10000">$100+</option>');
			$("#filterSearchDiv").append('<br/>');
	}
	//Creates the height elements
	function createFullHeight(){
		$("#filterSearchDiv").append('<strong class="title">Height : </strong>');
		$("#filterSearchDiv").append('<select id="fullHeightSelect"></select>');
			$("#fullHeightSelect").append('<option value="0">Any</option>');
			$("#fullHeightSelect").append('<option value="0">0 Inches</option>');
			$("#fullHeightSelect").append('<option value="6">6 Inches</option>');
			$("#fullHeightSelect").append('<option value="12">1 Foot</option>');
			$("#fullHeightSelect").append('<option value="18">1.5 Feet</option>');
			$("#fullHeightSelect").append('<option value="24">2 feet</option>');
			$("#fullHeightSelect").append('<option value="36">3 feet</option>');
			$("#fullHeightSelect").append('<option value="48">4 feet</option>');
			$("#fullHeightSelect").append('<option value="60">5 feet</option>');
			$("#fullHeightSelect").append('<option value="120">10 feet</option>');
			$("#fullHeightSelect").append('<option value="600">50 feet</option>');
			$("#fullHeightSelect").append('<option value="1200,0">100 feet</option>');
			$("#fullHeightSelect").append('<option value="10000">200 feet+</option>');
		$("#filterSearchDiv").append('<strong class="title"> And <strong>');
		$("#filterSearchDiv").append('<select id="fullHeightSelect2"></select>');
			$("#fullHeightSelect2").append('<option value="10000">Any</option>');
			$("#fullHeightSelect2").append('<option value="0">0 Inches</option>');
			$("#fullHeightSelect2").append('<option value="6">6 Inches</option>');
			$("#fullHeightSelect2").append('<option value="12">1 Foot</option>');
			$("#fullHeightSelect2").append('<option value="18">1.5 Feet</option>');
			$("#fullHeightSelect2").append('<option value="24">2 feet</option>');
			$("#fullHeightSelect2").append('<option value="36">3 feet</option>');
			$("#fullHeightSelect2").append('<option value="48">4 feet</option>');
			$("#fullHeightSelect2").append('<option value="60">5 feet</option>');
			$("#fullHeightSelect2").append('<option value="120">10 feet</option>');
			$("#fullHeightSelect2").append('<option value="600">50 feet</option>');
			$("#fullHeightSelect2").append('<option value="1200">100 feet</option>');
			$("#fullHeightSelect2").append('<option value="10000">200 feet+</option>');
		$("#filterSearchDiv").append('<br/>');
	}
	//Creates the color elements
	function createColor(){
		$("#filterSearchDiv").append('<strong class="title">Color : </strong>');
		$("#filterSearchDiv").append('<input type="checkbox" id="anyColor" checked><strong class="checkboxes">Any   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="Blue"><strong class="checkboxes">Blue   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="Green"><strong class="checkboxes">Green   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="Red"><strong class="checkboxes">Red   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="Pink"><strong class="checkboxes">Pink   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="Yellow"><strong class="checkboxes">Yellow   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="Orange"><strong class="checkboxes">Orange   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="Black"><strong class="checkboxes">Black   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="White"><strong class="checkboxes">White   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="Gray"><strong class="checkboxes">Gray   </strong>');
		$("#filterSearchDiv").append('<input class="color" type="checkbox" value="Purple"><strong class="checkboxes">Purple   </strong>');		
		$("#filterSearchDiv").append('<br/>');
		$("#filterSearchDiv").append('<br/>');
	}
	//Creates the type elements
	function createType(){
		$("#filterSearchDiv").append('<strong class="title">Plant Type : </strong>');
		$("#filterSearchDiv").append('<input type="checkbox" id="anyType" checked><strong class="checkboxes">Any   </strong>');
		$("#filterSearchDiv").append('<input class="type" type="checkbox" value="Crops"><strong class="checkboxes">Crops   </strong>');
		$("#filterSearchDiv").append('<input class="type" type="checkbox" value="Bushes"><strong class="checkboxes">Bushes   </strong>');
		$("#filterSearchDiv").append('<input class="type" type="checkbox" value="Trees"><strong class="checkboxes">Trees   </strong>');
		$("#filterSearchDiv").append('<input class="type" type="checkbox" value="Flowers"><strong class="checkboxes">Flowers   </strong>');	
	} 
	
	
	//Other filter functions
	
	
	//changes the format of the plant Panels on the search to grid
	function changeToGrid(size){
		var imgDivElement=document.getElementsByClassName("descriptionDiv");
		var columnDivElement=document.getElementsByClassName("columnDiv");
		for(var x=0;x<size;x++){	
			columnDivElement[x].style.webkitColumnCount="1";
			columnDivElement[x].style.mozColumnCount="1";
			columnDivElement[x].style.msColumnCount="1";
			columnDivElement[x].style.columnCount="1";
			columnDivElement[x].children.font_size="1pt";
			
			columnDivElement[x].style.display="inline-block";
			columnDivElement[x].style.border="7 px solid black";
			columnDivElement[x].style.margin="20px";
			columnDivElement[x].style.height="auto";
		}
		return true;
	}
	//changes the format of the plant Panels on the search to list
	function changeToList(size){
		var columnDivElement=document.getElementsByClassName("columnDiv");
		for(var x=0;x<size;x++){
			columnDivElement[x].style.webkitColumnCount="3";
			columnDivElement[x].style.mozColumnCount="3";
			columnDivElement[x].style.msColumnCount="3";
			columnDivElement[x].style.columnCount="3";
			
			columnDivElement[x].style.display="block";
			columnDivElement[x].style.margin="20px auto 0px";
			columnDivElement[x].style.height="260px";
		}
		return true;
	}

	//Sets the image of the focused image
	function setImage(URL, id){
		var columnDivElement=document.getElementById(id);
		columnDivElement.src=URL;
		return true;
	}
	//REST OF FUNCTIONS : sorts the panels
	
	function lowToHigh(size){
		var columnDivElement=document.getElementsByClassName("columnDiv");
		var divArray = Array.prototype.slice.call(columnDivElement);
		divArray.sort(sortPrice);
		var mainElement=document.getElementById("main");
		for(var x=0;x<size;x++){
			mainElement.removeChild(divArray[x]);
			mainElement.appendChild(divArray[x]);
		}
	}
	function highToLow(size){
		var columnDivElement=document.getElementsByClassName("columnDiv");
		var divArray = Array.prototype.slice.call(columnDivElement);
		divArray.sort(sortPrice);
		divArray=divArray.reverse();
		var mainElement=document.getElementById("main");
		for(var x=0;x<size;x++){
			mainElement.removeChild(divArray[x]);
			mainElement.appendChild(divArray[x]);
		}
	}

	function sortPrice(a,b){	
		return(a.children[1].children[9].innerHTML-(b.children[1].children[9].innerHTML));
	}

	function alphabetical(size){
		var columnDivElement=document.getElementsByClassName("columnDiv");
		var divArray = Array.prototype.slice.call(columnDivElement);
		divArray.sort(sortNames);
		var mainElement=document.getElementById("main");
		for(var x=0;x<size;x++){
			mainElement.removeChild(divArray[x]);
			mainElement.appendChild(divArray[x]);
		}
	}
	function reverseAlphabetical(size){
		var columnDivElement=document.getElementsByClassName("columnDiv");
		var divArray = Array.prototype.slice.call(columnDivElement);
		divArray.sort(sortNames);
		divArray=divArray.reverse();
		var mainElement=document.getElementById("main");
		for(var x=0;x<size;x++){
			mainElement.removeChild(divArray[x]);
			mainElement.appendChild(divArray[x]);
		}
	}

	function sortNames(a,b){
		var stringA=a.children[1].children[4].innerHTML;
		var stringB=b.children[1].children[4].innerHTML;
		return (stringA.substring(6,stringA.length).localeCompare(stringB.substring(6,stringB.length)));
	}
	function popularity(size){
		var columnDivElement=document.getElementsByClassName("columnDiv");
		var divArray = Array.prototype.slice.call(columnDivElement);
		divArray.sort(sortPopularity);
		divArray=divArray.reverse();
		var mainElement=document.getElementById("main");
		for(var x=0;x<size;x++){
			mainElement.removeChild(divArray[x]);
			mainElement.appendChild(divArray[x]);
		}
	}
	function sortPopularity(a,b){
		return(a.children[1].children[16].value-(b.children[1].children[16].value));
	}

