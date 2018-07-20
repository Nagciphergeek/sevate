<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<body>

<div class='path'>
	SYSTEM <%=sys %> > EDIT BOM
</div>
<table class='menuT'>
	<tr>
		<th><input type='button' value='ADD NEW MATERIAL' class='inward' onclick='window.location="newMaterial.jsp"'/></th>
		<th><input type='button' value='BOM QUANTITY' class='inward' onclick='window.location="updateBom.jsp"'/></th>
	</tr>
	<tr>
<% if(userty.equals("5")){%>
		<th><input type='button' value='ASSIGN MATERIAL' class='inward' onclick='window.location="assignMaterial.jsp"'/></th>
<%}%>
		<th><input type='button' value='DESCRIPTION' class='inward' onclick='window.location="#"'/></th>
	</tr>
	<tr>
		<th><input type='button' value='' class='inward' onclick='window.location="#"'/></th>
		<th><input type='button' value='' class='inward' onclick='window.location="#"'/></th>
	</tr>
</table>
<br>
</body>
<%
	stmt.close();
	con.close();
%>