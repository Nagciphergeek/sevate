<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@include file="DbCon.jsp" %>
   <%
		if(session.getAttribute("user")==null){
			%><jsp:forward page="index.html" /><%
		}
		String user=(String)session.getAttribute("user");
		String userty=(String)session.getAttribute("userty");
		String sys=(String)session.getAttribute("sys");
		
		if(!(userty.equals("1") || userty.equals("2") || userty.equals("3") || userty.equals("5"))){
			%><jsp:forward page="logout.jsp" /><%
		}
		stmt.executeUpdate("update bcnot set inid='0' where inid is null");
		//response.setContentType("application/msword");
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Damage BY Store </title>
</head>
<body>
<h2 align="center">MATERIAL IS STORED AS  DAMAGED</h2>
<%
String rep="",bcno="",mat="",code="",reqno="",given="",retqty="",dept="",section="",missile="",system="",bom="",reqby="",remarks="";
String retno=request.getParameter("x");

String avial="0";
ResultSet rs1=null;
ResultSet rs2=null;
ResultSet rs3=null;
ResultSet rs4=null;
ResultSet rsdate=null;
Statement stmt1=con.createStatement();
Statement stmt2=con.createStatement();
Statement stmt3=con.createStatement();
String date="";
							rsdate=stmt1.executeQuery("select curdate()");
										if(rsdate.next())
											{
												date=rsdate.getString(1);
												//System.out.println(date);
											}
										
										
							rs3=stmt2.executeQuery("select * from returnreq where retreqno='"+retno+"'");
	//System.out.println("check1");


			while(rs3.next())
			{
	
						mat=rs3.getString(6);
						code=rs3.getString(7);
						reqno=rs3.getString(2);
						
						given=rs3.getString(20);
						retqty=rs3.getString(13);
						dept=rs3.getString(5);
						section=rs3.getString(3);
						missile=rs3.getString(4);
						system=rs3.getString(25);
						bom=rs3.getString(9);
						reqby=rs3.getString(16);
						remarks=rs3.getString(24);
	

						rs1=stmt3.executeQuery("select * from "+sys+" where material='"+mat+"' AND code='"+code+"'");
								
								if(rs1.next())
								{
									avial=rs1.getString(5);
									int iidd=rs1.getInt(1);
									
									
						rs2=stmt.executeQuery("select * from bcnotcan where canreq='"+retno+"' AND pid='"+iidd+"'");
	
								while(rs2.next()){
									bcno=rs2.getString(2);
													}
	
	
						rs4=stmt.executeQuery("select distinct(rep) from bcnotcan where canreq='"+retno+"' AND pid='"+iidd+"'");
	
							while(rs4.next()){
									rep=rs4.getString(1);
											}
	
								}



						stmt.executeUpdate("insert into damagehistory values(null,'"+reqno+"','"+retno+"','"+mat+"','"+code+"','"+retqty+"','"+remarks+"','"+bcno+"','"+missile+"','"+sys+"','"+date+"')");
						
						reqno="D/"+rs3.getString(2);int i=1;
						//System.out.println(reqno);
						stmt.executeUpdate("insert into bdlreq(id,reqno,material,code,reqty,dept,section,missile,system,bom,by1,issue,given,ty1,remarks,drg,location,inv,availqty,date) values(null,'"+reqno+"','"+mat+"','"+code+"','"+retqty+"','"+dept+"','"+section+"','"+missile+"','"+system+"','"+bom+"','"+reqby+"',0,0,0,'Replacement','-','-','-', '"+avial+"','"+date+"')");
//System.out.println(""+i);
						stmt.executeUpdate("delete from returnreq where retreqno='"+retno+"' and material='"+mat+"' and code='"+code+"'");
						
						//stmt.executeUpdate("update "+sys+" set availqty=availqty+1 where material='"+mat+"' ");
i++;

				}
						//
%>
</body>
</html>