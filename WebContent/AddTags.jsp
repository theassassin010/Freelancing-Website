<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>Add Tags</title>
		<style type="text/css"> 
	body {
background-color: #f4f4f4;
color: #5a5656;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 14px;
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
#content {
margin: 30px auto;
width: 350px;
}
label {
 border:1px solid #ccc;
 padding:10px;
 margin:0 0 2px;
 display:block; 
}

label:hover {
 background:#eee;
 cursor:pointer;
}
input[type=submit] {
    padding:5px 15px; 
    background:#008dde;
    color: #f4f4f4;
    border:0 none;
    cursor:pointer;
    -webkit-border-radius: 5px;
    border-radius: 5px; 
}	
	</style>
		
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
				   		var output = "<h1><strong> Select your skills.</strong></h1>";
						output += "<form action=\"Register\" method=\"post\">";
				   		for(i=0; i<json_obj.length; i++){
							var tag = json_obj[i];
							output +="<label><input type=\"checkbox\" name=\"checkedTags\" "
									 +"value=\""+json_obj[i].tagid+"\">"+json_obj[i].name+"</label><br>";
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
		<div id = "content"></div>
		<br> <br>
		
	</body>
</html>
    