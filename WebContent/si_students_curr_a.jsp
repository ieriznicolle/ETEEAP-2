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

<!-- ASSESS -->
<sql:query var="assess" dataSource="${myDS}"> 
	select * from assess where appnum = '<%=request.getAttribute("appnum")%>';
</sql:query>

<!-- ASSESSORS -->
<sql:query var="assessors" dataSource="${myDS}"> 
	select * from users;
</sql:query>

<!-- PERSONAL DETAILS -->
<sql:query var="applicant" dataSource="${myDS}"> 
	select * from applicants where a_appnum = '<%=request.getAttribute("appnum")%>';
</sql:query>

<!-- COURSE -->
<sql:query var="course" dataSource="${myDS}"> 
	select * from courses where course = '<%=request.getAttribute("course")%>';
</sql:query>

<!-- DISPLAY NUNG DETAILS NG FORM -->
<sql:query var="grades" dataSource="${myDS}"> 
	SELECT code, title, units, tuition, course, g_compet, g_evidence, g_cct, g_grade, g_units, g_remarks
	FROM eteeap.courses
	INNER JOIN eteeap.grades
	ON eteeap.grades.g_num=eteeap.courses.g_num
	AND eteeap.grades.g_pcode=eteeap.courses.course
	WHERE eteeap.grades.g_appnum= <%=request.getAttribute("appnum")%>;
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
		<div id="stpersonal">
			<form name="form" action="studentdetails?page=personal&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
				<button type="submit" value="PERSONAL"><img id="imgsetting" src="img/form.png" alt="Personal Details"/></button>
				<input type="hidden" name="appnum" value ="${user.a_appnum}"/><br>
			</form>
		</div>
		&nbsp;
		<div id="stchecklist">
			<form name="form" action="studentdetails?page=checklist&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
				<button type="submit" value="CHECKLIST"><img id="imgsetting" src="img/checklist.png" alt="Checklist"/></button>
				<input type="hidden" name="appnum" value ="${user.a_appnum}"/><br>
			</form>
		</div>
	
		<div id="a"><b>STUDENT'S ACCREDITATION FORM</b></div>
	</div>
	</c:forEach>
	
	<br>
	<div class="coursecurr" id="content">
		<h1>Equivalency and Accreditation Form</h1>
		<br>
		
		<c:forEach var="user" items="${applicant.rows}">
		<table class="pda">
			<tr>
				<td style="font-size: 14px; color: #233185;">Program Applied</td>
				<td colspan=3><b><c:out value="${user.a_papplied}"/></b></td>
				<td style="font-size: 14px; color: #233185;">Application Date</td>
				<td><b><c:out value="${user.a_date}"/></b></td>
			</tr>
			<tr>
				<td style="font-size: 14px; color: #233185;">Applicant's Name</td>
				<td colspan=5><b><c:out value="${user.a_name}"/></b></td>
			</tr>
			<tr>
				<td style="font-size: 14px; color: #233185;">Contact Details</td>
				<td><b><c:out value="${user.a_pnumber}"/></b></td>
				<td><b><c:out value="${user.a_mnumber}"/></b></td>
				<td colspan=3><b><c:out value="${user.a_email}"/></b></td>
			</tr>
			<tr>
				<td style="font-size: 14px; color: #233185;">Highest Earned Degree</td>
				<td><b><c:out value="${user.a_hdegree}"/></b></td>
				<td style="font-size: 14px; color: #233185;">Last School Attended</td>
				<td><b><c:out value="${user.a_lastschool}"/></b></td>
				<td style="font-size: 14px; color: #233185;">Year</td>
				<td><b><c:out value="${user.a_year}"/></b></td>
			</tr>
		</table>
		</c:forEach>
		<br><br>
		
		<div class=idk>
		<form name="form" action="students?act=curriculum" method="post">
			<table class="pd">
				<tr>
					<th colspan=3>CURRICULUM</th>
					<th colspan=3>EQUIVALENCY</th>
					<th colspan=3>ACCREDITATION OF FORMAL LEARNING</th>
					<th colspan=2>REMARKS</th>
				</tr>
				<tr>
					<th width="75px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Code</th>
					<th width="200px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Course Title</th>
					<th width="40px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Units</th>
					<th width="40px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Tuition Hour</th>
					<th width="110px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Competency Demonstrated</th>
					<th width="90px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Evidence</th>
					<th width="100px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Code / Course Title</th>
					<th width="50px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Grade</th>
					<th width="50px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Units</th>
					<th width="45px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						Credited</th>
					<th width="45px" style="text-decoration: none; padding: 5px; background-color: #586A8F; font-weight: normal">
						To be Taken</th>
				</tr>
				<c:forEach var="grades" items="${grades.rows}">
				<tr>
					<td style="text-align: left;"><c:out value="${grades.code}"/></td>
					<td style="text-align: left;"><c:out value="${grades.title}"/></td>
					<td class="c_units"><c:out value="${grades.units}"/></td>
					<td class="c_hours"><c:out value="${grades.tuition}"/></td>				
					<td><textarea class="cd" name="cd" maxlength="1000" rows="2" cols="20"><c:out value="${grades.g_compet}"/></textarea></td>
					<td><select class="evidence" name="evidence">
							<option value="${grades.g_evidence}" selected><c:out value="${grades.g_evidence}"/></option>
							<option value="Company Position">Company Position</option>
							<option value="Business Nature">Business Nature</option>
							<option value="Job Description">Job Description</option>
							<option value="Work Experience">Work Experience</option>
							<option value="Projects">Projects</option>
							<option value="Outputs">Outputs</option>
							<option value="Production">Production</option>
							<option value="Authorship">Authorship</option>
							<option value="Professional Organizations">Professional Organizations</option>
							<option value="Skills">Skills</option>
							<option value="Trainings">Trainings</option>
							<option value="Seminars">Seminars</option>
							<option value="Conferences">Conferences</option>
							<option value="Interview">Interview</option>
							<option value="Aptitude Test">Aptitude Test</option>
							<option value="Functions">Functions</option>
							</select></td>										
					<td><input type="text" class="cct" name="cct" size="15" value="${grades.g_cct}"/></td>
					<td><input type="text" class="grade" name="grade" size="4" maxlength="4" value="${grades.g_grade}"/></td>
					<td><input type="text" class="units" pattern="[0-9]+" name="units" size="2" maxlength="2" value="${grades.g_units}"/></td>
					<td><input type="radio" class="credited" name="remarks" value="credited"/></td>
					<td><input type="radio" class="tbtaken" name="remarks" value="to be taken"/></td>
				</tr>
				<input type="hidden" class="remark" name="remark" value="${grades.g_remarks}"/>
				</c:forEach>
					
				<tr>
					<td colspan=2 style="text-align: right;">Total number of units:</td>
					<td id="units"></td>
					<td id="hours"></td>
					<td colspan=7></td>
				</tr>
				<tr>
					<td colspan=9 style="text-align: right;">Total number of credited subjects:</td>
					<td id="cred"></td>
					<td></td>
				</tr>	
				<tr>
					<td colspan=9 style="text-align: right;">Total number of subjects to be taken:</td>
					<td></td>
					<td id="subj"></td>
				</tr>	
			</table>
			<br><br>
			<table class="assess" style="display: inline-block;">
				<c:forEach var="assess" items="${assess.rows}">
				<tr>
					<td>Assessed by:</td>
					<td><select class="assessor" name="assessor">
							<option value="${assess.assessor}" selected><c:out value="${assess.assessor}"/></option>
							<c:forEach var="a" items="${assessors.rows}">
								<option value="${a.name}"><c:out value="${a.name}"/></option>
							</c:forEach>
							<option value=" "> </option>
							</select></td>
					<td>Signature:</td>
					<td>_____________________</td>
					<td>Date:</td>
					<td><input type="date" class="assessed" value="${assess.date}" name="assessed"/></td>
				</tr>
				<tr></tr>
				</c:forEach>
			</table>
			
			<br><br>
			<input type="hidden" id="length" name="length" value="1"/>
			<input type="hidden" name="appnum" value="<%=request.getAttribute("appnum")%>"/>			
			<input type="hidden" name="pcode" value="<%=request.getAttribute("course")%>"/>
			<input type="submit" value="Update"/>
			<input type="reset" value="Revert"/>
		</form>
		<br>
		<form action="NewFile.jsp" target="_blank" method="POST">
			<input type="hidden" id="length" name="length" value="1"/>
			<input type="hidden" name="appnum" value="<%=request.getAttribute("appnum")%>"/>			
			<input type="hidden" name="pcode" value="<%=request.getAttribute("course")%>"/>
			<input type="submit" value="See PDF File"/>
		</form>
		</div>
	</div>

	<br>
	<div id="elementH"></div>
	<footer id="footer"></footer>
