<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
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
	SYSTEM <%=sys %> > BDL
</div>
<br><br>
<table class='menuT'>
	<tr>
		<th><input type='button' value='BDL REQUEST' class='inward' onclick='window.location="reqsearch.jsp"'/></th>
		<th><input type='button' value='RETURNED' class='inward' onclick='window.location="cancelRequest.jsp"'/></th>
	</tr>
</table>