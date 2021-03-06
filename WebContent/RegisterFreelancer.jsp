<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Create Account</title>

	<script>
		var check = function() {
		  if (document.getElementById('password').value ==
		    document.getElementById('confirm-password').value) {
		    document.getElementById('message').style.color = 'green';
		    document.getElementById('message').innerHTML = 'Passwords Match';
		  } else {
		    document.getElementById('message').style.color = 'red';
		    document.getElementById('message').innerHTML = 'Passwords do not Match';
		  }
		}
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


#register {
margin: 50px auto;
width: 400px;
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
fieldset form  input[type="reset"] {
background-color: #7B2311;
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
<div id="register"> 
<fieldset> 	
<form action="Register" method="post">
            <center>
            <table border="1" width="30%" cellpadding="5">
                <thead>
                    <tr>
                        <th colspan="2">Enter Information Here</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="fName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Middle Name</td>
                        <td><input type="text" name="mName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lName" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="text" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>Password</td>
                        <td><input type="password" id="password" name="password" value="" onkeyup='check();' /></td>
                    </tr>
                    <tr>
                        <td>Confirm Password</td>
                        <td><input type="password" id="confirm-password" name="confirm-password" value="" onkeyup='check();'/></td>
                    </tr>
                    <tr><div id='message'></div></tr>
                    <tr>
                        <td><input type="submit" value="Submit" name="ConfirmRegisterFreelancer"/></td>
                        <td><input type="reset" value="Reset" /></td>
                    </tr>
                   
                </tbody>
            </table>
            </center>
        </form>
         
   <h1>Already registered! <a href="login.jsp">Login Here</a></h1>
                    
</fieldset>        
</div>
</center>        
</body>
</html>