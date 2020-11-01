	
<%@ page language="java" contentType="text/html" %>

<html>
<head>
<title>Department Profile</title>


<script language="javascript">
function showpage(){
	window.location="vet_dept_findc.jsp";
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

<form name="f1" action="vet_depts.jsp" method="get">
<table border="0" cellspacing="15" id="nav">
<tr>
<td align="center" colspan="4"><div class="uni"><p>Department Profile</p></div></td>
</tr>


<tr>
<td>Department Code:</td>
<td><input type="text" name="txtcode" id="txt"></td>
</tr>

<tr>
<td>Department Name:</td>
<td><input type="text" name="txtdpt" id="txt"></td>

</tr>

<tr>
<td>Name of HOD:</td>
<td><input type="text" name="txthod" id="txt"></td>
</tr>



<tr>
<td align="center" colspan="4"><div class="bttn"><input type="submit" name="btnsub" value="SUBMIT" id="bt1">
                  &nbsp;&nbsp;&nbsp;<input type="button" name="btnfind" value="FIND" onclick="showpage()" id="bt2">&nbsp;&nbsp;&nbsp;
                    <input type="reset" name="btnres" value="RESET" id="bt3"></div></td>
</tr>

</table>
</form>
<footer> </footer>


</body>
</html>