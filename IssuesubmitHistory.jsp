<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@include file="aslHead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<table style="color:white;" border="2px solid Grey" width="80%" bgcolor="Grey" >
<tr><th>REQNO</th><th>SECTION</th><th>MATERIAL</th><th>CODE</th><th>DATE</th></tr>
<%
String arr=request.getParameter("x");
//System.out.println("arr"+arr);
String reqno=arr.substring(0,arr.indexOf("^"));
//System.out.println("reqno"+reqno);
String date=arr.substring(arr.indexOf("^")+1,arr.lastIndexOf("/")+5);
//System.out.println("date"+date);
ResultSet rs=stmt.executeQuery("select distinct(reqno),section,material,code,issuedate from issue"+sys+" where issuedate='"+date+"' and reqno='"+reqno+"' order by reqno");
//System.out.println(rs);


while(rs.next())
{
%>	
<tr>
<td> <%=rs.getString(1) %></td>
<td> <%=rs.getString(2) %></td>
<td> <%=rs.getString(3) %></td>
<td> <%=rs.getString(4) %></td>
<td> <%=rs.getString(5) %></td>
</tr>

<%
}

%>
</table>
</body>
</html>