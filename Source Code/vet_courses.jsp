<%@ page language="java" import="java.sql.*" contentType="text/html" %>
<html>
<head>
<title>vet_profile_submit</title>

<style type="text/css">
*{
margin:0px;
padding:0px;
font-family:arial;
}
img{
	width:50px;
	padding:50px;
}


.cc{
	background-color:#355c7d;
	text-align:center;
	width:400px;
	padding:50px;
	position:absolute;
	top:50%;
	left:50%;
	transform:translateX(-50%) translateY(-50%);
}
h1{
	color:white;
	font-size:30px;
	font-weight:300;
}
#btn{
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
</style>

<script language="javascript">
function showprofil(){
	window.location="vet_coursec.jsp";
}
</script>

</head>
<body bgcolor="#f0f8ff">
<%!
Connection conn;
Statement stmtsave;
String ccode,cname,nosem,cfee;
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
		System.out.println("Unable to connect with Database ");
	}
}

	

%>

<%
  ccode=request.getParameter("txtcod");
  cname=request.getParameter("txtcname");
  nosem=request.getParameter("cmbopt");
  cfee=request.getParameter("txtcfee");
  
  doconnect();
  
  try{
	  stmtsave = conn.createStatement();
	  stmtsave.executeUpdate( "insert into vet_tblcourse values( '"+ccode+"','"+cname+"','"+nosem+"','"+cfee+"')" );
	%>
	
	<div class="cc">
	<img src="tick.png">
	<h1>Your data saved successfully</h1>
	<br>
	<br>
	<input type="button" value="BACK" id="btn" onclick="showprofil()">
	</div>
	
	
	
	<%
  }
  catch(SQLException se){
	  out.println("Server Error try again later ");
  }
  
%>

</body>

</html>