<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
	
	<title>Placing Bids</title>
	<style type="text/css">
		.button {
			background-color: #008CBA;
			border: none;
			color: white;
			padding: 15px 32px;
			text-align: center;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			margin: 4px 2px;
			cursor: pointer;
		}
		body {
			background-color: white;
			line-height: 1.5em;
		}
		h1 {
			color: black;
			font-size: 200%;
		}
		.brandname {
			font-style:italic;color:#006;text-transform:uppercase;
		}
		#bid {
			margin: 10px auto;
			width: 800px;
		}
		#slidecontainer {
	    	width: 60%;
		}	
		.slider {
		    -webkit-appearance: none;
		    width: 50%;
		    height: 15px;
		    border-radius: 5px;
		    background: #d3d3d3;
		    outline: none;
		    opacity: 0.7;
		    -webkit-transition: .2s;
		    transition: opacity .2s;
		}	
		.slider:hover {
		    opacity: 1;
		}	
		.slider::-webkit-slider-thumb {
		    -webkit-appearance: none;
		    appearance: none;
		    width: 25px;
		    height: 25px;
		    border-radius: 50%;
		    background: #4CAF50;
		    cursor: pointer;
		}	
		.slider::-moz-range-thumb {
		    width: 25px;
		    height: 25px;
		    border-radius: 50%;
		    background: #4CAF50;
		    cursor: pointer;
		} 
	</style>
	
	<script>
		function getTaskTags(taskid){
			$.ajax({
				url : "BidRelated",
			    dataType : 'html',
				type: "POST",
				data: {
					getTaskTags: "getTaskTags",
					taskid: String(taskid)
				},
			    success : function(result) {
			    	var json_obj = $.parseJSON(result);
			    	var output = "";
			   		for(i=0; i<json_obj.length; i++){
			   			var json = json_obj[i];
			   			output += "<a>";
			   			output += json_obj[i].name;
			   			output += "</a>";
			   			if(i+1 != json_obj.length) output += "<a>,</a>";
				   		console.log(output);
			    	}
			   		console.log(output);
					$("#tags").html(output);
				},
			    error : function() {
			    	alert("Error Occured");
			    },
			});	
		}
	</script>	
	
	<script>
		function getTaskInfo(taskid){
			$.ajax({
				url : "BidRelated",
			    dataType : 'html',
				type: "POST",
				data: {
					getTaskInfo: "getTaskInfo",
					taskid: taskid
				},
			    success : function(result) {
			    	var json_obj = $.parseJSON(result);
			    	var min_pay = +json_obj.min_pay;
			    	var max_pay = +json_obj.max_pay;
			    	var mid_pay = ((+min_pay) + (+max_pay))/2;
			    	var range = "&#x20b9; "+min_pay+" -  &#x20b9; "+max_pay;
			    	var subject = json_obj.subject;
			    	var text = json_obj.text;
			    	var comp_ts = json_obj.comp_ts;
			   		var output = "<form action=\"BidRelated\" method=\"post\">"
 								+ "Minimum Payment: <br><input type = \"text\" name = \"amount\"> </br>"
 								+ "Proposed Completion Date:<br> <input type=\"date\" name = \"comp_ts\"> <br>"
 								+ "<input type=\"hidden\" value=\""+taskid+"\" name=\"taskid\" >"
			   					+ "<input type=\"submit\" class=\"button\" name=\"postBid\" value=\"Bid on This Project\" style=\"float: center;\">"
			   					+ "</form>";
					console.log(output);
					$("#subject").html(subject);
					$("#range").html(range);
					$("#text").html(text);
					$("#date").html(comp_ts);
					$("#form").html(output);
				},
			    error : function() {
			    	alert("Error Occured");
			    },
			});	
		}
	</script>
	
	<script>
		getTaskTags(${taskid});
		getTaskInfo(${taskid});
	</script>
		
	
</head>


<body>
	<center> 
	<h1 class "bold" style="text-align:center"><div id="subject"></div></h1>
	<div id="bid"> 
	<fieldset>
		 <h2 align = "left"> Project Description </h2>
		 <div align = "left" id="text"><p class="span8 margin-0 margin-b10" style="word-wrap: break-word;" align = "left"></p></div>
		 <h2 align = "left"> Project Budget (INR) </h2>
		 <font size ="6px" color = "#AEF900"><div align = "left" id="range"><p align = "left"></p></div></font>
		 <h2 align = "left"> Proposed Completion Date </h2>
		 <div align = "left" id="date"><p class="span8 margin-0 margin-b10" style="word-wrap: break-word;" align = "left"></p></div>
		 <h2 align = "left"> Skills required </h2>
		 <div  align = "left" id="tags"><span class="brandname" style="float:left;"></span></div>
		 <div id="form"></div>
 	</fieldset>	
	</div>
	</center>
	
	
	<script>
		var slider = document.getElementById("myRange");
		var output = document.getElementById("demo");
		output.innerHTML = slider.value;
		
		slider.oninput = function() {
		  output.innerHTML = this.value;
		}
	</script>
     
</body>
</html>
    