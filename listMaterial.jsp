<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/listMaterial.css">
<%
	String reqno=request.getParameter("reqno");
Date date=dNow;

	ResultSet rs=null;
	if(reqno.equals("Dummy")){
		rs=stmt.executeQuery("select * from dummy");
	}
	else{
	rs=stmt.executeQuery("select * from bdlreq where reqno='"+reqno+"'");
	}
	rs.next();
%>
<div class='path'>
<%if(!reqno.equals("Dummy")) {%>
	SYSTEM <%=sys %>_<%=rs.getString(4) %> > <%=rs.getString(3) %> > LIST OF ITEMS - BDL REQUEST
<%}
	else
	{
	%>
	SYSTEM <%=sys %>_<%=rs.getString(4) %> > <%=rs.getString(3) %> > LIST OF ITEMS - Dummy
<%}%>
</div>	
<div style='text-align:center'>
	<%if(!reqno.equals("Dummy")) {%>
	<h2>LIST OF MATERIAL REQUESTED BY BDL(PPC)</h2>
	<%}
	else
	{
	%><h2>LIST OF MATERIAL REQUEST(Dummy)</h2>
	<%} %>
</div>
<form name='drdo' method='post' action='issueConfirm.jsp'>
<table id='listHead1'>
	<tr>
		<%if(!reqno.equals("Dummy")) {%>
		<td>REF NO </td>
		<td><%=reqno %></td>
		<%}
		else
		{%>
		<td>Enter Missile NO </td>
		<td><input type="text" name="missileno"></td>
		<%} %>
		
		<td style='width:500px;'></td>
		<td>DATE</td>
		<td><%if(!reqno.equals("Dummy")) {%><%=rs.getString(14) %>
		<%}
		else
		{%>
			<%=date %>;
		<%}%></td>
	</tr>
	<tr>
		<td>SECTION </td>
		<td><%=rs.getString(3) %></td>
		<td style='width:500px;'></td>
		<td>REQUESTED BY</td>
		<td><%if(!reqno.equals("Dummy")) {%><%=rs.getString(15) %>
		<%}
		else
			{%>
			<input type="text" name="requestedbyname" placeholder="Enter Name">
			<%} %>
		
		</td>
	</tr>
</table>

<input type='hidden' name='reqno' value='<%=reqno %>'/>
<table id='listHead2'>
	<tr>
		<th style='width:30px;'>SNO</th><th style='width:80px;'>CODE</th>
		<th>NOMENCLATURE</th>
		<th style='width:150px;'>DWG NO</th>
		<%if(!reqno.equals("Dummy")) {%>
		<th style='width:30px;'>BOM<br>QTY</th>
		<th style='width:30px;'>REQ<br>QTY</th>
		<%}%>
		<th style='width:40px;'>AVAIL<br>QTY</th>
		<th style='width:40px;'>QTY<br>ISSUED</th>
		<th style='width:100px'>Bact No/ Sl No</th>
		<th style='width:40px;'>ISSUE<br>QTY</th>
		<th style='width:150px;'>REMARKS</th>
	<tr>
