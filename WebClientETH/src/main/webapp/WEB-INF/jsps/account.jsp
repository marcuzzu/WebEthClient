<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Account</title>

 <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
 <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>

<link href="/css/main.css" rel="stylesheet"></link>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>



<nav class="navbar navbar-default">
  <div class="container-fluid navContainer">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">UCAL WALLET</a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="/">Home</a></li>
      <li class="noAccess active" ><a href="/account.html">Accedi</a></li>
      <li class="accessDone active" ><a href="/account.html">Wallet</a></li>
      <li class="accessDone" ><a id="logOutButton">Logout</a></li>
    </ul>
  </div>
</nav>

</head>
<body >
	<div class="container-fluid">
	
		<div id="noAccess">
			<div class="row">
				<div class="col-sm-3"> </div>
				<div class="col-sm-6">
					<div class="row">
						<button id="restoreAccountNEW" type="button" class="btn btn-primary btn-block" 
						data-toggle="modal" data-target="#restoreAccountModal">Accedi</button>			
					</div>
					<div class="row">
						<buton id="createNewAccountButton" type="button" 
						class="btn btn-primary btn-block" >Crea nuovo</button>		
					</div>
				</div>
				<div class="col-sm-3"> </div>
			</div>
		</div>
	
	
		<div id="accessDone">
			<div class="row">
				<div class="col-sm-2"> </div>
				<div class="col-sm-8">
					<div class=form-inline">
						<label class="control-label" for="addressText">Address</label>
						<h4 class="form-control" id="addressText"> </h4>
					</div>
					<div class=form-inline">
						<label class="control-label" for="addressBalance">Balance</label>
						<h4 class="form-control" id="addressBalance"> </h4>
					</div>	
					
					<button id="startTransferButtonNEW" type="button" class="btn btn-primary btn-blocks btn-l" 
					data-toggle="modal" data-target="#transferEtherModal">Send</button>			
<!-- 
					<div id="transferEtherDiv" hidden>
						<label>address to</label>
						<input id="addressTo" type="text"/>
						<br/>
						<label>amount</label>
						<input id="ammount" type="number"/>
						<br/>
						<button id="confirmAmount" >Proceed</button>
					</div>
	-->				
				</div>
				<!-- <div class="col-sm-3"> </div> -->
			</div>
			<button id="logOutButton">log-out</button>
		</div>
		
	
	  <!-- Modal Send Trasfer-->
  <div class="modal fade" id="transferEtherModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Transfer</h4>
        </div>
        <form>
	        <div class="modal-body">
	          	<div class="form-group">
				  <label for="addressTo">Address to</label>
				  <input type="text" pattern=".{1,}" class="form-control col-sm-8" id="addressTo"></input>
				</div>
				<div class="form-group">
				  <label for="ammount">Amount</label>
				  <input type="number" pattern=".{1,}" required="required"  class="form-control col-sm-8" id="ammount"></input>
				</div>
	          
	        </div>
	        <div class="modal-footer">
	        
	        <button type="submit" class="btn btn-primary" data-dismiss="modal" id="confirmAmount">Submit</button>
	          <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	        </div>
        </form>
      </div>
    </div>
  </div>
	
	

  <!-- Modal Restore Account-->
  <div class="modal fade" id="restoreAccountModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Restore Address</h4>
        </div>
        <form>
	        <div class="modal-body">
	          	<div class="form-group">
				  <label for="privateKeyInput">Your private key:</label>
				  <input type="text" pattern=".{1,}" class="form-control col-sm-8" id="privateKeyInput"></input>
				</div>
	          
	        </div>
	        <div class="modal-footer">
	        
	        <button type="submit" class="btn btn-primary" data-dismiss="modal" id="restoreAddressSubmit2">Submit</button>
	          <button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
	        </div>
        </form>
      </div>
    </div>
  </div>
	
	
	

	
	  <!-- Modal New Account-->
  <div class="modal fade" id="createdNewAccountModal" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Created new address</h4>
        </div>
	        <div class="modal-body">
		        <p>Your new address is:</p>
				<p id="newAddress"></p>
				<p>Store your private key in a secure place and don't lose it</p>
				<p id="newPrivateKey"></p>
	        </div>
	        <div class="modal-footer">    
		        <button type="button" class="btn btn-primary" 
		        data-dismiss="modal" id="createdNewAccountModalButton">Ok</button>
	        </div>
      </div>
    </div>
  </div>

	
	
	
		<!-- DIALOG CREATE NEW ACCOUNT -->
<!-- 
		<div id="dialogCreatedNewAccount" title="New Account">
			<p>Your new address is:</p>
			<p id="newAddress"></p>
			<p>Store your private key in a secure place and don't lose it</p>
			<p id="newPrivateKey"></p>
		</div>
 -->	
	
	
		<!-- DIALOG RESTORE NEW ACCOUNT -->
<!-- 
		<div id="dialogRestoreAccount" title="New Account">
			<label>Insert your private key:</label>
			<input id="privateKeyInput" type="text">
			<button id="restoreAddressSubmit" value="submit"/>
			<form action="">
				<input id="restoreAddressSubmit" type="submit"/>
			</form>			
		</div>
 -->
		
		<!-- end container fulid -->
	</div>

</body>



<script>
//send ethere script

$(document).ready( function() {
	initTransferDiv();
});
/* $( window ).on( "load", function() {
	initTransferDiv();
});
 */

var activeTransfer=false;

function initTransferDiv(){
	activeTransfer=false;
	//initButton to show trasfer form
	$('#startTransferButtonNEW').click(function(){
		$('#startTransferButton').hide();
		$('#transferEtherDiv').show();
		activeTransfer=true;
	});

	//submit trasfer
	$('#confirmAmount').click(function(){

		//var addressTo=$('#addressTo').val();
		//var amount=$('#ammount').val();
		
		
		var requestobject={
				myAddress:$.cookie('address'),
				privKey:$.cookie('keystore'),
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
$(document).ready( function() {
	initPage();
});
var checkBalace=false;

/* $( window ).on( "load", function() {
	initPage();

});*/
function initPage(){
	initDialogCreatedNewAccount();
	initDialogRestoreAccount();
	
	var address=$.cookie('address');
	if (typeof $.cookie('keystore') === 'undefined' || 
			typeof $.cookie('address') === 'undefined'){
		 //no cookie
			$("#noAccess").show();
			$("#accessDone").hide();
			$(".noAccess").show();
			$(".accessDone").hide();
			initPageUnknow();
		} else {
		 //have cookie
			$("#accessDone").show();
			$("#noAccess").hide();
			$(".accessDone").show();
			$(".noAccess").hide();
			initPageLogged(address);
		}	
};



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
	$('#restoreAddressSubmit2').click(function (){
		alert('function');
		var privKey=$.trim($('#privateKeyInput').val() ) ;
		alert('privKey='+privKey);
		$.ajax({
	        type: "POST",
	        url: "/api/restoreAccount",
	        contentType: "application/json; charset=utf-8",
	        dataType: 'json',
	        data: privKey,
	        cache: false,	
	        success: function (data) {
	            console.log("SUCCESS : ", data);
				$.cookie("keystore", data.encryptedPrivateKey);
				$.cookie("address", data.address);
	            updateBalance();
	            initPage();
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
	        contentType: "application/json; charset=utf-8",
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
	$('#createdNewAccountModal').modal('show');
	$('#createdNewAccountModalButton').click(function(){
		initPage();		
	});

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
		        contentType: "application/json; charset=utf-8",
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