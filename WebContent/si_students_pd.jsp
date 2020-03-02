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
	<div id="navigation">
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
	</div>
	
	<c:forEach var="user" items="${applicant.rows}">
	<div id="setting">
		<div id="stchecklist">
			<form name="form" action="studentdetails?page=checklist&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
				<button type="submit" value="CHECKLIST"><img id="imgsetting" src="img/checklist.png" alt="Checklist"/></button>
				<input type="hidden" name="appnum" value ="${user.a_appnum}"/><br>
			</form>
		</div>
		&nbsp;
		<div id="stform">
			<form name="form" action="studentdetails?page=form&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
				<button type="submit" value="FORM"><img id="imgsetting" src="img/curriculum.png" alt="Form"/></button>
				<input type="hidden" name="appnum" value ="${user.a_appnum}"/><br>
			</form>
		</div>
	
		<div id="a"><b>STUDENT'S PERSONAL DETAILS</b></div>
	</div>
	
	<div class="hatdog">
		<table class="pdaa">
			<tr>
				<td style="font-size: 14px; color: #233185;">Program Applied</td>
				<td colspan=3><c:out value="${user.a_papplied}"/></td>
				<td style="font-size: 14px; color: #233185;">Application Date</td>
				<td><c:out value="${user.a_date}"/></td>
			</tr>
			<tr>
				<td style="font-size: 14px; color: #233185;">Applicant's Name</td>
				<td colspan=5><c:out value="${user.a_name}"/></td>
			</tr>
			<tr>
				<td style="font-size: 14px; color: #233185;">Contact Details</td>
				<td><c:out value="${user.a_pnumber}"/></td>
				<td><c:out value="${user.a_mnumber}"/></td>
				<td colspan=3><c:out value="${user.a_email}"/></td>
			</tr>
			<tr>
				<td style="font-size: 14px; color: #233185;">Highest Earned Degree</td>
				<td><c:out value="${user.a_hdegree}"/></td>
				<td style="font-size: 14px; color: #233185;">Last School Attended</td>
				<td><c:out value="${user.a_lastschool}"/></td>
				<td style="font-size: 14px; color: #233185;">Year</td>
				<td><c:out value="${user.a_year}"/></td>
			</tr>
		</table>
	</div>
	</c:forEach>
		
	<footer id="footer"></footer>
</div>

</body>

</html> 