<%
	rs.previous();
	Statement stmt1=con.createStatement();
	Statement stmt2=con.createStatement();
	if(!reqno.equals("Dummy"))
	{
		int i=1;
	while(rs.next())
	{
		//System.out.print(rs.getString(7)+rs.getString(6));
		ResultSet rs1=stmt1.executeQuery("select * from "+sys+" where code='"+rs.getString(7)+"' AND material='"+rs.getString(6)+"'");
		String avail="0";
		int mit=0;
		if(rs1.next()){
			avail=rs1.getString(5);
			mit=rs1.getInt(1);
			
		}
%><tr>
		<td style='text-align:center'>
		<%  String cv=mit+"";%>
		
		<div id='<%=mit %>' class='batchS'>
			<table>
			<%
			rs1=stmt1.executeQuery("select distinct(rep) from bcnot where pid='"+mit+"' AND sys='"+sys+"'");
			String rep="";
			while(rs1.next()){
				%><tr><th><%=rs1.getString(1) %></th></tr><tr><td><%
				ResultSet rs2=stmt2.executeQuery("select * from bcnot where pid='"+mit+"' AND rep='"+rs1.getString(1)+"' AND sys='"+sys+"'");
				while(rs2.next()){
					if(rs2.getString(7).equals("0"))
						out.print("<input type='checkbox' name='"+rs.getInt(1)+"' value='"+rs2.getString(2)+"'/>"+rs2.getString(2)+"<br>");
					else
						out.print("<input type='checkbox' name='"+rs.getInt(1)+"' value='"+rs2.getString(2)+"'/>"+rs2.getString(2)+"<br><input type='text' readonly class='getI' value='"+rs2.getString(7)+"'/><input type='text' style='width:40px' name='"+rs2.getInt(1)+"l'/><br><br>");
				}
				%>
				</td></tr>
				<%
				rs2.close();
			} %>
			</table>
			<div><input type='button' value='OK' id='watB' onclick="document.getElementById('<%=cv %>').style.display='none'"/></div>
		</div>	
		<input type='hidden' name='iid' value='<%=rs.getInt(1) %>'/><%=i %></td><td style='text-align:center'><%=rs.getString(7) %></td>
		<td><%=rs.getString(6) %></td><td style='text-align:center'><%=rs.getString(8) %></td>
		<td style='text-align:center'><input type='text' name='bom' value='<%=rs.getString(9) %>' readonly style='text-align:center;width:29px;background-color:transparent;border:0px'/></td>
		<td style='text-align:center'><input type='text' name='reqty' value='<%=rs.getString(13) %>' readonly style='text-align:center;width:29px;background-color:transparent;border:0px'/></td>
		<td><input type='text' name='availqty' value='<%=avail %>' readonly style='width:40px;background-color:transparent;border:0px;text-align:center'/></td>		
		<td><input type='text' name='issedqty' value='<%=rs.getString(18) %>' readonly style='width:40px;background-color:transparent;border:0px;text-align:center'/></td>
		<td>
			<input class='batch' type='button' value='Bt No/ Sl No' onclick="document.getElementById('<%=mit %>').style.display='block'"/>
		</td>
		<td><input type='text' name='issqty' style='width:30px' autocomplete='off'/></td>
		<td><input type='text' name='remark' style='width:150px;'/></td>
	</tr>
		
	
	
<%
	i++;
	rs1.close();
	}
	}
	else
	{
		
		int j=0,count=0;
		ResultSet rs2=stmt2.executeQuery("select count(*) from dummy");
		if(rs2.next())
		{
			count=rs2.getInt(1);
		}
		int i=1;
		while(rs.next())
		{
			int issued=0;
			ResultSet rs1=stmt1.executeQuery("select sum(issued) from issuedummy where section='"+rs.getString(19)+"' AND dept='"+rs.getString(3)+"' AND material='"+rs.getString(4)+"' AND code='"+rs.getString(5)+"'");
			if(rs1.next())
			{
				issued=rs1.getInt(1);
			}

	%><tr>
			<td style='text-align:center'>
			<%  String cv=rs.getInt(1)+"";%>
			
			<div id='<%=rs.getInt(1) %>' class='batchS'>
				<div><input type='button' value='OK' id='watB' onclick="document.getElementById('<%=cv %>').style.display='none'"/></div>
			</div>	
			<input type='hidden' name='iid' value='<%=rs.getInt(1) %>'/><%=i %></td><td style='text-align:center'><%=rs.getString(5) %></td>
			<td style="width:29px"><%=rs.getString(4) %></td><td style='text-align:center'><%=rs.getString(6) %></td>
			<!-- <td style='text-align:center'><input type='text' name='bom' value='<%=rs.getString(9) %>' readonly style='text-align:center;width:29px;background-color:transparent;border:0px'/></td>
			<td style='text-align:center'><input type='text' name='reqty' value='<%=rs.getString(13) %>' readonly style='text-align:center;width:29px;background-color:transparent;border:0px'/></td> -->
			<td><input type='text' name='availqty' value='<%=rs.getString(7) %>' readonly style='width:40px;background-color:transparent;border:0px;text-align:center'/></td>		
			<td><input type='text' name='issedqty' value='<%=issued %>' readonly style='width:40px;background-color:transparent;border:0px;text-align:center'/></td>
			<td>
				<input class='batch' type='button' value='Bt No/ Sl No' onclick="document.getElementById('<%=rs.getInt(1) %>').style.display='block'"/>
			</td>
			<td><input type='text' name='issqty' style='width:30px' autocomplete='off'/></td>
			<td><input type='text' name='remark' style='width:150px;'/></td>
		</tr>
	<%
		i++;
		rs1.close();
		}
		
	}
	%>
