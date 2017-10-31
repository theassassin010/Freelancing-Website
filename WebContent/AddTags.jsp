<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Add Tags</title>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		
		<script>
			function getTags(){
				$.ajax({
					url : "Register",
				    dataType : 'html',
					type: "POST",
					data: {
						getTags: "getTags"
					},
				    success : function(result) {
				    	var json_obj = $.parseJSON(result);
				   		var output = "";
						output += "<form action=\"Register\" method=\"post\">";
				   		for(i=0; i<json_obj.length; i++){
							var tag = json_obj[i];
							output +="<input type=\"checkbox\" name=\""+json_obj[i].tagid+
									 "\" value=\""+json_obj[i].name+"\">"+json_obj[i].name+"<br>";
			    	  	}
				   		output += "<input type = \"submit\" value = \"Submit\" name = \"updateFreelancerTags\">"+"</form>";
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
		
	</head>
	<body>
<!-- 	<form action="Register" method="post" id="content"> 
			<input type = "submit" value = "Submit" name = "updateFreelancerTags"> 
		</form>-->
		<div id = "content"></div>
		<br> <br>
		
	</body>
</html>