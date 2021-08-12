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
<title>Home</title>
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
            <a class="nav-link" href="add_books.jsp">Add Books</a>
          </li>
          <li class="nav-item">
            <a class="nav-link " href="search_books.jsp" tabindex="-1" >Search Books</a>
          </li>
        </ul>
        <div class="text-end">
            
            <button type="button" class="btn btn-warning"><a href="index.jsp" class="text-decoration-none" style="color: white;">Log Out</a></button>
          </div>
      </div>
    </div>
  </nav>

  <!-- main -->
  <div class="container" style="background-color: black;">
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
      <div class="carousel-indicators">
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2" class=""></button>
        <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class="active"
          aria-current="true"></button>
      </div>
      <div class="carousel-inner text-center align-items-center justify-content-center" style="width: 70%; margin: auto;">
        <div class="carousel-item">
          <img src="1.jpg" alt="" height="30%" width="100%" >

          <div class="container">
            <div class="carousel-caption" style="color: white;">
              <h1>Ebooks</h1>
              <p>Some representative placeholder content for the first slide of the carousel.</p>
              
            </div>
          </div>
        </div>
        <div class="carousel-item">
          <img src="2.jpg" alt="" width="100%" height="30%">

          <div class="container">
            <div class="carousel-caption" style="color:white;">
              <h1>Anywhere & Anytime</h1>
              <p>Some representative placeholder content for the second slide of the carousel.</p>
            </div>
          </div>
        </div>
        <div class="carousel-item active">
          <img src="3.jpg" alt="" width="90%" height="30%">

          <div class="container">
            <div class="carousel-caption" style="color: white;">
              <h1>Anyone</h1>
              <p>Some representative placeholder content for the third slide of this carousel.</p>
              
            </div>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev" >
        <span class="carousel-control-prev-icon" aria-hidden="true" style="color: black;"></span>
        <span class="visually-hidden" style="color: black;">Previous</span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next" style="color: black;">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
      </button>
    </div>
  </div>

  <!-- footer  -->
  <footer class="footer mt-auto py-3 bg-dark">
    <div class="container" style="color: white;">
      <span class="text-muted" style="color: white;">E-Library </span>
    </div>
  </footer>

</body>
</html>
<%
	}
	else{
		out.println("<script>alert('SESSION INVALID!!! PLEASE LOGIN AGAIN!!!!!');</script>");
		response.sendRedirect("login.jsp");
	}
%>