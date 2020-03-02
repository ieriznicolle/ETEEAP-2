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
<sql:setDataSource
	var="myDS"
	driver="com.mysql.jdbc.Driver"
	url = "jdbc:mysql://127.0.0.1:3306/eteeap?user=IerizNicolle&password=Onetwothree45!&useSSL=false"
/>

<sql:query var="userslist" dataSource="${myDS}">
	select * from users;
</sql:query>

<sql:query var="users" dataSource="${myDS}">
	select * from users where employee_number = '<%=request.getAttribute("emp")%>';
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
		<div id="accsettings">
			<form name="form" action="settings?act=accountsettings" method="post">
				<button type="submit" value="ACCSETTINGS"><img id="imgsetting" src="img/account.png" alt="account settings"/></button>
			</form>
		</div>
		
		<div id="a"><b>ADMIN SETTINGS</b></div>
	</div>
	
	<span style="color:#8c2f15; font-weight:bold; font-size: 15px;">
		<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
	</span>	
	
	<div id = "adset">
		<div class="foruser">
			<!-- Trigger/Open The Modal -->
			<button id="ADD">ADD</button>
			
			<!-- The Modal -->
			<div id="addmodal" class="modal">
			
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<span class="close">&times;</span>

						<form name="addform" action="settings?act=adduser" method="post">	
							<h1>ADD USER</h1>
							<div class="aed" align="center">
								<table>
									<tr>
										<td></td><td><span id="output" style="color:#8c2f15; font-size: 12px;"></span></td>
									</tr>
									<tr>
										<td>Employee Number:</td><td><input type="text" pattern="[0-9]{5}" name="empnum" maxlength="5" placeholder ="XXXXX" required onkeyup="checkExist()"/></td>
									</tr>
									<tr>
										<td>Name:</td><td><select class="name" name="pname" required>
																<option value="" disabled selected>ENGR.</option>
																<option value="DR.">DR.</option>
																<option value="ENGR.">ENGR.</option>
																<option value="PROF.">PROF.</option>
																<option value="MS.">MS.</option>
																<option value="MR.">MR.</option>
																</select>
														  <input class="name" type="text" pattern="[a-zA-Z ]+" name="fname" placeholder ="JUAN" required>
														  <input class="name" type="text" pattern="[a-zA-Z ]+" name="mname" placeholder ="KARLOS">
														  <input class="name" type="text" pattern="[a-zA-Z ]+" name="sname" placeholder ="DELA CRUZ" required></td>
									</tr>
									<tr>
										<td>Username:</td><td><input type="text" pattern="[a-zA-Z ]+" name="username" placeholder ="jkdelacruz" required onkeyup="checkExist()"/></td>
									</tr>
									<tr>
										<td>Position:</td><td><input type="text" pattern="[a-zA-Z ,/()&-]+" name="position" placeholder ="Director" required></td>
									</tr>
									<tr>
										<td>Role:</td><td><select name="role" required>
																<option value="" disabled selected>Admin/User</option>
																<option value="Admin">Admin</option>
																<option value="User">User</option>
																</select></td>
									</tr>
									<tr>
										<td>Email:</td><td><input type="email" name="email" pattern=".+@gmail.com" placeholder ="juandelacruz@gmail.com" title="Email" required onkeyup="checkExist()"/></td>
									</tr>
									<tr>
										<td>Birthday: </td><td><input type="date" name="bday" title = "Birthday" required></td>
									</tr>
									<tr>
										<td>Contact #: </td><td><input type="tel" name="contact" pattern="[0][9][0-9]{9}" maxlength="11" title="Contact Number" placeholder="09XXXXXXXXX" required onkeyup="checkExist()"/></td>
									</tr>
									<tr>
										<td>Address: </td><td><input type="text" name="address" title="Address" placeholder="Sta. Mesa, Manila" required></td>
									</tr>
								</table>
								
								<input type="submit" id="submit" value="Add" disabled="disabled"/>
								<input type="reset" value="Clear Entries"/>	
							</div>
						</form>
					</div> <br>
				</div>
			</div>
			
			<!-- Trigger/Open The Modal -->
			<button id="EDIT">EDIT</button>
			
			<!-- The Modal -->
			<div id="editmodal" class="modal">
			
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<span class="close">&times;</span>
						<h1>EDIT USER</h1>
						
						<form name="editform" action="settings?act=editusera" method="post">
							<div class="aede" align="center">
								<a>Employee number of the account you wish to edit:</a><br>
								<span id="out" style="color:#8c2f15; font-size: 12px;"></span><br>
								<input type="text" name="empnum_" pattern="[0-9]{5}" maxlength="5" placeholder ="XXXXX" required>
								<br><br>
								
								<input type="submit" value="Edit" id="EDITA"/>
								<input type="reset" value="Clear Entry"/>
							</div>
						</form>	
					</div>
				</div>
			</div>		
			
			<!-- The Modal -->
			<div id="editmodala" class="modal">
						
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<span class="close">&times;</span>
												
						<form name="form" action="settings?act=edituser" method="post">
							<h1>EDIT USER INFORMATION</h1>
							
							<%=request.getAttribute("emp")%>
							<br>
							<c:forEach var="users" items="${users.rows}">
							<a><i>${users.name}</i></a>
							<div class="aed" align="center">
								
								<table>
									<tr>
										<td>Employee Number:</td><td><input type="text" pattern="[0-9]{5}" name="empnum" maxlength="5" value="${users.employee_number}" required></td>
									</tr>
									<tr>
										<td>Username:</td><td><input type="text" pattern="[a-zA-Z ]+" name="username" value="${users.uname}" required></td>
									</tr>
									<tr>
										<td>Position:</td><td><input type="text" pattern="[a-zA-Z ,/()&-]+" name="position" value="${users.position}" required></td>
									</tr>
									<tr>
										<td>Role:</td><td><select name="role" required>
																<option value="${users.role}" selected><c:out value="${users.role}"/></option>
																<option value="Admin">Admin</option>
																<option value="User">User</option>
																</select></td>
									</tr>
								</table>
								
								<input type="hidden" name="name" value ="${users.name}"/><br>
								<input type="submit" value="Edit"/>
								<input type="reset" value="Clear Entries"/>	
							</div>			
							</c:forEach>
						</form> <br><br>			
					</div>
				</div>
			</div>					

			<!-- Trigger/Open The Modal -->
			<button id="DELETE">DELETE</button>
			
			<!-- The Modal -->
			<div id="deletemodal" class="modal">
			
				<!-- Modal content -->
				<div class="modal-content">
					<div class="modal-header">
						<span class="close">&times;</span>

						<form name="deleteform" action="settings?act=deleteuser" method="post">
							<h1>DELETE USER</h1>
							<div class="aede" align="center">
								<a>Employee number of the account you wish to delete:</a><br>
								<span id="put" style="color:#8c2f15; font-size: 12px;"></span><br>
								<input type="text" name="empnum" pattern="[0-9]{5}" maxlength="5" placeholder ="XXXXX" required>
								<br><br>
								<input type="submit" value="Delete"/>
								<input type="reset" value="Clear Entry"/>
							</div>
						</form> <br><br>
					</div>
				</div>
			</div>		
		</div>
		<br>
		
		<div class="list">
			<table id="table" class="abc">
				<thead>
				<tr>
					<th>Employee Number</th>
					<th>Username</th>
					<th>Name</th>
					<th>Role</th>
					<th>Position</th>
					<th>Contact Number</th>
					<th>Email</th>
					<th>Address</th>
					<th>Last Logged-in</th>
				</tr>
				</thead>
				<c:forEach var="user" items="${userslist.rows}">
				<tr>
					<td><c:out value="${user.employee_number}"/></td>
					<td><c:out value="${user.uname}"/></td>
					<td><c:out value="${user.name}"/></td>
					<td><c:out value="${user.role}"/></td>
					<td><c:out value="${user.position}"/></td>
					<td><c:out value="${user.contactnum}"/></td>
					<td><c:out value="${user.email}"/></td>
					<td><c:out value="${user.address}"/></td>
					<td><c:out value="${user.time}"/></td>
				</tr>
				</c:forEach>
			</table>
		</div>	
	</div>

	<footer id="footer"></footer>
