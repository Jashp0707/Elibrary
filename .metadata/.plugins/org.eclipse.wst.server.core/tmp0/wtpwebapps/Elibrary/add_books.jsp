<%
	
	
	if(session.getAttribute("adminUsername") != null){
		
%>

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
<title>Add Book</title>
</head>

<body style="background-color: black;">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
    <div class="container-fluid">
      <a class="navbar-brand" href="login_index.jsp">E-Library</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="login_index.jsp">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="books.jsp">Ebooks</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="add_books.jsp" >Add Books</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="search_books.jsp" tabindex="-1" >Search Books</a>
          </li>
        </ul>
        
      </div>
      <div class="text-end">
            
            <button type="button" class="btn btn-warning"><a href="index.jsp" class="text-decoration-none" style="color: white;">Log Out</a></button>
          </div>
    </div>
  </nav>
  
  
  <div class="container-sm constainer-md position-absolute top-50 start-50 translate-middle text-center">
    <form action="" class="row g-3">
        <div class="col-md-6" >
          <label for="inputEmail4" class="form-label" style="color: white;">Book Name</label>
          <input type="text" class="form-control" name="name" id="inputEmail4">
        </div>
        <div class="col-md-6">
          <label for="inputPassword4" class="form-label" style="color: white;">Publisher</label>
          <input type="text" class="form-control" name="publisher" id="inputPassword4">
        </div>
        <div class="col-md-6">
            <label for="inputEmail4" class="form-label" style="color: white;">Author</label>
            <input type="text" class="form-control" name="author" id="inputEmail4">
          </div>
          <div class="col-md-6">
            <label for="inputPassword4" class="form-label" style="color: white;">Subject</label>
            <input type="text" class="form-control" name="subject" id="inputPassword4">
          </div>
          
          <div class="col-md-6">
            <label for="inputPassword4" class="form-label" style="color: white;">Department</label>
            <input type="text" class="form-control" name="department" id="inputPassword4">
          </div>
          <div class="col-md-6">
            <label for="inputPassword4" class="form-label" style="color: white;">Page</label>
            <input type="int" class="form-control" name="page1" id="inputPassword4">
          </div>
        <div class="col-md-6">
          <label for="inputAddress" class="form-label" style="color: white;">URL</label>
          <input type="text" class="form-control" id="inputAddress" name="url" placeholder="www.google.com">
        </div>
        
        <div class="col-12">
          <button type="submit" class="btn btn-primary">Add Book</button>
        </div>
      </form>
  </div>
  
  
  <%
  
  String name=request.getParameter("name");
	String pub=request.getParameter("publisher");
	String author=request.getParameter("author");
	String sub=request.getParameter("subject");
	String dept=request.getParameter("department");
	String page_no=request.getParameter("page1");
	String url=request.getParameter("url");
	
	if(url!=null&&name!=null){
		
		try
		{
			
				Class.forName("com.mysql.jdbc.Driver");
				
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/E-library", "root", "root");
				
				Statement st= con.createStatement();
				String sql="INSERT INTO books (`name`, `publisher`, `author`, `subject`, `department`, `page`, `url`) VALUES ('"+name+"','"+pub+"','"+author+"','"+sub+"','"+dept+"','"+page_no+"','"+url+"')";
				int i=st.executeUpdate(sql);
				

		
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
		out.println("<script>alert('Book Added Successfully');</script>");
		response.sendRedirect("books.jsp");}
  
  %>
  

</body>
</html>

<%
	}
	else{
		out.println("<script>alert('SESSION INVALID!!! PLEASE LOGIN AGAIN!!!!!');</script>");
		response.sendRedirect("login.jsp");
	}
%>