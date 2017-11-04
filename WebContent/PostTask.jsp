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
				   		var output = "";
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
				
	</head>
	<body>
	 	<form action="tasks" method="post"> 
	 		Subject: <input type = "text" value = "" name = "subject"> <br>
	 		Detailed Description: <input type = "text" value = "" name = "text"> <br>
	 		Minimum Payment: <input type = "text" value = "" name = "min_Pay"> <br>
	 		Maximum Payment: <input type = "text" value = "" name = "max_Pay"> <br>
	 		Expected Completion Date: <input type="date" value = "" name = "comp_ts"> <br>
	 		<div id = "content"></div>
			<input type = "submit" value = "Submit" name = "insertPostTags"> 
		</form>
		<br> <br>	
	</body>
</html>