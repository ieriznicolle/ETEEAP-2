<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<title> ETEEAP ACCREDITATION </title>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link href="css/index_w.css" rel="stylesheet">  
 	<%@ taglib prefix = "c"  uri = "http://java.sun.com/jsp/jstl/core" %>
 	<%@ taglib prefix = "sql"  uri = "http://java.sun.com/jsp/jstl/sql" %>
</head>

<body>
<% String user = (String) session.getAttribute("user"); %>

<sql:setDataSource
	var="myDS"
	driver="com.mysql.jdbc.Driver"
	url = "jdbc:mysql://127.0.0.1:3306/eteeap?user=IerizNicolle&password=Onetwothree45!&useSSL=false"
/>

<sql:query var="user" dataSource="${myDS}">
	select * from users where employee_number = '<%=user%>';
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
			<button type="submit" value="PROFILE">PROFILE</button>
		</form>
		<form name="form" action="account?page=students" method="post">
			<button type="submit" value="STUDENTS">STUDENTS</button>
		</form>
		<form name="form" action="account?page=home" method="post">
			<button class="active" type="submit" value="HOME">HOME</button>
		</form>
	</div>
	<br><br><br><br>
	
	<c:forEach var="user" items="${user.rows}">	
	<div id="content-wrap">
		<img class = "pic" src="img/eteeap.png" alt="ETEEAP Logo"><br>
		<p>Welcome, <c:out value="${user.name}"/></p>
		<h3>Expanded Tertiary Education Equivalency and Accreditation Program (ETEEAP)</h3><br>
		The ETEEAP of the Commission on Higher Education (CHED) is an educational assessment scheme which recognizes knowledge, 
		skill and prior learning attained by individuals from non-formal and informal educational experiences.
		<br><br>
		Using equivalency competence standard and a comprehensive assessment system which employ written tests and combined assessment 
		methodologies, a higher education institution may administer competency-based evaluation as basis of accrediting learning experiences.
		<br><br>
		A panel of assessors is convened to determine the candidate's knowledge, skills and attitudes relevant to a particular discipline 
		and consequently equivalent credits and appropriate certificates and degrees are awarded by administering higher education institutions. 
	</div>
	</c:forEach>
	
	<footer id="footer"></footer>
</div>
</body>

</html> 