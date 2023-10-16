<%@page import="java.sql.*"%>
<html>
<head>
<style>
*{
font-size:40px;
background-color:skyblue;
}
</style>
</head>
<body>
	<center>
		<h1> Update Record </h1>
		<form>
			
			<input type="text" name="name"placeholder="enter name"/>
			<br/><br/>
			<input type="text" name="college"placeholder="enter college name"/>
			<br/><br/>
			<input type="text" name="address"placeholder="enter address"/>
			<br/><br/>
			<label for="course">Choose a Course:</label>
			<select name="course" id="course">
  			<option value="java">Java</option>
  			<option value="python">Python</option>
 			<option value="Mysql">Mysql</option>
 			<option value="ML">ML</option>
			</select></br></br>
			<input type="number" name="phone"placeholder="enter phone no"/>
			<br/><br/>
			<input type="submit"value="Update"name="btn"/>
			/* <a href="admin_home.jsp"> Back </a> */

		</form>

		
			<%
	if(request.getParameter("btn")!=null)
	{
		String name=request.getParameter("name");
		String college=request.getParameter("college");
		String address=request.getParameter("address");
		String course=request.getParameter("course");
		String phone=request.getParameter("phone");

			if(name.trim().length()==0)
			{
				out.println("name empty !!");
				return;
			}

			else if(name.trim().length()==1)
			{
				out.println("name shud be minimum 2 character");
				return;
			}

			else if(!name.matches("^[a-zA-Z ]*$"))
			{
				out.println("name shud be start with only letters");
				return;
			}
			else if(college=="")
			{
				out.println(" college name empty !!");
				return;
			}
	
			else if(college.trim().length()<=2)
			{
				out.println(" college name shud be minimum 3 letters");
				return;
			}

			else if(address=="")
			{
				out.println("address empty !!");
				return;
			}

			else if(address.trim().length()<=4)
			{
				out.println(" address shud be minimum 5 letters");
				return;
			}

			else if(course=="")
			{
				out.println("course should not empty !!");
				return;
			}

			
			else if(phone.length()<1)
			{
				out.println("length should be 10 digit");
				return;
			}
			
			
			else if(phone.length()<10)
			{
				out.println("length should be 10 digit");
				return;
			}	
		
			
		
				try
				{
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
					String url="jdbc:mysql://localhost:3306/sms_17jan23";
					Connection con=DriverManager.getConnection(url,"root","abc456");
					String sql="update student set name=?,college=?,address=?,course=? where phone=?";
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setString(1,name);
					pst.setString(2,college);
					pst.setString(3,address);
					pst.setString(4,course);
					pst.setString(5,phone);
					int result = pst.executeUpdate();
					if(result==1)
					{
						%>
	
						<script>

						alert("record updated");
						</script>
						<%
					}
					else
					{
						%>
	
						<script>

						alert("record not updated");
						</script>
						<%
					}
				
					con.close();
			
				%>
				
				
					
		
		<%
			}
			catch(Exception er)
			{
				out.println("phone number is already exists"+er);
			}
}
		%>

					
			


	</center>

</body>
</html>