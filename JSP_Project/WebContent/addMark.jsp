<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Marks</title>

<script>
  function validate() {
	   if (document.getElementById('id'). value =='') {
  			alert( 'Student ID is compulsory.');
  		
	   } else if(document.getElementById('science'). value =='') {
    		alert( 'science mark is compulsory.');
    	} else if (document.getElementById('math'). value =='') {
    		alert( 'mathematic mark is compulsory');
    	} else if (document.getElementById('physic'). value =='') {
    		alert( 'physic mark is compulsory.');
        } else {
        	//submit the form
        	//document.forms[0].submit();
        	document.getElementById('addmarkForm').submit();
        }
    }
    </script>
</head>
<body>

<form action="addMarkProcess.jsp" method="POST" id='addmarkForm'>
	<h1>Add student marks</h1>
	<p>Student ID: <input type="text" name="id" id= 'id'/></p> 
	<p>science: <input type="text" name="science" id= 'science'/></p>
	<p>math: <input type="text" name="math" id= 'math' /></p>
	<p>physic: <input type="text" name="physic" id= 'physic'/></p>
	</form>
	<p><button type="submit" onclick= "validate()">Submit</button></p>
	
</body>
</html>