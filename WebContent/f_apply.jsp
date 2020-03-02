<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>
<title> ETEEAP </title>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 	<link href="css/index.css" rel="stylesheet"> 
 	
 	<style>
		.slide {
			display: none; }
			
		.left, .right, .slidebutton {
			cursor: pointer; }
			
		.slidebutton {
			height: 13px;
			width: 13px;
			padding: 0; }
	</style> 
</head>

<body>
<div id="page-container">
	<!-- TOP NAVIGATION -->
	<div id="mainnav" class="topnav">
		<form name="form" action="eteeap?epage=sign-in" method="post">
			<button type="submit" value="SIGN-IN">SIGN-IN</button>
		</form>
		<form name="form" action="eteeap?epage=apply" method="post">
			<button class="active" type="submit" value="APPLY">APPLY</button>
		</form>
		<form name="form" action="eteeap?epage=offerings" method="post">
			<button type="submit" value="OFFERINGS">OFFERINGS</button>
		</form>
		<form name="form" action="eteeap?epage=home" method="post">
			<button type="submit" value="HOME">HOME</button>
		</form>
	</div>
	<br><br><br><br>
	
	<div id="content">
		<form name="form" action="eteeap?epage=studentapply" method="post">	
			<h1 style="margin: 0;">APPLY</h1>
		
			<div class="aed" align="center">
				<table>
					<tr>
						<td colspan=2 style="text-align: center;"><span style="color:#8c2f15; font-weight:bold; font-size: 15px;">
										<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br><br>
									</span>
						</td>
					</tr>
					<tr>
						<td>Name:</td><td><input class="name" pattern="[a-zA-Z ]+" type="text" name="fname" placeholder ="JUAN" required>
							  			  <input class="name" pattern="[a-zA-Z ]+" type="text"  name="mname" placeholder ="KARLOS">
										  <input class="name" pattern="[a-zA-Z ]+" type="text"  name="sname" placeholder ="DELA CRUZ" required></td>
					</tr>
					<tr>
						<td>Program Applied:</td><td><select name="course" required>
										<option value="" disabled selected>Course</option>
										<option value="Bachelor of Arts in Broadcast Communication">Bachelor of Arts in Broadcast Communication</option>
										<option value="Bachelor in Advertising and Public Relations">Bachelor in Advertising and Public Relations</option>
										<option value="Batsilyer ng Artes sa Filipinolohiya">Batsilyer ng Artes sa Filipinolohiya</option>
										<option value="Bachelor of Arts in Journalism">Bachelor of Arts in Journalism</option>
										<option value="Bachelor in Banking and Finance">Bachelor in Banking and Finance</option>
										<option value="Bachelor in Public Administration">Bachelor in Public Administration</option>
										<option value="Bachelor in Political Science">Bachelor in Political Science</option>
										<option value="Bachelor of Science in Business Administration major in Human Resource Development Management">Bachelor of Science in Business Administration major in Human Resource Development Management</option>
										<option value="Bachelor of Science in Business Administration major in Marketing Management">Bachelor of Science in Business Administration major in Marketing Management</option>
										<option value="Bachelor of Science in Computer Engineering">Bachelor of Science in Computer Engineering</option>
										<option value="Bachelor of Science in Computer Science">Bachelor of Science in Computer Science</option>
										<option value="Bachelor of Science in Entrepreneurship">Bachelor of Science in Entrepreneurship</option>
										<option value="Bachelor of Science in Hospitality Management">Bachelor of Science in Hospitality Management</option>
										<option value="Bachelor of Science in Industrial Engineering">Bachelor of Science in Industrial Engineering</option>
										<option value="Bachelor of Science in Information Technology">Bachelor of Science in Information Technology</option>
										<option value="Bachelor of Science in Office Administration major in Corporate Transcription">Bachelor of Science in Office Administration major in Corporate Transcription</option>
										<option value="Bachelor of Science in Office Administration major in Legal Transcription">Bachelor of Science in Office Administration major in Legal Transcription</option>
										<option value="Bachelor of Science in Office Administration major in Medical Transcription">Bachelor of Science in Office Administration major in Medical Transcription</option>
										<option value="Bachelor of Science in Sociology">Bachelor of Science in Sociology</option>
										<option value="Bachelor of Science in Tourism Management">Bachelor of Science in Tourism Management</option>
										</select></td>
					</tr>
					<tr>
						<td>Telephone Number: </td><td><input type="tel" name="pnum" pattern="[0-9]{7}" maxlength="7" title="Telephone Number" placeholder="XXXXXXX"></td>
					</tr>
					<tr>
						<td>Cellphone Number: </td><td><input type="tel" name="mnum" pattern="[0][9][0-9]{9}" maxlength="11" title="Contact Number" placeholder="09XXXXXXXXX" required></td>
					</tr>
					<tr>
						<td>Email:</td><td><input type="email"  name="email" pattern=".+@gmail.com" placeholder ="juandelacruz@gmail.com" title="Email" required></td>
					</tr>
					<tr>
						<td>Highest Degree Earned: </td><td><select name="degree" required>
										<option value=" " disabled selected>Degree</option>
										<option value="Undergraduate">Undergraduate</option>
										<option value="Associate">Associate</option>
										<option value="Bachelor">Bachelor</option>
										<option value="Master">Master</option>
										<option value="Doctorate">Doctorate</option>
										</select></td>
					</tr>
					<tr>
						<td>Last School: </td><td><input type="text" pattern="[a-zA-Z ]+" name="school" title="Last School" placeholder="Polytechnic University of the Philippines" required></td>
					</tr>
					<tr>
						<td>Year: </td><td><input type="text" pattern="[0-9]{4}" name="year" maxlength="4" title="Year" placeholder="20XX" required></td>
					</tr>
					<tr>
						<td colspan=2><br><input type="checkbox" required>I agree to the terms and Conditions(<a href="https://www.privacy.gov.ph/data-privacy-act/" target="_blank">Data Privacy Act</a>)</td>
					</tr>
				</table>
				<br>		
				<input type="submit" value="Submit"/>
				<input type="reset" value="Clear Entries"/>	
			</div>
		</form>
	</div> <br>	
	<footer id="footer"></footer>
</div>

<script>

</script>
</body>

</html> 