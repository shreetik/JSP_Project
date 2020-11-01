	
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<%!
Connection conn;
Statement stmtfillnum,stmtfillarray;
ResultSet rsnum,rsarray;
String nameunivs[],namevcs[],sess[],locs[],citys[],states[],faxs[],emails[],webs[];
String num;
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
nameunivs=new String [30];
namevcs=new String [30];
sess=new String [30];
locs=new String [30];
citys=new String [30];
states=new String [30];
faxs=new String [30];
emails=new String [30];
webs=new String [30];



doconnect();
try{
	stmtfillarray=conn.createStatement();
	rsarray=stmtfillarray.executeQuery("select * from vet_tbluniv");
	i=0;
	while(rsarray.next()){
		 nameunivs[i]=rsarray.getString("univname");
		 namevcs[i]=rsarray.getString("univc");
		 sess[i]=rsarray.getString("unises");
		 locs[i]=rsarray.getString("uniloc");
		 citys[i]=rsarray.getString("unicity");
		 states[i]=rsarray.getString("unistate").trim();
		 faxs[i]=rsarray.getString("unifax");
		 emails[i]=rsarray.getString("uniemail");
		 webs[i]=rsarray.getString("uniweb");
		 i=i+1;
	}
}
catch(SQLException se){
	out.println("Error "+se);
}

%>


<html>
<head>
<title>University Profile</title>

<script language="javascript">
function showprofile(){
	window.location="vet_univc.jsp";
}
</script>
<script language="javascript">
var jnameunivs=new Array();
var jnamevcs=new Array();
var jsess=new Array();
var jlocs=new Array();
var jcitys=new Array();
var jstates=new Array();
var jfaxs=new Array();
var jemails=new Array();
var jwebs=new Array();
var j,k;	

function showdata(){
	j=0;
	
<%
i=0;
while(i < 30){
%>
 jnameunivs[j]= "<%=nameunivs[i]%>";
 jnamevcs[j]= "<%=namevcs[i]%>";		
 jsess[j]= "<%=sess[i]%>";
 jlocs[j]= "<%=locs[i]%>";
 jcitys[j]= "<%=citys[i]%>";
 jstates[j]= "<%=states[i]%>";
 jfaxs[j]= "<%=faxs[i]%>";
 jemails[j]= "<%=emails[i]%>";
 jwebs[j]=  "<%=webs[i]%>";
j=j+1;

<%
i=i+1;
	}
%>
  k=document.f1.cmbnum.selectedIndex;
  
  document.f1.txtuname.value=jnameunivs[k-1];
  document.f1.txtvc.value=jnamevcs[k-1];
  document.f1.txtseson.value=jsess[k-1];
  document.f1.txtloc.value=jlocs[k-1];
  document.f1.txtcity.value=jcitys[k-1];
  document.f1.cmbopt.value=jstates[k-1];
  document.f1.txtfax.value=jfaxs[k-1];
  document.f1.txtmail.value=jemails[k-1];
  document.f1.txtweb.value=jwebs[k-1];
	
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

<form name="f1" action="vet_univ_finds.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>University Profile  </p></div></td>
</tr>

<tr>
<td>Phone No:</td>
<td><select name="cmbnum" id="txt" onchange="showdata()">
<option value="null">--select--</option>
<%
doconnect();
try{
	stmtfillnum=conn.createStatement();
	rsnum=stmtfillnum.executeQuery("select * from vet_tbluniv");
	while(rsnum.next()){
		num=rsnum.getString("uniphone");
		%>
		<option value="<%=num%>"> <%=num%>  </option>
		
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
<td>Name Of University:</td>
<td><input type="text" name="txtuname" id="txt"></td>
</tr>

<tr>
<td>Name Of VC:</td>
<td><input type="text" name="txtvc" id="txt"></td>
<td align="right">Session:</td>
<td><input type="text" name="txtseson" id="txt"></td>
</tr>

<tr>
<td>Locality:</td>
<td><input type="text" name="txtloc" id="txt"></td>
</tr>

<tr>
<td>City:</td>
<td><input type="text" name="txtcity" id="txt"></td>
</tr>

<tr>
<td>State/U.Territory:</td>
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
<td align="right">FAX No:</td>
<td align="right"><input type="text" name="txtfax" id="txt"></td>
</tr>


<tr>
<td>Email-id:</td>
<td><input type="email" name="txtmail" id="txt"></td>
<td align="right">Website:</td>
<td align="right"><input type="url" name="txtweb" id="txt"></td>
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