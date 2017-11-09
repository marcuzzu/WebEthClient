<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Account</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


 <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>



</head>
<body >
	<div class="container-fluid">
	
		<div id="noAccess">
			<div class="row">
				<div class="col-sm-3"> </div>
				<div class="col-sm-6">
					<div class="row">
						<buton id="restoreAccount" type="button" 
						class="btn btn-primary btn-blocks btn-l" >Accedi</button>			
					</div>
					<div class="row">
						<buton id="createNewAccountButton" type="button" 
						class="btn btn-primary btn-blocks btn-l" >Crea nuovo</button>		
					</div>
				</div>
				<div class="col-sm-3"> </div>
			</div>
		</div>
	
	
	
		<div id="accessDone">
			<div class="row">
				<h3>address</h3> <h3 id="addressText"> </h3>
				<h3>balance</h3> <h3 id="addressBalance"> </h3>
				
				<button id="startTransferButton">Transfer</button>
				<div id="transferEtherDiv" hidden>
					<label>address to</label>
					<input id="addressTo" type="text"/>
					<br/>
					<label>amount</label>
					<input id="ammount" type="number"/>
					<br/>
					<button id="confirmAmount" >Proceed</button>
				</div>
				
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
			<button id="restoreAddressSubmit" value="submit"/>
			<form action="">
				
				<input id="restoreAddressSubmit" type="submit"/>
			</form>
			
		</div>
		
		<!-- end container fulid -->
	</div>

</body>



<script>
//send ethere script

$( window ).on( "load", function() {
	initTransferDiv();
});


var activeTransfer=false;

function initTransferDiv(){
	activeTransfer=false;
	//initButton to show trasfer form
	$('#startTransferButton').click(function(){
		$('#startTransferButton').hide();
		$('#transferEtherDiv').show();
		activeTransfer=true;
	});

	//submit trasfer
	$('#confirmAmount').click(function(){

		//var addressTo=$('#addressTo').val();
		//var amount=$('#ammount').val();
		
		
		var requestobject={
				addressTo:$('#addressTo').val(),
				amount:$('#ammount').val()
		};
//		var requestobject["addressTo"]=addressTo;
	//	requestobject["amount"]=amount;

		alert('send msg='+JSON.stringify(requestobject));
		
		$.ajax({
	        type: "POST",
	        url: "/api/sendTransaction",
	        contentType: "application/json; charset=utf-8",
	        data: JSON.stringify(requestobject),
	        cache: false,	
	        success: function (data) {
	            console.log("SUCCESS : ", data);
//				$.cookie("keystore", data.encryptedPrivateKey);
//				$.cookie("address", data.address);
	//            updateBalance();
	            alert('Ajax Done');
	        },
	        error: function (e) {
	            console.log("ERROR : ", e); 
	            alert('ERROR');
	        }
	    });
			
		
	});
	
}



</script>	

<script>

var checkBalace=false;

$( window ).on( "load", function() {
	
	initDialogCreatedNewAccount();
	initDialogRestoreAccount();
	
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
 
function initDialogRestoreAccount(){
	$('#restoreAccount').click(function (){
		$("#dialogRestoreAccount").dialog("open");
	});
	
	$("#dialogRestoreAccount").dialog({
	     autoOpen: false,
	     modal: true
	   });
}


/**** unlogged page ******/
function initPageUnknow(){
	checkBalace=false;
    intiCreateNewAddress();	
    intiRestoreAddress();	
}

function intiRestoreAddress(){	
	$('#restoreAddressSubmit').click(function (){
		var privKey=$.trim($('#privateKeyInput').val() ) ;
		alert('privKey='+privKey);
		$.ajax({
	        type: "POST",
	        url: "/api/restoreAccount",
	        dataType: 'json',
	        data: privKey,
	        cache: false,	
	        success: function (data) {
	            console.log("SUCCESS : ", data);
				$.cookie("keystore", data.encryptedPrivateKey);
				$.cookie("address", data.address);
	            updateBalance();
	            alert('restoreAcoountDone');
	        },
	        error: function (e) {
	            console.log("ERROR : ", e); 
	            alert('ERROR');
	        }
	    });
	});	
}

function intiCreateNewAddress(){
	$('#createNewAccountButton').click(function (){
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
				updateBalance();
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
    location.reload();
});


/***logged page ***/
function initPageLogged(address) {
    $('#addressText').text(address)
    pollingFunction();
    initLogOutButton();
    checkBalace=true;
    updateBalance();
}

//polling function
function pollingFunction(){
    console.log('function is being called')
    updateBalance();
}

function initLogOutButton(){
	$('#logOutButton').click(function() {
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
    	var address=$.cookie("address");
		  $.ajax({
		        type: "POST",
		        url: "/api/getBalance",
		        data: address,
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