</div>

<script>
	// Get the modal
	var amodal = document.getElementById("addmodal");
	var emodal = document.getElementById("editmodal");
	var modala = document.getElementById("editmodala");
	var dmodal = document.getElementById("deletemodal");
	
	// Get the button that opens the modal
	var abtn = document.getElementById("ADD");
	var ebtn = document.getElementById("EDIT");
	var btna = document.getElementById("EDITA");
	var dbtn = document.getElementById("DELETE");
	// Get the <span> element that closes the modal
	var aspan = document.getElementsByClassName("close")[0];
	var espan = document.getElementsByClassName("close")[1];
	var spana = document.getElementsByClassName("close")[2];
	var dspan = document.getElementsByClassName("close")[3];
	
	// When the user clicks the button, open the modal 
	abtn.onclick = function() {
		amodal.style.display = "block"; }
	
	ebtn.onclick = function() {
		emodal.style.display = "block"; }

		modala.style.display = "block";
	
	dbtn.onclick = function() {
		dmodal.style.display = "block"; }
	
	// When the user clicks on <span> (x), close the modal
	aspan.onclick = function() {
		amodal.style.display = "none"; }
	
	espan.onclick = function() {
		emodal.style.display = "none"; }
	
	spana.onclick = function() {
		modala.style.display = "none"; }
	
	dspan.onclick = function() {
		dmodal.style.display = "none"; }
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == amodal || event.target == emodal || event.target == modala || event.target == dmodal) {
			amodal.style.display = "none";
	    	emodal.style.display = "none";
	    	modala.style.display = "none";
	    	dmodal.style.display = "none";
	  	}
	}
	
	function checkExist() {
		var xmlhttp = new XMLHttpRequest();
        var empnum = document.forms["addform"]["empnum"].value;
        var username = document.forms["addform"]["username"].value;
        var email = document.forms["addform"]["email"].value;
        var contact = document.forms["addform"]["contact"].value;
        
        var url = "checkExist.jsp?empnum=" + empnum +
        			"&username=" + username +
        			"&email=" + email +
        			"&contact=" + contact;
        
        xmlhttp.onreadystatechange = function() {
            if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            	document.getElementById("output").innerHTML = xmlhttp.responseText;
            }  
		};
        
		try {
			xmlhttp.open("GET", url, true);
			xmlhttp.send(); }
		
		catch(e) {
			alert("unable to connect to server"); }
	}
	
	function check() {
		var xmlhttp = new XMLHttpRequest();
        var empnum_ = document.forms["editform"]["empnum_"].value;
        var empnum = document.forms["deleteform"]["empnum"].value;
        
        var url = "check.jsp?empnum_=" + empnum_ +
        			"&empnum=" + empnum;
        
        xmlhttp.onreadystatechange = function() {
            if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            	document.getElementById("out").innerHTML = xmlhttp.responseText;
            	document.getElementById("put").innerHTML = xmlhttp.responseText;
            }  
		};
        
		try {
			xmlhttp.open("GET", url, true);
			xmlhttp.send(); }
		
		catch(e) {
			alert("unable to connect to server"); }
	}
</script>

</body>

</html> 