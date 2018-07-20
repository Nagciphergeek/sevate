<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<body>
<div class='path'>
	SYSTEM <%=sys %> > SHORTAGE
</div>
<br>
<div style='text-align:center'>SECTION : 
	<select id='section' onchange='getShort()'>
		<option value='0'>----------</option>
		<%
			ResultSet rs=stmt.executeQuery("select * from section where system='"+sys+"'");
			while(rs.next()){
				%>
				<option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option>
				<%
			}
		%>
		<option value='all'>ALL</option>
	</select>
</div>
<%
rs.close();
stmt.close();
con.close();
%>
<script>
function getShort(){
	document.getElementById("section").value;
}
</script>