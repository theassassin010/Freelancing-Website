<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<title>Login Page</title>
<script>
$(function() {
    $("input:checkbox").on('click', function() {
      // in the handler, 'this' refers to the box clicked on
      var $box = $(this);
      if ($box.is(":checked")) {
        // the name of the box is retrieved using the .attr() method
        // as it is assumed and expected to be immutable
        var group = "input:checkbox[name='" + $box.attr("name") + "']";
        // the checked state of the group/box on the other hand will change
        // and the current value is retrieved using .prop() method
        $(group).prop("checked", false);
        $box.prop("checked", true);
      } else {
        $box.prop("checked", false);
      }
    });
  });
</script>

<style type="text/css"> 
	body {
	background-color: #f4f4f4;
	color: #5a5656;
	font-family: 'Open Sans', Arial, Helvetica, sans-serif;
	font-size: 16px;
	line-height: 1.5em;
	}
	a { text-decoration: none; }
	h1 { font-size: 1em; }
	h1, p {
	margin-bottom: 10px;
	}
	strong {
	font-weight: bold;
	}


#Login {
margin: 60px auto;
width: 350px;
}	
fieldset form  input[type="text"], input[type="password"] {
background-color: #e5e5e5;
border: none;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px;
color: #5a5656;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 14px;
height: 50px;
outline: none;
padding: 0px 10px;
width: 280px;
-webkit-appearance:none;
}
fieldset form  input[type="submit"] {
background-color: #008dde;
border: none;
border-radius: 3px;
-moz-border-radius: 3px;
-webkit-border-radius: 3px;
color: #f4f4f4;
cursor: pointer;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
height: 50px;
text-transform: uppercase;
width: 300px;
-webkit-appearance:none;
}
	
fieldset form  a {
color: #5a5656;
font-size: 10px;
}
fieldset  form  a:hover { text-decoration: underline; }	
</style>
</head>
<body>

<center>

<div id="Login">
<h1><strong>Welcome.</strong> Please login.</h1>	
<fieldset>
<form action="Login" method="post">
<br/>Email:<input type="text" name="email"><br>
<br/>Password:<input type="password" name="password"><br>
<br><input type="checkbox" name="userType" value="freelancer">Freelancer Login<br> 
<br><input type="checkbox" name="userType" value="user" checked="checked">User Login<br>
<br/><input type="submit" value="Submit">
</form>
</fieldset>

<h1>Don't have a account , Create new one</h1>
<form action="Register" method="post">
	<input type="submit" value ="RegisterFreelancer" name="RegisterFreelancer">
</form>
<form action="Register" method="post">
	<p><input type="submit" value ="RegisterUser" name="RegisterUser"></p>
</form>
</div>

</center>

</body>
</html>
