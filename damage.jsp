<%@include file="bdlHead.jsp" %>
<script src="js/damage.js" type="text/javascript"></script>
<div class='path'>
	SYSTEM <%=sys %> > RETURN
</div>
<br>
<form name='drdo' method='post' action='Damage'>
<table style='width:500px;margin:auto'>
	<tr>
		<td>Request No :</td>
		<td>
			<select id='reqno' name='reqnoo' onchange='getDetails()'>
				<option value='0'>-------</option>
				<%
				//ResultSet rs=stmt.executeQuery("select distinct(reqno) from issue"+sys+" order by reqno" );
ResultSet rs=stmt.executeQuery("select distinct(reqno),substring(reqno,1,locate('/',reqno,10)-1) as string1,section from issue"+sys+" order by string1,section" );
				while(rs.next()){
					%><option value='<%=rs.getString(1) %>'><%=rs.getString(1) %></option><%
				}
				%>
				<option value='2'>Other</option>
			</select>
		</td>
	</tr>
</table>
<div id='status'>

</div>
</form>
<style>
.bcno{
	position:fixed;
	top:120px;
	right:120px;
	width:300px;
	height:300px;
	background-color:#AFA387;
	border:10px inset #888888;
	display:none;
}
</style>