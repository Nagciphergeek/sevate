<%@include file="bdlHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/bdlNewReqList.css">
<script src="js/bdlNewReqList.js"></script>
<script src="js/jquery.js"></script>
<%
	String section=request.getParameter("section");
	String miss=request.getParameter("miss");
	session.setAttribute("section", section);
	session.setAttribute("dept", "ALL");
	ResultSet rs1=null;
	Statement stmt1=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from bom where section='"+section+"' AND system='"+sys+"' AND material not in(select material from bdlreq where missile='"+miss+"' AND section='"+section+"' AND system='"+sys+"') AND material not in(select material from issue"+sys+" where missile='"+miss+"' AND section='"+section+"') order by dept");
%>
<body onload='checkItAll()'>
<div class='path'>
	SYSTEM <%=sys %>_<%=miss %> > <%=section %> > ALL MATERIAL >  NEW REQUEST
</div>
<hr><hr>
<div style='text-align:center;font-size:32px;font-weight:bold;'>MATERIAL REQUISITION SLIP</div>
<br>
<form name='drdo' action='NewAllRequest' method='post'>
<input type='hidden' name='miss' value='<%=miss %>'/>
<input type='hidden' name='section' value='<%=section %>'/>
<table id='listAll'>
	<tr>
		<th style='width:30px;'>SNo</th>
		<th style='width:80px;'>CODE</th>
		<th>NOMENCLATURE</th>
		<th style='width:250px;'>SIZE/DWG NO</th>
		<th style='width:50px;'>BOM</th>
		<th style='width:50px;'>Avail Qty</th>
		<th style='width:120px;'>Remark</th>
		<th style='width:50px;'><input type='checkbox' id='selectAll'/></th>
	</tr>
	<%
	String dept="";
	int i=1;
	while(rs.next()){
		rs1=stmt1.executeQuery("select * from "+sys+" where code='"+rs.getString(5)+"' AND material='"+rs.getString(4)+"'");
		if(dept.equals(rs.getString(3))){
		%>
		<tr>
			<td style='text-align:center'><%=i %></td>
			<td style='text-align:center'><%=rs.getString(5) %></td>
			<td style='padding-left:10px'><%=rs.getString(4) %></td>
			<% if(rs.getString(7).equals("1000")){ %>
				<td style='text-align:center'><input type='text' style='width:30px;' name='bom'/></td>
			<%}else{ %>
				<td style='text-align:center'><%=rs.getString(7) %></td>
			<%} %>
			<td style='text-align:center'>
			<% String bom=rs.getString(6);
				if(bom.equals("100000"))
					bom="As Req";
			%>
			<%=bom %></td>
			<td style='text-align:center'>
			<%
				if(rs1.next()){
			%>
			<%=rs1.getString(5) %>
			<%}%>
			</td>
			<td style='text-align:center'>
				<input type='text' value='-' name='p<%=rs.getInt(1) %>'/>
			</td>
			<td style='text-align:center'><input type='checkbox' name='ckItem' value='<%=rs.getInt(1) %>' class='checkIt'/></td>
		</tr>
		<%
		i++;
		}else{
			%><tr><th style='background-color:#DDDDDD' colspan='7'><%=rs.getString(3) %></th></tr><%
			dept=rs.getString(3);
			rs.previous();
		}
		rs1.close();
	}
	%>
</table>
<br><br><br>
<div>
	<table id='btn2'>
		<tr>
			<th><input type='button' value='BACK'/></th>
			<th><input type='button' value='REQUEST' onclick='requestIt()'/></th>
		</tr>
	</table>
</div>
</form>
<br><br><br><br><br>
</body>
<%
	rs.close();
	stmt.close();
	stmt1.close();
	con.close();
%>