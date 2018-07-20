<link rel="stylesheet" type="text/css" href="css/listMaterial.css">
<body id='bodd'>
<%@include file="aslHead.jsp" %>
<%
	String reqno=(String)session.getAttribute("reqno");
	String given=(String)session.getAttribute("given");
	ResultSet rs=stmt.executeQuery("select * from issuesc where reqno="+reqno+" AND given='"+given+"'");
	rs.next();
%>
<div class='path'>
	SYSTEM <%=sys %>_<%=rs.getString(4) %> > <%=rs.getString(3) %> > LIST OF ITEMS ISSUED
</div>

<form name='drdo' method='post' action='IssueASL'>
<div id='printt'>
<div style='text-align:center'>
	<h2>LIST OF MATERIAL ISSUED ASL</h2>
</div>
<table id='listHead1'>
	<tr>
		<td>REF NO </td>
		<td>ASL/<%=sys %>_<%=rs.getString(4) %>/0<%=reqno %></td>
		<td style='width:500px;'></td>
		<td>DATE</td>
		<td><%=rs.getString(15) %></td>
	</tr>
	<tr>
		<td>SECTION </td>
		<td><%=rs.getString(3) %></td>
		<td style='width:500px;'></td>
		<td>REQUESTED BY</td>
		<td><%=rs.getString(13) %></td>
		<%String uu=rs.getString(13); %>
	</tr>
</table>
<br><br>
<input type='hidden' name='reqno' value='<%=reqno %>'/>
<table id='listHead2' border='1'>
	<tr>
		<th>SNO</th><th>CODE</th><th>NOMENCLATURE</th><th>DWG NO</th>
		<!-- <th>BOM<br>QTY</th> --><th>ISSUED<br>QTY</th><th>REMARKS</th>
	</tr>
<%
	rs.previous();
	int i=1;
	while(rs.next()){
%>
		<tr>
			<td style='width:30px;text-align:center'>
			<%=i %>
			<input type='hidden' name='bdlreqid' value='<%=rs.getInt(1) %>'/>
			</td>
			<td style='width:80px;text-align:center'><%=rs.getString(7) %></td>
			<td><%=rs.getString(6) %></td>
			<td style='width:200px;text-align:center'><%=rs.getString(8) %></td>
			<!-- <td style='width:50px;text-align:center'><%=rs.getString(9) %></td> -->
			<td style='width:50px;text-align:center'><%=rs.getString(11) %></td>
			<td style='width:200px;text-align:center'><%=rs.getString(16) %>
			</td>
		</tr>
		<%
		i++;
		
}
%>
</table>
<input type='hidden' name='given' value='<%=given %>'/>
<br><br>
<div style='width:90%;text-align:right'><%=uu %></div>
</div>
<table id='btns'>
	<tr>
		<th><input type='button' value='PRINT' onclick="getValues()" /></th>
		<th><input type='button' value='BACK' onclick='window.location="requestList.jsp"'/></th>
	</tr>
</table>
</form>
<br><br>
</body>
<script>
function getValues(){
	var x=document.getElementById("bodd").innerHTML;
	document.getElementById("bodd").innerHTML=document.getElementById("printt").innerHTML;
	window.print();
	document.getElementById("bodd").innerHTML=x;
}
</script>