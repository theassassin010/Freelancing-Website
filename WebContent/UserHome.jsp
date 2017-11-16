<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style>
			table {
			    font-family: arial, sans-serif;
			    border-collapse: collapse;
			    width: 25%;
			}
			
			td, th {
			    border: 1px solid #dddddd;
			    text-align: center;
			    padding: 8px;
			}
			
			tr:nth-child(even) {
			    background-color: #dddddd;
			}
		</style>
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
		.topnav {
		background-color: #333;
		overflow: hidden;
		}	
		.topnav a {
			float: left;
			display: block;
			color: #f2f2f2;
			text-align: center;
			padding: 14px 16px;
			text-decoration: none;
			font-size: 17px;
		}
		.topnav a:hover {
			background-color: #ddd;
			color: black;
		}
		.topnav a.active {
			background-color: #4CAF50;
			color: white;
		}
		.topnav .icon {
		  display: none;
		}
		@media screen and (max-width: 600px) {
		  .topnav a:not(:first-child) {display: none;}
		  .topnav a.icon {
			float: right;
			display: block;
		  }
		}

		@media screen and (max-width: 600px) {
		  .topnav.responsive {position: relative;}
		  .topnav.responsive .icon {
			position: absolute;
			right: 0;
			top: 0;
		  }
		  .topnav.responsive a {
			float: none;
			display: block;
			text-align: left;
		  }
		
		</style>

		<script>
		function myFunction() {
			var x = document.getElementById("myTopnav");
			if (x.className === "topnav") {
				x.className += " responsive";
			} else {
				x.className = "topnav";
			}
		}
		</script>
		
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Welcome Page</title>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		
		<script>
			function getBidSummary(){
				$.ajax({
					url : "BidRelated",
				    dataType : 'html',
					type: "POST",
					data: {
						getBidSummary: "getBidSummary"
					},
				    success : function(result) {
				    	document.title = "Bid Results";
				    	var json_obj = $.parseJSON(result);
				    	var output = "<h1><strong> Look at the bid of your posted Projects: </strong></h1> <br>";
				    	output += "<table><tr><th>Subject</th><th>Posted On</th><th>No of Applicants</th><th>Details</th></tr>";
				   		for(i=0; i<json_obj.length; i++){
							var bid = json_obj[i];
				   			output += "<tr><td>";
					   		output += bid.subject;
				   			output += "</td><td>";
				   			output += bid.post_ts;
				   			output += "</td><td>";
				   			output += bid.post_ts;
				   			output += "</td><td>";
				   			output += "<button type=\"button\" onclick=\"getAllBidsOnTask("+bid.taskid+")\" >Details</button>";
							output += "</td></tr>";
				   			console.log(output);
				   		}
				   		output += "</table>";
				   		$("#content").html(output);
					},
				    error : function() {
				    	alert("Error Occured");
				    },
				});	
			}
		</script>
		
		<script>
			getBidSummary();
		</script>
		
	</head>
	<body>
		<div class="topnav" id="myTopnav">
		  <a href="#home">Home</a>
		  <a href="#postTask">Post Task</a>
		  <a href="#contact">Contact</a>
		  <a href="#logout">Logout</a>
		  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
		</div>
		
		<center>
		<div id="content"></div>
		</center>
	</body>
</html>
