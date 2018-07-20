<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<body>
<div class='path'>
	SYSTEM <%=sys %> > STATUS
</div>
<table class='menuT'>
	<tr>
		<th><input type='button' value='MISSILE' class='inward' onclick='window.location="missile.jsp"'/></th>
		<th><input type='button' value='STOCK' class='inward' onclick='window.location="stock.jsp"'/></th>		
	</tr>
	<tr>
		<th><input type='button' value='REPORTS' class='inward' onclick='window.location="report.jsp"'/></th>
		<th><input type='button' value='NO REPORTS' class='inward' onclick='window.location="NoReport.jsp"'/></th>
		<th><input type='button' value='PLANNING' class='inward' onclick='window.location="planning.jsp"'/></th>
		
	</tr>
	<tr>
	<%if(userty.equals("3")){ %>
	
		<th><input type='button' value='INWARD HISTORY' class='inward' onclick='window.location="inwardDet.jsp"'/></th>
		<th><input type='button' value='ISSUE HISTORY' class='inward' onclick='window.location="issueHis.jsp"'/></th>
	</tr>
	<tr>
	<th><input type='button' value='PENDING REQUESTS' class='inward' onclick='window.location="hiii.jsp"'/></th>
	<th><input type='button' value='DAMAGED HISTORY' class='inward' onclick='window.location="DamagedHistory.jsp"'/></th>
	
	
	</tr>
	<%} %>
	<tr>
	<th><input type='button' value='NEWPLANINIG' class='inward' onclick='window.location="NewPlan.jsp"'/></th>
	<%if(userty.equals("5")){ %>
	<th><input type='button' value='BDLREQUESTSTATUS' class='inward' onclick='window.location="NewPlanning.jsp"'/></th>
	</tr>
		<%} %>
	
	
</table>
<br>
</body>