	
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
Connection conn;
Statement stmtfillref,stmtfillarray,stmtfillcname,stmtfillcarray;
ResultSet rsref,rsarray,rscname,rscarray;
String cnames[],ccods[],noss[],sems[],pcods[],pnames[],fullms[],cdts[];
String ref,cname;
String ccod[],nos[];
int i;

public void doconnect(){
try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	}
	catch(ClassNotFoundException cnfc){
		System.out.println("Unable to load driver ");
	}
	
	try{
		conn=DriverManager.getConnection("jdbc:odbc:LocalServer","sa","ROOT");
	}
	catch(SQLException sqe){
		System.out.println("Unable to connect with Database "+sqe);
	}
}
%>

<%
cnames=new String [30];
ccods=new String [30];
noss=new String [30];
sems=new String [30];
pcods=new String [30];
pnames=new String [30];
fullms=new String [30];
cdts=new String [30];




doconnect();
try{
	stmtfillarray=conn.createStatement();
	rsarray=stmtfillarray.executeQuery("select * from vet_tblsyllabus");
	i=0;
	while(rsarray.next()){
		 cnames[i]=rsarray.getString("c_name").trim();
		 ccods[i]=rsarray.getString("c_code");
		 noss[i]=rsarray.getString("no_of_sem");
		 sems[i]=rsarray.getString("semester").trim();
		 pcods[i]=rsarray.getString("p_code");
		 pnames[i]=rsarray.getString("p_name");
		 fullms[i]=rsarray.getString("full_mark");
		 cdts[i]=rsarray.getString("credit");
		 
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>

<%
ccod=new String [30];
nos=new String [30];





doconnect();
try{
	stmtfillcarray=conn.createStatement();
	rscarray=stmtfillcarray.executeQuery("select * from vet_tblcourse");
	i=0;
	while(rscarray.next()){
		 ccod[i]=rscarray.getString("c_code");
		 nos[i]=rscarray.getString("no_of_sem");
		
		 
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>





<html>
<head>
<title>Syllabus Information</title>

<script language="javascript">
function showprofile(){
	window.location="vet_syllabusc.jsp";
}
</script>
<script language="javascript">
var jcnames=new Array();
var jccods=new Array();
var jnoss=new Array();
var jsems=new Array();
var jpcods=new Array();
var jpnames=new Array();
var jfullms=new Array();
var jcdts=new Array();

var j,k;	

function showsyllabus(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jcnames[j]= "<%=cnames[i]%>";
 jccods[j]= "<%=ccods[i]%>";		
 jnoss[j]= "<%=noss[i]%>";
 jsems[j]= "<%=sems[i]%>";
 jpcods[j]= "<%=pcods[i]%>";
 jpnames[j]= "<%=pnames[i]%>";
 jfullms[j]= "<%=fullms[i]%>";
 jcdts[j]= "<%=cdts[i]%>";
 
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbref.selectedIndex;
  
  document.f1.cmbcname.value=jcnames[k-1];
  document.f1.txtccod.value=jccods[k-1];
  document.f1.txtnos.value=jnoss[k-1];
  document.f1.cmbsem.value=jsems[k-1];
  document.f1.txtpcod.value=jpcods[k-1];
  document.f1.txtpname.value=jpnames[k-1];
  document.f1.txtfm.value=jfullms[k-1];
  document.f1.txtcd.value=jcdts[k-1];
  
	
}

</script>


<script language="javascript">
var jccod=new Array();
var jnos=new Array();


var j,k;	

function showcourse(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jccod[j]= "<%=ccod[i]%>";
 jnos[j]= "<%=nos[i]%>";		
 
 
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbcname.selectedIndex;
  
  document.f1.txtccod.value=jccod[k-1];
  document.f1.txtnos.value=jnos[k-1];
  
  
	
}

</script>





<style type="text/css">
*{
margin:0px;
padding:0px;
font-family:arial;
}
#nav{

position:absolute;
top:50%;
left:50%;
transform:translateX(-50%) translateY(-50%);
}
header{
background-color:#355c7d;
height:70px;
text-align:center;

}

footer{
position:fixed;
left:0;
bottom:0;
width:100%;
height:70px;
background-color:#355c7d;
}

p{
font-size:25px;
color:#355c7d;
}

.bttn{
padding:15px;
margin:5px;
}
.uni{
padding:15px;
}
#bt1,#bt2,#bt3{
height:25px;
width:75px;
 border:1px;
 background-color:0c7bb3;
 color:white;
 border-radius:4px;
  font-size:11px;
  cursor:pointer;
  font-weight:bold;
}
#txt{
width:150px;
height:20px;
display:block;
 border:1px solid;
 border-radius:4px;
 font-weight:bold;
}

h1{
position:relative;
bottom:-20px;
font-size:25px;
}


</style>
</head>
<body bgcolor="#f0f8ff">

	
<header><font color="white"><h1>Varsity E-Zone Tracker</h1></font></header>
<center></center>

<form name="f1" action="vet_syllabus_finds.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>Syllabus Information  </p></div></td>
</tr>

<tr>
<td>Reference Number:</td>
<td><select name="cmbref" id="txt" onchange="showsyllabus()">
<option value="null">--select--</option>
<%
doconnect();
try{
	stmtfillref=conn.createStatement();
	rsref=stmtfillref.executeQuery("select * from vet_tblsyllabus");
	while(rsref.next()){
		ref=rsref.getString("ref_no");
		%>
		<option value="<%=ref%>"> <%=ref%>  </option>
		
		<%
	}
}
catch(SQLException sqe){
	out.println("Error "+sqe);
}
%>

</select>


</td>
</tr>

<tr>
<td>Course Name:</td>
<td>
<select name="cmbcname" id="txt" onchange="showcourse()" >
<option value="Null"><center>-Select-</center></option>
<%
doconnect();
try{
	stmtfillcname=conn.createStatement();
	rscname=stmtfillcname.executeQuery("select * from vet_tblcourse");
	while(rscname.next()){
		cname=rscname.getString("c_name");
		%>
		<option value="<%=cname%>"> <%=cname%>  </option>
		
		<%
	}
}
catch(SQLException sqe){
	out.println("Error "+sqe);
}
%>
</select>
</td>
</tr>

<tr>
<td>Course Code:</td>
<td><input type="text" name="txtccod" id="txt"></td>
</tr>

<tr>
<td>Number Of Semester:</td>
<td><input type="text" name="txtnos" id="txt"></td>
</tr>


<tr>
<td>Semester:</td>
<td>
<select name="cmbsem" id="txt">
<option value="Null"><center>-Select-</center></option>

<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05 </option>
<option value="06">06</option>
<option value="07">07 </option>
<option value="08">08</option>


</select>
</td>
<tr>
<td>Paper Code:</td>
<td align="right"><input type="text" name="txtpcod" id="txt"></td>
</tr>


<tr>
<td>Paper Name:</td>
<td><input type="text" name="txtpname" id="txt"></td>
</tr>

<tr>
<td >Full Mark:</td>
<td ><input type="text" name="txtfm" id="txt"></td>
</tr>

<tr>
<td>Credit:</td>
<td><input type="text" name="txtcd" id="txt"></td>
</tr>


<tr>
<td align="center" colspan="4"><div class="bttn"><input type="submit" name="btnup" value="UPDATE" id="bt1">
                  &nbsp;&nbsp;&nbsp;<input type="submit" name="btndel" value="DELETE" id="bt2">&nbsp;&nbsp;&nbsp;
                    <input type="button" name="btnback" value="BACK" id="bt3" onclick="showprofile()" ></div></td>
</tr>

</table>
</form>
<footer> </footer>


</body>
</html>