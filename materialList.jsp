<%@include file="aslHead.jsp" %>
<div class='path'>
	SYSTEM <%=sys %> > MATERIAL LIST
</div>
<br>
<table id='tab'>
	<tr>
		<th>CODE</th>
		<th>NOMENCLATURE</th>
		<th>DWG NO</th>
		<th>AVAIL QTY</th>
		<th>INVENTORY</th>
		<th>LOCATION</th>
	</tr>
	<%
		ResultSet rs=stmt.executeQuery("select * from "+sys);
		while(rs.next()){
			%>
			<tr>
				<td style='width:80px;text-align:center'><%=rs.getString(3) %></td>
				<td><%=rs.getString(2) %></td>
				<td style='width:160px;text-align:center'><%=rs.getString(4) %></td>
				<td style='width:40px;text-align:center'><%=rs.getString(5) %></td>
				<td style='width:180px;text-align:center'><%=rs.getString(6) %></td>
				<td style='width:100px;text-align:center'><%=rs.getString(7) %></td>
			</tr>
			<%
		}
	%>
</table>
<br><br>
<style>
	#tab{
		width:90%;
		margin:auto;
		border-collapse:collapse;
	}
	#tab td{
		border:1px solid;
		font-size:12px;
	}
	#tab tr:nth-child(odd){ 
		background: #b8d1f3;
	}
	#tab tr:nth-child(even){
		background: #dae5f4;
	}	
</style>