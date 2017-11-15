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
		<style>
			
		table {
			font-family: arial, sans-serif;
			border-collapse: collapse;
			width: 100%;
		}

		td, th {
			border: 1px solid #dddddd;
			text-align: left;
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
		#home {
		margin: 60px auto;
		width: 500px;
		}
		#pendingTasks {
		margin: 60px auto;
		width: 500px;
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
				    	var output = "<h1><strong> Bid on projects that you might like: </strong></h1> <br>";
				    	output += "<table> <tr> <th>Subject</th> <th>Completion Time</th> <th>Bid</th> </tr>";
				   		for(i=0; i<json_obj.length; i++){
				   			var json = json_obj[i];
				   			output += "<tr><td>";
				   			output += json.subject;
				   			output += "</td><td>";
				   			output += json.comp_ts;
				   			output += "</td><td>";
				   			output += "<form action=\"BidRelated\" method=\"post\">";
				   			output += "<input type = \"submit\" value = \"Bid\" name = \""+json.taskid+"\">";
				   			output += "</form> </td></tr>";
					   		console.log(output);
				    	}
				   		output += "</table>"
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
				    	var output = "<h1><strong> Here are your ongoing tasks: </strong></h1> <br>";
				    	output += "<table> <tr> <th>Subject</th> <th>Proposed Completion Time</th> <th>Status</th> </tr>";
				   		for(i=0; i<json_obj.length; i++){
				   			var json = json_obj[i];
				   			output += "<tr><td>";
				   			output += json.subject;
				   			output += "</td><td>";
				   			output += json.comp_ts;
				   			output += "</td><td>";
				   			output += "<form action=\"HomeRelated\" method=\"post\">";
				   			output += "<input type = \"submit\" value = \"Mark as Completed\" name = \""+json.taskid+"\">";
				   			output += "</form> <br>";
					   		console.log(output);
				    	}
				   		output += "</table>";
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
			function getCompletedProjects(){
				$.ajax({
					url : "HomeRelated",
				    dataType : 'html',
					type: "POST",
					data: {
						getCompletedProjects: "getCompletedProjects"
					},
				    success : function(result) {
				    	var json_obj = $.parseJSON(result);
				    	var output = "<h1><strong> Your previously completed projects: </strong></h1> <br>";
				    	output += "<table> <tr> <th>Subject</th> <th>Completion Time</th> <th>Payment</th> </tr>";
				   		for(i=0; i<json_obj.length; i++){
				   			var json = json_obj[i];
				   			output += "<tr><td>";
				   			output += json.subject;
				   			output += "</td><td>";
				   			output += json.comp_ts;
				   			output += "</td><td>";
				   			output += json.amount;
				   			output += "</td></tr>";
					   		console.log(output);
				    	}
				   		output += "</table>"
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
			function getOngoingBids(){
				$.ajax({
					url : "HomeRelated",
				    dataType : 'html',
					type: "POST",
					data: {
						getOngoingBids: "getOngoingBids"
					},
				    success : function(result) {
				    	var json_obj = $.parseJSON(result);
				    	var output = "<h1><strong> Check your results: </strong></h1> <br>";
				    	output += "<table id=\"ongoingBidTable\"> <tr> <th>Subject</th> <th>Quoted Completion Time</th> <th>Bidding Amount</th> <th>Remove Bid</th> </tr>";
				   		for(i=0; i<json_obj.length; i++){
				   			var json = json_obj[i];
				   			output += "<tr><td>";
				   			output += json.subject;
				   			output += "</td><td>";
				   			output += json.comp_ts;
				   			output += "</td><td>";
				   			output += json.amount;
				   			output += "</td><td>";
				   			output += "<button type = \"button\" id = \"delete_"+json.taskid+"\""
				   			output += " onclick=\"if (confirm('Do you really want to unbid "+json.subject+"?')){deleteRow(this, '"+json.taskid+"')}\">Remove</button></th>"
						  	output +=  "</td></tr>";
					   		console.log(output);
				    	}
				   		output += "</table>"
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
			function deleteRow(r, taskid) {
				$(document).ready(function(){
				    var i = r.parentNode.parentNode.rowIndex;
				    $.ajax({
						url : "HomeRelated",
					    dataType : 'html',
						type: "POST",
						data: {
							deleteBid: "deleteBid",
							taskid: taskid
						},
					    error : function() {
					    	alert("Error Occured");
					    },
					    success : function(data) {
						    document.getElementById("ongoingBidTable").deleteRow(i);
						}
					});
				});
			}
		</script>
		
		<script>
			function updateSkills(){
				$.ajax({
					url : "Register",
				    dataType : 'html',
					type: "POST",
					data: {
						getTags: "getTags"
					},
				    success : function(result) {
				    	var json_obj = $.parseJSON(result);
				    	var tag = getFreelancerTags();
				   		var output = "<h1><strong> Update your skills.</strong></h1>";
						output += "<form action=\"Register\" method=\"post\">";
				   		for(i=0; i<json_obj.length; i++){
							var tag = json_obj[i];
							output +="<input type=\"checkbox\" name=\"checkedTags\ " 
//towork here>>									 +"onload"
									 +"value=\""+json_obj[i].tagid+"\" >"+json_obj[i].name+"<br>";
			    	  	}
				   		output += "<input type = \"submit\" value = \"Submit\" name = \"updateFreelancerTags\">"+"</form>";
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
			function getFreelancerTags(){
				$.ajax({
					url : "HomeRelated",
				    dataType : 'html',
					type: "POST",
					data: {
						getFreelancerTags: "getFreelancerTags"
					},
				    success : function(result) {
				    	var json_obj = $.parseJSON(result);
				    	return json_obj;
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
		
	</head>
	<body>
		 <div class="topnav" id="myTopnav">
		  <a href="#bid" onclick="getInterestingProjects()">Bid</a>
		  <a href="#pendingTasks" onclick="getPendingProjects()">Pending Tasks</a>
		  <a href="#completedTasks" onclick="getCompletedProjects()">Completed Tasks</a>
		  <a href="#ongoingBids" onclick="getOngoingBids()">Ongoing Bids</a>
		  <a href="#updateSkills" onclick="updateSkills()">Update Skills</a>
		  <a href="#logout">Logout</a>
		  <a href="javascript:void(0);" style="font-size:15px;" class="icon" onclick="myFunction()">&#9776;</a>
		</div>
		<div id="home"></div>

	</body>
</html>
