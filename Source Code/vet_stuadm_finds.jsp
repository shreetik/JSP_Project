<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<head>
<title>finds</title>
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
function showpofile(){
	window.location="vet_stuadm_findc.jsp";
}
</script>





</head>
<body bgcolor="#f0f8ff">
<%!
Connection conn;
Statement stmtupdate,stmtdelete;
String appno,dat,regno,admdate,fulname,sex,dob,fname,mname,loc,city,state,pin,phone,email,course,cfee,feepaid,rolln,photo,btnup,btndel;


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
appno=request.getParameter("cmbappn");
  dat=request.getParameter("txtdate");
  regno=request.getParameter("txtregn");
  admdate=request.getParameter("txtadate");
  fulname=request.getParameter("txtfulname");
  sex=request.getParameter("cmbsex");
  dob=request.getParameter("txtdob");
  fname=request.getParameter("txtfname");
  mname=request.getParameter("txtmname");
  loc=request.getParameter("txtloc");
  city=request.getParameter("txtcity");
  state=request.getParameter("cmbopt");
  pin=request.getParameter("txtpin");
  phone=request.getParameter("txtph");
  email=request.getParameter("txtmail");
  course=request.getParameter("cmbcrs");
  cfee=request.getParameter("txtcfee");
  feepaid=request.getParameter("txtfpaid");
  rolln=request.getParameter("txtroll");
  photo=request.getParameter("photo");
btnup=request.getParameter("btnup");
btndel=request.getParameter("btndel");
%>

<%

   doconnect();

  if(btnup!=null){
  try{
	  stmtupdate=conn.createStatement();
	  stmtupdate.executeUpdate("update vet_tblstuadm set date='"+dat+"',regi_no='"+regno+"',adm_date='"+admdate+"',full_name='"+fulname+"',sex='"+sex+"',dob='"+dob+"',f_name='"+fname+"',m_name='"+mname+"',loc='"+loc+"',city='"+city+"',state='"+state+"',pin='"+pin+"',ph_no='"+phone+"',email='"+email+"',course='"+course+"',c_fee='"+cfee+"',fee_paid='"+feepaid+"',roll_no='"+rolln+"',photo='"+photo+"' where app_no='"+appno+"'  ");
	  %>
	 <div class="cc">
	 <img src="tick.png">
	 <h1> Your data updated successfully</h1>
	 <br>
	 <br>
	  <input type="button" value="back" id="btn" onclick="showpofile()">
	  </div>
	  
	  <%
  }
  catch(SQLException se){
	  out.println("Unable to update ");
  }
  }
else if(btndel!=null){
	
	  try{
	  stmtdelete=conn.createStatement();
	  stmtdelete.executeUpdate("delete from vet_tblstuadm where app_no='"+appno+"'  ");
	  %>
	  <div class="cc">
	  <img src="delete.png">
	  <h1>Your data deleted successfully</h1>
	 <br>
	 <br>
	  <input type="button" value="BACK" id="btn" onclick="showpofile()">
	  </div>
	  <%
  }
  catch(SQLException se){
	  out.println("Unable to delete ");
  }
  }
	%>  

</body>
</html>


