</div>

<script>
	var cd = document.getElementsByClassName("cd");
	var evidence = document.getElementsByClassName("evidence");
	var cct = document.getElementsByClassName("cct");
	var grade = document.getElementsByClassName("grade");
	var units = document.getElementsByClassName("units");
	var credited = document.getElementsByClassName("credited");
	var tbtaken = document.getElementsByClassName("tbtaken");
	var rem = document.getElementsByClassName("remark");
	var c_units = document.getElementsByClassName("c_units");
	var c_hours = document.getElementsByClassName("c_hours");
	var i, r, o;
	var cu_units = 0;
	var ch_hours = 0;
	var cr = 0;
	var tb = 0;
	document.getElementById("length").value = cd.length;
	
	for (i = 0; i < cd.length; i++) {
		cd[i].setAttribute("name", "cd"+i);
		evidence[i].setAttribute("name", "evidence"+i);
		cct[i].setAttribute("name", "cct"+i);
		grade[i].setAttribute("name", "grade"+i);
		units[i].setAttribute("name", "units"+i);
		credited[i].setAttribute("name", "remarks"+i);
		tbtaken[i].setAttribute("name", "remarks"+i);
		rem[i].setAttribute("name", "remark"+i);
		
		if (rem[i].value == 'credited') {
			document.getElementsByName("remarks"+i)[0].setAttribute("checked", "");
			cr = cr + 1;
		}
			
		else if (rem[i].value == 'to be taken') {
			document.getElementsByName("remarks"+i)[1].setAttribute("checked", "");
			tb = tb + 1;
		}
		
		if(evidence[i].value == 'null') {
			evidence[i].value = "Evidence";
		}
		
		cu_units = cu_units + parseInt(c_units[i].innerHTML);
		ch_hours = ch_hours + parseInt(c_hours[i].innerHTML);
	}
	
	document.getElementById("units").innerHTML = cu_units;
	document.getElementById("hours").innerHTML = ch_hours;
	document.getElementById("cred").innerHTML = cr;
	document.getElementById("subj").innerHTML = tb;
	
	
	var assessor = document.getElementsByClassName("assessor");
	var assessed = document.getElementsByClassName("assessed");
	
	for (o = 0; o < 3; o++)
	{
		assessor[o].setAttribute("name", "assessor"+o);
		assessed[o].setAttribute("name", "assessed"+o);		
	}
</script>
</body>

</html> 