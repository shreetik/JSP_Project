	
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
Connection conn;
Statement stmtfilldept,stmtfillsid,stmtfillarray;
ResultSet rsdept,rssid,rsarray;
String sname[],sex[],dob[],qual[],doj[],dept[],desi[],loc[],city[],state[],pin[],phone[],email[],uname[],pass[];
String cdept,sid;
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
sname=new String [30];
sex=new String [30];
dob=new String [30];
qual=new String [30];
doj=new String [30];
dept=new String [30];
desi=new String [30];
loc=new String [30];
city=new String [30];
state=new String [30];
pin=new String [30];
phone=new String [30];
email=new String [30];
uname=new String [30];
pass=new String [30];


doconnect();
try{
	stmtfillarray=conn.createStatement();
	rsarray=stmtfillarray.executeQuery("select * from vet_tblstaff");
	i=0;
	while(rsarray.next()){
		 sname[i]=rsarray.getString("staff_name");
		 sex[i]=rsarray.getString("sex").trim();
		 dob[i]=rsarray.getString("dob");
		 qual[i]=rsarray.getString("qual").trim();
		 doj[i]=rsarray.getString("doj");
		 dept[i]=rsarray.getString("dept").trim();
		 desi[i]=rsarray.getString("dsg").trim();
		 loc[i]=rsarray.getString("loc");
		 city[i]=rsarray.getString("city");
		 state[i]=rsarray.getString("state").trim();
		 pin[i]=rsarray.getString("pin");
		 phone[i]=rsarray.getString("ph_no");
		 email[i]=rsarray.getString("m_id");
		 uname[i]=rsarray.getString("u_name");
		 pass[i]=rsarray.getString("pass");
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>

<html>
<head><title>Staff Information</title>

<script language="javascript">
var jsname=new Array();
var jsex=new Array();
var jdob=new Array();
var jqual=new Array();
var jdoj=new Array();
var jdept=new Array();
var jdesi=new Array();
var jloc=new Array();
var jcity=new Array();
var jstate=new Array();
var jpin=new Array();
var jphone=new Array();
var jemail=new Array();
var juname=new Array();
var jpass=new Array();

var j,k;	

function showdata(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jsname[j]= "<%=sname[i]%>";
 jsex[j]= "<%=sex[i]%>";		
 jdob[j]= "<%=dob[i]%>";
 jqual[j]= "<%=qual[i]%>";
 jdoj[j]= "<%=doj[i]%>";
 jdept[j]= "<%=dept[i]%>";
 jdesi[j]= "<%=desi[i]%>";
 jloc[j]= "<%=loc[i]%>";
 jcity[j]= "<%=city[i]%>";
 jstate[j]= "<%=state[i]%>";
 jpin[j]= "<%=pin[i]%>";
 jphone[j]= "<%=phone[i]%>";
 jemail[j]= "<%=email[i]%>";
 juname[j]= "<%=uname[i]%>";
 jpass[j]= "<%=pass[i]%>";
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbstfid.selectedIndex;
  
  document.f1.txtsname.value=jsname[k-1];
  document.f1.cmbsex.value=jsex[k-1];
  document.f1.txtdob.value=jdob[k-1];
  document.f1.cmbqua.value=jqual[k-1];
  document.f1.txtjoin.value=jdoj[k-1];
  document.f1.cmbdpt.value=jdept[k-1];
  document.f1.cmbdsg.value=jdesi[k-1];
  document.f1.txtloc.value=jloc[k-1];
  document.f1.txtcity.value=jcity[k-1];
  document.f1.cmbopt.value=jstate[k-1];
  document.f1.txtpin.value=jpin[k-1];
  document.f1.txtph.value=jphone[k-1];
  document.f1.txtmail.value=jemail[k-1];
  document.f1.txtuser.value=juname[k-1];
  document.f1.txtpass.value=jpass[k-1];
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
 font-size:px;
}

h1{
position:relative;
bottom:-20px;
font-size:25px;
}


</style>

<script language="javascript">
function showfindpage(){
	window.location="vet_staffc.jsp";
}
</script>

</head>
<body bgcolor="#f0f8ff">

<header><font color="white"><h1>Varsity E-Zone Tracker</h1></font></header>
<center></center>

<form name="f1" action="vet_staff_finds.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>Staff Information</p></div></td>
</tr>


<tr>
<td>Staff ID:</td>
<td>
<select name="cmbstfid" id="txt" onchange="showdata()">
<option value="null">--select--</option>
<%
doconnect();
try{
	stmtfillsid=conn.createStatement();
	rssid=stmtfillsid.executeQuery("select * from vet_tblstaff");
	while(rssid.next()){
		sid=rssid.getString("staff_id");
		%>
		<option value="<%=sid%>"> <%=sid%>  </option>
		
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
<td>Qualification:</td>
<td>
<select name="cmbqua" id="txt">
<option value="Null"><center>-Select-</center></option>
<option value="Btech-Computer science">Btech-Computer science</option>
<option value="MSc-Chemistry">MSc-Chemistry</option>
<option value="MSc-Physics">MSc-Physics</option>
<option value="MSc-Math">MSc-Math</option>
<option value="MSc-IT">MSc-IT </option>
<option value="MSc-Computer science">MSc-Computer science</option>
<option value="BSc-Computer science">BSc-Computer science</option>
<option value="BSc-Chemistry">BSc-Chemistry</option>
<option value="BSc-Physics">BSc-Physics</option>
<option value="BSc-Math">BSc-Math</option>

</select>
</td>
</tr>

<tr>
<td>Date Of Join:</td>
<td><input type="date" name="txtjoin" id="txt"></td>

</tr>

<tr>
<td>Department:</td>
<td>
<select name="cmbdpt" id="txt">
<option value="Null"><center>-Select-</center></option>
<%
doconnect();
try{
	stmtfilldept=conn.createStatement();
	rsdept=stmtfilldept.executeQuery("select * from vet_tbldept");
	while(rsdept.next()){
		cdept=rsdept.getString("deptname");
		%>
		<option value="<%=cdept%>"> <%=cdept%>  </option>
		
		<%
	}
}
catch(SQLException sqe){
	out.println("Error "+sqe);
}
%>

</select>
</td>


<td>Designation:</td>
<td>
<select name="cmbdsg" id="txt">
<option value="Null"><center>-Select-</center></option>
<option value="H.O.D">H.O.D</option>
<option value="Reader">Reader</option>
<option value="Sr.Lecture">Sr.Lecture</option>
<option value="Jr.Lecture">Jr.Lecture</option>
<option value="Lab-Demonstrater">Lab-Demonstrater</option>
<option value="Librarian">Librarian</option>
<option value="Clerck">Clerck</option>
<option value="Principal">Vice-Principal</option>
<option value="Peon">Peon</option>

</select>
</td>

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
<td>user Name:</td>
<td><input type="text" name="txtuser" id="txt"></td>

<td>Password:</td>
<td><input type="password" name="txtpass" id="txt"></td>

</tr>


<tr>
<td align="center" colspan="4"><div class="bttn"><input type="submit" name="btnup" value="UPDATE" id="bt1">
                  &nbsp;&nbsp;&nbsp;<input type="submit" name="btndel" value="DELETE" id="bt2">&nbsp;&nbsp;&nbsp;
                    <input type="button" name="btnback" value="BACK" onclick="showfindpage()" id="bt3"></div></td>
</tr>

</table>
</form>
<footer> </footer>


</body>
</html>