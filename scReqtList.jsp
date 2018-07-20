<body id='bob'>

<%@include file="aslHead.jsp" %>
<div class='path'>
	SYSTEM <%=sys %> > REQUEST LIST
</div>
<%
	int reqno=(Integer)(session.getAttribute("reqno"));
	ResultSet rs=stmt.executeQuery("select * from screq where reqno='"+reqno+"'");
	rs.next();
%>
<br><br>
<div id='print'>
	<div class='topHeader'>
		MATERIAL REQUESITION SLIP
	</div>
	<table style='width:90%;margin:auto'>
	<tr>
		<td style='width:50%'>
			<table class='topTabb'>
				<tr>
					<td style='width:120px'>REQNO : </td><td>ASL/<%=sys %>_<%=rs.getString(4) %>/0<%=reqno %></td>
				</tr>
				<tr>
					<td style='width:120px'>SECTION : </td><td><%=rs.getString(3) %></td>
				</tr>
			</table>
		</td>
		<td>
			<table class='topTabb'>
				<tr>
					<td style='text-align:right'>DATE : </td><td style='width:100px'><%=ft.format(dNow) %></td>
				</tr>
				<tr>
					<td style='text-align:right'></td><td></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br><br>


<table border='1' class='listTabb'>
	<tr>
		<th>SNO</th>
		<th>CODE</th>
		<th>MATERIAL</th>
		<th>DWG</th>
		<th>BOM</th>
		<th>REQ QTY</th>
	</tr>	
<%
rs=stmt.executeQuery("select * from screq where reqno='"+reqno+"'");
	int i=1;
	String dept="";
	while(rs.next()){
		if(!dept.equals(rs.getString(5))){
			dept=rs.getString(5);
			%>
			<tr><th colspan='6' style='background-color:#EEEEEE'><%=dept %></th></tr>
			<%
		}
		%>
			<tr>
				<td style='text-align:center'><%=i %></td>
				<td style='text-align:center'><%=rs.getString(7) %></td>
				<td><%=rs.getString(6) %></td>
				<td style='text-align:center'><%=rs.getString(8) %></td>
				<%
				if(rs.getString(9).equals("100000")){
					%><td style='text-align:center'>As Req</td><%
				}else{%>				
				<td style='text-align:center'><%=rs.getString(9) %></td>
				<%} %>
				<td style='text-align:center'><%=rs.getString(10) %></td>
			</tr>
		<%
		i++;
	}
%>
</table>
<br><br><br>
<div style='width:90%;text-align:right;font-size:14px;font-weight:bold'>
	<%=user %>
</div>
<style>
	.listTabb{
		border-collapse:collapse;
		width:90%;
		margin:auto;
		font-size:12px;
	}
	.topHeader{
		font-size:20px;
		font-weight:bold;
		text-align:center;
	}.topTabb{
		width:100%;
		font-size:14px;
		font-weight:bold;
	}
</style>
</div>
<div style='text-align:center'>
	<input type='button' value='PRINT' onclick='getPrint()'/>
</div>
</body>

<script>
	function getPrint(){
		var xt=document.getElementById("bob").innerHTML;
		document.getElementById("bob").innerHTML=document.getElementById("print").innerHTML;
		window.print();
		document.getElementById("bob").innerHTML=xt;
	}
</script>
<%
rs.close();
stmt.close();
con.close();
%>