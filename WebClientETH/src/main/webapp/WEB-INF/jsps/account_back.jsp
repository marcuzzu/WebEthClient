<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account</title>

 <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>


</head>
<body>

	<div id="noAccess">
		<input type="button"  onclick="location.href='/accedi.html'" value="Accedi" >
		</br>
		<input type="button" id="createNewAccountButton" value="Crea nuovo" >
	</div>
	<div id="accessDone">
		<div class="row">
			<h3>address</h3> <h3 id="addressText"> </h3>
			<h3>balance</h3> <h3 id="addressBalance"> </h3>
		</div>
		
		<button id="logOutButton">log-out</button>
	</div>


</body>
	

<script>
$( window ).on( "load", function() {
	
	var checkBalace=false;
	
	var address=$.cookie('address');
	if (typeof $.cookie('keystore') === 'undefined' || 
			typeof $.cookie('address') === 'undefined'){
		 //no cookie
			$("#noAccess").show();
			$("#accessDone").hide();
			initPageUnknow();
		} else {
		 //have cookie
			$("#accessDone").show();
			$("#noAccess").hide();
			initPageLogged(address);
		}

});


function initPageLogged(address) {
	alert("going to create new account");
    $('#addressText').text(address)
    pollingFunction();
    initLogOutButton();
    checkBalace=true;
}

function initPageUnknow(){
	checkBalace=false;
    intiCreateNewAddress();	
}

function intiCreateNewAddress(){
	alert("going to create new account");
	$('#createNewAccountButton').click(function (){
		alert("going to create new account");
		$.ajax({
	        type: "POST",
	        url: "/api/createNewAccount",
	        dataType: 'json',
	        cache: false,
	        success: function (data) {
	            console.log("SUCCESS : ", data);
				$('#addressBalance').text(data);
	        },
	        error: function (e) {
	            console.log("ERROR : ", e);  
	        }
	    });
	});
}



//polling function
function pollingFunction(){
    console.log('function is being called')
    updateBalance();
}

function initLogOutButton(){
	alert("int log ot button");
	$('#logOutButton').click(function() {
	  alert( "Handler for .click() called." );
	  $.removeCookie('keystore', { path: '/' });
	  $.removeCookie('address', { path: '/' });
	/*
	  $.cookie("keystore", null, { path: '/' });
	  $.cookie("address", null, { path: '/' });
	  */
	  location.reload();
	});
	
}




setInterval(function(){
	pollingFunction()}, 30000)
	
function updateBalance(){
	var getUrl = window.location;
/*
	alert('baseURL='+getUrl .protocol + "//" + getUrl.host + "/");
	$.ajax({
        type: "post",
        url: baseURL + '/', //this is my servlet
        data: "input=" +$('#ip').val()+"&output="+$('#op').val(),
        success: function(msg){      
                $('#output').append(msg);
        }
    });
    */
    if(checkBalace){
		  $.ajax({
		        type: "GET",
		        url: "/api/getBalance",
		        data: JSON.stringify($.cookie('address')),
		        dataType: 'json',
		        cache: false,
		        success: function (data) {
		            console.log("SUCCESS : ", data);
					$('#addressBalance').text(data);
		        },
		        error: function (e) {
		            console.log("ERROR : ", e);
		        }
		    });
    }
    
}	
	
	
</script>


</html>