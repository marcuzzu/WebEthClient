<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

 <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script> 
 <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<link href="/css/main.css" rel="stylesheet"></link>
<!-- <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script type="text/javascript" src="js/main.js"></script>

<nav class="navbar navbar-default">
  <div class="container-fluid navContainer">
    <div class="navbar-header">
      <a class="navbar-brand" href="/">UCAL WALLET</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/">Home</a></li>
      <li class="noAccess" ><a href="/account.html">Accedi</a></li>
      <li class="accessDone" ><a href="/account.html">Wallet</a></li>
      <li class="accessDone" ><a id="logOutButton">Logout</a></li>
    </ul>
  </div>
</nav>


<title>UCALCOIN</title>
</head>
 
<body>
	<div>
		<h1 class="titleUcal">UCAL WALLET</h1>
	</div>
	<div style="text-align: center;">
		<img alt="home img" class="ucalImage" src="http://www.unicalcoin.it/wallet/img/header_wand.png">
	</div>
	<!-- <span id="content"></span> -->
	<div class="form-group" style="text-align:center">
	
		<input type="button" class="btn btn-secondary accessDone" onclick="location.href='/account.html'" value="Accedi al tuo Account" >
		<input type="button" class="btn btn-secondary noAccess" onclick="location.href='/account.html'" value="Effettua il login" >
	</div>
</body>
 
	<script type="text/javascript">
	
	$(document).ready( function() {
		initPage();
	});
	
	$( window ).on( "load", function() {
		//initPage();
		
		$('#logOutButton').click(function() {
			  $.removeCookie('keystore', { path: '/' });
			  $.removeCookie('address', { path: '/' });
			  location.reload();
			});
	});
	
	function initPage(){
		
		var address=$.cookie('address');
		if (typeof $.cookie('keystore') === 'undefined' || 
				typeof $.cookie('address') === 'undefined'){
			 //no cookie
				$(".noAccess").show();
				$(".accessDone").hide();
				//initPageUnknow();
			} else {
			 //have cookie
				$(".accessDone").show();
				$(".noAccess").hide();
				//initPageLogged(address);
			}	
	};
	
	

	</script>
</html>


