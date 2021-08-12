<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body style="background-color: black;">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="index.jsp">E-Library</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="books.jsp">Ebooks</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="add_books.jsp">Add Books</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="search_books.jsp" tabindex="-1" >Search Books</a>
          </li>
        </ul>
        
      </div>
    </div>
  </nav>
  
  <div
		class="container-sm constainer-md position-absolute top-50 start-50 translate-middle text-center">
		<form action="login.jsp">

			<div class="row mb-3 mx-auto w-50">
				<label for="inputEmail3" class="col-sm-2 col-form-label" style="color: white;">Email</label>
				<div class="col-sm-10">
					<input type="email" class="form-control" name="email"
						id="inputEmail3">
				</div>
			</div>
			<div class="row mb-3 mx-auto w-50">
				<label for="inputPassword3" class="col-sm-2 col-form-label" style="color: white;">Password</label>
				<div class="col-sm-10">
					<input type="password" class="form-control" name="password"
						id="inputPassword3">
				</div>
			</div>
			<div class="container mx-auto w-50 text-center ">

				<button type="submit" class="btn btn-primary">Sign in</button>


			</div>
			
		</form>
	</div>
	<!-- footer  -->
	
	<%
	String email_id=request.getParameter("email");
	String pwd=request.getParameter("password");
	try{
		Class.forName("com.mysql.jdbc.Driver");

        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/E-library", "root", "root");
		if(email_id!=null&&pwd!=null){
			
	        Statement st = con.createStatement();
			String sql = "select * from login where email_id='" + email_id + "' and password='"
					+ pwd + "' ";
			ResultSet rs = st.executeQuery(sql);
			if(rs.next()){
				String Uname=request.getParameter("email");
				session.setAttribute("adminUsername" ,Uname);
				response.sendRedirect("books.jsp");
			}
			else{
				out.println("<script>alert('Wrong username or password');</script>");
				System.out.println("wrong password");
				/* response.sendRedirect("login.jsp"); */
			}
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	%>
  

</body>
</html>