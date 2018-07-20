<%@include file="aslHead.jsp" %>
<div class='path'>
	SYSTEM <%=sys %> > REQUEST MATERIAL
</div>
<form name='drdo' action='listScMat.jsp' method='POST'>
<br><br>
<table style='width:250px;margin:auto'>
	<tr>
		<th colspan='2'>MATERIAL REQUISITION<BR><BR></th>
	</tr>
	<tr>
		<td class='matReq'>SECTION : </td>
		<td class='matReq'>
			<select name='section' style='width:120px'>
				<option value='0'>------</option>
				<%
				ResultSet rs=stmt.executeQuery("select * from section where system='"+sys+"'");
				while(rs.next()){
					%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
				}
				%>
				<option value="all">All</option>
			</select>
		</td>
	</tr>
	<tr>
		<td class='matReq'>MISSILE : </td>
		<td class='matReq'>
		<select name='missile' style='width:120px'>
				<option value='0'>0</option>
				<%
				for(int i=5;i<40;i++){
					%>
						<option value='<%=i %>'><%=i %></option>
					<%
				}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<th colspan='2'><br><input type='button' value='LIST' class='reqBtn' onclick='submitForm()'/></th>
	</tr>
</table>
</form>
<script>
	function submitForm(){
		document.drdo.submit();
	} 
</script>
<style>
	.matReq{
		font-size:13px;
		font-weight:bold;
		padding:10px 0px 10px 5px;
		background-color:#EEEEEE;
	}
	.reqBtn{
		width:100px;
		background-color:#008299;
		border:0px;
		color:#FFFFFF;
		font-size:bold;
	}
</style>
<%
	rs.close();
	stmt.close();
	con.close();
%>