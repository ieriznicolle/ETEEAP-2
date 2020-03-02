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
<sql:setDataSource
	var="myDS"
	driver="com.mysql.jdbc.Driver"
	url = "jdbc:mysql://127.0.0.1:3306/eteeap?user=IerizNicolle&password=Onetwothree45!&useSSL=false"
/>

<sql:query var="applicant" dataSource="${myDS}">
	select * from applicants where a_appnum = '<%=request.getAttribute("appnum")%>';
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
			<button class="active" type="submit" value="STUDENTS">STUDENTS</button>
		</form>
		<form name="form" action="account?page=home" method="post">
			<button type="submit" value="HOME">HOME</button>
		</form>
	</div>
	<br><br><br>

	<div id="students">
		<br><br>
		<c:forEach var="user" items="${applicant.rows}">
		<div id="cover">
			<h3>Displaying results for:</h3><br>
			<h2><c:out value="${user.a_name}"/></h2>
		</div>
		
		<br><br>
		<div class="stpersonal">
			<form name="form" action="studentdetails?page=personal&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
				<button type="submit" value="PERSONAL"><img class="imgsetting" src="img/form.png" alt="Personal Details"/>
				<br>Personal Details<br></button>
				<input type="hidden" name="appnum" value ="${user.a_appnum}"/><br>
			</form>
		</div>
		&nbsp;
		<div class="stchecklist">
			<form name="form" action="studentdetails?page=checklist&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
				<button type="submit" value="CHECKLIST"><img class="imgsetting" src="img/checklist.png" alt="Checklist"/>
				<br>Checklist<br></button>
				<input type="hidden" name="appnum" value ="${user.a_appnum}"/><br>
			</form>
		</div>
		&nbsp;
		<div class="stform">
			<form name="form" action="studentdetails?page=form&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
				<button type="submit" value="FORM"><img class="imgsetting" src="img/curriculum.png" alt="Form"/>
				<br>Equivalency and Accreditation Form<br></button>
				<input type="hidden" name="appnum" value ="${user.a_appnum}"/><br>
			</form>
		</div>
		</c:forEach>
	</div>
	<br>
	<span style="color:#8c2f15; font-weight:bold; font-size: 15px;">
		<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
	</span>	
	
	<footer id="footer"></footer>
</div>

</body>

</html> 