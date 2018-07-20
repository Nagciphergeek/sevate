<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/inwardDet.css">
<hr>
<div style='text-align:center;font-weight:bold;font-size:15px'>INWARD DETAILS</div>
<br>
<table id='inTab'>
	<tr>
		<th>SNo</th>
		<th>CODE</th>
		<th>NOMENCLATURE</th>	
		<th>DWG NO</th>
		<th>INWARD QTY</th>
		<th>INWARD BY</th>
		<th>DATE</th>
		<th>VIEW/EDIT</th>
	</tr>
	<%
	ResultSet rs=stmt.executeQuery("select * from inward"+sys+" order by id desc");
	int i=0;
	while(rs.next()){
		i++;
		%>
		<% if(rs.getString(10).length()>5){ %>
		<tr>
		<%}else{ %>
		<tr style='background-color:#E1F4EE'>
		<%} %>
			<td style='width:30px;text-align:center'><%=i %></td>
			<td style='width:80px;text-align:center'><%=rs.getString(3) %></td>
			<td><%=rs.getString(2) %></td>
			<td style='width:150px;text-align:center'><%=rs.getString(4) %></td>
			<td style='width:40px;text-align:center'><%=rs.getString(8) %></td>
			<td style='width:150px;text-align:center'><%=rs.getString(14) %></td>
			<td style='width:100px;text-align:center'><%=rs.getString(9) %></td>
			<td style='text-align:center'><input type='button' value='REPORT' onclick="window.location='reportUp.jsp?x=<%=rs.getInt(1) %>'"/><input type='button' value='EDIT' onclick="window.location='inwardEd.jsp?x=<%=rs.getInt(1) %>'"/><input type='button' value='DELETE' onclick="window.location='inwardDel.jsp?x=<%=rs.getInt(1) %>'"/></td>
		</tr><%
	}
	%>
</table>
<%
rs.close();
stmt.close();
con.close();
%>