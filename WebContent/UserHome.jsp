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
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Welcome Page</title>
		
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
		
		<script>
			function getBids(){
				$.ajax({
					url : "BidRelated",
				    dataType : 'html',
					type: "POST",
					data: {
						getBidsOnUnassignedTasks: "getBidsOnUnassignedTasks"
					},
				    success : function(result) {
				    	var json_obj = $.parseJSON(result);
				   		console.log(output);
				   		for(i=0; i<json_obj.length; i++){
							var bid = json_obj[i];
							var output = bid.subject;
							output += "&nbsp; &nbsp; Posted on: "
							output += bid.post_ts;
							output += "<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+bid.fname+"&nbsp;&nbsp;&nbsp;&nbsp";
							date = bid.comp_ts.split();
							output += "&nbsp;&nbsp;&nbsp;&nbsp"+bid.amount+"&nbsp;&nbsp;&nbsp;&nbsp"+bid.rating; 
							date += bid.comp_ts;
/*							while(bid.subject == json_obj[i].subject){
								
							}
							output +="<tr>"
								    +"<th>"+bid.subject+"</th>"
								    +"<th>"+bid.comp_ts+"</th>"
								    +"<th>"+bid.amount+"</th>"
								    +"<th>"+bid.fname+"</th>"
								    +"<th>"+bid.rating+"</th>"
								  	+"</tr>";
			    	  	}
						output += "</table>";*/
				    	}
				   		console.log(output);
						$("#bidInfo").html(output);
					},
				    error : function() {
				    	alert("Error Occured");
				    },
				});	
			}
		</script>
		
		<script>
			getBids();
		</script>
		
	</head>
	<body>
		<div id="bidInfo"></div>
	</body>
</html>