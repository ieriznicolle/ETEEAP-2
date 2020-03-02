<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 
<html>
<head>
<title> ETEEAP </title>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
 	<link href="css/login.css" rel="stylesheet"/> 
</head>

<body>
<div id="page-container">
	<div id="content-wrap">
		<!-- TOP NAVIGATION -->
		<div id="mainnav" class="topnav">
			<form name="form" action="eteeap?epage=sign-in" method="post">
				<button class="active" type="submit" value="SIGN-IN">SIGN-IN</button>
			</form>
			<form name="form" action="eteeap?epage=apply" method="post">
				<button type="submit" value="APPLY">APPLY</button>
			</form>
			<form name="form" action="eteeap?epage=offerings" method="post">
				<button type="submit" value="OFFERINGS">OFFERINGS</button>
			</form>
			<form name="form" action="eteeap?epage=home" method="post">
				<button type="submit" value="HOME">HOME</button>
			</form>
		</div>
		
		<div class="signinbg">
			<div class="signin">
			    <h1>User Authentication</h1>
				<h2>Please sign-in using your username and password.</h2>
				
				<div id = form1>
					<form name="form" action="login?action=login" method="post" onsubmit="return validate()">
					<br>
						<span style="color:#8c2f15; font-weight:bold; font-size: 15px;">
							<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
						</span>
						
						Username: <input type="text"  name="username" placeholder ="Username" required> <br><br>
						Password: <input type="password"  name="password" placeholder ="Password" required> <br><br>
						
						<input type="submit" value="Login"/>
						<input type="reset" value="Clear Entries"/> <br><br>
					</form>
				</div>
					
				<div id = form2>
					<form name="form" action="eteeap?epage=forgotpw" method="post">
					<br>
						&nbsp;&nbsp;&nbsp;&nbsp;Forgot your password?
					
					<button type="submit" value="Click here.">Click here.</button> <br><br>
					</form>
				</div>
			</div>
		</div>
	</div>
	<footer id="footer"></footer>
</div>
</body>
</html> 