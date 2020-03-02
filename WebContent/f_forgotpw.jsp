<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<title> ETEEAP </title>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link href="css/index.css" rel="stylesheet">  
 	<script>
	function validate()
	{
		var username = document.form.username.value;
		var password = document.form.password.value;
		 
		if (username==null || username=="")
		{
			alert("Username cannot be blank");
			return false;
		}
		
		else if(password==null || password=="")
		{
			alert("Password cannot be blank");
			return false;
		}
	}
	</script>
</head>

<body>
<div id="page-container">
	<!-- TOP NAVIGATION -->
	<div id="mainnav" class="topnav">
		<form name="form" action="eteeap?epage=sign-in" method="post">
			<button class="active" type="submit" value="SIGN-IN">SIGN-IN</button>
		</form>
		<form name="form" action="eteeap?epage=apply" method="post">
			<button type="submit" value="APPLY">APPLY</button>
		</form>
		<form name="form" action="eteeap?epage=home" method="post">
			<button type="submit" value="HOME">HOME</button>
		</form>
	</div>
	
	<br><br><br><br><br><br>
	
	<div class="forgotpw">
	    <h1>Forgot your password?</h1>
		<h2>Please enter your username and e-mail<br>to request a password reset.</h2>
			
		<div id = form1>
			<form name="form" action="login?action=forgotpw" method="post" onsubmit="return validate()">
			
				<span style="color:#8c2f15; font-weight:bold; font-size: 15px;">
					<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
				</span>
				
				Username: <br><input type="text"  name="username" placeholder ="Username" required> <br><br>
				E-mail: <br><input type="email"  name="email" placeholder ="E-mail" required> <br><br>
					
				<input type="submit" value="Submit"/>
				<input type="reset" value="Clear Entries"/> <br><br>
			</form>
		</div>
	</div>
	
	<footer id="footer"></footer>
</div>
</body>

</html> 