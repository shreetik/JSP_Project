<%@page language="java" import="java.sql.*"%>

<%!
		   Connection conn;
		   Statement stmtView;
		   ResultSet rs1;
		   String slip,datc,ref,dat,roll,name,sex,course,sem,warf,action;
		   int slno;
		  
		 

%>
<html>
	<head>
		<title>Disciplinary Action Report</title>
	</head>
	<script language="javascript">
		function gohome(){
				window.close();
				}
	</script>
	<body>
		
			  <center><font color="red" size="5" face="copperplate gothic"><b>Disciplinary Action</b></font></center>
			   <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>Odisha University Of Engg. & Technology</b></font><br>
			  <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>CDA-Sec-10</b></font><br>
			  <font color1="#348017" size="3" face1="Lucida Calligraphy"><b>Cuttack, Odisha</b></font><br>
			  <table width="100%">
				<tr bgcolor="#3B9C9C" height="30">
					<td><font color="white"><center>SL.NO.</center></font></td>
					<td><font color="white"><center>Slip No.</center></font></td>
					<td><font color="white"><center>Date.</center></font></td>
					<td><font color="white"><center>Reference No.</center></font></td>
					<td><font color="white"><center>Date</center></font></td>
					<td><font color="white"><center>Roll No.</center></font></td>
					<td><font color="white"><center>Name</center></font></td>
					<td><font color="white"><center>Sex</center></font></td>
					<td><font color="white"><center>Course</center></font></td>
					<td><font color="white"><center>Semester</center></font></td>
					<td><font color="white"><center>Warning For</center></font></td>
					<td><font color="white"><center>Disciplinary Action</center></font></td>
					
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
				rs1=stmtView.executeQuery("Select * from vet_tbldisaction");
				
				
			    slno=1;
			    while(rs1.next()){
					slip=rs1.getString("slip_no");
					datc=rs1.getString("date_c");
					ref=rs1.getString("ref_no");
					dat=rs1.getString("date");
					roll=rs1.getString("roll_no");
					name=rs1.getString("name");
					sex=rs1.getString("sex");
					course=rs1.getString("course");
					sem=rs1.getString("semester");
					warf=rs1.getString("warning_for");
					action=rs1.getString("dis_action");
					
					if(slno%2==0)
					out.print("<tr bgcolor=\"#77BFC7\">");
					else
					out.print("<tr bgcolor=\"#E5E4E2\">");
			%>
					<td><%=slno%></td>
					<td><%=slip%></td>
					<td><%=datc%></td>
					<td><%=ref%></td>
					<td><%=dat%></td>
					<td><%=roll%></td>
					<td><%=name%></td>
					<td><%=sex%></td>
					<td><%=course%></td>
					<td><%=sem%></td>
					<td><%=warf%></td>
					<td><%=action%></td>
					
					
					
					
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