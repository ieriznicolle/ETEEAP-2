<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<title> ETEEAP ACCREDITATION </title>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link href="css/index_w.css" rel="stylesheet">  
</head>

<body>
<% String user = (String) session.getAttribute("user"); %>

<div id="page-container">

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
	
	<br><br><br><br>

	<div id="settings">
		<div class="accsettings">
			<form name="form" action="settings?act=accountsettings" method="post">
				<button type="submit" value="ACCSETTINGS"><img class="imgsetting" src="img/account.png" alt="account settings"/>
				<br>Account Settings<br><i>(edit profile and change password)</i></button>
			</form>
		</div>
	</div>
	
	<footer id="footer"></footer>
</div>
</body>

</html> 