<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/newMaterial.css">
<script src="js/jquery.js"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/newMaterial.js" type="text/javascript"></script>
<div class='path'>
	SYSTEM <%=sys %> > ADD GROUP
</div>
<hr>
<form name='drdo' action='addGroup1.jsp' method='post'>
<table id='newTab'>
	
	<tr>
		<td class='lab'>SECTION : </td>
		<td>
		<select name='sec'>
		<option value='0'>-----</option>
		<%
		ResultSet rs=stmt.executeQuery("select * from section where system='"+sys+"'");
		while(rs.next()){
			%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
		}
		%>
		</select>
		</td>
	</tr>
	<tr>
		
		<td class='lab'>Dept : </td><td><input type='text' name='dept'/></td>
	</tr>
	<tr><td class='lab'><input type='submit' value='Add Group'> </td>
	</tr>
</table>

</form>
<%
rs.close();
stmt.close();
con.close();
%>