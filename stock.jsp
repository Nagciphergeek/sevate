<div id='bodyI'>
<%@include file="aslHead.jsp" %>
<div class='path'>
	SYSTEM <%=sys %> > STOCK
</div>
<br>
<div style='text-align:center'>
	SECTION : <select name='section' onchange='getList(this.value)'>
				<option value='0'>----</option>
				<%
				ResultSet rs=stmt.executeQuery("select distinct(section) from bom where system='"+sys+"'");
				while(rs.next()){
					%><option value='<%=rs.getString(1) %>'><%=rs.getString(1) %></option><%
				}
				%>
				<option value="all">All</option>
			</select>
</div>
<br>
<div id='status'>
</div>
<div style='text-align:center'>
<input type='button' value='PRINT' onclick='printDoc()'/>
</div>
</div>
<div id='status1' style='display:none;'></div>


<script>
	function printDoc(){
		document.getElementById("status1").innerHTML=document.getElementById("bodyI").innerHTML;
		document.getElementById("bodyI").innerHTML=document.getElementById("status").innerHTML;
		window.print();
		document.getElementById("bodyI").innerHTML=document.getElementById("status1").innerHTML;
	}
	function getList(x){
		x="^5^"+x+"^";
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
			   document.getElementById("status").innerHTML=(ajaxRequest.responseText);
		   }
		 }
		var queryString = "?x=" + x ;
		ajaxRequest.open("GET", "Status" + 
		                              queryString, false);
		ajaxRequest.send(null); 
	}
</script>
<%
rs.close();
stmt.close();
con.close();
%>