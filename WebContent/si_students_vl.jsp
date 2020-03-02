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

<sql:query var="applicants" dataSource="${myDS}">
	select * from applicants;
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
	<br><br><br><br>

	<div id="students">
		<div id="cover">
			<input type="text" id="input" placeholder="Search" onkeyup="search()">
		</div>
		<span style="color:#8c2f15; font-weight:bold; font-size: 12px;">
			<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
		</span>	
	</div>	

	<br>
	<div class="lista">
		<table id="table" class="abc">
			<tr>
				<th>Application #</th>
				<th>Name</th>
				<th>Program Applied</th>
				<th>Date Applied</th>
				<th>Phone #</th>
				<th>Mobile #</th>
				<th>Email</th>
				<th>Highest Earned Degree</th>
				<th>Last School Attended</th>
				<th>Year</th>
			</tr>
			<c:forEach var="user" items="${applicants.rows}">
			<tr class="row">
				<td><c:out value="${user.a_appnum}"/></td>
				<td>
					<form name="form" action="studentdetails?page=front&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
						<button type="submit" value="${user.a_appnum}"><c:out value="${user.a_name}"/></button>
						<input type="hidden" name="appnum" value ="${user.a_appnum}"/>
					</form>
				</td>
				<td><c:out value="${user.a_papplied}"/></td>
				<td><c:out value="${user.a_date}"/></td>
				<td><c:out value="${user.a_pnumber}"/></td>
				<td><c:out value="${user.a_mnumber}"/></td>
				<td><c:out value="${user.a_email}"/></td>
				<td><c:out value="${user.a_hdegree}"/></td>
				<td><c:out value="${user.a_lastschool}"/></td>
				<td><c:out value="${user.a_year}"/></td>
			</tr>
			</c:forEach>
		</table>
	</div>			
	<br>
	
	<footer id="footer"></footer>
</div>

<script>
	function search() {
		var input, filter, found, table, tr, td, i, j;
		
		input = document.getElementById("input");
		filter = input.value.toUpperCase();
		table = document.getElementById("table");
		tr = table.getElementsByTagName("tr");
		
		for (i=1; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td");
			
			for (j=0; j < td.length; j++) {
				if (td[j].innerHTML.toUpperCase().indexOf(filter) > -1) {
					found = true;
				}
			}
			
			if (found) {
				tr[i].style.display = "";
				found = false;
			}
			
			else {
				tr[i].style.display = "none";
			}
		}
	}
</script>

</body>

</html> 