</table>

<br><br>
<table id='btns'>
	<tr><%
		if(reqno.equals("Dummy")){
		%>
		<th><input type='button' value='ISSUE' onclick='validate()'/></th>
		<%
		}else{if(!userty.equals("5")){%>
		<th><input type='button' value='ISSUE' onclick='validate1()'/></th>
		<%} }%>
		<th><input type='button' value='BACK' onclick='window.location="requestList.jsp"'/></th>
	</tr>
</table>
<br><br>
<%
	rs.close();


//Start of issue history for BDL Request

int sno=1;
	%>	

<div style='text-align:center'>
	<%if(!reqno.equals("Dummy")) {%>
	<h2>LIST OF MATERIAL ISSUED</h2>
	<%}
	else
	{
	%><h2>LIST OF MATERIAL ISSUED(Dummy)</h2>
	<%} %>
</div>
<table id='listHead3' border="1">
<tr>
		<th style='width:30px;'>SNO</th><th style='width:80px;'>CODE</th>
		<th>NOMENCLATURE</th>
		<th style='width:150px;'>DWG NO</th>
		<th style='width:30px;'>BOM<br>QTY</th>
		<th style='width:30px;'>REQ<br>QTY</th>
		<th style='width:40px;'>AVAIL<br>QTY</th>
		<th style='width:40px;'>QTY<br>ISSUED</th>
		
	<tr>
<%
//ResultSet rsi1=stmt1.executeQuery("select distinct material from bdlreq where reqno='"+reqno+"'");
//while(rsi1.next())
//{
ResultSet rsi=stmt1.executeQuery("select issued,code,material,drg,availqty,reqty,issued,bom from issue"+sys+" where reqno='"+reqno+"'");// and  material='"+rsi1.getString(1)+"'");
while(rsi.next())
{
	%>
	
	<tr>
<td><%=sno%></td>
<td style='text-align:center'><%=rsi.getString(2) %></td>
	<td style='text-align:center'><%=rsi.getString(3) %></td>
	<td style='text-align:center'><%=rsi.getString(4) %></td>
	<td style='text-align:center'><%=rsi.getString(8) %></td>
	<td style='text-align:center'><%=rsi.getString(6) %></td>
	<td><%=rsi.getString(5)  %></td>		
	<td><%=rsi.getString(1) %></td>
	
</tr>
<%sno++;
}
rsi.close();
//}
//rsi1.close();
%>
</table><!-- End of issue history for BDL Request -->

<%
	stmt1.close();
	stmt2.close();
	stmt.close();
	con.close();
%>
</form>
<script>
	function validate(){
		var name=document.drdo.requestedbyname.value;var missileno1=document.drdo.missileno.value;
		if(name==""||name==null)
			{
				alert("Please Enter Requested Employee Name");
			}
		
		else if(missileno1==""||missileno1==null)
		{
			alert("Please Enter Missile Number");
		}
		else
			{
		/*var iss=document.getElementsByName("issqty");
		var issed=document.getElementsByName("issedqty");
		var avail=document.getElementsByName("availqty");
		var bom=document.getElementsByName("bom");
		var i=iss.length;
		for(var j=0;j<i;j--){
			
		}*/
		document.drdo.submit();}
	}
	function validate1(){	document.drdo.submit();}
</script>