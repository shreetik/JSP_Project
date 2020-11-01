	
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
Connection conn;
Statement stmtfillcourse,stmtfillarray,stmtfillstu,stmtfillapno;
ResultSet rscourse,rsarray,rsstu,rsapno;
String cname,cfee[];
String apno,dat[],regno[],admd[],fulln[],sex[],dob[],fname[],mname[],loc[],city[],state[],pin[],phone[],mail[],course[],cofee[],fpaid[],roll[],photo[];
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
regno=new String [30];
admd=new String [30];
fulln=new String [30];
sex=new String [30];
dob=new String [30];
fname=new String [30];
mname=new String [30];
loc=new String [30];
city=new String [30];
state=new String [30];
pin=new String [30];
phone=new String [30];
mail=new String [30];
course=new String [30];
cofee=new String [30];
fpaid=new String [30];
roll=new String [30];
photo=new String [30];




doconnect();
try{
	stmtfillstu=conn.createStatement();
	rsstu=stmtfillstu.executeQuery("select * from vet_tblstuadm");
	i=0;
	while(rsstu.next()){
		 dat[i]=rsstu.getString("date");
		 regno[i]=rsstu.getString("regi_no");
		 admd[i]=rsstu.getString("adm_date");
		 fulln[i]=rsstu.getString("full_name");
	     sex[i]=rsstu.getString("sex").trim();
	     dob[i]=rsstu.getString("dob");
	     fname[i]=rsstu.getString("f_name");
	     mname[i]=rsstu.getString("m_name");
		 loc[i]=rsstu.getString("loc");
	     city[i]=rsstu.getString("city");
		 state[i]=rsstu.getString("state");
		 pin[i]=rsstu.getString("pin");
		 phone[i]=rsstu.getString("ph_no");
		 mail[i]=rsstu.getString("email");
		 course[i]=rsstu.getString("course").trim();
	     cofee[i]=rsstu.getString("c_fee");
		 fpaid[i]=rsstu.getString("fee_paid");
		 roll[i]=rsstu.getString("roll_no");
		 photo[i]=rsstu.getString("photo");
		
		 
		 
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>




<%
cfee=new String [30];





doconnect();
try{
	stmtfillarray=conn.createStatement();
	rsarray=stmtfillarray.executeQuery("select * from vet_tblcourse");
	i=0;
	while(rsarray.next()){
		 cfee[i]=rsarray.getString("c_fee");
		
		 
		 
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>
<html>
<head><title>Student Admission</title>
<script language="javascript">
function showphoto(){
	
 picture=document.f1.photo.value;
  
 picturefinal=picture.substr(picture.lastIndexOf("\\")+1);
 
document.f1.imgphoto.src=picturefinal;	
	
}
</script>


<script language="javascript">
var jdat=new Array();
var jregno=new Array();
var jadmd=new Array();
var jfulln=new Array();
var jsex=new Array();
var jdob=new Array();
var jfname=new Array();
var jmname=new Array();
var jloc=new Array();
var jcity=new Array();
var jstate=new Array();
var jpin=new Array();
var jphone=new Array();
var jmail=new Array();
var jcourse=new Array();
var jcofee=new Array();
var jfpaid=new Array();
var jroll=new Array();
var jphoto=new Array();



var j,k;	

function showstudata(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jdat[j]= "<%=dat[i]%>";
jregno[j]= "<%=regno[i]%>";
jadmd[j]= "<%=admd[i]%>";
jfulln[j]= "<%=fulln[i]%>";
jsex[j]= "<%=sex[i]%>";
jdob[j]= "<%=dob[i]%>";
jfname[j]= "<%=fname[i]%>";
jmname[j]= "<%=mname[i]%>";
jloc[j]= "<%=loc[i]%>";
jcity[j]= "<%=city[i]%>";
jstate[j]= "<%=state[i]%>";
jpin[j]= "<%=pin[i]%>";
jphone[j]= "<%=phone[i]%>";
jmail[j]= "<%=mail[i]%>";
jcourse[j]= "<%=course[i]%>";
jcofee[j]= "<%=cofee[i]%>";
jfpaid[j]= "<%=fpaid[i]%>";
jroll[j]= "<%=roll[i]%>";
jphoto[j]= "<%=photo[i]%>";	
 
 
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbappn.selectedIndex;
  
  document.f1.txtdate.value=jdat[k-1];
 document.f1.txtregn.value=jregno[k-1];
  document.f1.txtadate.value=jadmd[k-1];
   document.f1.txtfulname.value=jfulln[k-1];
    document.f1.cmbsex.value=jsex[k-1];
	 document.f1.txtdob.value=jdob[k-1];
	  document.f1.txtfname.value=jfname[k-1];
	   document.f1.txtmname.value=jmname[k-1];
	    document.f1.txtloc.value=jloc[k-1];
		 document.f1.txtcity.value=jcity[k-1];
		  document.f1.cmbopt.value=jstate[k-1];
		   document.f1.txtpin.value=jpin[k-1];
		    document.f1.txtph.value=jphone[k-1];
			 document.f1.txtmail.value=jmail[k-1];
			  document.f1.cmbcrs.value=jcourse[k-1];
			   document.f1.txtcfee.value=jcofee[k-1];
			    document.f1.txtfpaid.value=jfpaid[k-1];
				 document.f1.txtroll.value=jroll[k-1];
				  document.f1.imgphoto.src=jphoto[k-1];
  
  
}

</script>



<script language="javascript">
var jcfee=new Array();



var j,k;	

function showdata(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jcfee[j]= "<%=cfee[i]%>";
	
 
 
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbcrs.selectedIndex;
  
  document.f1.txtcfee.value=jcfee[k-1];

  
  
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
padding:10px;
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
 font-size:px;
}

h1{
position:relative;
bottom:-20px;
font-size:25px;
}


</style>
<script language="javascript">
function showstu(){
	window.location="vet_stuadmc.jsp";
}
</script>


</head>
<body bgcolor="#f0f8ff">

<header><font color="white"><h1>Varsity E-Zone Tracker</h1></font></header>
<center></center>

<form name="f1" action="vet_stuadm_finds.jsp" method="get">
<table border="0" cellspacing="8" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>Student Admission</p></div></td>
</tr>


<tr>
<td>Application Number:</td>
<td>
<select name="cmbappn" id="txt" onchange="showstudata()">
<option value="Null"><center>-Select-</center></option>
<%
doconnect();
try{
	stmtfillapno=conn.createStatement();
	rsapno=stmtfillapno.executeQuery("select * from vet_tblstuadm");
	while(rsapno.next()){
		apno=rsapno.getString("app_no");
		%>
		<option value="<%=apno%>"> <%=apno%>  </option>
		
		<%
	}
}
catch(SQLException sqe){
	out.println("Error "+sqe);
}
%>


</select>
</td>
<td>Date:</td>
<td><input type="date" name="txtdate" id="txt"></td>
</tr>

<tr>
<td>Registration Number:</td>
<td><input type="text" name="txtregn" id="txt"></td>
<td>Admission Date:</td>
<td><input type="date" name="txtadate" id="txt"></td>
</tr>
<tr>
<td>Full Name:</td>
<td><input type="text" name="txtfulname" id="txt"></td>
</tr>

<tr>
<td>Sex:</td>
<td><select name="cmbsex" id="txt">
<option value="Null"><center>-Select-</center></option>
<option value="Male">Male</option>
<option value="Female">Female</option>
<option value="Others">Others</option>
</select>
</td>

<td>Date Of Birth:</td>
<td><input type="date" name="txtdob" id="txt"></td>
</tr>

<tr>
<td>Father Name:</td>
<td><input type="text" name="txtfname" id="txt"></td>
<td>Mother Name:</td>
<td><input type="text" name="txtmname" id="txt"></td>
</tr>

<tr>
<td>Locality:</td>
<td><input type="text" name="txtloc" id="txt"></td>


<td>City:</td>
<td><input type="text" name="txtcity" id="txt"></td>

</tr>

<tr>
<td>State:</td>
<td>
<select name="cmbopt" id="txt">
<option value="Null"><center>-Select-</center></option>
<option value="Andhra Pradesh">Andhra Pradesh</option>
<option value="Arunachal Pradesh">Arunachal Pradesh</option>
<option value="Assam">Assam	</option>
<option value="Bihar">Bihar</option>
<option value="Chhattisgarh">Chhattisgarh </option>
<option value="Goa">Goa</option>
<option value="Gujarat">Gujarat </option>
<option value="Haryana">Haryana</option>
<option value="Himachal Pradesh">Himachal Pradesh</option>
<option value="Jammu and Kashmir">Jammu and Kashmir</option>
<option value="Karnataka">Karnataka</option>
<option value="Kerala">Kerala</option>
<option value="Madhya Pradesh">Madhya Pradesh</option>
<option value="Maharashtra">Maharashtra</option>
<option value="Manipur">Manipur</option>
<option value="Meghalaya">Meghalaya</option>
<option value="Mizoram">Mizoram </option>
<option value="Nagaland">Nagaland</option>
<option value="Orissa">Orissa </option>
<option value="Punjab">Punjab</option>
<option value="Rajasthan">Rajasthan</option>
<option value="Sikkim">Sikkim</option>
<option value="Tamil Nadu">Tamil Nadu</option>
<option value="Tripura">Tripura</option>
<option value="Uttar Pradesh">Uttar Pradesh</option>
<option value="West Bengal">West Bengal </option>
<option value="Chhattisgarh">Chhattisgarh </option>
<option value="Uttarakhand">Uttarakhand </option>
<option value="Jharkhand">Jharkhand </option>
<option value="Telangana">Telangana </option>
</select>
</td>

<td>Pin:</td>
<td><input type="text" name="txtpin" id="txt"></td>

</tr>

<tr>
<td>Phone No:</td>
<td><input type="text" name="txtph" id="txt"></td>

<td>E-mailid:</td>
<td><input type="text" name="txtmail" id="txt"></td>

</tr>

<tr>
<td>Course:</td>
<td>
<select name="cmbcrs" id="txt" onchange="showdata()">
<option value="Null"><center>-Select-</center></option>
<%
doconnect();
try{
	stmtfillcourse=conn.createStatement();
	rscourse=stmtfillcourse.executeQuery("select * from vet_tblcourse");
	while(rscourse.next()){
		cname=rscourse.getString("c_name");
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
<td>Course Fee:</td>
<td><input type="text" name="txtcfee" id="txt"></td>

<td>Fee Paid:</td>
<td><input type="text" name="txtfpaid" id="txt"></td>

</tr>
<tr>
<td>Roll No:</td>
<td><input type="text" name="txtroll" id="txt"></td>
<td> </td>
<td align="center" rowspan="2"><img src="preview.png" name="imgphoto" height="75" width="75"></td>
</tr>

<tr>
<td>Photo:</td>
<td><input type="file" name="photo" id="txt" onchange="showphoto()"></td>



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