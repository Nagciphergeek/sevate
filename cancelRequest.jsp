<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<style>
	#stbtn{
		width:150px;
		border:0px;
		background-color:green;
		color:orange;
		font-weight:bolder;
	}
</style>
<div class='path'>
	SYSTEM <%=sys %> > RETURN/CANCEL
	<% String a="surya"; %>
</div>
<br>
<form name='drdo' method='post' action='CancelAccept'>
<div style='text-align:center;font-size:12px'>
	RETURN No : 
	<select name='retNo' id='retNo' style='width:120px' onchange='getList()'>
		<option value='0'></option>
		<%
		ResultSet rs=stmt.executeQuery("select distinct(retreqno) from returnreq where system='"+sys+"'");
		while(rs.next()){
			%><option value='<%=rs.getString(1) %>'><%=rs.getString(1) %></option><%
		}
		%>
	</select>
</div>
<div id='status'>
</div>

</form>
<%
rs.close();
stmt.close();
con.close();
%>
<script>
function getItInward(x){
	document.drdo.submit();
}
function getItIInward(x){
	window.location.href="DamageByStore.jsp?x="+x;
}
function getList(){
	var x=document.drdo.retNo.value;
	//alert(x);
	ajaxMethod("^"+x+"^");
}
function ajaxMethod(x){
	var ajaxRequest;
	//alert("ajax");
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
		  //alert(ajaxRequest.responseText);^
		  
		   setValues(ajaxRequest.responseText);
	   }
	 }
	var queryString = "?x=" + x ;
	//alert(queryString);
	ajaxRequest.open("GET", "CancelAccept" + 
	                              queryString, false);
	ajaxRequest.send(null); 
}
var s="surya";
function setValues(arr)
{ 
	//alert(arr);
	var a=arr.lastIndexOf("^");
	//alert(a);
	var xx=arr.substring(arr.indexOf("^")+1,a);
//alert(xx);
	//alert(arr);
   	  document.getElementById("status").innerHTML=arr;
	
	}
</script>