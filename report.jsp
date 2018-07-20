<%@include file="aslHead.jsp" %>
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
		<th style='text-align:center'>AVAILABLE</th>
	</tr>
	<%
	int iid=1;
	ResultSet rs=stmt.executeQuery("select max(id) from report");
	int i=1;
	if(userty.equals("3")){
	if(rs.next())
		iid=rs.getInt(1)+1;
	rs=stmt.executeQuery("select distinct(rep) from bcnot where sys='"+sys+"' AND rep not in(select name from report) AND rep not in(select rep from bcnotis where sys='"+sys+"')");
	while(rs.next()){
		if(!rs.getString(1).equals("-")){
			%><tr><td style='text-align:center'><%=i %></td><td><%=rs.getString(1) %></td><td style='text-align:center'>
				<form name='up<%=i %>' action='UP' method='post' enctype='multipart/form-data'>
					<input type='hidden' name='<%=rs.getString(1) %>' value='<%=iid %>'/>
					<input type='file' name='file' id='file'/>
					<input type='button' onclick='validateit("up<%=i %>")' class='bcbtn'/>
				</form>
			</td></tr><%
			i++;
		}
	}
	rs=stmt.executeQuery("select distinct(rep) from bcnotis where sys='"+sys+"' AND rep not in(select name from report)");
	while(rs.next()){
		if(!rs.getString(1).equals("-")){
			%><tr><td style='text-align:center'><%=i %></td><td><%=rs.getString(1) %></td><td style='text-align:center'>
				<form name='up<%=i %>' action='UP' method='post' enctype='multipart/form-data'>
					<input type='hidden' name='<%=rs.getString(1) %>' value='<%=iid %>'/>
					<input type='file' name='file' id='file'/>
					<input type='button' onclick='validateit("up<%=i %>")' class='bcbtn'/>
				</form>
			</td></tr><%
			i++;
		}
	}
	}
	rs=stmt.executeQuery("select * from report where system='"+sys+"'");
	while(rs.next()){
		if(!rs.getString(1).equals("-")){
			%><tr><td style='text-align:center'><%=i %></td><td><%=rs.getString(2) %></td><td style='text-align:center'>				
				<form name='d<%=rs.getInt(1) %>' action='ReportDelete' method='post'>
					<table border='0' style='margin:auto;width:200px'>
						<tr>
							<td style='width:20px'><a href='Download?x=<%=rs.getInt(1) %>.pdf' target='_NEW'><img src='images/open.png' style='width:20px'/></a></td>
							<td><input type='hidden' name='iidd' value='<%=rs.getInt(1) %>'/>
							<%if(userty.equals("3")){ %>
								<input type='button' class='bcbtn1' onclick='document.d<%=rs.getInt(1) %>.submit()'/>
							<%} %>
							</td>
						</tr>
					</table>				
				</form>
			</td></tr><%
			i++;
		}
	}
	%>
</table>

</div>
<script>
function validateit(x){
	if(document.getElementsByName(x)[0].file.value==""){
		alert("Select PDF File");
		return;
	}
	var ty=document.getElementsByName(x)[0].file.value;
	ty=ty.substring(ty.indexOf(".")+1);
	if(ty!="pdf"){
		alert("Select PDF File");
		return;
	}
	document.getElementsByName(x)[0].submit();
}
</script>