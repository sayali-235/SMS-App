<%@page import="java.sql.*" %>
<html>
<head>
<style>
*{
font-size:40px;
}
.nav1{
background-color:#5D3FD3;
padding:10px;
font-weight:BOLD;
float:left;
}

.nav1 a{
text-decoration:none;
margin-right:100px;
color:white;
}

.nav2{
background-color:#5D3FD3;
padding:10px;
font-weight:BOLD;

}

.nav2 a{
text-decoration:none;
margin-right:100px;
color:white;
}

</style>
</head>
<body>
	<center>
		<div class="nav1">
			<a href="home.jsp">Kamal Classes </a>
		</div>
		<div class="nav2">

			<a href="">Home  </a>
			<a href="register.jsp"> Course Enroll </a>
			<a href="index.jsp"> LogOut </a>
			</div>
			<br/>
	<table border="3"style="width:50%;">
			<tr>
				<th> Name  </th>			
				<th> College Name  </th>			
				<th> Address </th>
				<th> Course </th>
				<th> phone no </th>			
			</tr>
		
		<%
			try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/sms_17jan23";
				Connection con=DriverManager.getConnection(url,"root","abc456");
				String sql="select * from student";
				Statement stmt=con.createStatement();
				ResultSet rs=stmt.executeQuery(sql);
				while(rs.next())
				{
					
					String name=rs.getString(1);
					String college=rs.getString(2);
					String address=rs.getString(3);
					String course=rs.getString(4);
					String phone=rs.getString(5);
		%>
				<tr style="text-align:center;">
					<td> <%=name%> </td>
					<td> <%=college%> </td>
					<td> <%=address%> </td>
					<td> <%=course%> </td>
					<td> <%=phone%> </td>
					
				</tr>
		<%
				}
			}
			catch(SQLException er)
			{
				out.println("issue"+er);
			}
		%>
		</table>
		

	</center>
</body>
</html>