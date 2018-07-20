<%@include file="bdlHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<div class='path'>
SYSTEM <%=sys %>
</div>
<br>
<div>
	
</div>
<table id='bdlBom'>
	<tr>
		<th><input type='button' value='BILL OF MATERIAL' class='inward' onclick='window.location="bdlbom.jsp"'/></th>
		<th><input type='button' value='NEW REQUEST' class='inward' onclick='window.location="newRequest.jsp"'/></th>
	</tr>
	<tr>
		<th><input type='button' value='REQUEST' class='inward' onclick='window.location="allReq.jsp"'/></th>
		<th><input type='button' value='REPORTS' class='inward' onclick='window.location="bdlReport.jsp"'/></th>
	</tr>
	<tr>
		<th><input type='button' value='RETURN' class='inward' onclick='window.location="damage.jsp"'/></th>
		<th><input type='button' value='' class='inward' onclick='#'/></th>
	</tr>
</table>

<!--  -->