<%@include file="bdlHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<style>
	#resul #tabH{ 		width:90%; 		margin:auto; 		border-collapse:collapse; 		border:1px solid; 	} 	#tabH td,#tabH th{ 		border:1px solid; 	} 	#detai{ 		width:90%; 		margin:auto; 		font-size:10px; 	}
</style>
<div class='path'>
SYSTEM <%=sys %> > REQUEST
</div>
<div style='text-align:center;font-weight:bold;font-size:15px'>REQUEST</div>
<br>
<form name='drdo' action='NewRequestReport' method='get' target='_blank'>
<table id='inTab'>
	<tr>
		<th>Request No :
			<select name='req' id='reqno' onchange='getHistory()'>
			<option value='0'>---------</option> 
			<%
			ResultSet rs=stmt.executeQuery("select distinct(reqno),section,substring(reqno,1,locate('/',reqno,10)-1) as string1 from bdlreq where system='"+sys+"' order by string1,section");
			while(rs.next()){
				%><option value='<%=rs.getString(1) %>'><%=rs.getString(1) %> (<%=rs.getString(2) %>)</option><%
			}
			rs=stmt.executeQuery("select distinct(reqno),section from issue"+sys+" where reqno not in(select distinct(reqno) from bdlreq where system='"+sys+"') order by section,reqno");
			%>
			<option value='0'>-------------ISSUED-------------</option> 
			<%
			while(rs.next()){
				
				%>
				
				
				
				<option value='<%=rs.getString(1) %>'><%=rs.getString(1) %> (<%=rs.getString(2) %>)</option><%
			}
			%>
			</select>
		</th>
	</tr>
</table>
</form>
<br>
<div id='resul'></div>
<br>
<div style='text-align:center'>
	<table style='width:100%'>
		<tr>
			<th><input type='button' value='PRINT' onclick='document.drdo.submit()'/></th>
			<th><input type='button' value='SHORTAGE' onclick='getShortage()'/></th>
		</tr>
	</table>
	
</div>
<%
rs.close();
stmt.close();
con.close();
%>
<script>

function getHistory(){
	ajaxXYZ("^"+document.getElementById("reqno").value+"^");
}
function ajaxXYZ(x){
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
		   var arr=ajaxRequest.responseText;
		   arr=arr.substring(arr.indexOf("^")+1,arr.lastIndexOf("^"));
	      document.getElementById("resul").innerHTML=arr;//jaxRequest.responseText;
	   }
	 }
	 var queryString = "?x=" + x ;
	 ajaxRequest.open("GET", "GetRequest" + 
	                              queryString, false);
	 ajaxRequest.send(null); 
}






function getShortage(){
	var x=document.getElementById("reqno").value;
	window.open('InwardEdit?req='+x)
}
</script>