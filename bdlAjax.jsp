<%@include file="aslHead.jsp" %>
<%
String arr=request.getParameter("x");
arr=arr.substring(arr.indexOf("^")+1);
int x=Integer.parseInt(arr.substring(0,arr.indexOf("^")));
arr=arr.substring(arr.indexOf("^")+1);
String miss=arr.substring(0,arr.indexOf("^"));
String result="$";
if(x==1)
{
	ResultSet rs=stmt.executeQuery("select distinct dept from bdlreq where missile='"+miss+"' and system='"+sys+"'");
	while(rs.next())
	{
		result+=rs.getString(1)+"$";
	}
	result+="last"+"$";
	out.print(result);
	//System.out.println(result);
}

%>