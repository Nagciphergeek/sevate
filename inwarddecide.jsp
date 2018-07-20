<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/inward.css">
<script src="js/jquery.js"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script src="js/inward.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/aslMenu.css">
<style type="text/css" media="all">
    /* fix rtl for demo */
    .chosen-rtl .chosen-drop { left: -9000px; }
  </style>
  <body onload='setSomeValues()'>
 <div style='background-color:#ffffff;'>
<div class='path'>
	SYSTEM <%=sys %> > INWARD SELECTION
</div>
<hr>
<hr>
<table class='menuT'>
	<tr>
		<th><input type='button' value='INWARD' class='inward' onclick='window.location="inward.jsp"'/></th>
		<th><input type='button' value='DUMMY INWARD' class='inward' onclick='window.location="dummyinward.jsp"'/></th>
	</tr>
	</table>
</div>

</body>
</html>