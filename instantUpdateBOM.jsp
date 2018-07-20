<%@include file="aslHead.jsp" %>
<html>
<head>
<script type="text/javascript">
function checkuser()
{
	var x=prompt("Please Enter Password ");
	if(x=="bomedit")
		{
		document.getElementById("instantupdatebom").submit();
		}
	else
		{
		alert("Plese Contact Mr.Praveen Tandon to edit BOM");
		window.location="bom.jsp";
		}
	}
	</script>
</head>
<link rel='stylesheet' href='css/bdlNewRequest.css'/>
<script type="text/javascript" src="js/bom.js"></script>
<body>
<div class='path'>
	SYSTEM <%=sys %> > BOM
</div>
<br><br>


<%
String section=request.getParameter("section");
String dept=request.getParameter("dept");
String searc=request.getParameter("searc");
if(searc.equals("")||searc.equals(null))
	searc="_";
ResultSet rs=null;
				if(section.equals("all") && dept.equals("all"))
				{
					if((searc.equals("(_)")))
						rs=stmt.executeQuery("select * from bom where system='"+sys+"'");
					else
						rs=stmt.executeQuery("select * from bom where system='"+sys+"' and (code like '"+searc+"%' or material like '"+searc+"%')");
				}
				else if(section.equals("all"))
				{
					if((searc.equals("(_)")))
						rs=stmt.executeQuery("select * from bom where system='"+sys+"' AND dept='"+dept+"'");
					else
						rs=stmt.executeQuery("select * from bom where system='"+sys+"' AND dept='"+dept+"' and (code like '"+searc+"%' or material like '"+searc+"%')");
				}
				else if(dept.equals("all"))
				{
					if((searc.equals("(_)")))
						rs=stmt.executeQuery("select * from bom where system='"+sys+"' AND section='"+section+"'");
					else
						rs=stmt.executeQuery("select * from bom where system='"+sys+"' AND section='"+section+"' and (code like '"+searc+"%' or material like '"+searc+"%')");
				}
				else{
					if((searc.equals("(_)")))
						rs=stmt.executeQuery("select * from bom where system='"+sys+"' AND section='"+section+"' AND dept='"+dept+"'");
					else
						rs=stmt.executeQuery("select * from bom where system='"+sys+"' AND section='"+section+"' AND dept='"+dept+"' and (code like '"+searc+"%' or material like '"+searc+"%')");
				}
 %>
 
 <form name="instantupdatebom" id="instantupdatebom" action="instantUpdateBOM2.jsp">
 <table id='bom'><tr>
<th>SNO</th>
<th>CODE</th>
<th>NOMENCLATURE</th>
				<th>DWG NO</th>
				<th>BOM</th>
				
				
				<%int i=1;
				  while(rs.next()){%>
					<tr>
					<td style='text-align:center'><%=i%></td>
					<td style='text-align:center'><input type="text" name='code<%=i%>' id="<%=i%>" value="<%=rs.getString(5)%>"><input type="hidden" name='oldcode<%=i%>' id="<%=i%>" value="<%=rs.getString(5)%>"></td>
					<td style='text-align:center'><input type="text" name='nome<%=i%>' value="<%=rs.getString(4)%>"><input type="hidden" name='oldnome<%=i%>' value="<%=rs.getString(4)%>"></td>
					<td style='text-align:center'><input type="text" name="dwg<%=i%>" value="<%=rs.getString(7)%>"><input type="hidden" name="olddwg<%=i%>" value="<%=rs.getString(7)%>"></td>
					<td style='text-align:center'><input type="text" name="bom<%=i%>" value="<%=rs.getString(6)%>" onchange="validateIBE()"><input type="hidden" name="oldbom<%=i%>" value="<%=rs.getString(6)%>">
					
					
					<%i++;}%>
					<input type="hidden" name="loppvar" value="<%=i%>"/></td></tr>
					</table><table align='center'>
					<tr><td>&nbsp;<input type="hidden" name="noofrecords" value='<%=i%>'></td></tr><tr><td style='text-align:center'>
						<INPUT TYPE="button" VALUE="SAVE" onclick="checkuser()">
					</td><td><input type="button" name="Cancel" value='Cancel' onclick='window.location="bom.jsp"'></td></tr>
</table>
</form>
</body>
<%/*<script type="text/javascript">
function show()
{
	//alert("hi");
	//var iii=document.getElementById(1);
	//alert(iii.value);
alert(document.instantupdatebom.code1.value);
}
</script>*/ %>

</html>