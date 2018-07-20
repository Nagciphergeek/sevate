<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/status.css">
<script type="text/javascript" src="js/status.js"></script>
<div class='path'>
	SYSTEM <%=sys %> > ISSUE HISTORY
</div>
<hr>
<div style='text-align:center;font-weight:bold;font-size:15px'>ISSUE DETAILS</div>
<br>
<table id='inTab'>
	<tr>
		<th>Request No :
			<select id='reqno' onchange='getHistory()'>
			<option value='0'>---------</option> 
			<%
			ResultSet rs=stmt.executeQuery(" select distinct(reqno),substring(reqno,1,locate('/',reqno,10)-1) as string1,section from issue"+sys+" order by string1,section");
			while(rs.next()){
				%><option value='<%=rs.getString(1) %>'><%=rs.getString(1) %>(<%=rs.getString(3) %>)</option><%
			}
			%>
			</select>
		</th>
	</tr>
</table>
<br>
<div id='resul'></div>
<%
rs.close();
stmt.close();
con.close();
%>
