<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/listMaterial.css">
<%
	String noofenteries=request.getParameter("noofenteries");
	String maxid=request.getParameter("maxid");
	int total=Integer.parseInt(noofenteries)+Integer.parseInt(maxid);
	int tot=Integer.parseInt(maxid)+1;
	ResultSet rs=stmt.executeQuery("select * from issuedummy where id between "+tot+" and "+total);
	rs.next();
%>
<div class='path'>
	SYSTEM <%=sys %>_<%=rs.getString(4) %> > <%=rs.getString(3) %> > LIST OF DUMMY ITEMS ISSUED
</div>
<div style='text-align:center'>
	<h2>LIST OF MATERIAL REQUESTED </h2>
</div>
<table id='listHead1'>
	<tr>
		<td>REF NO 
		
		</td>
		<td>REF NO </td>
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
			
			<input type="hidden" name="id1" value='<%=total %>'>
		<input type="hidden" name="id2" value='<%=tot%>'>
			
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
	//var re=document.drdo.reqno.value;
	//var given=document.drdo.given.value;
	var re=noofenteries;
	var given=maxid;
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
	 ajaxRequest.open("GET", "DummyIssuePdf" + 
	                              queryString, false);
	 ajaxRequest.send(null); 
}
</script>