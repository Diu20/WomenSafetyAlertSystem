<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.rcpit.*" %>
     <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%Connection con=DbConnection.connect();
int pid=Integer.parseInt(request.getParameter("pid"));
PreparedStatement pstmt=con.prepareStatement("delete from police where pid=?");
pstmt.setInt(1, pid);
int i=pstmt.executeUpdate();
if(i >0){
	response.sendRedirect("admin_table_view.jsp");
}

%>
</body>
</html>