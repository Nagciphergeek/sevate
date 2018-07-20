<%@page import="java.io.File"%>
<%@page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.Date" %>
<%@ page import="javax.servlet.*,java.text.*" %>
 <%
     Class.forName("com.mysql.jdbc.Driver");
     Connection con= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/asl?user=root&password=sevate1&useJvmCharsetConverters=true");
     Date dNow = new Date( );
     SimpleDateFormat ft = new SimpleDateFormat ("dd/MM/yyyy");
     Statement stmt=con.createStatement();
 %>