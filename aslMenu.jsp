<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<% if(userty.equals("3") || userty.equals("5")){ %>
<body onload='getAlert()'>
<%}else{ %>
<body>
<%} %>
<!-- 
<div id="notification"> 
<a id='linkcolor' href='hiii.jsp' target='_blank'> UNSEEN</a><img src='images/newgif.gif' style='height:20px'/>

</div>
 -->
<div class='path'>
	SYSTEM <%=sys %>
</div>
<table class='menuT'>
	<tr>
		<th><input type='button' value='BILL OF MATERIAL' class='inward' onclick='window.location="bom.jsp"'/></th>
		<% if(userty.equals("3") || userty.equals("5")){ %>
		<th><input type='button' value='INWARD' class='inward' onclick='window.location="inward.jsp"'/></th>
	</tr>
	<tr>
		<th><input type='button' value='EDIT BOM' class='inward' onclick='window.location="editBom.jsp"'/></th>
		<th><input type='button' value='BDL' class='inward' onclick='window.location="bdl.jsp"'/></th>
		<%} %>
	</tr>
	<tr>
		<th><input type='button' value='STATUS' class='inward' onclick='window.location="status.jsp"'/></th>
		<!--<th><input type='button' value='dummyissue' class='inward' onclick='window.location="DummyIssue11.jsp"'/></th>-->
		<% if(userty.equals("5")){%>
		<!-- <th><input type='button' value='EDIT BOM' class='inward' onclick='window.location="editBom.jsp"'/></th> -->
		<%}%>
	</tr>
	
	<%if(userty.equals("2") || userty.equals("5")){
		%>
		<tr>
			<th><input type='button' value='REQUEST MATERIAL' class='inward' onclick='window.location="scReqMat.jsp"'/></th>
		</tr>
		<%if(userty.equals("5")){
		%>
		<tr>
		<th><input type='button' value='Add Group' class='inward' onclick='window.location="addGroup.jsp"'/></th>
		</tr>
		<%}
	} %>
</table>
<br>
<marquee id='mar' behavior='scroll' direction='right' onmouseover='document.getElementById("mar").stop();' onmouseout='document.getElementById("mar").start();'>
	
</marquee><br><br>
<marquee id='mar1' behavior='scroll' direction='left' onmouseover='document.getElementById("mar1").stop();' onmouseout='document.getElementById("mar1").start();'>
	
</marquee>
</body>
<script>
function getAlert(){
	
	ajaxMethod();
	//ajaxMethod1();
	setInterval(function(){
		ajaxMethod();},60000);	
	
	//setInterval(function(){
		//ajaxMethod1();},6000);
}
function ajaxMethod(){
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
		  // alert(arr);
		  document.getElementById("mar").innerHTML=arr.substring(0,arr.indexOf("^"));
		  document.getElementById("mar1").innerHTML=arr.substring(arr.indexOf("^")+1);
	   }
	 }
	ajaxRequest.open("GET", "Alert", false);
	ajaxRequest.send(null); 
}

function ajaxMethod1(){
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
		   //alert(arr);
		 // document.getElementById("mar").innerHTML=arr.substring(0,arr.indexOf("^"));
		 // document.getElementById("mar1").innerHTML=arr.substring(arr.indexOf("^")+1);
	   }
	 }
	ajaxRequest.open("POST", "Alert", false);
	ajaxRequest.send(null); 
}


function aslMenuNotification(x)
{
	
	var a5="";
	a5=x;
	//ajaxMethod2(a5)
	window.location.href="listMaterialByNotification.jsp?reqno="+a5;
	
	}
	
	
	

</script>