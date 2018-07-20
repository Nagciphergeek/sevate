
<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/status.css">
<script type="text/javascript" src="js/status.js"></script>

<div class='path'>
	SYSTEM <%=sys %> > ISSUE HISTORY
</div>
<hr>

<div style='text-align:center;font-weight:bold;font-size:15px'>ISSUE DETAILS WITHOUT SEARCH</div>
<br>



<table id='inTab'>

	<tr>
	
	<th>missile :
			<select id='reqno2' >
			<option value='0'>---------</option> 
			<%
		
			
			ResultSet rs2=stmt.executeQuery("select distinct(missile) from issue"+sys+" order by missile");
			//ResultSet rs=stmt.executeQuery("select id from issuedummy");
			while(rs2.next()){
				
				%><option value='<%=rs2.getString(1) %>'><%=rs2.getString(1) %></option><%
						
			}
			
			%>
			</select>
		</th>
		
	<th>section :
			<select id='reqno1' onchange='getHistory1()'>
			<option value='0'>---------</option> 
			<%
		
			
			ResultSet rs1=stmt.executeQuery("select distinct(section) from issue"+sys);
			//ResultSet rs=stmt.executeQuery("select id from issuedummy");
			while(rs1.next()){
				
				%><option value='<%=rs1.getString(1) %>'><%=rs1.getString(1) %></option><%
						
			}
			
			%>
			</select>
		</th>
		
		
		<th>Request No :
			<select id='reqno' onchange='getHistory()'>
			 
		
			</select>
		</th>
		<td></td>
		
	</tr>
</table>
<br>

<div id='resul'></div>

<%
//rs.close();
rs1.close();
stmt.close();
con.close();
%>
