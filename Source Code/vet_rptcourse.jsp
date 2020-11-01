<%@page language="java" import="java.sql.*"%>

<%!
		   Connection conn;
		   Statement stmtView;
		   ResultSet rs1;
		   String ccod,cname,sem,cfee;
		   int slno;
		  
		 

%>
<html>
	<head>
		<title>Course Informatoin Report</title>
	</head>
	<script language="javascript">
		function gohome(){
				window.close();
				}
	</script>
	<body>
		
			  <center><font color="red" size="5" face="copperplate gothic"><b>Course Informatoin</b></font></center>
			   <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>Odisha University Of Engg. & Technology</b></font><br>
			  <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>CDA-Sec-10</b></font><br>
			  <font color1="#348017" size="3" face1="Lucida Calligraphy"><b>Cuttack, Odisha</b></font><br>
			  <table width="100%">
				<tr bgcolor="#3B9C9C" height="30">
					<td><font color="white"><center>SL.NO.</center></font></td>
					<td><font color="white"><center>Course Code</center></font></td>
					<td><font color="white"><center>Course Name</center></font></td>
					<td><font color="white"><center>Semester</center></font></td>
					<td><font color="white"><center>Course Fee</center></font></td>
				</tr>
			<%
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
			 
			 
			 try{
				stmtView=conn.createStatement();
				rs1=stmtView.executeQuery("Select * from vet_tblcourse");
				
				
			    slno=1;
			    while(rs1.next()){
					ccod=rs1.getString("c_code");
					cname=rs1.getString("c_name");
					sem=rs1.getString("no_of_sem");
					cfee=rs1.getString("c_fee");
					if(slno%2==0)
					out.print("<tr bgcolor=\"#77BFC7\">");
					else
					out.print("<tr bgcolor=\"#E5E4E2\">");
			%>
					<td><%=slno%></td>
					<td><%=ccod%></td>
					<td><%=cname%></td>
					<td><%=sem%></td>
					<td><%=cfee%></td>
				</tr>
			<%
				slno=slno+1;
				}
			 }
				catch(SQLException sqe){
	out.println("Error "+sqe);
				}
			%>
			</table>
		</body>
	</html>