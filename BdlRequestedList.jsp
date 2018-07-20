<%@include file="bdlHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/bdlNewReqList.css">
<%
String result=(String)session.getAttribute("result");
%>
<br>
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
<div id='designTab'>
	<%=result %>
</div>
<br><br>

<table style='width:1000px;margin:auto' id='genrate'>
	<tr>
		<th><input type='button' value='PRINT' onclick="window.open('NewRequestReport?req=<%=req %>')"/></th>
		<th><input type='button' value='BACK' onclick="window.location='newRequest.jsp'"/></th>
	</tr>
</table>


<%
	stmt.close();
	con.close();
%>