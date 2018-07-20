<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  <%@include file="aslHead.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SHORTAGE LIST</title>
<style>
#shorttab
{


border-collapse:collapse;
width:100%;
}

.matalign
{

padding-left:8%;

}

#head
{
margin-left:40%;
padding-bottom:2%;

}


</style>
</head>
<body>

<div class='path'>
	SYSTEM <%=sys %>
</div>
<br>

<div id="head">
<span><b><u>SHORTAGE FOR SYSTEM-<%=sys %></u></b></span>

</div>
<table id="shorttab" border=2px; >
	<tr>
	<th>SNO</th><th>MATERIAL</th><th>CODE</th><th>STOCK</th>
	</tr>
<%
int i=0;
ResultSet rs=stmt.executeQuery("select * from "+sys+" where availqty=0");
while(rs.next())
{
	//System.out.println(""+i);
	i++;
	%>
	
	<tr>
	<td align=center><%=i %></td>
	<td class="matalign"><%=rs.getString(2) %></td>
	<td class="matalign"><%=rs.getString(3) %></td>
	<td align=center><%=rs.getString(5) %></td>
	</tr>
	
	
	
	
	
	
	<%
}

%>
</table>
</body>
</html>