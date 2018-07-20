<%@include file="bdlHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/bdlNewRequest.css">
<script src="js/newRequest.js"></script>
<div class='path'>
	SYSTEM <%=sys %> > NEW REQUEST
</div>
<hr><hr>
<%try{ %>
<form name='drdo'>
<table id='reqTab'>
	<tr>
		<td>Select Section : </td>
		<td>
			<select name='section'>
				<option value='0'>--------</option>
				<%
				ResultSet rs=stmt.executeQuery("select * from section where system='"+sys+"'");
				while(rs.next()){
					
					%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
				}
				%>
			</select>
		</td>
	</tr>
	<tr>
		<td>Select Group : </td>
		<td>
			<select name='dept'>
				<option value='0'>--------</option>
				<%
				rs=stmt.executeQuery("select * from dept");
				while(rs.next()){
					%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
				}
				%>
				<option value='all'>ALL</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>Select Missile : </td>
		<td>
			<select name='miss'>
				<option value='0'>-----</option>
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
</table>

<div style='text-align:center'>
	
	<input type='button' class='reqBtn' value='REQUEST' onclick='requestPage()'/>&nbsp;&nbsp;&nbsp;
	<%
	if(user.equals("admin1")||user.equals("Shri Praveen Tondon"))
	{	
		%>
		<input type='button' class='reqBtn' value='CAS_REQUEST' onclick='requestPageCAS()'/>
		<%
	}
	%>
	
	
</div>
</form>
<%
	rs.close();
	stmt.close();
	con.close();
}catch(Exception e){System.out.print(e);}
%>