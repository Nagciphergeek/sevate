<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<link rel="stylesheet" type="text/css" href="css/inward.css">
<script src="js/jquery.js"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/inward.js" type="text/javascript"></script>
<link rel="stylesheet" href="css/chosen.css">
<style type="text/css" media="all">
    /* fix rtl for demo */
    .chosen-rtl .chosen-drop { left: -9000px; }
  </style>
<style>
	#stbtn{
		width:150px;
		border:0px;
		background-color:green;
		color:orange;
		font-weight:bolder;
	}
</style>
<body id='bodyI'>
<%@include file="bdlHead.jsp" %>
<%
String rsq=(String)session.getAttribute("rsq");
%>
<div class='path'>
	SYSTEM <%=sys %> > RETURN
</div>
<br><br>
<div id='wP'>
<div style='text-align:center;font-weight:bold;font-size:20px'>LIST OF MATERIAL RETURNED TO BONDED STORE BY BDL(PPC)</div><br>
<table style='width:90%;margin:auto;font-size:12px;;border-collapse:collapse'>
	<tr>
		<td colspan='6'>Req No : <%=rsq %><br><br></td>
	</tr>
	<tr>
		<th style='border:1px solid'>SNo</th>
		<th style='border:1px solid'>Code</th>
		<th style='border:1px solid'>Material</th>
		<th style='border:1px solid'>DWG</th>
		<th style='border:1px solid'>BOM</th>
		<th style='border:1px solid'>Return Qty</th>
		<th style='border:1px solid'>Remarks</th>
	</tr>
	<%
	ResultSet rs=stmt.executeQuery("select * from returnreq where retreqno='"+rsq+"'");
	int i=1;
	while(rs.next()){
		%>
		<tr>
			<td style='text-align:center;border:1px solid'><%=i %></td>
			<td style='text-align:center;border:1px solid'><%=rs.getString(7) %></td>
			<td style='border:1px solid'><%=rs.getString(6) %></td>
			<td style='text-align:center;border:1px solid'><%=rs.getString(8) %></td>
			<td style='text-align:center;border:1px solid'><%=rs.getString(9) %></td>
			<td style='text-align:center;border:1px solid'><%=rs.getString(13) %></td>
			<td style='text-align:center;border:1px solid'><%=rs.getString(24) %></td>
		</tr>
		<%
	}
	%>
</table>
</div>
<br><br>
<table style='width:90%;margin:auto'>
	<tr>
		<th><input type='button' value='BACK' onclick='window.location="damage.jsp"'/></th>
		<th><input type='button' value='PRINT' onclick='getpRINT()'/></th>
	</tr>
</table>
</body>
<%
	rs.close();
	stmt.close();
	con.close();
%>
<script>
function getpRINT(){
	var x=document.getElementById("bodyI").innerHTML;
	document.getElementById("bodyI").innerHTML=document.getElementById("wP").innerHTML;
	window.print();
	document.getElementById("bodyI").innerHTML=x;
}

</script>