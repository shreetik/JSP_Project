<%@page language="java" import="java.sql.*"%>

<%!
		   Connection conn;
		   Statement stmtView;
		   ResultSet rs1;
		   String uname,vcname,ses,loc,city,state,phone,fax,email,web;
		   int slno;
		  
		 

%>
<%
uname=request.getParameter("cmbdname");
%>
<html>
	<head>
		<title>University Detail Report</title>
	</head>
	
	<body>
		
			  <center><font color="red" size="5" face="copperplate gothic"><b>University Informatoin [ <%=uname%> ]</b></font></center>
			   <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>Odisha University Of Engg. & Technology</b></font><br>
			  <font color1="#348017" size="4" face1="Lucida Calligraphy"><b>CDA-Sec-10</b></font><br>
			  <font color1="#348017" size="3" face1="Lucida Calligraphy"><b>Cuttack, Odisha</b></font><br>
			  <table width="100%">
				<tr bgcolor="#3B9C9C" height="30">
					<td><font color="white"><center>SL.NO.</center></font></td>
					<td><font color="white"><center>Name Of University</center></font></td>
					<td><font color="white"><center>Name Of VC</center></font></td>
					<td><font color="white"><center>Session</center></font></td>
					<td><font color="white"><center>Locality</center></font></td>
					<td><font color="white"><center>City</center></font></td>
					<td><font color="white"><center>State</center></font></td>
					<td><font color="white"><center>Phone No.</center></font></td>
					<td><font color="white"><center>Fax No.</center></font></td>
					<td><font color="white"><center>Email-ID</center></font></td>
					<td><font color="white"><center>Website</center></font></td>
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
				rs1=stmtView.executeQuery("Select * from vet_tbluniv where univname='"+uname+"'");
				
				
			    slno=1;
			    while(rs1.next()){
					uname=rs1.getString("univname");
					vcname=rs1.getString("univc");
					ses=rs1.getString("unises");
					loc=rs1.getString("uniloc");
					city=rs1.getString("unicity");
					state=rs1.getString("unistate");
					phone=rs1.getString("uniphone");
					fax=rs1.getString("unifax");
					email=rs1.getString("uniemail");
					web=rs1.getString("uniweb");
					if(slno%2==0)
					out.print("<tr bgcolor=\"#77BFC7\">");
					else
					out.print("<tr bgcolor=\"#E5E4E2\">");
			%>
					<td><%=slno%></td>
					<td><%=uname%></td>
					<td><%=vcname%></td>
					<td><%=ses%></td>
					<td><%=loc%></td>
					<td><%=city%></td>
					<td><%=state%></td>
					<td><%=phone%></td>
					<td><%=fax%></td>
					<td><%=email%></td>
					<td><%=web%></td>
					
					
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