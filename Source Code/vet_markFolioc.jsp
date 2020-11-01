	
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
Connection conn;
Statement stmtfillroll,stmtfillarray,stmtfillpcod,stmtfillparray;
ResultSet rsroll,rsarray,rspcod,rsparray;
String names[],sexs[],courss[],credits[],pnames[],fmarks[];
String croll,pcod;

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
courss=new String [30];



doconnect();
try{
	stmtfillarray=conn.createStatement();
	rsarray=stmtfillarray.executeQuery("select * from vet_tblstuadm");
	i=0;
	while(rsarray.next()){
		 names[i]=rsarray.getString("full_name");
		 sexs[i]=rsarray.getString("sex").trim();
		 courss[i]=rsarray.getString("course");
		 
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>

<%
pnames=new String [30];
fmarks=new String [30];
credits=new String [30];





doconnect();
try{
	stmtfillparray=conn.createStatement();
	rsparray=stmtfillparray.executeQuery("select * from vet_tblsyllabus");
	i=0;
	while(rsparray.next()){
		  pnames[i]=rsparray.getString("p_name");
		 fmarks[i]=rsparray.getString("full_mark");
		 credits[i]=rsparray.getString("credit");
		
		 
		 
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>


<html>
<head>
<title>Mark Folio Information</title>


<script language="javascript">
function shwfindpage(){
	window.location="vet_markFolio_findc.jsp";
}
</script>

<script language="javascript">
var jnames=new Array();
var jsexs=new Array();
var jcourss=new Array();

var j,k;	

function showdata(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jnames[j]= "<%=names[i]%>";
 jsexs[j]= "<%=sexs[i]%>";		
  jcourss[j]= "<%=courss[i]%>";
 
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbroll.selectedIndex;
  
  document.f1.txtname.value=jnames[k-1];
  document.f1.cmbsex.value=jsexs[k-1];
  document.f1.txtcrs.value=jcourss[k-1];
  
}

</script>

<script language="javascript">
var jpnames=new Array();
var jfmarks=new Array();
var jcredits=new Array();

var j,k;	

function showpcod(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
  jpnames[j]= "<%=pnames[i]%>";	
 jfmarks[j]= "<%=fmarks[i]%>";
 jcredits[j]= "<%=credits[i]%>";
	
 
 
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbcod.selectedIndex;
  
  document.f1.txtpname.value=jpnames[k-1];
 document.f1.txtfm.value=jfmarks[k-1];
 document.f1.txtcd.value=jcredits[k-1];
 
  
  
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

<form name="f1" action="vet_markFolios.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>Mark Folio Information</p></div></td>
</tr>


<tr>
<td>Reference Number:</td>
<td><input type="text" name="txtref" id="txt"></td>
<td>Date:</td>
<td><input type="date" name="txtdate" id="txt"></td>
</tr>

<tr>
<td>Roll No:</td>
<td><select name="cmbroll" id="txt" onchange="showdata()">
<option value="Null"><center>-Select-</center></option>
<%
doconnect();
try{
	stmtfillroll=conn.createStatement();
	rsroll=stmtfillroll.executeQuery("select * from vet_tblstuadm");
	while(rsroll.next()){
		croll=rsroll.getString("roll_no");
		%>
		<option value="<%=croll%>"> <%=croll%>  </option>
		
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
<td>Name:</td>
<td><input type="text" name="txtname" id="txt"></td>
<td>Sex:</td>
<td><select name="cmbsex" id="txt">
<option value="Null"><center>-Select-</center></option>
<option value="Male">Male</option>
<option value="Female">Female</option>
<option value="Others">Others</option></td>

</tr>

<tr>
<td>Course:</td>
<td><input type="text" name="txtcrs" id="txt"></td>
</tr>

<tr>
<td>Paper Code:</td>
<td>
<select name="cmbcod" id="txt" onchange="showpcod()">
<option value="Null"><center>-Select-</center></option>
<%
doconnect();
try{
	stmtfillpcod=conn.createStatement();
	rspcod=stmtfillpcod.executeQuery("select * from vet_tblsyllabus");
	while(rspcod.next()){
		pcod=rspcod.getString("p_code");
		%>
		<option value="<%=pcod%>"> <%=pcod%>  </option>
		
		<%
	}
}
catch(SQLException sqe){
	out.println("Error "+sqe);
}
%>

</select>

</td>
<td>Credit:</td>
<td><input type="text" name="txtcd" id="txt"></td>
</tr>

<tr>
<td>Paper Name:</td>
<td><input type="text" name="txtpname" id="txt"></td>
<td>Semester:</td>
<td><select name="cmbsem" id="txt">
<option value="Null"><center>-Select-</center></option>
<option value="01">01</option>
<option value="02">02</option>
<option value="03">03</option>
<option value="04">04</option>
<option value="05">05 </option>
<option value="06">06</option>
<option value="07">07 </option>
<option value="08">08</option></td>
</tr>



<tr>
<td>Full Mark:</td>
<td><input type="text" name="txtfm" id="txt"></td>
<td>Mark Obtained:</td>
<td><input type="text" name="txtmarkob" id="txt"></td>
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