

//check not fail auth
$( window ).on( "load", function() {
	
	
	var failCred=$.cookie("failCredentials");
	
	if(failCred=="true"){
		alert( "wrong credentials");
	}
	
});