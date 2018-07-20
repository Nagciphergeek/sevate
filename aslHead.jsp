<%@include file="DbCon.jsp" %>
	<%
		if(session.getAttribute("user")==null){
			%><jsp:forward page="index.html" /><%
		}
		String user=(String)session.getAttribute("user");
		String userty=(String)session.getAttribute("userty");
		String sys=(String)session.getAttribute("sys");
		if(!(userty.equals("1") || userty.equals("2") || userty.equals("3") || userty.equals("5"))){
			%><jsp:forward page="logout.jsp" /><%
		}
		stmt.executeUpdate("update bcnot set inid='0' where inid is null");
	
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<link rel="stylesheet" type="text/css" href="css/index.css">

<%if(userty.equals("2") || userty.equals("5")){ %>
<body onload='getAlert1()'>
<%}else{ %>
<body>
<%} %>
	<table class='header'>
			<tr>
				<td style='width:40%'>
					<table>
						<tr>
							<td><img src='images/l1.png' style='height:100px'/></td>
							<td>
								<span class='defence'>DEFENCE RESEARCH &amp;<br>DEVELOPMENT ORGANISATION</span><br>
								<span class='subS'>Ministry Of Defence, Govt. Of India</span>
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
				<!--  <td style="color:red;"><blink>Please Observe Changes are Going on</blink></td>-->
				<td style="color:red;" id="notify"><blink><label for="show">Please Observe Changes are Going on</label></blink></td>
			</tr>
	</table>
	<div id="notification">
	
	
	</div>
	<table class='menuBar'>
		<%if(user.equals("venu")){ %>
		<%if(user.equals("venu")){%>
		<tr>
		
			  <td id='system'>SYSTEM
				<ul id='dropM'>
					<li onclick='ajaxXYZ("^1^A1^")'>SYSTEM A1</li>
					<li onclick='ajaxXYZ("^1^A3^")'>SYSTEM A3</li>
					<li onclick='ajaxXYZ("^1^A4^")'>SYSTEM A4</li>
					<li onclick='ajaxXYZ("^1^A5^")'>SYSTEM A5</li>
				</ul>				
			</td>
			<%} %>
			<td onclick="window.location='#'">HOME</td>
			<td onclick="window.location='bom.jsp'">BOM</td>
			<%if(userty.equals("3") || userty.equals("5")){%>
			<td onclick="window.location='newissuehistory.jsp'">ISSUEHISTORY</td>
			
			<%} %>
			<td onclick="window.location='logout.jsp'">LOGOUT</td>
		</tr>
		<%} else{ %>
		<tr>
		<%if(userty.equals("5")||user.equals("Kishore Matta")){%>
			  <td id='system'>SYSTEM
				<ul id='dropM'>
					<li onclick='ajaxXYZ("^1^A1^")'>SYSTEM A1</li>
					<li onclick='ajaxXYZ("^1^A3^")'>SYSTEM A3</li>
					<li onclick='ajaxXYZ("^1^A4^")'>SYSTEM A4</li>
					<li onclick='ajaxXYZ("^1^A5^")'>SYSTEM A5</li>
				</ul>				
			</td>
			<%} %>
			<td onclick="window.location='aslMenu.jsp'">HOME</td>
			<td onclick="window.location='bom.jsp'">BOM</td>
			<%if(userty.equals("3") || userty.equals("5")){%>
			<td onclick="window.location='inwarddecide.jsp'">INWARD</td>
			<td id="bdl" onclick="window.location='bdl.jsp'" >BDL</td>
			<td onclick="window.location='newMaterial.jsp'">ADD NEW MATERIAL</td>
			<%} %>
			<td onclick="window.location='logout.jsp'">LOGOUT</td>
		</tr>
		<%} %>
	</table>
	<hr>
	<a href='aslProfile.jsp'>
	<div id='pro'>
		<%=user %>
	</div>
	</a>
	<%
	if(userty.equals("2")){
	%>
	<div class='chatTab' onclick='openChat()'></div>
	<div class='chatMsgBox' id='chatMsgBox'>
		<div id='chatTab' onclick='closeChat()'></div>
		<select name='user' id='uss' style='width:250px;'>
			<option value='0'>-------</option>
			<%
			ResultSet rsf=stmt.executeQuery("select * from login1 where type='2'");
			while(rsf.next()){
				%>
				<option value='<%=rsf.getString(4) %>'><%=rsf.getString(4) %></option>
				<%
			}
			%>
		</select>
		<div id='showMSG'>
		<%
			rsf=stmt.executeQuery("select * from chat where fromq='"+user+"' OR to1='"+user+"'");
		while(rsf.next()){
			if(rsf.getString(2).equals(user)){
				%>
				<div class='showMS'><div style='font-weight:bold;color:green'>ME---><%=rsf.getString(3) %></div><%=rsf.getString(4) %></div><hr>
				<%
			}
			if(rsf.getString(3).equals(user)){
				%>
				<div class='fromMsg'><div style='font-weight:bold;color:green'><%=rsf.getString(2) %></div><%=rsf.getString(4) %></div><hr>
				<%
			}
		}
		%>
		</div>
		<div class='chatMgsType'>
			<textarea name='msgType' id='msgType'></textarea>
		</div>
		<input type='button' value='SEND' class='chatSendBtn' onclick='getMSG()'/>
	</div>
	
	<%} %>
	
	
	
	
	
	
	
	
	
	
	
	
	</body>
	<script>
	function getAlert1(){
		setInterval(function(){
			var obj=document.getElementById("showMSG");
			obj.scrollTop=obj.scrollHeight;
			reloadChat();},10000);	
	}
	function reloadChat(){
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
		      document.getElementById("showMSG").innerHTML=ajaxRequest.responseText;
		   }
		 }
		 var x="sd";
		 var queryString = "?x=" + x ;
		 ajaxRequest.open("GET", "Login" + 
		                              queryString, false);
		 ajaxRequest.send(null); 
	}
	
	
	
	
	
	
	
	
	
	
	
		function getMSG(){
			if(document.getElementById('uss').value=='0'){
				alert("Select Person");
				return;
			}
			var x="^"+document.getElementById('msgType').value+"^"+document.getElementById('uss').value+"^";
			var res="<div class='showMS'><div style='font-weight:bold;color:green'>ME--->"+document.getElementById('uss').value+"</div>"+document.getElementById('msgType').value+"</div><hr>";
			document.getElementById('showMSG').innerHTML+=res;
			document.getElementById('msgType').value="";
			document.getElementById('msgType').focus();
			var obj=document.getElementById("showMSG");
			obj.scrollTop=obj.scrollHeight;
			chatMsg(x);
		}
		function chatMsg(x){
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
			      
			   }
			 }
			 var queryString = "?x=" + x ;
			 ajaxRequest.open("GET", "Chat" + 
			                              queryString, false);
			 ajaxRequest.send(null); 
		}
		
		
		function openChat(){
			document.getElementById("chatMsgBox").style.display='block';
		}
		function closeChat(){
			document.getElementById("chatMsgBox").style.display='none';
		}
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