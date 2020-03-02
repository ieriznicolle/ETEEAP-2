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
		ps1.setString(1, request.getParameter("empnum"));

		PreparedStatement ps2 = con.prepareStatement("select * from users where uname = ?");
		ps2.setString(1, request.getParameter("username"));
		
		PreparedStatement ps3 = con.prepareStatement("select * from users where email = ?");
		ps3.setString(1, request.getParameter("email"));
		
		PreparedStatement ps4 = con.prepareStatement("select * from users where contactnum = ?");
		ps4.setString(1, request.getParameter("contact"));
		
		ResultSet res1 = ps1.executeQuery();
		ResultSet res2 = ps2.executeQuery();
		ResultSet res3 = ps3.executeQuery();
		ResultSet res4 = ps4.executeQuery();
		
		if (res1.first()) {
			out.print("Employee number already exist");
		}
		
		else if (res2.first()) {
			out.print("Username already exist");
		}
		
		else if (res3.first()) {
			out.print("Email already exist");
		}
		
		else if (res4.first()) {
			out.print("Contact number already exist");
		}

		else {
			out.print("  ");
		}
	}
	
	catch (Exception e) {
		System.out.println(e);  
	}
%>