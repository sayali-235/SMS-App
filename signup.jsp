<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Student Registration App </title>
		<style>
			*{
				font-size:40px;
				background-color:skyblue;
			}
		</style>
	</head>
	<body>
	<center>
		<h1> Signup page </h1>
		<form method="POST">
		<input type="text"name="un"placeholder="Enter username"/>
		<br/><br/>
		<input type="password"name="pw1"placeholder="Enter password"/>
		<br/><br/>
		<input type="password"name="pw2"placeholder="repeat password"/>
		<br/><br/>
		<input type="submit"value="Register"name="btn"/>
		</form>
		<a href="./index.jsp"> Already Registered </a>


		<%
		if(request.getParameter("btn")!=null)
		{
			String un=request.getParameter("un");
			String pw1=request.getParameter("pw1");
			String pw2=request.getParameter("pw2");
			
			if(!pw1.equals(pw2))
			{
				out.println("password did not match");
				return;
			}
			if(pw1.length()<8)
			{
				out.println("password shud be min of 8 characters");
				return;	
			}
		
			try
			{
				DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
				String url="jdbc:mysql://localhost:3306/sms_17jan23";
				Connection con=DriverManager.getConnection(url,"root","abc456");
				String sql="insert into users values(?,?)";
				PreparedStatement pst=con.prepareStatement(sql);
				pst.setString(1,un);
				pst.setString(2,pw1);
				pst.executeUpdate();
				con.close();
				response.sendRedirect("index.jsp");		
			}
			catch(SQLException er)
			{
				out.println("issue"+er);
			}
		}
		
		%>
	</center>
	</body>
</html>
