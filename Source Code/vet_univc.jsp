	
<%@ page language="java" contentType="text/html" %>

<html>
<head>
<title>University Profile</title>


<script language="javascript">
function showfindpage(){
	window.location="vet_univ_findc.jsp";
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
font-weight:;
}



</style>
</head>
<body bgcolor="#f0f8ff">

<header><font color="white"><h1>Varsity E-Zone Tracker</h1></font></header>
<center></center>

<form name="f1" action="vet_univs.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>University Profile</p></div></td>
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
<select name="txtopt" id="txt">
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
</tr>

<tr>
<td>Phone No:</td>
<td><input type="text" name="txtpho" id="txt"></td>
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
<td align="center" colspan="4"><div class="bttn"><input type="submit" name="btnsub" value="SUBMIT" id="bt1">
                  &nbsp;&nbsp;&nbsp;<input type="button" name="btnfind" value="FIND" onclick="showfindpage()" id="bt2">&nbsp;&nbsp;&nbsp;
                    <input type="reset" name="btnres" value="RESET" id="bt3"></div></td>
</tr>

</table>
</form>
<footer> </footer>


</body>
</html>