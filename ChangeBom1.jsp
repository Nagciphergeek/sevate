<%@include file="aslHead.jsp" %>
<link rel='stylesheet' href='css/bdlNewRequest.css'/>
<div class='path'>
	SYSTEM <%=sys %> > UPDATE BOM
</div>
<br><br>
<%
int id=Integer.parseInt(request.getParameter("id1"));
ResultSet rs=stmt.executeQuery("select * from bom where id="+id);
if(rs.next()){
%>
<form name="changebom1" action="UpdateChangeBom.jsp">
<input type="hidden" name="id11" value="<%=id%>">
<div id="afteredit" style="display:none;">
<table style='width:1000px;margin:auto'>
	<tr>
		<td>Section :</td>
		<td>
			<input type="text" name="section" id="1" value="<%=rs.getString(2)%>">
		</td>
		<td>Group :</td>
		<td>
			<input type="text" name="dept" id="2" value="<%=rs.getString(3)%>">
		</td>
		<td>Material :</td>
		<td>
			<input type="text" name="material" id="3" value="<%=rs.getString(4)%>">
			<input type="hidden" name="material1" value="<%=rs.getString(4)%>">
		</td></tr>
		<tr><td colspan="6">&nbsp;</td></tr>
		<tr>
		<td>Code :</td>
		<td>
			<input type="text" name="code" id="4" value="<%=rs.getString(5)%>">
			<input type="hidden" name="code1" value="<%=rs.getString(5)%>">
		</td>
		<td>BOM :</td>
		<td>
			<input type="text" name="bom" id="5" value="<%=rs.getString(6)%>">
		</td>
		<td>DRW No :</td>
		<td>
			<input type="text" name="drwno" id="6" value="<%=rs.getString(7)%>">
			<input type="hidden" name="drwno1" value="<%=rs.getString(7)%>">
		</td></tr>
		<tr><td colspan="6">&nbsp;</td></tr>
		<tr>
		<%
		ResultSet rs1=stmt.executeQuery("select * from inward"+sys+" where code='"+rs.getString(5)+"' and material='"+rs.getString(4)+"'");
		if(rs1.next()){ %>
		<td>Location :</td>
		<td>
			<input type="text" name="location" id="7" value="<%=rs1.getString(7)%>">
		</td>
		<td>Report No :</td>
		<td>
			<input type="text" name="report" id="8" value="<%=rs1.getString(10)%>">
		</td>
		<td>Gatepass No :</td>
		<td>
			<input type="text" name="dcno" id="9" value="<%=rs1.getString(11)%>">
		</td></tr>
		<tr>
		<td colspan="6">&nbsp;</td></tr>
		<tr>
		<td>Supply Order No :</td>
		<td>
			<input type="text" name="spno" id="10" value="<%=rs1.getString(15)%>">
		</td>
		<td>Vendor :</td>
		<td>
			<input type="text" name="vendor" id="11" value="<%=rs1.getString(13)%>">
		</td>
		
	</tr>
	<tr><td colspan="3" align="right">
	<%}
	if(userty.equals("5")){ %>
	<INPUT TYPE="submit" VALUE="SAVE">
	<%} 
	rs1.close();
	rs.close();
	}%></td>
	<td colspan="3" align="left">
	<INPUT TYPE="BUTTON" VALUE="BACK" onclick='window.location="bom.jsp"'>
	</td></tr>
	
</table>
</div>
<%
rs=stmt.executeQuery("select * from bom where id="+id);
if(rs.next()){
%>
<div id="beforeedit">
<table style='width:1000px;margin:auto'>
	<tr>
		<td>Section :</td>
		<td>
			<%=rs.getString(2)%>
		</td>
		<td>Group :</td>
		<td>
			<%=rs.getString(3)%>
		</td>
		<td>Material :</td>
		<td>
			<%=rs.getString(4)%>
		</td></tr>
		<tr><td colspan="6">&nbsp;</td></tr>
		<tr>
		<td>Code :</td>
		<td>
			<%=rs.getString(5)%>
		</td>
		<td>BOM :</td>
		<td>
			<%=rs.getString(6)%>
		</td>
		<td>DRW No :</td>
		<td>
			<%=rs.getString(7)%>
		</td></tr>
		<tr><td colspan="6">&nbsp;</td></tr>
		<tr>
		<%
		ResultSet rs1=stmt.executeQuery("select * from inward"+sys+" where code='"+rs.getString(5)+"' and material='"+rs.getString(4)+"'");
		if(rs1.next()){ %>
		<td>Location :</td>
		<td>
			<%=rs1.getString(7)%>
		</td>
		<td>Report No :</td>
		<td>
			<%=rs1.getString(10)%>
		</td>
		<td>Gatepass No :</td>
		<td>
			<%=rs1.getString(11)%>
		</td></tr>
		<tr>
		<td colspan="6">&nbsp;</td></tr>
		<tr>
		<td>Supply Order No :</td>
		<td>
			<%=rs1.getString(15)%>
		</td>
		<td>Vendor :</td>
		<td>
			<%=rs1.getString(13)%>
		</td>
		
	</tr>
	<tr><td colspan="3" align="right">
	<%}
	if(userty.equals("5")){ %>
	<INPUT TYPE="button" VALUE="EDIT" onclick="editval()">
	<%}
	}%></td>
	<td colspan="3" align="left">
	<INPUT TYPE="BUTTON" VALUE="BACK" onclick='window.location="bom.jsp"'>
	</td></tr>
	
</table>
</div>
</form>
<br><br><br>
<div id='bomDet' style='width:100%'>

</div>
<br><br><br>
</body>
<script type="text/javascript">
function editval()
{
	var x=prompt("please Enter password");
	if(x=="bomedit")
		{
	document.getElementById("afteredit").style.display="block";
	document.getElementById("beforeedit").style.display="none";
		}
	else{
		alert("Please request Mr.Praveen Tandon to Edit BOM");
	}
}
</script>
</html>
