<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/pickmeup.css">
<script src="js/jquery.js"></script>
<script type="text/javascript" src="js/status.js"></script>
<script type="text/javascript" src="js/jquery.pickmeup.min.js"></script>
<div class='path'>
	SYSTEM <%=sys %> > ISSUEHISTORY
	
</div>

<div>
<input type="text" id="datepick" />

<input type="button" value="submit" onclick="submitt()"/>
</div>

<script>
$('#datepick').pickmeup({
	
	format:'d/m/Y'
	
});
function submitt()
{
	
var a=document.getElementById("datepick").value;
//alert(a);
window.location.href="newIssuHistorySubmit.jsp?x="+a;
}
</script>