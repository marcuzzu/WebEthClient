<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

 <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

</head>
<body>

	
	<input type="file" name="keyStoreFile" id="keyStoreFile"/><br/>

	<form id="accessForm" method="POST" action="/uploadKey" >
	    <input id="keyStoreString" type="hidden" name="keystore"/><br/>
	    <input type="password" name="password"/><br/><br/>
	    <input type="submit" value="Submit" />
	</form>
		

	
	<script type="text/javascript">	 
    $( window ).on( "load", function() {
        
        $('#keyStoreFile').on("change", function(){ 
        	        	
        	if (!window.File || !window.FileReader || !window.FileList || !window.Blob) {
        	      alert('The File APIs are not fully supported in this browser.');
        	      return;
        	    }   

        	var input =  ($('#keyStoreFile'))[0];
         	    if (!input) {
        	      alert("Um, couldn't find the fileinput element.");
        	    }
        	    else if (!input.files) {
        	      alert("This browser doesn't seem to support the `files` property of file inputs.");
        	    }
        	    else if (!input.files[0]) {
        	      alert("Please select a file before clicking 'Load'");               
        	    }
        	    else {
        	      file = input.files[0];
        	      var reader = new FileReader();
				    reader.readAsText(file, "UTF-8");
				    reader.onload = function (evt) {
				    	$('#keyStoreString').val(evt.target.result);
				    	$('#accessForm').reset();
				    }
				    reader.onerror = function (evt) {
				    	alert('error reading file');
				    }
        	      
        	    }        	
        });
    });
	</script>

	
</body>
</html>