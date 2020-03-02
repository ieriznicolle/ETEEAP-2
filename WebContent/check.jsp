<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
	try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/eteeap?user=IerizNicolle&password=Onetwothree45!&useSSL=false");
		
		PreparedStatement ps1 = con.prepareStatement("select * from users where employee_number = ?");
		ps1.setString(1, request.getParameter("empnum_"));

		PreparedStatement ps2 = con.prepareStatement("select * from users where employee_number = ?");
		ps2.setString(1, request.getParameter("empnum"));
			
		ResultSet res1 = ps1.executeQuery();
		ResultSet res2 = ps2.executeQuery();

		if (res1.first()) {
			String nameDB = res1.getString("name");
			out.print(nameDB);
		}
			
		else if (res2.first()) {
			String nameDB = res2.getString("name");
			out.print(nameDB);
		}
		
		else {
			out.print("Employee not found.");
		}
	}
	
	catch (Exception e) {
		System.out.println(e);  
	}
%>