<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<title> ETEEAP ACCREDITATION </title>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link href="css/index_w.css" rel="stylesheet"/>
 	<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
 	<%@ taglib prefix = "sql"  uri = "http://java.sun.com/jsp/jstl/sql" %>
</head>

<body>
<%
	String uname = (String) session.getAttribute("username");
	String age = (String) session.getAttribute("age");
%>

<sql:setDataSource
	var="myDS"
	driver="com.mysql.jdbc.Driver"
	url = "jdbc:mysql://127.0.0.1:3306/eteeap?user=IerizNicolle&password=Onetwothree45!&useSSL=false"
/>
<!-- user = "IerizNicolle"
	password = "Onetwothree45!"  -->

<sql:query var="users" dataSource="${myDS}">
	select * from users where uname = '<%=uname%>';
</sql:query>

<div id="page-container">
	<!-- TOP NAVIGATION -->
	<div id="mainnav" class="topnav">
		<form name="form" action="account?page=signout" method="post">
			<button type="submit" value="SIGN-OUT">SIGN-OUT</button>
		</form>
		<form name="form" action="account?page=settings" method="post">
			<button type="submit" value="SETTINGS">SETTINGS</button>
		</form>
		<form name="form" action="account?page=profile" method="post">
			<button class="active" type="submit" value="PROFILE">PROFILE</button>
		</form>
		<form name="form" action="account?page=students" method="post">
			<button type="submit" value="STUDENTS">STUDENTS</button>
		</form>
		<form name="form" action="account?page=home" method="post">
			<button type="submit" value="HOME">HOME</button>
		</form>
	</div>
	<br><br><br><br>

	<c:forEach var="user" items="${users.rows}">			
	<div id="profile">
		<div class="profilepic">
		    <img class = "pic" src="img/pp.png" alt="Profile Picture"><br>
			<a><c:out value="${user.name}"/></a><br>
			<b><c:out value="${user.position}"/></b><br><br>
		</div>
		
		<div class = "personal">
			<p><b>Personal Information</b></p>
			
			<table>
				<tr>
					<td><a>Name:</a></td><td><c:out value="${user.name}"/></td>
				</tr>
				<tr>
					<td><a>Age:</a></td><td><%=age %> years old</td>
				</tr>
				<tr>
					<td><a>Birthday:</a></td><td><c:out value="${user.birthday}"/></td>
				</tr>
				<tr>
					<td><a>Contact #:</a></td><td><c:out value="${user.contactnum}"/></td>
				</tr>
				<tr>
					<td><a>Address:</a></td><td><c:out value="${user.address}"/></td>
				</tr>
				<tr>
					<td><a><br></a></td><td><br></td>
				</tr>
			</table>
		</div>
		
		<div class = "employee">
			<p><b>Employee Details</b></p>
			
			<table>
				<tr>
					<td><a>Username:</a></td><td><c:out value="${user.uname}"/></td>
				</tr>
				<tr>
					<td><a>Position:</a></td><td><c:out value="${user.position}"/></td>
				</tr>
				<tr>
					<td><a>Employee #:</a></td><td><c:out value="${user.employee_number}"/></td>
				</tr>
				<tr>
					<td><a>Email:</a></td><td><c:out value="${user.email}"/></td>
				</tr>
				<tr>
					<td><a><br></a></td><td><br></td>
				</tr>
				<tr>
					<td><a>Last Logged-in:</a></td><td><c:out value="${user.time}"/></td>
				</tr>
			</table>
		</div>
	</div>
	</c:forEach>	
</div>
</body>

</html> 