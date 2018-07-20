<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/listMaterial.css">
<%
	String reqno=(String)session.getAttribute("reqno");
	int given=(Integer)session.getAttribute("given");
	ResultSet rs=stmt.executeQuery("select * from temp where reqno='"+reqno+"' AND given='"+given+"'");
	rs.next();
%>
<div class='path'>
	SYSTEM <%=sys %>_<%=rs.getString(4) %> > <%=rs.getString(3) %> > LIST OF ITEMS ISSUED
</div>
<div style='text-align:center'>
	<h2>LIST OF MATERIAL REQUESTED BY BDL(PPC)</h2>
</div>
<table id='listHead1'>
	<tr>
		<td>REF NO </td>
		<td><%=reqno %></td>
		<td style='width:500px;'></td>
		<td>DATE</td>
		<td><%=rs.getString(15) %></td>
	</tr>
	<tr>
		<td>SECTION </td>
		<td><%=rs.getString(3) %></td>
		<td style='width:500px;'></td>
		<td>REQUESTED BY</td>
		<td><%=rs.getString(16) %></td>
	</tr>
</table>
<form name='drdo' method='post' action='IssueASL'>
<input type='hidden' name='reqno' value='<%=reqno %>'/>
<table id='listHead2'>
	<tr>
		<th>SNO</th><th>CODE</th><th>NOMENCLATURE</th><th>DWG NO</th>
		<th>BOM<br>QTY</th><th>ISSUED<br>QTY</th><th>LOCATION</th><th>REMARKS</th>
	</tr>
<%
	rs.previous();
	int i=1;
	while(rs.next()){
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
			<td style='width:30px;text-align:center'><%=rs.getString(14) %></td>
			<td style='width:100px;text-align:center'><%=rs.getString(12) %></td>
			<td style='width:150px;text-align:center'><%=rs.getString(20) %>
			</td>
		</tr>
		<%
		i++;
		
}
%>
</table>
<input type='hidden' name='given' value='<%=given %>'/>
<br><br>
<table id='btns'>
	<tr>
		<th><input type='button' value='PRINT' onclick="getValues()" /></th>
		<th><input type='button' value='BACK' onclick='window.location="requestList.jsp"'/></th>
	</tr>
</table>
</form>
<br><br>

<script>
function getValues(){
	var re=document.drdo.reqno.value;
	var given=document.drdo.given.value;
	ajaxMethod("^"+re+"^"+given+"^");
}
function ajaxMethod(x){
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
	      window.open("PDF/issue.pdf");
	   }
	 }
	 var queryString = "?x=" + x ;
	 ajaxRequest.open("GET", "IssuePDF" + 
	                              queryString, false);
	 ajaxRequest.send(null); 
}
</script>