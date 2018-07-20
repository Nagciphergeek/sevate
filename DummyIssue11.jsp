<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/status.css">
<script type="text/javascript" src="js/status.js"></script>
<div class='path'>
	SYSTEM <%=sys %> > DUMMY ISSUE HISTORY
</div>
<hr>
<div style='text-align:center;font-weight:bold;font-size:15px'>DUMMY ISSUE DETAILS</div>
<br>
<div align=center>
<table border=1px solid>
<tr><th>code</th><th>material</th><th>section</th><th>missile</th><th>dept</th><th>reqqty</th><th>issqty
</th><th>reqby</th><th>issby</th><th>issuedate</th></tr>
<% ResultSet rs=stmt.executeQuery("select * from issuedummy where system='"+sys+"'");

while(rs.next())
{
	%>
<tr>
<td><%=rs.getString(7)%></td>
<td><%=rs.getString(6)%></td>

<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(13)%></td>
<td><%=rs.getString(14)%></td>


<td><%=rs.getString(16)%></td>
<td><%=rs.getString(17)%></td>
<td><%=rs.getString(18)%></td>
</tr>


<%

}
%>
</table>
</div>
<% 
rs.close();
stmt.close();
con.close();
%>
