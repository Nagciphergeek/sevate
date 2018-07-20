<%@include file="aslHead.jsp" %>
<%
int id=Integer.parseInt(request.getParameter("id11"));
String section=request.getParameter("section");
String group=request.getParameter("dept");
String material=request.getParameter("material");
String code=request.getParameter("code");
String bom=request.getParameter("bom");
String drw=request.getParameter("drwno");
String location=request.getParameter("location");
String report=request.getParameter("report");
String gatepass=request.getParameter("dcno");
String supply=request.getParameter("spno");
String vendor=request.getParameter("vendor");
String material1=request.getParameter("material1");
String code1=request.getParameter("code1");
String drw1=request.getParameter("drwno1");
//System.out.println(section+""+group);


stmt.executeUpdate("update bom set section='"+section+"',dept='"+group+"',material='"+material+"',code='"+code+"',bom='"+bom+"',drg='"+drw+"' where id="+id);
stmt.executeUpdate("update inward"+sys+" set material='"+material+"',code='"+code+"',drg='"+drw+"',location='"+location+"',report='"+report+"',dcno='"+gatepass+"',vendor='"+vendor+"',spno='"+supply+"' where material='"+material1+"' and code='"+code1+"' and drg='"+drw1+"'");
stmt.executeUpdate("update "+sys+" set material='"+material+"',code='"+code+"',drg='"+drw+"',location='"+location+"' where material='"+material1+"' and code='"+code1+"' and drg='"+drw1+"'");
stmt.executeUpdate("update bdlreq set section='"+section+"',dept='"+group+"',material='"+material+"',code='"+code+"',drg='"+drw+"',bom='"+bom+"',location='"+location+"' where material='"+material1+"' and code='"+code1+"' and drg='"+drw1+"'");
stmt.executeUpdate("update issue"+sys+" set section='"+section+"',dept='"+group+"',material='"+material+"',code='"+code+"',drg='"+drw+"',bom='"+bom+"',location='"+location+"' where material='"+material1+"' and code='"+code1+"' and drg='"+drw1+"'");
stmt.executeUpdate("update issuesc set section='"+section+"',dept='"+group+"',material='"+material+"',code='"+code+"',drg='"+drw+"',bom='"+bom+"' where material='"+material1+"' and code='"+code1+"' and drg='"+drw1+"'");
stmt.executeUpdate("update returndata set section='"+section+"',dept='"+group+"',material='"+material+"',code='"+code+"',drg='"+drw+"',bom='"+bom+"',location='"+location+"' where material='"+material1+"' and code='"+code1+"' and drg='"+drw1+"'");
stmt.executeUpdate("update returnreq set section='"+section+"',dept='"+group+"',material='"+material+"',code='"+code+"',drg='"+drw+"',bom='"+bom+"',location='"+location+"' where material='"+material1+"' and code='"+code1+"' and drg='"+drw1+"'");
stmt.executeUpdate("update screq set section='"+section+"',dept='"+group+"',material='"+material+"',code='"+code+"',drg='"+drw+"',bom='"+bom+"' where material='"+material1+"' and code='"+code1+"' and drg='"+drw1+"'");
stmt.executeUpdate("update temp set section='"+section+"',dept='"+group+"',material='"+material+"',code='"+code+"',drg='"+drw+"',bom='"+bom+"',location='"+location+"' where material='"+material1+"' and code='"+code1+"' and drg='"+drw1+"'");


response.sendRedirect("bom.jsp");
%>