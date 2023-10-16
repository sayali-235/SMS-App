<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="javax.activation.*" %>




<html>
	<head>
		<title> Student Registration App </title>
		<style>
			*{
				font-size:40px;
			}
			.nav{
background-color:#5D3FD3;
padding:10px;
font-weight:BOLD;
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
			<a href="">Kamal Classes </a>
		</div>
		<div class="nav2">

			<a href="home.jsp">Home</a>
			<a href="register.jsp"> Course Enroll </a>
			
			</div>
		
		<h1> Student Registration Form </h1>

		<form method="post">
			
			<input type="text" name="name"placeholder="Enter Name" />
			<br/><br/>
			<input type="text" name="college"placeholder="Enter College Name" />
			<br/><br/>
			<input type="text" name="address"placeholder="Enter Address" />
			<br/><br/>
			<label for="course">Choose a Course:</label>
			<select name="course" id="course">
  			<option value="java">Java</option>
  			<option value="python">Python</option>
 			<option value="Mysql">Mysql</option>
 			<option value="ML">ML</option>
			</select></br></br>
			<input type="email" name="email"placeholder="Enter Email" />
			<br/><br/>
			<input type="number" name="phone" placeholder="Enter Phone no" />
			<br/><br/>			
			<input type="submit" name="btnSubmit"/>
			<input type="Reset" name="btnReset"/>

		</form>

		<%
	if(request.getParameter("btnSubmit")!=null)
	{
		String name=request.getParameter("name");
		String college=request.getParameter("college");
		String address=request.getParameter("address");
		String course=request.getParameter("course");
		String phone =request.getParameter("phone");
		String email=request.getParameter("email");
	       
		
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
		
			else if(email=="")
			{
				out.println("email shud not empty");
				return;
			}
		
			else
				{

				try
				{
					DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
					String url="jdbc:mysql://localhost:3306/sms_17jan23";
					Connection con=DriverManager.getConnection(url,"root","abc456");
					String sql="insert into student values(?,?,?,?,?,?)";
					PreparedStatement pst=con.prepareStatement(sql);
					pst.setString(1,name);
					pst.setString(2,college);
					pst.setString(3,address);
					pst.setString(4,course);
					pst.setString(5,phone);
					pst.setString(6,email);
					pst.executeUpdate();
					
				//mail kahan se jayega.

				Properties p=System.getProperties();
				p.put("mail.smtp.host","smtp.gmail.com");
				p.put("mail.smtp.port",587);
				p.put("mail.smtp.auth",true);
				p.put("mail.smtp.starttls.enable",true);

				//apka un and pw ka authentication.

				Session ms=Session.getInstance(p,new Authenticator(){
				public PasswordAuthentication getPasswordAuthentication(){
				String un="pratikmore5702@gmail.com";
				String pw="olvy tctp fgkh hwvb";
				return new PasswordAuthentication(un,pw);
			}
			});

			try
			{
				//mail ko draft karke bhejo.
				
				MimeMessage msg=new MimeMessage(ms);
				String subject="thank u for registration!!!";
				msg.setSubject(subject);
				String txt=" name :" + name + "\n college: " + college + "\n course:" + course + " \n phone:"+ phone;
				msg.setText(txt);
				msg.setFrom(new InternetAddress("pratikmore5702@gmail.com"));
				msg.addRecipient(Message.RecipientType.TO,new InternetAddress(email));				
				Transport.send(msg);	

			}
			catch(Exception er)
			{
				out.println("issue"+er);
			}
				con.close();	
			
				%>
			
					
			
				<script>

					alert("record saved");
			</script>
			
					
				<%
				}
				catch(SQLException e)
				{
					out.println("phone number is already exists" );
				}
}
		}
	%>	

	</center>
	</body>
</html>