<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@include file="aslHead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>ISSUE HISTORY</title>
</head>
<body>



<table border="2px solid grey" width="40%">





<%
String date=request.getParameter("x");

ResultSet rs1=stmt.executeQuery("select distinct(reqno) from issue"+sys+" where issuedate='"+date+"'");
while(rs1.next())
{
	%>
<tr>
<td><a href="IssuesubmitHistory.jsp?x=<%=rs1.getString(1)+"^"+date %>"><%=rs1.getString(1) %></a></td>


</tr>
<%
}
%>

</table>
</body>
</html>