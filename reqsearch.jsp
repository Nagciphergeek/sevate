<%@include file="aslHead.jsp" %>
<link rel="stylesheet" type="text/css" href="css/inward.css">
<script src="js/jquery.js"></script>
<script src="js/chosen.jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="js/status.js"></script>
<link rel="stylesheet" href="css/chosen.css">
<style type="text/css" media="all">
    /* fix rtl for demo */
    .chosen-rtl .chosen-drop { left: -9000px; }
  </style>
  <!-- <body onload='setSomeValues()'> -->
  <body >

<div class='path'>
	SYSTEM <%=sys %> > ISSUEHISTORY
	
</div>
<hr>

<hr>


	
	<table style='width:100%;'>
							
					<tr>
						<td></td>
						<td >
		REQUESTED MATERIAL:				<%ResultSet rs=stmt.executeQuery("select reqno,material from bdlreq where system='"+sys+"'");
						
						%>
							<select id='reqno'  data-placeholder="Choose a Material..." style='width:500px;margin:0px;' class="chosen-select">
						        <option></option>
						        
								<%
								
								while(rs.next()){
									%><option value='<%=rs.getString(1) %>'><%=rs.getString(1) %>(<%=rs.getString(2) %>)</option><%
								}
								%>
					    	</select>
					    	<input type='button' value='    ' onclick="window.location='requestList.jsp'" class='search'/>
			    		</td>
					</tr>
					
					
				</table>		
		
<%
rs.close();
stmt.close();
con.close();
%>
		


</body>
<head>
<script type="text/javascript">
    var config = {
      '.chosen-select'           : {search_contains:true},//search_contains is used to search from any index of a word
      '.chosen-select-deselect'  : {allow_single_deselect:true},
      '.chosen-select-no-single' : {disable_search_threshold:10},
      '.chosen-select-no-results': {no_results_text:'Oops, nothing found!'},
      '.chosen-select-width'     : {width:"80%"}
    }
    for (var selector in config) {
      $(selector).chosen(config[selector]);
    }
    
    
   
  </script>
</head>