<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<title> ETEEAP </title>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link href="css/index_w.css" rel="stylesheet">  
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

<sql:query var="users" dataSource="${myDS}">
	select * from users where uname = '<%=uname%>';
</sql:query>

<div id="page-container">
	<div id="navigation">
		<!-- TOP NAVIGATION -->
		<div id="mainnav" class="topnav">
			<form name="form" action="account?page=signout" method="post">
				<button type="submit" value="SIGN-OUT">SIGN-OUT</button>
			</form>
			<form name="form" action="account?page=settings" method="post">
				<button class="active" type="submit" value="SETTINGS">SETTINGS</button>
			</form>
			<form name="form" action="account?page=profile" method="post">
				<button type="submit" value="PROFILE">PROFILE</button>
			</form>
			<form name="form" action="account?page=students" method="post">
				<button type="submit" value="STUDENTS">STUDENTS</button>
			</form>
			<form name="form" action="account?page=home" method="post">
				<button type="submit" value="HOME">HOME</button>
			</form>
		</div>
	</div>
	
	<div id="setting">	
		<div id="a"><b>ACCOUNT SETTINGS</b></div>
	</div>
			
	<div id="accset">
		<div class="editprofile">
			<form name="form" action="settings?act=editprofile" method="post">
				<a>Edit Profile</a><br>
				
				<c:forEach var="user" items="${users.rows}">
				<div class="s_table" align="center">
					<span style="color:#8c2f15; font-weight:bold; font-size: 12px;">
						<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
					</span>	
					<table>
						<tr>
							<td width="110px">Name: </td><td width="400px">
							<select class="name" name="pname" required>
								<option value="${user.pname}" selected><c:out value="${user.pname}"/></option>
								<option value="DR.">DR.</option>
								<option value="ENGR.">ENGR.</option>
								<option value="PROF.">PROF.</option>
								<option value="MS.">MS.</option>
								<option value="MR.">MR.</option>
								</select>
							<input class="name" type="text" pattern="[a-zA-Z ]+" name="fname" title="First Name" value="${user.fname}" required>
							<input class="name" type="text" pattern="[a-zA-Z ]+" name="mname" title="Middle Name" value="${user.mname}">
							<input class="name" type="text" pattern="[a-zA-Z ]+" name="sname" title="Surname" value="${user.sname}" required></td>
						</tr>
						<tr>
							<td></td><td></td>
						</tr>
						<tr>
							<td>Birthday: </td><td><input type="date" name="bday" title="Birthday" value="${user.birthday}" required></td>
						</tr>
						<tr>
							<td>Contact #: </td><td><input type="tel" name="contact" pattern="[0][9][0-9]{9}" maxlength="11" title="Contact Number" value="${user.contactnum}" required></td>
						</tr>
						<tr>
							<td>Address: </td><td><input type="text" name="address" title="Address" value="${user.address}" required></td>
						</tr>
						<tr>
							<td>Email: </td><td><input type="email" name="email" pattern=".+@gmail.com" title="Email" value="${user.email}" required></td>
						</tr>
					</table>
				</div>
				</c:forEach>
				
				<br>
				<input type="submit" value="Submit"/>
				<input type="reset" value="Clear Entries"/>
			</form>
		</div>
		&nbsp;
		<div class="changepw">
			<form name="form" action="settings?act=changepw" method="post">
				<a>Change Password</a><br><br><br>
				
				<div class="s_table" align="center">
					<table>
						<tr>
							<td>Old Password: </td><td width="300px"><input type="password"  name="password" placeholder ="Old Password" required></td>
						</tr>
						<tr>
							<td></td><td></td>
						</tr>
						<tr>
							<td>New Password: </td><td><input type="password"  name="npw" placeholder = "New Password" pattern=".{8,}" title="minimum of 8 characters" required></td>
						</tr>
						<tr>
							<td></td><td></td>
						</tr>
						<tr>
							<td>Retype New Password: </td><td><input type="password"  name="rpw" placeholder ="Retype New Password" pattern=".{8,}" title="minimum of 8 characters" required></td>
						</tr>
						<tr>
							<td colspan=2 style="font-size: 12px; color: #B14444;"><i>*You will be logged out from your account for the changes to be made.</i></td>
						</tr>
					</table>
				</div>
				<br>
				<span style="color:#8c2f15; font-weight:bold; font-size: 12px;">
					<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
				</span>
				<input type="submit" value="Submit"/>
				<input type="reset" value="Clear Entries"/>
			</form>
		</div>
	</div>

	
	<footer id="footer"></footer>
</div>
</body>

</html> 