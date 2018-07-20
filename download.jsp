<%@ page import="java.util.*,java.io.*" %>
<%
File f =new File("F:/Reports/"+request.getParameter("x"));
response.setContentType("application/pdf");
response.setHeader("Content-Disposition","attachment;filename="+request.getParameter("x"));
String file=f.getName();
file=file.substring(file.lastIndexOf("/")+1);
InputStream in=new FileInputStream(f);
ServletOutputStream oout=response.getOutputStream();
int bit=256;
int i=0;
try{
	while(bit>=0){
		bit=in.read();
		oout.write(bit);
	}
}catch(Exception e){
	System.out.print(e);
}
oout.flush();
oout.close();
%>