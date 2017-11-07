<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account</title>

 <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
 
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>


</head>
<body>

	<div id="noAccess">
		<input id="restoreAccount" type="button" value="Accedi" >
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







	<!-- DIALOG CREATE NEW ACCOUNT -->
	<div id="dialogCreatedNewAccount" title="New Account">
		<p>Your new address is:</p>
		<p id="newAddress"></p>
		<p>Store your private key in a secure place and don't lose it</p>
		<p id="newPrivateKey"></p>
	</div>


	<!-- DIALOG RESTORE NEW ACCOUNT -->
	<div id="dialogRestoreAccount" title="New Account">
		<label>Insert your private key:</label>
		<input id="privateKeyInput" type="text">
		
	</div>

</body>
	

<script>
$( window ).on( "load", function() {
	
	initDialogCreatedNewAccount();
	
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

/****** general *****/
function initDialogCreatedNewAccount(){	
  $("#dialogCreatedNewAccount").dialog({
     autoOpen: false,
     modal: true
   });
}
 



/**** unlogged page ******/
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
				$.cookie("keystore", data.encryptedPrivateKey);
				$.cookie("address", data.address);
				showPopUpNewAccount(data);
	        },
	        error: function (e) {
	            console.log("ERROR : ", e);  
	        }
	    });
	});	
}

function showPopUpNewAccount(data){
	$('#newAddress').text(data.address)
	$('#newPrivateKey').text(data.privateKey)
	$("#dialogCreatedNewAccount").dialog("open");
}

$('div#dialogCreatedNewAccount').on('dialogclose', function(event) {
    alert('closed');
    location.reload();
});


/***logged page ***/
function initPageLogged(address) {
    $('#addressText').text(address)
    pollingFunction();
    initLogOutButton();
    checkBalace=true;
}

//polling function
function pollingFunction(){
    console.log('function is being called')
    updateBalance();
}

function initLogOutButton(){
	$('#logOutButton').click(function() {
	  alert( "Handler for .click() called." );
	  $.removeCookie('keystore', { path: '/' });
	  $.removeCookie('address', { path: '/' });
	  location.reload();
	});
	
}

setInterval(function(){
	pollingFunction()}, 30000)
	
function updateBalance(){
	var getUrl = window.location;
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