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
  <body>
 <div style='background-color:#ffffff;'>
<div class='path'>
	SYSTEM <%=sys %> > INWARD
</div>
<%
	Statement stmt1=con.createStatement();
	String id=request.getParameter("x");
	ResultSet rs=stmt.executeQuery("select * from inward"+sys+" where id="+id);
	if(!rs.next()){}
%>
<hr>
<hr>
<form name='drdo' action='NewRequestReport' method='post'>
	<table id='inwardTable'>
		<tr>
			<td>Supply Order No.</td>
			<td><input type='text' name='supply' class='textB' value='<%=rs.getString(15) %>'/></td>
			<td style='width:50px;'></td>
			<td>Gate Pass No.</td>
			<td><input type='text' name='gate' class='textB' value='<%=rs.getString(11) %>'/></td>
			<td style='width:50px;'></td>
			<td>Report No.</td>
			<td><input type='text' name='report' class='textB' value='<%=rs.getString(10) %>'/></td>
		</tr>
	</table>
	<hr>
	<hr>
	<table style='width:100%;'>
		<tr>
			<td style='width:50%'>
				<table class='innTab'>
					<tr>
						<td class='inTabDesign'>Code</td>
						<td>
							<input type='hidden' name='iid' value='<%=rs.getInt(1) %>'/>
							<input type='text' name='code' value='<%=rs.getString(3) %>' readonly 	style='width:90px;' autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign'>Material</td>
						<td>
							<input type='text' name='material' value='<%=rs.getString(2) %>' readonly style='width:90px;' autocomplete="off"/>
			    		</td>
					</tr>
					<tr>
						<td class='inTabDesign'>DWG No.</td>
						<td><input type='text' name='drg' style='width:200px;' value='<%=rs.getString(4) %>' autocomplete="off"/></td>
					</tr>
					<tr>
						<td class='inTabDesign'>Available</td>
						<td><input type='text' name='availqty' style='width:200px;' value='<%=rs.getString(5) %>' autocomplete="off"/></td>
					</tr>
					
				</table>		
			</td>
			<td style='width:50%'>
				<table class='innTab'>
					<tr>
						<td class='inTabDesign'>Inventory</td>
						<td>
							<select name='inv' style='width:200px'>
								<option value='0'>---------</option>
								<%
								ResultSet rs1=stmt1.executeQuery("select * from inventory");
								while(rs1.next()){
									if(rs.getString(6).equals(rs1.getString(2))){
										%><option selected value='<%=rs1.getString(2) %>'><%=rs1.getString(2) %></option><%
									}else{
										%><option value='<%=rs1.getString(2) %>'><%=rs1.getString(2) %></option><%
									}
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign'>Location</td>
						<td>
							<input type='text' name='location' value='<%=rs.getString(7) %>' style='width:200px;'/>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign'>Vendor</td>
						<td>
							<select name='vendor' style='width:200px'>
								<option value='0'></option>
								<%
								rs1=stmt1.executeQuery("select * from vendor");
								while(rs1.next()){
									if(rs.getString(13).equals(rs1.getString(2))){
										%><option selected value='<%=rs1.getString(2) %>'><%=rs1.getString(2) %></option><%
									}else{
										%><option value='<%=rs1.getString(2) %>'><%=rs1.getString(2) %></option><%
									}
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign'>Inward Qty</td>
						<td>
							<input type='text' name='inqty' style='width:200px' value='<%=rs.getString(8) %>' autocomplete="off"/>
							<input type='hidden' name='inqty1' style='width:200px' value='<%=rs.getString(8) %>'/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>	
	<table class='innTab'>
		<tr>
			<td class='inTabDesign'>Batch / Sl No</td>
			<td>
				<input type='text' name='batch' style='width:200px' autocomplete="off"/>
				<input type='button' value='+' id='bcbtn' onclick='nextBatch()'/>
			</td>
		</tr>
	</table>
	<div style="word-wrap: break-word;width:1000px;margin:auto;" id='batchN'>
	<%
		rs1=stmt1.executeQuery("select * from "+sys+" where code='"+rs.getString(3)+"' AND material='"+rs.getString(2)+"'");
		if(rs1.next()){
			rs=stmt.executeQuery("select * from bcnot where pid='"+rs1.getInt(1)+"' AND sys='"+sys+"' AND iniid='"+id+"'");// 
			while(rs.next()){
			%>
				<input type='text' name='bat' value='<%=rs.getString(2) %>' onblur="removeText()"/>
				<input type='hidden' name='bati' value='<%=rs.getInt(1) %>'/>
			<%
			}
		}
	%>	
	</div>
	<div id='saveBtn'><input type='button' value='SAVE' onclick='document.drdo.submit();'/></div>
</form>
	
	
</div>
</body>
<head>
<script type="text/javascript">
    var config = {
      '.chosen-select'           : {},
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