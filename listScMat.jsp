<%@include file="aslHead.jsp" %>
<div class='path'>
	SYSTEM <%=sys %> > REQUEST MATERIAL
</div>
<%
String section=request.getParameter("section");
String missile=request.getParameter("missile");
%>
<br>
<div style='text-align:center;FONT-WEIGHT:BOLD'>MATERIAL REQUISITION LIST</div>
<br>
<table style='width:90%;margin:auto'>
	<tr>
		<td style='width:50%'>
			<table class='topTabb'>
				<tr>
					<td style='width:120px'>SECTION : </td><td><%=section %></td>
				</tr>
				<tr>
					<td style='width:120px'>MISSILE : </td><td><%=missile %></td>
				</tr>
			</table>
		</td>
		<td>
			<table class='topTabb'>
				<tr>
					<td style='text-align:right'>DATE : </td><td style='width:120px'><%=ft.format(dNow) %></td>
				</tr>
				<tr>
					<td style='text-align:right'>REQ BY : </td><td style='width:120px'><%=user %></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<br>
<form name='drdo' action='ScRequest' method='POST'>
<input type='hidden' value='<%=section %>' name='section'/>
<input type='hidden' value='<%=missile %>' name='missile'/>
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
	ResultSet rs=null;
	if(section.equals("all"))
	{
		rs=stmt.executeQuery("select * from bom where system='"+sys+"' order by dept");
	}
	else
	{
		rs=stmt.executeQuery("select * from bom where system='"+sys+"' AND section='"+section+"' order by dept");
	}
	int i=1;
	String dept="";
	while(rs.next()){
		if(!dept.equals(rs.getString(3))){
			dept=rs.getString(3);
			%>
			<tr><th colspan='6' style='background-color:#EEEEEE'><%=dept %></th></tr>
			<%
		}
		%>
			<tr>
				<td style='text-align:center'><%=i %><input type='hidden' value='<%=rs.getInt(1) %>' name='sno'/></td>
				<td style='text-align:center'><%=rs.getString(5) %></td>
				<td><%=rs.getString(4) %></td>
				<td style='text-align:center'><%=rs.getString(7) %></td>
				<%
				if(rs.getString(6).equals("100000")){
					%><td style='text-align:center'>As Req</td><%
				}else{%>				
				<td style='text-align:center'><%=rs.getString(6) %></td>
				<%} %>
				<td style='text-align:center'><input type='text' name='reqQty' style='width:40px;text-align:center'/></td>
			</tr>
		<%
		i++;
	}
%>
</table>
<br><br>
<table style='width:90%;margin:auto'>
	<tr>
		<th style='width:49%'>
			<input type='button' value='REQUEST' onclick='submitForm()'/>
		</th>
		<th>
			<input type='button' value='BACK' onclick='window.location="scReqMat.jsp"'/>
		</th>
	</tr>
</table>
</form>
<br><br>
<br><br>
<%
	rs.close();
	stmt.close();
	con.close();
%>
<style>
	.listTabb{
		border-collapse:collapse;
		width:90%;
		margin:auto;
		font-size:12px;
	}
	.topTabb{
		width:100%;
		font-size:14px;
		font-weight:bold;
	}
</style>
<script>
	function submitForm(){
		var x=document.getElementsByName("reqQty");
		var i=x.length;
		var xx=0;
		for(var j=0;j<i;j++){
			if(!x[j].value==""){
				xx++;
			}
		}
		if(xx==0){
			alert("Enter Atleast One Material Quantity");
			return;
		}
		for(var j=0;j<i;j++){
			if(isNaN(x[j].value)){
				alert("Should be a Number");
				return;
			}
		}
		document.drdo.submit();
	}
</script>