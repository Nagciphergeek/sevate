<%@include file="bdlHead.jsp" %>
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
<div class='path'>
	SYSTEM <%=sys %> > RETURN
</div>
<br>
<form name='drdo' method='post' action='Damage'>
<table style='width:100%;margin:auto'>
		<tr>
			<td>
				<table style='width:500px;margin:auto'>
					<tr>
						<td class='inTabDesign1'>SSQAG/Report</td>
						<td>
							<select name='rept' style='width:400px'>
								<option value='0'>---------</option>
								<%
								ResultSet rs=stmt.executeQuery("select distinct(report) from inward"+sys+"");
								while(rs.next()){
									%><option value='<%=rs.getString(1) %>'><%=rs.getString(1) %></option><%
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign1'>Batch No.</td>
						<td><input type='text' name='bcno' style='width:400px;' autocomplete="off"/></td>
					</tr>
				</table>
				<br><br>
				<table class='innTab'>
					<tr>
						<td class='inTabDesign'>Code</td>
						<td>
							<input type='hidden' name='iid'/>
							<input type='text' name='code' style='width:90px;' autocomplete="off"/>
							<input type='button' value='    ' onclick='getDetail(document.drdo.code.value,"1")' class='search'/>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign'>Material</td>
						<td id='mate'>
							<select name='material' data-placeholder="Choose a Material..." style='width:200px;margin:0px;' class="chosen-select">
						        <option></option>
								<%
								rs=stmt.executeQuery("select * from "+sys);
								while(rs.next()){
									%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
								}
								%>
					    	</select>
					    	<input type='button' value='    ' onclick='getDetail(document.drdo.material.value,"2")' class='search'/>
			    		</td>
					</tr>
					<tr>
						<td class='inTabDesign'>DWG No.</td>
						<td><input type='text' name='drg' style='width:200px;' autocomplete="off"/></td>
					</tr>
					<tr>
						<td class='inTabDesign'>Reqno :</td>
						<td>
							<select name='reqno'>
						        <option value='0'>-----</option>
						        <option value='Other'>Other</option>
								<%
								rs=stmt.executeQuery("select distinct(reqno) from issue"+sys+"");
								while(rs.next()){
									%><option value='<%=rs.getString(1) %>'><%=rs.getString(1) %></option><%
								}
								%>
					    	</select>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign'>Return Quantity :</td>
						<td><input type='text' name='retn' style='width:200px;' autocomplete="off"/></td>
					</tr>
				</table><br>
				<table style='width:500px;margin:auto'>
					<tr>
						<td class='inTabDesign1'>Reason :</td>
						<td>
							<textarea name='reason' class='textA'></textarea>
						</td>
					</tr>
					<tr>
						<td colspan='2' style='text-align:center'>
							<input type='button' value='OK' class='bttnn' onclick='damageIt()'/>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
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