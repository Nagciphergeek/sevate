<%@include file="aslHead.jsp" %>
<link rel='stylesheet' href='css/bdlNewRequest.css'/>
<script type="text/javascript" src="js/bom.js"></script>
<div class='path'>
	SYSTEM <%=sys %> > BOM UPDATE
</div>
<br><br>
<table style='width:400px;margin:auto'>
	<tr>
		<td>Section :</td>
		<td>
			<select id='section' style='width:120px;' onchange='getBOMD()'><!--  onchange='getDept()' -->
				<option value='0'>--select--</option>
				<%
					ResultSet rs=stmt.executeQuery("select * from section where system='"+sys+"'");
					while(rs.next()){
						%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option>
					<%}
				%>
				<option value='all'>ALL</option>
			</select>
		</td>
		<td>Group :</td>
		<td>
			<select id='dept' style='width:120px;' onchange='getBOMD()'>
				<option value='0'>--select--</option>
				<%
					rs=stmt.executeQuery("select * from dept");
					while(rs.next()){
						%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option>
					<%}
				%>
				<option value='all'>ALL</option>
			</select>
		</td>
	</tr>
</table>
<br><br><br>
<form name='drdo' method='post' action="UpdateBom">
<div id='bomDet' style='width:100%'>

</div>
<br><br><br>
<div style='text-align:center'><input type='submit' value='UPDATE'/></div>
</form>
</body>
</html>
