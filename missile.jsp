<link rel="stylesheet" type="text/css" href="css/status.css">
<script type="text/javascript" src="js/status.js"></script>
<div id='wind'>
<%@include file="aslHead.jsp" %>
<div class='path'>
	SYSTEM <%=sys %> > MISSILE
</div>
<br>
<table style='width:90%;margin-left:100px'>
	<tr>
		<td>MISSILE : </td>
		<td>
			<select id='miss' style='width:100px;' onchange='getMissileDet()'>
			<%
			for(int i=0;i<41;i++){
				%><option value='<%=i %>'><%=i %></option><%
			}
			%>
			</select>
		</td>
		<td style='width:200px'></td>
		<td>SECTION : </td>
		<td>
			<select id='secc' style='width:100px;' onchange='getMissileDet()'>
			<option value='0'>----</option>
			<%
			ResultSet rs=stmt.executeQuery("select * from section where system='"+sys+"'");
			while(rs.next()){
				%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
			}
			%>
				<option value='all'>ALL</option>
			</select>
		</td>
		<td style='width:200px'></td>
		<td>GROUP : </td>
		<td>
			<select id='grp' style='width:100px;' onchange='getMissileDet()' >
			<option value='0'>----</option>
			<%
			ResultSet rs1=stmt.executeQuery("select * from dept ");
			while(rs1.next()){
				%><option value='<%=rs1.getString(2) %>'><%=rs1.getString(2) %></option><%
			}
			%>
				<option value='all'>ALL</option>
			</select>
		</td>
	</tr>	
</table>
<br>
<div id='resul'>

</div>
<br><br>
<!-- onclick='getMissDet()' -->
</div>
<div id='status123' style='display:none'>

</div>
<br>
<table style='width:80%;margin:auto'>
	<tr>
		<th><input type='button' value='SHORTAGE' onclick='getShortage()'/></th>
		<th><input type='button' value='PRINT' onclick='getPrint()'/></th>
	</tr>
</table>

<%
stmt.close();
con.close();

%>
<script>
function getPrint(){
	getMSG("^"+document.getElementById("miss").value+"^"+document.getElementById("secc").value+"^");
}
function getMSG(x){
	var ajaxRequest;
	
	 try{
	   ajaxRequest = new XMLHttpRequest();
	 }catch (e){
	   try{
	      ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
	   }catch (e) {
	      try{
	         ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
	      }catch (e){
	         alert("Your browser broke!");
	         return false;
	      }
	   }
	 }
	 ajaxRequest.onreadystatechange = function(){
	   if(ajaxRequest.readyState == 4){
	      window.open("PDF/rrr.pdf");
	   }
	 }
	 var queryString = "?x=" + x ;
	 //alert(queryString);
	 ajaxRequest.open("GET", "IssueASL" + 
	                              queryString, false);
	 ajaxRequest.send(null); 
}
</script>