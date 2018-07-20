<%@include file="bdlHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/bdlNewReqList.css">
<script src="js/bdlNewReqList.js"></script>
<script src="js/jquery.js"></script>
<%
	String section=request.getParameter("section");
	String dept=request.getParameter("dept");
	String miss=request.getParameter("miss");
	session.setAttribute("section", section);
	session.setAttribute("dept", dept);
ResultSet rs=null;
if(dept.equals("all"))
{
 rs=stmt.executeQuery("select * from bom where section='"+section+"' AND system='"+sys+"'");
}
else
{
	 rs=stmt.executeQuery("select * from bom where section='"+section+"' AND dept='"+dept+"' AND system='"+sys+"'");

}
%>
<body onload='checkItAll()'>
<div class='path'>
	SYSTEM <%=sys %>_<%=miss %> > <%=section %> > <%=dept %> > NEW REQUEST
</div>
<hr><hr>
<div style='text-align:center;font-size:32px;font-weight:bold;'>MATERIAL REQUISITION SLIP</div>
<br>
<form name='drdo' action='ExtraRequest' method='post'>
<input type='hidden' name='miss' value='<%=miss %>'/>
<input type='hidden' name='section' value='<%=section %>'/>
<input type='hidden' name='dept' value='<%=dept %>'/>
<table id='listAll'>
	<tr>
		<th style='width:30px;'>SNo</th>
		<th style='width:80px;'>CODE</th>
		<th>NOMENCLATURE</th>
		<th style='width:250px;'>
			<% if(dept.equals("FASTENERS")){ %>
				SIZE
			<% }else{ %>
				DWG No
			<% } %>
		</th>
		<th style='width:50px;'>BOM</th>
		<th style='width:50px;'>REQ<br>QTY</th>
		<th style='width:120px;'>Remark</th>
	</tr>
	<%
	int i=1;
	while(rs.next()){
		%>
		<tr>
			<td style='text-align:center'><%=i %><input type='hidden' value='<%=rs.getInt(1) %>' name='mid'/></td>
			<td style='text-align:center'><%=rs.getString(5) %></td>
			<td style='padding-left:10px'><%=rs.getString(4) %></td>
			<% if(rs.getString(7).equals("1000")){ %>
				<td style='text-align:center'><input type='text' style='width:30px;' name='bom'/></td>
			<%}else{ %>
				<td style='text-align:center'><%=rs.getString(7) %></td>
			<%} %>
			<td style='text-align:center'><%=rs.getString(6) %></td>
			<td style='text-align:center'><input type='text' style='width:30px;' name='reqty'/></td>
			<td style='text-align:center'>
				<input type='text' value='-' name='p<%=rs.getInt(1) %>'/>
			</td>
		</tr>
		<%
		i++;
	}
	%>
</table>
<br><br><br>
<div>
	<table id='btn2'>
		<tr>
			<th><input type='button' value='BACK'/></th>
			<th><input type='button' value='REQUEST' onclick='requestIt1()'/></th>
		</tr>
	</table>
</div>
</form>
<br><br><br><br><br>
</body>
<%
	rs.close();
	stmt.close();
	con.close();
%>