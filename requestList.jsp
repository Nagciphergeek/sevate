<%@include file="aslHead.jsp" %>
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
	SYSTEM <%=sys %> > BDL REQUEST
</div>
<br><br>
<form method='post' action='listMaterial.jsp' name='drddo' id='drddo'>
<table style='margin:auto'>
	<tr>
		<td style='width:120px;'>Select Missile:</td><td><select name='missileno' style='width:200px' onchange="getdept()">
		<option value='0'>---------</option>
		<%
		ResultSet rs123=stmt.executeQuery("select distinct missile from bdlreq where system='"+sys+"' order by missile asc");
		while(rs123.next()){
		%>
		<option value='<%=rs123.getString(1)%>'><%=rs123.getString(1) %></option>
		<%} %>
		</select>
		</td>
		<td style='width:120px;'>Select Section: </td>
		<td><select name='dept' style='width:200px' onchange="getReqno()">
						<option value='0'>--select--</option>
				<%
					ResultSet rss=stmt.executeQuery("select name from section where system='"+sys+"'");
					while(rss.next()){
						%><option value='<%=rss.getString(1) %>'><%=rss.getString(1) %></option>
					<%}
				%>
				
			</select>
		<%rss.close(); %>
		</td>
		<td style='width:120px;'>Select Reqno : </td>
		<td>
	<select name='reqno' style='width:200px'>
		<option value='0'>---------</option>
	</select>
		</td>
	</tr>
	<tr>
		<th colspan='2'>
			<br><br>
			<input type='button' value='LIST' id='stbtn' onclick='validateRequestList()'/>
		</th>
	</tr>
</table>
</form>

<!-- 

<form method='post' action='listMaterial.jsp' name='drddo'>
<table style='width:400px;margin:auto'>
	<tr>
		<td style='width:120px;'>Select Reqno : </td>
		<td>
	<select name='reqno' style='width:200px'>
		<option value='0'>---------</option>
		<%/*
			ResultSet rs=stmt.executeQuery("select distinct section,missile from bdlreq where system='"+sys+"' order by reqno");
			while(rs.next()){
				%>
				<option value='<%=rs.getString(1) %>'><%=rs.getString(1) %>_<%=rs.getString(2) %></option>
				<%
			}
		*/%>
	</select>
		</td>
	</tr>
	<tr>
		<th colspan='2'>
			<br><br>
			<input type='submit' value='LIST' id='stbtn'/>
		</th>
	</tr>
</table>
</form>
 -->
<%
//rs.close();
stmt.close();
con.close();
%>


<script type="text/javascript">
function getReqno()
{
	var missile=document.drddo.missileno.value;
	var dept=document.drddo.dept.value;
	//alert(missile+"  "+dept);
	ajaxMethod("^"+7+"^"+missile+"^"+dept+"^");
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
	      setValues(ajaxRequest.responseText);
	   }
	 }
	 var queryString = "?x=" + x ;
	 ajaxRequest.open("GET", "InwardAjax" + 
	                              queryString, false);
	 ajaxRequest.send(null); 
}

function setValues(arr){
	var opt=document.drddo.reqno;
	var len=opt.length;
	for(var i=len;i>0;i--)
		{//alert(i);
		opt.remove(i);
		}
	arr=arr.substring(arr.indexOf("^")+1);
	do
		{
		var option=document.createElement("option");
		arr=arr.substring(arr.indexOf("^")+1);
		//alert(arr);
		var dept=arr.substring(0,arr.indexOf("^"));
		option.value=dept;
		option.text=dept;
		opt.add(option);
		//alert(dept);
		}while(arr.substring(0,arr.indexOf("^"))!="");
	option.value="Dummy";
	option.text="Dummy";
	opt.add(option);
	}

function validateRequestList()
{
	if(document.drddo.reqno.value==""||document.drddo.reqno.value=="0"){
		alert("Please Select Missile, Section and Request Number Respectively");
		document.drddo.reqno.focus;
	}
	else
		{
		document.getElementById("drddo").submit();
		//window.location="listMaterial.jsp";
		}
}



/*
function getdept()
{
	var missile=document.drddo.missileno.value;
	ajaxMethod("^"+1+"^"+missile+"^");
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
		      setValues(ajaxRequest.responseText);
		   }
		 }
		 var queryString = "?x=" + x ;
		 ajaxRequest.open("GET", "bdlAjax.jsp" + 
		                              queryString, false);
		 ajaxRequest.send(null); 
	}
	
	function setValues(arr){
		while(arr.substring(arr.indexOf("$")+1)!="last$")
			{
			arr=arr.substring(arr.indexOf("$")+1);
			var dept=arr.substring(0,arr.indexOf("$"));
			//document.drddo.dept.option=dept;
			//alert(dept);
			}
			
		}
*/
</script>