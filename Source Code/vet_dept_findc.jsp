	
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
Connection conn;
Statement stmtfillnum,stmtfillarray;
ResultSet rscode,rsarray;
String depts[],hods[];
String code;
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
depts=new String [30];
hods=new String [30];




doconnect();
try{
	stmtfillarray=conn.createStatement();
	rsarray=stmtfillarray.executeQuery("select * from vet_tbldept");
	i=0;
	while(rsarray.next()){
		 depts[i]=rsarray.getString("deptname");
		 hods[i]=rsarray.getString("depthod");
		 
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>


<html>
<head>
<title>Department Profile</title>

<script language="javascript">
function showprofile(){
	window.location="vet_deptc.jsp";
}
</script>
<script language="javascript">
var jdepts=new Array();
var jhods=new Array();

var j,k;	

function showdata(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jdepts[j]= "<%=depts[i]%>";
 jhods[j]= "<%=hods[i]%>";		
 
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbcode.selectedIndex;
  
  document.f1.txtdpt.value=jdepts[k-1];
  document.f1.txthod.value=jhods[k-1];
  
	
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

<form name="f1" action="vet_dept_finds.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>Department Profile  </p></div></td>
</tr>

<tr>
<td>Department Code:</td>
<td><select name="cmbcode" id="txt" onchange="showdata()">
<option value="null">--select--</option>
<%
doconnect();
try{
	stmtfillnum=conn.createStatement();
	rscode=stmtfillnum.executeQuery("select * from vet_tbldept");
	while(rscode.next()){
		code=rscode.getString("deptcode");
		%>
		<option value="<%=code%>"> <%=code%>  </option>
		
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
<td>Department Name:</td>
<td><input type="text" name="txtdpt" id="txt"></td>
</tr>

<tr>
<td>Name of HOD:</td>
<td><input type="text" name="txthod" id="txt"></td>






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