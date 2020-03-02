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

<sql:query var="app" dataSource="${myDS}">
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
	<br><br><br><br>

	<div id="students">
		<div id="cover">
			<input type="text" id="input" placeholder="Search" onkeyup="search()">
		</div>
		<br>	
	</div>
		
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

						<form name="form" action="students?act=addstudent" method="post">	
							<h1>ADD STUDENT</h1>
							<div class="aedd" align="center">
								<table>
									<tr>
										<td>Name:</td><td><input class="name" type="text" pattern="[a-zA-Z ]+" name="fname" placeholder ="JUAN" required>
														  <input class="name" type="text" pattern="[a-zA-Z ]+" name="mname" placeholder ="KARLOS">
														  <input class="name" type="text" pattern="[a-zA-Z ]+" name="sname" placeholder ="DELA CRUZ" required></td>
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
										<td>Email:</td><td><input type="email" name="email" pattern=".+@gmail.com" placeholder ="juandelacruz@gmail.com" title="Email" required></td>
									</tr>
									<tr>
										<td>Highest Degree Earned: </td><td><select name="degree" required>
																<option value="" disabled selected>Degree</option>
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
								</table>
								<br>
								<input type="submit" value="Add"/>
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
						<h1>EDIT STUDENT</h1>
						
						<form name="editform" action="students?act=editstudenta" method="post">
							<div class="aede" align="center">
								<a>Application number of the student you wish to edit:</a><br>
								<span id="out" style="color:#8c2f15; font-size: 12px;"></span><br>
								<input type="text" name="appnum_" pattern="[0-9]+" maxlength="3" placeholder ="XXX" required onkeyup="check_s()"/>
								<br><br>
								
								<input type="submit" value="Edit" id="EDITA" disabled/>
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
												
						<form name="form" action="students?act=editstudent" method="post">
							<h1>EDIT USER INFORMATION</h1>
							
							<c:forEach var="app" items="${app.rows}">
							<a><i>${app.a_name}</i></a>
							<div class="aed" align="center">
								
								<table>
									<tr>
										<td>Name:</td><td><input class="name" pattern="[a-zA-Z ]+" type="text" value="${app.a_fname}"  name="fname" required>
														  <input class="name" pattern="[a-zA-Z ]+" type="text" value="${app.a_mname}" name="mname">
														  <input class="name" pattern="[a-zA-Z ]+" type="text" value="${app.a_sname}" name="sname" required></td>
									</tr>
									<tr>
										<td>Telephone Number: </td><td><input type="tel" value="${app.a_pnumber}" name="pnum" pattern="[0-9]{7}" maxlength="7" title="Telephone Number"></td>
									</tr>
									<tr>
										<td>Cellphone Number: </td><td><input type="tel" value="${app.a_mnumber}" name="mnum" pattern="[0][9][0-9]{9}" maxlength="11" title="Contact Number" required></td>
									</tr>
									<tr>
										<td>Email:</td><td><input type="email" value="${app.a_email}" name="email" pattern=".+@gmail.com" placeholder ="juandelacruz@gmail.com" title="Email" required></td>
									</tr>
									<tr>
										<td>Highest Degree Earned: </td><td><select name="degree" required>
																<option value="${app.a_hdegree}" selected><c:out value="${app.a_hdegree}"/></option>
																<option value="Undergraduate">Undergraduate</option>
																<option value="Associate">Associate</option>
																<option value="Bachelor">Bachelor</option>
																<option value="Master">Master</option>
																<option value="Doctorate">Doctorate</option>
																</select></td>
									</tr>
									<tr>
										<td>Last School: </td><td><input type="text" pattern="[a-zA-Z ]+" value="${app.a_lastschool}" name="school" title="Last School" required></td>
									</tr>
									<tr>
										<td>Year: </td><td><input type="text" value="${app.a_year}" pattern="[0-9]{4}" name="year" maxlength="4" title="Year" required></td>
									</tr>
								</table>
								
								<input type="hidden" name="appnumber" value ="${app.a_appnum}"/><br>
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

						<form name="deleteform" action="students?act=deletestudent" method="post">
							<h1>DELETE STUDENT</h1>
							<div class="aede" align="center">
								<a>Application number of the student you wish to delete:</a><br>
								<span id="put" style="color:#8c2f15; font-size: 12px;"></span><br>
								<input type="text" name="appnum" pattern="[0-9]+" maxlength="3" placeholder ="XXX" required onkeyup="check_s()"/>
								<br><br>
								<input type="submit" value="Delete" id="deleteform" disabled/>
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
				<tr>
					<th width="110px">Application #</th>
					<th width="300px">Name</th>
					<th width="700px">Program Applied</th>
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
				</tr>
				</c:forEach>
			</table>
		</div>	
	</div>

	<br>
	
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
			
			if (filter == null || filter == '') {
				table.style.display = "none";
			}
			
			else if (found) {
				table.style.display = "";
				tr[i].style.display = "";
				found = false;
			}
			
			else {
				tr[i].style.display = "none";
			}
		}
	}
	
	function check_s() {
		var xmlhttp = new XMLHttpRequest();
        var appnum_ = document.forms["editform"]["appnum_"].value;
        var appnum = document.forms["deleteform"]["appnum"].value;
        
        var url = "check_s.jsp?appnum_=" + appnum_ +
        			"&appnum=" + appnum;
        
        xmlhttp.onreadystatechange = function() {
        	 if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        		if (xmlhttp.responseText != "Application number not found.") {
             		document.getElementById("EDITA").removeAttribute("disabled");
 					document.getElementById("deleteform").removeAttribute("disabled");
             	} 

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
	
	
	// wag idisplay yung buttons sa modal
	abtn.style.display = "none";
	ebtn.style.display = "none";
	dbtn.style.display = "none";
</script>

</body>

</html> 