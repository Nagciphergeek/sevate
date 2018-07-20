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
	if(!dept.equals("all"))
		rs=stmt.executeQuery("select * from bom where section='"+section+"' AND dept='"+dept+"' AND system='"+sys+"'");
	else
		rs=stmt.executeQuery("select * from bom where section='"+section+"' AND system='"+sys+"'");
	ResultSet rs1=null;
	Statement stmt1=con.createStatement();
%>
<body onload='checkItAll()'>
<div class='path'>
	SYSTEM <%=sys %>_<%=miss %> > <%=section %> > <%=dept %> > NEW CAS REQUEST
</div>
<hr><hr>
<div style='text-align:center;font-size:32px;font-weight:bold;'>MATERIAL REQUISITION SLIP</div>
<br>
<form name='drdo' action='NewRequest' method='post'>
<input type='hidden' name='miss' value='<%=miss %>'/>
<input type='hidden' name='section' value='<%=section %>'/>
<input type='hidden' name='dept' value='<%=dept %>'/>
<input type='hidden' name='casrequest' value='casrequest'/>
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
		<th style='width:50px;'>Avail Qty</th>
		<th style='width:120px;'>Remark</th>
		<th style='width:50px;'><input type='checkbox' id='selectAll'/></th>
	</tr>
	<%
	int i=1;
	while(rs.next()){
		rs1=stmt1.executeQuery("select * from "+sys+" where code='"+rs.getString(5)+"' AND material='"+rs.getString(4)+"'");
		%>
		<tr>
			<td style='text-align:center'><%=i %></td>
			<td style='text-align:center'><%=rs.getString(5) %></td>
			<td style='padding-left:10px'><%=rs.getString(4) %></td>
			<td style='text-align:center'><%=rs.getString(7) %></td>
			<td style='text-align:center'>
			<%if(rs.getString(6).equals("100000")){ %>
			As Req
			<%}else{ %>
			<%=rs.getString(6) %>
			<%} %>
			
			</td>
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
		rs1.close();
	}
	%>
</table>
<br><br><br>
<div>
	<table id='btn2'>
		<tr>
			<th><input type='button' value='BACK' onclick='window.location="newRequest.jsp"'/></th>
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