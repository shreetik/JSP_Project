	
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
Connection conn;
Statement stmtfillnum;
ResultSet rscode;
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


<html>
<head>
<title>Student Attendance Detail Report</title>

<script language="javascript">

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

<form name="f1" action="vet_rptStuAttends.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>Student Attendance Information [ Any Roll No. ]  </p></div></td>
</tr>

<tr>
<td align="right">Roll No.:</td>
<td><select name="cmbdname" id="txt">
<option value="null">--select--</option>
<%
doconnect();
try{
	stmtfillnum=conn.createStatement();
	rscode=stmtfillnum.executeQuery("select * from vet_tblstuAttend");
	while(rscode.next()){
		code=rscode.getString("roll_no");
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
<td align="center" colspan="4"><div class="bttn">
  <input type="submit" name="btnShow" value="SHOW" id="bt1">&nbsp;&nbsp;&nbsp;
  <input type="Reset" name="btnRes" value="RESET" id="bt2">&nbsp;&nbsp;&nbsp;
  </div></td>
</tr>

</table>
</form>
<footer> </footer>


</body>
</html>