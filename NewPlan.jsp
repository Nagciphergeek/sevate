<%@include file="aslHead.jsp" %>
<script type="text/javascript" src='js/jquery-scrolltofixed-min.js'></script>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<script type="text/javascript">

$(document).ready(function(){
	
	$('header').scrollToFixed();
});
</script>
<body>
<div class='path'>
	SYSTEM <%=sys %> > PLANNING
</div>
<br>
<form name='drdo' action='#' method='POST'>
<table style='width:90%;margin:auto'>
	<tr>
		<td>SECTION : </td>
		<td>
			<select name='section' id='section' onchange='getValues()'>
				<option value='0'>----------</option>
				<%
				ResultSet rs=stmt.executeQuery("select * from section where system='"+sys+"'");
				while(rs.next()){
					%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
				}
				%>
				<option value="all">All</option>
			</select>
		</td>
		<td style='width:5%'></td>
		<td>DEPT:		</td>
		<td>
			<select name='dept' id='dept' onchange='getValues()'>
				<option value='0'>----------</option>
				<%
				ResultSet rs1=stmt.executeQuery("select * from dept ");
				while(rs1.next()){
					%><option value='<%=rs1.getString(2) %>'><%=rs1.getString(2) %></option><%
				}
				%>
				<option value="all">All</option>
			</select>
		</td>
		<td style='width:10%'></td>
		<td>MISSILE : </td>
		<td><input type="text" name="miss1" id="mi1" size="3" onblur='getValues()'> TO
		<input type="text" name="miss2" id="mi2" size="3" onblur='getValues()'></td>
	</tr>
</table>
</form>
<br>

<!-- style='max-height:500px; overflow:auto; -->

<div id="tabrow">
<!-- <table id="tabrow1"> -->
<!-- <tr> -->
<!-- <th>SNO</th><th>CODE</th><th>MATERIAL</th><th>BOM</th> -->
<%-- <% --%>
<!-- // int i=0; -->
<!-- // for(i=0;i<3;i++) -->
<!-- // { -->
<%-- 	%> --%>
<%-- 	<th>MISSILE<%=i %></th> --%>
<%-- 	<% --%>

<!-- // } -->

<%-- %> --%>


<!-- <th>REPORT</th><th>REMAINING</th> -->
<!-- </tr> -->

<!-- </table> -->


</div>
<div id='status' >


</div>



<%
rs.close();
rs1.close();
stmt.close();
con.close();
%>
<script>
var val=0;var val2=0;
function getValues(){
	var sec=document.drdo.section.value;
	var dept=document.drdo.dept.value;
	var miss=document.drdo.miss1.value;
	var miss2=document.drdo.miss2.value;
	val=miss;val2=miss2;
	
	if(sec=='0' || miss=='0')
		return;
	
	//ajaxMethodX("^7^"+miss+"^"+miss2+"^");
	ajaxMethod("^6^"+sec+"^"+dept+"^"+miss+"^"+miss2+"^");
}


function ajaxMethodX(x){
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
					 
		//	alert(ajaxRequest.responseText);
			
			
			
	     document.getElementById("tabrow").innerHTML=ajaxRequest.responseText;
	     
	   }
	 }
	 var queryString = "?x=" + x ;
	// alert(queryString);
	 ajaxRequest.open("GET", "Damage" + 
	                              queryString, false);
	 ajaxRequest.send(null); 
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
					 
//  			var subs= ajaxRequest.responseText;
//  			var head=ajaxRequest.responseText.substring(subs.indexOf("<tr>"),subs.indexOf("</tr>")+5);
//  			document.getElementById("header").innerHTML=head;
//  			ajaxRequest.responseText=ajaxRequest.responseText.substring(subs.indexOf("<tr>"),subs.indexOf("</tr>")+5);
			
			//alert(ajaxRequest.responseText);
			
			
			
	     document.getElementById("status").innerHTML=ajaxRequest.responseText;
	    // alert("surya bhai");
	   }
	 }
	 var queryString = "?x=" + x ;
	 ajaxRequest.open("GET", "Damage" + 
	                              queryString, false);
	 ajaxRequest.send(null); 
}
</script>