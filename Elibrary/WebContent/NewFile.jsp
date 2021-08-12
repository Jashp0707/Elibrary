<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
    <%@ page trimDirectiveWhitespaces="true" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%-- <%
Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/E-library", "root", "root");
Statement st = con.createStatement();
String sql="select book from books where book_id=1";
ResultSet rs = st.executeQuery(sql);
if (rs.next()) {
	byte[] imgData = rs.getBytes("book");//Here....... r1.getBytes() extract byte data from resultSet 
    System.out.println(imgData);
    response.setHeader("expires", "0");
    response.setContentType("image/jpeg");

    OutputStream os = response.getOutputStream(); // output with the help of outputStream 
    os.write(imgData);
    os.flush();
    os.close();

}
%> --%>
<%-- <form action="NewFile.jsp">

        
        
        <div class="row mb-3 mx-auto w-50">
            <label class="col-sm-2 col-form-label">File</label>
            <div class="col-sm-10">
                <input type="file" class="form-control" name="post"
                    id="file">
            </div>
        </div>

        <div class="container mx-auto w-50 text-center ">

            <button type="submit" class="btn btn-primary">Submit</button>


        </div>
        
    </form>
    <%
    String k=request.getParameter("post");
    if (request.getParameter("post")!=null){
    	Class.forName("com.mysql.jdbc.Driver");

        java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/E-library", "root", "root");
        /* Statement st = con.createStatement(); */
        String sql="Insert into books values(?, ?)";
        PreparedStatement pstmt = con.prepareStatement(sql);
        File file = new File(request.getParameter("post"));
        FileInputStream input = new FileInputStream(file);
        pstmt.setBinaryStream(1, input);
        pstmt.setInt(2, 3);
       
        int i = pstmt.executeUpdate();
        System.out.println(i);
    }
    System.out.println(k);
    
    
    %> --%>
</body>
</html>