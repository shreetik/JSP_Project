	
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
Connection conn;
Statement stmtfillid,stmtfillarray,stmtfillref,stmtrefa;
ResultSet rsid,rsarray,rsfillref,rsrefa;
String names[],sexs[],depts[],dat[],sid[],sname[],sex[],dept[],sts[];
String cid,cref;

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
dat=new String [30];
sid=new String [30];
sname=new String [30];
sex=new String [30];
dept=new String [30];
sts=new String [30];


doconnect();
try{
	stmtrefa=conn.createStatement();
	rsrefa=stmtrefa.executeQuery("select * from vet_tblAttend");
	i=0;
	while(rsrefa.next()){
		 dat[i]=rsrefa.getString("date").trim();
		 sid[i]=rsrefa.getString("staff_id").trim();
		 sname[i]=rsrefa.getString("staff_name");
		 sex[i]=rsrefa.getString("sex").trim();
		 dept[i]=rsrefa.getString("dept");
		 sts[i]=rsrefa.getString("status").trim();
		 
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>



<%
names=new String [30];
sexs=new String [30];
depts=new String [30];



doconnect();
try{
	stmtfillarray=conn.createStatement();
	rsarray=stmtfillarray.executeQuery("select * from vet_tblstaff");
	i=0;
	while(rsarray.next()){
		 names[i]=rsarray.getString("staff_name");
		 sexs[i]=rsarray.getString("sex").trim();
		 depts[i]=rsarray.getString("dept");
		 
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>




<html>
<head>
<title>Staff Attendance</title>


<script language="javascript">
function showstu(){
	window.location="vet_staffAttendc.jsp";
}
</script>

<script language="javascript">
var jdat=new Array();
var jsid=new Array();
var jsname=new Array();
var jsex=new Array();
var jdept=new Array();
var jsts=new Array();


var j,k;	

function showref(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jdat[j]= "<%=dat[i]%>";
 jsid[j]= "<%=sid[i]%>";		
  jsname[j]= "<%=sname[i]%>";
  jsex[j]= "<%=sex[i]%>";
 jdept[j]= "<%=dept[i]%>";		
  jsts[j]= "<%=sts[i]%>";
  
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbref.selectedIndex;
  
  document.f1.txtdate.value=jdat[k-1];
  document.f1.cmbid.value=jsid[k-1];
  document.f1.txtsname.value=jsname[k-1];
  document.f1.cmbsex.value=jsex[k-1];
  document.f1.txtdpt.value=jdept[k-1];
  document.f1.cmbsts.value=jsts[k-1];
}

</script>


<script language="javascript">
var jnames=new Array();
var jsexs=new Array();
var jdepts=new Array();

var j,k;	

function showdata(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jnames[j]= "<%=names[i]%>";
 jsexs[j]= "<%=sexs[i]%>";		
  jdepts[j]= "<%=depts[i]%>";
 
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbid.selectedIndex;
  
  document.f1.txtsname.value=jnames[k-1];
  document.f1.cmbsex.value=jsexs[k-1];
  document.f1.txtdpt.value=jdepts[k-1];
  
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

<form name="f1" action="vet_staffAttend_finds.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>Staff Attendance</p></div></td>
</tr>


<tr>
<td>Reference Number:</td>
<td><select name="cmbref" id="txt" onchange="showref()">
<option value="Null"><center>-Select-</center></option>
<%
doconnect();
try{
	stmtfillref=conn.createStatement();
	rsfillref=stmtfillref.executeQuery("select * from vet_tblAttend");
	while(rsfillref.next()){
		cref=rsfillref.getString("ref_no");
		%>
		<option value="<%=cref%>"> <%=cref%>  </option>
		
		<%
	}
}
catch(SQLException sqe){
	out.println("Error "+sqe);
}
%>

</select></td>
<td>Date:</td>
<td><input type="date" name="txtdate" id="txt"></td>
</tr>

<tr>
<td>Staff ID:</td>
<td><select name="cmbid" id="txt" onchange="showdata()">
<option value="Null"><center>-Select-</center></option>
<%
doconnect();
try{
	stmtfillid=conn.createStatement();
	rsid=stmtfillid.executeQuery("select * from vet_tblstaff");
	while(rsid.next()){
		cid=rsid.getString("staff_id");
		%>
		<option value="<%=cid%>"> <%=cid%>  </option>
		
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
<td>Staff Name:</td>
<td><input type="text" name="txtsname" id="txt"></td>
<td>Sex:</td>
<td><select name="cmbsex" id="txt">
<option value="Null"><center>-Select-</center></option>
<option value="Male">Male</option>
<option value="Female">Female</option>
<option value="Others">Others</option></td>

</tr>

<tr>
<td>Department:</td>
<td><input type="text" name="txtdpt" id="txt"></td>
</tr>

<tr>
<td>Status:</td>
<td><select name="cmbsts" id="txt">
<option value="Null"><center>-Select-</center></option>
<option value="Present">Present</option>
<option value="Absent">Absent</option>
</td>
</tr>

</tr>


<tr>
<td align="center" colspan="4"><div class="bttn"><input type="submit" name="btnup" value="UPDATE" id="bt1">
                  &nbsp;&nbsp;&nbsp;<input type="submit" name="btndel" value="DELETE"  id="bt2">&nbsp;&nbsp;&nbsp;
                    <input type="button" name="btnback" value="BACK" id="bt3" onclick="showstu()" ></div></td>
</tr>

</table>
</form>
<footer> </footer>


</body>
</html>