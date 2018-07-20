<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/newMaterial.css">
<script src="js/jquery.js"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/newMaterial.js" type="text/javascript"></script>
<div class='path'>
	SYSTEM <%=sys %> > ADD BOM
</div>
<hr>
<form name='drdo' action='AddMaterial' method='post'>
<table id='newTab'>
	<tr>
		<td class='lab'>NOMENCLATURE : </td><td><input type='text' name='material'/></td>
	</tr>
	<tr>
		<td class='lab'>CODE : </td><td><input type='text' name='code'/></td>
	</tr>
	<tr>
		<td class='lab'>DWG NO : </td><td><input type='text' name='drg'/></td>
	</tr>
	<tr>
		<td class='lab'>BOM QTY : </td><td><input type='text' name='bom'/></td>
	</tr>
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
		<td class='lab'>DEPT : </td>
		<td>
		<select name='dept'>
		<option value='0'>-----</option>
		<%
		rs=stmt.executeQuery("select * from dept");
		while(rs.next()){
			%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
		}
		%>
		</select>
		</td>
	</tr>
	
</table>
<div style='text-align:center' id='divT'>
<input type="checkbox" style="width:10px" name="dummyitem">Check If Dummy
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' value='ADD' onclick='addMaterial()'/>
	<input type="hidden" name="checkstatus"> 
</div>
</form>
<%
rs.close();
stmt.close();
con.close();
%>