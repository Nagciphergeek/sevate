function deleteBom(x){
	
	var opt=confirm("Are you sure want to delete")
	if(opt==true)
		{
		//var sec=request.getParameter("section");
		//var dept=request.getParameter("dept");
		//var sea=request.getParameter("searc");
		//alert(sec+""+dept+""+sea);
		//window.location="deleteBom.jsp?x="+x+"&sec="+sec+"&dept="+dept+"&sea="+sea;
		window.location="deleteBom.jsp?x="+x;
		}
	
}
function getBOM(){
	var sec=document.getElementById("section");
	var dept=document.getElementById("dept");
	var sea=document.getElementById("searchentry1");
	if(sea.value==null || sea.value== "")
		{
		var sear="(_)";
		}
	else
		{
		var sear=sea.value;
		}
		//alert("^4^"+sec.value+"^"+dept.value+"^");
	if(dept.value=='0')
		return;	
	else
		ajaxMethod("^4^"+sec.value+"^"+dept.value+"^"+sear+"^");
		}

function getBOMEdit(){

	var sec=document.getElementById("section");
	var dept=document.getElementById("dept");
	var sea=document.getElementById("searchentry1");
	if(sea.value==null || sea.value== "")
		{
		var sear="(_)";
		}
	else
		{
		var sear=sea.value;
		}
		//alert("^7^"+sec.value+"^"+dept.value+"^");
	if(dept.value=='0')
		return;	
	else{
		//alert("^7^"+sec.value+"^"+dept.value+"^");
		ajaxMethod("^7^"+sec.value+"^"+dept.value+"^"+sear+"^");}
}

function getBOMD(){
	var sec=document.getElementById("section");
	var dept=document.getElementById("dept");
	//alert("^4^"+sec.value+"^"+dept.value+"^");
	if(dept.value=='0')
		return;	
	else
		ajaxMethod("^5^"+sec.value+"^"+dept.value+"^");
}

function ajaxMethod(x){
	var ajaxRequest;
	try{
		ajaxRequest = new XMLHttpRequest();
	}catch (e){
		try{
	      ajaxRequest = new ActiveXObject("Msxml2.XMLHTTP");
	   }catch (e) {
	      try{
	         ajaxRequest = new ActiveXObject("Microsoft.XMLHTTP");
	      }catch (e){
	    	  alert("Your browser broke!");
	         return false;
	      }
	   }
	}
	ajaxRequest.onreadystatechange = function(){
	   if(ajaxRequest.readyState == 4){
		   setValues(ajaxRequest.responseText);
	   }
	 }
	var queryString = "?x=" + x ;
alert(queryString );
	ajaxRequest.open("GET", "InwardAjax" + 
	                              queryString, false);
	ajaxRequest.send(null); 
}


function setValues(arr){
	//alert(arr);
	arr=arr.substring(arr.indexOf('^')+1);
	var y=parseInt(arr.substring(0,arr.indexOf('^')));
	if(y==1){
		arr=arr.substring(arr.indexOf('^')+1);
		document.getElementById("bomDet").innerHTML=arr.substring(0,arr.indexOf('^'));
	}
}
//for instantUpdateBOM.jsp
function validateIBE()
{
	//alert(document.instantupdatebom.loppvar.value);
	var loopv=parseInt(document.instantupdatebom.loppvar.value);
	//alert(loopv);
	for(var i=1;i<loopv-1;i++)
		{	
			alert(document.instantupdatebom.bom+i.value);
			if(document.instantupdatebom.bom+i.value=="" || isNaN(document.instantupdatebom.bom+i.value)){
			document.instantupdatebom.bom+i.focus;
			alert("Invalid BOM QTY"+i);
			return;
			}
		}
}