<%@include file="aslHead.jsp" %>
<%
//int id=Integer.parseInt(request.getParameter("id11"));

//String section1=document.getElementById("section1");
//String drw1=request.getParameter("drwno1");

int noofrecords=Integer.parseInt(request.getParameter("noofrecords"));
int i=1;
String nome="nome";
//System.out.print("noofrecords"+noofrecords+"-1");
//new records
String material[]=new String[noofrecords];
String code []=new String[noofrecords];
String bom[]=new String[noofrecords];
String drw1[]=new String[noofrecords];
//old records
String omaterial[]=new String[noofrecords];
String ocode []=new String[noofrecords];
String obom[]=new String[noofrecords];
String odrw1[]=new String[noofrecords];

i=0;int j=1;
while(i<noofrecords-1)
{
	//new
//	nome="nome"+i;
material[i]=request.getParameter("nome"+j);
code[i]=request.getParameter("code"+j);
bom[i]=request.getParameter("bom"+j);
drw1[i]=request.getParameter("dwg"+j);
i++;	j++;
}

i=0;j=1;
while(i<noofrecords-1)
{
	//old
omaterial[i]=request.getParameter("oldnome"+j);
ocode[i]=request.getParameter("oldcode"+j);
obom[i]=request.getParameter("oldbom"+j);
odrw1[i]=request.getParameter("olddwg"+j);
i++;	j++;
}
i=0;
while(i<noofrecords-1)
{
	//System.out.print("\nold material "+omaterial[i]+"   ");	System.out.print("code "+ocode[i]+"   ");	System.out.print("bom "+obom[i]+"   ");	System.out.print("drw1 "+odrw1[i]+"   ");
	
//	System.out.print("\nnew material "+material[i]+"   ");	System.out.print("code "+code[i]+"   ");	System.out.print("bom "+bom[i]+"   ");		System.out.print("drw1 "+drw1[i]+"   "+sys);
		
	stmt.executeUpdate("update bom set code='"+code[i]+"',material='"+material[i]+"',bom='"+bom[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and bom='"+obom[i]+"' and drg='"+odrw1[i]+"' and system='"+sys+"'");
	stmt.executeUpdate("update inward"+sys+" set material='"+material[i]+"',code='"+code[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and drg='"+odrw1[i]+"'");
	stmt.executeUpdate("update "+sys+" set material='"+material[i]+"',code='"+code[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and drg='"+odrw1[i]+"'");
	stmt.executeUpdate("update bdlreq set material='"+material[i]+"',code='"+code[i]+"',bom='"+bom[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and bom='"+obom[i]+"' and drg='"+odrw1[i]+"' and system='"+sys+"'");
	stmt.executeUpdate("update issue"+sys+" set material='"+material[i]+"',code='"+code[i]+"',bom='"+bom[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and bom='"+obom[i]+"' and drg='"+odrw1[i]+"'");
	stmt.executeUpdate("update issuesc	set material='"+material[i]+"',code='"+code[i]+"',bom='"+bom[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and bom='"+obom[i]+"' and drg='"+odrw1[i]+"'");
	stmt.executeUpdate("update returndata set material='"+material[i]+"',code='"+code[i]+"',bom='"+bom[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and bom='"+obom[i]+"' and drg='"+odrw1[i]+"'");
	stmt.executeUpdate("update returnreq set material='"+material[i]+"',code='"+code[i]+"',bom='"+bom[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and bom='"+obom[i]+"' and drg='"+odrw1[i]+"'");
	stmt.executeUpdate("update screq set material='"+material[i]+"',code='"+code[i]+"',bom='"+bom[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and bom='"+obom[i]+"' and drg='"+odrw1[i]+"'");
	stmt.executeUpdate("update temp set material='"+material[i]+"',code='"+code[i]+"',bom='"+bom[i]+"',drg='"+drw1[i]+"' where material='"+omaterial[i]+"' and code='"+ocode[i]+"' and bom='"+obom[i]+"' and drg='"+odrw1[i]+"'");
	i++;
}
response.sendRedirect("bom.jsp");
//String section=request.getParameter("section1");
//String group=request.getParameter("dept1");//String material1=request.getParameter("material1");
//String code1=request.getParameter("code1");
//String searc=request.getParameter("searc1");
//System.out.println(code+""+section+"NULL"+group+""+searc);

%>