<%@page language="java" import="java.sql.*"%>

<%!
		   Connection conn;
		   Statement stmtView;
		   ResultSet rs1;
		   String sid,sname,sex,dob,qual,doj,dept,dgn,loc,city,state,pin,phone,mail,uname,pass;
		   int slno;
		  
		 

%>
<%
dept=request.getParameter("cmbdname");
%>
<html>
	<head>
		<title>Staff Detail Report</title>
	</head>
	
	<body>
		
			  <center><font color="red" size="5" face="copperplate gothic"><b>Staff Informatoin [ <%=sname%> ]</b></font></center>
			   <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>Odisha University Of Engg. & Technology</b></font><br>
			  <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>CDA-Sec-10</b></font><br>
			  <font color1="#348017" size="3" face1="Lucida Calligraphy"><b>Cuttack, Odisha</b></font><br>
			  <table width="100%">
				<tr bgcolor="#3B9C9C" height="30">
					<td><font color="white"><center>SL.NO.</center></font></td>
					<td><font color="white"><center>Staff ID</center></font></td>
					<td><font color="white"><center>Staff Name</center></font></td>
					<td><font color="white"><center>Sex</center></font></td>
					<td><font color="white"><center>Date Of Birth</center></font></td>
					<td><font color="white"><center>Qualification</center></font></td>
					<td><font color="white"><center>Date Of Join</center></font></td>
					<td><font color="white"><center>Department</center></font></td>
					<td><font color="white"><center>Designation</center></font></td>
					<td><font color="white"><center>Locality</center></font></td>
					<td><font color="white"><center>City</center></font></td>
					<td><font color="white"><center>State</center></font></td>
					<td><font color="white"><center>Pin</center></font></td>
					<td><font color="white"><center>Phome No.</center></font></td>
					<td><font color="white"><center>E-mailid</center></font></td>
					<td><font color="white"><center>User Name</center></font></td>
					<td><font color="white"><center>Password</center></font></td>
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
				rs1=stmtView.executeQuery("Select * from vet_tblstaff where dept='"+dept+"'");
				
				
			    slno=1;
			    while(rs1.next()){
					sid=rs1.getString("staff_id");
					sname=rs1.getString("staff_name");
					sex=rs1.getString("sex");
					dob=rs1.getString("dob");
					qual=rs1.getString("qual");
					doj=rs1.getString("doj");
					dept=rs1.getString("dept");
					dgn=rs1.getString("dsg");
					loc=rs1.getString("loc");
					city=rs1.getString("city");
					state=rs1.getString("state");
					pin=rs1.getString("pin");
					phone=rs1.getString("ph_no");
					mail=rs1.getString("m_id");
					uname=rs1.getString("u_name");
					pass=rs1.getString("pass");
					if(slno%2==0)
					out.print("<tr bgcolor=\"#77BFC7\">");
					else
					out.print("<tr bgcolor=\"#E5E4E2\">");
			%>
					<td><%=slno%></td>
					<td><%=sid%></td>
					<td><%=sname%></td>
					<td><%=sex%></td>
					<td><%=dob%></td>
					<td><%=qual%></td>
					<td><%=doj%></td>
					<td><%=dept%></td>
					<td><%=dgn%></td>
					<td><%=loc%></td>
					<td><%=city%></td>
					<td><%=state%></td>
					<td><%=pin%></td>
					<td><%=phone%></td>
					<td><%=mail%></td>
					<td><%=uname%></td>
					<td><%=pass%></td>
					
					
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