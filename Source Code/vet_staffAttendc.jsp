	
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
Connection conn;
Statement stmtfillid,stmtfillarray;
ResultSet rsid,rsarray;
String names[],sexs[],depts[];
String cid;

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
function shwfindpage(){
	window.location="vet_staffAttend_findc.jsp";
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

<form name="f1" action="vet_staffAttends.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>Staff Attendance</p></div></td>
</tr>


<tr>
<td>Reference Number:</td>
<td><input type="text" name="txtref" id="txt"></td>
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
<td align="center" colspan="4"><div class="bttn"><input type="submit" name="btnsub" value="SUBMIT" id="bt1">
                  &nbsp;&nbsp;&nbsp;<input type="button" name="btnfind" value="FIND" onclick="shwfindpage()" id="bt2">&nbsp;&nbsp;&nbsp;
                    <input type="reset" name="btnres" value="RESET" id="bt3"></div></td>
</tr>

</table>
</form>
<footer> </footer>


</body>
</html>