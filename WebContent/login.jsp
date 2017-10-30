<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
</head>
<body>

<center>

<h1>Welcome Freelancers</h1>

<h2>Enter Login Credentials</h2>

<form action="Login" method="post">
<br/>Email:<input type="text" name="email"><br>
<br/>Password:<input type="password" name="password"><br>
<br><input type="checkbox" name="userType" value="freelancer">Freelancer Login 
<br><input type="checkbox" name="userType" value="user" checked="checked">User Login<br>
<br/><input type="submit" value="Submit">
</form>

<p>Don't have a account , Create new one</p>
<form action="Register" method="post">
	<input type="submit" value ="RegisterFreelancer" name="RegisterFreelancer">
</form>
<form action="Register" method="post">
	<p><input type="submit" value ="RegisterUser" name="RegisterUser"></p>
</form>
</center>

</body>
</html>