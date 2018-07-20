<%@include file="aslHead.jsp" %>
<br><br>
<%
ResultSet rs=stmt.executeQuery("select * from login1 where Name='"+user+"'");
rs.next();
%>
<form name='drdo' action='Profile' method='post'>
	<table id='pass'>
		<tr>
			<td class='tex'>Name : </td><td><input type='text' value='<%=rs.getString(4) %>' name='fname'/></td>
		</tr>
		<tr>
			<td class='tex'>Username : </td><td><input type='text' readonly value='<%=rs.getString(1) %>' name='uname'/></td>
		</tr>
		<tr>
			<td class='tex'>Password : </td><td><input type='password' value='<%=rs.getString(2) %>' name='pass'/></td>
		</tr>
	</table>
	<br>
	<div style='text-align:center'>
		<input type='button' value='SAVE' id='save' onclick='validateAlll()'/>
	</div>
</form>
<%
rs.close();
stmt.close();
con.close();
%>
<script>
	function validateAlll(){
		var fname=document.drdo.fname.value;
		var uname=document.drdo.uname.value;
		var pass=document.drdo.pass.value;
		if(pass.indexOf("^")>=0 || pass.indexOf("#")>=0 ||pass.indexOf("@")>=0 || pass.indexOf("+")>=0 || pass.indexOf("&")>=0){
			alert("Cannot enter @#^&+");
			return;
		}
		if(uname.indexOf("^")>=0 || uname.indexOf("#")>=0 ||uname.indexOf("@")>=0 || uname.indexOf("+")>=0 || uname.indexOf("&")>=0){
			alert("Cannot enter @#^&+");
			return;
		}
		if(fname.indexOf("^")>=0 || fname.indexOf("#")>=0 ||fname.indexOf("@")>=0 || fname.indexOf("+")>=0 || fname.indexOf("&")>=0){
			alert("Cannot enter @#^&+");
			return;
		}
		document.drdo.submit();
	}
</script>