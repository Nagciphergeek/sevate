<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<body>
<div class='path'>
	SYSTEM <%=sys %> > PLANNING
</div>
<br>
<form name='drdo' action='#' method='POST'>
<table style='width:90%;margin:auto'>
	<tr>
		<td>SECTION : </td>
		<td>
			<select name='section' id='section' onchange='getValues()'>
				<option value='0'>----------</option>
				<%
				ResultSet rs=stmt.executeQuery("select * from section where system='"+sys+"'");
				while(rs.next()){
					%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
				}
				%>
				<option value="all">All</option>
			</select>
		</td>
		<td style='width:50%'></td>
		<td>MISSILE : </td>
		<td>
			<select name='miss' id='miss' onchange='getValues()'>
				<option value='0'>------</option>
				<%
				for(int i=1;i<40;i++){
					%><option value='<%=i %>'><%=i %></option><%
				}
				%>
			</select>
		</td>
	</tr>
</table>
</form>
<br>
<div id='status'>

</div>
<%
rs.close();
stmt.close();
con.close();
%>
<script>
function getValues(){
	var sec=document.drdo.section.value;
	var miss=document.drdo.miss.value;
	if(sec=='0' || miss=='0')
		return;
	ajaxMethod("^2^"+sec+"^"+miss+"^");
}
function ajaxMethod(x){
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
	     document.getElementById("status").innerHTML=ajaxRequest.responseText;
	   }
	 }
	 var queryString = "?x=" + x ;
	 ajaxRequest.open("GET", "Damage" + 
	                              queryString, false);
	 ajaxRequest.send(null); 
}
</script>