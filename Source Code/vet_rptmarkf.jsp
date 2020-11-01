<%@page language="java" import="java.sql.*"%>

<%!
		   Connection conn;
		   Statement stmtView;
		   ResultSet rs1;
		   String ref,dat,roll,name,sex,course,pcod,credit,pname,sem,fmark,markob;
		   int slno;
		  
		 

%>
<html>
	<head>
		<title>Mark Folio Report</title>
	</head>
	<script language="javascript">
		function gohome(){
				window.close();
				}
	</script>
	<body>
		
			  <center><font color="red" size="5" face="copperplate gothic"><b>Mark Folio Information</b></font></center>
			   <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>Odisha University Of Engg. & Technology</b></font><br>
			  <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>CDA-Sec-10</b></font><br>
			  <font color1="#348017" size="3" face1="Lucida Calligraphy"><b>Cuttack, Odisha</b></font><br>
			  <table width="100%">
				<tr bgcolor="#3B9C9C" height="30">
					<td><font color="white"><center>SL.NO.</center></font></td>
					<td><font color="white"><center>Reference No.</center></font></td>
					<td><font color="white"><center>Date</center></font></td>
					<td><font color="white"><center>Roll No.</center></font></td>
					<td><font color="white"><center>Name</center></font></td>
					<td><font color="white"><center>Sex</center></font></td>
					<td><font color="white"><center>Course</center></font></td>
					<td><font color="white"><center>Paper Code</center></font></td>
					<td><font color="white"><center>Credit</center></font></td>
					<td><font color="white"><center>Paper Name</center></font></td>
					<td><font color="white"><center>Semester</center></font></td>
					<td><font color="white"><center>Full Mark</center></font></td>
					<td><font color="white"><center>Mark Obtained</center></font></td>
					
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
				rs1=stmtView.executeQuery("Select * from vet_tblMarkFolio");
				
				
			    slno=1;
			    while(rs1.next()){
					ref=rs1.getString("ref_no");
					dat=rs1.getString("date");
					roll=rs1.getString("roll_no");
					name=rs1.getString("name");
					sex=rs1.getString("sex");
					course=rs1.getString("course");
					pcod=rs1.getString("paper_code");
					credit=rs1.getString("credit");
					pname=rs1.getString("paper_name");
					sem=rs1.getString("semester");
					fmark=rs1.getString("full_mark");
					markob=rs1.getString("mark_obtained");
					
					if(slno%2==0)
					out.print("<tr bgcolor=\"#77BFC7\">");
					else
					out.print("<tr bgcolor=\"#E5E4E2\">");
			%>
					<td><%=slno%></td>
					<td><%=ref%></td>
					<td><%=dat%></td>
					<td><%=roll%></td>
					<td><%=name%></td>
					<td><%=sex%></td>
					<td><%=course%></td>
					<td><%=pcod%></td>
					<td><%=credit%></td>
					<td><%=pname%></td>
					<td><%=sem%></td>
					<td><%=fmark%></td>
					<td><%=markob%></td>
					
					
					
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