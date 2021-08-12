<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");

java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/E-library", "root", "root");
Statement st = con.createStatement();
String sql="select book from books where id=1";
ResultSet rs = st.executeQuery(sql);
if (rs.next()) {
	byte[] imgData = rs.getBytes("book");//Here....... r1.getBytes() extract byte data from resultSet 
    System.out.println(imgData);
    response.setHeader("expires", "0");
    response.setContentType("image/jpg");

    OutputStream os = response.getOutputStream(); // output with the help of outputStream 
    os.write(imgData);
    os.flush();
    os.close();

}
%>
</body>
</html>