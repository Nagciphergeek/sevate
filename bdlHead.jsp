<%@include file="DbCon.jsp" %>
	<%
		if(session.getAttribute("user")==null){
			%><jsp:forward page="index.html" /><%
		}
		String user=(String)session.getAttribute("user");
		String userty=(String)session.getAttribute("userty");
		String sys=(String)session.getAttribute("sys");
		if(userty.equals("1") || userty.equals("2") || userty.equals("3")){
			%><jsp:forward page="index.html" /><%
		}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="css/index.css">
<body>
	<table class='header'>
			<tr>
				<td style='width:40%'>
					<table>
						<tr>
							<td><img src='images/l1.png' style='height:100px'/></td>
							<td>
								<span class='defence'>DEFENCE RESEARCH &amp;<br>DEVELOPMENT ORGANISATION</span><br>
								Ministry Of Defence, Govt. Of India
							</td>
						</tr>					
					</table>
				</td>
				<td style='text-align:center'>
					<img src='images/l2.png' style='height:80px'/>
				</td>
				<td style='width:40%;text-align:center'>
					<div class='def'>CAS</div>
					<span class='defence'>
						CENTER FOR ADVANCED SYSTEMS
					</span>
				</td>
			</tr>
	</table>
	<table class='menuBar'>
		<tr>
			<td id='system'>SYSTEM
				<ul id='dropM'>
					<li onclick='ajaxXYZ("^1^A1^")'>SYSTEM A1</li>
					<li onclick='ajaxXYZ("^1^A3^")'>SYSTEM A3</li>
					<li onclick='ajaxXYZ("^1^A4^")'>SYSTEM A4</li>
					<li onclick='ajaxXYZ("^1^A5^")'>SYSTEM A5</li>
				</ul>				
			</td>
			<td onclick="window.location='bdlMenu.jsp'">HOME</td>
			<td onclick="window.location='newRequest.jsp'">NEW REQUEST</td>
			<td onclick="window.location='extraReq.jsp'">EXTRA REQUEST</td>
			<td onclick="window.location='allReq.jsp'">REQUEST</td>
			<td onclick="window.location='logout.jsp'">LOGOUT</td>
		</tr>
	</table>
	<hr>
	<a href='bdlProfile.jsp'>
	<div id='pro'>
		<%=user %>
	</div>
	</a>
	</body>
	<script>
		function ajaxXYZ(x){
			var ajaxRequest;
			 try{
			   ajaxRequest = new XMLHttpRequest();
			 }catch (e){
			   try{
			      ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
			   }catch (e) {
			      try{
			         ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
			      }catch (e){
			         alert("Your browser broke!");
			         return false;
			      }
			   }
			 }
			 ajaxRequest.onreadystatechange = function(){
			   if(ajaxRequest.readyState == 4){
			      location.reload();
			   }
			 }
			 var queryString = "?x=" + x ;
			 ajaxRequest.open("GET", "Session" + 
			                              queryString, false);
			 ajaxRequest.send(null); 
		}
</script>