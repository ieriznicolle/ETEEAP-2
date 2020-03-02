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

<sql:query var="aclist" dataSource="${myDS}">
	select * from checklist where a_appnum = '<%=request.getAttribute("appnum")%>';
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
		<div id="stform">
			<form name="form" action="studentdetails?page=form&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
				<button type="submit" value="FORM"><img id="imgsetting" src="img/curriculum.png" alt="Form"/></button>
				<input type="hidden" name="appnum" value ="${user.a_appnum}"/><br>
			</form>
		</div>
		&nbsp;
		<div id="stpersonal">
			<form name="form" action="studentdetails?page=personal&appnum=${user.a_appnum}&course=${user.a_pcode}" method="post">
				<button type="submit" value="PERSONAL"><img id="imgsetting" src="img/form.png" alt="Personal Details"/></button>
				<input type="hidden" name="appnum" value ="${user.a_appnum}"/><br>
			</form>
		</div>
	
		<div id="a"><b>STUDENT'S CHECKLIST</b></div>
	</div>
	</c:forEach>
	
	<div class="students-cl">
		<h2>Checklist of Documents</h2>
		<h3>NTSP / ETEEAP</h3>
		<br>
		<c:forEach var="user" items="${applicant.rows}">
			<table class="personaltable">
				<tr>
					<td width="150px" style="font-size: 14px; color: #233185;">Date Applied:</td>
					<td width="600px"><c:out value="${user.a_date}"/></td>
				</tr>
				<tr>
					<td style="font-size: 14px; color: #233185;">Applicant's Name:</td>
					<td><c:out value="${user.a_name}"/></td>
				</tr>
				<tr>
					<td style="font-size: 14px; color: #233185;">Program:</td>
					<td><c:out value="${user.a_papplied}"/></td>
				</tr>
				<tr>
					<td style="font-size: 14px; color: #233185;">Contact Number:</td>
					<td><c:out value="${user.a_mnumber}"/></td>
				</tr>
			</table>
		</c:forEach>
		<br>
		
		<form name="form" action="students?act=checklist" method="post">
		<c:forEach var="user" items="${applicant.rows}">
			<input type="hidden" name="appnumber" value ="${user.a_appnum}"/><br>
		</c:forEach>
			<c:forEach var="appcheck" items="${aclist.rows}">
			<table class="checklisttable">
				<tr>
					<th width="50px"></th>
					<th width="300px">List of Requirements</th>
					<th width="400px">Remarks</th>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_intent" class="clist" value="${appcheck.c_intent}" onclick="myFunction()"></td>
					<td>Letter of Intent</td>
					<td><textarea name="r_intent" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_intent}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_bcert" class="clist" value="${appcheck.c_bcert}" onclick="myFunction()"></td>
					<td>NSO Birth Certificate</td>
					<td><textarea name="r_bcert" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_bcert}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_appform" class="clist" value="${appcheck.c_appform}" onclick="myFunction()"></td>
					<td>ETEEAP Application Form</td>
					<td><textarea name="r_appform" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_appform}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_lsheet" class="clist" value="${appcheck.c_lsheet}" onclick="myFunction()"></td>
					<td>Student's Prior Learning Sheet</td>
					<td><textarea name="r_lsheet" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_lsheet}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_receipt" class="clist" value="${appcheck.c_receipt}" onclick="myFunction()"></td>
					<td>Official Receipt</td>
					<td><textarea name="r_receipt" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_receipt}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_tor" class="clist" value="${appcheck.c_tor}" onclick="myFunction()"></td>
					<td>Transcript of Record</td>
					<td><textarea name="r_tor" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_tor}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_dismissal" class="clist" value="${appcheck.c_dismissal}" onclick="myFunction()"></td>
					<td>Honorable Dismissal</td>
					<td><textarea name="r_dismissal" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_dismissal}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_vitae" class="clist" value="${appcheck.c_vitae}" onclick="myFunction()"></td>
					<td>Curriculum Vitae</td>
					<td><textarea name="r_vitae" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_vitae}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_trainings" class="clist" value="${appcheck.c_trainings}" onclick="myFunction()"></td>
					<td>Certificate of Trainings and Seminars</td>
					<td><textarea name="r_trainings" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_trainings}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_employment" class="clist" value="${appcheck.c_employment}" onclick="myFunction()"></td>
					<td>Certificate of Employment</td>
					<td><textarea name="r_employment" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_employment}"/></textarea></td>
				</tr>
				<tr>
					<td style="text-align: center;"><input type="checkbox" name="c_spa" class="clist" value="${appcheck.c_spa}" onclick="myFunction()"></td>
					<td>Recommendation Letters (3)</td>
					<td><textarea name="r_spa" rows="2" cols="20" placeholder="comment..." maxlength="1000"><c:out value="${appcheck.r_spa}"/></textarea></td>
				</tr>
				<tr>
					<td colspan=3 style="font-size: 12px; color: #B14744; text-align: center;"><i>All requirements should be accomplished before proceeding to the curriculum page.</i></td>
					</tr>
			</table>
			</c:forEach>
			<br>
			<span style="color:#8c2f15; font-weight:bold; font-size: 12px;">
				<%=(request.getAttribute("errMessage") == null) ? "" : request.getAttribute("errMessage")%><br>
			</span>	
					
			<br><br>
			<input type="submit" value="Update"/>
			<input type="reset" value="Revert"/>	
		</form>
	</div>
	<br>
	
	<footer id="footer"></footer>
</div>


<script>
	function myFunction() {
		var check = document.getElementsByClassName("clist");
		
		for (var i = 0; i < check.length; i++) {
			if (check[i].checked == true) {
				check[i].value = "on";
			}
			
			else {
				check[i].value = "null";
			}
		}
	}
	
	var check = document.getElementsByClassName("clist");
	
	for (var i = 0; i < check.length; i++) {
		if (check[i].value == 'on') {
			check[i].setAttribute("checked", "");
		}
	}

</script>

</body>

</html> 