<%@page language="java" import="java.sql.*"%>

<%!
		   Connection conn;
		   Statement stmtView;
		   ResultSet rs1;
		   String appno,dat,regn,admdate,name,sex,dob,fname,mname,loc,city,state,pin,phone,mail,course,cfee,feepaid,roll,pic;
		   int slno;
		  
		 

%>
<%
regn=request.getParameter("cmbdname");
%>
<html>
	<head>
		<title>Student Admission Detail Report</title>
	</head>
	
	<body>
		
			  <center><font color="red" size="5" face="copperplate gothic"><b>Student Admission Informatoin [ <%=name%> ]</b></font></center>
			   <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>Odisha University Of Engg. & Technology</b></font><br>
			  <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>CDA-Sec-10</b></font><br>
			  <font color1="#348017" size="3" face1="Lucida Calligraphy"><b>Cuttack, Odisha</b></font><br>
			  <table width="100%">
				<tr bgcolor="#3B9C9C" height="30">
					<td><font color="white"><center>SL.NO.</center></font></td>
					<td><font color="white"><center>Application No.</center></font></td>
					<td><font color="white"><center>Date</center></font></td>
					<td><font color="white"><center>Registration No.</center></font></td>
					<td><font color="white"><center>Admission Date</center></font></td>
					<td><font color="white"><center>Name</center></font></td>
					<td><font color="white"><center>Sex</center></font></td>
					<td><font color="white"><center>Date Of Birth</center></font></td>
					<td><font color="white"><center>Father Name</center></font></td>
					<td><font color="white"><center>Mother Name</center></font></td>
					<td><font color="white"><center>Locality</center></font></td>
					<td><font color="white"><center>City</center></font></td>
					<td><font color="white"><center>State</center></font></td>
					<td><font color="white"><center>Pin</center></font></td>
					<td><font color="white"><center>Phone No.</center></font></td>
					<td><font color="white"><center>E-Mailid</center></font></td>
					<td><font color="white"><center>Course</center></font></td>
					<td><font color="white"><center>Course Fee</center></font></td>
					<td><font color="white"><center>Fee Paid</center></font></td>
					<td><font color="white"><center>Roll No.</center></font></td>
					<td><font color="white"><center>Photo</center></font></td>
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
				rs1=stmtView.executeQuery("Select * from vet_tblstuadm where regi_no='"+regn+"'");
				
				
			    slno=1;
			    while(rs1.next()){
					appno=rs1.getString("app_no");
					dat=rs1.getString("date");
					regn=rs1.getString("regi_no");
					admdate=rs1.getString("adm_date");
					name=rs1.getString("full_name");
					sex=rs1.getString("sex");
					dob=rs1.getString("dob");
					fname=rs1.getString("f_name");
					mname=rs1.getString("m_name");
					loc=rs1.getString("loc");
					city=rs1.getString("city");
					state=rs1.getString("state");
					pin=rs1.getString("pin");
					phone=rs1.getString("ph_no");
					mail=rs1.getString("email");
					course=rs1.getString("course");
					cfee=rs1.getString("c_fee");
					feepaid=rs1.getString("fee_paid");
					roll=rs1.getString("roll_no");
					pic=rs1.getString("photo");
					if(slno%2==0)
					out.print("<tr bgcolor=\"#77BFC7\">");
					else
					out.print("<tr bgcolor=\"#E5E4E2\">");
			%>
					<td><%=slno%></td>
					<td><%=appno%></td>
					<td><%=dat%></td>
					<td><%=regn%></td>
					<td><%=admdate%></td>
					<td><%=name%></td>
					<td><%=sex%></td>
					<td><%=dob%></td>
					<td><%=fname%></td>
					<td><%=mname%></td>
					<td><%=loc%></td>
					<td><%=city%></td>
					<td><%=state%></td>
					<td><%=pin%></td>
					<td><%=phone%></td>
					<td><%=mail%></td>
					<td><%=course%></td>
					<td><%=cfee%></td>
					<td><%=feepaid%></td>
					<td><%=roll%></td>
					<td align="center"><img src=<%=pic%> name="imgphoto" height="75" width="75"></td>
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