<%@include file="aslHead.jsp" %>
<%String dept=request.getParameter("dept");
if(!dept.equals(""))
stmt.executeUpdate("insert into dept values(null,'"+dept+"')");
response.sendRedirect("addGroup.jsp");
 %>