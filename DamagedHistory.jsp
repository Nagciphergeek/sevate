<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
    <%@include file="aslHead.jsp" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">



#tabt {

background-color:red;

border:2px solid green;
border-collapse:collapse;

}

#tabt tr td{
background-color:yellow;

border:2px solid green;


}





</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Damaged History </title>
</head>
<body >
<div class='path'>
	SYSTEM <%=sys %>
</div>
<h1 align="center">DAMAGED MATERIAL HISTORY</h1>
<div id="div" >
<table id="tabt">
<tr align="center">
<th>SNO</th><th>REQNO</th><th>RETREQNO</th><th>MATERIAL</th><th>CODE</th><th>BATCHID</th><th>RETQTY</th><th>REMARKS</th></tr>
<%
ResultSet rs=stmt.executeQuery("select * from damagehistory where system='"+sys+"' ");
int i=1;
while(rs.next())
{
	
%>

<tr align="center">

<td><%=i %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>

</tr>



<%
i++;
}

%>
</table>
</div>
</body>
</html>