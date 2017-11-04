<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		
		<title>Welcome Page</title>
		<script>
			function getInterestingProjects(){
				$.ajax({
					url : "HomeRelated",
				    dataType : 'html',
					type: "POST",
					data: {
						getInterestingProjects: "getInterestingProjects"
					},
				    success : function(result) {
				    	var json_obj = $.parseJSON(result);
				    	var output = "";
				   		for(i=0; i<json_obj.length; i++){
				   			var json = json_obj[i];
				   			output += json.subject;
				   			output += "&nbsp;&nbsp;&nbsp;&nbsp;";
				   			output += json.comp_ts;
				   			output += "&nbsp;&nbsp;&nbsp;&nbsp;";
				   			output += "<form action=\"BidRelated\" method=\"post\">";
				   			output += "<input type = \"submit\" value = \"Bid\" name = \""+json.taskid+"\">";
				   			output += "</form> <br>";
					   		console.log(output);
				    	}
				   		console.log(output);
						$("#home").html(output);
					},
				    error : function() {
				    	alert("Error Occured");
				    },
				});	
			}
		</script>
		
		<script>
			function getPendingProjects(){
				$.ajax({
					url : "HomeRelated",
				    dataType : 'html',
					type: "POST",
					data: {
						getPendingProjects: "getPendingProjects"
					},
				    success : function(result) {
				    	var json_obj = $.parseJSON(result);
				    	var output = "";
				   		for(i=0; i<json_obj.length; i++){
				   			var json = json_obj[i];
				   			output += json.subject;
				   			output += "&nbsp;&nbsp;&nbsp;&nbsp;";
				   			output += json.comp_ts;
				   			output += "&nbsp;&nbsp;&nbsp;&nbsp;";
				   			output += "<form action=\"HomeRelated\" method=\"post\">";
				   			output += "<input type = \"submit\" value = \"Mark as Completed\" name = \""+json.taskid+"\">";
				   			output += "</form> <br>";
					   		console.log(output);
				    	}
				   		console.log(output);
						$("#pendingTasks").html(output);
					},
				    error : function() {
				    	alert("Error Occured");
				    },
				});	
			}
		</script>
		
		
		<script>
			getInterestingProjects();
		</script>
		
		<script>
			getPendingProjects();
		</script>
		
	</head>
	<body>
		<h1>Interesting Projects</h1>
		<div id="home"></div>
		====================================================================================================
		<h2>Pending Projects</h2>
		<div id="pendingTasks"></div>
	</body>
</html>