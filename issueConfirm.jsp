<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/listMaterial.css">
<%
	String reqno=request.getParameter("reqno");
	String[] issqty=request.getParameterValues("issqty");
	String[] iid=request.getParameterValues("iid");
	String[] remark=request.getParameterValues("remark");
	ResultSet rs=null;
	if(!reqno.equals("Dummy"))
		rs=stmt.executeQuery("select * from bdlreq where reqno='"+reqno+"'");
	else
		rs=stmt.executeQuery("select * from dummy");	
	rs.next();
	Statement stmt1=con.createStatement();
	Statement stmt2=con.createStatement();
%>
<div class='path'>
	<%
	if(!reqno.equals("Dummy"))
	{
	%>
	SYSTEM <%=sys %>_<%=rs.getString(4) %> > <%=rs.getString(3) %> > LIST OF ITEMS - BDL REQUEST
	<%
	}
		else
	{%>
		SYSTEM <%=sys %>_<%=rs.getString(4) %> > <%=rs.getString(3) %> > LIST OF ITEMS - DUMMY
	<%}
	%>	
	
</div>
<div style='text-align:center'>
	<%
	if(!reqno.equals("Dummy"))
	{%>
	<h2>LIST OF MATERIAL REQUESTED BY BDL(PPC)</h2>
	<%}
	else
	{%>
	<h2>LIST OF MATERIAL REQUEST</h2>
	<%} %>
</div>
<table id='listHead1'>
	<tr>
		<td>REF NO </td>
		<td><%=reqno %></td>
		<td style='width:500px;'></td>
		<td>DATE</td>
		<td><%=rs.getString(14) %></td>
	</tr>
	<tr>
		<td>SECTION </td>
		<td><%=rs.getString(3) %></td>
		<td style='width:500px;'></td>
		<td>REQUESTED BY</td>
		<td><%if(!reqno.equals("Dummy"))
			{%>
			<%=rs.getString(15)%>
			<%}
			else
			{%>
			<%=request.getParameter("requestedbyname")%>
			<%}%>
			</td>
			
	</tr>
</table>
<form name='drdo' method='post' action='IssueASL'>

<input type='hidden' name='reqno' value='<%=reqno %>'/>
<input type='hidden' name='reqby' value='<%=request.getParameter("requestedbyname") %>'/>
<table id='listHead2'>
	<tr>
		<th>SNO</th><th>CODE</th><th>NOMENCLATURE</th><th>DWG NO</th>
		<th>BOM<br>QTY</th><th>ISSUED<br>QTY</th><th>LOCATION</th><th>BATCH / Sl NO</th><th>REMARKS</th>
	</tr>
	<%if(!reqno.equals("Dummy"))
			{%>
<%
int l=issqty.length;
int j=0;
int i=1;
while(j<l){
	if(issqty[j]!=""){
		rs=stmt.executeQuery("select * from bdlreq where id="+iid[j]);
		rs.next();
		%>
		<tr>
			<td style='width:30px;text-align:center'>
			<%=i %>
			<input type='hidden' name='bdlreqid' value='<%=rs.getInt(1) %>'/>
			</td>
			<td style='width:80px;text-align:center'><%=rs.getString(7) %></td>
			<td><%=rs.getString(6) %></td>
			<td style='width:120px;text-align:center'><%=rs.getString(8) %></td>
			<td style='width:30px;text-align:center'><%=rs.getString(9) %></td>
			<td style='width:30px;text-align:center'>
			<input type='text' name='issqty' value='<%=issqty[j] %>' style='width:40px'/>
			<%=issqty[j] %>
			</td>
			<td style='width:100px;text-align:center'><%=rs.getString(12) %></td>
			<td style='width:100px;text-align:center'>
				<%
				int yt=0;
				String[] bcnot=request.getParameterValues(rs.getInt(1)+"");
				try{
					yt=bcnot.length;
				}catch(Exception e){}
				int d=0;
				while(d<yt){
				%>
				<input class='batchIn' readonly type='text' name='batch' value='<%=bcnot[d] %>'/>
				<%
					ResultSet rs1=stmt1.executeQuery("select * from "+sys+" where material='"+rs.getString(6)+"' AND code='"+rs.getString(7)+"'");
					rs1.next();
					ResultSet rs2=stmt2.executeQuery("select * from bcnot where bcno='"+bcnot[d]+"' AND pid='"+rs1.getInt(1)+"'");
					rs2.next();
					%>
					<input class='batchIn' readonly type='hidden' name='pid' value='<%=rs1.getInt(1) %>'/>
					<%
					if(rs2.getString(7).equals("0")){
					}else{
						%><input type='hidden' name='<%=bcnot[d]%>' value='<%=request.getParameter(rs2.getInt(1)+"l") %>'><%
					}
					d++;
					rs1.close();
				} %>
			</td>
			<td style='width:150px;text-align:center'>
			<input type='hidden' name='remark' value='<%=remark[j] %>'/>
			
			<%=remark[j] %>
			</td>
		</tr>
		<%
		i++;
	}
	j++;
}
%>
<%} 
else
{%>

<%
int l=issqty.length;
int j=0;
int i=1;
while(j<l){
	if(issqty[j]!=""){
		rs=stmt.executeQuery("select * from dummy where id="+iid[j]);
		rs.next();
		%>
		<tr>
			<td style='width:30px;text-align:center'>
			<%=i %>
			<input type='hidden' name='bdlreqid' value='<%=rs.getInt(1) %>'/>
			<input type='hidden' name='misssileno2' value='<%=request.getParameter("missileno")%>'/>
			<input type='hidden' name='mater1' value='<%=rs.getString(4) %>'/>
			<input type='hidden' name='code1' value='<%=rs.getString(5) %>'/>
			<input type='hidden' name='drg1' value='<%=rs.getString(6) %>'/>
			</td>
			<td style='width:80px;text-align:center'><%=rs.getString(5) %></td>
			<td><%=rs.getString(4) %></td>
			<td style='width:120px;text-align:center'><%=rs.getString(6) %></td>
			<td style='width:30px;text-align:center'></td>
			<td style='width:30px;text-align:center'>
			<input type='text' name='issqty' value='<%=issqty[j] %>' style='width:40px'/>
			<%=issqty[j] %>
			</td>
			<td style='width:100px;text-align:center'><%=rs.getString(9) %></td>
			<td style='width:100px;text-align:center'>
				 
			</td>
			<td style='width:150px;text-align:center'>
			<input type='hidden' name='remark' value='<%=remark[j] %>'/>
			<%=remark[j] %>
			</td>
		</tr>
		<%
		i++;
	}
	j++;
}
%>


<%} %>
</table>





<br><br>
<table id='btns'>
	<tr>
		<th><input type='submit' value='CONFIRM'/></th>
		<th><input type='button' value='BACK' onclick='window.location="requestList.jsp"'/></th>
	</tr>
</table>
</form>
<br><br>
<%
	rs.close();
	stmt.close();
	stmt1.close();
%>