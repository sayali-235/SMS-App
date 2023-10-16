<%@page import="java.sql.*"%>

<html>
	<head>
		<title>Student Registration App </title>
		<style>
			*{
				font-size:50px;
				background-color:skyblue;
				
			}
			#form{
				font-color:white;
				}
		</style>
	</head>
	<body>
	<center>
		<h1> Admin Login </h1>
		<form method="POST">
		<input type="text"name="un"placeholder="Enter username"/>
		<br/><br/>
		<input type="password"name="pw"placeholder="Enter password"/>
		<br/><br/>
		<input type="submit"value="Login"name="btn"/>
		</form>
		<%

			if(request.getParameter("btn")!=null)
			{
				String un=request.getParameter("un");
				String pw=request.getParameter("pw");
		
			if(un.equals("Kamalsir") && pw.equals("Kamal@123"))
		
				{
					out.println("Login Successfully");
					response.sendRedirect("admin_home.jsp");
					
				}
			else
		%>
			<script>
				{
				alert("Invalid credentials");
					
				}
			</script>
		<%

		}
		
		%>
	</center>
	</body>
</html>
