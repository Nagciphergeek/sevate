<%@include file="bdlHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/bdlNewReqList.css">
<%
	String miss=(String)session.getAttribute("miss");
	String section=(String)session.getAttribute("section");
	String dept=(String)session.getAttribute("dept");
	String req=(String)session.getAttribute("req");
%>
<div class='path'>
	SYSTEM <%=sys %>_<%=miss %> > <%=section %> > <%=dept %> > REQUESTED MATERIAL LIST
</div>
<hr><hr>
<div style='text-align:center;font-size:32px;font-weight:bold;'>MATERIAL REQUISITION SLIP</div>
<br>
<table id='headD'style='width:1000px;margin:auto'>
	<tr>
		<td style='width:120px'>SYSTEM : </td>
		<td><%=sys %>_<%=miss %></td>
		<td></td>
		<td style='width:80px'>REQ NO : </td>
		<td style='width:180px'><%=req %></td>
	</tr>
	<tr>
		<td>SECTION : </td>
		<td><%=section %></td>
		<td style='width:300px;'></td>
		<td></td>
		<td></td>
	</tr>
</table>
<br>
<%
	ResultSet rs=stmt.executeQuery("select * from bdlreq where reqno='"+req+"'");
%>
<table id='listReq'>
	<tr>
		<th>SNO</th><th style='width:100px'>CODE</th><th>NOMENCLATURE</th><th style='width:150px'>DWG NO / SIZE</th><th style='width:30px'>BOM</th><th style='width:150px;'>REMARKS<th>
	</tr>
	<%
		int i=1;
		while(rs.next()){
			%><tr><td style='text-align:center'><%=i %></td><td style='text-align:center'><%=rs.getString(7) %></td><td><%=rs.getString(6) %></td><td style='text-align:center'><%=rs.getString(8) %></td><td style='text-align:center'><%=rs.getString(9) %></td><td style='text-align:center'><%=rs.getString(16) %></td></tr><%
					i++;
		}
	%>
</table>
<br><br>

<table style='width:1000px;margin:auto' id='genrate'>
	<tr>
		<th><input type='button' value='PRINT' onclick="window.open('NewRequestReport?req=<%=req %>')"/></th>
		<th><input type='button' value='BACK' onclick="window.location='newRequest.jsp'"/></th>
	</tr>
</table>


<%
	rs.close();
	stmt.close();
	con.close();
%>