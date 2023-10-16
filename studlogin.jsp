<%@page import="java.sql.*"%>

<html>
	<head>
		<title> Student Registration App  </title>
	<style>
		*{
			font-size:50px;
			background-color:skyblue;
			
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
			
			<h1> Student Login  </h1>
			<form method="POST">
			<input type="text"name="un"placeholder="Enter Username"/>
			<br/><br/>
			<input type="password"name="pw"placeholder="Enter Password"/>
			<br/><br/>
			<input type="submit" value="Login"name="btn"/>
			</form>
			<a href="./signup.jsp" > New User </a>


			<%
			if(request.getParameter("btn")!=null)
			{
				String un=request.getParameter("un");
				String pw=request.getParameter("pw");
				try
				{
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
					String url="jdbc:mysql://localhost:3306/sms_17jan23";
					Connection con=DriverManager.getConnection(url,"root","abc456");
					String sql="select * from users where username=?and password=?";
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setString(1,un);
					pst.setString(2,pw);
					ResultSet rs=pst.executeQuery();	
					if(rs.next())
					{
						request.getSession().setAttribute("user",un);
						response.sendRedirect("home.jsp");
					}
					else
					{
						out.println("Invalid credentials");
					}
				}
				catch(SQLException e)
				{
					out.println("Invalid Credentials");
				}


			}




			%>
		</center>

	</body>
</html>