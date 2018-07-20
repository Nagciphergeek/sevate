<%@include file="bdlHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/inward.css">
<script src="js/jquery.js"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/inward.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/chosen.css">
<style type="text/css" media="all">
    /* fix rtl for demo */
    .chosen-rtl .chosen-drop { left: -9000px; }
  </style>
  <body onload='setSomeValues()'>
 <div style='background-color:#ffffff;'>
<div class='path'>
	SYSTEM <%=sys %> > REPORT
</div>
<hr>
<hr>
<table style='width:80%;margin:auto;border-collapse:collapse;font-size:13px' border='1'>
	<tr>
		<th style='width:20px;'>SNo</th>
		<th>REPORT</th>
		<th style='width:150px;text-align:center'>AVAILABLE</th>
	</tr>
	<%
	int iid=1;
	
	int i=1;
	ResultSet rs=stmt.executeQuery("select * from report where system='"+sys+"'");
	while(rs.next()){
		if(!rs.getString(1).equals("-")){
			%><tr><td style='text-align:center'><%=i %></td><td><%=rs.getString(2) %></td><td style='text-align:center'>
				<a href='Download?x=<%=rs.getInt(1) %>.pdf' target='_NEW'><img src='images/open.png' style='width:20px'/></a>
			</td></tr><%
			i++;
		}
	}
	%>
</table>
<%
	rs.close();
	stmt.close();
	con.close();
%>
</div>