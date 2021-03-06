<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Post Task</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		
		<script>
			function getTags(){
				$.ajax({
					url : "tasks",
				    dataType : 'html',
					type: "POST",
					data: {
						getTags: "getTags"
					},
				    success : function(result) {
				    	var json_obj = $.parseJSON(result);
				   		var output = "Select Required Skill-Set: <br> ";
				   		for(i=0; i<json_obj.length; i++){
							var tag = json_obj[i];
							output +="<input type=\"checkbox\" name=\"checkedTags\" "
									 +"value=\""+json_obj[i].tagid+"\">"+json_obj[i].name+"<br>";
			    	  	}
				   		console.log(output);
						$("#content").html(output);
					},
				    error : function() {
				    	alert("Error Occured");
				    },
				});	
			}
		</script>
				
		<script>
			getTags();
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


#posttask {
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
	</style>			
	</head>
	<body>
		<div id="posttask">
		<fieldset>
	 	<form action="tasks" method="post"> 
	 		</br>Subject: <input type = "text" value = "" name = "subject"> <br>
	 		</br>Detailed Description: <textarea name="text" style="width:250px;height:150px;"></textarea> <br>
	 		</br>Minimum Payment: <input type = "text" value = "" name = "min_Pay"> <br>
	 		</br>Maximum Payment: <input type = "text" value = "" name = "max_Pay"> <br>
	 		</br>Expected Completion Date: <input type="date" value = "" name = "comp_ts"> <br> <br>
	 		<div id = "content"></div>
	 		</br>
			<input type = "submit" value = "Submit" name = "insertPostTags"> 
		</form>
		</fieldset>
		<br> <br>	
	</body>
	</div>
</html>
    