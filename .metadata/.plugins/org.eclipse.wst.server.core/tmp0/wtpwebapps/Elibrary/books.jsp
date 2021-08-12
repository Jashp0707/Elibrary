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
<title>Books</title>
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
  
  <div class="container">
	<table border="1" class="container-sm constainer-md position-absolute  text-center" style="margin-top: 10%; color: white;">
		<tr>
			<th>Book Name</th>
			<th>Publisher</th>
			<th>Author</th>
			<th>Subject</th>
			<th>Department</th>
			<th>Page</th>
			<th>Download</th>
		</tr>
		<%
		try
		{
			
				Class.forName("com.mysql.jdbc.Driver");
				
				java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/E-library", "root", "root");
				
				Statement st= con.createStatement();
				String sql="SELECT * FROM books ORDER BY book_id DESC";
				ResultSet rs=st.executeQuery(sql);
				while(rs.next()){
					%>
			<tr>
				<td>
					<%
						out.println(rs.getString("name"));
					%>
				</td>
				<td>
					<%
						out.println(rs.getString("publisher"));
					%>
				</td>
				<td>
					<%
						out.println(rs.getString("author"));
					%>
				</td>
				<td>
					<%
						out.println(rs.getString("subject"));
					%>
				</td>
				<td>
					<%
						out.println(rs.getString("department"));
					%>
				</td>
				<td>
					<%
						out.println(rs.getString("page"));
					%>
				</td>
				<td>
				<button type="button" class="btn btn-outline-light me-2"><a href="
				<%= rs.getString("url")
				%>" class="text-decoration-none" style="color: white; ">Download</a></button>
				
				
				</td>
				
			</tr>
			<%
				}
		} catch(Exception e) { System.out.print(e); e.printStackTrace(); }
		
			%>



			




		</table></div>
	
  

</body>
</html>

<%
	}
	else{
		out.println("<script>alert('SESSION INVALID!!! PLEASE LOGIN AGAIN!!!!!');</script>");
		response.sendRedirect("login.jsp");
	}
%>