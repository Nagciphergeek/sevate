<%@include file="aslHead.jsp" %>
<%

int id=Integer.parseInt(request.getParameter("x"));
ResultSet rs=stmt.executeQuery("select * from inward"+sys+" where id="+id);
rs.next();
String material=rs.getString(2);
String code=rs.getString(3);
int qv=Integer.parseInt(rs.getString(8));
stmt.executeUpdate("delete from inward"+sys+" where id="+id);
stmt.executeUpdate("delete from bcnot where sys='"+sys+"' and iniid="+id);
stmt.executeUpdate("update "+sys+" set availqty=availqty-"+qv+" where code='"+code+"' AND material='"+material+"'");
stmt.close();
con.close();
response.sendRedirect("inwardDet.jsp");


%>