<%@include file="aslHead.jsp" %>
<link rel='stylesheet' href='css/bdlNewRequest.css'/>
<script type="text/javascript" src="js/bom.js"></script>
<div class='path'>
	SYSTEM <%=sys %> > BOM
</div>
<br><br>
<table style='width:800px;margin:auto'>
	<tr>
		<td>Section :</td>
		<td>
			<select id='section' style='width:120px;' onchange='getBOM()'><!--  onchange='getDept()' -->
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
			<select id='dept' style='width:120px;' onchange='getBOM()'>
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
		<td><input type="text" name="searchentry" id="searchentry1" placeholder="Search CODE/NOMENCLATURE" onchange='getBOM()'>
		</td>
		
	</tr>
</table>
<br><br><br>
<div id='bomDet' style='width:100%'>

</div>
<br><br><br>
</body>
</html>
