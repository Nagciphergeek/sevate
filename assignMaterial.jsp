<%@include file="aslHead.jsp" %>
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
<body>

<div class='path'>
	SYSTEM <%=sys %> > EDIT BOM > ASSIGN MATERIAL
</div>
<br>
<form name='drdo' method='post' action='MaterialSub'>
	<table style='width:90%;margin:auto'>
		<tr>
			<td>MATERIAL : </td>
			<td id='mate'>
				<select name='material' data-placeholder="Choose a Material..." style='width:200px;margin:0px;' class="chosen-select">
			        <option></option>
					<%
					ResultSet rs=stmt.executeQuery("select * from "+sys);
					while(rs.next()){
						%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
					}
					%>
		    	</select>
		    	<input type='button' value='    ' onclick='getDetail(document.drdo.material.value,"2")' class='search'/>
    		</td>
			<td>CODE : </td>
			<td>
				<input type='hidden' name='iid'/>
				<input type='text' name='code' style='width:90px;' autocomplete="off"/>
				<input type='button' value='    ' onclick='getDetail(document.drdo.code.value,"1")' class='search'/>
			</td>
		</tr>
		<tr>
			<td>DWG NO : </td>			
			<td><input type='text' readonly name='drg'/></td>
			<td>BOM : </td>
			<td><input type='text' name='bom'/></td>
		</tr>
	</table>
	<br><br>
	<table style='width:300px;margin:auto;'>
		<tr>
			<td>SECTION : </td>
			<td>
				<select name='section' style='width:200px;margin:0px;'>
			        <option></option>
					<%
					rs=stmt.executeQuery("select * from section where system='"+sys+"'");
					while(rs.next()){
						%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
					}
					%>
		    	</select>
			</td>
		</tr>
		<tr>
			<td>GROUP : </td>
			<td>
				<select name='dept' style='width:200px;margin:0px;'>
			        <option></option>
					<%
					rs=stmt.executeQuery("select * from dept");
					while(rs.next()){
						%><option value='<%=rs.getString(2) %>'><%=rs.getString(2) %></option><%
					}
					%>
		    	</select>
			</td>
		</tr>
	</table>
	<br>
	<div style='text-align:center'><input type='button' value='SAVE' onclick='saveAssign()'/></div>
</form>
<%
	stmt.close();
	con.close();
%>
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
    
    
    
    function saveAssign(){
    	if(document.drdo.code.value==""){
    		alert("ENTER CODE");
    		return;
    	}
    	if(document.drdo.material.value==""){
    		alert("SELECT MATERIAL");
    		return;
    	}
    	if(document.drdo.bom.value=="" || isNaN(document.drdo.bom.value)){
    		alert("ENTER BOM");
    		return;
    	}
    	if(document.drdo.drg.value==""){
    		alert("ENTER DRG");
    		return;
    	}
    	if(document.drdo.section.value=="0"){
    		alert("SELECT SECTION");
    		return;
    	}
    	if(document.drdo.dept.value=="0"){
    		alert("SELECT GROUP");
    		return;
    	}
    	document.drdo.submit();
    }
  </script>