<%@include file="aslHead.jsp" %>
<%
String x=request.getParameter("x");
ResultSet rs=stmt.executeQuery("select * from bom where id="+x);
if(rs.next()){
	stmt.executeUpdate("delete from bdlreq where system='"+sys+"' AND section='"+rs.getString(2)+"' AND dept='"+rs.getString(3)+"' AND material='"+rs.getString(4)+"' AND code='"+rs.getString(5)+"'");
}
stmt.executeUpdate("delete from bom where id="+x);
stmt.close();
rs.close();
con.close();
//response.sendRedirect("updateBom.jsp");
%>