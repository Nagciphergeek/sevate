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
	SYSTEM <%=sys %> > DUMMY INWARD
</div>
<hr>
<hr>
<form name='drdo'>
	<table id='inwardTable'>
		<tr>
			<td>Supply Order No.</td>
			<td><input type='text' name='supply' class='textB' value='-'/></td>
			<td style='width:50px;'></td>
			<td>Gate Pass No.</td>
			<td><input type='text' name='gate' class='textB' value='-'/></td>
			<td style='width:50px;'></td>
			<td>Report No.</td>
			<td><input type='text' name='report' class='textB' value='-'/></td>
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
								ResultSet rs=stmt.executeQuery("select * from dummy where system='"+sys+"'");
								while(rs.next()){
									%><option value='<%=rs.getString(4) %>'><%=rs.getString(4) %></option><%
								}
								%>
					    	</select>
					    	<input type='button' value='    ' onclick='getDetail(document.drdo.material.value,"6")' class='search'/>
			    		</td>
					</tr>
					<tr>
						<td class='inTabDesign'>DWG No.</td>
						<td><input type='text' name='drg' style='width:200px;' autocomplete="off"/></td>
					</tr>
					<tr>
						<td class='inTabDesign'>Available</td>
						<td><input type='text' name='availqty' style='width:200px;' autocomplete="off"/></td>
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
								rs=stmt.executeQuery("select * from inventory");
								while(rs.next()){
									%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
								}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign'>Location</td>
						<td>
							<input type='text' name='location' style='width:200px;'/>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign'>Vendor</td>
						<td id='venn'>
							<select name='vendor' style='width:200px' onchange='otherGet()'>
								<option value='0'></option>
								<%
								rs=stmt.executeQuery("select * from vendor");
								while(rs.next()){
									%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
								}
								%>
								<option value='otr'>Other</option>
							</select>
						</td>
					</tr>
					<tr>
						<td class='inTabDesign'>Inward Qty</td>
						<td>
							<input type='text' name='inqty' style='width:200px' autocomplete="off"/>
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
	<div style="word-wrap: break-word;width:1000px;margin:auto;" id='batchN'></div>
	<div id='saveBtn'><input type='button' value='SAVE' onclick='confirmDetails()'/></div>
	<input type="hidden" name="inwardsec" value="dummy">
	
	
	
	
</form>

<div id='mateD'>
</div>

<!-- 


				

 -->


    
    
    
</div>
<div id='confirm'>
<BR>
	<table style='width:90%;margin:auto;border-spacing:30px;'>
		<tr>
			<td>Supply Order No. </td><td id='supply'></td>
			<td>Gate Pass : </td><td id='gate'></td>
			<td>TC Report No. </td><td id='report'></td>
		</tr>
		<tr>
			<td>Code : </td><td id='code'></td>
			<td>Material : </td><td id='material'></td>
			<td>DWG No. : </td><td id='drg'></td>
		</tr>
		<tr>
			<td>Location : </td><td id='location'></td>
			<td>Inventry : </td><td id='inv'></td>
			<td>Inward Qty : </td><td id='inqty'></td>
		</tr>
	</table>
	<br><br>
	<div>
		<table style='width:100%;margin:auto'>
			<tr>
				<td style='width:49%;text-align:center'><input class='saveBtn' type='button' value='CONFIRM' onclick='saveMaterial()'/></td>
				<td style='width:49%;text-align:center'><input class='saveBtn' type='button' value='BACK' onclick="document.getElementById('confirm').style.display='none';"/></td>
			</tr>
		</table>
	</div>
	
	
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
    
    
    function otherGet(){
    	var otr=document.drdo.vendor.value;
    	if(otr=='otr'){
    		document.getElementById("venn").innerHTML="<input type='text' name='vendor' class='small'/>";
    	}
    }
  </script>
</head>